From: Corentin Labbe <clabbe@baylibre.com>
Date: Mon, 12 Jul 2021 10:57:18 +0000
Subject: [Buildroot] [PATCH 1/1] package/linux-firmware: add option for V4L
 cx231xx devices
Message-ID: <20210712105718.4032192-1-clabbe@baylibre.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

V4L cx231xx devices need a firmware to be usefull.
So this patch adds a submenu for V4L firmwares and an option for
cx231xx devices.

Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
---
 package/linux-firmware/Config.in         | 9 +++++++++
 package/linux-firmware/linux-firmware.mk | 5 +++++
 2 files changed, 14 insertions(+)

diff --git a/package/linux-firmware/Config.in b/package/linux-firmware/Config.in
index 01d43f21dd..3720be7e63 100644
--- a/package/linux-firmware/Config.in
+++ b/package/linux-firmware/Config.in
@@ -518,4 +518,13 @@ config BR2_PACKAGE_LINUX_FIRMWARE_USB_SERIAL_TI
 
 endmenu
 
+menu "V4L Firmware"
+
+config BR2_PACKAGE_LINUX_FIRMWARE_V4L_CX231XX
+	bool "V4L CX231XX Firmware for Conexant Cx23100/101/102 USB broadcast A/V decoder"
+	help
+	  Firmware files for Conexant Cx23100/101/102 USB broadcast A/V decoder needed by the Linux CX231XX driver.
+
+endmenu
+
 endif
diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index 9adab67bf1..5ff8204571 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -672,6 +672,11 @@ LINUX_FIRMWARE_FILES += ti_3410.fw ti_5052.fw \
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.moxa
 endif
 
+ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_V4L_CX231XX),y)
+LINUX_FIRMWARE_FILES += v4l-cx231xx-avcore-01.fw
+# linux-firmware WHENCE specify no specific licence file
+endif
+
 ifneq ($(LINUX_FIRMWARE_FILES)$(LINUX_FIRMWARE_DIRS),)
 
 define LINUX_FIRMWARE_BUILD_CMDS
-- 
2.25.1
