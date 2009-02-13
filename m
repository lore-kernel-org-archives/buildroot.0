From: Mike Crowe <mac@mcrowe.com>
Date: Fri, 13 Feb 2009 13:51:08 +0000
Subject: [Buildroot] [PATCH] Add udev path_id and firmware.sh support
Message-ID: <20090213135108.GA4038@mcrowe.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch adds options to install udev's path_id and firmware.sh
extras into the target.

Signed-off-by: Mike Crowe <mac@mcrowe.com>

---
 Config.in |   11 +++++++++++
 udev.mk   |   56 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 67 insertions(+)

Index: package/udev/udev.mk
===================================================================
--- package/udev/udev.mk	(revision 25317)
+++ package/udev/udev.mk	(working copy)
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
Index: package/udev/Config.in
===================================================================
--- package/udev/Config.in	(revision 25317)
+++ package/udev/Config.in	(working copy)
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
