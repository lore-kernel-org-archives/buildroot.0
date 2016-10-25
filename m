From: Peter Seiderer <ps.report@gmx.net>
Date: Tue, 25 Oct 2016 21:37:20 +0200
Subject: [Buildroot] [PATCH v1] motion: fix static linking of mysql with
	enabled libz library
Message-ID: <1477424240-3672-1-git-send-email-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes ([1]):

  checking for mysql_init in -lmysqlclient... no
  configure: error: MySQL support can't build without MySQL libraries

[1] http://autobuild.buildroot.net/results/6cf/6cf38698a2a9a041ff375c01ae8898eace17cfb2

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
Checked with motion 3.4.1 and 4.0.1.
---
 ...c-use-given-CFLAGS-LIBS-for-mysqlclient-l.patch | 31 ++++++++++++++++++++++
 package/motion/motion.mk                           |  6 ++++-
 2 files changed, 36 insertions(+), 1 deletion(-)
 create mode 100644 package/motion/0001-configure.ac-use-given-CFLAGS-LIBS-for-mysqlclient-l.patch

diff --git a/package/motion/0001-configure.ac-use-given-CFLAGS-LIBS-for-mysqlclient-l.patch b/package/motion/0001-configure.ac-use-given-CFLAGS-LIBS-for-mysqlclient-l.patch
new file mode 100644
index 0000000..4211fe6
--- /dev/null
+++ b/package/motion/0001-configure.ac-use-given-CFLAGS-LIBS-for-mysqlclient-l.patch
@@ -0,0 +1,31 @@
+From 5a1081d36bf2861ffc882354c583a0eb6b0ee3d5 Mon Sep 17 00:00:00 2001
+From: Peter Seiderer <ps.report@gmx.net>
+Date: Tue, 25 Oct 2016 21:27:41 +0200
+Subject: [PATCH] configure.ac: use given CFLAGS/LIBS for mysqlclient library
+ check
+
+Needed for static linking of mysql with enabled libz.
+
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+---
+ configure.ac | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 5782fd6..aa5d9dd 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -618,8 +618,8 @@ else
+ 		#LDFLAGS="-L$MYSQL_LIBDIR"
+ 		saved_CFLAGS=$CFLAGS
+ 		saved_LIBS=$LIBS
+-		CFLAGS="-I$MYSQL_INCDIR"
+-		LIBS="-L$MYSQL_LIBDIR"
++		CFLAGS="-I$MYSQL_INCDIR $CFLAGS"
++		LIBS="-L$MYSQL_LIBDIR $LIBS"
+ 		AC_CHECK_LIB(mysqlclient,mysql_init,[
+ 					TEMP_LIBS="$TEMP_LIBS -L$MYSQL_LIBDIR -lmysqlclient -lz"
+ 					TEMP_CFLAGS="$TEMP_CFLAGS -I$MYSQL_INCDIR"
+-- 
+2.8.1
+
diff --git a/package/motion/motion.mk b/package/motion/motion.mk
index 49c0c6a..d27def2 100644
--- a/package/motion/motion.mk
+++ b/package/motion/motion.mk
@@ -9,7 +9,7 @@ MOTION_SITE = $(call github,Motion-Project,motion,$(MOTION_VERSION))
 MOTION_LICENSE = GPLv2
 MOTION_LICENSE_FILES = COPYING
 MOTION_DEPENDENCIES = host-pkgconf jpeg
-# From git
+# From git and patched configure.ac
 MOTION_AUTORECONF = YES
 
 # motion does not use any specific function of jpeg-turbo, so just relies on
@@ -29,6 +29,10 @@ MOTION_CONF_OPTS += \
 	--with-mysql \
 	--with-mysql-include=$(STAGING_DIR)/usr/include/mysql \
 	--with-mysql-lib=$(STAGING_DIR)/usr/lib
+# static link of mysql needs -lz
+ifeq ($(BR2_STATIC_LIBS)$(BR2_PACKAGE_ZLIB),yy)
+MOTION_CONF_ENV += LIBS="-lz"
+endif
 else
 MOTION_CONF_OPTS += --without-mysql
 endif
-- 
2.8.1
