<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="zh">
<head>
    <!-- Required meta tags -->
    <jsp:include page="../public/pro/title.jsp">
        <jsp:param value="Role" name="loader"/>
    </jsp:include>

    <!-- Required common css -->
    <jsp:include page="../public/pro/css.jsp">
        <jsp:param value="plugins/notifications/lobibox.min.css" name="css"/>
        <jsp:param value="plugins/treeview/ke-btreeview.min.css" name="css"/>
        <jsp:param value="plugins/treeview/bootstrap-treeview.min.css" name="css"/>
    </jsp:include>

    <!-- Required table css -->
    <jsp:include page="../public/pro/tcss.jsp"></jsp:include>
</head>

<body>


<!--start wrapper-->
<div class="wrapper">

    <!--start top header-->
    <jsp:include page="../public/pro/navtop.jsp"></jsp:include>
    <!--end top header-->

    <!--start sidebar -->
    <jsp:include page="../public/pro/navbar.jsp"></jsp:include>
    <!--end sidebar -->

    <!--start content-->
    <main class="page-content">
        <!--breadcrumb-->
        <div class="page-breadcrumb d-none d-sm-flex align-items-center mb-3">
            <div class="breadcrumb-title pe-3">System</div>
            <div class="ps-3">
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb mb-0 p-0">
                        <li class="breadcrumb-item"><a href="/"><i class="bx bx-home-alt"></i></a>
                        </li>
                        <li class="breadcrumb-item active" aria-current="page">Role</li>
                    </ol>
                </nav>
            </div>
        </div>
        <!--end breadcrumb-->
        <hr/>
        <div class="row">
            <div class="container">
                <div class="alert border-0 bg-light-info alert-dismissible fade show py-2 text-info">
                    <i class="bx bx-info-circle"></i> <strong>Display the role management list.</strong><br/>
                    <i class="bx bx-info-circle"></i> <strong>Configure the template directories that
                    each role can access.</strong>
                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                </div>
            </div>
        </div>
        <!--end row-->
        <!-- content body -->
        <h6 class="mb-0 text-uppercase">System Role Manager
        </h6>
        <hr/>
        <div class="card">
            <div class="card-body">
                <div class="table-responsive">
                    <table id="efak_system_role_tab" class="table table-striped table-bordered" style="width:100%">
                        <thead>
                        <tr>
                            <th>#Name</th>
                            <th>Describe</th>
                            <th>Operate</th>
                        </tr>
                        </thead>
                    </table>
                </div>
            </div>
        </div>

        <!-- setting role modal -->
        <div class="modal fade" id="ke_user_role_dialog" tabindex="-1" aria-labelledby="keModalLabel"
             aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="keModalLabel">Setting System Role</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <div id="ke_role_alert_info"></div>
                        <form role="form" action="#" method="post"
                              onsubmit="return contextFormValid();return false;">
                            <div class="modal-body">
                                <div id="ke_treeview_checkable" class=""></div>
                            </div>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>
    </main>
    <!--end page main-->

    <!--Start Back To Top Button-->
    <a href="javaScript:;" class="back-to-top"><i class='bx bxs-up-arrow-alt'></i></a>
    <!--End Back To Top Button-->

</div>
<!--end wrapper-->

<!-- import js -->
<jsp:include page="../public/pro/script.jsp">
    <jsp:param value="plugins/notifications/lobibox.min.js" name="loader"/>
    <jsp:param value="plugins/notifications/notifications.min.js" name="loader"/>
    <jsp:param value="plugins/treeview/bootstrap-treeview.min.js" name="loader"/>
    <jsp:param value="main/system/role.js?v=3.0.0" name="loader"/>
</jsp:include>
<jsp:include page="../public/pro/tscript.jsp"></jsp:include>
<script type="text/javascript">

    function errorNoti(errorMsg) {
        console.log(errorMsg)
        Lobibox.notify('error', {
            pauseDelayOnHover: true,
            continueDelayOnInactiveTab: false,
            position: 'top right',
            icon: 'bx bx-x-circle',
            msg: errorMsg
        });
    }

    function contextFormValid() {
        var ke_rtxno_name = $("#ke_rtxno_name").val();
        var ke_real_name = $("#ke_real_name").val();
        var ke_user_name = $("#ke_user_name").val();
        var ke_user_email = $("#ke_user_email").val();
        if (ke_real_name == "Administrator" || ke_user_name == "admin") {
            errorNoti("Oops! Administrator or admin is not available.");
            return false;
        }
        if (ke_rtxno_name.length == 0 || ke_real_name.length == 0 || ke_user_name.length == 0 || ke_user_email.length == 0) {
            errorNoti("Add user information cannot be empty.");
            return false;
        }

        return true;
    }

    function contextModifyFormValid() {
        var ke_rtxno_name_modify = $("#ke_rtxno_name_modify").val();
        var ke_real_name_modify = $("#ke_real_name_modify").val();
        var ke_user_name_modify = $("#ke_user_name_modify").val();
        var ke_user_email_modify = $("#ke_user_email_modify").val();

        if (ke_real_name_modify == "Administrator" || ke_user_name_modify == "admin") {
            errorNoti("Oops! Administrator or admin is not available.");
            return false;
        }

        if (ke_rtxno_name_modify.length == 0 || ke_real_name_modify.length == 0 || ke_user_name_modify.length == 0 || ke_user_email_modify.length == 0) {
            errorNoti("Edit user information cannot be empty.");
            return false;
        }

        return true;
    }

    function contextResetFormValid() {
        var ke_user_new_pwd_reset = $("#ke_user_new_pwd_reset").val();
        var userResetRegular = /[\u4E00-\u9FA5]/;
        if (ke_user_new_pwd_reset.length == 0 || userResetRegular.test(ke_user_new_pwd_reset)) {
            errorNoti("Password can only be number and letters or special symbols.");
            return false;
        }

        return true;
    }
</script>
</body>
</html>
