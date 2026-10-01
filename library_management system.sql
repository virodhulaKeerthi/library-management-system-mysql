-- ============================================================
-- 📚 LIBRARY MANAGEMENT SYSTEM – MYSQL MINI PROJECT 🗄️
-- ============================================================

-- 💻 Technology Used: MySQL
-- 📂 Project Type: Database Management System
-- 🗃️ Database: MySQL

-- ========================================
-- 1. DATABASE CREATION
-- ========================================
 
CREATE DATABASE library_management;
Query OK, 1 row affected (0.177 sec)

 use  library_management;
Database changed
 SELECT DATABASE();
+--------------------+
| DATABASE()         |
+--------------------+
| library_management |
+--------------------+
1 row in set (0.004 sec)
-- ========================================
-- 2. TABLE CREATION
-- ========================================
 CREATE TABLE books (
    ->     book_id INT PRIMARY KEY,
    ->     book_name VARCHAR(100),
    ->     author VARCHAR(100),
    ->     category VARCHAR(50),
    ->     price DECIMAL(10,2),
    ->     quantity INT
    -> );
Query OK, 0 rows affected (0.247 sec)

 desc books;
+-----------+---------------+------+-----+---------+-------+
| Field     | Type          | Null | Key | Default | Extra |
+-----------+---------------+------+-----+---------+-------+
| book_id   | int           | NO   | PRI | NULL    |       |
| book_name | varchar(100)  | YES  |     | NULL    |       |
| author    | varchar(100)  | YES  |     | NULL    |       |
| category  | varchar(50)   | YES  |     | NULL    |       |
| price     | decimal(10,2) | YES  |     | NULL    |       |
| quantity  | int           | YES  |     | NULL    |       |
+-----------+---------------+------+-----+---------+-------+
6 rows in set (0.024 sec)

 CREATE TABLE students (
    ->     student_id INT PRIMARY KEY,
    ->     student_name VARCHAR(100),
    ->     email VARCHAR(100),
    ->     phone VARCHAR(15),
    ->     city VARCHAR(50)
    -> );
Query OK, 0 rows affected (0.253 sec)

desc students;
+--------------+--------------+------+-----+---------+-------+
| Field        | Type         | Null | Key | Default | Extra |
+--------------+--------------+------+-----+---------+-------+
| student_id   | int          | NO   | PRI | NULL    |       |
| student_name | varchar(100) | YES  |     | NULL    |       |
| email        | varchar(100) | YES  |     | NULL    |       |
| phone        | varchar(15)  | YES  |     | NULL    |       |
| city         | varchar(50)  | YES  |     | NULL    |       |
+--------------+--------------+------+-----+---------+-------+
5 rows in set (0.015 sec)

 CREATE TABLE issued_books (
    ->     issue_id INT PRIMARY KEY,
    ->     book_id INT,
    ->     student_id INT,
    ->     issue_date DATE,
    ->     return_date DATE
    -> );
Query OK, 0 rows affected (0.290 sec)

 desc issued_books;
+---------+------+------+-----+---------+-------+
| Field       | Type | Null | Key | Default | Extra |
+-------------+------+------+-----+---------+-------+
| issue_id    | int  | NO   | PRI | NULL    |       |
| book_id     | int  | YES  |     | NULL    |       |
| student_id  | int  | YES  |     | NULL    |       |
| issue_date  | date | YES  |     | NULL    |       |
| return_date | date | YES  |     | NULL    |       |
+-------------+------+------+-----+---------+-------+
5 rows in set (0.017 sec)

 SHOW TABLES;
+------------------------------+
| Tables_in_library_management |
+------------------------------+
| books                        |
| issued_books                 |
| students                     |
+------------------------------+
3 rows in set (0.012 sec)
-- ========================================
-- 3. INSERT DATA
-- ========================================
 INSERT INTO books (book_id, book_name, author, category, price, quantity)
    -> VALUES
    -> (1, 'Python Programming', 'Mark Lutz', 'Programming', 650, 5),
    -> (2, 'SQL Fundamentals', 'John Smith', 'Programming', 550, 4),
    -> (3, 'Data Science Basics', 'David Miller', 'Data Science', 750, 3),
    -> (4, 'Java Programming', 'Herbert Schildt', 'Programming', 600, 6),
    -> (5, 'Database Management', 'Raghu Ramakrishnan', 'Database', 850, 2),
    -> (6, 'Machine Learning', 'Tom Mitchell', 'Data Science', 900, 4),
    -> (7, 'Web Development', 'Jon Duckett', 'Web Development', 500, 5),
    -> (8, 'C Programming', 'Dennis Ritchie', 'Programming', 450, 7),
    -> (9, 'Excel for Beginners', 'Mike Johnson', 'Computer', 350, 8),
    -> (10, 'Python Projects', 'Eric Matthes', 'Programming', 700, 3);
