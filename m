From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Fri, 13 Feb 2009 19:58:00 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package/udev
Message-ID: <20090213195801.27F5576449@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-02-13 19:57:59 +0000 (Fri, 13 Feb 2009)
New Revision: 25327

Log:
udev: options for path_id and firmware.sh

Patch by Mike Crowe.

Modified:
   trunk/buildroot/package/udev/Config.in
   trunk/buildroot/package/udev/udev.mk


Changeset:
Modified: trunk/buildroot/package/udev/Config.in
===================================================================
--- trunk/buildroot/package/udev/Config.in	2009-02-13 18:57:43 UTC (rev 25326)
+++ trunk/buildroot/package/udev/Config.in	2009-02-13 19:57:59 UTC (rev 25327)
@@ -27,4 +27,15 @@
 	help
 	  Build and install SCSI disk identification library.
 
+config BR2_PACKAGE_UDEV_PATH_ID
+	bool "udev-path_id"
+	depends on BR2_PACKAGE_UDEV_VOLUME_ID
+	help
+	  Install udev's unique device path generation program path_id.
+
+config BR2_PACKAGE_UDEV_FIRMWARE_SH
+	bool "udev-firmware_sh"
+	depends on BR2_PACKAGE_UDEV_VOLUME_ID
+	help
+	  Install udev's firmware loading script firmware.sh.
 endmenu

Modified: trunk/buildroot/package/udev/udev.mk
===================================================================
--- trunk/buildroot/package/udev/udev.mk	2009-02-13 18:57:43 UTC (rev 25326)
+++ trunk/buildroot/package/udev/udev.mk	2009-02-13 19:57:59 UTC (rev 25327)
@@ -154,6 +154,54 @@
 UDEV_DIRCLEAN_DEPS+=udev-scsi_id-dirclean
 endif
 
+#####################################################################
+ifeq ($(BR2_PACKAGE_UDEV_PATH_ID),y)
+.PHONY: udev-path_id udev-path_id-clean udev-path_id-dirclean
+
+$(TARGET_DIR)/lib/udev/path_id: $(STAGING_DIR)/usr/lib/libvolume_id.so.$(UDEV_VOLUME_ID_VERSION)
+	$(MAKE) CROSS_COMPILE=$(TARGET_CROSS) \
+		CFLAGS="$(BR2_UDEV_CFLAGS)" \
+		USE_LOG=false USE_SELINUX=false \
+		udevdir=$(UDEV_ROOT) EXTRAS="extras/path_id" -C $(UDEV_DIR)
+	$(INSTALL) -m 0755 -D $(UDEV_DIR)/extras/path_id/path_id $@
+
+udev-path_id: udev $(TARGET_DIR)/lib/udev/path_id
+
+udev-path_id-clean:
+	rm -f $(TARGET_DIR)/lib/udev/path_id
+	rmdir --ignore-fail-on-non-empty $(TARGET_DIR)/lib/udev
+
+udev-path_id-dirclean:
+	-$(MAKE) EXTRAS="extras/path_id" -C $(UDEV_DIR) clean
+
+UDEV_CLEAN_DEPS+=udev-path_id-clean
+UDEV_DIRCLEAN_DEPS+=udev-path_id-dirclean
+endif
+
+#####################################################################
+ifeq ($(BR2_PACKAGE_UDEV_FIRMWARE_SH),y)
+.PHONY: udev-firmware_sh udev-firmware_sh-clean udev-firmware_sh-dirclean
+
+$(TARGET_DIR)/lib/udev/firmware.sh: $(STAGING_DIR)/usr/lib/libvolume_id.so.$(UDEV_VOLUME_ID_VERSION)
+	$(MAKE) CROSS_COMPILE=$(TARGET_CROSS) \
+		CFLAGS="$(BR2_UDEV_CFLAGS)" \
+		USE_LOG=false USE_SELINUX=false \
+		udevdir=$(UDEV_ROOT) EXTRAS="extras/firmware" -C $(UDEV_DIR)
+	$(INSTALL) -m 0755 -D $(UDEV_DIR)/extras/firmware/firmware.sh $@
+
+udev-firmware_sh: udev $(TARGET_DIR)/lib/udev/firmware.sh
+
+udev-firmware_sh-clean:
+	rm -f $(TARGET_DIR)/lib/udev/firmware.sh
+	rmdir --ignore-fail-on-non-empty $(TARGET_DIR)/lib/udev
+
+udev-firmware_sh-dirclean:
+	-$(MAKE) EXTRAS="extras/firmware" -C $(UDEV_DIR) clean
+
+UDEV_CLEAN_DEPS+=udev-firmware_sh-clean
+UDEV_DIRCLEAN_DEPS+=udev-firmware_sh-dirclean
+endif
+
 #############################################################
 #
 # Toplevel Makefile options
@@ -170,3 +218,11 @@
 ifeq ($(BR2_PACKAGE_UDEV_SCSI_ID),y)
 TARGETS+=udev-scsi_id
 endif
+
+ifeq ($(BR2_PACKAGE_UDEV_PATH_ID),y)
+TARGETS+=udev-path_id
+endif
+
+ifeq ($(BR2_PACKAGE_UDEV_FIRMWARE_SH),y)
+TARGETS+=udev-firmware_sh
+endif
