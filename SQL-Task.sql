CREATE DATABASE Task

Use Task

CREATE TABLE Students(
						StudentId int identity not null primary key,
						StudentName nvarchar(50) not null,
						StudentSurname nvarchar(100),
						StudentPhone nvarchar(50) unique,
						StudentScore int DEFAULT(50) check(StudentScore>=0 AND StudentScore<=100),
						StudentComment nvarchar(50),
						StudentIsGraduated Bit DEFAULT 'FALSE'	
						);
INSERT INTO Students(StudentId,StudentName,StudentSurname,StudentPhone,StudentScore,StudentComment,StudentIsGraduated)

VALUES 
		(1,'Ulvi','Garazade','055 533 18 03',75,'Congratulations','True'),
		(2,'ABC','DEF','055 123 45 67',58,'Congratulations','False'),
		(3,'GHI','JKL','055 756 54 15',94,'Congratulations','False'),
		(4,'MNO','PQR','077 512 23 59',63,'Congratulations','False'),
		(5,'STU','WXY','050 215 64 69',92,'Congratulations','True')

CREATE TABLE GraduatedStudents(
								StudentId int identity not null primary key,
								StudentName nvarchar(50) not null,
								StudentSurname nvarchar(100),
								StudentPhone nvarchar(50) unique,
								StudentScore int DEFAULT(50) check(StudentScore>=0 AND StudentScore<=100),
								StudentComment nvarchar(50)
								);
								DROP TABLE GraduatedStudents

UPDATE Students set StudentComment= 'So bad' where StudentScore<68;
UPDATE Students set StudentComment= 'Congratulations' where StudentScore>68;

INSERT INTO GraduatedStudents(StudentName,StudentSurname,StudentScore,StudentComment)
SELECT Students.StudentName,Students.StudentSurname,Students.StudentScore,Students.StudentComment
FROM Students Where StudentIsGraduated='True';

DELETE FROM Students WHERE StudentIsGraduated= 'True';



