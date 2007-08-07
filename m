From: ulf at uclibc.org <ulf@uclibc.org>
Date: Tue,  7 Aug 2007 10:47:04 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package:  php
Message-ID: <20070807174704.43F3BA6112@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-08-07 10:47:03 -0700 (Tue, 07 Aug 2007)
New Revision: 19417

Log:
Add php package

Added:
   trunk/buildroot/package/php/
   trunk/buildroot/package/php/Config.in
   trunk/buildroot/package/php/php.mk

Modified:
   trunk/buildroot/package/Config.in


Changeset:
Modified: trunk/buildroot/package/Config.in
===================================================================
--- trunk/buildroot/package/Config.in	2007-08-07 17:27:59 UTC (rev 19416)
+++ trunk/buildroot/package/Config.in	2007-08-07 17:47:03 UTC (rev 19417)
@@ -367,6 +367,7 @@
 source "package/python/Config.in"
 source "package/ruby/Config.in"
 source "package/tcl/Config.in"
+source "package/php/Config.in"
 endif
 
 endmenu

Added: trunk/buildroot/package/php/Config.in
===================================================================
--- trunk/buildroot/package/php/Config.in	                        (rev 0)
+++ trunk/buildroot/package/php/Config.in	2007-08-07 17:47:03 UTC (rev 19417)
@@ -0,0 +1,47 @@
+config BR2_PACKAGE_PHP
+	bool "php"
+	default n
+	help
+	  PHP  is a widely-used general-purpose scripting
+	  language that is especially suited for Web development
+	  and can be embedded into HTML.
+
+	  http://www.php.net
+
+config BR2_PACKAGE_PHP_CLI
+        bool "cli interface"
+        depends on BR2_PACKAGE_PHP
+        default y
+        help
+          command line interface for php. 
+          you must have at least cli or cgi selected.
+
+config BR2_PACKAGE_PHP_CGI
+        bool "cgi interface"
+        depends on BR2_PACKAGE_PHP
+        default y
+        help
+          cgi interface for php
+          you must have at least cli or cgi selected.
+
+config BR2_PACKAGE_PHP_OPENSSL
+        bool "openssl support"
+        depends on BR2_PACKAGE_PHP && BR2_PACKAGE_OPENSSL
+        default y
+        help
+          openssl support
+
+config BR2_PACKAGE_PHP_XML2
+        bool "xml2 support"
+        depends on BR2_PACKAGE_PHP && BR2_PACKAGE_LIBXML2
+        default y
+        help
+          xml support
+
+config BR2_PACKAGE_PHP_ZLIB
+        bool "zlib support"
+        depends on BR2_PACKAGE_PHP && BR2_PACKAGE_ZLIB
+        default y
+        help
+          zlib support
+

