
-- Question - 1] The accounts team wants to check payments made via UPI to measure digital adoption.
SELECT * FROM Payments WHERE PaymentMethod = 'UPI';
 
-- Question - 2] List all unique first names of customers for a duplicate check.
SELECT DISTINCT FirstName FROM Customers1;

-- Question - 3] Delete all rooms with Capacity = 1. 
DELETE FROM Rooms WHERE Capacity =1;
select*from rooms;

-- Question - 4] Display each customer’s name and phone number together using CONCAT. 
SELECT CONCAT(FirstName,' ',LastName,' - ',Phone) AS CustomerContact FROM Customers1;

-- Question - 5] The booking office wants to see bookings where RoomID = 10 to check utilization of a specific room. 
SELECT *FROM Bookings WHERE RoomID = 10;

-- (Rooms subquery) 
-- Question - 6] Identify rooms whose Capacity is greater than the average Capacity of all rooms. 
SELECT *FROM Rooms WHERE Capacity > (SELECT AVG(Capacity) FROM Rooms);

-- Question - 7] Create a VIEW StaffContact showing Staff FirstName, LastName, Role, and Phone.
CREATE VIEW StaffContact AS SELECT FirstName, LastName, Role, Phone FROM Staff;
SELECT *FROM Staff;

-- Question - 8] The receptionist wants to offer Suite rooms under ₹7000 to business travelers. 
SELECT * FROM Rooms WHERE RoomType = 'Suite'AND PricePerNight < 7000;

-- Question - 9] The admin wants to see email addresses sorted by LastName from the Customers 
SELECT Email FROM Customers1 ORDER BY LastName;

-- Question - 10] Show staff full names combined into one column. 
SELECT CONCAT(firstname,' ',lastname)as stafffullnames from staff;

-- Question - 11] Display all payment details in one line using CONCAT_WS.
SELECT CONCAT_WS(' - ', PaymentID, PaymentMethod, Amount) AS PaymentDetails FROM Payments; 

-- Question - 12] The hotel wants to display the 2 most expensive rooms for VIP guests. 
SELECT * FROM Rooms ORDER BY PricePerNight DESC LIMIT 2;

-- Question - 13] Show each BookingID with its CheckIn and CheckOut dates combined.
SELECT CONCAT(BookingID,' : ',CheckInDate,' to ',CheckOutDate) AS BookingPeriod FROM Bookings; 
                            
-- Question - 14] Finance wants to calculate the average Amount per PaymentMethod. 
SELECT PaymentMethod, AVG(Amount) FROM Payments GROUP BY PaymentMethod;

-- Question - 15] The analytics team wants to find the city where average CustomerID is greater than 50.
SELECT City from customers1 group by city having avg(Customerid)>50;
 
-- Question - 16] Find bookings where TotalAmount exceeds the average TotalAmount. (Bookings subquery) 
SELECT *FROM Bookings WHERE TotalAmount > (SELECT AVG(TotalAmount) FROM Bookings);

-- Question - 17] Display the last 2 added rooms from the Rooms table.
 SELECT *FROM Rooms ORDER BY RoomID DESC LIMIT 2;
 
-- Question - 18] The cashier wants a report of payments where Amount < ₹1500 for small transactions. 
SELECT *FROM Payments where Amount< 1500;

-- Question - 19] Management wants to list all customers who have made more than 5 bookings. 
SELECT CustomerID, COUNT(*) AS BookingCount FROM Bookings GROUP BY CustomerID HAVING COUNT(*) > 5;

-- Question - 20] Identify customers who live in the same city. (Customers self join)
SELECT c1.FirstName, c2.FirstName, c1.City FROM Customers1 c1 JOIN Customers1 c2 ON c1.City = c2.City AND c1.CustomerID <> c2.CustomerID;
 
-- Question - 21] Show the total revenue handled by each StaffID.
SELECT StaffID, SUM(Amount) AS TotalRevenue FROM payments  GROUP BY StaffID;
 
-- Question - 22] The manager wants to see all customers from Mumbai to check city-wise marketing campaigns. 
Select *from customers1 where city='Mumbai';

-- Question - 23] Display the 3 lowest booking amounts. 
SELECT *FROM Bookings ORDER BY TotalAmount ASC LIMIT 3;

-- Question - 24] Insert 5 new room records with type, price, and capacity into the Rooms table.
INSERT INTO Rooms(RoomType, PricePerNight, Capacity) VALUES('Suite',8000,4),
('Deluxe',5000,2),
('Standard',3000,2),
('Family',7000,5),
('Single',2000,1);
 
-- Question - 25] Show all unique CustomerIDs from bookings.
select distinct customerid from bookings; 

