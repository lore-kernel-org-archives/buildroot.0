From: Ludovic Desroches <ludovic.desroches@atmel.com>
Date: Fri, 1 Apr 2016 08:19:36 +0200
Subject: [Buildroot] [PATCH] wilc1000-firmware: new package
Message-ID: <1459491576-32280-1-git-send-email-ludovic.desroches@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Firmware for Atmel Wilc1000 wireless device.

Signed-off-by: Ludovic Desroches <ludovic.desroches@atmel.com>
---
 package/Config.in                              |  1 +
 package/wilc1000-firmware/Config.in            |  6 ++++++
 package/wilc1000-firmware/wilc1000-firmware.mk | 25 +++++++++++++++++++++++++
 3 files changed, 32 insertions(+)
 create mode 100644 package/wilc1000-firmware/Config.in
 create mode 100644 package/wilc1000-firmware/wilc1000-firmware.mk

diff --git a/package/Config.in b/package/Config.in
index 1467f33..661b010 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -336,6 +336,7 @@ menu "Firmware"
 	source "package/rpi-firmware/Config.in"
 	source "package/sunxi-boards/Config.in"
 	source "package/ux500-firmware/Config.in"
+	source "package/wilc1000-firmware/Config.in"
 	source "package/zd1211-firmware/Config.in"
 endmenu
 	source "package/a10disp/Config.in"
diff --git a/package/wilc1000-firmware/Config.in b/package/wilc1000-firmware/Config.in
new file mode 100644
index 0000000..df8a7a6
--- /dev/null
+++ b/package/wilc1000-firmware/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_WILC1000_FIRMWARE
+	bool "wilc1000-firmware"
+	help
+	  Firmware for Atmel Wilc1000 wireless device
+
+	  https://github.com/linux4sc/wireless-firmware.git
diff --git a/package/wilc1000-firmware/wilc1000-firmware.mk b/package/wilc1000-firmware/wilc1000-firmware.mk
new file mode 100644
index 0000000..a3ec86f
--- /dev/null
+++ b/package/wilc1000-firmware/wilc1000-firmware.mk
@@ -0,0 +1,25 @@
+################################################################################
+#
+# wilc1000-firmware
+#
+################################################################################
+
+WILC1000_FIRMWARE_VERSION = 14.1
+WILC1000_FIRMWARE_SITE = https://github.com/linux4sc/wireless-firmware/archive
+WILC1000_FIRMWARE_SOURCE = v$(WILC1000_FIRMWARE_VERSION)_Firmware.zip
+WILC1000_FIRMWARE_DRIVER_FILE = wilc1003_firmware.bin
+
+WILC1000_FIRMWARE_LICENSE = PROPRIETARY
+
+define WILC1000_FIRMWARE_EXTRACT_CMDS
+	$(UNZIP) -d $(BUILD_DIR) $(DL_DIR)/$(WILC1000_FIRMWARE_SOURCE)
+	mv $(BUILD_DIR)/wireless-firmware-$(WILC1000_FIRMWARE_VERSION)_Firmware/* $(@D)
+	rmdir $(BUILD_DIR)/wireless-firmware-$(WILC1000_FIRMWARE_VERSION)_Firmware
+endef
+
+define WILC1000_FIRMWARE_INSTALL_TARGET_CMDS
+	$(INSTALL) -d -m 0755 $(TARGET_DIR)/lib/firmware/atmel/
+	cp $(@D)/$(WILC1000_FIRMWARE_DRIVER_FILE) $(TARGET_DIR)/lib/firmware/atmel/
+endef
+
+$(eval $(generic-package))
-- 
2.5.0