Query OK, 10 rows affected (0.032 sec)
Records: 10  Duplicates: 0  Warnings: 0

SELECT * FROM books;
+---------+---------------------+--------------------+-----------------+--------+----------+
| book_id | book_name           | author             | category        | price  | quantity |
+---------+---------------------+--------------------+-----------------+--------+----------+
|       1 | Python Programming  | Mark Lutz          | Programming     | 650.00 |        5 |
|       2 | SQL Fundamentals    | John Smith         | Programming     | 550.00 |        4 |
|       3 | Data Science Basics | David Miller       | Data Science    | 750.00 |        3 |
|       4 | Java Programming    | Herbert Schildt    | Programming     | 600.00 |        6 |
|       5 | Database Management | Raghu Ramakrishnan | Database        | 850.00 |        2 |
|       6 | Machine Learning    | Tom Mitchell       | Data Science    | 900.00 |        4 |
|       7 | Web Development     | Jon Duckett        | Web Development | 500.00 |        5 |
|       8 | C Programming       | Dennis Ritchie     | Programming     | 450.00 |        7 |
|       9 | Excel for Beginners | Mike Johnson       | Computer        | 350.00 |        8 |
|      10 | Python Projects     | Eric Matthes       | Programming     | 700.00 |        3 |
+---------+---------------------+--------------------+-----------------+--------+----------+
10 rows in set (0.005 sec)

 SELECT COUNT(*) FROM books;
+----------+
| COUNT(*) |
+----------+
|       10 |
+----------+
1 row in set (0.017 sec)

 INSERT INTO students (student_id, student_name, email, phone, city)
    -> VALUES
    -> (1, 'Keerthi', 'keerthi@gmail.com', '9876543210', 'Visakhapatnam'),
    -> (2, 'Mani', 'mani@gmail.com', '9876543211', 'Hyderabad'),
    -> (3, 'Srinu', 'srinu@gmail.com', '9876543212', 'Vijayawada'),
    -> (4, 'Sweetha', 'sweetha@gmail.com', '9876543213', 'Visakhapatnam'),
    -> (5, 'Ravi', 'ravi@gmail.com', '9876543214', 'Hyderabad'),
    -> (6, 'Priya', 'priya@gmail.com', '9876543215', 'Chennai'),
    -> (7, 'Kiran', 'kiran@gmail.com', '9876543216', 'Bangalore'),
    -> (8, 'Anil', 'anil@gmail.com', '9876543217', 'Visakhapatnam'),
    -> (9, 'Divya', 'divya@gmail.com', '9876543218', 'Vijayawada'),
    -> (10, 'Suresh', 'suresh@gmail.com', '9876543219', 'Hyderabad');
Query OK, 10 rows affected (0.109 sec)
Records: 10  Duplicates: 0  Warnings: 0

 SELECT * FROM students;
+------------+--------------+-------------------+------------+---------------+
| student_id | student_name | email             | phone      | city          |
+------------+--------------+-------------------+------------+---------------+
|          1 | Keerthi      | keerthi@gmail.com | 9876543210 | Visakhapatnam |
|          2 | Mani         | mani@gmail.com    | 9876543211 | Hyderabad     |
|          3 | Srinu        | srinu@gmail.com   | 9876543212 | Vijayawada    |
|          4 | Sweetha      | sweetha@gmail.com | 9876543213 | Visakhapatnam |
|          5 | Ravi         | ravi@gmail.com    | 9876543214 | Hyderabad     |
|          6 | Priya        | priya@gmail.com   | 9876543215 | Chennai       |
|          7 | Kiran        | kiran@gmail.com   | 9876543216 | Bangalore     |
|          8 | Anil         | anil@gmail.com    | 9876543217 | Visakhapatnam |
|          9 | Divya        | divya@gmail.com   | 9876543218 | Vijayawada    |
|         10 | Suresh       | suresh@gmail.com  | 9876543219 | Hyderabad     |
+------------+--------------+-------------------+------------+---------------+
10 rows in set (0.005 sec)

