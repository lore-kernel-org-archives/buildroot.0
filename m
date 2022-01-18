Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9690FC433EF
	for <buildroot@archiver.kernel.org>; Tue, 18 Jan 2022 21:15:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 39423414C1;
	Tue, 18 Jan 2022 21:15:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AS_fVKOwv4_J; Tue, 18 Jan 2022 21:15:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 37542414C5;
	Tue, 18 Jan 2022 21:15:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 078151BF33E
 for <buildroot@lists.busybox.net>; Tue, 18 Jan 2022 21:14:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EA70E60E41
 for <buildroot@lists.busybox.net>; Tue, 18 Jan 2022 21:14:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zfiSaR6otsyB for <buildroot@lists.busybox.net>;
 Tue, 18 Jan 2022 21:14:41 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5D11A60E08
 for <buildroot@buildroot.org>; Tue, 18 Jan 2022 21:14:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1642540478;
 bh=wWFrVohnzob7pFeF8oknqxDTyTmlcMzE3zDS4q95Jag=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=GFERnYu5NT5ALLsSj3/BrD9ZjZ8pV+HEn4zTAkpeFEhMPkdUlABCMC8L305HLkamW
 pmCSyj4hIofJ6GviIukmkAQYZ/RP9erChqrMxzsit14HXYlnJMarQeV/ZQjb/eJZPj
 OWNqX+srU94Z4QUf/dFT+5l7klRWhBDGWqMev19c=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.fritz.box ([62.216.209.124]) by mail.gmx.net
 (mrgmx004 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1MQMyZ-1mwXgi3x21-00MNea; Tue, 18 Jan 2022 22:14:38 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Tue, 18 Jan 2022 22:14:34 +0100
Message-Id: <20220118211434.9854-6-ps.report@gmx.net>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220118211434.9854-1-ps.report@gmx.net>
References: <20220118211434.9854-1-ps.report@gmx.net>
MIME-Version: 1.0
X-Provags-ID: V03:K1:yZbbP/FvsUPchdRXBtoSarD0N3iMYHpkfHBe6OVOLzTKZqgEyK2
 miaqyLtQrrgAKEfM2DtRbThEXarr0LSHm6gYWp6RGHRxDYt0bjYaSHjzf25K/Dee2axTE6o
 UpcaXrnmbOiJVhevXXZYpjkby9m26FRAVJDJEstMkPG3907zP7anpxPSzmq5VVynFivUEK5
 1QtqATpQluqBg5P/ROwGw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:UilwjhgZWPQ=:y3ZK8fXf/WKowJwxLiZEOH
 qIBbr6ArtFpB9clnZVMRQJLt52GsPCzbiRrB1rrx2GqNjaiMJJA1TU3SOKLIgi1Q9NF79Tvau
 TgXZ69XswmALd27wV9VsacneNe7TQEWfusZkvuMq+tiFrv/i9dTBwB7qakGaLfjczmlLb/Nof
 /FcfuR1xICIsTOPXKKRmtsLMRwz539fyJDq2tdZZ/mWL4yjbKkt5DXFwVpvDj38JvdYx6g+C0
 gVbwIRiIyZigpRdJ5y0M32bbyZzb/6PVGaTBCua0npvtw8cyasS8gSEljXIXgne63TbCI2lnH
 7Mu5ln/iBJO83givQQmFETSv0mNQYlFi1naipt8kAvVt2AHX+YbT0ayNj5XVIAQtta0neXKfG
 gfNLKtRpBPrzVuvW+d1F3yVmhnRMZmWl7p27wlwpPf0Br9qGhlUQRO5vOgkTj6L+tPSpLg3Dg
 BA0eJJPcA9Kbu/oGxwX9NePLqpYQ5fHIx2rPdeQl/29KRU2mXxLN5LwGY7z0m4OcrMdVRz7zJ
 3ZfDfZ7D4nv0mRdgd5lpTnCjPcmKVhmHoJKOloRd3/vKb2sr4MEOhkmVjYM7InKznU8cOtQ2L
 eCcBRKGmcU/Fj9eW6DBik7BD4gLwKBW8cBHfPUFBDr45l+Nd4BhlE1R+1a96AYdk0Bkts192a
 oK/Dh4ypjxEn3RCyhp7PMfNTZZ1E+Tuj0eOAC+9BYcwl86pOCwSq/eIOE7S2byAm7IZxfNNp/
 apOJhB041WeqJ8t/JlUhJgh7GggGaIknWFq6teFRM1+baKFX9hB2ywCLN3X0JDRhau0uUkeRI
 7soKOaG0NNUQvPh/x9k2PxgdPUMVHNSbp13aFMgEM9mXY+D6gPhQfmRudw0mLXI74x0MqdaqR
 kd9DqYoqCPuO4Rx0SVTbIbfng09MxJNgVZ+NmDgP1OSR3XSzneN7hkwNWl+F4oVRIreJCz3aH
 AmFJtodOucUbMmqOgv4RltdiiGYxEDrbvp6dErEqoxAdil3kG51W2HrlKnjydnWYMHeZohY3N
 n4F8k5FX9/r0StibZ2yOflgPNXuJjhC3i3xYQIzDiSiZxBttGDJuZOdxVeO0KiT1yVJZzXxKy
 GtvX58KT2KlbzY=
Subject: [Buildroot] [PATCH v1 6/6] package/brcmfmac_sdio-firmware-rpi: new
 package (former rpi-bt-firmware/rpi-wifi-firmware)
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
Cc: Martin Bark <martin@barkynet.com>,
 Julien Grossholtz <julien.grossholtz@openest.io>,
 Mahyar Koshkouei <mahyar.koshkouei@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Move rpi-bt-firmware and rpi-wifi-firmware packages to the new
brcmfmac_sdio-firmware-rpi one (as they share the same donwload).

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
Notes:
  - patch moved after the rpi-bt-firmware/rpi-wifi-firmware version bump
    as it saves some code/download duplication but the new package/name
    is harder to find/remember...
---
 Config.in.legacy                              | 18 ++++++++++++
 DEVELOPERS                                    |  3 +-
 package/Config.in                             |  3 +-
 package/brcmfmac_sdio-firmware-rpi/Config.in  | 29 +++++++++++++++++++
 .../brcmfmac_sdio-firmware-rpi.hash}          |  2 +-
 .../brcmfmac_sdio-firmware-rpi.mk}            | 27 +++++++++++++----
 package/rpi-bt-firmware/Config.in             |  9 ------
 package/rpi-bt-firmware/rpi-bt-firmware.hash  |  3 --
 package/rpi-bt-firmware/rpi-bt-firmware.mk    | 17 -----------
 package/rpi-wifi-firmware/Config.in           | 13 ---------
 10 files changed, 71 insertions(+), 53 deletions(-)
 create mode 100644 package/brcmfmac_sdio-firmware-rpi/Config.in
 rename package/{rpi-wifi-firmware/rpi-wifi-firmware.hash => brcmfmac_sdio-firmware-rpi/brcmfmac_sdio-firmware-rpi.hash} (68%)
 rename package/{rpi-wifi-firmware/rpi-wifi-firmware.mk => brcmfmac_sdio-firmware-rpi/brcmfmac_sdio-firmware-rpi.mk} (61%)
 delete mode 100644 package/rpi-bt-firmware/Config.in
 delete mode 100644 package/rpi-bt-firmware/rpi-bt-firmware.hash
 delete mode 100644 package/rpi-bt-firmware/rpi-bt-firmware.mk
 delete mode 100644 package/rpi-wifi-firmware/Config.in

