From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Wed,  4 Mar 2009 20:58:09 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package/php
Message-ID: <20090304205809.37C707626E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-03-04 20:58:08 +0000 (Wed, 04 Mar 2009)
New Revision: 25531

Log:
php: convert to Makefile.autotools.in and other improvements

Patch by Gustavo Zacarias <gustavo@zacarias.com.ar>

Closes #5, #77, #141 and #143.

* Migrate php package to Makefile.autotools.in

* Make PCRE regex an option (previously forced on)

* Add calendar option from bug #77

* Add external sqlite3 option from bug #141
New option BR2_PACKAGE_PHP_PDO_SQLITE_EXTERNAL

* Add alternate php.ini configuration option from bug #5
Named BR2_PACKAGE_PHP_CONFIG and defaults to shipped config.
In most scenarios the shipped config isn't good enough, it has
a high memory limit for embedded for example.

* Changed some options from depends to select
Namely openssl, libxml2, zlib, gettext, gmp.

* Disabled some 'y' defaults to make things lighter by default
Namely libxml2, sqlite, pdo and pdo_sqlite.

* Made some of the extensions help text more verbose

Modified:
   trunk/buildroot/package/php/Config.ext
   trunk/buildroot/package/php/php.mk


Changeset:
Modified: trunk/buildroot/package/php/Config.ext
===================================================================
--- trunk/buildroot/package/php/Config.ext	2009-03-04 20:16:26 UTC (rev 25530)
+++ trunk/buildroot/package/php/Config.ext	2009-03-04 20:58:08 UTC (rev 25531)
@@ -1,5 +1,12 @@
 menu "PHP Extensions"
 
+config BR2_PACKAGE_PHP_CONFIG
+	string "PHP configuration file to use"
+	default "$(PHP_DIR)/php.ini-dist"
+	help
+	  If you want to use a different php.ini file define it here.
+	  Otherwise it'll just copy the default php.ini-dist from PHP.
+
 config BR2_PACKAGE_PHP_EXT_SOCKETS
 	bool "socket"
 	help
@@ -15,7 +22,7 @@
 	bool "SPL"
 	default y
 	help
-	  SPL support
+	  Standard PHP library support
 
 config BR2_PACKAGE_PHP_EXT_SESSION
 	bool "Session"
@@ -25,16 +32,15 @@
 
 config BR2_PACKAGE_PHP_EXT_OPENSSL
 	bool "openssl"
-	depends on BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_OPENSSL
 	help
 	  openssl support
 
 config BR2_PACKAGE_PHP_EXT_LIBXML2
 	bool "xml2"
-	depends on BR2_PACKAGE_LIBXML2
-	default y
+	select BR2_PACKAGE_LIBXML2
 	help
-	  xml support
+	  libxml2 support
 
 config BR2_PACKAGE_PHP_EXT_SIMPLEXML
 	bool "simplexml"
@@ -44,7 +50,7 @@
 
 config BR2_PACKAGE_PHP_EXT_ZLIB
         bool "zlib"
-        depends on BR2_PACKAGE_ZLIB
+        select BR2_PACKAGE_ZLIB
         default y
         help
           zlib support
@@ -61,20 +67,20 @@
 
 config BR2_PACKAGE_PHP_EXT_GETTEXT
 	bool "gettext"
-	depends on BR2_PACKAGE_GETTEXT
+	select BR2_PACKAGE_GETTEXT
 	help
 	  gettext support
 
 config BR2_PACKAGE_PHP_EXT_GMP
 	bool "gmp"
-	depends on BR2_PACKAGE_LIBGMP
+	select BR2_PACKAGE_LIBGMP
 	help
 	  GMP support
 
 config BR2_PACKAGE_PHP_EXT_JSON
 	bool "JSON"
 	help
-	  JSON support
+	  JavaScript Object Serialization support
 
 config BR2_PACKAGE_PHP_EXT_READLINE
 	bool "readline"
@@ -88,6 +94,11 @@
 	help
 	  ncurses support
 
+config BR2_PACKAGE_PHP_EXT_PCRE
+	bool "PCRE"
+	help
+	  Perl Compatible Regular Expressions support
+
 config BR2_PACKAGE_PHP_EXT_SYSVMSG
 	bool "sysvmsg - System V Message queue"
 	help
@@ -106,20 +117,24 @@
 config BR2_PACKAGE_PHP_EXT_ZIP
 	bool "zip"
 	help
