From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Mon, 16 Jun 2008 04:25:25 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/libogg
Message-ID: <20080616112525.74362F800B@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-06-16 04:25:25 -0700 (Mon, 16 Jun 2008)
New Revision: 22372

Log:
libogg: remove BR2_PACKAGE_LIBOGG_HEADERS

We don't need per-package header install options now that we have
BR2_HAVE_DEVFILES (they are in fact useless as the files will get
overwritten/deleted anyway).


Modified:
   trunk/buildroot/package/libogg/Config.in
   trunk/buildroot/package/libogg/libogg.mk


Changeset:
Modified: trunk/buildroot/package/libogg/Config.in
===================================================================
--- trunk/buildroot/package/libogg/Config.in	2008-06-16 11:16:28 UTC (rev 22371)
+++ trunk/buildroot/package/libogg/Config.in	2008-06-16 11:25:25 UTC (rev 22372)
@@ -3,12 +3,5 @@
 	default n
 	select BR2_PACKAGE_PKGCONFIG
 	help
-	  Ogg is the name of Xiph.org's container format for audio, video, and metadata
-
-config BR2_PACKAGE_LIBOGG_HEADERS
-	bool "libogg target headers"
-	default n
-	depends on BR2_PACKAGE_LIBOGG
-	help
-	  Add target headers for the Ogg open source container format
-	  - Not yet implemented
+	  Ogg is the name of Xiph.org's container format for audio,
+	  video, and metadata

Modified: trunk/buildroot/package/libogg/libogg.mk
===================================================================
--- trunk/buildroot/package/libogg/libogg.mk	2008-06-16 11:16:28 UTC (rev 22371)
+++ trunk/buildroot/package/libogg/libogg.mk	2008-06-16 11:25:25 UTC (rev 22372)
@@ -56,16 +56,6 @@
 	rm -rf $(TARGET_DIR)/usr/share/doc/$(LIBOGG_NAME)
 endif
 
-$(TARGET_DIR)/usr/lib/libogg.a: $(STAGING_DIR)/usr/lib/libogg.so
-	cp -dpf $(STAGING_DIR)/usr/lib/libogg.a $@
-
-$(TARGET_DIR)/usr/include/ogg/ogg.h: $(STAGING_DIR)/usr/lib/libogg.so
-	mkdir -p $(TARGET_DIR)/usr/include/ogg
-	cp -dpf $(LIBOGG_DIR)/include/ogg/*.h \
-		$(TARGET_DIR)/usr/include/ogg
-
-libogg-header: $(TARGET_DIR)/usr/lib/libogg.a $(TARGET_DIR)/usr/include/ogg/ogg.h
-
 libogg: uclibc pkgconfig $(TARGET_DIR)/usr/lib/libogg.so
 
 libogg-source: $(DL_DIR)/$(LIBOGG_SOURCE)
@@ -86,7 +76,3 @@
 ifeq ($(strip $(BR2_PACKAGE_LIBOGG)),y)
 TARGETS+=libogg
 endif
-
-ifeq ($(strip $(BR2_PACKAGE_LIBOGG_HEADERS)),y)
-TARGETS+=libogg-header
-endif
