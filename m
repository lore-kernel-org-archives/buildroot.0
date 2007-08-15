From: ulf at uclibc.org <ulf@uclibc.org>
Date: Wed, 15 Aug 2007 08:47:51 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/udev
Message-ID: <20070815154751.CD30CA459C@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-08-15 08:47:51 -0700 (Wed, 15 Aug 2007)
New Revision: 19515

Log:
Sync volume_id version to 0.79.0 matching udev-114

Modified:
   trunk/buildroot/package/udev/udev.mk


Changeset:
Modified: trunk/buildroot/package/udev/udev.mk
===================================================================
--- trunk/buildroot/package/udev/udev.mk	2007-08-15 09:47:49 UTC (rev 19514)
+++ trunk/buildroot/package/udev/udev.mk	2007-08-15 15:47:51 UTC (rev 19515)
@@ -4,6 +4,8 @@
 #
 #############################################################
 UDEV_VERSION:=114
+UDEV_VOLUME_ID_VERSION:=0.79.0
+
 UDEV_SOURCE:=udev-$(UDEV_VERSION).tar.bz2
 UDEV_SITE:=ftp://ftp.kernel.org/pub/linux/utils/kernel/hotplug/
 UDEV_CAT:=$(BZCAT)
@@ -73,20 +75,20 @@
 .PHONY:	 udev-volume_id udev-volume_id-clean
 
 ifeq ($(strip $(BR2_PACKAGE_UDEV_VOLUME_ID)),y)
-$(STAGING_DIR)/usr/lib/libvolume_id.so.0.72.0:
+$(STAGING_DIR)/usr/lib/libvolume_id.so.$(UDEV_VOLUME_ID_VERSION):
 	$(MAKE) CROSS_COMPILE=$(TARGET_CROSS) \
 		USE_LOG=false USE_SELINUX=false \
 		udevdir=$(UDEV_ROOT) EXTRAS="extras/volume_id" -C $(UDEV_DIR)
 	$(INSTALL) -m 0644 -D $(UDEV_DIR)/extras/volume_id/lib/libvolume_id.h $(STAGING_DIR)/usr/include/libvolume_id.h
-	$(INSTALL) -m 0755 -D $(UDEV_DIR)/extras/volume_id/lib/libvolume_id.so.0.72.0 $(STAGING_DIR)/usr/lib/libvolume_id.so.0.72.0
-	-ln -sf libvolume_id.so.0.72.0 $(STAGING_DIR)/usr/lib/libvolume_id.so.0
+	$(INSTALL) -m 0755 -D $(UDEV_DIR)/extras/volume_id/lib/libvolume_id.so.$(UDEV_VOLUME_ID_VERSION) $(STAGING_DIR)/usr/lib/libvolume_id.so.$(UDEV_VOLUME_ID_VERSION)
+	-ln -sf libvolume_id.so.$(UDEV_VOLUME_ID_VERSION) $(STAGING_DIR)/usr/lib/libvolume_id.so.0
 	-ln -sf libvolume_id.so.0 $(STAGING_DIR)/usr/lib/libvolume_id.so
 
-$(TARGET_DIR)/lib/udev/vol_id: $(STAGING_DIR)/usr/lib/libvolume_id.so.0.72.0
+$(TARGET_DIR)/lib/udev/vol_id: $(STAGING_DIR)/usr/lib/libvolume_id.so.$(UDEV_VOLUME_ID_VERSION)
 	$(INSTALL) -m 0755 -D $(UDEV_DIR)/extras/volume_id/vol_id $(TARGET_DIR)/lib/udev/vol_id
-	$(INSTALL) -m 0755 -D $(UDEV_DIR)/extras/volume_id/lib/libvolume_id.so.0.72.0 $(TARGET_DIR)/usr/lib/libvolume_id.so.0.72.0
-	-ln -sf libvolume_id.so.0.72.0 $(TARGET_DIR)/usr/lib/libvolume_id.so.0
-	$(STRIP) --strip-unneeded $(TARGET_DIR)/usr/lib/libvolume_id.so.0.72.0
+	$(INSTALL) -m 0755 -D $(UDEV_DIR)/extras/volume_id/lib/libvolume_id.so.$(UDEV_VOLUME_ID_VERSION) $(TARGET_DIR)/usr/lib/libvolume_id.so.$(UDEV_VOLUME_ID_VERSION)
+	-ln -sf libvolume_id.so.$(UDEV_VOLUME_ID_VERSION) $(TARGET_DIR)/usr/lib/libvolume_id.so.0
+	$(STRIP) --strip-unneeded $(TARGET_DIR)/usr/lib/libvolume_id.so.$(UDEV_VOLUME_ID_VERSION)
 
 udev-volume_id: udev $(TARGET_DIR)/lib/udev/vol_id udev-volume_id-dirclean
 
@@ -108,7 +110,7 @@
 .PHONY:	udev-scsi_id udev-scsi_id-clean udev-scsi_id-dirclean
 
 ifeq ($(strip $(BR2_PACKAGE_UDEV_SCSI_ID)),y)
-$(TARGET_DIR)/lib/udev/scsi_id: $(STAGING_DIR)/usr/lib/libvolume_id.so.0.72.0
+$(TARGET_DIR)/lib/udev/scsi_id: $(STAGING_DIR)/usr/lib/libvolume_id.so.$(UDEV_VOLUME_ID_VERSION)
 	$(MAKE) CROSS_COMPILE=$(TARGET_CROSS) \
 		USE_LOG=false USE_SELINUX=false \
 		udevdir=$(UDEV_ROOT) EXTRAS="extras/scsi_id" -C $(UDEV_DIR)