-	  Zip Support
+	  Zip read/write support
 
 config BR2_PACKAGE_PHP_EXT_FILTER
 	bool "filter"
 	help
 	  Input filter support
 
+config BR2_PACKAGE_PHP_EXT_CALENDAR
+	bool "calendar"
+	help
+	  Calendar and event support
+
 comment "Database extensions"
 
 config BR2_PACKAGE_PHP_EXT_SQLITE
-	bool "sqlite"
-	default y
+	bool "SQLite"
 	help
-	  SQLite
+	  Legacy SQLite2 support
 
 config BR2_PACKAGE_PHP_EXT_SQLITE_UTF8
 	bool "sqlite UTF8 support"
@@ -129,22 +144,27 @@
 
 config BR2_PACKAGE_PHP_EXT_PDO
 	bool "PDO"
-	default y
 	help
-	  PDO support
+	  PHP Data Objects support
 
 config BR2_PACKAGE_PHP_EXT_PDO_SQLITE
 	bool "PDO_SQLite"
 	depends on BR2_PACKAGE_PHP_EXT_PDO
-	default y
 	help
-	  SQLite support for PDO
+	  SQLite driver for PDO
 
+config BR2_PACKAGE_PHP_EXT_PDO_SQLITE_EXTERNAL
+	bool "PDO_SQLite external"
+	depends on BR2_PACKAGE_PHP_EXT_PDO_SQLITE
+	select BR2_PACKAGE_SQLITE
+	help
+	  Use external sqlite3 library
+
 config BR2_PACKAGE_PHP_EXT_PDO_MYSQL
 	bool "PDO_MySQL"
 	depends on BR2_PACKAGE_PHP_EXT_PDO
 	select BR2_PACKAGE_MYSQL_CLIENT
 	help
-	  MySQL support for PDO
+	  PDO driver for MySQL
 
 endmenu

Modified: trunk/buildroot/package/php/php.mk
===================================================================
--- trunk/buildroot/package/php/php.mk	2009-03-04 20:16:26 UTC (rev 25530)
+++ trunk/buildroot/package/php/php.mk	2009-03-04 20:58:08 UTC (rev 25531)
@@ -3,209 +3,181 @@
 # php
 #
 #############################################################
-PHP_VER:=5.2.9
-PHP_SOURCE:=php-$(PHP_VER).tar.bz2
-PHP_SITE:=http://www.php.net/distributions
-PHP_DIR:=$(BUILD_DIR)/php-$(PHP_VER)
-PHP_CAT=$(BZCAT)
-PHP_DEPS=
-PHP_TARGET_DEPS=
-PHP_CONFIGURE = $(ENABLE_DEBUG)
 
+PHP_VERSION = 5.2.9
+PHP_SOURCE = php-$(PHP_VERSION).tar.bz2
+PHP_SITE = http://www.php.net/distributions
+PHP_INSTALL_STAGING = YES
+PHP_INSTALL_STAGING_OPT = INSTALL_ROOT=$(STAGING_DIR) install
+PHP_INSTALL_TARGET_OPT = INSTALL_ROOT=$(TARGET_DIR) install
+PHP_LIBTOOL_PATCH = NO
+PHP_DEPENDENCIES = uclibc
+PHP_CONF_OPT =	$(DISABLE_IPV6) \
+		--mandir=/usr/share/man \
+		--infodir=/usr/share/info \
+		--disable-all \
+		--without-pear \
+		--with-config-file-path=/etc \
+		--localstatedir=/var \
+
 ifneq ($(BR2_PACKAGE_PHP_CLI),y)
-	PHP_CONFIGURE+=--disable-cli
+	PHP_CONF_OPT += --disable-cli
 else
-	PHP_CONFIGURE+=--enable-cli
-	PHP_TARGET_DEPS+=$(TARGET_DIR)/usr/bin/php
+	PHP_CONF_OPT += --enable-cli
 endif
 
 ifneq ($(BR2_PACKAGE_PHP_CGI),y)
-	PHP_CONFIGURE+=--disable-cgi
+	PHP_CONF_OPT += --disable-cgi
 else
-	PHP_CONFIGURE=--enable-cgi
-	PHP_TARGET_DEPS+=$(TARGET_DIR)/usr/bin/php-cgi
+	PHP_CONF_OPT += --enable-cgi
 	ifeq ($(BR2_PACKAGE_PHP_FASTCGI),y)
-		PHP_CONFIGURE+=--enable-fastcgi
+		PHP_CONF_OPT += --enable-fastcgi
 	endif
 endif
 
