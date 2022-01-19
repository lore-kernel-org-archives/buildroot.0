Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C210C433EF
	for <buildroot@archiver.kernel.org>; Wed, 19 Jan 2022 21:29:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CAD9760ABE;
	Wed, 19 Jan 2022 21:29:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oWZkQtyaef18; Wed, 19 Jan 2022 21:29:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DE1AD60B35;
	Wed, 19 Jan 2022 21:29:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 550B31BF3FC
 for <buildroot@lists.busybox.net>; Wed, 19 Jan 2022 21:28:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E63FB82925
 for <buildroot@lists.busybox.net>; Wed, 19 Jan 2022 21:28:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nxoitwa-lVqU for <buildroot@lists.busybox.net>;
 Wed, 19 Jan 2022 21:28:43 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id DD81B82977
 for <buildroot@buildroot.org>; Wed, 19 Jan 2022 21:28:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 1ACA681763; Wed, 19 Jan 2022 21:22:06 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed, 19 Jan 2022 22:24:11 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5ccb5f9dbe34cdbc54fdf658f5612fbce4bf0f94
X-Git-Newrev: 7527324132878f98999539bdd97bd3518747f585
X-Patchwork-Hint: ignore
Message-Id: <20220119212206.1ACA681763@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/brcmfmac_sdio-firmware-rpi: merge
 of rpi-{bt, wifi}-firmware
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=7527324132878f98999539bdd97bd3518747f585
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Move rpi-bt-firmware and rpi-wifi-firmware packages to the new
brcmfmac_sdio-firmware-rpi one (as they are the same upstream
package).

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
[yann.morin.1998@free.fr:
  - fix check-package
  - legacy symbols still depend on arm || aarch64
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 Config.in.legacy                                   | 20 +++++++++++++++
 DEVELOPERS                                         |  3 +--
 package/Config.in                                  |  3 +--
 package/brcmfmac_sdio-firmware-rpi/Config.in       | 29 ++++++++++++++++++++++
 .../brcmfmac_sdio-firmware-rpi.hash}               |  2 +-
 .../brcmfmac_sdio-firmware-rpi.mk}                 | 26 ++++++++++++++-----
 package/rpi-bt-firmware/Config.in                  |  9 -------
 package/rpi-bt-firmware/rpi-bt-firmware.hash       |  3 ---
 package/rpi-bt-firmware/rpi-bt-firmware.mk         | 17 -------------
 package/rpi-wifi-firmware/Config.in                | 13 ----------
 10 files changed, 72 insertions(+), 53 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index dd64b7da1b..c11cb846fb 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,26 @@ endif
 
 comment "Legacy options removed in 2022.02"
 
+config BR2_PACKAGE_RPI_BT_FIRMWARE
+	bool "rpi-bt-firmware package was renamed"
+	depends on BR2_arm || BR2_aarch64
+	select BR2_LEGACY
+	select BR2_PACKAGE_BRCMFMAC_SDIO_FIRMWARE_RPI
+	select BR2_PACKAGE_BRCMFMAC_SDIO_FIRMWARE_RPI_BT
+	help
+	  Package rpi-bt-firmware was moved as option to
+	  package brcmfmac-sdio-firmware-rpi.
+
+config BR2_PACKAGE_RPI_WIFI_FIRMWARE
+	bool "rpi-wifi-firmware package was renamed"
+	depends on BR2_arm || BR2_aarch64
+	select BR2_LEGACY
+	select BR2_PACKAGE_BRCMFMAC_SDIO_FIRMWARE_RPI
+	select BR2_PACKAGE_BRCMFMAC_SDIO_FIRMWARE_RPI_WIFI
+	help
+	  Package rpi-wifi-firmware was moved as option to
+	  package brcmfmac-sdio-firmware-rpi.
+
 config BR2_PACKAGE_HOST_GDB_PYTHON
 	bool "GDB Python2 support removed"
 	select BR2_LEGACY
diff --git a/DEVELOPERS b/DEVELOPERS
index a91e2dfcde..dc810b6fe1 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1832,12 +1832,11 @@ F:	configs/qemu_riscv64_virt_defconfig
 N:	Martin Bark <martin@barkynet.com>
 F:	board/raspberrypi/
 F:	configs/raspberrypi3_defconfig
