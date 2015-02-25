From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 25 Feb 2015 17:24:58 +0100
Subject: [Buildroot] [git commit branch/next] rsyslog: bump to version 8.8.0
Message-ID: <20150225163036.660A28178D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9d9bbf9b79358a1a2ba8055594a17308534c92b0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Patches upstream so remove them.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...make-mysql-support-cross-compile-friendly.patch |   53 --------------------
 ...make-pgsql-support-cross-compile-friendly.patch |   53 --------------------
 package/rsyslog/rsyslog.hash                       |    2 +-
 package/rsyslog/rsyslog.mk                         |    2 +-
 4 files changed, 2 insertions(+), 108 deletions(-)

diff --git a/package/rsyslog/0001-configure.ac-make-mysql-support-cross-compile-friendly.patch b/package/rsyslog/0001-configure.ac-make-mysql-support-cross-compile-friendly.patch
deleted file mode 100644
index 74a144d..0000000
--- a/package/rsyslog/0001-configure.ac-make-mysql-support-cross-compile-friendly.patch
+++ /dev/null
@@ -1,53 +0,0 @@
-From b095b56b7cf96a5b1a5e411b6da14b5e9f237a43 Mon Sep 17 00:00:00 2001
-From: Gustavo Zacarias <gustavo@zacarias.com.ar>
-Date: Wed, 14 Jan 2015 10:07:50 -0300
-Subject: [PATCH] configure.ac: make mysql support cross-compile friendly
-
-When cross-compiling mysql_config shouldn't be expected to be in PATH
-since normally this would point to distribution mysql rather than cross,
-which can be of a totally different architecture.
-
-Change it so we can use ac_cv_prog_MYSQL_CONFIG to point to the real one.
-
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
----
- configure.ac | 15 ++++++++-------
- 1 file changed, 8 insertions(+), 7 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index ad7274c..4e662dc 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -547,21 +547,22 @@ AC_ARG_ENABLE(mysql,
- )
- if test "x$enable_mysql" = "xyes"; then
-   AC_CHECK_PROG(
--    [HAVE_MYSQL_CONFIG],
-+    [MYSQL_CONFIG],
-     [mysql_config],
--    [yes],,,
-+    [mysql_config],
-+    [no],,
-   )
--  if test "x${HAVE_MYSQL_CONFIG}" != "xyes"; then
--    AC_MSG_FAILURE([mysql_config not found in PATH - usually a package named mysql-dev, libmysql-dev or similar, is missing - install it to fix this issue])
-+  if test "x${MYSQL_CONFIG}" = "xno"; then
-+    AC_MSG_FAILURE([mysql_config not found - usually a package named mysql-dev, libmysql-dev or similar, is missing - install it to fix this issue])
-   fi
-   AC_CHECK_LIB(
-     [mysqlclient],
-     [mysql_init],
--    [MYSQL_CFLAGS=`mysql_config --cflags`
--     MYSQL_LIBS=`mysql_config --libs`
-+    [MYSQL_CFLAGS=`$MYSQL_CONFIG --cflags`
-+     MYSQL_LIBS=`$MYSQL_CONFIG --libs`
-     ],
-     [AC_MSG_FAILURE([MySQL library is missing])],
--    [`mysql_config --libs`]
-+    [`$MYSQL_CONFIG --libs`]
-   )
-   AC_MSG_CHECKING(if we have mysql_library_init)
-   save_CFLAGS="$CFLAGS"
--- 
-2.0.5
-
diff --git a/package/rsyslog/0002-configure.ac-make-pgsql-support-cross-compile-friendly.patch b/package/rsyslog/0002-configure.ac-make-pgsql-support-cross-compile-friendly.patch
deleted file mode 100644
index 6e253dd..0000000
--- a/package/rsyslog/0002-configure.ac-make-pgsql-support-cross-compile-friendly.patch
+++ /dev/null
@@ -1,53 +0,0 @@
-From 80f49958083b90869e2857eb3edb7367e66c6a72 Mon Sep 17 00:00:00 2001
-From: Gustavo Zacarias <gustavo@zacarias.com.ar>
-Date: Wed, 14 Jan 2015 10:11:42 -0300
-Subject: [PATCH] configure.ac: make pgsql support cross-compile friendly
-
-When cross-compiling pg_config shouldn't be expected to be in PATH
-since normally this would point to distribution pgsql rather than cross,
-which can be of a totally different architecture.
-
-Change it so we can use ac_cv_prog_PG_CONFIG to point to the real one.
-
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
----
- configure.ac | 15 ++++++++-------
- 1 file changed, 8 insertions(+), 7 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 4e662dc..6edaedd 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -598,21 +598,22 @@ AC_ARG_ENABLE(pgsql,
- )
- if test "x$enable_pgsql" = "xyes"; then
-   AC_CHECK_PROG(
--    [HAVE_PGSQL_CONFIG],
-+    [PG_CONFIG],
-     [pg_config],
--    [yes],,,
-+    [pg_config],
-+    [no],,,
-   )
--  if test "x${HAVE_PGSQL_CONFIG}" != "xyes"; then
--    AC_MSG_FAILURE([pg_config not found in PATH])
-+  if test "x${PG_CONFIG}" = "xno"; then
-+    AC_MSG_FAILURE([pg_config not found])
-   fi
-   AC_CHECK_LIB(
-     [pq],
-     [PQconnectdb],
--    [PGSQL_CFLAGS="-I`pg_config --includedir`"
--     PGSQL_LIBS="-L`pg_config --libdir` -lpq"
-+    [PGSQL_CFLAGS="-I`$PG_CONFIG --includedir`"
-+     PGSQL_LIBS="-L`$PG_CONFIG --libdir` -lpq"
-     ],
-     [AC_MSG_FAILURE([PgSQL library is missing])],
--    [-L`pg_config --libdir`]
-+    [-L`$PG_CONFIG --libdir`]
-   )
- fi
- AM_CONDITIONAL(ENABLE_PGSQL, test x$enable_pgsql = xyes)
--- 
-2.0.5
-
diff --git a/package/rsyslog/rsyslog.hash b/package/rsyslog/rsyslog.hash
index 4a0ae5a..bd35019 100644
--- a/package/rsyslog/rsyslog.hash
+++ b/package/rsyslog/rsyslog.hash
@@ -1,2 +1,2 @@
 # From http://www.rsyslog.com/downloads/download-v8-stable/
-sha256	c77125b67a623569c9bdca8136b9aac013f1c6fd82fb8595e3ea267e61800f9c	rsyslog-8.7.0.tar.gz
+sha256	147a7e474665af7a817ac18d7924e26448350a77572e7fd9cfe284cb6291a0eb	rsyslog-8.8.0.tar.gz
diff --git a/package/rsyslog/rsyslog.mk b/package/rsyslog/rsyslog.mk
index 1e0953f..c6758eb 100644
--- a/package/rsyslog/rsyslog.mk
+++ b/package/rsyslog/rsyslog.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RSYSLOG_VERSION = 8.7.0
+RSYSLOG_VERSION = 8.8.0
 RSYSLOG_SITE = http://rsyslog.com/files/download/rsyslog
 RSYSLOG_LICENSE = GPLv3 LGPLv3 Apache-2.0
 RSYSLOG_LICENSE_FILES = COPYING COPYING.LESSER COPYING.ASL20