-- Question - 26] Create a trigger to automatically delete a payment when its corresponding 
DELIMITER //CREATE TRIGGER delete_payment_after_booking_delete AFTER DELETE ON Bookings FOR EACH ROW BEGIN DELETE FROM Payments
WHERE BookingID = OLD.BookingID;
END //
DELIMITER ;

-- Question - 27] The marketing team wants to update the FirstName of CustomerID = 30 to 'Rahul'
UPDATE Customers1 SET FirstName = 'Rahul' WHERE CustomerID = 30;
select*from customers1;

-- Question - 28] List all bookings ordered by CheckInDate.
SELECT *FROM Bookings ORDER BY CheckInDate; 

-- Question - 29] Show all rooms where capacity is greater than 2. 
select * from rooms where capacity >2;

-- Question - 30] List staff emails ordered by their roles.
 SELECT Email FROM Staff ORDER BY Role;
 
-- Question - 31] Display each customer’s full name and city using CONCAT_WS. 
SELECT CONCAT_WS(' ',FirstName,LastName) AS FullName, City FROM Customers1;

-- Question - 32] Show the first 4 customers’ full names only. 
SELECT CONCAT(FirstName,' ',LastName) AS FullName FROM Customers1 LIMIT 4;

-- Question - 33] Show each staff’s role with their full name. 
select role ,CONCAT(firstname,' ',lastname) as name from staff;

-- Question - 34] Management wants to find the average StaffID per role. 
select role ,avg(staffid) as averagrstaffid from staff group by role;

-- Question - 35] List all bookings handled by StaffID = 2.
select *from bookings where staffid=2; 

-- Question - 36] Display the first 3 staff alphabetically by their first names. 
SELECT *FROM Staff ORDER BY FirstName LIMIT 3;

-- Question - 37] The front desk manager wants to see customers where FirstName = 'Amit' AND City = 'Nagpur' for personal attention.
select * from customers1 where firstname='Amit' and city='Nagpur';
 
-- Question - 38] Show all unique payment methods in descending order. 
SELECT DISTINCT PaymentMethod FROM Payments ORDER BY PaymentMethod DESC;

-- Question - 39] Insert 5 staff members into the Staff table with their role, phone, and email. 
INSERT INTO Staff(FirstName,LastName,Role,Phone,Email)VALUES
('Rahul','Patil','Manager','9876543210','rahul@hotel.com'),
('Neha','Joshi','Receptionist','9876543211','neha@hotel.com'),
('Amit','Sharma','Chef','9876543212','amit@hotel.com'),
('Priya','Singh','Waiter','9876543213','priya@hotel.com'),
('Rohit','Kale','Security','9876543214','rohit@hotel.com');

-- Question - 40] The hotel manager wants to review bookings where CheckInDate is after '2024-01-01' to analyze recent occupancy. 
select *from bookings where checkindate='2024-01-01';

-- Question - 41] List all customers whose FirstName is 'Rahul' for a loyalty program.
select *from customers1 where firstname='Rahul'; 

-- Question - 42] Show all unique room types offered by the hotel.
select distinct roomtype from rooms;
 
-- Question - 43] Identify customers who spent more than 50,000 in total.
SELECT CustomerID, SUM(TotalAmount) FROM Bookings GROUP BY CustomerID HAVING SUM(TotalAmount) > 50000; 

-- Question - 44] Delete all customers from the city 'TestCity'. 
DELETE FROM Customers1 WHERE City='TestCity';

-- Question - 45] Find rooms that have the same PricePerNight. (Rooms self join) 
SELECT r1.RoomID, r2.RoomID, r1.PricePerNight FROM Rooms r1 JOIN Rooms r2 ON r1.PricePerNight = r2.PricePerNight AND r1.RoomID <> r2.RoomID;

-- Question - 46] The manager wants to see staff whose Email ends with '@tcs.in' for corporate tie
SELECT * FROM Staff WHERE Email LIKE '%@tcs.in';
-- Question - 47] The analytics team wants to list all cities where maximum CustomerID is more than 100. 
SELECT City FROM Customers1 GROUP BY City HAVING MAX(CustomerID) > 100;

-- Question - 48] Show all unique capacities in descending order. 
SELECT DISTINCT Capacity FROM Rooms ORDER BY Capacity DESC;

-- Question - 49] List staff working as Managers. 
SELECT * FROM Staff WHERE Role='Manager';
                              
-- Question - 50] Display each payment’s ID, Method, Amount in one line. 
SELECT CONCAT(PaymentID,' - ',PaymentMethod,' - ',Amount) FROM Payments;

-- Question - 51] Show the first 4 payments only.
SELECT *FROM Payments LIMIT 4;

