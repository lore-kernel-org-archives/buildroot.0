From: David Lechner <david@lechnology.com>
Date: Thu, 27 Dec 2018 13:53:03 -0600
Subject: [Buildroot] [PATCH 1/3] linux-firmware: Add config option for TI
 CC2560(A) Bluetooth module
In-Reply-To: <20181227195305.5329-1-david@lechnology.com>
References: <20181227195305.5329-1-david@lechnology.com>
Message-ID: <20181227195305.5329-2-david@lechnology.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This adds a new config option to include the firmware files for the TI
CC2560 and CC2560A Bluetooth modules. LEGO MINDSTORMS EV3 has one of
these two modules depending on when it was manufactured, so it is useful
to include both firmwares to cover all cases for this device.

Signed-off-by: David Lechner <david@lechnology.com>
---
 package/linux-firmware/Config.in         | 5 +++++
 package/linux-firmware/linux-firmware.mk | 8 ++++++++
 2 files changed, 13 insertions(+)

diff --git a/package/linux-firmware/Config.in b/package/linux-firmware/Config.in
index bb88afeec2..dcc8d4bade 100644
--- a/package/linux-firmware/Config.in
+++ b/package/linux-firmware/Config.in
@@ -282,6 +282,11 @@ config BR2_PACKAGE_LINUX_FIRMWARE_REDPINE_RS9113
 	help
 	  Firmware files for WLAN and Bluetooth modules rs9113
 
+config BR2_PACKAGE_LINUX_FIRMWARE_TI_CC2560
+	bool "TI CC2560"
+	help
+	  Firmware files for Bluetooth modules CC2560 and CC2560A
+
 config BR2_PACKAGE_LINUX_FIRMWARE_TI_WL127X
 	bool "TI wl127x"
 	help
diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index e5cd56d9a5..ee02c7a030 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -249,6 +249,14 @@ LINUX_FIRMWARE_FILES += ath10k/QCA6174
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENSE.QualcommAtheros_ath10k
 endif
 
+# CC2560(A)
+ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_TI_CC2560),y)
+LINUX_FIRMWARE_FILES += \
+	ti-connectivity/TIInit_6.2.31.bts \
+	ti-connectivity/TIInit_6.6.15.bts
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.ti-connectivity
+endif
+
 # wl127x
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_TI_WL127X),y)
 # wl1271-nvs.bin is a symlink to wl127x-nvs.bin
-- 
2.17.1
