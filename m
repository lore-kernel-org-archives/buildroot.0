From: Floris Bos <bos@je-eigen-domein.nl>
Date: Sat,  2 May 2015 17:10:13 +0200
Subject: [Buildroot] [PATCH 1/2] rpi-firmware: allow disabling installation
	of binary DTBs
Message-ID: <1430579415-22802-1-git-send-email-bos@je-eigen-domein.nl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The binary .dtb files are not suitable for everyone as they are
kernel version specific.
Reintroduces BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTBS option.

Signed-off-by: Floris Bos <bos@je-eigen-domein.nl>
---
 package/rpi-firmware/Config.in       | 10 ++++++++++
 package/rpi-firmware/rpi-firmware.mk |  2 ++
 2 files changed, 12 insertions(+)

diff --git a/package/rpi-firmware/Config.in b/package/rpi-firmware/Config.in
index cd45be4..2de26e3 100644
--- a/package/rpi-firmware/Config.in
+++ b/package/rpi-firmware/Config.in
@@ -45,4 +45,14 @@ config BR2_PACKAGE_RPI_FIRMWARE_BOOT
 	default "_x"    if BR2_PACKAGE_RPI_FIRMWARE_X
 	default "_cd"   if BR2_PACKAGE_RPI_FIRMWARE_CD
 
+config BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTBS
+	bool "Install Device Tree Blobs (DTBs)"
+	default "y"
+	help
+	  Say 'y' here if you want to install the binary DTB files which
+	  are suitable for a rpi-3.18.y branch Linux kernel.
+
+	  Say 'n' here if you intend to compile the device tree files
+	  from kernel source instead.
+
 endif # BR2_PACKAGE_RPI_FIRMWARE
diff --git a/package/rpi-firmware/rpi-firmware.mk b/package/rpi-firmware/rpi-firmware.mk
index cbcf790..9cccb38 100644
--- a/package/rpi-firmware/rpi-firmware.mk
+++ b/package/rpi-firmware/rpi-firmware.mk
@@ -13,6 +13,7 @@ RPI_FIRMWARE_INSTALL_IMAGES = YES
 
 RPI_FIRMWARE_DEPENDENCIES += host-rpi-firmware
 
+ifeq ($(BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTBS),y)
 define RPI_FIRMWARE_INSTALL_DTB
 	$(INSTALL) -D -m 0644 $(@D)/boot/bcm2708-rpi-b.dtb $(BINARIES_DIR)/rpi-firmware/bcm2708-rpi-b.dtb
 	$(INSTALL) -D -m 0644 $(@D)/boot/bcm2708-rpi-b-plus.dtb $(BINARIES_DIR)/rpi-firmware/bcm2708-rpi-b-plus.dtb
@@ -21,6 +22,7 @@ define RPI_FIRMWARE_INSTALL_DTB
 		$(INSTALL) -D -m 0644 $${ovldtb} $(BINARIES_DIR)/rpi-firmware/overlays/$${ovldtb##*/} || exit 1; \
 	done
 endef
+endif
 
 define RPI_FIRMWARE_INSTALL_IMAGES_CMDS
 	$(INSTALL) -D -m 0644 $(@D)/boot/bootcode.bin $(BINARIES_DIR)/rpi-firmware/bootcode.bin
-- 
2.1.4
