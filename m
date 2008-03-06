From: ninevoltz at uclibc.org <ninevoltz@uclibc.org>
Date: Thu,  6 Mar 2008 10:21:33 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/php
Message-ID: <20080306182133.D53F6120255@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ninevoltz
Date: 2008-03-06 10:21:33 -0800 (Thu, 06 Mar 2008)
New Revision: 21220

Log:
enhancements for php

Added:
   trunk/buildroot/package/php/Config.ext

Modified:
   trunk/buildroot/package/php/Config.in
   trunk/buildroot/package/php/php.mk


Changeset:
Added: trunk/buildroot/package/php/Config.ext
===================================================================
--- trunk/buildroot/package/php/Config.ext	                        (rev 0)
+++ trunk/buildroot/package/php/Config.ext	2008-03-06 18:21:33 UTC (rev 21220)
@@ -0,0 +1,173 @@
+menu "PHP Extensions"
+
+config BR2_PACKAGE_PHP_EXT_SOCKETS
+	bool "socket"
+	depends on BR2_PACKAGE_PHP
+	default n
+	help
+	  Sockets support
+
+config BR2_PACKAGE_PHP_EXT_POSIX
+	bool "posix"
+	depends on BR2_PACKAGE_PHP
+	default y
+	help
+	  POSIX support
+
+config BR2_PACKAGE_PHP_EXT_SPL
+	bool "SPL"
+	depends on BR2_PACKAGE_PHP
+	default y
+	help
+	  SPL support
+
+config BR2_PACKAGE_PHP_EXT_SESSION
+	bool "Session"
+	depends on BR2_PACKAGE_PHP
+	default y
+	help
+	  Session support
+
+config BR2_PACKAGE_PHP_EXT_OPENSSL
+        bool "openssl"
+        depends on BR2_PACKAGE_PHP && BR2_PACKAGE_OPENSSL
+        default n
+        help
+          openssl support
+
+config BR2_PACKAGE_PHP_EXT_LIBXML2
+        bool "xml2"
+        depends on BR2_PACKAGE_PHP && BR2_PACKAGE_LIBXML2
+        default y
+        help
+          xml support
+
+config BR2_PACKAGE_PHP_EXT_ZLIB
+        bool "zlib"
+        depends on BR2_PACKAGE_PHP && BR2_PACKAGE_ZLIB
+        default y
+        help
+          zlib support
+
+config BR2_PACKAGE_PHP_EXT_EXIF
+	bool "EXIF"
+	depends on BR2_PACKAGE_PHP
+	default n
+	help
+	  EXIF support
+
+config BR2_PACKAGE_PHP_EXT_FTP
+	bool "FTP"
+	depends on BR2_PACKAGE_PHP
+	default n
+	help
+	  FTP Support
+
+config BR2_PACKAGE_PHP_EXT_GETTEXT
+	bool "gettext"
+	depends on BR2_PACKAGE_PHP && BR2_PACKAGE_GETTEXT
+	default n
+	help
+	  gettext support
+
+config BR2_PACKAGE_PHP_EXT_GMP
+	bool "gmp"
+	depends on BR2_PACKAGE_PHP && BR2_PACKAGE_LIBGMP
+	default n
+	help
+	  GMP support
+
+config BR2_PACKAGE_PHP_EXT_JSON
+	bool "JSON"
+	depends on BR2_PACKAGE_PHP
+	default n
+	help
+	  JSON support
+
+config BR2_PACKAGE_PHP_EXT_READLINE
+	bool "readline"
+	depends on BR2_PACKAGE_PHP && (BR2_PACKAGE_PHP_CLI || BR2_PACKAGE_PHP_CGI) && BR2_READLINE
+	default n
+	help
+	  readline support
+
+config BR2_PACKAGE_PHP_EXT_NCURSES
+	bool "ncurses"
+	depends on BR2_PACKAGE_PHP && (BR2_PACKAGE_PHP_CLI || BR2_PACKAGE_PHP_CGI) && BR2_PACKAGE_NCURSES
+	default n
+	help
+	  ncurses support
+
+config BR2_PACKAGE_PHP_EXT_SYSVMSG
+	bool "sysvmsg - System V Message queue"
+	depends on BR2_PACKAGE_PHP
+	default n
+	help
+	  System V Message queue support
+
+config BR2_PACKAGE_PHP_EXT_SYSVSEM
+	bool "sysvsem - System V Semaphores"
+	depends on BR2_PACKAGE_PHP
+	default n
+	help
+	  System V Sempahore support
+
+config BR2_PACKAGE_PHP_EXT_SYSVSHM
+	bool "sysvshm - System V Shared memory"
+	depends on BR2_PACKAGE_PHP
+	default n
+	help
+	  System V Shared memory support
+
+config BR2_PACKAGE_PHP_EXT_ZIP
+	bool "zip"
+	depends on BR2_PACKAGE_PHP
+	default n
+	help
+	  Zip Support
+
+config BR2_PACKAGE_PHP_EXT_FILTER
+	bool "filter"
+	depends on BR2_PACKAGE_PHP
+	default n
+	help
+	  Input filter support
+
+comment "Database extensions"
+
+config BR2_PACKAGE_PHP_EXT_SQLITE
+	bool "sqlite"
+	depends on BR2_PACKAGE_PHP
+	default y
+	help
+	  SQLite
+
+config BR2_PACKAGE_PHP_EXT_SQLITE_UTF8
+	bool "sqlite UTF8 support"
+	depends on BR2_PACKAGE_PHP && BR2_PACKAGE_PHP_EXT_SQLITE
+	default n
+	help
+	  UTF8 Support for sqlite
+
+config BR2_PACKAGE_PHP_EXT_PDO
+	bool "PDO"
+	depends on BR2_PACKAGE_PHP
+	default y
+	help
+	  PDO support
+
+config BR2_PACKAGE_PHP_EXT_PDO_SQLITE
+	bool "PDO_SQLite"
+	depends on BR2_PACKAGE_PHP && BR2_PACKAGE_PHP_EXT_PDO
+	default y
+	help
+	  SQLite support for PDO
+
+config BR2_PACKAGE_PHP_EXT_PDO_MYSQL
+	bool "PDO_MySQL"
+	depends on BR2_PACKAGE_PHP && BR2_PACKAGE_PHP_EXT_PDO
+	default n
+	help
+	  MySQL support for PDO
+
+endmenu

