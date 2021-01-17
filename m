From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 17 Jan 2021 15:18:27 +0100
Subject: [Buildroot] [git commit] package/linux-firmware: remove imx sdma
 firmware
Message-ID: <20210117140154.209C087F72@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8d398f7f3e4eda64f799ddf9cbdae00c27681488
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As reported on the mailing list [1], the imx sdma firmwares for
imx[6,7,8] are provided by two packages: firmware-imx and
linux-firmware

$ sha256sum ./firmware-imx-8.10/firmware/sdma/sdma-imx6q.bin
7790c161b7e013a9dbcbffb17cc5d4cb63d952949a505647e4679f02d04c4784
./firmware-imx-8.10/firmware/sdma/sdma-imx6q.bin

$ sha256sum  ./linux-firmware-20201022/imx/sdma/sdma-imx6q.bin
7790c161b7e013a9dbcbffb17cc5d4cb63d952949a505647e4679f02d04c4784
./linux-firmware-20201022/imx/sdma/sdma-imx6q.bin

firmware-imx also has firmwares for older variants as well, so this is
what we keep as the only imx sdma firmware provider.

[1] http://lists.busybox.net/pipermail/buildroot/2021-January/300938.html

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Stephane Viau <stephane.viau@oss.nxp.com>
Cc: Gary Bisson <gary.bisson@boundarydevices.com>
[yann.morin.1998 at free.fr: explain why we keep firmware-imx]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 Config.in.legacy                         | 8 ++++++++
 package/linux-firmware/Config.in         | 9 ---------
 package/linux-firmware/linux-firmware.mk | 6 ------
 3 files changed, 8 insertions(+), 15 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 3c022d21d7..a322d18cb3 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,14 @@ endif
 
 comment "Legacy options removed in 2021.02"
 
+config BR2_PACKAGE_LINUX_FIRMWARE_IMX_SDMA
+	bool "imx sdma firmware is provided by firmware-imx"
+	select BR2_LEGACY
+	select BR2_PACKAGE_FIRMWARE_IMX
+	help
+	  linux-firmware provide the same firmware as firmware-imx.
+	  We prefer using firmware-imx as the only provider.
+
 config BR2_GDB_VERSION_8_2
 	bool "gdb 8.2.x has been removed"
 	select BR2_LEGACY
diff --git a/package/linux-firmware/Config.in b/package/linux-firmware/Config.in
index 8e71c21251..a41310ff2a 100644
--- a/package/linux-firmware/Config.in
+++ b/package/linux-firmware/Config.in
@@ -459,15 +459,6 @@ config BR2_PACKAGE_LINUX_FIRMWARE_XCx000
 
 endmenu
 
-menu "SoC Firmware"
-
-config BR2_PACKAGE_LINUX_FIRMWARE_IMX_SDMA
-	bool "Freescale i.MX SDMA"
-	help
-	  Firmware files for i.MX SDMA.
-
-endmenu
-
 menu "Fibre Channel Adapter Firmware"
 
 config BR2_PACKAGE_LINUX_FIRMWARE_QLOGIC_2XXX
diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index 22fac9d7aa..f23da171c6 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -64,12 +64,6 @@ LINUX_FIRMWARE_FILES += qca/rampatch_usb_00000302.bin qca/nvm_usb_00000302.bin
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENSE.qcom
 endif
 
-# Freescale i.MX SDMA
-ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_IMX_SDMA),y)
-LINUX_FIRMWARE_FILES += imx/sdma/sdma-imx6q.bin imx/sdma/sdma-imx7d.bin
-LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENSE.sdma_firmware
-endif
-
 # rt2501/rt61
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_RALINK_RT61),y)
 LINUX_FIRMWARE_FILES += rt2561.bin rt2561s.bin rt2661.bin
