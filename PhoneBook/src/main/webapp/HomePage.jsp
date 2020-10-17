<%@page import="phonebook.directory.PhoneBook"%>
<%@page import="phonebook.directory.UsersDB"%>
<%@page import="phonebook.directory.Contacts"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>PhoneBook</title>
</head>
<body>

	<%@ include file="header.html"%>

	<div style="margin-left: 1000px;">
		<a href="/logout"><button>Logout</button></a>
	</div>


	<table>

		<tr>

			<td>

				<div
					style="margin-top: 20px; padding: 20px; background-color: #E5E4E1; margin-left: 80px; margin-right: 500px">

					<h3 align="center">ADD CONTACT</h3>

					<div align="center" style="text-align: center;">

						<form action="/AddContact" method="post">

							Name <br> <input type="text" name="name" /><br> <br>
							Phone number<br> <input type="number" name="number" /><br>
							<br> <input type="submit" value="ADD" onclick="addValue()" />

						</form>

					</div>


					<script type="text/javascript">
						function addValue() {

							alert("Number Added");

						}
					</script>

				</div>

			</td>

			<td><%!PhoneBook book;
	boolean flag;%> <%
 	HttpSession userSession = request.getSession(false);

 String name = (String) userSession.getAttribute("UserName");

 book = UsersDB.getInstance(name);

 flag = book.getContact().isEmpty();
 %>
				<h6 style="margin-left: 100px">
					User :
					<%=name%>
				</h6>

				<h4 style="margin-top: 50px;">Your Contacts</h4> <a
				href="AllContacts.jsp"><button>Get Numbers</button></a> <c:choose>

					<c:when test="${flag}">

						<p>No Contacts to display !</p>

					</c:when>

					<c:otherwise>

						<%
							for (Contacts contact : book.getContact()) {
						%>


						<p>
							<%=contact.getName().toUpperCase()%>
						</p>
						<%
							}
						%>



					</c:otherwise>

				</c:choose> <br></td>

		</tr>

	</table>


	<br>
	<br>
	<footer style="background-color: #F89246; padding: 50px;"></footer>

</body>
</html>