Modified: trunk/buildroot/package/php/Config.in
===================================================================
--- trunk/buildroot/package/php/Config.in	2008-03-06 18:21:04 UTC (rev 21219)
+++ trunk/buildroot/package/php/Config.in	2008-03-06 18:21:33 UTC (rev 21220)
@@ -31,24 +31,4 @@
         help
           fast cgi interface for php
 
-config BR2_PACKAGE_PHP_OPENSSL
-        bool "openssl support"
-        depends on BR2_PACKAGE_PHP && BR2_PACKAGE_OPENSSL
-        default y
-        help
-          openssl support
-
-config BR2_PACKAGE_PHP_XML2
-        bool "xml2 support"
-        depends on BR2_PACKAGE_PHP && BR2_PACKAGE_LIBXML2
-        default y
-        help
-          xml support
-
-config BR2_PACKAGE_PHP_ZLIB
-        bool "zlib support"
-        depends on BR2_PACKAGE_PHP && BR2_PACKAGE_ZLIB
-        default y
-        help
-          zlib support
-
+source "package/php/Config.ext"

Modified: trunk/buildroot/package/php/php.mk
===================================================================
--- trunk/buildroot/package/php/php.mk	2008-03-06 18:21:04 UTC (rev 21219)
+++ trunk/buildroot/package/php/php.mk	2008-03-06 18:21:33 UTC (rev 21220)
@@ -3,50 +3,122 @@
 # php
 #
 #############################################################
-PHP_VER:=5.2.3
+PHP_VER:=5.2.5
 PHP_SOURCE:=php-$(PHP_VER).tar.bz2
 PHP_SITE:=http://us.php.net/get/${PHP_SOURCE}/from/us2.php.net/mirror
 PHP_DIR:=$(BUILD_DIR)/php-$(PHP_VER)
 PHP_CAT=$(BZCAT)
 PHP_DEPS=
 PHP_TARGET_DEPS=
