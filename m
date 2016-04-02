From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 2 Apr 2016 17:18:32 +0200
Subject: [Buildroot] [git commit] wilc1000-firmware: new package
Message-ID: <20160402151914.69B88807BE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=261cef0fe9598eadfe8a8efa80def40640f2e9f8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Firmware for Atmel Wilc1000 wireless device.

Signed-off-by: Ludovic Desroches <ludovic.desroches@atmel.com>
[Thomas:
  - add missing hash file
  - simplify installation step]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                                |  1 +
 package/wilc1000-firmware/Config.in              |  6 ++++++
 package/wilc1000-firmware/wilc1000-firmware.hash |  2 ++
 package/wilc1000-firmware/wilc1000-firmware.mk   | 24 ++++++++++++++++++++++++
 4 files changed, 33 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 7b23519..64822bf 100644
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
diff --git a/package/wilc1000-firmware/wilc1000-firmware.hash b/package/wilc1000-firmware/wilc1000-firmware.hash
new file mode 100644
index 0000000..5344efe
--- /dev/null
+++ b/package/wilc1000-firmware/wilc1000-firmware.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 a2e7a327dd545ba2051946f7613005cbde88fdd952afb8eecdd1dacda7e767d2  v14.1_Firmware.zip
diff --git a/package/wilc1000-firmware/wilc1000-firmware.mk b/package/wilc1000-firmware/wilc1000-firmware.mk
new file mode 100644
index 0000000..5dcf190
--- /dev/null
+++ b/package/wilc1000-firmware/wilc1000-firmware.mk
@@ -0,0 +1,24 @@
+################################################################################
+#
+# wilc1000-firmware
+#
+################################################################################
+
+WILC1000_FIRMWARE_VERSION = 14.1
+WILC1000_FIRMWARE_SITE = https://github.com/linux4sc/wireless-firmware/archive
+WILC1000_FIRMWARE_SOURCE = v$(WILC1000_FIRMWARE_VERSION)_Firmware.zip
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
+	$(INSTALL) -D -m 0644 $(@D)/wilc1003_firmware.bin \
+		$(TARGET_DIR)/lib/firmware/atmel/wilc1003_firmware.bin
+endef
+
+$(eval $(generic-package))