-ifneq ($(BR2_INET_IPV6),y)
-	PHP_CONFIGURE+=--disable-ipv6
-endif
-
 ### Extensions
 ifeq ($(BR2_PACKAGE_PHP_EXT_SOCKETS),y)
-	PHP_CONFIGURE+=--enable-sockets
+	PHP_CONF_OPT += --enable-sockets
 endif
+
 ifeq ($(BR2_PACKAGE_PHP_EXT_POSIX),y)
-	PHP_CONFIGURE+=--enable-posix
+	PHP_CONF_OPT += --enable-posix
 endif
+
 ifeq ($(BR2_PACKAGE_PHP_EXT_SPL),y)
-	PHP_CONFIGURE+=--enable-spl
+	PHP_CONF_OPT += --enable-spl
 endif
+
 ifeq ($(BR2_PACKAGE_PHP_EXT_SESSION),y)
-	PHP_CONFIGURE+=--enable-session
+	PHP_CONF_OPT += --enable-session
 endif
+
 ifeq ($(BR2_PACKAGE_PHP_EXT_OPENSSL),y)
-	PHP_CONFIGURE+=--with-openssl=$(STAGING_DIR)/usr
-	PHP_DEPS+=openssl
+	PHP_CONF_OPT += --with-openssl=$(STAGING_DIR)/usr
+	PHP_DEPENDENCIES += openssl
 endif
+
 ifeq ($(BR2_PACKAGE_PHP_EXT_LIBXML2),y)
-	PHP_CONFIGURE+=--enable-libxml \
+	PHP_CONF_OPT += --enable-libxml \
 		--with-libxml-dir=${STAGING_DIR}/usr \
 		 --enable-xml \
 		 --enable-xmlreader \
 		 --enable-xmlwriter
-	PHP_DEPS+=libxml2
+	PHP_DEPENDENCIES += libxml2
 endif
+
 ifeq ($(BR2_PACKAGE_PHP_EXT_SIMPLEXML),y)
-	PHP_CONFIGURE+=--enable-simplexml
+	PHP_CONF_OPT += --enable-simplexml
 endif
+
 ifeq ($(BR2_PACKAGE_PHP_EXT_ZLIB),y)
-	PHP_CONFIGURE+=--with-zlib=$(STAGING_DIR)/usr
-	PHP_DEPS+=zlib
+	PHP_CONF_OPT += --with-zlib=$(STAGING_DIR)/usr
+	PHP_DEPENDENCIES += zlib
 endif
+
 ifeq ($(BR2_PACKAGE_PHP_EXT_EXIF),y)
-	PHP_CONFIGURE+=--enable-exif
+	PHP_CONF_OPT += --enable-exif
 endif
+
 ifeq ($(BR2_PACKAGE_PHP_EXT_FTP),y)
-	PHP_CONFIGURE+=--enable-ftp
+	PHP_CONF_OPT += --enable-ftp
 endif
+
 ifeq ($(BR2_PACKAGE_PHP_EXT_GETTEXT),y)
-	PHP_CONFIGURE+=--with-gettext=$(STAGING_DIR)/usr
-	PHP_DEPS+=gettext
+	PHP_CONF_OPT += --with-gettext=$(STAGING_DIR)/usr
+	PHP_DEPENDENCIES += gettext
 endif
+
 ifeq ($(BR2_PACKAGE_PHP_EXT_GMP),y)
-	PHP_CONFIGURE+=--with-gmp=$(STAGING_DIR)/usr
-	PHP_DEPS+=libgmp
+	PHP_CONF_OPT += --with-gmp=$(STAGING_DIR)/usr
+	PHP_DEPENDENCIES += libgmp
 endif
+
 ifeq ($(BR2_PACKAGE_PHP_EXT_JSON),y)
-	PHP_CONFIGURE+=--enable-json
+	PHP_CONF_OPT += --enable-json
 endif
+
 ifeq ($(BR2_PACKAGE_PHP_EXT_READLINE),y)
-	PHP_CONFIGURE+=--with-readline=$(STAGING_DIR)/usr
-	PHP_DEPS+=readline
+	PHP_CONF_OPT += --with-readline=$(STAGING_DIR)/usr
+	PHP_DEPENDENCIES += readline
 endif
+
 ifeq ($(BR2_PACKAGE_PHP_EXT_NCURSES),y)