INSERT INTO issued_books (issue_id, book_id, student_id, issue_date, return_date)
    -> VALUES
    -> (1, 1, 1, '2026-09-01', '2026-09-15'),
    -> (2, 2, 2, '2026-09-02', '2026-09-16'),
    -> (3, 3, 3, '2026-09-03', NULL),
    -> (4, 4, 4, '2026-09-04', '2026-09-18'),
    -> (5, 5, 5, '2026-09-05', NULL),
    -> (6, 6, 6, '2026-09-06', '2026-09-17'),
    -> (7, 7, 7, '2026-09-07', NULL),
    -> (8, 8, 8, '2026-09-08', '2026-09-19'),
    -> (9, 9, 9, '2026-09-09', NULL),
    -> (10, 10, 10, '2026-09-10', '2026-09-18');
Query OK, 10 rows affected (0.040 sec)
Records: 10  Duplicates: 0  Warnings: 0

SELECT * FROM issued_books;
+----------+---------+------------+------------+-------------+
| issue_id | book_id | student_id | issue_date | return_date |
+----------+---------+------------+------------+-------------+
|        1 |       1 |          1 | 2026-09-01 | 2026-09-15  |
|        2 |       2 |          2 | 2026-09-02 | 2026-09-16  |
|        3 |       3 |          3 | 2026-09-03 | NULL        |
|        4 |       4 |          4 | 2026-09-04 | 2026-09-18  |
|        5 |       5 |          5 | 2026-09-05 | NULL        |
|        6 |       6 |          6 | 2026-09-06 | 2026-09-17  |
|        7 |       7 |          7 | 2026-09-07 | NULL        |
|        8 |       8 |          8 | 2026-09-08 | 2026-09-19  |
|        9 |       9 |          9 | 2026-09-09 | NULL        |
|       10 |      10 |         10 | 2026-09-10 | 2026-09-18  |
+----------+---------+------------+------------+-------------+
10 rows in set (0.086 sec)

SELECT COUNT(*) FROM issued_books;
+----------+
| COUNT(*) |
+----------+
|       10 |
+----------+
1 row in set (0.013 sec)
-- ========================================
-- 4. BASIC SQL QUERIES
-- ========================================

SELECT * FROM books;
+---------+---------------------+--------------------+-----------------+--------+----------+
| book_id | book_name           | author             | category        | price  | quantity |
+---------+---------------------+--------------------+-----------------+--------+----------+
|       1 | Python Programming  | Mark Lutz          | Programming     | 650.00 |        5 |
|       2 | SQL Fundamentals    | John Smith         | Programming     | 550.00 |        4 |
|       3 | Data Science Basics | David Miller       | Data Science    | 750.00 |        3 |
|       4 | Java Programming    | Herbert Schildt    | Programming     | 600.00 |        6 |
|       5 | Database Management | Raghu Ramakrishnan | Database        | 850.00 |        2 |
|       6 | Machine Learning    | Tom Mitchell       | Data Science    | 900.00 |        4 |
|       7 | Web Development     | Jon Duckett        | Web Development | 500.00 |        5 |
|       8 | C Programming       | Dennis Ritchie     | Programming     | 450.00 |        7 |
|       9 | Excel for Beginners | Mike Johnson       | Computer        | 350.00 |        8 |
|      10 | Python Projects     | Eric Matthes       | Programming     | 700.00 |        3 |
+---------+---------------------+--------------------+-----------------+--------+----------+
10 rows in set (0.004 sec)

 SELECT * FROM students;