+PHP_CONFIGURE = $(ENABLE_DEBUG)
 
 ifneq ($(BR2_PACKAGE_PHP_CLI),y)
-	PHP_CLI="--disable-cli"
+	PHP_CONFIGURE+=--disable-cli
 else
-	PHP_CLI="--enable-cli"
+	PHP_CONFIGURE+=--enable-cli
 	PHP_TARGET_DEPS+=$(TARGET_DIR)/usr/bin/php
 endif
 
 ifneq ($(BR2_PACKAGE_PHP_CGI),y)
-	PHP_CGI=--disable-cgi
+	PHP_CONFIGURE+=--disable-cgi
 else
-	PHP_CGI=--enable-cgi
+	PHP_CONFIGURE=--enable-cgi
 	PHP_TARGET_DEPS+=$(TARGET_DIR)/usr/bin/php-cgi
 	ifeq ($(BR2_PACKAGE_PHP_FASTCGI),y)
-		PHP_CGI+=--enable-fastcgi
+		PHP_CONFIGURE+=--enable-fastcgi
 	endif
 endif
 
-ifeq ($(BR2_PACKAGE_PHP_OPENSSL),y)
-	PHP_OPENSSL="--with-openssl=$(STAGING_DIR)/usr"
+ifneq ($(BR2_INET_IPV6),y)
+	PHP_CONFIGURE+=--disable-ipv6
+endif
+
+### Extensions 
+ifeq ($(BR2_PACKAGE_PHP_EXT_SOCKETS),y)
+	PHP_CONFIGURE+=--enable-sockets
+endif
+ifeq ($(BR2_PACKAGE_PHP_EXT_POSIX),y)
+	PHP_CONFIGURE+=--enable-posix
+endif
+ifeq ($(BR2_PACKAGE_PHP_EXT_SPL),y)
+	PHP_CONFIGURE+=--enable-spl
+endif
+ifeq ($(BR2_PACKAGE_PHP_EXT_SESSION),y)
+	PHP_CONFIGURE+=--enable-session
+endif
+ifeq ($(BR2_PACKAGE_PHP_EXT_OPENSSL),y)
+	PHP_CONFIGURE+=--with-openssl=$(STAGING_DIR)/usr
 	PHP_DEPS+=openssl
 endif
-
-ifeq ($(BR2_PACKAGE_PHP_XML2),y)
-	PHP_XML=--enable-libxml \
+ifeq ($(BR2_PACKAGE_PHP_EXT_LIBXML2),y)
+	PHP_CONFIGURE+=--enable-libxml \
 		--with-libxml-dir=${STAGING_DIR}/usr \
 		 --enable-xml \
 		 --enable-xmlreader \
 		 --enable-xmlwriter
 	PHP_DEPS+=libxml2
 endif
-
-ifeq ($(BR2_PACKAGE_PHP_ZLIB),y)
-	PHP_ZLIB="--with-zlib=$(STAGING_DIR)/usr"
+ifeq ($(BR2_PACKAGE_PHP_EXT_ZLIB),y)
+	PHP_CONFIGURE+=--with-zlib=$(STAGING_DIR)/usr
 	PHP_DEPS+=zlib
 endif
