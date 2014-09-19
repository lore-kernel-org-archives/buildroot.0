From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 19 Sep 2014 23:14:52 +0200
Subject: [Buildroot] [PATCH 02/14] package/linux-firmware: split bcm43xx /
	bcm43xxx
In-Reply-To: <cover.1411161197.git.yann.morin.1998@free.fr>
References: <cover.1411161197.git.yann.morin.1998@free.fr>
Message-ID: <ef7765b2c9a12a68533a33f2951ebc1afb90ac09.1411161197.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

linux-firmware has gained a few firmware files for Broadcom WiFi
chipsets. Installing all of them takes a lot of place, when usually only
one is really needed.

Split the Broadcom BRCM drivers in two categories: bcm43xx and bcm43xxx,
when they were previously a single config option, so as to reclaim a bit
of space.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/linux-firmware/Config.in         | 10 +++++++---
 package/linux-firmware/linux-firmware.mk | 17 +++++++++++------
 2 files changed, 18 insertions(+), 9 deletions(-)

diff --git a/package/linux-firmware/Config.in b/package/linux-firmware/Config.in
index ba41598..3f94205 100644
--- a/package/linux-firmware/Config.in
+++ b/package/linux-firmware/Config.in
@@ -26,10 +26,14 @@ config BR2_PACKAGE_LINUX_FIRMWARE_ATHEROS_9271
 	  Firmware files for the Atheros 9271 module
 
 config BR2_PACKAGE_LINUX_FIRMWARE_BRCM_BCM43XX
-	bool "Broadcom BRCM bcm43xx/43xxx"
+	bool "Broadcom BRCM bcm43xx"
 	help
-	  Firmware files for the Broadcom bcm43xx and bcm43xxx,
-	  SoftMAC and FullMAC.
+	  Firmware files for the Broadcom bcm43xx SoftMAC and FullMAC.
+
+config BR2_PACKAGE_LINUX_FIRMWARE_BRCM_BCM43XXX
+	bool "Broadcom BRCM bcm43xxx"
+	help
+	  Firmware files for the Broadcom bcm43xxx, SoftMAC and FullMAC.
 
 config BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_3160
 	bool "Intel iwlwifi 3160"
diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index 43edf64..3da757f 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -183,14 +183,19 @@ LINUX_FIRMWARE_FILES += dvb-usb-terratec-h5-drxk.fw
 # which is installed unconditionally
 endif
 
-# brcm
+# brcm43xx
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_BRCM_BCM43XX),y)
 LINUX_FIRMWARE_FILES += brcm/bcm43xx-0.fw brcm/bcm43xx_hdr-0.fw \
-			brcm/bcm4329-fullmac-4.bin brcm/brcmfmac43236b.bin \
-			brcm/brcmfmac43241b0-sdio.bin brcm/brcmfmac43241b4-sdio.bin \
-			brcm/brcmfmac4329-sdio.bin brcm/brcmfmac4330-sdio.bin \
-			brcm/brcmfmac4334-sdio.bin brcm/brcmfmac4335-sdio.bin \
-			brcm/brcmfmac43362-sdio.bin
+			brcm/bcm4329-fullmac-4.bin brcm/brcmfmac4329-sdio.bin \
+			brcm/brcmfmac4330-sdio.bin brcm/brcmfmac4334-sdio.bin \
+			brcm/brcmfmac4335-sdio.bin
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.broadcom_bcm43xx
+endif
+
+# brcm43xxx
+ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_BRCM_BCM43XXX),y)
+LINUX_FIRMWARE_FILES += brcm/brcmfmac43236b.bin brcm/brcmfmac43241b0-sdio.bin \
+			brcm/brcmfmac43241b4-sdio.bin brcm/brcmfmac43362-sdio.bin
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.broadcom_bcm43xx
 endif
 
-- 
1.9.1
