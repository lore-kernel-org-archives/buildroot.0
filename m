From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Mon, 16 Jun 2008 04:34:29 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/libvorbis
Message-ID: <20080616113429.A45593C965@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-06-16 04:34:29 -0700 (Mon, 16 Jun 2008)
New Revision: 22375

Log:
libvorbis: remove BR2_PACKAGE_LIBVORBIS_HEADERS

We don't need per-package header install options now that we have
BR2_HAVE_DEVFILES (they are in fact useless as the files will get
overwritten/deleted anyway).


Modified:
   trunk/buildroot/package/libvorbis/Config.in
   trunk/buildroot/package/libvorbis/libvorbis.mk


Changeset:
Modified: trunk/buildroot/package/libvorbis/Config.in
===================================================================
--- trunk/buildroot/package/libvorbis/Config.in	2008-06-16 11:34:11 UTC (rev 22374)
+++ trunk/buildroot/package/libvorbis/Config.in	2008-06-16 11:34:29 UTC (rev 22375)
@@ -15,14 +15,6 @@
 	  performance than MPEG-1/2 audio layer 3, MPEG-4 audio (TwinVQ),
 	  WMA and PAC.
 
-
-config BR2_PACKAGE_LIBVORBIS_HEADERS
-	bool "libvorbis target headers"
-	default n
-	depends on BR2_PACKAGE_LIBVORBIS
-	help
-	  Add target headers for the Vorbis open source audio decoder
-
 config BR2_PACKAGE_LIBVORBIS_TREMOR
 	bool "libvorbis integer implementation"
 	default y if BR2_arm || BR2_avr32

Modified: trunk/buildroot/package/libvorbis/libvorbis.mk
===================================================================
--- trunk/buildroot/package/libvorbis/libvorbis.mk	2008-06-16 11:34:11 UTC (rev 22374)
+++ trunk/buildroot/package/libvorbis/libvorbis.mk	2008-06-16 11:34:29 UTC (rev 22375)
@@ -47,15 +47,6 @@
 	$(MAKE) prefix=$(TARGET_DIR)/usr -C $(LIBVORBIS_DIR) install
 	touch $@
 
-$(TARGET_DIR)/usr/lib/libvorbis.a: $(TARGET_DIR)/usr/lib/libvorbis.so
-	cp -dpf $(LIBVORBIS_DIR)/lib/libvorbis.a $(TARGET_DIR)/usr/lib/
-	touch $@
-
-libvorbis-header: $(TARGET_DIR)/usr/lib/libvorbis.a
-	mkdir -p $(TARGET_DIR)/usr/include/vorbis
-	cp -dpf $(LIBVORBIS_DIR)/include/vorbis/*.h \
-		$(TARGET_DIR)/usr/include/vorbis
-
 libvorbis: uclibc pkgconfig libogg $(TARGET_DIR)/usr/lib/libvorbis.so
 
 libvorbis-source: $(DL_DIR)/$(LIBVORBIS_SOURCE)
@@ -124,11 +115,6 @@
 	cp -dpf $(TREMOR_DIR)/lib/tremor.a $(TARGET_DIR)/usr/lib/
 	touch $@
 
-tremor-header: $(TARGET_DIR)/usr/lib/tremor.a
-	mkdir -p $(TARGET_DIR)/usr/include/vorbis
-	cp -dpf $(TREMOR_DIR)/include/vorbis/*.h \
-		$(TARGET_DIR)/usr/include/vorbis
-
 tremor: uclibc pkgconfig libogg $(TARGET_DIR)/usr/lib/tremor.so
 
 tremor-source: $(DL_DIR)/$(TREMOR_SOURCE)
@@ -152,7 +138,3 @@
 endif
 TARGETS+=libvorbis
 endif
-
-ifeq ($(strip $(BR2_PACKAGE_LIBVORBIS_HEADERS)),y)
-TARGETS+=libvorbis-header
-endif
