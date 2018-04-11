From: Andre Renaud <andre@ignavus.net>
Date: Thu, 12 Apr 2018 09:39:38 +1200
Subject: [Buildroot] [PATCH] Added Qualcomm video accelerator and GPU
 firmware option.
Message-ID: <20180411213938.5888-1-andre@ignavus.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Andre Renaud <arenaud@designa-electronics.com>

Signed-off-by: Andre Renaud <andre@ignavus.net>
---
 package/linux-firmware/Config.in           | 10 ++++++++++
 package/linux-firmware/linux-firmware.hash |  1 +
 package/linux-firmware/linux-firmware.mk   | 10 ++++++++++
 3 files changed, 21 insertions(+)

diff --git a/package/linux-firmware/Config.in b/package/linux-firmware/Config.in
index 4e77a3f9a3..fb64c527f9 100644
--- a/package/linux-firmware/Config.in
+++ b/package/linux-firmware/Config.in
@@ -29,6 +29,16 @@ config BR2_PACKAGE_LINUX_FIRMWARE_RADEON
 	help
 	  Firmware files for AMD Radeon video cards.
 
+config BR2_PACKAGE_LINUX_FIRMWARE_QCOM_VENUS
+	bool "Qualcomm Venus video codec accelerator"
+	help
+	  Firmware files for Qualcomm Venus video codec accelerator
+
+config BR2_PACKAGE_LINUX_FIRMWARE_QCOM_ADRENO
+	bool "Qualcomm Adreno GPU firmware"
+	help
+	  Firmware files for Qualcomm Adreno GPU firmware
+
 endmenu # Video
 
 menu "Bluetooth firmware"
diff --git a/package/linux-firmware/linux-firmware.hash b/package/linux-firmware/linux-firmware.hash
index 14c1935b27..c766689fc1 100644
--- a/package/linux-firmware/linux-firmware.hash
+++ b/package/linux-firmware/linux-firmware.hash
@@ -27,3 +27,4 @@ sha256 be904cd28cb292b80cdb6cf412ab0d9159d431671e987ad433c1f62e0988a9bc LICENSE.
 sha256 fc6223d4bfe9f2f9e2eddc44b9fe5721d0caf49f01cb08d602906add686d8c6f LICENSE.radeon
 sha256 2bdd2e716f05d9737d3f9a20f9a3a3c0caee0e866100ddb0673f1178e42f92b9 LICENSE.sdma_firmware
 sha256 9703115e298649dfad003d7d3d55f4b2bd417e28f19e9cf6d5c6f9a906a2c4d9 WHENCE
+sha256 fa43e1b9a13b341a07adca9dbe73d0f9072d7966fdfe811c01f0dd2872d7309a qcom/NOTICE.txt
diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index 6f0ba53800..efe5cdd7dd 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -24,6 +24,16 @@ LINUX_FIRMWARE_DIRS += radeon
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENSE.radeon
 endif
 
+ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_QCOM_VENUS),y)
+LINUX_FIRMWARE_DIRS += qcom/venus-1.8 qcom/venus-4.2
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENSE.qcom qcom/NOTICE.txt
+endif
+
+ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_QCOM_ADRENO),y)
+LINUX_FIRMWARE_FILES += qcom/a*
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENSE.qcom qcom/NOTICE.txt
+endif
+
 # Intel Wireless Bluetooth
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_IBT),y)
 LINUX_FIRMWARE_FILES += intel/ibt-*
-- 
2.15.1