+F:	package/brcmfmac_sdio-firmware-rpi/
 F:	package/ca-certificates/
 F:	package/connman/
 F:	package/nodejs/
-F:	package/rpi-bt-firmware/
 F:	package/rpi-firmware/
-F:	package/rpi-wifi-firmware/
 F:	package/tzdata/
 F:	package/zic/
 
diff --git a/package/Config.in b/package/Config.in
index 4df1474b91..85188ff873 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -420,14 +420,13 @@ menu "Firmware"
 	source "package/am33x-cm3/Config.in"
 	source "package/armbian-firmware/Config.in"
 	source "package/b43-firmware/Config.in"
+	source "package/brcmfmac_sdio-firmware-rpi/Config.in"
 	source "package/linux-firmware/Config.in"
 	source "package/murata-cyw-fw/Config.in"
 	source "package/odroidc2-firmware/Config.in"
 	source "package/qcom-db410c-firmware/Config.in"
 	source "package/rcw-smarc-sal28/Config.in"
-	source "package/rpi-bt-firmware/Config.in"
 	source "package/rpi-firmware/Config.in"
-	source "package/rpi-wifi-firmware/Config.in"
 	source "package/sunxi-boards/Config.in"
 	source "package/ts4900-fpga/Config.in"
 	source "package/ux500-firmware/Config.in"
diff --git a/package/brcmfmac_sdio-firmware-rpi/Config.in b/package/brcmfmac_sdio-firmware-rpi/Config.in
new file mode 100644
index 0000000000..73f400a2b7
--- /dev/null
+++ b/package/brcmfmac_sdio-firmware-rpi/Config.in
@@ -0,0 +1,29 @@
+config BR2_PACKAGE_BRCMFMAC_SDIO_FIRMWARE_RPI
+	bool "brcmfmac-sdio-firmware-rpi"
+	depends on BR2_arm || BR2_aarch64
+	help
+	  Raspberry Broadcom Bluetooth and Wifi firmware.
+
+	  https://github.com/LibreELEC/brcmfmac_sdio-firmware-rpi
+
+if BR2_PACKAGE_BRCMFMAC_SDIO_FIRMWARE_RPI
+
+config BR2_PACKAGE_BRCMFMAC_SDIO_FIRMWARE_RPI_BT
+	bool "brcmfmac-sdio-firmware-rpi-bt"
+	help
+	  Raspberry Pi 3 and Zero W Broadcom BCM43438 Bluetooth module
+	  firmware. Raspberry Pi 3 Model B+ Broadcom BCM4345C0
+	  Bluetooth module firmware.
+
+config BR2_PACKAGE_BRCMFMAC_SDIO_FIRMWARE_RPI_WIFI
+	bool "brcmfmac-sdio-firmware-rpi-wifi"
+	depends on !BR2_PACKAGE_LINUX_FIRMWARE_BRCM_BCM43XXX
+	help
+	  Raspberry Pi 3 and Zero W Broadcom BCM43430 wifi module
+	  NVRAM data. Raspberry Pi 3 Model B+ Broadcom BCM43455
+	  wifi module NVRAM data.
+
+comment "brcmfmac-sdio-firmware-rpi-wifi conflicts with linux-firmware Broadcom BRCM bcm43xx"
+	depends on BR2_PACKAGE_LINUX_FIRMWARE_BRCM_BCM43XXX
+
+endif
diff --git a/package/rpi-wifi-firmware/rpi-wifi-firmware.hash b/package/brcmfmac_sdio-firmware-rpi/brcmfmac_sdio-firmware-rpi.hash
similarity index 68%
rename from package/rpi-wifi-firmware/rpi-wifi-firmware.hash
rename to package/brcmfmac_sdio-firmware-rpi/brcmfmac_sdio-firmware-rpi.hash
index 7ff47b8cfe..a12e92cbac 100644
--- a/package/rpi-wifi-firmware/rpi-wifi-firmware.hash
+++ b/package/brcmfmac_sdio-firmware-rpi/brcmfmac_sdio-firmware-rpi.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  e51b717c2a60ca29fcdd8e04e07c00996226cb48fa56a8ad1934b5f4ddee2e3d  rpi-wifi-firmware-ea9963f3f77b4bb6cd280577eb115152bdd67e8d.tar.gz
+sha256  e51b717c2a60ca29fcdd8e04e07c00996226cb48fa56a8ad1934b5f4ddee2e3d  brcmfmac_sdio-firmware-rpi-ea9963f3f77b4bb6cd280577eb115152bdd67e8d.tar.gz
 sha256  b16056fc91b82a0e3e8de8f86c2dac98201aa9dc3cbd33e8d38f1b087fcec30d  LICENCE.broadcom_bcm43xx