-- Question - 52] The hotel manager wants to review rooms where PricePerNight is between ₹2000 and ₹4000 to offer discounts.
SELECT * FROM Rooms WHERE PricePerNight BETWEEN 2000 AND 4000;
 
-- Question - 53] List all bookings ordered by CheckInDate.
 SELECT *FROM Bookings ORDER BY CheckInDate;
 
-- Question - 54] Display all unique CustomerIDs from bookings.
 select distinct customerid from bookings;
 
-- Question - 55] The hotel manager wants to add new customer details. Insert 5 records with full details into the Customers table.
INSERT INTO Customers1(FirstName,LastName,Email,Phone,City)
VALUES
('Amit','Patil','amit@gmail.com','9876500001','Pune'),
('Riya','Shah','riya@gmail.com','9876500002','Mumbai'),
('Karan','Mehta','karan@gmail.com','9876500003','Delhi'),
('Sneha','Joshi','sneha@gmail.com','9876500004','Nagpur'),
('Vikas','Gupta','vikas@gmail.com','9876500005','Chennai'); 

-- Question - 56] Show the last 2 staff hired. 
SELECT * FROM Staff ORDER BY StaffID DESC LIMIT 2;

-- Question - 57] Identify rooms with PricePerNight higher than the maximum PricePerNight of rooms with Capacity = 2. (Rooms subquery) 
SELECT *
FROM Rooms
WHERE PricePerNight >
(
SELECT MAX(PricePerNight)
FROM Rooms
WHERE Capacity=2
);
-- Question - 58] The HR team wants to see staff whose Role is not 'Chef' for role reallocation.
SELECT * FROM Staff WHERE Role!='Chef'; 

-- Question - 59] Show all unique cities in descending order from the Customers table.
 SELECT DISTINCT City FROM Customers1 ORDER BY City DESC;
 
-- Question - 60] Display the phone number of the Waiter only.
SELECT Phone FROM Staff WHERE Role='Waiter'; 

-- Question - 61] Display the last 2 bookings in the table.
SELECT *FROM Bookings ORDER BY BookingID DESC LIMIT 2;

-- Question - 62] The marketing team wants to see customers living in Delhi or Chennai for targeted promotions.
SELECT *FROM Customers1 where City in ('Delhi','Chennai'); 

-- Question - 63] Show all rooms where RoomType != 'Family' to plan renovations.
SELECT *FROM rooms where roomtype!='Family';
 
-- Question - 64] List staff emails ordered by their roles.
SELECT Email FROM Staff ORDER BY Role;

-- Question - 65] Display all unique payment methods.
SELECT DISTINCT Paymentmethod from payments;
 
-- Question - 66] The receptionist wants a list of customers whose Phone starts with '98' for mobile offers.
SELECT *FROM customers1 where phone like'98%'; 

-- Question - 67] Show the 3 cheapest rooms available for budget travelers. 
SELECT *FROM Rooms ORDER BY PricePerNight ASC LIMIT 3;
                             
-- Question - 68] Display the last 2 payments.
SELECT *FROM payments order by paymentid DESC LIMIT 2; 

-- Question - 69] Management wants to know which unique cities customers come from. 
SELECT DISTINCT City from customers1;

-- Question - 70] List all bookings where TotalAmount > 5000.
SELECT *FROM bookings where TotalAmount >5000;
 
-- Question - 71] Display each staff’s Role with their Email in one column.
SELECT CONCAT(Role,' - ',Email) FROM Staff; 

-- Question - 72] Show the first 4 staff full names.
SELECT CONCAT(FirstName,' ',LastName) FROM Staff LIMIT 4;

-- Question - 73] Find bookings where TotalAmount is greater than all bookings made by CustomerID = 10. (Bookings subquery) 
SELECT *FROM Bookings WHERE TotalAmount > ALL( SELECT TotalAmount FROM Bookings WHERE CustomerID=10);

-- Question - 74] List rooms with capacity >= 3 for family bookings.
SELECT *FROM Rooms WHERE Capacity >= 3;

-- Question - 75] Display the RoomType and Price of only Suite rooms.
SELECT RoomType, PricePerNight FROM Rooms WHERE RoomType='Suite'; 

-- Question - 76] The cashier wants to see payments with Amount between ₹2000 and ₹7000 for mid-range billing checks. 
SELECT * FROM payments where amount between 2000 and 7000;

-- Question - 77] Insert 5 booking records into the Bookings table with all details. 
INSERT INTO Bookings(CustomerID, RoomID, StaffID, CheckInDate, CheckOutDate, TotalAmount)VALUES
(1,10,2,'2024-01-10','2024-01-15',8000),
(2,15,3,'2024-02-01','2024-02-05',6000),
(3,20,4,'2024-03-12','2024-03-15',7000),
(4,12,2,'2024-04-01','2024-04-03',5000),
(5,18,1,'2024-05-10','2024-05-12',4500);

