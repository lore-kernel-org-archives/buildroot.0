From: aldot at uclibc.org <aldot@uclibc.org>
Date: Tue, 21 Aug 2007 11:30:56 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/libusb
Message-ID: <20070821183056.11AA8A5D3C@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-08-21 11:30:54 -0700 (Tue, 21 Aug 2007)
New Revision: 19625

Log:
- pull in patches from debian.


Modified:
   trunk/buildroot/package/libusb/libusb.mk


Changeset:
Modified: trunk/buildroot/package/libusb/libusb.mk
===================================================================
--- trunk/buildroot/package/libusb/libusb.mk	2007-08-21 17:56:47 UTC (rev 19624)
+++ trunk/buildroot/package/libusb/libusb.mk	2007-08-21 18:30:54 UTC (rev 19625)
@@ -4,21 +4,31 @@
 #
 #############################################################
 LIBUSB_VERSION:=0.1.12
-LIBUSB_SOURCE:=libusb-$(LIBUSB_VERSION).tar.gz
-LIBUSB_SITE:=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/libusb/
+LIBUSB_PATCH_FILE:=libusb_$(LIBUSB_VERSION)-7.diff.gz
+LIBUSB_SOURCE:=libusb_$(LIBUSB_VERSION).orig.tar.gz
+#LIBUSB_SITE:=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/libusb/
+LIBUSB_SITE:=http://ftp.debian.org/debian/pool/main/libu/libusb
 LIBUSB_DIR:=$(BUILD_DIR)/libusb-$(LIBUSB_VERSION)
 LIBUSB_CAT:=$(ZCAT)
 LIBUSB_BINARY:=usr/lib/libusb.so
 
-$(DL_DIR)/$(LIBUSB_SOURCE):
+ifneq ($(LIBUSB_PATCH_FILE),)
+LIBUSB_PATCH=$(DL_DIR)/$(LIBUSB_PATCH_FILE)
+$(LIBUSB_PATCH):
+	$(WGET) -P $(DL_DIR) $(LIBUSB_SITE)/$(LIBUSB_PATCH_FILE)
+endif
+$(DL_DIR)/$(LIBUSB_SOURCE): $(LIBUSB_PATCH)
 	$(WGET) -P $(DL_DIR) $(LIBUSB_SITE)/$(LIBUSB_SOURCE)
 
-libusb-source: $(DL_DIR)/$(LIBUSB_SOURCE)
+libusb-source: $(DL_DIR)/$(LIBUSB_SOURCE) $(LIBUSB_PATCH)
 
 libusb-unpacked: $(LIBUSB_DIR)/.unpacked
 $(LIBUSB_DIR)/.unpacked: $(DL_DIR)/$(LIBUSB_SOURCE)
 	$(LIBUSB_CAT) $(DL_DIR)/$(LIBUSB_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	touch $(LIBUSB_DIR)/.unpacked
+ifneq ($(LIBUSB_PATCH_FILE),)
+	(cd $(LIBUSB_DIR) && $(LIBUSB_CAT) $(LIBUSB_PATCH) | patch -p1)
+endif
+	touch $@
 
 $(LIBUSB_DIR)/.configured: $(LIBUSB_DIR)/.unpacked
 	(cd $(LIBUSB_DIR); rm -rf config.cache; \
@@ -33,15 +43,15 @@
 		--disable-debug \
 		--disable-build-docs \
 	);
-	touch $(LIBUSB_DIR)/.configured
+	touch $@
 
 $(STAGING_DIR)/lib/libusb.so: $(LIBUSB_DIR)/.configured
-	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(LIBUSB_DIR)
+	$(MAKE) -C $(LIBUSB_DIR)
 	$(MAKE) -C $(LIBUSB_DIR) DESTDIR=$(STAGING_DIR) install
 
 $(TARGET_DIR)/$(LIBUSB_BINARY): $(STAGING_DIR)/lib/libusb.so
 	mkdir -p $(TARGET_DIR)/usr/lib
-	cp -a $(STAGING_DIR)/lib/libusb* $(TARGET_DIR)/usr/lib
+	cp -dpf $(STAGING_DIR)/lib/libusb* $(TARGET_DIR)/usr/lib
 	rm -f $(TARGET_DIR)/usr/lib/*.a $(TARGET_DIR)/usr/lib/*.la
 
 libusb: uclibc $(TARGET_DIR)/$(LIBUSB_BINARY)
@@ -57,8 +67,6 @@
 libusb-dirclean:
 	rm -rf $(LIBUSB_DIR)
 
-.PHONY: libusb
-
 #############################################################
 #
 # Toplevel Makefile options