+ifeq ($(BR2_PACKAGE_PHP_EXT_EXIF),y)
+	PHP_CONFIGURE+=--enable-exif
+endif
+ifeq ($(BR2_PACKAGE_PHP_EXT_FTP),y)
+	PHP_CONFIGURE+=--enable-ftp
+endif
+ifeq ($(BR2_PACKAGE_PHP_EXT_GETTEXT),y)
+	PHP_CONFIGURE+=--with-gettext=$(STAGING_DIR)/usr
+	PHP_DEPS+=gettext
+endif
+ifeq ($(BR2_PACKAGE_PHP_EXT_GMP),y)
+	PHP_CONFIGURE+=--with-gmp=$(STAGING_DIR)/usr
+	PHP_DEPS+=libgmp
+endif
+ifeq ($(BR2_PACKAGE_PHP_EXT_JSON),y)
+	PHP_CONFIGURE+=--enable-json
+endif
+ifeq ($(BR2_PACKAGE_PHP_EXT_READLINE),y)
+	PHP_CONFIGURE+=--with-readline=$(STAGING_DIR)/usr
+	PHP_DEPS+=readline
+endif
+ifeq ($(BR2_PACKAGE_PHP_EXT_NCURSES),y)
+	PHP_CONFIGURE+=--with-ncurses=$(STATING_DIR)/usr
+	PHP_DEPS+=ncurses
+endif
+ifeq ($(BR2_PACKAGE_PHP_EXT_SYSVMSG),y)
+	PHP_CONFIGURE+=--enable-sysvmsg
+endif
+ifeq ($(BR2_PACKAGE_PHP_EXT_SYSVSEM),y)
+	PHP_CONFIGURE+=--enable-sysvsem
+endif
+ifeq ($(BR2_PACKAGE_PHP_EXT_SYSVSHM),y)
+	PHP_CONFIGURE+=--enable-sysvshm
+endif
+ifeq ($(BR2_PACKAGE_PHP_EXT_ZIP),y)
+	PHP_CONFIGURE+=--enable-zip
+endif
+ifeq ($(BR2_PACKAGE_PHP_EXT_FILTER),y)
+	PHP_CONFIGURE+=--enable-filter
+endif
 
+### Database extensions
+ifeq ($(BR2_PACKAGE_PHP_EXT_SQLITE),y)
+	PHP_CONFIGURE+=--with-sql
+ifeq ($(BR2_PACKAGE_PHP_EXT_SQLITE_UTF8),y)
+	PHP_CONFIGURE+=--enable-sqlite-utf8
+endif
+endif
+ifeq ($(BR2_PACKAGE_PHP_EXT_PDO),y)
+	PHP_CONFIGURE+=--with-pdo
+ifeq ($(BR2_PACKAGE_PHP_EXT_PDO_SQLITE),y)
+	PHP_CONFIGURE+=--with-pdo-sqlite
+endif
+ifeq ($(BR2_PACKAGE_PHP_EXT_PDO_MYSQL),y)
+	PHP_CONFIGURE+=--with-pod-mysql
+endif
+endif
 
 $(DL_DIR)/$(PHP_SOURCE):
 	 $(WGET) -P $(DL_DIR) $(PHP_SITE)
@@ -62,7 +134,7 @@
 		$(TARGET_CONFIGURE_OPTS) \
 		$(TARGET_CONFIGURE_ARGS) \
 		CC=$(TARGET_CC) \
-		./configure \
+		./configure $(DISABLE_NLS) \
 		--target=$(GNU_TARGET_NAME) \
 		--host=$(GNU_TARGET_NAME) \
 		--build=$(GNU_HOST_NAME) \
@@ -78,19 +150,9 @@
 		--mandir=/usr/man \
 		--infodir=/usr/info \
 		--disable-all \
-		--enable-spl \
-		--enable-session \
-		--enable-sockets \
-		--enable-posix \
 		--with-pcre-regex \
 		--without-pear \
-		--disable-ipv6 \
-		$(DISABLE_NLS) \
-		$(PHP_OPENSSL) \
-		$(PHP_XML) \
-		$(PHP_CLI) \
-		$(PHP_CGI) \
-		$(PHP_ZLIB) \
+		$(PHP_CONFIGURE) \
 	)
 	touch $@
 
@@ -119,7 +181,7 @@
 
 php-clean:
 	rm -f $(PHP_DIR)/.configured $(PHP_DIR)/.built $(PHP_DIR)/.staged
-	rm -f $(TARGET_DIR)/usr/bin/php $(TARGET_DIR)/usr/bin/php-cgi
+	rm -f $(PHP_TARGET_DEPS)
 	rm -f $(STAGING_DIR)/usr/bin/php* $(STAGING_DIR)/usr/man/man1/php*
 	rm -rf $(STAGING_DIR)/usr/include/php
 	-$(MAKE) -C $(PHP_DIR) clean