-- Question - 78] Display the 3 lowest payments made by customers.
SELECT *FROM Payments order by Amount asc limit 3;

-- Question - 79] Show each booking’s BookingID with TotalAmount using CONCAT. 
SELECT CONCAT(Bookingid,'-',Totalamount) from bookings;
 
-- Question - 80] Show all unique RoomIDs in descending order.
SELECT DISTINCT RoomID FROM Rooms ORDER BY RoomID DESC;

-- Question - 81] Display each room’s RoomType and Price using CONCAT_WS. 
SELECT CONCAT_WS(' - ',RoomType,Pricepernight) from rooms;

-- Question - 82] The admin wants to delete all bookings handled by StaffID = 3.
DELETE FROM Bookings WHERE StaffID = 3;

-- Question - 83] Show customers whose FirstName length > 5 characters for a name-pattern study.
SELECT *FROM Customers1 WHERE LENGTH(FirstName) > 5; 

-- Question - 84] Show all unique roles available in the hotel. 
select distinct role from staff;

-- Question - 85] List all rooms where capacity is greater than 2.
select *from rooms where capacity>2;
 
-- Question - 86] Display each payment’s ID with Amount using CONCAT. 
select CONCAT(paymentid,'-',amount) from payments;

-- Question - 87] List all Card payments from the Payments table.
SELECT *FROM payments where paymentmethod = 'card' ;

SET SQL_SAFE_UPDATES=0;

-- Question - 88] Delete all customers whose Email ends with '@test.com' as invalid. 
DELETE FROM Customers1 WHERE Email LIKE '%@test.com';

-- Question - 89] The hotel manager wants to review bookings where CheckOutDate before '2023-12-31' to measure old occupancy. 
SELECT *FROM Bookings WHERE CheckOutDate < '2023-12-31';

-- Question - 90] The front office manager needs to list rooms with capacity = 2 for couples.
SELECT *FROM Rooms WHERE Capacity = 2;
 
-- Question - 91] Show all unique capacities in descending order.
SELECT DISTINCT Capacity from rooms order by capacity desc ;
 
-- Question - 92] The operations team wants to find the minimum TotalAmount in bookings.
SELECT MIN(totalamount) from bookings;
 
-- Question - 93] Display all rooms by capacity in ascending order. 
SELECT *FROM Rooms order by capacity asc;

-- Question - 94] Show each booking’s BookingID with TotalAmount using CONCAT. 
SELECT CONCAT(Bookingid,'-',Totalamount) from bookings;

-- Question - 95] The operations head wants to see rooms with Capacity = 4 AND PricePerNight > ₹6000 for premium family packages. 
SELECT *FROM Rooms where Capacity = 4 AND PricePerNight > 6000;

-- Question - 96] Show staff full names combined into one column.
SELECT CONCAT(firstname,' ',lastname)  as fullname from staff; 

-- Question - 97] The accounts team wants to see bookings where the TotalAmount is greater than ₹10,000 to track high-value customers.
SELECT *FROM Bookings where TotalAmount > 10000 ;

-- Question - 98] Show all unique payment methods in descending order.
SELECT DISTINCT PAYMENTMETHOD FROM payments order by paymentmethod desc;
 
 -- Question - 99] List staff members who share the same Role. (Staff self join)
 SELECT s1.FirstName, s2.FirstName, s1.Role FROM Staff s1 JOIN Staff s2 ON s1.Role = s2.Role AND s1.StaffID <> s2.StaffID;
 
 -- Question - 100] Show customer first name, last name, and TotalAmount of their bookings using JOIN between Customers and Bookings. 
 SELECT c.firstname,c.lastname,b.totalamount from  customers1 c join bookings b on c.customerid=b.customerid;
 
-- Question - 101] Display the first 4 bookings only.
SELECT *from Bookings limit 4;
 
-- Question - 102] Show all unique staff first names. 
SELECT DISTINCT firstname from staff;

-- Question - 103] Insert 5 new room records with type, price, and capacity into the Rooms table.
INSERT INTO Rooms(RoomType,PricePerNight,Capacity)VALUES
('Suite',9000,4),
('Deluxe',5500,3),
('Standard',3500,2),
('Family',7500,5),
('Single',2500,1);
 
-- Question - 104] Display each customer’s full name and city using CONCAT_WS.
SELECT CONCAT_WS(' ',Firstname,lastname,city ) as name,city from customers1; 

-- Question - 105] Show all unique cities in descending order from the Customers table. 
SELECT DISTINCT city from customers1 order by city desc;

