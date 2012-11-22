From: Samuel Martin <s.martin49@gmail.com>
Date: Thu, 22 Nov 2012 01:18:02 +0100
Subject: [Buildroot] [PATCH 12/33] sconeserver: fix configure.in
In-Reply-To: <1353543503-8952-1-git-send-email-s.martin49@gmail.com>
References: <1353543503-8952-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1353543503-8952-13-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Prevent from having '-I/usr/include/mysql' appended to the cflags during
the configuration phase.

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
---
 ...n-do-not-hardcode-mysql-include-directory.patch | 27 ++++++++++++++++++++++
 package/sconeserver/sconeserver.mk                 |  2 ++
 2 files changed, 29 insertions(+)
 create mode 100644 package/sconeserver/sconeserver-180-configure.in-do-not-hardcode-mysql-include-directory.patch

diff --git a/package/sconeserver/sconeserver-180-configure.in-do-not-hardcode-mysql-include-directory.patch b/package/sconeserver/sconeserver-180-configure.in-do-not-hardcode-mysql-include-directory.patch
new file mode 100644
index 0000000..9388d21
--- /dev/null
+++ b/package/sconeserver/sconeserver-180-configure.in-do-not-hardcode-mysql-include-directory.patch
@@ -0,0 +1,27 @@
+From 79aafd560037537baba3f08e9ed15a2b926a16de Mon Sep 17 00:00:00 2001
+From: Samuel Martin <s.martin49@gmail.com>
+Date: Sat, 17 Nov 2012 20:18:51 +0100
+Subject: [PATCH 1/1] configure.in: do not hardcode mysql include directory
+
+
+Signed-off-by: Samuel Martin <s.martin49@gmail.com>
+---
+ configure.in | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.in b/configure.in
+index 936130f..bc15ef2 100644
+--- a/configure.in
++++ b/configure.in
+@@ -234,7 +234,7 @@ AC_ARG_WITH([mysql],
+ # Need mysqlclient library for mysql
+ if test "x$MYSQL" == "xyes"; then
+   AC_CHECK_LIB([mysqlclient],[mysql_init],
+-    [CXXFLAGS="$CXXFLAGS -I/usr/include/mysql"
++    [CXXFLAGS="$CXXFLAGS"
+      MYSQL_LIBADD="-lmysqlclient"
+      AC_SUBST(MYSQL_LIBADD)],
+     [AC_MSG_ERROR([library 'mysqlclient' is required for the mysql module])]
+-- 
+1.8.0
+
diff --git a/package/sconeserver/sconeserver.mk b/package/sconeserver/sconeserver.mk
index 15a1edc..d6c9639 100644
--- a/package/sconeserver/sconeserver.mk
+++ b/package/sconeserver/sconeserver.mk
@@ -13,6 +13,8 @@ SCONESERVER_SITE_METHOD = svn
 SCONESERVER_LICENSE = GPLv2+
 SCONESERVER_LICENSE_FILES = COPYING
 
+SCONESERVER_AUTORECONF = YES
+
 SCONESERVER_DEPENDENCIES += pcre
 SCONESERVER_CONF_OPT += --with-ip --with-local
 
-- 
1.8.0