diff --git a/package/rpi-wifi-firmware/rpi-wifi-firmware.mk b/package/brcmfmac_sdio-firmware-rpi/brcmfmac_sdio-firmware-rpi.mk
similarity index 62%
rename from package/rpi-wifi-firmware/rpi-wifi-firmware.mk
rename to package/brcmfmac_sdio-firmware-rpi/brcmfmac_sdio-firmware-rpi.mk
index b54cd359a4..5332bf53d7 100644
--- a/package/rpi-wifi-firmware/rpi-wifi-firmware.mk
+++ b/package/brcmfmac_sdio-firmware-rpi/brcmfmac_sdio-firmware-rpi.mk
@@ -1,15 +1,23 @@
 ################################################################################
 #
-# rpi-wifi-firmware
+# brcmfmac_sdio-firmware-rpi
 #
 ################################################################################
 
-RPI_WIFI_FIRMWARE_VERSION = ea9963f3f77b4bb6cd280577eb115152bdd67e8d
-RPI_WIFI_FIRMWARE_SITE = $(call github,LibreELEC,brcmfmac_sdio-firmware-rpi,$(RPI_WIFI_FIRMWARE_VERSION))
-RPI_WIFI_FIRMWARE_LICENSE = PROPRIETARY
-RPI_WIFI_FIRMWARE_LICENSE_FILES = LICENCE.broadcom_bcm43xx
+BRCMFMAC_SDIO_FIRMWARE_RPI_VERSION = ea9963f3f77b4bb6cd280577eb115152bdd67e8d
+BRCMFMAC_SDIO_FIRMWARE_RPI_SITE = $(call github,LibreELEC,brcmfmac_sdio-firmware-rpi,$(BRCMFMAC_SDIO_FIRMWARE_RPI_VERSION))
+BRCMFMAC_SDIO_FIRMWARE_RPI_LICENSE = PROPRIETARY
+BRCMFMAC_SDIO_FIRMWARE_RPI_LICENSE_FILES = LICENCE.broadcom_bcm43xx
 
