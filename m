From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 16 May 2017 22:41:17 +0200
Subject: [Buildroot] [PATCH 1/1] libmaxminddb: bump to version 1.2.1
Message-ID: <1494967277-26141-1-git-send-email-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Remove 0001-Add-disable-tests-to-configure.patch as it has been
integrated upstream

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .../0001-Add-disable-tests-to-configure.patch      | 49 ----------------------
 package/libmaxminddb/libmaxminddb.hash             |  2 +-
 package/libmaxminddb/libmaxminddb.mk               |  5 +--
 3 files changed, 3 insertions(+), 53 deletions(-)
 delete mode 100644 package/libmaxminddb/0001-Add-disable-tests-to-configure.patch

diff --git a/package/libmaxminddb/0001-Add-disable-tests-to-configure.patch b/package/libmaxminddb/0001-Add-disable-tests-to-configure.patch
deleted file mode 100644
index 8ff64e9..0000000
--- a/package/libmaxminddb/0001-Add-disable-tests-to-configure.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-From 8287848f747bd37298a2d32b8fd06cc59eb28028 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Thu, 9 Feb 2017 21:40:43 +0100
-Subject: [PATCH] Add --disable-tests to configure
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- Makefile.am  | 6 +++++-
- configure.ac | 6 ++++++
- 2 files changed, 11 insertions(+), 1 deletion(-)
-
-diff --git a/Makefile.am b/Makefile.am
-index 1804945..cebcd31 100644
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -5,8 +5,12 @@ nodist_include_HEADERS = include/maxminddb_config.h
- 
- SUBDIRS = \
-   src     \
--  bin     \
-+  bin
-+
-+if TESTS
-+SUBDIRS += \
-   t
-+endif
- 
- EXTRA_DIST = doc t Changes.md LICENSE NOTICE README.md projects/VS12 projects/VS12-tests
- dist-hook:
-diff --git a/configure.ac b/configure.ac
-index 7916212..2a22fab 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -119,6 +119,12 @@ AC_ARG_ENABLE(
-         esac],[debug=false])
- AM_CONDITIONAL([DEBUG], [test x$debug = xtrue])
- 
-+AC_ARG_ENABLE([tests],
-+        AS_HELP_STRING([--enable-tests], [Compilation of tests code]),
-+        [enable_tests=${enableval}],
-+        [enable_tests=yes])
-+AM_CONDITIONAL([TESTS], [test "${enable_tests}" = "yes"])
-+
- AC_CONFIG_FILES([Makefile
-                  src/Makefile
-                  bin/Makefile
--- 
-2.5.0
-
diff --git a/package/libmaxminddb/libmaxminddb.hash b/package/libmaxminddb/libmaxminddb.hash
index 3d5b4ca..952a655 100644
--- a/package/libmaxminddb/libmaxminddb.hash
+++ b/package/libmaxminddb/libmaxminddb.hash
@@ -1,2 +1,2 @@
 # Locally computed:
-sha256	4147241d4e3103bd843167ae5a0d5cf176632b6898cb1cca6223d2d58cc53ef5	libmaxminddb-1.2.0.tar.gz
+sha256	06a0ec3d1496e1a7e30d74ea15373e0010bbe392ea1819c149aaf724dc57dd9a	libmaxminddb-1.2.1.tar.gz
diff --git a/package/libmaxminddb/libmaxminddb.mk b/package/libmaxminddb/libmaxminddb.mk
index c6e70c5..f0678a0 100644
--- a/package/libmaxminddb/libmaxminddb.mk
+++ b/package/libmaxminddb/libmaxminddb.mk
@@ -4,13 +4,12 @@
 #
 ################################################################################
 
-LIBMAXMINDDB_VERSION = 1.2.0
+LIBMAXMINDDB_VERSION = 1.2.1
 LIBMAXMINDDB_SITE = $(call github,maxmind,libmaxminddb,$(LIBMAXMINDDB_VERSION))
 LIBMAXMINDDB_INSTALL_STAGING = YES
 LIBMAXMINDDB_LICENSE = Apache-2.0
 LIBMAXMINDDB_LICENSE_FILES = LICENSE
-# Fetched from Github, with no configure script, and we're patching
-# configure.ac
+# Fetched from Github, with no configure script
 LIBMAXMINDDB_AUTORECONF = YES
 LIBMAXMINDDB_CONF_OPTS = --disable-tests
 
-- 
2.5.0
