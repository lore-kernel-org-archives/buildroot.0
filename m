From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Tue, 24 Jan 2012 15:12:26 +0100
Subject: [Buildroot] [PATCH] New package: firmware
In-Reply-To: <1327414346-12587-1-git-send-email-yegorslists@googlemail.com>
References: <1327414346-12587-1-git-send-email-yegorslists@googlemail.com>
Message-ID: <1327414346-12587-2-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/Config.in            |    1 +
 package/firmware/Config.in   |   23 +++++++++++++++++++++++
 package/firmware/firmware.mk |   32 ++++++++++++++++++++++++++++++++
 3 files changed, 56 insertions(+), 0 deletions(-)
 create mode 100644 package/firmware/Config.in
 create mode 100644 package/firmware/firmware.mk

diff --git a/package/Config.in b/package/Config.in
index f219e37..4009367 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -168,6 +168,7 @@ source "package/dosfstools/Config.in"
 source "package/e2fsprogs/Config.in"
 source "package/eeprog/Config.in"
 source "package/fconfig/Config.in"
+source "package/firmware/Config.in"
 source "package/fis/Config.in"
 source "package/gadgetfs-test/Config.in"
 source "package/gdisk/Config.in"
diff --git a/package/firmware/Config.in b/package/firmware/Config.in
new file mode 100644
index 0000000..2f06a82
--- /dev/null
+++ b/package/firmware/Config.in
@@ -0,0 +1,23 @@
+config BR2_PACKAGE_FIRMWARE
+	bool "Firmware"
+	help
+	  This package provides various binary firmware files 
+	  for such devices like LAN, WLAN crads etc.
+
+if BR2_PACKAGE_FIRMWARE
+
+menu "Devices"
+
+config BR2_PACKAGE_FIRMWARE_TI
+	bool "Texas Instruments"
+	help
+	  Firmware files for WLAN and Bluetooth modules from TI
+
+config BR2_PACKAGE_FIRMWARE_RALINK
+	bool "Ralink"
+	help
+	  Firmware files for WLAN modules from Ralink Technology Corporation
+
+endmenu
+
+endif
diff --git a/package/firmware/firmware.mk b/package/firmware/firmware.mk
new file mode 100644
index 0000000..c615220
--- /dev/null
+++ b/package/firmware/firmware.mk
@@ -0,0 +1,32 @@
+#############################################################
+#
+# firmware
+#
+#############################################################
+FIRMWARE_VERSION = a2995d38c234e3d767df7223d84a0f33a1a24997
+FIRMWARE_SITE = git://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git
+FIRMWARE_SITE_METHOD = git
+
+ifeq ($(BR2_PACKAGE_FIRMWARE_TI),y)
+define FIRMWARE_TI_INSTALL_TO_TARGET
+	cp -r $(@D)/ti-connectivity/* $(TARGET_DIR)/lib/firmware
+	$(INSTALL) -m 0644 -D $(@D)/LICENCE.ti-connectivity \
+		$(TARGET_DIR)/lib/firmware
+endef
+endif
+
+ifeq ($(BR2_PACKAGE_FIRMWARE_RALINK),y)
+define FIRMWARE_RALINK_INSTALL_TO_TARGET
+	cp $(@D)/rt*.bin $(TARGET_DIR)/lib/firmware
+	$(INSTALL) -m 0644 -D $(@D)/LICENCE.ralink-firmware.txt \
+		$(TARGET_DIR)/lib/firmware
+endef
+endif
+
+define FIRMWARE_INSTALL_TARGET_CMDS
+	mkdir -p $(TARGET_DIR)/lib/firmware
+	$(FIRMWARE_TI_INSTALL_TO_TARGET)
+	$(FIRMWARE_RALINK_INSTALL_TO_TARGET)
+endef
+
+$(eval $(call GENTARGETS))
-- 
1.7.1.1
