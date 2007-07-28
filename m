From: ulf at uclibc.org <ulf@uclibc.org>
Date: Sat, 28 Jul 2007 10:09:44 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/libmad
Message-ID: <20070728170944.058DEA5E34@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-07-28 10:09:44 -0700 (Sat, 28 Jul 2007)
New Revision: 19301

Log:
Use correct extension for libmad library

Modified:
   trunk/buildroot/package/libmad/libmad.mk


Changeset:
Modified: trunk/buildroot/package/libmad/libmad.mk
===================================================================
--- trunk/buildroot/package/libmad/libmad.mk	2007-07-28 17:05:38 UTC (rev 19300)
+++ trunk/buildroot/package/libmad/libmad.mk	2007-07-28 17:09:44 UTC (rev 19301)
@@ -16,6 +16,7 @@
 $(LIBMAD_DIR)/.unpacked: $(DL_DIR)/$(LIBMAD_SOURCE)
 	$(LIBMAD_CAT) $(DL_DIR)/$(LIBMAD_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
 	$(CONFIG_UPDATE) $(LIBMAD_DIR)
+	toolchain/patch-kernel.sh $(LIBMAD_DIR) package/libmad/ libmad-$(LIBMAD_VERSION)\*.patch\*
 	touch $@
 
 $(LIBMAD_DIR)/.configured: $(LIBMAD_DIR)/.unpacked
@@ -28,29 +29,30 @@
 		--build=$(GNU_HOST_NAME) \
 		--prefix=/usr \
 		--sysconfdir=/etc \
+		--disable-debugging \
+		--enable-speed \
 		$(DISABLE_NLS) \
 	);
 	touch $@
 
 $(LIBMAD_DIR)/libmad.la: $(LIBMAD_DIR)/.configured
 	rm -f $@
-	$(MAKE) CC=$(TARGET_CC) -C $(LIBMAD_DIR)
-	@touch -c $@
+	$(MAKE) -C $(LIBMAD_DIR)
 
-$(STAGING_DIR)/usr/lib/libmad.so: $(LIBMAD_DIR)/libmad.la
+$(STAGING_DIR)/usr/lib/libmad.0: $(LIBMAD_DIR)/libmad.la
 	$(MAKE) DESTDIR=$(STAGING_DIR) -C $(LIBMAD_DIR) install
 
-$(TARGET_DIR)/usr/lib/libmad.so: $(STAGING_DIR)/usr/lib/libmad.so
-	cp -dpf $(STAGING_DIR)/usr/lib/libmad.so* $(TARGET_DIR)/usr/lib/
-	$(STRIP) --strip-unneeded $(TARGET_DIR)/usr/lib/libmad.so*
-	@touch -c $@
+$(TARGET_DIR)/usr/lib/libmad.0: $(STAGING_DIR)/usr/lib/libmad.0
+	cp -dpf $(STAGING_DIR)/usr/lib/libmad $(TARGET_DIR)/usr/lib/
+	cp -dpf $(STAGING_DIR)/usr/lib/libmad.0* $(TARGET_DIR)/usr/lib/
+	$(STRIP) --strip-unneeded $(TARGET_DIR)/usr/lib/libmad*
 
-$(TARGET_DIR)/usr/lib/libmad.a: $(STAGING_DIR)/usr/lib/libmad.so
+$(TARGET_DIR)/usr/lib/libmad.a: $(STAGING_DIR)/usr/lib/libmad.0
 	mkdir -p $(TARGET_DIR)/usr/include
 	cp -dpf $(STAGING_DIR)/usr/include/mad.h $(TARGET_DIR)/usr/include/
 	cp -dpf $(STAGING_DIR)/usr/lib/libmad.*a $(TARGET_DIR)/usr/lib/
 
-libmad:	uclibc $(TARGET_DIR)/usr/lib/libmad.so
+libmad:	uclibc $(TARGET_DIR)/usr/lib/libmad.0
 
 libmad-headers: $(TARGET_DIR)/usr/lib/libmad.a
 