+------------+--------------+-------------------+------------+---------------+
| student_id | student_name | email             | phone      | city          |
+------------+--------------+-------------------+------------+---------------+
|          1 | Keerthi      | keerthi@gmail.com | 9876543210 | Visakhapatnam |
|          2 | Mani         | mani@gmail.com    | 9876543211 | Hyderabad     |
|          3 | Srinu        | srinu@gmail.com   | 9876543212 | Vijayawada    |
|          4 | Sweetha      | sweetha@gmail.com | 9876543213 | Visakhapatnam |
|          5 | Ravi         | ravi@gmail.com    | 9876543214 | Hyderabad     |
|          6 | Priya        | priya@gmail.com   | 9876543215 | Chennai       |
|          7 | Kiran        | kiran@gmail.com   | 9876543216 | Bangalore     |
|          8 | Anil         | anil@gmail.com    | 9876543217 | Visakhapatnam |
|          9 | Divya        | divya@gmail.com   | 9876543218 | Vijayawada    |
|         10 | Suresh       | suresh@gmail.com  | 9876543219 | Hyderabad     |
+------------+--------------+-------------------+------------+---------------+
10 rows in set (0.007 sec)

 SELECT * FROM books
    -> WHERE price > 500;
+---------+---------------------+--------------------+--------------+--------+----------+
| book_id | book_name           | author             | category     | price  | quantity |
+---------+---------------------+--------------------+--------------+--------+----------+
|       1 | Python Programming  | Mark Lutz          | Programming  | 650.00 |        5 |
|       2 | SQL Fundamentals    | John Smith         | Programming  | 550.00 |        4 |
|       3 | Data Science Basics | David Miller       | Data Science | 750.00 |        3 |
|       4 | Java Programming    | Herbert Schildt    | Programming  | 600.00 |        6 |
|       5 | Database Management | Raghu Ramakrishnan | Database     | 850.00 |        2 |
|       6 | Machine Learning    | Tom Mitchell       | Data Science | 900.00 |        4 |
|      10 | Python Projects     | Eric Matthes       | Programming  | 700.00 |        3 |
+---------+---------------------+--------------------+--------------+--------+----------+
7 rows in set (0.014 sec)

 SELECT * FROM books
    -> WHERE category = 'Programming';
+---------+--------------------+-----------------+-------------+--------+----------+
| book_id | book_name          | author          | category    | price  | quantity |
+---------+--------------------+-----------------+-------------+--------+----------+
|       1 | Python Programming | Mark Lutz       | Programming | 650.00 |        5 |
|       2 | SQL Fundamentals   | John Smith      | Programming | 550.00 |        4 |
|       4 | Java Programming   | Herbert Schildt | Programming | 600.00 |        6 |
|       8 | C Programming      | Dennis Ritchie  | Programming | 450.00 |        7 |
|      10 | Python Projects    | Eric Matthes    | Programming | 700.00 |        3 |
+---------+--------------------+-----------------+-------------+--------+----------+
5 rows in set (0.004 sec)

 select * FROM students
    -> where city = 'visakhapatnam';
+------------+--------------+-------------------+------------+---------------+
| student_id | student_name | email             | phone      | city          |
+------------+--------------+-------------------+------------+---------------+
|          1 | Keerthi      | keerthi@gmail.com | 9876543210 | Visakhapatnam |
|          4 | Sweetha      | sweetha@gmail.com | 9876543213 | Visakhapatnam |
|          8 | Anil         | anil@gmail.com    | 9876543217 | Visakhapatnam |
+------------+--------------+-------------------+------------+---------------+
3 rows in set (0.005 sec)

 select* from books
    -> order by price asc;
+---------+---------------------+--------------------+-----------------+--------+----------+
| book_id | book_name           | author             | category        | price  | quantity |
+---------+---------------------+--------------------+-----------------+--------+----------+
|       9 | Excel for Beginners | Mike Johnson       | Computer        | 350.00 |        8 |
|       8 | C Programming       | Dennis Ritchie     | Programming     | 450.00 |        7 |
|       7 | Web Development     | Jon Duckett        | Web Development | 500.00 |        5 |
|       2 | SQL Fundamentals    | John Smith         | Programming     | 550.00 |        4 |
|       4 | Java Programming    | Herbert Schildt    | Programming     | 600.00 |        6 |
|       1 | Python Programming  | Mark Lutz          | Programming     | 650.00 |        5 |
|      10 | Python Projects     | Eric Matthes       | Programming     | 700.00 |        3 |
|       3 | Data Science Basics | David Miller       | Data Science    | 750.00 |        3 |
|       5 | Database Management | Raghu Ramakrishnan | Database        | 850.00 |        2 |
|       6 | Machine Learning    | Tom Mitchell       | Data Science    | 900.00 |        4 |
+---------+---------------------+--------------------+-----------------+--------+----------+
10 rows in set (0.006 sec)

 select * from books
    -> order by price desc;