-	PHP_CONFIGURE+=--with-ncurses=$(STAGING_DIR)/usr
-	PHP_DEPS+=ncurses
+	PHP_CONF_OPT += --with-ncurses=$(STAGING_DIR)/usr
+	PHP_DEPENDENCIES += ncurses
 endif
+
 ifeq ($(BR2_PACKAGE_PHP_EXT_SYSVMSG),y)
-	PHP_CONFIGURE+=--enable-sysvmsg
+	PHP_CONF_OPT += --enable-sysvmsg
 endif
+
 ifeq ($(BR2_PACKAGE_PHP_EXT_SYSVSEM),y)
-	PHP_CONFIGURE+=--enable-sysvsem
+	PHP_CONF_OPT += --enable-sysvsem
 endif
+
 ifeq ($(BR2_PACKAGE_PHP_EXT_SYSVSHM),y)
-	PHP_CONFIGURE+=--enable-sysvshm
+	PHP_CONF_OPT += --enable-sysvshm
 endif
+
 ifeq ($(BR2_PACKAGE_PHP_EXT_ZIP),y)
-	PHP_CONFIGURE+=--enable-zip
+	PHP_CONF_OPT += --enable-zip
 endif
+
 ifeq ($(BR2_PACKAGE_PHP_EXT_FILTER),y)
-	PHP_CONFIGURE+=--enable-filter
+	PHP_CONF_OPT += --enable-filter
 endif
 
-### Database extensions
+ifeq ($(BR2_PACKAGE_PHP_EXT_CALENDAR),y)
+	PHP_CONF_OPT += --enable-calendar
+endif
+
+ifeq ($(BR2_PACKAGE_PHP_EXT_PCRE),y)
+	PHP_CONF_OPT += --with-pcre-regex
+endif
+
+### Legacy sqlite2 support
 ifeq ($(BR2_PACKAGE_PHP_EXT_SQLITE),y)
-	PHP_CONFIGURE+=--with-sqlite
+	PHP_CONF_OPT += --with-sqlite
 ifneq ($(BR2_LARGEFILE),y)
-	PHP_CFLAGS+= -DSQLITE_DISABLE_LFS
+	PHP_CONF_ENV += CFLAGS+=" -DSQLITE_DISABLE_LFS"
 endif
 ifeq ($(BR2_PACKAGE_PHP_EXT_SQLITE_UTF8),y)
-	PHP_CONFIGURE+=--enable-sqlite-utf8
+	PHP_CONF_OPT += --enable-sqlite-utf8
 endif
 endif
+
+### PDO
 ifeq ($(BR2_PACKAGE_PHP_EXT_PDO),y)
-	PHP_CONFIGURE+=--enable-pdo
+	PHP_CONF_OPT += --enable-pdo
 ifeq ($(BR2_PACKAGE_PHP_EXT_PDO_SQLITE),y)
-	PHP_CONFIGURE+=--with-pdo-sqlite
-	PHP_CFLAGS+= -DSQLITE_OMIT_LOAD_EXTENSION
+ifeq ($(BR2_PACKAGE_PHP_EXT_PDO_SQLITE_EXTERNAL),y)
+	PHP_CONF_OPT += --with-pdo-sqlite=$(STAGING_DIR)/usr
+else
+	PHP_CONF_OPT += --with-pdo-sqlite
 endif
+	PHP_CONF_ENV += CFLAGS+=" -DSQLITE_OMIT_LOAD_EXTENSION"
+endif
 ifeq ($(BR2_PACKAGE_PHP_EXT_PDO_MYSQL),y)
-	PHP_CONFIGURE+=--with-pdo-mysql=$(STAGING_DIR)/usr
-	PHP_DEPS+=mysql_client
+	PHP_CONF_OPT += --with-pdo-mysql=$(STAGING_DIR)/usr
+	PHP_DEPENDENCIES += mysql_client
 endif
 endif
 
-$(DL_DIR)/$(PHP_SOURCE):
-	$(call DOWNLOAD,$(PHP_SITE),$(PHP_SOURCE))
+$(eval $(call AUTOTARGETS,package,php))
 
-php-source: $(DL_DIR)/$(PHP_SOURCE)
+$(PHP_HOOK_POST_INSTALL):
+	rm -rf $(TARGET_DIR)/usr/lib/php
+	rm -f $(TARGET_DIR)/usr/bin/phpize
+	rm -f $(TARGET_DIR)/usr/bin/php-config
+	$(INSTALL) -m 0755 $(BR2_PACKAGE_PHP_CONFIG) $(TARGET_DIR)/etc/php.ini
 
