From: ulf at uclibc.org <ulf@uclibc.org>
Date: Wed, 28 Nov 2007 00:57:26 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/curl
Message-ID: <20071128085726.AB79A3005E@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-11-28 00:57:26 -0800 (Wed, 28 Nov 2007)
New Revision: 20561

Log:
Move curl from lib to usr/lib, update curl.la

Modified:
   trunk/buildroot/package/curl/curl.mk


Changeset:
Modified: trunk/buildroot/package/curl/curl.mk
===================================================================
--- trunk/buildroot/package/curl/curl.mk	2007-11-28 08:57:00 UTC (rev 20560)
+++ trunk/buildroot/package/curl/curl.mk	2007-11-28 08:57:26 UTC (rev 20561)
@@ -10,6 +10,7 @@
 CURL_CAT:=$(BZCAT)
 CURL_DIR:=$(BUILD_DIR)/curl-$(CURL_VERSION)
 CURL_BINARY:=curl
+CURL_DESTDIR:=$(STAGING_DIR)/usr
 
 $(DL_DIR)/$(CURL_SOURCE):
 	 $(WGET) -P $(DL_DIR) $(CURL_SITE)/$(CURL_SOURCE)
@@ -32,39 +33,50 @@
 		--target=$(GNU_TARGET_NAME) \
 		--host=$(GNU_TARGET_NAME) \
 		--build=$(GNU_HOST_NAME) \
-		--prefix=$(STAGING_DIR) \
+		--prefix=/usr \
+		--exec-prefix=/usr \
+		--bindir=/usr/bin \
+		--sbindir=/usr/sbin \
+		--libdir=/usr/lib \
+		--libexecdir=/usr/lib \
+		--sysconfdir=/etc \
+		--datadir=/usr/share \
+		--localstatedir=/var \
+		--includedir=/usr/include \
+		--mandir=/usr/share/man \
+		--infodir=/usr/share/info \
 	)
 	touch $(CURL_DIR)/.configured
 
 $(CURL_DIR)/src/.libs/$(CURL_BINARY): $(CURL_DIR)/.configured
 	$(MAKE) -C $(CURL_DIR)
 
-$(STAGING_DIR)/bin/$(CURL_BINARY): $(CURL_DIR)/src/.libs/$(CURL_BINARY)
-	-mkdir $(STAGING_DIR)/bin
-	$(MAKE) prefix=$(STAGING_DIR) -C $(CURL_DIR) install
-	-rm -rf $(STAGING_DIR)/man
-	touch $(STAGING_DIR)/bin/$(CURL_BINARY)
+$(CURL_DESTDIR)/bin/$(CURL_BINARY): $(CURL_DIR)/src/.libs/$(CURL_BINARY)
+	-mkdir $(CURL_DESTDIR)/bin
+	$(MAKE) DESTDIR=$(STAGING_DIR) -C $(CURL_DIR) install
+	$(SED) "s,^libdir=.*,libdir=\'$(CURL_DESTDIR)/lib\',g" $(CURL_DESTDIR)/lib/libcurl.la
+	touch $(CURL_DESTDIR)/bin/$(CURL_BINARY)
 
-$(TARGET_DIR)/usr/lib/libcurl.so.$(LIBCURL_VERSION): $(STAGING_DIR)/bin/$(CURL_BINARY)
+$(TARGET_DIR)/usr/lib/libcurl.so.$(LIBCURL_VERSION): $(CURL_DESTDIR)/bin/$(CURL_BINARY)
 	-mkdir $(TARGET_DIR)/usr/lib
 	-mkdir $(TARGET_DIR)/usr/bin
-	cp -a $(STAGING_DIR)/lib/libcurl.so* $(TARGET_DIR)/usr/lib
+	cp -a $(CURL_DESTDIR)/lib/libcurl.so* $(TARGET_DIR)/usr/lib
 	$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/lib/libcurl.so.$(LIBCURL_VERSION)
 
 $(TARGET_DIR)/usr/bin/$(CURL_BINARY): $(TARGET_DIR)/usr/lib/libcurl.so.$(LIBCURL_VERSION)
-	cp -a $(STAGING_DIR)/bin/$(CURL_BINARY) $(TARGET_DIR)/usr/bin
+	cp -a $(CURL_DESTDIR)/bin/$(CURL_BINARY) $(TARGET_DIR)/usr/bin
 	$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/bin/$(CURL_BINARY)
 
 curl: uclibc $(TARGET_DIR)/usr/bin/$(CURL_BINARY)
 
-libcurl: $(STAGING_DIR)/bin/$(CURL_BINARY)
+libcurl: $(CURL_DESTDIR)/bin/$(CURL_BINARY)
 
 curl-clean:
 	rm -f $(TARGET_DIR)/usr/lib/libcurl.so*
 	rm -f $(TARGET_DIR)/usr/bin/curl
-	rm -f $(STAGING_DIR)/bin/curl*
-	rm -f $(STAGING_DIR)/lib/libcurl.so*
-	rm -rf $(STAGING_DIR)/usr/include/curl
+	rm -f $(CURL_DESTDIR)/bin/curl*
+	rm -f $(CURL_DESTDIR)/lib/libcurl.so*
+	rm -rf $(CURL_DESTDIR)/include/curl
 	-$(MAKE) -C $(CURL_DIR) clean
 
 curl-dirclean:
