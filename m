From: Stefan Agner <stefan@agner.ch>
Date: Mon, 28 Dec 2020 15:48:44 +0100
Subject: [Buildroot] [PATCH v2] package/linux-firmware: add new option for
 USB TI 3410/5052 firmwares
Message-ID: <959f9888c87ef2034082624c15158f795ae72a96.1609166898.git.stefan@agner.ch>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This adds generic firmware for USB TI 3410/5052 devices and a couple of
device specific firmwares.

Signed-off-by: Stefan Agner <stefan@agner.ch>
---
 package/linux-firmware/Config.in         |  9 +++++++++
 package/linux-firmware/linux-firmware.mk | 10 ++++++++++
 2 files changed, 19 insertions(+)

diff --git a/package/linux-firmware/Config.in b/package/linux-firmware/Config.in
index dbdfdb52b3..6d5e961527 100644
--- a/package/linux-firmware/Config.in
+++ b/package/linux-firmware/Config.in
@@ -490,4 +490,13 @@ config BR2_PACKAGE_LINUX_FIRMWARE_QAT_C62X
 
 endmenu
 
+menu "USB to Serial Firmware"
+
+config BR2_PACKAGE_LINUX_FIRMWARE_USB_SERIAL_TI
+	bool "USB TI 3410/5052 Serial Firmware"
+	help
+	  Firmware files for TI 3410/5052
+
+endmenu
+
 endif
diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index bc7650d758..dbcf135f26 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -626,6 +626,16 @@ LINUX_FIRMWARE_FILES += qat_c62x.bin qat_c62x_mmp.bin
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.qat_firmware
 endif
 
+ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_USB_SERIAL_TI),y)
+LINUX_FIRMWARE_FILES += ti_3410.fw ti_5052.fw \
+	mts_cdma.fw mts_gsm.fw mts_edge.fw mts_mt9234mu.fw mts_mt9234zba.fw \
+	moxa/moxa-1110.fw moxa/moxa-1130.fw moxa/moxa-1131.fw \
+	moxa/moxa-1150.fw moxa/moxa-1151.fw
+# Some firmware's license is in the file WHENCE
+# which is installed unconditionally
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.moxa
+endif
+
 ifneq ($(LINUX_FIRMWARE_FILES),)
 define LINUX_FIRMWARE_INSTALL_FILES
 	cd $(@D) && \
-- 
2.29.2