-$(PHP_DIR)/.unpacked: $(DL_DIR)/$(PHP_SOURCE)
-	$(PHP_CAT) $(DL_DIR)/$(PHP_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	toolchain/patch-kernel.sh $(PHP_DIR) package/php/ php\*.patch
-	toolchain/patch-kernel.sh $(PHP_DIR) package/php/ php\*.patch.$(ARCH)
-	touch $@
-
-$(PHP_DIR)/.configured: $(PHP_DIR)/.unpacked
-	(cd $(PHP_DIR); rm -rf config.cache; \
-		$(TARGET_CONFIGURE_OPTS) \
-		$(TARGET_CONFIGURE_ARGS) \
-		CC=$(TARGET_CC) \
-		./configure \
-		--target=$(GNU_TARGET_NAME) \
-		--host=$(GNU_TARGET_NAME) \
-		--build=$(GNU_HOST_NAME) \
-		--prefix=/usr \
-		--exec-prefix=/ \
-		--bindir=/usr/bin \
-		--sbindir=/usr/sbin \
-		--libexecdir=/usr/lib \
-		--sysconfdir=/etc \
-		--with-config-file-path=/etc \
-		--datadir=/usr/share/misc \
-		--localstatedir=/var \
-		--mandir=/usr/man \
-		--infodir=/usr/info \
-		--disable-all \
-		--with-pcre-regex \
-		--without-pear \
-		$(PHP_CONFIGURE) \
-	)
-	touch $@
-
-$(PHP_DIR)/.built: $(PHP_DIR)/.configured
-	$(MAKE) CC="$(TARGET_CC) $(PHP_CFLAGS)" -C $(PHP_DIR)
-	touch $@
-
-$(PHP_DIR)/.staged: $(PHP_DIR)/.built
-	$(MAKE) DESTDIR=$(STAGING_DIR) INSTALL_ROOT=$(STAGING_DIR) CC=$(TARGET_CC) -C $(PHP_DIR) install
-	touch $@
-
-$(TARGET_DIR)/usr/bin/php: $(PHP_DIR)/.staged
-	cp -dpf $(STAGING_DIR)/usr/bin/php $(TARGET_DIR)/usr/bin/php
-	chmod 755 $(TARGET_DIR)/usr/bin/php
-	$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/bin/php
-
-$(TARGET_DIR)/usr/bin/php-cgi: $(PHP_DIR)/.staged
-	cp -dpf $(STAGING_DIR)/usr/bin/php-cgi $(TARGET_DIR)/usr/bin/php-cgi
-	chmod 755 $(TARGET_DIR)/usr/bin/php-cgi
-	$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/bin/php-cgi
-
-$(TARGET_DIR)/etc/php.ini: $(PHP_DIR)/.staged
-	cp -f $(PHP_DIR)/php.ini-dist $(TARGET_DIR)/etc/php.ini
-
-php: uclibc $(PHP_DEPS) $(PHP_TARGET_DEPS) $(TARGET_DIR)/etc/php.ini
-
-php-unpacked: $(PHP_DIR)/.unpacked
-
-php-clean:
-	rm -f $(PHP_DIR)/.configured $(PHP_DIR)/.built $(PHP_DIR)/.staged
-	rm -f $(PHP_TARGET_DEPS)
-	rm -f $(STAGING_DIR)/usr/bin/php* $(STAGING_DIR)/usr/man/man1/php*
+$(PHP_TARGET_UNINSTALL):
+	$(call MESSAGE,"Uninstalling")
 	rm -rf $(STAGING_DIR)/usr/include/php
-	-$(MAKE) -C $(PHP_DIR) clean
+	rm -rf $(STAGING_DIR)/usr/lib/php
+	rm -f $(STAGING_DIR)/usr/bin/php*
+	rm -f $(STAGING_DIR)/usr/share/man/man1/php*.1
+	rm -f $(TARGET_DIR)/etc/php.ini
+	rm -f $(TARGET_DIR)/usr/bin/php*
+	rm -f $(PHP_TARGET_INSTALL_TARGET) $(PHP_HOOK_POST_INSTALL)
 
-php-dirclean:
-	rm -rf $(PHP_DIR)
-
-#############################################################
-#
-# Toplevel Makefile options
-#
-#############################################################
-ifeq ($(BR2_PACKAGE_PHP),y)
-TARGETS+=php
-endif
