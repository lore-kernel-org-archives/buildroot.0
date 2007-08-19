From: ulf at uclibc.org <ulf@uclibc.org>
Date: Sun, 19 Aug 2007 14:02:47 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/php
Message-ID: <20070819210247.6532AA5D20@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-08-19 14:02:46 -0700 (Sun, 19 Aug 2007)
New Revision: 19566

Log:
Fr?\195?\165n: 	Brad House <brad@mainstreetsoftworks.com>
Till: 	buildroot at uclibc.org
?\195?\132mne: 	[Buildroot] [patch] php fixes and updates
Datum: 	Tue, 14 Aug 2007 16:39:03 -0400  (22.39 CEST)
Changes:
        - fastcgi config option
        - force php to find the php.ini in /etc (it seems to default
          to /lib for some reason)
        - build with posix support, a lot of php scripts require
          this apparently
        - strip the php binary when installing to TARGET_DIR
        - actually 'uninstall' php on a php-clean

-Brad


Modified:
   trunk/buildroot/package/php/Config.in
   trunk/buildroot/package/php/php.mk


Changeset:
Modified: trunk/buildroot/package/php/Config.in
===================================================================
--- trunk/buildroot/package/php/Config.in	2007-08-19 20:59:37 UTC (rev 19565)
+++ trunk/buildroot/package/php/Config.in	2007-08-19 21:02:46 UTC (rev 19566)
@@ -24,6 +24,13 @@
           cgi interface for php
           you must have at least cli or cgi selected.
 
+config BR2_PACKAGE_PHP_FASTCGI
+        bool "fastcgi"
+        depends on BR2_PACKAGE_PHP_CGI
+        default y
+        help
+          fast cgi interface for php
+
 config BR2_PACKAGE_PHP_OPENSSL
         bool "openssl support"
         depends on BR2_PACKAGE_PHP && BR2_PACKAGE_OPENSSL

Modified: trunk/buildroot/package/php/php.mk
===================================================================
--- trunk/buildroot/package/php/php.mk	2007-08-19 20:59:37 UTC (rev 19565)
+++ trunk/buildroot/package/php/php.mk	2007-08-19 21:02:46 UTC (rev 19566)
@@ -19,10 +19,13 @@
 endif
 
 ifneq ($(BR2_PACKAGE_PHP_CGI),y)
-	PHP_CGI="--disable-cgi"
+	PHP_CGI=--disable-cgi
 else
-	PHP_CGI="--enable-cgi"
+	PHP_CGI=--enable-cgi
 	PHP_TARGET_DEPS+=$(TARGET_DIR)/usr/bin/php-cgi
+	ifeq ($(BR2_PACKAGE_PHP_FASTCGI),y)
+		PHP_CGI+=--enable-fastcgi
+	endif
 endif
 
 ifeq ($(BR2_PACKAGE_PHP_OPENSSL),y)
@@ -69,6 +72,7 @@
 		--sbindir=/usr/sbin \
 		--libexecdir=/usr/lib \
 		--sysconfdir=/etc \
+		--with-config-file-path=/etc \
 		--datadir=/usr/share/misc \
 		--localstatedir=/var \
 		--mandir=/usr/man \
@@ -77,6 +81,7 @@
 		--enable-spl \
 		--enable-session \
 		--enable-sockets \
+		--enable-posix \
 		--with-pcre-regex \
 		--without-pear \
 		--disable-ipv6 \
@@ -100,10 +105,12 @@
 $(TARGET_DIR)/usr/bin/php: $(PHP_DIR)/.staged
 	cp -dpf $(STAGING_DIR)/usr/bin/php $(TARGET_DIR)/usr/bin/php
 	chmod 755 $(TARGET_DIR)/usr/bin/php
+	$(STRIP) --strip-unneeded $(TARGET_DIR)/usr/bin/php
 
 $(TARGET_DIR)/usr/bin/php-cgi: $(PHP_DIR)/.staged
 	cp -dpf $(STAGING_DIR)/usr/bin/php-cgi $(TARGET_DIR)/usr/bin/php-cgi
 	chmod 755 $(TARGET_DIR)/usr/bin/php-cgi
+	$(STRIP) --strip-unneeded $(TARGET_DIR)/usr/bin/php-cgi
 
 $(TARGET_DIR)/etc/php.ini: $(PHP_DIR)/.staged
 	cp $(PHP_DIR)/php.ini-dist $(TARGET_DIR)/etc/php.ini
@@ -112,6 +119,9 @@
 
 php-clean:
 	rm -f $(PHP_DIR)/.configured $(PHP_DIR)/.built $(PHP_DIR)/.staged
+	rm -f $(TARGET_DIR)/usr/bin/php $(TARGET_DIR)/usr/bin/php-cgi
+	rm -f $(STAGING_DIR)/usr/bin/php* $(STAGING_DIR)/usr/man/man1/php*
+	rm -rf $(STAGING_DIR)/usr/include/php
 	-$(MAKE) -C $(PHP_DIR) clean
 
 php-dirclean:
