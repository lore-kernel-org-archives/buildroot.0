From: ulf at uclibc.org <ulf@uclibc.org>
Date: Sun, 19 Aug 2007 13:59:40 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/libxml2
Message-ID: <20070819205940.D0E38A4710@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-08-19 13:59:37 -0700 (Sun, 19 Aug 2007)
New Revision: 19565

Log:
Fr?\195?\165n: 	Brad House <brad@mainstreetsoftworks.com>
Till: 	buildroot at uclibc.org
?\195?\132mne: 	[Buildroot] [patch] libxml2 install fails because of missing directory
Datum: 	Tue, 14 Aug 2007 16:34:34 -0400  (22.34 CEST)

If libxml2 is installed before $(TARGET_DIR)/usr/lib is created,
it fails because it can't copy the library over.

Also, the dependency tree is a bit messed up.  libxml2.a should
only be installed if target-headers is specified, it's 4MB
on my system and the only .a file I found in my TARGET_DIR
(target-headers was not specified).

The attached patch fixes the above problems.

-Brad


Modified:
   trunk/buildroot/package/libxml2/libxml2.mk


Changeset:
Modified: trunk/buildroot/package/libxml2/libxml2.mk
===================================================================
--- trunk/buildroot/package/libxml2/libxml2.mk	2007-08-19 19:28:09 UTC (rev 19564)
+++ trunk/buildroot/package/libxml2/libxml2.mk	2007-08-19 20:59:37 UTC (rev 19565)
@@ -47,11 +47,8 @@
 	);
 	touch $(LIBXML2_DIR)/.configured
 
-$(LIBXML2_DIR)/libxml2.la: $(LIBXML2_DIR)/.configured
-	rm -f $@
+$(STAGING_DIR)/usr/lib/libxml2.so: $(LIBXML2_DIR)/.configured
 	$(MAKE) CC=$(TARGET_CC) -C $(LIBXML2_DIR)
-
-$(STAGING_DIR)/usr/lib/libxml2.so: $(LIBXML2_DIR)/libxml2.la
 	$(MAKE) DESTDIR=$(STAGING_DIR) -C $(LIBXML2_DIR) install
 	rm -f $(STAGING_DIR)/usr/lib/libxml2.la
 	$(SED) 's:prefix=/usr:prefix=$(STAGING_DIR)/usr:' \
@@ -59,17 +56,16 @@
 		$(STAGING_DIR)/usr/bin/xml2-config
 
 $(TARGET_DIR)/usr/lib/libxml2.so: $(STAGING_DIR)/usr/lib/libxml2.so
+	mkdir -p $(TARGET_DIR)/usr/include $(TARGET_DIR)/usr/lib
 	cp -dpf $(STAGING_DIR)/usr/lib/libxml2.so* $(TARGET_DIR)/usr/lib/
 	$(STRIP) --strip-unneeded $(TARGET_DIR)/usr/lib/libxml2.so*
 
 $(TARGET_DIR)/usr/lib/libxml2.a: $(STAGING_DIR)/usr/lib/libxml2.so
-	mkdir -p $(TARGET_DIR)/usr/include
 	cp -dpf $(STAGING_DIR)/usr/lib/libxml2.*a $(TARGET_DIR)/usr/lib/
-#	cp -dpf $(STAGING_DIR)/usr/include/libxml $(TARGET_DIR)/usr/include/
 
 libxml2:	uclibc $(TARGET_DIR)/usr/lib/libxml2.so libxml2-headers
 
-$(STAGING_DIR)/usr/include/libxml:	$(TARGET_DIR)/usr/lib/libxml2.a
+$(STAGING_DIR)/usr/include/libxml:	$(TARGET_DIR)/usr/lib/libxml2.so
 	cp -af $(LIBXML2_DIR)/include/libxml $(STAGING_DIR)/usr/include/libxml2
 
 $(TARGET_DIR)/usr/include/libxml2:	libxml2-headers
@@ -78,7 +74,7 @@
 
 libxml2-headers:	$(STAGING_DIR)/usr/include/libxml
 
-libxml2-target-headers: $(TARGET_DIR)/usr/include/libxml2
+libxml2-target-headers: $(TARGET_DIR)/usr/include/libxml2 $(TARGET_DIR)/usr/lib/libxml2.a
 
 libxml2-source: $(DL_DIR)/$(LIBXML2_SOURCE)
 