diff --git a/Config.in.legacy b/Config.in.legacy
index dd64b7da1b..465d7bef90 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,24 @@ endif
 
 comment "Legacy options removed in 2022.02"
 
+config BR2_PACKAGE_RPI_BT_FIRMWARE
+	bool "rpi-bt-firmware package was renamed"
+	select BR2_LEGACY
+	select BR2_PACKAGE_BRCMFMAC_SDIO_FIRMWARE_RPI
+	select BR2_PACKAGE_BRCMFMAC_SDIO_FIRMWARE_RPI_BT
+	help
+	  Package rpi-bt-firmware was moved as option to
+	  package brcmfmac-sdio-firmware-rpi.
+ 
+config BR2_PACKAGE_RPI_WIFI_FIRMWARE
+	bool "rpi-wifi-firmware package was renamed"
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
index 4df1474b91..3b38af7232 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -419,15 +419,14 @@ menu "Hardware handling"
 menu "Firmware"
 	source "package/am33x-cm3/Config.in"
 	source "package/armbian-firmware/Config.in"
+	source "package/brcmfmac_sdio-firmware-rpi/Config.in"
 	source "package/b43-firmware/Config.in"
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
similarity index 61%
rename from package/rpi-wifi-firmware/rpi-wifi-firmware.mk
rename to package/brcmfmac_sdio-firmware-rpi/brcmfmac_sdio-firmware-rpi.mk
index b54cd359a4..4d1f285442 100644
--- a/package/rpi-wifi-firmware/rpi-wifi-firmware.mk
+++ b/package/brcmfmac_sdio-firmware-rpi/brcmfmac_sdio-firmware-rpi.mk
@@ -1,15 +1,24 @@
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
+
+ifeq ($(BR2_PACKAGE_BRCMFMAC_SDIO_FIRMWARE_RPI_BT),y)
+define BRCMFMAC_SDIO_FIRMWARE_RPI_INSTALL_TARGET_BT
+        $(INSTALL) -d $(TARGET_DIR)/lib/firmware/brcm
+        $(INSTALL) -m 0644 $(@D)/firmware/brcm/*.hcd $(TARGET_DIR)/lib/firmware/brcm
+endef
+endif
+
+ifeq ($(BR2_PACKAGE_BRCMFMAC_SDIO_FIRMWARE_RPI_WIFI),y)
+define BRCMFMAC_SDIO_FIRMWARE_RPI_INSTALL_TARGET_WIFI
 	$(INSTALL) -d $(TARGET_DIR)/lib/firmware/brcm
 	$(INSTALL) -m 0644 $(@D)/firmware/brcm/brcmfmac* $(TARGET_DIR)/lib/firmware/brcm
 	ln -sf ../cypress/cyfmac43430-sdio.bin $(TARGET_DIR)/lib/firmware/brcm/brcmfmac43430-sdio.bin
@@ -24,5 +33,11 @@ define RPI_WIFI_FIRMWARE_INSTALL_TARGET_CMDS
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
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
