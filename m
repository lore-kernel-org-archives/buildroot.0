From: sjhill at uclibc.org <sjhill@uclibc.org>
Date: Mon, 16 Jul 2007 17:27:11 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/lighttpd
Message-ID: <20070717002711.5AABB3009C@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: sjhill
Date: 2007-07-16 17:27:10 -0700 (Mon, 16 Jul 2007)
New Revision: 19125

Log:
Make OpenSSL support to be configurable and get the install target footprint to be as small as possible. Also clean up the clean target. "Clean up, clean up, everybody lend a hand! Clean up, clean up, you can do it, yes you can."


Modified:
   trunk/buildroot/package/lighttpd/Config.in
   trunk/buildroot/package/lighttpd/lighttpd.mk


Changeset:
Modified: trunk/buildroot/package/lighttpd/Config.in
===================================================================
--- trunk/buildroot/package/lighttpd/Config.in	2007-07-17 00:25:31 UTC (rev 19124)
+++ trunk/buildroot/package/lighttpd/Config.in	2007-07-17 00:27:10 UTC (rev 19125)
@@ -1,13 +1,21 @@
 config BR2_PACKAGE_LIGHTTPD
 	bool "lighttpd"
 	default n
-	select BR2_PACKAGE_OPENSSL
 	help
 	  lighttpd a secure, fast, compliant and very flexible web-server
-	  which has been optimized for high-performance environments. It has a very
-	  low memory footprint compared to other webservers and takes care of cpu-load.
-	  Its advanced feature-set (FastCGI, CGI, Auth, Output-Compression,
-	  URL-Rewriting and many more) make lighttpd the perfect webserver-software
-	  for every server that is suffering load problems.
+	  which has been optimized for high-performance environments. It
+	  has a very low memory footprint compared to other webservers and
+	  takes care of cpu-load. Its advanced feature-set (FastCGI, CGI,
+	  Auth, Output-Compression, URL-Rewriting and many more) make
+	  lighttpd the perfect webserver-software for every server that
+	  is suffering load problems.
 		 
 	  http://www.lighttpd.net/
+
+config BR2_PACKAGE_LIGHTTPD_OPENSSL
+	bool "lighttpd-openssl"
+	default y
+	depends on BR2_PACKAGE_LIGHTTPD
+	select BR2_PACKAGE_OPENSSL
+	help
+	  Enable OpenSSL support for libghttpd.

Modified: trunk/buildroot/package/lighttpd/lighttpd.mk
===================================================================
--- trunk/buildroot/package/lighttpd/lighttpd.mk	2007-07-17 00:25:31 UTC (rev 19124)
+++ trunk/buildroot/package/lighttpd/lighttpd.mk	2007-07-17 00:27:10 UTC (rev 19125)
@@ -13,11 +13,11 @@
 LIGHTTPD_TARGET_BINARY:=usr/sbin/lighttpd
 
 $(DL_DIR)/$(LIGHTTPD_SOURCE):
-	 $(WGET) -P $(DL_DIR) $(LIGHTTPD_SITE)/$(LIGHTTPD_SOURCE)
+	$(WGET) -P $(DL_DIR) $(LIGHTTPD_SITE)/$(LIGHTTPD_SOURCE)
 ifneq ($(LIGHTTPD_PATCH),)
 LIGHTTPD_PATCH_FILE:=$(DL_DIR)/$(LIGHTTPD_PATCH)
 $(LIGHTTPD_PATCH_FILE):
-	 $(WGET) -P $(DL_DIR) $(LIGHTTPD_SITE)/$(LIGHTTPD_PATCH)
+	$(WGET) -P $(DL_DIR) $(LIGHTTPD_SITE)/$(LIGHTTPD_PATCH)
 endif
 lighttpd-source: $(DL_DIR)/$(LIGHTTPD_SOURCE) $(LIGHTTPD_PATCH_FILE)
 
@@ -34,6 +34,12 @@
 	$(SED) 's/-lfs/-largefile/g;s/_lfs/_largefile/g' $(LIGHTTPD_DIR)/configure
 	touch $@
 
+ifeq ($(strip $(BR2_PACKAGE_LIGHTTPD_OPENSSL)),y)
+LIGHTTPD_OPENSSL:=--with-openssl
+else
+LIGHTTPD_OPENSSL:=--without-openssl
+endif
+
 $(LIGHTTPD_DIR)/.configured: $(LIGHTTPD_DIR)/.unpacked
 	(cd $(LIGHTTPD_DIR); rm -rf config.cache; \
 		$(TARGET_CONFIGURE_OPTS) \
@@ -43,11 +49,11 @@
 		--host=$(GNU_TARGET_NAME) \
 		--build=$(GNU_HOST_NAME) \
 		--prefix=/usr \
-		--libdir=/lib \
+		--libdir=/usr/lib/lighttpd \
 		--libexecdir=/usr/lib \
 		--sysconfdir=/etc \
 		--localstatedir=/var \
-		--with-openssl \
+		$(LIGHTTPD_OPENSSL) \
 		--without-pcre \
 		--program-prefix="" \
 		$(DISABLE_IPV6) \
@@ -60,12 +66,27 @@
     
 $(TARGET_DIR)/$(LIGHTTPD_TARGET_BINARY): $(LIGHTTPD_DIR)/$(LIGHTTPD_BINARY)
 	$(MAKE) DESTDIR=$(TARGET_DIR) -C $(LIGHTTPD_DIR) install
+	@rm -rf $(TARGET_DIR)/usr/share/man $(TARGET_DIR)/usr/man
+	@rm -rf $(TARGET_DIR)/usr/lib/lighttpd/*.la
+	$(STRIP) --strip-unneeded $(TARGET_DIR)/usr/lib/lighttpd/*.so
+	$(STRIP) --strip-unneeded $(TARGET_DIR)/$(LIGHTTPD_TARGET_BINARY)
+	@if [ ! -f $(TARGET_DIR)/etc/lighttpd/lighttpd.conf ] ; then \
+		$(INSTALL) -m 0644 -D $(LIGHTTPD_DIR)/doc/lighttpd.conf $(TARGET_DIR)/etc/lighttpd/lighttpd.conf; \
+	fi;
 	$(INSTALL) -m 0755 -D $(LIGHTTPD_DIR)/openwrt/S51lighttpd  $(TARGET_DIR)/etc/init.d/S99lighttpd
 
+ifeq ($(strip $(BR2_PACKAGE_LIGHTTPD_OPENSSL)),y)
 lighttpd: uclibc openssl $(TARGET_DIR)/$(LIGHTTPD_TARGET_BINARY)
+else
+lighttpd: uclibc $(TARGET_DIR)/$(LIGHTTPD_TARGET_BINARY)
+endif
 
 lighttpd-clean:
 	$(MAKE) DESTDIR=$(TARGET_DIR) CC=$(TARGET_CC) -C $(LIGHTTPD_DIR) uninstall
+	@rm -rf $(TARGET_DIR)/usr/lib/lighttpd
+	@rm -f $(TARGET_DIR)/etc/init.d/S99lighttpd
+	@rm -f $(TARGET_DIR)/etc/lighttpd/lighttpd.conf
+	@rmdir -p --ignore-fail-on-non-empty $(TARGET_DIR)/etc/lighttpd
 	-$(MAKE) -C $(LIGHTTPD_DIR) clean
 
 lighttpd-dirclean:
