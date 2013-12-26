From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 26 Dec 2013 20:23:54 -0300
Subject: [Buildroot] [PATCHv2] c-ares: new package
Message-ID: <1388100234-32766-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add c-ares library from bug #6482.
Most of the credit goes to Gennady Proskurin <gpq@mail.ru>

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/Config.in                                       |  1 +
 package/c-ares/Config.in                                |  6 ++++++
 ...-ares-01-use_check_build_instead_of_check_user.patch | 17 +++++++++++++++++
 package/c-ares/c-ares.mk                                | 16 ++++++++++++++++
 4 files changed, 40 insertions(+)
 create mode 100644 package/c-ares/Config.in
 create mode 100644 package/c-ares/c-ares-01-use_check_build_instead_of_check_user.patch
 create mode 100644 package/c-ares/c-ares.mk

diff --git a/package/Config.in b/package/Config.in
index b1e52ae..ea3f63d 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -631,6 +631,7 @@ source "package/mediastreamer/Config.in"
 endmenu
 
 menu "Networking"
+source "package/c-ares/Config.in"
 source "package/cppzmq/Config.in"
 source "package/czmq/Config.in"
 source "package/filemq/Config.in"
diff --git a/package/c-ares/Config.in b/package/c-ares/Config.in
new file mode 100644
index 0000000..be17b16
--- /dev/null
+++ b/package/c-ares/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_C_ARES
+	bool "c-ares"
+	help
+	  C library for asynchronous DNS requests.
+
+	  http://c-ares.haxx.se/
diff --git a/package/c-ares/c-ares-01-use_check_build_instead_of_check_user.patch b/package/c-ares/c-ares-01-use_check_build_instead_of_check_user.patch
new file mode 100644
index 0000000..8210ed6
--- /dev/null
+++ b/package/c-ares/c-ares-01-use_check_build_instead_of_check_user.patch
@@ -0,0 +1,17 @@
+Use XC_CHECK_BUILD_FLAGS instead of XC_CHECK_USER_FLAGS.
+Otherwise it complains of CPPFLAGS in CFLAGS.
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+
+diff -Nura c-ares-1.10.0.orig/m4/xc-cc-check.m4 c-ares-1.10.0/m4/xc-cc-check.m4
+--- c-ares-1.10.0.orig/m4/xc-cc-check.m4	2013-12-26 19:40:46.354195974 -0300
++++ c-ares-1.10.0/m4/xc-cc-check.m4	2013-12-26 19:41:01.850718535 -0300
+@@ -59,7 +59,7 @@
+ 
+ AC_DEFUN([_XC_PROG_CC], [
+   AC_REQUIRE([_XC_PROG_CC_PREAMBLE])dnl
+-  AC_REQUIRE([XC_CHECK_USER_FLAGS])dnl
++  AC_REQUIRE([XC_CHECK_BUILD_FLAGS])dnl
+   AC_REQUIRE([AC_PROG_INSTALL])dnl
+   AC_REQUIRE([AC_PROG_CC])dnl
+   AC_REQUIRE([AM_PROG_CC_C_O])dnl
diff --git a/package/c-ares/c-ares.mk b/package/c-ares/c-ares.mk
new file mode 100644
index 0000000..495d7aa
--- /dev/null
+++ b/package/c-ares/c-ares.mk
@@ -0,0 +1,16 @@
+################################################################################
+#
+# c-ares
+#
+################################################################################
+
+C_ARES_VERSION = 1.10.0
+C_ARES_SITE = http://c-ares.haxx.se/download
+C_ARES_INSTALL_STAGING = YES
+# Rebuild configure to avoid _XC_CHECK_VAR_CFLAGS
+C_ARES_AUTORECONF = YES
+C_ARES_LICENSE = MIT
+# No standalone, use some source file
+C_ARES_LICENSE_FILES = ares_mkquery.c
+
+$(eval $(autotools-package))
-- 
1.8.3.2
