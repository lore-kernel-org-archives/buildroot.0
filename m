From: aldot at uclibc.org <aldot@uclibc.org>
Date: Tue, 28 Aug 2007 05:41:56 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/jpeg
Message-ID: <20070828124156.1882FA65F0@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-08-28 05:41:56 -0700 (Tue, 28 Aug 2007)
New Revision: 19712

Log:
- use correct include dir (Simon Pasch)
- cleanup while at it


Modified:
   trunk/buildroot/package/jpeg/jpeg.mk


Changeset:
Modified: trunk/buildroot/package/jpeg/jpeg.mk
===================================================================
--- trunk/buildroot/package/jpeg/jpeg.mk	2007-08-28 11:23:23 UTC (rev 19711)
+++ trunk/buildroot/package/jpeg/jpeg.mk	2007-08-28 12:41:56 UTC (rev 19712)
@@ -35,7 +35,7 @@
 	$(JPEG_CAT) $(DL_DIR)/$(JPEG_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
 	toolchain/patch-kernel.sh $(JPEG_DIR) package/jpeg/ jpeg\*.patch
 	$(CONFIG_UPDATE) $(JPEG_DIR)
-	touch $(JPEG_DIR)/.unpacked
+	touch $@
 
 $(JPEG_DIR)/.configured: $(JPEG_DIR)/.unpacked
 	(cd $(JPEG_DIR); rm -rf config.cache; \
@@ -54,28 +54,28 @@
 		--sysconfdir=/etc \
 		--datadir=/usr/share \
 		--localstatedir=/var \
-		--includedir=/include \
+		--includedir=/usr/include \
 		--mandir=/usr/man \
 		--infodir=/usr/info \
 		--enable-shared \
 		--enable-static \
 		--without-x \
 	)
-	touch $(JPEG_DIR)/.configured
+	touch $@
 
 $(JPEG_DIR)/.libs/libjpeg.a: $(JPEG_DIR)/.configured
 	$(MAKE) -C $(JPEG_DIR) all
-	touch -c $(JPEG_DIR)/.libs/libjpeg.a
+	touch -c $@
 
 $(STAGING_DIR)/lib/libjpeg.a: $(JPEG_DIR)/.libs/libjpeg.a
 	$(MAKE) DESTDIR=$(STAGING_DIR) -C $(JPEG_DIR) install-headers install-lib
 	rm $(STAGING_DIR)/lib/libjpeg.la
-	touch -c $(STAGING_DIR)/lib/libjpeg.a
+	touch -c $@
 
 $(TARGET_DIR)/usr/lib/libjpeg.so: $(STAGING_DIR)/lib/libjpeg.a
 	cp -dpf $(STAGING_DIR)/lib/libjpeg.so* $(TARGET_DIR)/usr/lib/
 	-$(STRIP) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/lib/libjpeg.so*
-	touch -c $(TARGET_DIR)/usr/lib/libjpeg.so
+	touch -c $@
 
 jpeg: uclibc $(TARGET_DIR)/usr/lib/libjpeg.so
 
