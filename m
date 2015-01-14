From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 14 Jan 2015 17:16:57 -0300
Subject: [Buildroot] [PATCH 2/2] rsyslog: enable sql support
In-Reply-To: <1421266617-9201-1-git-send-email-gustavo@zacarias.com.ar>
References: <1421266617-9201-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1421266617-9201-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Enable support for mysql and pgsql.
Patches sent upstream (pull request on github).

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 ...make-mysql-support-cross-compile-friendly.patch | 53 ++++++++++++++++++++++
 ...make-pgsql-support-cross-compile-friendly.patch | 53 ++++++++++++++++++++++
 package/rsyslog/rsyslog.mk                         | 14 ++++++
 3 files changed, 120 insertions(+)
 create mode 100644 package/rsyslog/0001-configure.ac-make-mysql-support-cross-compile-friendly.patch
 create mode 100644 package/rsyslog/0002-configure.ac-make-pgsql-support-cross-compile-friendly.patch

diff --git a/package/rsyslog/0001-configure.ac-make-mysql-support-cross-compile-friendly.patch b/package/rsyslog/0001-configure.ac-make-mysql-support-cross-compile-friendly.patch
new file mode 100644
index 0000000..74a144d
--- /dev/null
+++ b/package/rsyslog/0001-configure.ac-make-mysql-support-cross-compile-friendly.patch
@@ -0,0 +1,53 @@
+From b095b56b7cf96a5b1a5e411b6da14b5e9f237a43 Mon Sep 17 00:00:00 2001
+From: Gustavo Zacarias <gustavo@zacarias.com.ar>
+Date: Wed, 14 Jan 2015 10:07:50 -0300
+Subject: [PATCH] configure.ac: make mysql support cross-compile friendly
+
+When cross-compiling mysql_config shouldn't be expected to be in PATH
+since normally this would point to distribution mysql rather than cross,
+which can be of a totally different architecture.
+
+Change it so we can use ac_cv_prog_MYSQL_CONFIG to point to the real one.
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+---
+ configure.ac | 15 ++++++++-------
+ 1 file changed, 8 insertions(+), 7 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index ad7274c..4e662dc 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -547,21 +547,22 @@ AC_ARG_ENABLE(mysql,
+ )
+ if test "x$enable_mysql" = "xyes"; then
+   AC_CHECK_PROG(
+-    [HAVE_MYSQL_CONFIG],
++    [MYSQL_CONFIG],
+     [mysql_config],
+-    [yes],,,
++    [mysql_config],
++    [no],,
+   )
+-  if test "x${HAVE_MYSQL_CONFIG}" != "xyes"; then
+-    AC_MSG_FAILURE([mysql_config not found in PATH - usually a package named mysql-dev, libmysql-dev or similar, is missing - install it to fix this issue])
++  if test "x${MYSQL_CONFIG}" = "xno"; then
++    AC_MSG_FAILURE([mysql_config not found - usually a package named mysql-dev, libmysql-dev or similar, is missing - install it to fix this issue])
+   fi
+   AC_CHECK_LIB(
+     [mysqlclient],
+     [mysql_init],
+-    [MYSQL_CFLAGS=`mysql_config --cflags`
+-     MYSQL_LIBS=`mysql_config --libs`
++    [MYSQL_CFLAGS=`$MYSQL_CONFIG --cflags`
++     MYSQL_LIBS=`$MYSQL_CONFIG --libs`
+     ],
+     [AC_MSG_FAILURE([MySQL library is missing])],
+-    [`mysql_config --libs`]
++    [`$MYSQL_CONFIG --libs`]
+   )
+   AC_MSG_CHECKING(if we have mysql_library_init)
+   save_CFLAGS="$CFLAGS"
+-- 
+2.0.5
+
diff --git a/package/rsyslog/0002-configure.ac-make-pgsql-support-cross-compile-friendly.patch b/package/rsyslog/0002-configure.ac-make-pgsql-support-cross-compile-friendly.patch
new file mode 100644
index 0000000..6e253dd
--- /dev/null
+++ b/package/rsyslog/0002-configure.ac-make-pgsql-support-cross-compile-friendly.patch
@@ -0,0 +1,53 @@
+From 80f49958083b90869e2857eb3edb7367e66c6a72 Mon Sep 17 00:00:00 2001
+From: Gustavo Zacarias <gustavo@zacarias.com.ar>
+Date: Wed, 14 Jan 2015 10:11:42 -0300
+Subject: [PATCH] configure.ac: make pgsql support cross-compile friendly
+
+When cross-compiling pg_config shouldn't be expected to be in PATH
+since normally this would point to distribution pgsql rather than cross,
+which can be of a totally different architecture.
+
+Change it so we can use ac_cv_prog_PG_CONFIG to point to the real one.
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+---
+ configure.ac | 15 ++++++++-------
+ 1 file changed, 8 insertions(+), 7 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 4e662dc..6edaedd 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -598,21 +598,22 @@ AC_ARG_ENABLE(pgsql,
+ )
+ if test "x$enable_pgsql" = "xyes"; then
+   AC_CHECK_PROG(
+-    [HAVE_PGSQL_CONFIG],
++    [PG_CONFIG],
+     [pg_config],
+-    [yes],,,
++    [pg_config],
++    [no],,,
+   )
+-  if test "x${HAVE_PGSQL_CONFIG}" != "xyes"; then
+-    AC_MSG_FAILURE([pg_config not found in PATH])
++  if test "x${PG_CONFIG}" = "xno"; then
++    AC_MSG_FAILURE([pg_config not found])
+   fi
+   AC_CHECK_LIB(
+     [pq],
+     [PQconnectdb],
+-    [PGSQL_CFLAGS="-I`pg_config --includedir`"
+-     PGSQL_LIBS="-L`pg_config --libdir` -lpq"
++    [PGSQL_CFLAGS="-I`$PG_CONFIG --includedir`"
++     PGSQL_LIBS="-L`$PG_CONFIG --libdir` -lpq"
+     ],
+     [AC_MSG_FAILURE([PgSQL library is missing])],
+-    [-L`pg_config --libdir`]
++    [-L`$PG_CONFIG --libdir`]
+   )
+ fi
+ AM_CONDITIONAL(ENABLE_PGSQL, test x$enable_pgsql = xyes)
+-- 
+2.0.5
+
diff --git a/package/rsyslog/rsyslog.mk b/package/rsyslog/rsyslog.mk
index a45111d..39d5637 100644
--- a/package/rsyslog/rsyslog.mk
+++ b/package/rsyslog/rsyslog.mk
@@ -16,6 +16,8 @@ RSYSLOG_PLUGINS = imdiag imfile impstats imptcp \
 	pmaixforwardedfrom pmciscoios pmcisconames pmlastmsg pmsnare
 RSYSLOG_CONF_OPTS = --disable-generate-man-pages \
 	$(foreach x,$(call qstrip,$(RSYSLOG_PLUGINS)),--enable-$(x))
+# For mysql and pgsql support patches
+RSYSLOG_AUTORECONF = YES
 
 # Build after BusyBox
 ifeq ($(BR2_PACKAGE_BUSYBOX),y)
@@ -34,6 +36,18 @@ else
 	RSYSLOG_CONF_OPTS += --enable-libgcrypt=no
 endif
 
+ifeq ($(BR2_PACKAGE_MYSQL),y)
+	RSYSLOG_DEPENDENCIES += mysql
+	RSYSLOG_CONF_OPTS += --enable-mysql
+	RSYSLOG_CONF_ENV += ac_cv_prog_MYSQL_CONFIG=$(STAGING_DIR)/usr/bin/mysql_config
+endif
+
+ifeq ($(BR2_PACKAGE_POSTGRESQL),y)
+	RSYSLOG_DEPENDENCIES += postgresql
+	RSYSLOG_CONF_OPTS += --enable-pgsql
+	RSYSLOG_CONF_ENV += ac_cv_prog_PG_CONFIG=$(STAGING_DIR)/usr/bin/pg_config
+endif
+
 ifeq ($(BR2_PACKAGE_UTIL_LINUX_LIBUUID),y)
 	RSYSLOG_DEPENDENCIES += util-linux
 	RSYSLOG_CONF_OPTS += --enable-uuid
-- 
2.0.5