+---------+---------------------+--------------------+-----------------+--------+----------+
| book_id | book_name           | author             | category        | price  | quantity |
+---------+---------------------+--------------------+-----------------+--------+----------+
|       6 | Machine Learning    | Tom Mitchell       | Data Science    | 900.00 |        4 |
|       5 | Database Management | Raghu Ramakrishnan | Database        | 850.00 |        2 |
|       3 | Data Science Basics | David Miller       | Data Science    | 750.00 |        3 |
|      10 | Python Projects     | Eric Matthes       | Programming     | 700.00 |        3 |
|       1 | Python Programming  | Mark Lutz          | Programming     | 650.00 |        5 |
|       4 | Java Programming    | Herbert Schildt    | Programming     | 600.00 |        6 |
|       2 | SQL Fundamentals    | John Smith         | Programming     | 550.00 |        4 |
|       7 | Web Development     | Jon Duckett        | Web Development | 500.00 |        5 |
|       8 | C Programming       | Dennis Ritchie     | Programming     | 450.00 |        7 |
|       9 | Excel for Beginners | Mike Johnson       | Computer        | 350.00 |        8 |
+---------+---------------------+--------------------+-----------------+--------+----------+
10 rows in set (0.008 sec)

 SELECT COUNT(*) AS total_books
    -> FROM books;
+-------------+
| total_books |
+-------------+
|          10 |
+-------------+
1 row in set (0.014 sec)

 SELECT COUNT(*) AS total_books
    ->
    -> from books;
+-------------+
| total_books |
+-------------+
|          10 |
+-------------+
1 row in set (0.014 sec)

SELECT AVG(price) AS average_price
    -> FROM books;
+---------------+
| average_price |
+---------------+
|    630.000000 |
+---------------+
1 row in set (0.091 sec)
 SELECT MAX(price) AS highest_price
    -> FROM books;
+---------------+
| highest_price |
+---------------+
|        900.00 |
+---------------+
1 row in set (0.098 sec)

 select MIN(price) as lowest_price
    -> from books;
+--------------+
| lowest_price |
+--------------+
|       350.00 |
+--------------+
1 row in set (0.005 sec)

 SELECT * FROM students
    -> WHERE student_name LIKE 'A%';
+------------+--------------+----------------+------------+---------------+
| student_id | student_name | email          | phone      | city          |
+------------+--------------+----------------+------------+---------------+
|          8 | Anil         | anil@gmail.com | 9876543217 | Visakhapatnam |
+------------+--------------+----------------+------------+---------------+
1 row in set (0.109 sec)

 SELECT * FROM books
    -> WHERE book_name LIKE '%Python%';
+---------+--------------------+--------------+-------------+--------+----------+
| book_id | book_name          | author       | category    | price  | quantity |
+---------+--------------------+--------------+-------------+--------+----------+
|       1 | Python Programming | Mark Lutz    | Programming | 650.00 |        5 |
|      10 | Python Projects    | Eric Matthes | Programming | 700.00 |        3 |
+---------+--------------------+--------------+-------------+--------+----------+
2 rows in set (0.005 sec)

 UPDATE books
    -> SET price = 700
    -> WHERE book_id = 1;
Query OK, 1 row affected (0.040 sec)
Rows matched: 1  Changed: 1  Warnings: 0

 UPDATE students
    -> SET phone = '9999999999'
    -> WHERE student_id = 1;
Query OK, 1 row affected (0.026 sec)
Rows matched: 1  Changed: 1  Warnings: 0

 DELETE FROM students
    -> WHERE student_id = 10;
Query OK, 1 row affected (0.102 sec)

 SELECT * FROM students;
+------------+--------------+-------------------+------------+---------------+
| student_id | student_name | email             | phone      | city          |
+------------+--------------+-------------------+------------+---------------+
|          1 | Keerthi      | keerthi@gmail.com | 9999999999 | Visakhapatnam |
|          2 | Mani         | mani@gmail.com    | 9876543211 | Hyderabad     |
|          3 | Srinu        | srinu@gmail.com   | 9876543212 | Vijayawada    |
|          4 | Sweetha      | sweetha@gmail.com | 9876543213 | Visakhapatnam |
|          5 | Ravi         | ravi@gmail.com    | 9876543214 | Hyderabad     |
|          6 | Priya        | priya@gmail.com   | 9876543215 | Chennai       |
|          7 | Kiran        | kiran@gmail.com   | 9876543216 | Bangalore     |
|          8 | Anil         | anil@gmail.com    | 9876543217 | Visakhapatnam |
|          9 | Divya        | divya@gmail.com   | 9876543218 | Vijayawada    |
+------------+--------------+-------------------+------------+---------------+
9 rows in set (0.005 sec)
 SELECT * FROM issued_books;
