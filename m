From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 25 Nov 2019 18:54:09 +0100
Subject: [Buildroot] [PATCH/next 1/1] package/libmaxminddb: bump to version
 1.4.2
Message-ID: <20191125175409.1018600-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Remove patch (already in version)
- Retrieve official tarball to drop autoreconf

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .../0001-Add-disable-binaries.patch           | 53 -------------------
 package/libmaxminddb/libmaxminddb.hash        |  2 +-
 package/libmaxminddb/libmaxminddb.mk          |  7 ++-
 3 files changed, 4 insertions(+), 58 deletions(-)
 delete mode 100644 package/libmaxminddb/0001-Add-disable-binaries.patch

diff --git a/package/libmaxminddb/0001-Add-disable-binaries.patch b/package/libmaxminddb/0001-Add-disable-binaries.patch
deleted file mode 100644
index 0053cace71..0000000000
--- a/package/libmaxminddb/0001-Add-disable-binaries.patch
+++ /dev/null
@@ -1,53 +0,0 @@
-From 501f85fa729d08b90f0e1ff6f9378a0864f722a7 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Fri, 2 Feb 2018 13:19:18 +0100
-Subject: [PATCH] Add --disable-binaries
-
-mmdblookup now depends on pthread.h which can be disabled on some
-toolchains so add an option to be able to compile libmaxminddb without
-this binary
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- Makefile.am  | 6 +++++-
- configure.ac | 6 ++++++
- 2 files changed, 11 insertions(+), 1 deletion(-)
-
-diff --git a/Makefile.am b/Makefile.am
-index cebcd31..cfbfd77 100644
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -4,8 +4,12 @@ include_HEADERS = include/maxminddb.h
- nodist_include_HEADERS = include/maxminddb_config.h
- 
- SUBDIRS = \
--  src     \
-+  src
-+
-+if BINARIES
-+SUBDIRS += \
-   bin
-+endif
- 
- if TESTS
- SUBDIRS += \
-diff --git a/configure.ac b/configure.ac
-index c494746..4d1beb4 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -119,6 +119,12 @@ AC_ARG_ENABLE(
-         esac],[debug=false])
- AM_CONDITIONAL([DEBUG], [test x$debug = xtrue])
- 
-+AC_ARG_ENABLE([binaries],
-+        AS_HELP_STRING([--enable-binaries], [Compilation of binaries code]),
-+        [enable_binaries=${enableval}],
-+        [enable_binaries=yes])
-+AM_CONDITIONAL([BINARIES], [test "${enable_binaries}" = "yes"])
-+
- AC_ARG_ENABLE([tests],
-         AS_HELP_STRING([--enable-tests], [Compilation of tests code]),
-         [enable_tests=${enableval}],
--- 
-2.7.4
-
diff --git a/package/libmaxminddb/libmaxminddb.hash b/package/libmaxminddb/libmaxminddb.hash
index 073458a351..c8a18e4ee4 100644
--- a/package/libmaxminddb/libmaxminddb.hash
+++ b/package/libmaxminddb/libmaxminddb.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256	c0785521c7e5515f1169db90ed6e51bc2a5a000377d0fbad87e4d5a791a6e364	libmaxminddb-1.3.2.tar.gz
+sha256	22e15ee6cac6da28e8845e4429e2de0037b177aa6d192780aabc1e76bc9a00b0	libmaxminddb-1.4.2.tar.gz
 sha256	cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30	LICENSE
diff --git a/package/libmaxminddb/libmaxminddb.mk b/package/libmaxminddb/libmaxminddb.mk
index 25d4d3378f..18e2eaee7d 100644
--- a/package/libmaxminddb/libmaxminddb.mk
+++ b/package/libmaxminddb/libmaxminddb.mk
@@ -4,13 +4,12 @@
 #
 ################################################################################
 
-LIBMAXMINDDB_VERSION = 1.3.2
-LIBMAXMINDDB_SITE = $(call github,maxmind,libmaxminddb,$(LIBMAXMINDDB_VERSION))
+LIBMAXMINDDB_VERSION = 1.4.2
+LIBMAXMINDDB_SITE = \
+	https://github.com/maxmind/libmaxminddb/releases/download/$(LIBMAXMINDDB_VERSION)
 LIBMAXMINDDB_INSTALL_STAGING = YES
 LIBMAXMINDDB_LICENSE = Apache-2.0
 LIBMAXMINDDB_LICENSE_FILES = LICENSE
-# Fetched from Github, with no configure script
-LIBMAXMINDDB_AUTORECONF = YES
 LIBMAXMINDDB_CONF_OPTS = --disable-tests
 
 # mmdblookup binary depends on pthreads
-- 
2.24.0
