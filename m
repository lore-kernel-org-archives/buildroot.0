From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Sun, 28 Dec 2008 13:50:53 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package/curl
Message-ID: <20081228135053.7CDD476D44@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-12-28 13:50:53 +0000 (Sun, 28 Dec 2008)
New Revision: 24576

Log:
curl: convert to Makefile.autotools.in format, bump version

Modified:
   trunk/buildroot/package/curl/Config.in
   trunk/buildroot/package/curl/curl.mk


Changeset:
Modified: trunk/buildroot/package/curl/Config.in
===================================================================
--- trunk/buildroot/package/curl/Config.in	2008-12-28 13:50:49 UTC (rev 24575)
+++ trunk/buildroot/package/curl/Config.in	2008-12-28 13:50:53 UTC (rev 24576)
@@ -1,11 +1,3 @@
-config BR2_PACKAGE_CURL
-	bool "curl"
-	help
-	  cURL is a tool for getting files from FTP, HTTP, Gopher, Telnet,
-	  and Dict servers, using any of the supported protocols.
-
-	  http://curl.haxx.nu/
-
 config BR2_PACKAGE_LIBCURL
 	bool "libcurl"
 	help
@@ -13,3 +5,9 @@
 	  and Dict servers, using any of the supported protocols.
 
 	  http://curl.haxx.nu/
+
+config BR2_PACKAGE_CURL
+	bool "curl binary"
+	depends on BR2_PACKAGE_LIBCURL
+	help
+	  Install curl binary as well

Modified: trunk/buildroot/package/curl/curl.mk
===================================================================
--- trunk/buildroot/package/curl/curl.mk	2008-12-28 13:50:49 UTC (rev 24575)
+++ trunk/buildroot/package/curl/curl.mk	2008-12-28 13:50:53 UTC (rev 24576)
@@ -3,95 +3,15 @@
 # curl
 #
 #############################################################
-CURL_VERSION:=7.17.1
-LIBCURL_VERSION:=4.0.1
-CURL_SOURCE:=curl-$(CURL_VERSION).tar.bz2
-CURL_SITE:=http://curl.haxx.se/download/
-CURL_CAT:=$(BZCAT)
-CURL_DIR:=$(BUILD_DIR)/curl-$(CURL_VERSION)
-CURL_BINARY:=curl
-CURL_DESTDIR:=$(STAGING_DIR)/usr
+LIBCURL_VERSION = 7.19.2
+LIBCURL_SOURCE = curl-$(LIBCURL_VERSION).tar.bz2
+LIBCURL_SITE = http://curl.haxx.se/download/
+LIBCURL_INSTALL_STAGING = YES
+LIBCURL_CONF_OPT = --disable-verbose --disable-manual --enable-hidden-symbols \
+		   $(DISABLE_NLS) $(DISABLE_LARGEFILE) $(DISABLE_IPV6)
 
-$(DL_DIR)/$(CURL_SOURCE):
-	 $(WGET) -P $(DL_DIR) $(CURL_SITE)/$(CURL_SOURCE)
+$(eval $(call AUTOTARGETS,package,libcurl))
 
-curl-source: $(DL_DIR)/$(CURL_SOURCE)
-
-$(CURL_DIR)/.unpacked: $(DL_DIR)/$(CURL_SOURCE)
-	$(CURL_CAT) $(DL_DIR)/$(CURL_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	toolchain/patch-kernel.sh $(CURL_DIR) package/curl/ curl-$(CURL_VERSION)-\*.patch*
-	touch $(CURL_DIR)/.unpacked
-
-$(CURL_DIR)/.configured: $(CURL_DIR)/.unpacked
-	(cd $(CURL_DIR); rm -rf config.cache; \
-		aclocal; \
-		libtoolize --force; \
-		./reconf; )
-	$(CONFIG_UPDATE) $(CURL_DIR)
-	(cd $(CURL_DIR); \
-		$(TARGET_CONFIGURE_OPTS) \
-		$(TARGET_CONFIGURE_ARGS) \
-		./configure \
-		--target=$(GNU_TARGET_NAME) \
-		--host=$(GNU_TARGET_NAME) \
-		--build=$(GNU_HOST_NAME) \
-		--prefix=/usr \
-		--exec-prefix=/usr \
-		--bindir=/usr/bin \
-		--sbindir=/usr/sbin \
-		--libdir=/usr/lib \
-		--libexecdir=/usr/lib \
-		--sysconfdir=/etc \
-		--datadir=/usr/share \
-		--localstatedir=/var \
-		--includedir=/usr/include \
-		--mandir=/usr/share/man \
-		--infodir=/usr/share/info \
-	)
-	touch $(CURL_DIR)/.configured
-
-$(CURL_DIR)/src/.libs/$(CURL_BINARY): $(CURL_DIR)/.configured
-	$(MAKE) -C $(CURL_DIR)
-
-$(CURL_DESTDIR)/bin/$(CURL_BINARY): $(CURL_DIR)/src/.libs/$(CURL_BINARY)
-	-mkdir $(CURL_DESTDIR)/bin
-	$(MAKE) DESTDIR=$(STAGING_DIR) -C $(CURL_DIR) install
-	$(SED) "s,^libdir=.*,libdir=\'$(CURL_DESTDIR)/lib\',g" $(CURL_DESTDIR)/lib/libcurl.la
-	touch $(CURL_DESTDIR)/bin/$(CURL_BINARY)
-
-$(TARGET_DIR)/usr/lib/libcurl.so.$(LIBCURL_VERSION): $(CURL_DESTDIR)/bin/$(CURL_BINARY)
-	-mkdir $(TARGET_DIR)/usr/lib
-	-mkdir $(TARGET_DIR)/usr/bin
-	cp -a $(CURL_DESTDIR)/lib/libcurl.so* $(TARGET_DIR)/usr/lib
-	$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/lib/libcurl.so.$(LIBCURL_VERSION)
-
-$(TARGET_DIR)/usr/bin/$(CURL_BINARY): $(TARGET_DIR)/usr/lib/libcurl.so.$(LIBCURL_VERSION)
-	cp -a $(CURL_DESTDIR)/bin/$(CURL_BINARY) $(TARGET_DIR)/usr/bin
-	$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/bin/$(CURL_BINARY)
-
-curl: uclibc $(TARGET_DIR)/usr/bin/$(CURL_BINARY)
-
-libcurl: $(CURL_DESTDIR)/bin/$(CURL_BINARY)
-
-curl-clean:
-	rm -f $(TARGET_DIR)/usr/lib/libcurl.so*
-	rm -f $(TARGET_DIR)/usr/bin/curl
-	rm -f $(CURL_DESTDIR)/bin/curl*
-	rm -f $(CURL_DESTDIR)/lib/libcurl.so*
-	rm -rf $(CURL_DESTDIR)/include/curl
-	-$(MAKE) -C $(CURL_DIR) clean
-
-curl-dirclean:
-	rm -rf $(CURL_DIR)
-
-#############################################################
-#
-# Toplevel Makefile options
-#
-#############################################################
-ifeq ($(BR2_PACKAGE_CURL),y)
-TARGETS+=curl
-endif
-ifeq ($(BR2_PACKAGE_LIBCURL),y)
-TARGETS+=libcurl
-endif
+$(LIBCURL_HOOK_POST_INSTALL):
+	rm -rf $(TARGET_DIR)/usr/bin/curl-config \
+	       $(if $(BR2_PACKAGE_CURL),,$(TARGET_DIR)/usr/bin/curl)
