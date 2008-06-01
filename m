From: antab at uclibc.org <antab@uclibc.org>
Date: Sun,  1 Jun 2008 11:04:13 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/php
Message-ID: <20080601180414.033A73C836@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: antab
Date: 2008-06-01 11:04:13 -0700 (Sun, 01 Jun 2008)
New Revision: 22164

Log:
Dump php to version 5.2.6 and add SimpleXML extension to config menu


Modified:
   trunk/buildroot/package/php/Config.ext
   trunk/buildroot/package/php/php.mk


Changeset:
Modified: trunk/buildroot/package/php/Config.ext
===================================================================
--- trunk/buildroot/package/php/Config.ext	2008-06-01 17:58:48 UTC (rev 22163)
+++ trunk/buildroot/package/php/Config.ext	2008-06-01 18:04:13 UTC (rev 22164)
@@ -29,19 +29,26 @@
 	  Session support
 
 config BR2_PACKAGE_PHP_EXT_OPENSSL
-        bool "openssl"
-        depends on BR2_PACKAGE_PHP && BR2_PACKAGE_OPENSSL
-        default n
-        help
-          openssl support
+	bool "openssl"
+	depends on BR2_PACKAGE_PHP && BR2_PACKAGE_OPENSSL
+	default n
+	help
+	  openssl support
 
 config BR2_PACKAGE_PHP_EXT_LIBXML2
-        bool "xml2"
-        depends on BR2_PACKAGE_PHP && BR2_PACKAGE_LIBXML2
-        default y
-        help
-          xml support
+	bool "xml2"
+	depends on BR2_PACKAGE_PHP && BR2_PACKAGE_LIBXML2
+	default y
+	help
+	  xml support
 
+config BR2_PACKAGE_PHP_EXT_SIMPLEXML
+	bool "simplexml"
+	depends on BR2_PACKAGE_PHP
+	select BR2_PACKAGE_PHP_EXIT_LIBXML2
+	help
+	  SimpleXML support
+
 config BR2_PACKAGE_PHP_EXT_ZLIB
         bool "zlib"
         depends on BR2_PACKAGE_PHP && BR2_PACKAGE_ZLIB

Modified: trunk/buildroot/package/php/php.mk
===================================================================
--- trunk/buildroot/package/php/php.mk	2008-06-01 17:58:48 UTC (rev 22163)
+++ trunk/buildroot/package/php/php.mk	2008-06-01 18:04:13 UTC (rev 22164)
@@ -3,7 +3,7 @@
 # php
 #
 #############################################################
-PHP_VER:=5.2.5
+PHP_VER:=5.2.6
 PHP_SOURCE:=php-$(PHP_VER).tar.bz2
 PHP_SITE:=http://us.php.net/get/${PHP_SOURCE}/from/us2.php.net/mirror
 PHP_DIR:=$(BUILD_DIR)/php-$(PHP_VER)
@@ -58,6 +58,9 @@
 		 --enable-xmlwriter
 	PHP_DEPS+=libxml2
 endif
+ifeq ($(BR2_PACKAGE_PHP_EXT_SIMPLEXML),y)
+	PHP_CONFIGURE+=--enable-simplexml
+endif
 ifeq ($(BR2_PACKAGE_PHP_EXT_ZLIB),y)
 	PHP_CONFIGURE+=--with-zlib=$(STAGING_DIR)/usr
 	PHP_DEPS+=zlib
@@ -105,20 +108,20 @@
 
 ### Database extensions
 ifeq ($(BR2_PACKAGE_PHP_EXT_SQLITE),y)
-	PHP_CONFIGURE+=--with-sql
+	PHP_CONFIGURE+=--with-sqlite
 ifeq ($(BR2_PACKAGE_PHP_EXT_SQLITE_UTF8),y)
 	PHP_CONFIGURE+=--enable-sqlite-utf8
 endif
 endif
 ifeq ($(BR2_PACKAGE_PHP_EXT_PDO),y)
+	PHP_CONFIGURE+=--enable-pdo
 ifeq ($(BR2_PACKAGE_PHP_EXT_PDO_SQLITE),y)
 	PHP_CONFIGURE+=--with-pdo-sqlite
 endif
 ifeq ($(BR2_PACKAGE_PHP_EXT_PDO_MYSQL),y)
-	PHP_CONFIGURE+=--with-pdo-mysql
+	PHP_CONFIGURE+=--with-pdo-mysql=$(STAGING_DIR)/usr
+	PHP_DEPS+=mysql_client
 endif
-else
-	PHP_CONFIGURE+=--without-pdo-sqlite
 endif
 
 $(DL_DIR)/$(PHP_SOURCE):
