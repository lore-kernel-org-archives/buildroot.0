From: ulf at uclibc.org <ulf@uclibc.org>
Date: Tue, 27 Nov 2007 00:22:00 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/curl
Message-ID: <20071127082200.C8102A6860@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-11-27 00:21:58 -0800 (Tue, 27 Nov 2007)
New Revision: 20548

Log:
Bump curl version to 1.17.1

Modified:
   trunk/buildroot/package/curl/curl.mk


Changeset:
Modified: trunk/buildroot/package/curl/curl.mk
===================================================================
--- trunk/buildroot/package/curl/curl.mk	2007-11-26 18:29:52 UTC (rev 20547)
+++ trunk/buildroot/package/curl/curl.mk	2007-11-27 08:21:58 UTC (rev 20548)
@@ -3,7 +3,8 @@
 # curl
 #
 #############################################################
-CURL_VERSION:=7.13.1
+CURL_VERSION:=7.17.1
+LIBCURL_VERSION:=4.0.1
 CURL_SOURCE:=curl-$(CURL_VERSION).tar.bz2
 CURL_SITE:=http://curl.haxx.se/download/
 CURL_CAT:=$(BZCAT)
@@ -17,7 +18,7 @@
 
 $(CURL_DIR)/.unpacked: $(DL_DIR)/$(CURL_SOURCE)
 	$(CURL_CAT) $(DL_DIR)/$(CURL_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	toolchain/patch-kernel.sh $(CURL_DIR) package/curl/ \*.patch*
+	toolchain/patch-kernel.sh $(CURL_DIR) package/curl/ curl-$(CURL_VERSION)-\*.patch*
 	touch $(CURL_DIR)/.unpacked
 
 $(CURL_DIR)/.configured: $(CURL_DIR)/.unpacked
@@ -44,13 +45,13 @@
 	-rm -rf $(STAGING_DIR)/man
 	touch $(STAGING_DIR)/bin/$(CURL_BINARY)
 
-$(TARGET_DIR)/usr/lib/libcurl.so.3.0.0: $(STAGING_DIR)/bin/$(CURL_BINARY)
+$(TARGET_DIR)/usr/lib/libcurl.so.$(LIBCURL_VERSION): $(STAGING_DIR)/bin/$(CURL_BINARY)
 	-mkdir $(TARGET_DIR)/usr/lib
 	-mkdir $(TARGET_DIR)/usr/bin
 	cp -a $(STAGING_DIR)/lib/libcurl.so* $(TARGET_DIR)/usr/lib
-	$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/lib/libcurl.so.3.0.0
+	$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/lib/libcurl.so.$(LIBCURL_VERSION)
 
-$(TARGET_DIR)/usr/bin/$(CURL_BINARY): $(TARGET_DIR)/usr/lib/libcurl.so.3.0.0
+$(TARGET_DIR)/usr/bin/$(CURL_BINARY): $(TARGET_DIR)/usr/lib/libcurl.so.$(LIBCURL_VERSION)
 	cp -a $(STAGING_DIR)/bin/$(CURL_BINARY) $(TARGET_DIR)/usr/bin
 	$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/bin/$(CURL_BINARY)
 
