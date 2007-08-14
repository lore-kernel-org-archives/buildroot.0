From: ulf at uclibc.org <ulf@uclibc.org>
Date: Mon, 13 Aug 2007 23:16:10 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/udev
Message-ID: <20070814061610.2E279A6811@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-08-13 23:16:08 -0700 (Mon, 13 Aug 2007)
New Revision: 19497

Log:
Change udev target from udev to udevd. Add .PHONY targets. Rearrange targets

Modified:
   trunk/buildroot/package/udev/udev.mk


Changeset:
Modified: trunk/buildroot/package/udev/udev.mk
===================================================================
--- trunk/buildroot/package/udev/udev.mk	2007-08-13 21:30:02 UTC (rev 19496)
+++ trunk/buildroot/package/udev/udev.mk	2007-08-14 06:16:08 UTC (rev 19497)
@@ -9,7 +9,7 @@
 UDEV_CAT:=$(BZCAT)
 UDEV_DIR:=$(BUILD_DIR)/udev-$(UDEV_VERSION)
 UDEV_TARGET_BINARY:=sbin/udevd
-UDEV_BINARY:=udev
+UDEV_BINARY:=udevd
 
 # 094 had _GNU_SOURCE set
 BR2_UDEV_CFLAGS:= -D_GNU_SOURCE $(TARGET_CFLAGS)
@@ -17,15 +17,12 @@
 BR2_UDEV_CFLAGS+=-U_FILE_OFFSET_BITS
 endif
 
-
 # UDEV_ROOT is /dev so we can replace devfs, not /udev for experiments
 UDEV_ROOT:=/dev
 
 $(DL_DIR)/$(UDEV_SOURCE):
 	 $(WGET) -P $(DL_DIR) $(UDEV_SITE)/$(UDEV_SOURCE)
 
-udev-source: $(DL_DIR)/$(UDEV_SOURCE)
-
 $(UDEV_DIR)/.unpacked: $(DL_DIR)/$(UDEV_SOURCE)
 	$(UDEV_CAT) $(DL_DIR)/$(UDEV_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
 	toolchain/patch-kernel.sh $(UDEV_DIR) package/udev \*.patch
@@ -36,10 +33,10 @@
 		CFLAGS="$(BR2_UDEV_CFLAGS)" \
 		USE_LOG=false USE_SELINUX=false \
 		udevdir=$(UDEV_ROOT) -C $(UDEV_DIR)
-	touch -c $(UDEV_DIR)/$(UDEV_BINARY)
+	touch -c $@
 
 $(TARGET_DIR)/$(UDEV_TARGET_BINARY): $(UDEV_DIR)/$(UDEV_BINARY)
-	-mkdir $(TARGET_DIR)/sys
+	-mkdir -p $(TARGET_DIR)/sys
 	$(MAKE) CROSS_COMPILE=$(TARGET_CROSS) DESTDIR=$(TARGET_DIR) \
 		CFLAGS="$(BR2_UDEV_CFLAGS)" \
 		LDFLAGS="-warn-common" \
@@ -56,8 +53,25 @@
 	rm -f $(TARGET_DIR)/usr/bin/udevtest
 endif
 
+#####################################################################
+.PHONY:	udev-source udev udev-clean udev-dirclean
+
 udev: uclibc $(TARGET_DIR)/$(UDEV_TARGET_BINARY)
 
+udev-source: $(DL_DIR)/$(UDEV_SOURCE)
+
+udev-clean: $(UDEV_CLEAN_DEPS)
+	rm -f $(TARGET_DIR)/etc/init.d/S10udev $(TARGET_DIR)/sbin/udev*
+	rm -f $(TARGET_DIR)/usr/sbin/udevmonitor $(TARGET_DIR)/usr/bin/udev*
+	rmdir $(TARGET_DIR)/sys
+	-$(MAKE) -C $(UDEV_DIR) clean
+
+udev-dirclean: $(UDEV_DIRCLEAN_DEPS)
+	rm -rf $(UDEV_DIR)
+
+#####################################################################
+.PHONY:	 udev-volume_id udev-volume_id-clean
+
 ifeq ($(strip $(BR2_PACKAGE_UDEV_VOLUME_ID)),y)
 $(STAGING_DIR)/usr/lib/libvolume_id.so.0.72.0:
 	$(MAKE) CROSS_COMPILE=$(TARGET_CROSS) \
@@ -74,7 +88,7 @@
 	-ln -sf libvolume_id.so.0.72.0 $(TARGET_DIR)/usr/lib/libvolume_id.so.0
 	$(STRIP) --strip-unneeded $(TARGET_DIR)/usr/lib/libvolume_id.so.0.72.0
 
-udev-volume_id: udev $(TARGET_DIR)/lib/udev/vol_id
+udev-volume_id: udev $(TARGET_DIR)/lib/udev/vol_id udev-volume_id-dirclean
 
 udev-volume_id-clean:
 	rm -f $(STAGING_DIR)/usr/include/libvolume_id.h
@@ -90,6 +104,9 @@
 UDEV_DIRCLEAN_DEPS+=udev-volume_id-dirclean
 endif
 
+#####################################################################
+.PHONY:	udev-scsi_id udev-scsi_id-clean udev-scsi_id-dirclean
+
 ifeq ($(strip $(BR2_PACKAGE_UDEV_SCSI_ID)),y)
 $(TARGET_DIR)/lib/udev/scsi_id: $(STAGING_DIR)/usr/lib/libvolume_id.so.0.72.0
 	$(MAKE) CROSS_COMPILE=$(TARGET_CROSS) \
@@ -115,15 +132,6 @@
 UDEV_DIRCLEAN_DEPS+=udev-scsi_id-dirclean
 endif
 
-udev-clean: $(UDEV_CLEAN_DEPS)
-	rm -f $(TARGET_DIR)/etc/init.d/S10udev $(TARGET_DIR)/sbin/udev*
-	rm -f $(TARGET_DIR)/usr/sbin/udevmonitor $(TARGET_DIR)/usr/bin/udev*
-	rmdir $(TARGET_DIR)/sys
-	-$(MAKE) -C $(UDEV_DIR) clean
-
-udev-dirclean: $(UDEV_DIRCLEAN_DEPS)
-	rm -rf $(UDEV_DIR)
-
 #############################################################
 #
 # Toplevel Makefile options