+----------+---------+------------+------------+-------------+
| issue_id | book_id | student_id | issue_date | return_date |
+----------+---------+------------+------------+-------------+
|        1 |       1 |          1 | 2026-09-01 | 2026-09-15  |
|        2 |       2 |          2 | 2026-09-02 | 2026-09-16  |
|        3 |       3 |          3 | 2026-09-03 | NULL        |
|        4 |       4 |          4 | 2026-09-04 | 2026-09-18  |
|        5 |       5 |          5 | 2026-09-05 | NULL        |
|        6 |       6 |          6 | 2026-09-06 | 2026-09-17  |
|        7 |       7 |          7 | 2026-09-07 | NULL        |
|        8 |       8 |          8 | 2026-09-08 | 2026-09-19  |
|        9 |       9 |          9 | 2026-09-09 | NULL        |
|       10 |      10 |         10 | 2026-09-10 | 2026-09-18  |
+----------+---------+------------+------------+-------------+
10 rows in set (0.004 sec)

 SELECT *
    -> FROM issued_books
    -> WHERE return_date IS NULL;
+----------+---------+------------+------------+-------------+
| issue_id | book_id | student_id | issue_date | return_date |
+----------+---------+------------+------------+-------------+
|        3 |       3 |          3 | 2026-09-03 | NULL        |
|        5 |       5 |          5 | 2026-09-05 | NULL        |
|        7 |       7 |          7 | 2026-09-07 | NULL        |
|        9 |       9 |          9 | 2026-09-09 | NULL        |
+----------+---------+------------+------------+-------------+
4 rows in set (0.010 sec)

 SELECT COUNT(*) AS total_issued_books
    -> FROM issued_books;
+--------------------+
| total_issued_books |
+--------------------+
|                 10 |
+--------------------+
1 row in set (0.015 sec)

 SELECT
    ->     books.book_id,
    ->     books.book_name,
    ->     books.author,
    ->     students.student_name,
    ->     students.city,
    ->     issued_books.issue_date,
    ->     issued_books.return_date
    -> FROM issued_books
    -> JOIN books
    ->     ON issued_books.book_id = books.book_id
    -> JOIN students
    ->     ON issued_books.student_id = students.student_id;
+---------+---------------------+--------------------+--------------+---------------+------------+-------------+
| book_id | book_name           | author             | student_name | city          | issue_date | return_date |
+---------+---------------------+--------------------+--------------+---------------+------------+-------------+
|       1 | Python Programming  | Mark Lutz          | Keerthi      | Visakhapatnam | 2026-09-01 | 2026-09-15  |
|       2 | SQL Fundamentals    | John Smith         | Mani         | Hyderabad     | 2026-09-02 | 2026-09-16  |
|       3 | Data Science Basics | David Miller       | Srinu        | Vijayawada    | 2026-09-03 | NULL        |
|       4 | Java Programming    | Herbert Schildt    | Sweetha      | Visakhapatnam | 2026-09-04 | 2026-09-18  |
|       5 | Database Management | Raghu Ramakrishnan | Ravi         | Hyderabad     | 2026-09-05 | NULL        |
|       6 | Machine Learning    | Tom Mitchell       | Priya        | Chennai       | 2026-09-06 | 2026-09-17  |
|       7 | Web Development     | Jon Duckett        | Kiran        | Bangalore     | 2026-09-07 | NULL        |
|       8 | C Programming       | Dennis Ritchie     | Anil         | Visakhapatnam | 2026-09-08 | 2026-09-19  |
|       9 | Excel for Beginners | Mike Johnson       | Divya        | Vijayawada    | 2026-09-09 | NULL        |
+---------+---------------------+--------------------+--------------+---------------+------------+-------------+
9 rows in set (0.006 sec)

  students.city,