-define RPI_WIFI_FIRMWARE_INSTALL_TARGET_CMDS
+ifeq ($(BR2_PACKAGE_BRCMFMAC_SDIO_FIRMWARE_RPI_BT),y)
+define BRCMFMAC_SDIO_FIRMWARE_RPI_INSTALL_TARGET_BT
+	$(INSTALL) -d $(TARGET_DIR)/lib/firmware/brcm
+	$(INSTALL) -m 0644 $(@D)/firmware/brcm/*.hcd $(TARGET_DIR)/lib/firmware/brcm
+endef
+endif
+
+ifeq ($(BR2_PACKAGE_BRCMFMAC_SDIO_FIRMWARE_RPI_WIFI),y)
+define BRCMFMAC_SDIO_FIRMWARE_RPI_INSTALL_TARGET_WIFI
 	$(INSTALL) -d $(TARGET_DIR)/lib/firmware/brcm
 	$(INSTALL) -m 0644 $(@D)/firmware/brcm/brcmfmac* $(TARGET_DIR)/lib/firmware/brcm
 	ln -sf ../cypress/cyfmac43430-sdio.bin $(TARGET_DIR)/lib/firmware/brcm/brcmfmac43430-sdio.bin
@@ -24,5 +32,11 @@ define RPI_WIFI_FIRMWARE_INSTALL_TARGET_CMDS
 	$(INSTALL) -d $(TARGET_DIR)/lib/firmware/cypress
 	$(INSTALL) -m 0644 $(@D)/firmware/cypress/cyfmac* $(TARGET_DIR)/lib/firmware/cypress
 endef
+endif
+
+define BRCMFMAC_SDIO_FIRMWARE_RPI_INSTALL_TARGET_CMDS
+	$(BRCMFMAC_SDIO_FIRMWARE_RPI_INSTALL_TARGET_BT)
+	$(BRCMFMAC_SDIO_FIRMWARE_RPI_INSTALL_TARGET_WIFI)
+endef
 
 $(eval $(generic-package))
diff --git a/package/rpi-bt-firmware/Config.in b/package/rpi-bt-firmware/Config.in
deleted file mode 100644
index 45643d6a52..0000000000
--- a/package/rpi-bt-firmware/Config.in
+++ /dev/null
@@ -1,9 +0,0 @@
-config BR2_PACKAGE_RPI_BT_FIRMWARE
-	bool "rpi-bt-firmware"
-	depends on BR2_arm || BR2_aarch64
-	help
-	  Raspberry Pi 3 and Zero W Broadcom BCM43438 Bluetooth module
-	  firmware. Raspberry Pi 3 Model B+ Broadcom BCM4345C0
-	  Bluetooth module firmware.
-
-	  https://github.com/LibreELEC/brcmfmac_sdio-firmware-rpi
diff --git a/package/rpi-bt-firmware/rpi-bt-firmware.hash b/package/rpi-bt-firmware/rpi-bt-firmware.hash
deleted file mode 100644
index a575a02e97..0000000000
--- a/package/rpi-bt-firmware/rpi-bt-firmware.hash
+++ /dev/null
@@ -1,3 +0,0 @@
-# Locally computed
-sha256  e51b717c2a60ca29fcdd8e04e07c00996226cb48fa56a8ad1934b5f4ddee2e3d  rpi-bt-firmware-ea9963f3f77b4bb6cd280577eb115152bdd67e8d.tar.gz
-sha256  b16056fc91b82a0e3e8de8f86c2dac98201aa9dc3cbd33e8d38f1b087fcec30d  LICENCE.broadcom_bcm43xx
diff --git a/package/rpi-bt-firmware/rpi-bt-firmware.mk b/package/rpi-bt-firmware/rpi-bt-firmware.mk
deleted file mode 100644
index f2d54f33bf..0000000000
--- a/package/rpi-bt-firmware/rpi-bt-firmware.mk
+++ /dev/null
@@ -1,17 +0,0 @@
-################################################################################
-#
-# rpi-bt-firmware
-#
-################################################################################
-
-RPI_BT_FIRMWARE_VERSION = ea9963f3f77b4bb6cd280577eb115152bdd67e8d
-RPI_BT_FIRMWARE_SITE = $(call github,LibreELEC,brcmfmac_sdio-firmware-rpi,$(RPI_BT_FIRMWARE_VERSION))
-RPI_BT_FIRMWARE_LICENSE = PROPRIETARY
-RPI_BT_FIRMWARE_LICENSE_FILES = LICENCE.broadcom_bcm43xx
-
-define RPI_BT_FIRMWARE_INSTALL_TARGET_CMDS
-	$(INSTALL) -d $(TARGET_DIR)/lib/firmware/brcm
-	$(INSTALL) -m 0644 $(@D)/firmware/brcm/*.hcd $(TARGET_DIR)/lib/firmware/brcm
-endef
-
-$(eval $(generic-package))
diff --git a/package/rpi-wifi-firmware/Config.in b/package/rpi-wifi-firmware/Config.in
deleted file mode 100644
index 7e81b286c0..0000000000
--- a/package/rpi-wifi-firmware/Config.in
+++ /dev/null
@@ -1,13 +0,0 @@
-config BR2_PACKAGE_RPI_WIFI_FIRMWARE
-	bool "rpi-wifi-firmware"
-	depends on BR2_arm || BR2_aarch64
-	depends on !BR2_PACKAGE_LINUX_FIRMWARE_BRCM_BCM43XXX
-	help
-	  Raspberry Pi 3 and Zero W Broadcom BCM43430 wifi module
-	  NVRAM data. Raspberry Pi 3 Model B+ Broadcom BCM43455
-	  wifi module NVRAM data.
-
-	  https://github.com/LibreELEC/brcmfmac_sdio-firmware-rpi
-
-comment "rpi-wifi-firmware conflicts with linux-firmware Broadcom BRCM bcm43xx"
-	depends on BR2_PACKAGE_LINUX_FIRMWARE_BRCM_BCM43XXX
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
