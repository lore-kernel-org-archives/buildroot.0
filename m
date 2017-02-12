From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 12 Feb 2017 21:26:56 +0100
Subject: [Buildroot] [PATCH 1/1] libmaxminddb: new package
Message-ID: <1486931216-34024-1-git-send-email-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Fabrice Fontaine <fabrice.fontaine@orange.com>

C library for the MaxMind DB file format

The libmaxminddb library provides a C library for reading
MaxMind DB files, including the GeoIP2 databases from MaxMind.
This is a custom binary format designed to facilitate fast
lookups of IP addresses while allowing for great flexibility
in the type of data associated with an address.

The MaxMind DB format is an open format. The spec is available
at http://maxmind.github.io/MaxMind-DB/. This spec is licensed
under the Creative Commons Attribution-ShareAlike 3.0 Unported
License.

http://maxmind.github.io/libmaxminddb

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/Config.in                                  |  1 +
 .../0001-Add-disable-tests-to-configure.patch      | 53 ++++++++++++++++++++++
 package/libmaxminddb/Config.in                     | 17 +++++++
 package/libmaxminddb/libmaxminddb.hash             |  2 +
 package/libmaxminddb/libmaxminddb.mk               | 15 ++++++
 5 files changed, 88 insertions(+)
 create mode 100644 package/libmaxminddb/0001-Add-disable-tests-to-configure.patch
 create mode 100644 package/libmaxminddb/Config.in
 create mode 100644 package/libmaxminddb/libmaxminddb.hash
 create mode 100644 package/libmaxminddb/libmaxminddb.mk

diff --git a/package/Config.in b/package/Config.in
index deff0fe..49d9ac8 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1238,6 +1238,7 @@ menu "Networking"
 	source "package/libidn/Config.in"
 	source "package/libiscsi/Config.in"
 	source "package/libldns/Config.in"
+	source "package/libmaxminddb/Config.in"
 	source "package/libmbus/Config.in"
 	source "package/libmemcached/Config.in"
 	source "package/libmicrohttpd/Config.in"
diff --git a/package/libmaxminddb/0001-Add-disable-tests-to-configure.patch b/package/libmaxminddb/0001-Add-disable-tests-to-configure.patch
new file mode 100644
index 0000000..1ae5acc
--- /dev/null
+++ b/package/libmaxminddb/0001-Add-disable-tests-to-configure.patch
@@ -0,0 +1,53 @@
+From b12ca226c111730e2ef5d8a3d929dbd943fbe763 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Thu, 9 Feb 2017 21:40:43 +0100
+Subject: [PATCH] Add --disable-tests to configure
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ Makefile.am  |  6 +++++-
+ configure.ac | 10 ++++++++++
+ 2 files changed, 15 insertions(+), 1 deletion(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index 1804945..cebcd31 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -5,8 +5,12 @@ nodist_include_HEADERS = include/maxminddb_config.h
+ 
+ SUBDIRS = \
+   src     \
+-  bin     \
++  bin
++
++if TESTS
++SUBDIRS += \
+   t
++endif
+ 
+ EXTRA_DIST = doc t Changes.md LICENSE NOTICE README.md projects/VS12 projects/VS12-tests
+ dist-hook:
+diff --git a/configure.ac b/configure.ac
+index 7916212..fc53ffd 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -119,6 +119,16 @@ AC_ARG_ENABLE(
+         esac],[debug=false])
+ AM_CONDITIONAL([DEBUG], [test x$debug = xtrue])
+ 
++AC_ARG_ENABLE(
++        [tests],
++        [  --enable-tests    Compilation of tests code],
++        [case "${enableval}" in
++          yes) tests=true ;;
++          no)  tests=false ;;
++          *) AC_MSG_ERROR([bad value ${enableval} for --enable-tests]) ;;
++        esac],[tests=false])
++AM_CONDITIONAL([TESTS], [test x$tests = xtrue])
++
+ AC_CONFIG_FILES([Makefile
+                  src/Makefile
+                  bin/Makefile
+-- 
+2.5.0
+
diff --git a/package/libmaxminddb/Config.in b/package/libmaxminddb/Config.in
new file mode 100644
index 0000000..957572e
--- /dev/null
+++ b/package/libmaxminddb/Config.in
@@ -0,0 +1,17 @@
+config BR2_PACKAGE_LIBMAXMINDDB
+	bool "libmaxminddb"
+	help
+	  C library for the MaxMind DB file format
+
+	  The libmaxminddb library provides a C library for reading
+	  MaxMind DB files, including the GeoIP2 databases from MaxMind.
+	  This is a custom binary format designed to facilitate fast
+	  lookups of IP addresses while allowing for great flexibility
+	  in the type of data associated with an address.
+
+	  The MaxMind DB format is an open format. The spec is available
+	  at http://maxmind.github.io/MaxMind-DB/. This spec is licensed
+	  under the Creative Commons Attribution-ShareAlike 3.0 Unported
+	  License.
+
+	  http://maxmind.github.io/libmaxminddb
diff --git a/package/libmaxminddb/libmaxminddb.hash b/package/libmaxminddb/libmaxminddb.hash
new file mode 100644
index 0000000..3d5b4ca
--- /dev/null
+++ b/package/libmaxminddb/libmaxminddb.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256	4147241d4e3103bd843167ae5a0d5cf176632b6898cb1cca6223d2d58cc53ef5	libmaxminddb-1.2.0.tar.gz
diff --git a/package/libmaxminddb/libmaxminddb.mk b/package/libmaxminddb/libmaxminddb.mk
new file mode 100644
index 0000000..2b6bbb7
--- /dev/null
+++ b/package/libmaxminddb/libmaxminddb.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# libmaxminddb
+#
+################################################################################
+
+LIBMAXMINDDB_VERSION = 1.2.0
+LIBMAXMINDDB_SITE = $(call github,maxmind,libmaxminddb,$(LIBMAXMINDDB_VERSION))
+LIBMAXMINDDB_INSTALL_STAGING = YES
+LIBMAXMINDDB_LICENSE = Apache-2.0
+LIBMAXMINDDB_LICENSE_FILES = LICENSE
+LIBMAXMINDDB_AUTORECONF = YES
+LIBMAXMINDDB_CONF_OPTS = --disable-tests
+
+$(eval $(autotools-package))
-- 
2.5.0
