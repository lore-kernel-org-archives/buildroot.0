From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 12 Apr 2020 10:24:31 +0300
Subject: [Buildroot] [PATCH v2 1/2] package/linux-firmware: drop redundant
 QCA6174 firmware symbol
Message-ID: <e8e22b2e19dcb0cd4182eb5f2c4032bbd6830758.1586676272.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

BR2_PACKAGE_LINUX_FIRMWARE_QUALCOMM_6174 is a superset of
BR2_PACKAGE_LINUX_FIRMWARE_ATHEROS_10K_QCA6174. Drop the redundant
symbol.

Add the full list of license files to
BR2_PACKAGE_LINUX_FIRMWARE_QUALCOMM_6174.

Add notice_ath10k_firmware-5.txt license file hash.

Cc: Yegor Yefremov <yegorslists@googlemail.com>
Reported-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
v2: New patch in this series
---
 Config.in.legacy                           |  8 ++++++++
 package/linux-firmware/Config.in           |  5 -----
 package/linux-firmware/linux-firmware.hash |  1 +
 package/linux-firmware/linux-firmware.mk   | 16 ++++------------
 4 files changed, 13 insertions(+), 17 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 49109cece538..95f17b1b31fb 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,14 @@ endif
 
 comment "Legacy options removed in 2020.05"
 
+config BR2_PACKAGE_LINUX_FIRMWARE_ATHEROS_10K_QCA6174
+	bool "duplicate QCA6174 firmware symbol removed"
+	select BR2_LEGACY
+	select BR2_PACKAGE_LINUX_FIRMWARE_QUALCOMM_6174
+	help
+	  This config symbol duplicates existing symbol for QCA6174
+	  firmware.
+
 config BR2_PACKAGE_QT5CANVAS3D
 	bool "qt5canvas3d was removed"
 	select BR2_LEGACY
diff --git a/package/linux-firmware/Config.in b/package/linux-firmware/Config.in
index fb884842d66b..a2b41ccc5b10 100644
--- a/package/linux-firmware/Config.in
+++ b/package/linux-firmware/Config.in
@@ -118,11 +118,6 @@ config BR2_PACKAGE_LINUX_FIRMWARE_ATHEROS_10K_QCA998X
 	help
 	  Firmware files for the Atheros QCA988X module
 
-config BR2_PACKAGE_LINUX_FIRMWARE_ATHEROS_10K_QCA6174
-	bool "Atheros 10k (QCA6174)"
-	help
-	  Firmware files for the Atheros QCA6174 module
-
 config BR2_PACKAGE_LINUX_FIRMWARE_BRCM_BCM43XX
 	bool "Broadcom BRCM bcm43xx"
 	help
diff --git a/package/linux-firmware/linux-firmware.hash b/package/linux-firmware/linux-firmware.hash
index 3878d9288170..2ebd11365f6f 100644
--- a/package/linux-firmware/linux-firmware.hash
+++ b/package/linux-firmware/linux-firmware.hash
@@ -5,6 +5,7 @@ sha256 8d5847d2971241d4d6a51c16e206379de53a6d4e203fa6f8e1c1e9279c7c4ad0 LICENSE.
 sha256 2d6062d63b91eb750bf741498691604f75184b9fee97608ec537cd09bd6a42b4 LICENCE.Marvell
 sha256 802b7014b26c606cf6248ae8b0ab1ce6d2d1b0db236d38dd269e676cd70710f2 LICENCE.atheros_firmware
 sha256 3b5eb392b2d9d8c46d6aae26d06c187e5ea3029b12d13bc2b8deb8b3ce6bfa53 ath10k/QCA6174/hw3.0/notice_ath10k_firmware-4.txt
+sha256 631065703055d11b099477c508508f20a80b202aad548a7726564bfa59a96c91 ath10k/QCA6174/hw2.1/notice_ath10k_firmware-5.txt
 sha256 8ce5c6ea0542bf4aac31fc3ae16a39792ad22d0eae4543063fac56fb3380f021 ath10k/QCA6174/hw3.0/notice_ath10k_firmware-6.txt
 sha256 b16056fc91b82a0e3e8de8f86c2dac98201aa9dc3cbd33e8d38f1b087fcec30d LICENCE.broadcom_bcm43xx
 sha256 a5777f9e80aca0603b0648454de996168b1c530322550ccda94d6d78bcf6c061 LICENCE.chelsio_firmware
diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index 21300ddc72de..530d5d665851 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -196,17 +196,6 @@ LINUX_FIRMWARE_FILES += ath10k/QCA988X/hw2.0/board.bin \
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.atheros_firmware
 endif
 
-# ath10k-qca6174
-ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_ATHEROS_10K_QCA6174),y)
-LINUX_FIRMWARE_FILES += ath10k/QCA6174/hw3.0/board.bin \
-			ath10k/QCA6174/hw3.0/board-2.bin \
-			ath10k/QCA6174/hw3.0/firmware-4.bin \
-			ath10k/QCA6174/hw3.0/firmware-6.bin
-LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.atheros_firmware \
-				ath10k/QCA6174/hw3.0/notice_ath10k_firmware-4.txt \
-				ath10k/QCA6174/hw3.0/notice_ath10k_firmware-6.txt
-endif
-
 # sd8686 v8
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_LIBERTAS_SD8686_V8),y)
 LINUX_FIRMWARE_FILES += libertas/sd8686_v8.bin libertas/sd8686_v8_helper.bin
@@ -312,7 +301,10 @@ endif
 # qca6174
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_QUALCOMM_6174),y)
 LINUX_FIRMWARE_FILES += ath10k/QCA6174
-LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENSE.QualcommAtheros_ath10k
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENSE.QualcommAtheros_ath10k \
+				ath10k/QCA6174/hw3.0/notice_ath10k_firmware-4.txt \
+				ath10k/QCA6174/hw2.1/notice_ath10k_firmware-5.txt \
+				ath10k/QCA6174/hw3.0/notice_ath10k_firmware-6.txt
 endif
 
 # CC2560(A)
-- 
2.25.1
