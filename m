From: Baruch Siach <baruch@tkos.co.il>
Date: Wed,  1 Feb 2017 15:23:43 +0200
Subject: [Buildroot] [PATCH] rpi-bt-firmware: new package
Message-ID: <53c705753b20aca425aa8acb2af8d19a36cd6ac4.1485955423.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add firmware file for the Raspberry Pi 3 Bluetooth module.

Note that to successfully download the firmware bluez5_utils needs a patch[1].

[1] http://www.spinics.net/lists/linux-bluetooth/msg69470.html

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/Config.in                          |  1 +
 package/rpi-bt-firmware/Config.in          |  7 +++++++
 package/rpi-bt-firmware/rpi-bt-firmware.mk | 21 +++++++++++++++++++++
 3 files changed, 29 insertions(+)
 create mode 100644 package/rpi-bt-firmware/Config.in
 create mode 100644 package/rpi-bt-firmware/rpi-bt-firmware.mk

diff --git a/package/Config.in b/package/Config.in
index 44aaf0887ede..8ad7d27e9de0 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -336,6 +336,7 @@ menu "Firmware"
 	source "package/b43-firmware/Config.in"
 	source "package/linux-firmware/Config.in"
 	source "package/rpi-firmware/Config.in"
+	source "package/rpi-bt-firmware/Config.in"
 	source "package/sunxi-boards/Config.in"
 	source "package/ts4900-fpga/Config.in"
 	source "package/ux500-firmware/Config.in"
diff --git a/package/rpi-bt-firmware/Config.in b/package/rpi-bt-firmware/Config.in
new file mode 100644
index 000000000000..366ce9196941
--- /dev/null
+++ b/package/rpi-bt-firmware/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_RPI_BT_FIRMWARE
+	bool "rpi-bt-firmware"
+	depends on BR2_arm || BR2_aarch64
+	help
+	  Raspberry Pi 3 Broadcom BCM43438 Bluetooth module firmware.
+
+	  https://aur.archlinux.org/packages/pi-bluetooth
diff --git a/package/rpi-bt-firmware/rpi-bt-firmware.mk b/package/rpi-bt-firmware/rpi-bt-firmware.mk
new file mode 100644
index 000000000000..255da1926211
--- /dev/null
+++ b/package/rpi-bt-firmware/rpi-bt-firmware.mk
@@ -0,0 +1,21 @@
+################################################################################
+#
+# rpi-bt-firmware
+#
+################################################################################
+
+RPI_BT_FIRMWARE_VERSION = a439f892bf549ddfefa9ba7ad1999cc515f233bf
+RPI_BT_FIRMWARE_SITE = https://aur.archlinux.org/pi-bluetooth.git
+RPI_BT_FIRMWARE_SITE_METHOD = git
+RPI_BT_FIRMWARE_LICENSE = PROPRIETARY
+RPI_BT_FIRMWARE_LICENSE_FILES = LICENCE.broadcom_bcm43xx
+
+# The BlueZ hciattach utility looks for firmware in /etc/firmware. Add a
+# compatibility symlink.
+define RPI_BT_FIRMWARE_INSTALL_TARGET_CMDS
+	ln -sf ../lib/firmware $(TARGET_DIR)/etc/firmware
+	$(INSTALL) -D -m 0644 $(@D)/BCM43430A1.hcd \
+		$(TARGET_DIR)/lib/firmware/BCM43430A1.hcd
+endef
+
+$(eval $(generic-package))
-- 
2.11.0