-- Question - 106] The analytics team wants to list all cities where maximum CustomerID is more than 100.
SELECT City FROM Customers1 GROUP BY City HAVING MAX(CustomerID) > 100;
 
-- Question - 107] The HR team wants to see staff whose FirstName is 'Priya' for employee recognition. 
SELECT *FROM Staff WHERE FirstName='Priya';

-- Question - 108] Display the last 2 staff members from the Staff table.
SELECT *FROM Staff ORDER BY StaffID DESC LIMIT 2; 

-- Question - 109] Create a VIEW BookingSummary showing BookingID, CustomerID, RoomID, and TotalAmount.
CREATE VIEW BookingSummary AS SELECT BookingID, CustomerID, RoomID, TotalAmount FROM Bookings; 
select*from bookings;
select*from bookingsummary;

-- Question - 110] Show all unique RoomIDs in descending order. 
SELECT DISTINCT ROOMID from rooms order by roomid desc;

-- Question - 111] Display each staff’s role with their full name.
SELECT Role, CONCAT(firstname,' ',lastname)  as fullname from staff; 

-- Question - 112] The receptionist wants to offer Suite rooms under ₹7000 to business travelers. 
SELECT * FROM Rooms WHERE RoomType='Suite' AND PricePerNight < 7000;

-- Question - 113] Display the first 3 staff alphabetically by their first names. 
SELECT *FROM Staff ORDER BY FirstName LIMIT 3;

-- Question - 114] List all bookings ordered by CheckInDate.
SELECT *FROM bookings order by checkindate;
 
-- Question - 115] Show all unique StaffIDs from the bookings. 
SELECT DISTINCT Staffid from bookings;

-- Question - 116] Display the first 4 customers’ full names only. 
SELECT CONCAT(FIRSTNAME,' ',lastname) as fullname from customers1 limit 4;

-- Question - 117] Show all unique room types offered by the hotel. 
SELECT DISTINCT roomtype from rooms;

-- Question - 118] Display the phone number of the Waiter only. 
SELECT Phone FROM Staff WHERE Role='Waiter';

-- Question - 119] Show all bookings where TotalAmount > 5000.
SELECT *FROM bookings where totalamount >5000;
 
-- Question - 120] The HR team wants to update Role = 'Senior Manager' where StaffID = 12. 
UPDATE Staff SET Role='Senior Manager' WHERE StaffID = 12;

-- Question - 121] List all staff working as Managers.
SELECT *FROM Staff WHERE Role='Manager';
 
-- Question - 122] Show the last 2 registered customers for follow-up.
SELECT *FROM Customers1 ORDER BY CustomerID DESC LIMIT 2; 

-- Question - 123] Display each booking’s BookingID with TotalAmount using CONCAT. 
SELECT CONCAT(Bookingid,'-',totalamount)from bookings;

-- Question - 124] Insert 5 staff members into the Staff table with their role, phone, and email. 
INSERT INTO Staff(FirstName,LastName,Role,Phone,Email)VALUES
('Ankit','Verma','Manager','9876501111','ankit@hotel.com'),
('Pooja','Sharma','Receptionist','9876502222','pooja@hotel.com'),
('Raj','Patel','Chef','9876503333','raj@hotel.com'),
('Kiran','Naik','Waiter','9876504444','kiran@hotel.com'),
('Deepak','Joshi','Security','9876505555','deepak@hotel.com');

-- Question - 125] Display the RoomType and Price of only Suite rooms. 
SELECT RoomType, PricePerNight FROM Rooms WHERE RoomType='Suite';

-- Question - 126] The admin wants to delete all payments linked to BookingID = 15.
DELETE FROM PAYMENTS WHERE BOOKINGID=15; 
SELECT *FROM BOOKINGS;

-- Question - 127] Display all unique capacities in descending order.
SELECT DISTINCT CAPACITY FROM ROOMS ORDER BY CAPACITY DESC;
 
-- Question - 128] Show the first 4 rooms sorted alphabetically by RoomType.
SELECT *FROM Rooms ORDER BY RoomType LIMIT 4;

-- Question - 129] The cashier wants a report of payments where Amount < ₹1500 for small transactions. 
SELECT *FROM Payments WHERE Amount < 1500;

-- Question - 130] Show each booking’s BookingID with TotalAmount using CONCAT.
SELECT CONCAT(BookingID,' - ',TotalAmount)FROM Bookings; 

-- Question - 131] Display the last 2 added rooms from the Rooms table. 
SELECT *FROM Rooms ORDER BY RoomID DESC LIMIT 2;

-- Question - 132] List all customers whose FirstName = 'Amit' AND City = 'Nagpur' for personal attention. 
SELECT *FROM Customers1 WHERE FirstName='Amit' AND City='Nagpur';

