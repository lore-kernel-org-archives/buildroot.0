From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 26 Jan 2012 13:51:23 -0300
Subject: [Buildroot] [PATCH 04/13] bluez_utils: bump to version 4.98
In-Reply-To: <1327596692-30728-1-git-send-email-gustavo@zacarias.com.ar>
References: <1327596692-30728-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1327596692-30728-4-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 ...tils-move-libcheck-under-TEST-conditional.patch |   85 --------------------
 package/bluez_utils/bluez_utils.mk                 |    5 +-
 2 files changed, 3 insertions(+), 87 deletions(-)
 delete mode 100755 package/bluez_utils/bluez_utils-move-libcheck-under-TEST-conditional.patch

diff --git a/package/bluez_utils/bluez_utils-move-libcheck-under-TEST-conditional.patch b/package/bluez_utils/bluez_utils-move-libcheck-under-TEST-conditional.patch
deleted file mode 100755
index b2f5303..0000000
--- a/package/bluez_utils/bluez_utils-move-libcheck-under-TEST-conditional.patch
+++ /dev/null
@@ -1,85 +0,0 @@
-From bf5d45f2fbd1b1463512f4eb8d30bffb3478ccc7 Mon Sep 17 00:00:00 2001
-From: Marcel Holtmann <marcel@holtmann.org>
-Date: Tue, 27 Dec 2011 20:09:56 -0800
-Subject: [PATCH] build: Move libcheck under TEST conditional
-
----
- Makefile.am  |    5 ++++-
- acinclude.m4 |    8 +++++++-
- configure.ac |    3 +--
- 3 files changed, 12 insertions(+), 4 deletions(-)
-
-diff --git a/Makefile.am b/Makefile.am
-index 9112483..5cf287c 100644
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -449,6 +449,7 @@ endif
- 
- unit_objects =
- 
-+if TEST
- unit_tests = unit/test-eir
- 
- noinst_PROGRAMS += $(unit_tests)
-@@ -456,8 +457,10 @@ noinst_PROGRAMS += $(unit_tests)
- unit_test_eir_SOURCES = unit/test-eir.c src/eir.c src/glib-helper.c
- unit_test_eir_LDADD = lib/libbluetooth-private.la @GLIB_LIBS@ @CHECK_LIBS@
- unit_test_eir_CFLAGS = $(AM_CFLAGS) @CHECK_CFLAGS@
--unit_test_eir_SHORTNAME = unit
- unit_objects += $(unit_test_eir_OBJECTS)
-+else
-+unit_tests =
-+endif
- 
- TESTS = $(unit_tests)
- 
-diff --git a/acinclude.m4 b/acinclude.m4
-index 2097d77..753b994 100644
---- a/acinclude.m4
-+++ b/acinclude.m4
-@@ -170,6 +170,12 @@ AC_DEFUN([AC_PATH_READLINE], [
- 		[])
- ])
- 
-+AC_DEFUN([AC_PATH_CHECK], [
-+	PKG_CHECK_MODULES(CHECK, check >= 0.9.4, check_found=yes, check_found=no)
-+	AC_SUBST(CHECK_CFLAGS)
-+	AC_SUBST(CHECK_LIBS)
-+])
-+
- AC_DEFUN([AC_PATH_OUI], [
- 	AC_ARG_WITH(ouifile,
- 		    AS_HELP_STRING([--with-ouifile=PATH],[Path to the oui.txt file @<:@auto@:>@]),
-@@ -422,7 +428,7 @@ AC_DEFUN([AC_ARG_BLUEZ], [
- 	AM_CONDITIONAL(PAND, test "${pand_enable}" = "yes")
- 	AM_CONDITIONAL(DUND, test "${dund_enable}" = "yes")
- 	AM_CONDITIONAL(CUPS, test "${cups_enable}" = "yes")
--	AM_CONDITIONAL(TEST, test "${test_enable}" = "yes")
-+	AM_CONDITIONAL(TEST, test "${test_enable}" = "yes" && test "${check_found}" = "yes")
- 	AM_CONDITIONAL(TOOLS, test "${tools_enable}" = "yes")
- 	AM_CONDITIONAL(BCCMD, test "${bccmd_enable}" = "yes")
- 	AM_CONDITIONAL(PCMCIA, test "${pcmcia_enable}" = "yes")
-diff --git a/configure.ac b/configure.ac
-index 3a5dfde..a7670da 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -24,8 +24,6 @@ AC_PROG_YACC
- AM_PROG_LEX
- AM_PROG_MKDIR_P
- 
--PKG_CHECK_MODULES([CHECK], [check >= 0.9.4])
--
- m4_define([_LT_AC_TAGCONFIG], [])
- m4_ifdef([AC_LIBTOOL_TAGS], [AC_LIBTOOL_TAGS([])])
- 
-@@ -50,6 +48,7 @@ AC_PATH_UDEV
- AC_PATH_SNDFILE
- AC_PATH_OUI
- AC_PATH_READLINE
-+AC_PATH_CHECK
- 
- AC_ARG_BLUEZ
- 
--- 
-1.7.6.5
-
diff --git a/package/bluez_utils/bluez_utils.mk b/package/bluez_utils/bluez_utils.mk
index fe0f43f..025f31a 100644
--- a/package/bluez_utils/bluez_utils.mk
+++ b/package/bluez_utils/bluez_utils.mk
@@ -3,9 +3,10 @@
 # bluez_utils
 #
 #############################################################
-BLUEZ_UTILS_VERSION = 4.97
+
+BLUEZ_UTILS_VERSION = 4.98
 BLUEZ_UTILS_SOURCE = bluez-$(BLUEZ_UTILS_VERSION).tar.gz
-BLUEZ_UTILS_SITE = http://www.kernel.org/pub/linux/bluetooth/
+BLUEZ_UTILS_SITE = $(BR2_KERNEL_MIRROR)/linux/bluetooth
 BLUEZ_UTILS_INSTALL_STAGING = YES
 BLUEZ_UTILS_DEPENDENCIES = dbus libglib2
 BLUEZ_UTILS_CONF_OPT = --enable-test --enable-tools
-- 
1.7.3.4
