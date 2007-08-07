From: ulf at uclibc.org <ulf@uclibc.org>
Date: Tue,  7 Aug 2007 10:28:00 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/libxml2
Message-ID: <20070807172800.6F463A464D@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-08-07 10:27:59 -0700 (Tue, 07 Aug 2007)
New Revision: 19416

Log:
Cleanup libxml2

Modified:
   trunk/buildroot/package/libxml2/Config.in
   trunk/buildroot/package/libxml2/libxml2.mk


Changeset:
Modified: trunk/buildroot/package/libxml2/Config.in
===================================================================
--- trunk/buildroot/package/libxml2/Config.in	2007-08-06 19:41:40 UTC (rev 19415)
+++ trunk/buildroot/package/libxml2/Config.in	2007-08-07 17:27:59 UTC (rev 19416)
@@ -1,19 +1,15 @@
 config BR2_PACKAGE_LIBXML2
 	bool "libxml2"
 	default n
-	depends on BR2_USE_WCHAR
 	help
 	  XML C Parser
-	  Requires WCHAR
-
 	  ftp://xmlsoft.org/libxml2
 
 config BR2_PACKAGE_LIBXML2_TARGET_HEADERS
 	bool "libxml2 target headers"
 	default n
+	depends on BR2_PACKAGE_LIBXML2
 	help
 	  XML C Parser
-	  Requires WCHAR
-
 	  ftp://xmlsoft.org/libxml2
 

Modified: trunk/buildroot/package/libxml2/libxml2.mk
===================================================================
--- trunk/buildroot/package/libxml2/libxml2.mk	2007-08-06 19:41:40 UTC (rev 19415)
+++ trunk/buildroot/package/libxml2/libxml2.mk	2007-08-07 17:27:59 UTC (rev 19416)
@@ -26,8 +26,23 @@
 		--host=$(GNU_TARGET_NAME) \
 		--build=$(GNU_HOST_NAME) \
 		--prefix=/usr \
+		--exec-prefix=/usr \
+		--bindir=/usr/bin \
+		--sbindir=/usr/sbin \
+		--libexecdir=/usr/lib \
 		--sysconfdir=/etc \
+		--datadir=/usr/share \
+		--localstatedir=/var \
+		--mandir=/usr/man \
+		--infodir=/usr/info \
+		--includedir=/usr/include \
+		--with-gnu-ld \
 		--enable-shared \
+		--enable-static \
+		--enable-ipv6=no \
+		--without-debugging \
+		--without-python \
+		--without-threads \
 		$(DISABLE_NLS) \
 	);
 	touch $(LIBXML2_DIR)/.configured
@@ -38,6 +53,10 @@
 
 $(STAGING_DIR)/usr/lib/libxml2.so: $(LIBXML2_DIR)/libxml2.la
 	$(MAKE) DESTDIR=$(STAGING_DIR) -C $(LIBXML2_DIR) install
+	rm -f $(STAGING_DIR)/usr/lib/libxml2.la
+	$(SED) 's:prefix=/usr:prefix=$(STAGING_DIR)/usr:' \
+		-e 's:includedir=/usr/include:includedir=$(STAGING_DIR)/usr/include:' \
+		$(STAGING_DIR)/usr/bin/xml2-config
 
 $(TARGET_DIR)/usr/lib/libxml2.so: $(STAGING_DIR)/usr/lib/libxml2.so
 	cp -dpf $(STAGING_DIR)/usr/lib/libxml2.so* $(TARGET_DIR)/usr/lib/