-- Question - 133] Insert 5 new customer details into the Customers table. 
INSERT INTO Customers1(FirstName,LastName,Email,Phone,City)VALUES
('Raj','Sharma','raj@gmail.com','9876500001','Delhi'),
('Anita','Patil','anita@gmail.com','9876500002','Pune'),
('Rohit','Gupta','rohit@gmail.com','9876500003','Mumbai'),
('Meena','Joshi','meena@gmail.com','9876500004','Nagpur'),
('Karan','Verma','karan@gmail.com','9876500005','Chennai');

-- Question - 134] Show staff full names combined into one column. 
SELECT CONCAT(firstname,' ',lastname) as fullname from staff;

-- Question - 135] Show all room details separated by commas using CONCAT_WS. Question.
SELECT CONCAT_WS(',', RoomID, RoomType, PricePerNight, Capacity) AS RoomDetails FROM Rooms; 

-- Question - 136] Display each customer’s name and phone number together using CONCAT.
SELECT CONCAT(firstname,' ',lastname) as fullname,phone from customers1; 

-- Question - 137] Display all payment details in one line using CONCAT_WS.
SELECT CONCAT_WS('-',paymentid,bookingid,paymentdate,paymentmethod,amount)as paymentdetails from payments;

-- Question - 138] Show the last 2 bookings in the table.
SELECT * FROM Bookings ORDER BY BookingID DESC LIMIT 2;
 
-- Question - 139] List all payments ordered by PaymentDate.
SELECT * FROM Payments ORDER BY PaymentDate; 

-- Question - 140] Show the 2 highest payments received.
SELECT *FROM Payments ORDER BY Amount DESC LIMIT 2;
 
-- Question - 141] The marketing team wants to check customers whose FirstName is 'Rahul' for a loyalty program. 
SELECT *FROM Customers1 WHERE FirstName = 'Rahul';

-- Question - 142] Display each PaymentID with its method using CONCAT. 
SELECT CONCAT(PaymentID,' - ',PaymentMethod) AS PaymentDetails FROM Payments;

-- Question - 143] The operations team wants to list all PaymentMethods used more than 5 times. 
SELECT PaymentMethod, COUNT(*) AS TotalUsage FROM Payments GROUP BY PaymentMethod HAVING COUNT(*) > 5;

-- Question - 144] Show the 2 most expensive rooms for VIP guests. 
SELECT *FROM Rooms ORDER BY PricePerNight DESC LIMIT 2;

-- Question - 145] Show each room’s RoomType and Price using CONCAT_WS. 
SELECT CONCAT_WS('-',RoomType,Pricepernight) from rooms;

-- Question - 146] Display the first 3 staff alphabetically by their first names. 
SELECT *FROM Staff ORDER BY FirstName LIMIT 3;

-- Question - 147] List all bookings handled by StaffID = 2. 
SELECT *FROM Bookings WHERE StaffID = 2;

-- Question - 148] The analytics team wants to find the city where average CustomerID is greater than 50.
SELECT City, AVG(CustomerID) AS AvgID FROM Customers1 GROUP BY City HAVING AVG(CustomerID) > 50;
 
-- Question - 149] The hotel wants to display the 2 most expensive rooms for VIP guests. 
SELECT *FROM Rooms ORDER BY PricePerNight DESC LIMIT 2;

-- Question - 150] Show all unique first names of customers for a duplicate check.
SELECT DISTINCT FirstName FROM Customers1; 

-- Question - 151] Show all unique roles in descending order. 
SELECT DISTINCT role from staff order by role desc;

-- Question - 152] Identify rooms whose Capacity is greater than the average Capacity of all rooms. (Rooms subquery)
SELECT *FROM Rooms WHERE Capacity >(SELECT AVG(Capacity) FROM Rooms);
 
-- Question - 153] Display all rooms by capacity in ascending order.
SELECT *from rooms order by capacity asc ;
 
-- Question - 154] Display the first 4 payments only.
SELECT *FROM Payments LIMIT 4;
 
-- Question - 155] Show each payment’s ID, Method, Amount in one line.
SELECT CONCAT(PaymentID,' - ',PaymentMethod,' - ',Amount) AS PaymentDetails FROM Payments; 

-- Question - 156] List all bookings where TotalAmount > 5000. 
SELECT *FROM Bookings WHERE TotalAmount > 5000;

-- Question - 157] Find all customers whose CustomerID is greater than the average CustomerID. (Customers subquery) 
SELECT *FROM Customers1 WHERE CustomerID >(SELECT AVG(CustomerID) FROM Customers1);

-- Question - 158] The HR manager wants to see staff whose Role is not 'Chef' for role reallocation.
SELECT *FROM Staff where role !='chef';
 
