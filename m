From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 19 Jul 2021 23:28:23 +0200
Subject: [Buildroot] [git commit] package/linux-firmware: add option for V4L
 cx231xx devices
Message-ID: <20210719205443.4D56288451@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

commit: https://git.buildroot.net/buildroot/commit/?id=54371c745c5727f2747fef95e62a07a0f3e803c0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

V4L cx231xx devices need a firmware to be useful. So this patch adds
a submenu for V4L firmwares and an option for cx231xx devices.

Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/linux-firmware/Config.in         | 10 ++++++++++
 package/linux-firmware/linux-firmware.mk |  6 ++++++
 2 files changed, 16 insertions(+)

diff --git a/package/linux-firmware/Config.in b/package/linux-firmware/Config.in
index 01d43f21dd..4376d44bda 100644
--- a/package/linux-firmware/Config.in
+++ b/package/linux-firmware/Config.in
@@ -518,4 +518,14 @@ config BR2_PACKAGE_LINUX_FIRMWARE_USB_SERIAL_TI
 
 endmenu
 
+menu "V4L Firmware"
+
+config BR2_PACKAGE_LINUX_FIRMWARE_CX231XX
+	bool "Conexant Cx23100/101/102 USB broadcast A/V decoder"
+	help
+	  Firmware files for Conexant Cx23100/101/102 USB broadcast
+	  A/V decoder needed by the Linux CX231XX driver.
+
+endmenu
+
 endif
diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index 9adab67bf1..90a38196fb 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -672,6 +672,12 @@ LINUX_FIRMWARE_FILES += ti_3410.fw ti_5052.fw \
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.moxa
 endif
 
+ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_CX231XX),y)
+LINUX_FIRMWARE_FILES += v4l-cx231xx-avcore-01.fw
+# No license file; the license is in the file WHENCE
+# which is installed unconditionally
+endif
+
 ifneq ($(LINUX_FIRMWARE_FILES)$(LINUX_FIRMWARE_DIRS),)
 
 define LINUX_FIRMWARE_BUILD_CMDS
