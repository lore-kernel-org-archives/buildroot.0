From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Sat, 21 Feb 2009 09:06:44 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package/php
Message-ID: <20090221090644.DBFBC76564@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-02-21 09:06:43 +0000 (Sat, 21 Feb 2009)
New Revision: 25405

Log:
php: fix sqlite module

- php comes with it's own embedded sqlite, so no need to select sqlite
- disable largefile support for !BR2_LARGEFILE
- php somehow forgets to link with -ldl, breaking the sqlite extension.
  Fix it by disabling the (unused?) modload support in sqlite.

Modified:
   trunk/buildroot/package/php/Config.ext
   trunk/buildroot/package/php/php.mk


Changeset:
Modified: trunk/buildroot/package/php/Config.ext
===================================================================
--- trunk/buildroot/package/php/Config.ext	2009-02-20 21:55:32 UTC (rev 25404)
+++ trunk/buildroot/package/php/Config.ext	2009-02-21 09:06:43 UTC (rev 25405)
@@ -131,7 +131,6 @@
 config BR2_PACKAGE_PHP_EXT_SQLITE
 	bool "sqlite"
 	depends on BR2_PACKAGE_PHP
-	select BR2_PACKAGE_SQLITE
 	default y
 	help
 	  SQLite

Modified: trunk/buildroot/package/php/php.mk
===================================================================
--- trunk/buildroot/package/php/php.mk	2009-02-20 21:55:32 UTC (rev 25404)
+++ trunk/buildroot/package/php/php.mk	2009-02-21 09:06:43 UTC (rev 25405)
@@ -109,7 +109,9 @@
 ### Database extensions
 ifeq ($(BR2_PACKAGE_PHP_EXT_SQLITE),y)
 	PHP_CONFIGURE+=--with-sqlite
-	PHP_DEPS+=sqlite
+ifneq ($(BR2_LARGEFILE),y)
+	PHP_CFLAGS+= -DSQLITE_DISABLE_LFS
+endif
 ifeq ($(BR2_PACKAGE_PHP_EXT_SQLITE_UTF8),y)
 	PHP_CONFIGURE+=--enable-sqlite-utf8
 endif
@@ -118,6 +120,7 @@
 	PHP_CONFIGURE+=--enable-pdo
 ifeq ($(BR2_PACKAGE_PHP_EXT_PDO_SQLITE),y)
 	PHP_CONFIGURE+=--with-pdo-sqlite
+	PHP_CFLAGS+= -DSQLITE_OMIT_LOAD_EXTENSION
 endif
 ifeq ($(BR2_PACKAGE_PHP_EXT_PDO_MYSQL),y)
 	PHP_CONFIGURE+=--with-pdo-mysql=$(STAGING_DIR)/usr
@@ -164,7 +167,7 @@
 	touch $@
 
 $(PHP_DIR)/.built: $(PHP_DIR)/.configured
-	$(MAKE) CC=$(TARGET_CC) -C $(PHP_DIR)
+	$(MAKE) CC="$(TARGET_CC) $(PHP_CFLAGS)" -C $(PHP_DIR)
 	touch $@
 
 $(PHP_DIR)/.staged: $(PHP_DIR)/.built
