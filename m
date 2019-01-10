From: dplamp at gmx.com <dplamp@gmx.com>
Date: Thu, 10 Jan 2019 18:11:16 +0100
Subject: [Buildroot] [PATCH 1/1] package/linux-firmware : Install binary
 blobs for e100 ethernet driver
Message-ID: <20190110171116.8176-1-dplamp@gmx.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: David Picard <dplamp@gmx.com>

Add an option in the menuconfig  submenu of linux-firmware package. Install
the firmware binary files to the target directory if the option is selected.

Signed-off-by: David Picard <dplamp@gmx.com>
---
 package/linux-firmware/Config.in         | 6 ++++++
 package/linux-firmware/linux-firmware.mk | 5 +++++
 2 files changed, 11 insertions(+)

diff --git a/package/linux-firmware/Config.in b/package/linux-firmware/Config.in
index dcc8d4bade..5df44d7a86 100644
--- a/package/linux-firmware/Config.in
+++ b/package/linux-firmware/Config.in
@@ -325,6 +325,12 @@ config BR2_PACKAGE_LINUX_FIRMWARE_CXGB4_T5
 	  Firmware files for Chelsio T5 1Gb and 10Gb ethernet cards
 	  (cxgb4)
 
+config BR2_PACKAGE_LINUX_FIRMWARE_E100
+	bool "e100 / Intel 825xx"
+	help
+	  Firmware files for Intel 825xx handled by driver e100
+	  (e100)
+
 config BR2_PACKAGE_LINUX_FIRMWARE_QLOGIC_4X
 	bool "QLogic FastLinQ 4xxxx"
 	help
diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index ee02c7a030..e2486dbeef 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -389,6 +389,11 @@ LINUX_FIRMWARE_FILES += cxgb4/t5fw*.bin
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.chelsio_firmware
 endif
 
+ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_E100),y)
+LINUX_FIRMWARE_FILES += e100/*.bin
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.e100
+endif
+
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_QLOGIC_4X),y)
 LINUX_FIRMWARE_FILES += \
 	qed/qed_init_values_zipped-*.bin
-- 
2.17.1
