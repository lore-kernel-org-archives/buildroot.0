From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Thu, 17 Jul 2008 06:19:45 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/tiff
Message-ID: <20080717131945.829003C86E@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-07-17 06:19:42 -0700 (Thu, 17 Jul 2008)
New Revision: 22859

Log:
tiff: zlib and jpeg are needed at configure time

Modified:
   trunk/buildroot/package/tiff/tiff.mk


Changeset:
Modified: trunk/buildroot/package/tiff/tiff.mk
===================================================================
--- trunk/buildroot/package/tiff/tiff.mk	2008-07-17 13:19:33 UTC (rev 22858)
+++ trunk/buildroot/package/tiff/tiff.mk	2008-07-17 13:19:42 UTC (rev 22859)
@@ -23,7 +23,8 @@
 	$(CONFIG_UPDATE) $(TIFF_DIR)/config
 	touch $(TIFF_DIR)/.unpacked
 
-$(TIFF_DIR)/.configured: $(TIFF_DIR)/.unpacked
+$(TIFF_DIR)/.configured: $(TIFF_DIR)/.unpacked \
+	$(STAGING_DIR)/usr/lib/libjpeg.a $(STAGING_DIR)/usr/lib/libz.so
 	(cd $(TIFF_DIR); rm -rf config.cache; \
 		$(TARGET_CONFIGURE_OPTS) \
 		$(TARGET_CONFIGURE_ARGS) \
@@ -67,7 +68,7 @@
 	cp -dpf $(STAGING_DIR)/usr/lib/libtiff.so* $(TARGET_DIR)/usr/lib/
 	-$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $@
 
-tiff: uclibc zlib jpeg $(TARGET_DIR)/usr/lib/libtiff.so
+tiff: uclibc $(TARGET_DIR)/usr/lib/libtiff.so
 
 tiff-clean:
 	-rm -f $(TARGET_DIR)/usr/lib/libtiff.so*
