From: sjhill at uclibc.org <sjhill@uclibc.org>
Date: Sun,  6 May 2007 21:02:31 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/udev
Message-ID: <20070507040231.4133A48573@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: sjhill
Date: 2007-05-06 21:02:31 -0700 (Sun, 06 May 2007)
New Revision: 18578

Log:
Add ability to build 'scsi_id' utility for udev.


Modified:
   trunk/buildroot/package/udev/Config.in
   trunk/buildroot/package/udev/udev.mk


Changeset:
Modified: trunk/buildroot/package/udev/Config.in
===================================================================
--- trunk/buildroot/package/udev/Config.in	2007-05-07 04:01:58 UTC (rev 18577)
+++ trunk/buildroot/package/udev/Config.in	2007-05-07 04:02:31 UTC (rev 18578)
@@ -24,4 +24,11 @@
         help
           Build and install volume identification library.
 
+config BR2_PACKAGE_UDEV_SCSI_ID
+        bool "udev-scsi_id"
+        default n
+        depends on BR2_PACKAGE_UDEV
+        help
+          Build and install SCSI disk identification library.
+
 endmenu

Modified: trunk/buildroot/package/udev/udev.mk
===================================================================
--- trunk/buildroot/package/udev/udev.mk	2007-05-07 04:01:58 UTC (rev 18577)
+++ trunk/buildroot/package/udev/udev.mk	2007-05-07 04:02:31 UTC (rev 18578)
@@ -84,13 +84,35 @@
 	-$(MAKE) EXTRAS="extras/volume_id" -C $(UDEV_DIR) clean
 endif
 
-udev-clean:
+ifeq ($(strip $(BR2_PACKAGE_UDEV_SCSI_ID)),y)
+$(TARGET_DIR)/lib/udev/scsi_id: $(STAGING_DIR)/usr/lib/libvolume_id.so.0.72.0
+	$(MAKE) CROSS_COMPILE=$(TARGET_CROSS) \
+		USE_LOG=false USE_SELINUX=false \
+		udevdir=$(UDEV_ROOT) EXTRAS="extras/scsi_id" -C $(UDEV_DIR)
+	$(INSTALL) -m 0755 -D $(UDEV_DIR)/extras/scsi_id/scsi_id $(TARGET_DIR)/lib/udev/scsi_id
+	$(STRIP) --strip-unneeded $(TARGET_DIR)/lib/udev/scsi_id
+	$(MAKE) CROSS_COMPILE=$(TARGET_CROSS) \
+		USE_LOG=false USE_SELINUX=false \
+		udevdir=$(UDEV_ROOT) EXTRAS="extras/usb_id" -C $(UDEV_DIR)
+	$(INSTALL) -m 0755 -D $(UDEV_DIR)/extras/usb_id/usb_id $(TARGET_DIR)/lib/udev/usb_id
+	$(STRIP) --strip-unneeded $(TARGET_DIR)/lib/udev/usb_id
+
+udev-scsi_id: udev $(TARGET_DIR)/lib/udev/scsi_id
+
+udev-scsi_id-clean:
+	rm -f $(TARGET_DIR)/lib/udev/scsi_id
+
+udev-scsi_id-dirclean:
+	-$(MAKE) EXTRAS="extras/scsi_id" -C $(UDEV_DIR) clean
+endif
+
+udev-clean: udev-volume_id-clean udev-scsi_id-clean
 	rm -f $(TARGET_DIR)/etc/init.d/S10udev $(TARGET_DIR)/sbin/udev*
 	rm -f $(TARGET_DIR)/usr/sbin/udevmonitor $(TARGET_DIR)/usr/bin/udev*
 	rmdir $(TARGET_DIR)/sys
 	-$(MAKE) -C $(UDEV_DIR) clean
 
-udev-dirclean:
+udev-dirclean: udev-volume_id-dirclean udev-scsi_id-dirclean
 	rm -rf $(UDEV_DIR)
 
 #############################################################
@@ -105,3 +127,7 @@
 ifeq ($(strip $(BR2_PACKAGE_UDEV_VOLUME_ID)),y)
 TARGETS+=udev-volume_id
 endif
+
+ifeq ($(strip $(BR2_PACKAGE_UDEV_SCSI_ID)),y)
+TARGETS+=udev-scsi_id
+endif
