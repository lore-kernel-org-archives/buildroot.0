From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Thu, 26 Jan 2012 12:30:14 +0100
Subject: [Buildroot] [PATCH v3] New package: linux-firmware
Message-ID: <1327577414-11374-1-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

add infrastructure for closed binary blobs

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
Changes:
v3:
	typo fix (Michael S. Zick)
v2: 
	change package name from firmware to linux-firmware (Gustavo Zacarias)
	create more granular options (Gustavo Zacarias)
 package/Config.in                        |    1 +
 package/linux-firmware/Config.in         |   46 +++++++++++++++++
 package/linux-firmware/linux-firmware.mk |   79 ++++++++++++++++++++++++++++++
 3 files changed, 126 insertions(+), 0 deletions(-)
 create mode 100644 package/linux-firmware/Config.in
 create mode 100644 package/linux-firmware/linux-firmware.mk

diff --git a/package/Config.in b/package/Config.in
index f219e37..10f9f79 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -185,6 +185,7 @@ source "package/input-tools/Config.in"
 source "package/iostat/Config.in"
 source "package/irda-utils/Config.in"
 source "package/kbd/Config.in"
+source "package/linux-firmware/Config.in"
 source "package/lm-sensors/Config.in"
 source "package/lsuio/Config.in"
 source "package/lvm2/Config.in"
diff --git a/package/linux-firmware/Config.in b/package/linux-firmware/Config.in
new file mode 100644
index 0000000..3ea002f
--- /dev/null
+++ b/package/linux-firmware/Config.in
@@ -0,0 +1,46 @@
+config BR2_PACKAGE_LINUX_FIRMWARE
+	bool "linux-firmware"
+	help
+	  This package provides various binary firmware files 
+	  (closed binary blobs) for such devices like LAN, WLAN cards etc.
+
+if BR2_PACKAGE_LINUX_FIRMWARE
+
+menu "Devices"
+
+menu "Texas Instruments"
+
+config BR2_PACKAGE_LINUX_FIRMWARE_TI_WL127X
+	bool "wl127X"
+	help
+	  Firmware files for WLAN and Bluetooth modules wl1271 and wl1273
+
+config BR2_PACKAGE_LINUX_FIRMWARE_TI_WL128X
+	bool "wl128X"
+	help
+	  Firmware files for WLAN and Bluetooth modules wl128x
+
+endmenu
+
+menu "Ralink"
+
+config BR2_PACKAGE_LINUX_FIRMWARE_RALINK_RT61
+	bool "Ralink rt2501/rt61"
+	help
+	  Ralink rt2501/rt61
+
+config BR2_PACKAGE_LINUX_FIRMWARE_RALINK_RT73
+	bool "Ralink rt73"
+	help
+	  Ralink rt73
+
+config BR2_PACKAGE_LINUX_FIRMWARE_RALINK_RT2XX
+	bool "Ralink rt27xx/rt28xx/rt30xx"
+	help
+	  Ralink rt27xx/rt28xx/rt30xx
+
+endmenu
+
+endmenu
+
+endif
diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
new file mode 100644
index 0000000..dda3f2b
--- /dev/null
+++ b/package/linux-firmware/linux-firmware.mk
@@ -0,0 +1,79 @@
+#############################################################
+#
+# linux-firmware
+#
+#############################################################
+LINUX_FIRMWARE_VERSION = a2995d38c234e3d767df7223d84a0f33a1a24997
+LINUX_FIRMWARE_SITE = git://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git
+LINUX_FIRMWARE_SITE_METHOD = git
+
+# wl127x
+ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_TI_WL127X),y)
+define FIRMWARE_TI_WL127X_INSTALL_TO_TARGET
+	cp -rf $(@D)/ti-connectivity/wl127* $(TARGET_DIR)/lib/firmware
+	$(INSTALL) -m 0644 -D $(@D)/ti-connectivity/TIInit_7.2.31.bts \
+		$(TARGET_DIR)/lib/firmware
+	$(INSTALL) -m 0644 -D $(@D)/LICENCE.ti-connectivity \
+		$(TARGET_DIR)/lib/firmware
+endef
+endif
+
+# wl128x
+ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_TI_WL128X),y)
+define FIRMWARE_TI_WL128X_INSTALL_TO_TARGET
+	cp -rf $(@D)/ti-connectivity/wl128* $(TARGET_DIR)/lib/firmware
+	$(INSTALL) -m 0644 -D $(@D)/ti-connectivity/TIInit_7.2.31.bts \
+		$(TARGET_DIR)/lib/firmware
+	$(INSTALL) -m 0644 -D $(@D)/LICENCE.ti-connectivity \
+		$(TARGET_DIR)/lib/firmware
+endef
+endif
+
+# rt2501/rt61
+ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_RALINK_RT61),y)
+define FIRMWARE_RALINK_RT61_INSTALL_TO_TARGET
+	$(INSTALL) -m 0644 -D $(@D)/rt2561.bin \
+		$(TARGET_DIR)/lib/firmware
+	$(INSTALL) -m 0644 -D $(@D)/rt2561s.bin \
+		$(TARGET_DIR)/lib/firmware
+	$(INSTALL) -m 0644 -D $(@D)/rt2661.bin \
+		$(TARGET_DIR)/lib/firmware
+	$(INSTALL) -m 0644 -D $(@D)/LICENCE.ralink-firmware.txt \
+		$(TARGET_DIR)/lib/firmware
+endef
+endif
+
+# rt73
+ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_RALINK_RT73),y)
+define FIRMWARE_RALINK_RT73_INSTALL_TO_TARGET
+	$(INSTALL) -m 0644 -D $(@D)/rt73.bin \
+		$(TARGET_DIR)/lib/firmware
+	$(INSTALL) -m 0644 -D $(@D)/LICENCE.ralink-firmware.txt \
+		$(TARGET_DIR)/lib/firmware
+endef
+endif
+
+# rt73
+ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_RALINK_RT2XX),y)
+define FIRMWARE_RALINK_RT2XX_INSTALL_TO_TARGET
+	$(INSTALL) -m 0644 -D $(@D)/rt2860.bin \
+		$(TARGET_DIR)/lib/firmware
+	$(INSTALL) -m 0644 -D $(@D)/rt2870.bin \
+		$(TARGET_DIR)/lib/firmware
+	$(INSTALL) -m 0644 -D $(@D)/rt3071.bin \
+		$(TARGET_DIR)/lib/firmware
+	cp -rf $(@D)/rt30* $(TARGET_DIR)/lib/firmware
+	$(INSTALL) -m 0644 -D $(@D)/LICENCE.ralink-firmware.txt \
+		$(TARGET_DIR)/lib/firmware
+endef
+endif
+
+define LINUX_FIRMWARE_INSTALL_TARGET_CMDS
+	$(FIRMWARE_TI_WL127X_INSTALL_TO_TARGET)
+	$(FIRMWARE_TI_WL128X_INSTALL_TO_TARGET)
+	$(FIRMWARE_RALINK_RT61_INSTALL_TO_TARGET)
+	$(FIRMWARE_RALINK_RT73_INSTALL_TO_TARGET)
+	$(FIRMWARE_RALINK_RT2XX_INSTALL_TO_TARGET)
+endef
+
+$(eval $(call GENTARGETS))
-- 
1.7.1.1
