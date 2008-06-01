From: antab at uclibc.org <antab@uclibc.org>
Date: Sun,  1 Jun 2008 11:08:49 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package: database
	database/mysql_client
Message-ID: <20080601180849.37DEE3C814@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: antab
Date: 2008-06-01 11:08:48 -0700 (Sun, 01 Jun 2008)
New Revision: 22165

Log:
Added database menu to config (maybe move the other databases under it to remove the mess from the main package menu)
Added mysql 5.1 client package, can be used to provide mysql support for PHP. Note: This package has only been tested on AVR32.


Added:
   trunk/buildroot/package/database/
   trunk/buildroot/package/database/Config.in
   trunk/buildroot/package/database/database.mk
   trunk/buildroot/package/database/mysql_client/
   trunk/buildroot/package/database/mysql_client/Config.in
   trunk/buildroot/package/database/mysql_client/mysql_client.mk

Modified:
   trunk/buildroot/package/Config.in


Changeset:
Modified: trunk/buildroot/package/Config.in
===================================================================
--- trunk/buildroot/package/Config.in	2008-06-01 18:04:13 UTC (rev 22164)
+++ trunk/buildroot/package/Config.in	2008-06-01 18:08:48 UTC (rev 22165)
@@ -127,6 +127,8 @@
 source "package/which/Config.in"
 endif
 
+source "package/database/Config.in"
+
 if !BR2_PACKAGE_BUSYBOX_HIDE_OTHERS
 # busybox has an editor
 

Added: trunk/buildroot/package/database/Config.in
===================================================================
--- trunk/buildroot/package/database/Config.in	                        (rev 0)
+++ trunk/buildroot/package/database/Config.in	2008-06-01 18:08:48 UTC (rev 22165)
@@ -0,0 +1,5 @@
+menu "Database"
+
+source "package/database/mysql_client/Config.in"
+
+endmenu

Added: trunk/buildroot/package/database/database.mk
===================================================================
--- trunk/buildroot/package/database/database.mk	                        (rev 0)
+++ trunk/buildroot/package/database/database.mk	2008-06-01 18:08:48 UTC (rev 22165)
@@ -0,0 +1 @@
+include package/database/*/*.mk

Added: trunk/buildroot/package/database/mysql_client/Config.in
===================================================================
--- trunk/buildroot/package/database/mysql_client/Config.in	                        (rev 0)
+++ trunk/buildroot/package/database/mysql_client/Config.in	2008-06-01 18:08:48 UTC (rev 22165)
@@ -0,0 +1,5 @@
+config BR2_PACKAGE_MYSQL_CLIENT
+	bool "MySQL 5.1 client"
+	default n
+	help
+	  MySQL 5.1 client

Added: trunk/buildroot/package/database/mysql_client/mysql_client.mk
===================================================================
--- trunk/buildroot/package/database/mysql_client/mysql_client.mk	                        (rev 0)
+++ trunk/buildroot/package/database/mysql_client/mysql_client.mk	2008-06-01 18:08:48 UTC (rev 22165)
@@ -0,0 +1,30 @@
+#############################################################
+#
+# MySQL 5.1 Client
+#
+#############################################################
+MYSQL_CLIENT_VERSION = 5.1.23-rc
+MYSQL_CLIENT_SOURCE = mysql-$(MYSQL_CLIENT_VERSION).tar.gz
+MYSQL_CLIENT_SITE = http://mirrors.24-7-solutions.net/pub/mysql/Downloads/MySQL-5.1
+MYSQL_CLIENT_INSTALL_TARGET = YES
+MYSQL_CLIENT_INSTALL_STAGING = YES
+MYSQL_CLIENT_DEPENDENCIES = uclibc readline
+
+MYSQL_CLIENT_CONF_ENV = ac_cv_sys_restartable_syscalls=yes
+MYSQL_CLIENT_CONF_OPT = \
+	--target=$(GNU_TARGET_NAME) \
+	--host=$(GNU_TARGET_NAME) \
+	--build=$(GNU_HOST_NAME) \
+	--program-prefix="" \
+	--prefix=/usr \
+	--without-ndb-binlog \
+	--without-server \
+	--without-docs \
+	--without-man \
+	--without-readline \
+	--without-libedit \
+	--with-low-memory \
+	--enable-thread-safe-client \
+	$(ENABLE_DEBUG)
+
+$(eval $(call AUTOTARGETS,package,mysql_client))