Added: trunk/buildroot/package/php/php.mk
===================================================================
--- trunk/buildroot/package/php/php.mk	                        (rev 0)
+++ trunk/buildroot/package/php/php.mk	2007-08-07 17:47:03 UTC (rev 19417)
@@ -0,0 +1,127 @@
+#############################################################
+#
+# php
+#
+#############################################################
+PHP_VER:=5.2.3
+PHP_SOURCE:=php-$(PHP_VER).tar.bz2
+PHP_SITE:=http://us.php.net/get/${PHP_SOURCE}/from/us2.php.net/mirror
+PHP_DIR:=$(BUILD_DIR)/php-$(PHP_VER)
+PHP_CAT=bzcat
+PHP_DEPS=
+PHP_TARGET_DEPS=
+
+ifneq ($(BR2_PACKAGE_PHP_CLI),y)
+	PHP_CLI="--disable-cli"
+else
+	PHP_CLI="--enable-cli"
+	PHP_TARGET_DEPS+=$(TARGET_DIR)/usr/bin/php
+endif
+
+ifneq ($(BR2_PACKAGE_PHP_CGI),y)
+	PHP_CGI="--disable-cgi"
+else
+	PHP_CGI="--enable-cgi"
+	PHP_TARGET_DEPS+=$(TARGET_DIR)/usr/bin/php-cgi
+endif
+
+ifeq ($(BR2_PACKAGE_PHP_OPENSSL),y)
+	PHP_OPENSSL="--with-openssl=$(STAGING_DIR)/usr"
+	PHP_DEPS+=openssl
+endif
+
+ifeq ($(BR2_PACKAGE_PHP_XML2),y)
+	PHP_XML=--enable-libxml \
+		--with-libxml-dir=${STAGING_DIR}/usr \
+		 --enable-xml \
+		 --enable-xmlreader \
+		 --enable-xmlwriter
+	PHP_DEPS+=libxml2
+endif
+
+ifeq ($(BR2_PACKAGE_PHP_ZLIB),y)
+	PHP_ZLIB="--with-zlib=$(STAGING_DIR)/usr"
+	PHP_DEPS+=zlib
+endif
+
+
+$(DL_DIR)/$(PHP_SOURCE):
+	 $(WGET) -P $(DL_DIR) $(PHP_SITE)
+
+php-source: $(DL_DIR)/$(PHP_SOURCE)
+
+$(PHP_DIR)/.unpacked: $(DL_DIR)/$(PHP_SOURCE)
+	$(PHP_CAT) $(DL_DIR)/$(PHP_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
+	touch $(PHP_DIR)/.unpacked
+
+$(PHP_DIR)/.configured: $(PHP_DIR)/.unpacked
+	(cd $(PHP_DIR); rm -rf config.cache; \
+		$(TARGET_CONFIGURE_OPTS) \
+		$(TARGET_CONFIGURE_ARGS) \
+		CC=$(TARGET_CC) \
+		./configure \
+		--target=$(GNU_TARGET_NAME) \
+		--host=$(GNU_TARGET_NAME) \
+		--build=$(GNU_HOST_NAME) \
+		--prefix=/usr \
+		--exec-prefix=/ \
+		--bindir=/usr/bin \
+		--sbindir=/usr/sbin \
+		--libexecdir=/usr/lib \
+		--sysconfdir=/etc \
+		--datadir=/usr/share/misc \
+		--localstatedir=/var \
+		--mandir=/usr/man \
+		--infodir=/usr/info \
+		--disable-all \
+		--enable-spl \
+		--enable-session \
+		--enable-sockets \
+		--with-pcre-regex \
+		--without-pear \
+		--disable-ipv6 \
+		$(DISABLE_NLS) \
+		$(PHP_OPENSSL) \
+		$(PHP_XML) \
+		$(PHP_CLI) \
+		$(PHP_CGI) \
+		$(PHP_ZLIB) \
+	);
+	touch $(PHP_DIR)/.configured
+
+$(PHP_DIR)/.built: $(PHP_DIR)/.configured
+	$(MAKE) CC=$(TARGET_CC) -C $(PHP_DIR)
+	touch $(PHP_DIR)/.built
+
+$(PHP_DIR)/.staged: $(PHP_DIR)/.built
+	$(MAKE) DESTDIR=$(STAGING_DIR) INSTALL_ROOT=$(STAGING_DIR) CC=$(TARGET_CC) -C $(PHP_DIR) install
+	touch $(PHP_DIR)/.staged
+
+$(TARGET_DIR)/usr/bin/php: $(PHP_DIR)/.staged
+	cp -dpf $(STAGING_DIR)/usr/bin/php $(TARGET_DIR)/usr/bin/php
+	chmod 755 $(TARGET_DIR)/usr/bin/php
+
+$(TARGET_DIR)/usr/bin/php-cgi: $(PHP_DIR)/.staged
+	cp -dpf $(STAGING_DIR)/usr/bin/php-cgi $(TARGET_DIR)/usr/bin/php-cgi
+	chmod 755 $(TARGET_DIR)/usr/bin/php-cgi
+
+$(TARGET_DIR)/etc/php.ini: $(PHP_DIR)/.staged
+	cp $(PHP_DIR)/php.ini-dist $(TARGET_DIR)/etc/php.ini
+
+php: uclibc $(PHP_DEPS) $(PHP_TARGET_DEPS) $(TARGET_DIR)/etc/php.ini
+
+php-clean:
+	rm -f $(PHP_DIR)/.configured $(PHP_DIR)/.built $(PHP_DIR)/.staged
+	-$(MAKE) -C $(PHP_DIR) clean
+
+php-dirclean:
+	rm -rf $(PHP_DIR)
+
+#############################################################
+#
+# Toplevel Makefile options
+#
+#############################################################
+ifeq ($(strip $(BR2_PACKAGE_PHP)),y)
+TARGETS+=php
+endif