-- Question - 159] The accounts team wants to check bookings where TotalAmount is greater than ₹10,000. 
SELECT *FROM Bookings WHERE TotalAmount > 10000;

-- Question - 160] Display each staff’s role with their full name.
SELECT CONCAT(FirstName,' ',LastName) AS FullName, Role FROM Staff; 

-- Question - 161] List staff members who share the same Role. (Staff self join) 
SELECT A.FirstName, B.FirstName, A.Role FROM Staff A JOIN Staff B ON A.Role = B.Role AND A.StaffID <> B.StaffID;

-- Question - 162] Show Customer Name and Payment Amount by joining Customers, Bookings, and Payments. 
SELECT C.FirstName, P.Amount FROM Customers1 C JOIN Bookings B ON C.CustomerID = B.CustomerID JOIN Payments P ON B.BookingID = P.BookingID;

-- Question - 163] Display all bookings where TotalAmount > 5000. 
SELECT *FROM Bookings WHERE TotalAmount > 5000;

-- Question - 164] The front desk wants to see customers whose Phone starts with '98'.
SELECT * FROM Customers1 WHERE Phone LIKE '98%';
 
-- Question - 165] Identify customers who live in the same city. (Customers self join)
SELECT A.FirstName, B.FirstName, A.City FROM Customers1 A JOIN Customers1 B ON A.City = B.City AND A.CustomerID <> B.CustomerID;

-- Question - 166] The operations manager wants to check bookings with CheckOutDate before '2023-12-31'.
SELECT *FROM Bookings WHERE CheckOutDate < '2023-12-31'; 

-- Question - 167] Display all unique StaffIDs from the bookings.
SELECT DISTINCT STAFFID from bookings;
 
-- Question - 168] Create a VIEW OnlinePayments showing all payments made by PaymentMethod = 'Online'. 
CREATE VIEW OnlinePayments AS SELECT * FROM Payments WHERE PaymentMethod = 'Online';

-- Question - 169] Display all unique payment methods in descending order.
SELECT *FROM payments order by paymentmethod desc;
 
-- Question - 170] Display each payment’s ID with Amount using CONCAT.
SELECT CONCAT(PaymentID,' - ',Amount) AS PaymentInfo FROM Payments; 

-- Question - 171] Show all unique RoomIDs in descending order.
SELECT *FROM ROOMS order by roomid desc; 

-- Question - 172] The analytics team wants to list all cities where maximum CustomerID is more than 100. 
SELECT City, MAX(CustomerID)FROM Customers1 GROUP BY City HAVING MAX(CustomerID) > 100;

-- Question - 173] List staff emails ordered by their roles.
SELECT Email FROM Staff ORDER BY Role; 

-- Question - 174] Find bookings where TotalAmount exceeds the average TotalAmount. (Bookings subquery) 
SELECT *FROM Bookings WHERE TotalAmount >(SELECT AVG(TotalAmount) FROM Bookings);

-- Question - 175] Show all rooms where PricePerNight > ₹5000 for premium customer recommendations.
SELECT *FROM Rooms WHERE PricePerNight > 5000;

 -- Question - 176] Show all unique capacities in descending order.
 SELECT DISTINCT capacity from Rooms order by capacity desc;
 
 
-- Question - 177] Display the first 4 rooms sorted alphabetically by RoomType.
SELECT *FROM Rooms ORDER BY RoomType LIMIT 4;
 
-- Question - 178] Show all unique staff first names. 
SELECT DISTINCT FirstName FROM Staff;

-- Question - 179] Identify rooms with PricePerNight higher than the maximum PricePerNight of rooms with Capacity = 2. (Rooms subquery)
SELECT *FROM Rooms WHERE PricePerNight > (SELECT MAX(PricePerNight) FROM Rooms WHERE Capacity = 2); 

-- Question - 180] Show all unique cities in descending order from the Customers table. 
SELECT DISTINCT City FROM Customers1 ORDER BY City DESC;
                          
-- Question - 181] List all bookings where TotalAmount > 5000.
SELECT *FROM Bookings WHERE TotalAmount > 5000;
 
-- Question - 182] Show PaymentID, Customer Name, and BookingID for payments made using 'Credit Card'.
SELECT P.PaymentID, C.FirstName, B.BookingID FROM Payments P JOIN Bookings B ON P.BookingID = B.BookingID 
JOIN Customers1 C ON B.CustomerID = C.CustomerID WHERE P.PaymentMethod = 'Credit Card';

-- Question - 183] Display each booking’s BookingID with TotalAmount using CONCAT. 
SELECT CONCAT(BookingID,' - ',TotalAmount) AS BookingInfo FROM Bookings;

-- Question - 184] Show all bookings handled by StaffID = 2.
SELECT *FROM Bookings WHERE StaffID = 2;
 
