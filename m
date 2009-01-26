From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Mon, 26 Jan 2009 05:51:33 +0000 (UTC)
Subject: [Buildroot] svn commit:
	trunk/buildroot/package/database/mysql_client
Message-ID: <20090126055134.01202768D3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-01-26 05:51:31 +0000 (Mon, 26 Jan 2009)
New Revision: 25042

Log:
mysql_client: fix deps and clean up configure args

mysql client needs ncurses, readline and C++

Modified:
   trunk/buildroot/package/database/mysql_client/Config.in
   trunk/buildroot/package/database/mysql_client/mysql_client.mk


Changeset:
Modified: trunk/buildroot/package/database/mysql_client/Config.in
===================================================================
--- trunk/buildroot/package/database/mysql_client/Config.in	2009-01-26 00:34:02 UTC (rev 25041)
+++ trunk/buildroot/package/database/mysql_client/Config.in	2009-01-26 05:51:31 UTC (rev 25042)
@@ -1,4 +1,10 @@
 config BR2_PACKAGE_MYSQL_CLIENT
 	bool "MySQL 5.1 client"
+	depends on BR2_INSTALL_LIBSTDCPP
+	select BR2_PACKAGE_NCURSES
+	select BR2_READLINE
 	help
 	  MySQL client
+
+comment "Mysql client requires a toolchain with C++ support enabled"
+	depends on !BR2_INSTALL_LIBSTDCPP

Modified: trunk/buildroot/package/database/mysql_client/mysql_client.mk
===================================================================
--- trunk/buildroot/package/database/mysql_client/mysql_client.mk	2009-01-26 00:34:02 UTC (rev 25041)
+++ trunk/buildroot/package/database/mysql_client/mysql_client.mk	2009-01-26 05:51:31 UTC (rev 25042)
@@ -8,21 +8,18 @@
 MYSQL_CLIENT_SITE = http://mirrors.24-7-solutions.net/pub/mysql/Downloads/MySQL-5.1
 MYSQL_CLIENT_INSTALL_TARGET = YES
 MYSQL_CLIENT_INSTALL_STAGING = YES
-MYSQL_CLIENT_DEPENDENCIES = uclibc readline
+MYSQL_CLIENT_DEPENDENCIES = uclibc readline ncurses
 
 MYSQL_CLIENT_CONF_ENV = ac_cv_sys_restartable_syscalls=yes
 MYSQL_CLIENT_CONF_OPT = \
-	--target=$(GNU_TARGET_NAME) \
-	--host=$(GNU_TARGET_NAME) \
-	--build=$(GNU_HOST_NAME) \
 	--program-prefix="" \
-	--prefix=/usr \
 	--without-ndb-binlog \
 	--without-server \
 	--without-docs \
 	--without-man \
 	--without-readline \
 	--without-libedit \
+	--with-readline=$(STAGING_DIR)/usr \
 	--with-low-memory \
 	--enable-thread-safe-client \
 	$(ENABLE_DEBUG)