-- Question - 185] Display the last 2 added rooms from the Rooms table. 
SELECT *FROM Rooms ORDER BY RoomID DESC LIMIT 2;

-- Question - 186] List all rooms where capacity is greater than 2.
SELECT *FROM Rooms WHERE Capacity > 2; 

-- Question - 187] Display the last 2 staff members from the Staff table.
SELECT *FROM Staff ORDER BY StaffID DESC LIMIT 2;
 
-- Question - 188] Show all unique roles available in the hotel.
SELECT DISTINCT Role FROM Staff; 

-- Question - 189] Display the last 2 payments.
SELECT *FROM Payments ORDER BY PaymentID DESC LIMIT 2;
 
-- Question - 190] The manager wants to see bookings where CustomerID IN (2,4,6,8) to track repeat guests.
SELECT *FROM Bookings WHERE CustomerID IN (2,4,6,8);
 
-- Question - 191] Show all unique first names of customers for a duplicate check.
SELECT DISTINCT FirstName FROM Customers1;
 
-- Question - 192] Display all bookings where TotalAmount > 5000.
SELECT *FROM Bookings WHERE TotalAmount > 5000; 

-- Question - 193] The admin wants to delete all payments where Amount < 1000.
DELETE FROM Payments WHERE Amount < 1000; 

-- Question - 194] Display all unique RoomIDs in descending order. 
SELECT DISTINCT RoomID FROM Rooms ORDER BY RoomID DESC;

-- Question - 195] List customers who made more than 5 bookings.
SELECT CustomerID, COUNT(*) AS TotalBookings FROM Bookings GROUP BY CustomerID HAVING COUNT(*) > 5; 

-- Question - 196] Display all rooms by capacity in ascending order.
SELECT *FROM Rooms ORDER BY Capacity ASC;
 
-- Question - 197] Show each booking’s BookingID with TotalAmount using CONCAT.
SELECT CONCAT(BookingID,' - ',TotalAmount)FROM Bookings;
 
-- Question - 198] List all staff working as Managers.
SELECT *FROM Staff WHERE Role = 'Manager';
 
-- Question - 199] Show customers whose FirstName length > 5 characters for a name-pattern study.
SELECT *FROM Customers1 WHERE LENGTH(FirstName) > 5;
 
-- Question - 200] Display all unique capacities in descending order.
SELECT DISTINCT Capacity FROM Rooms ORDER BY Capacity DESC; 

                           
-- Question - 201] List staff members who share the same Role. (Staff self join)
SELECT A.FirstName, B.FirstName, A.Role FROM Staff A JOIN Staff B ON A.Role = B.Role AND A.StaffID <> B.StaffID;
 
-- Question - 202] Show PaymentID, Customer Name, and BookingID for payments made using 'Credit Card'.
SELECT P.PaymentID, C.FirstName, B.BookingID FROM Payments P JOIN Bookings B ON P.BookingID = B.BookingID
JOIN Customers1 C ON B.CustomerID = C.CustomerID
WHERE P.PaymentMethod = 'Credit Card';
 
-- Question - 203] Display the first 4 payments only.
SELECT *FROM Payments LIMIT 4;
 
-- Question - 204] Show each payment’s ID, Method, Amount in one line.
SELECT CONCAT(PaymentID,' - ',PaymentMethod,' - ',Amount) FROM Payments; 

-- Question - 205] Create a VIEW HighValueBookings showing all bookings with TotalAmount > 20,000.
CREATE VIEW HighValueBookings AS SELECT * FROM Bookings WHERE TotalAmount > 20000;

-- Question - 206] Create a trigger to automatically delete a payment when its corresponding booking is deleted.
CREATE TRIGGER DeletePaymentAfterBooking AFTER DELETE ON Bookings FOR EACH ROW DELETE FROM Payments WHERE BookingID = OLD.BookingID;
 
-- Question - 207] Create a trigger to prevent insertion of a booking where CheckOutDate < CheckInDate.
CREATE TRIGGER CheckBookingDates
BEFORE INSERT ON Bookings
FOR EACH ROW
BEGIN
IF NEW.CheckOutDate < NEW.CheckInDate THEN
SIGNAL SQLSTATE '45000'
SET MESSAGE_TEXT = 'CheckOutDate cannot be before CheckInDate';
END IF;
END;

-- Question - 208] Create a trigger to automatically update TotalAmount in Bookings when a payment is inserted in Payments. 
CREATE TRIGGER UpdateBookingAmount
AFTER INSERT ON Payments
FOR EACH ROW
UPDATE Bookings
SET TotalAmount = TotalAmount + NEW.Amount
WHERE BookingID = NEW.BookingID;
                         