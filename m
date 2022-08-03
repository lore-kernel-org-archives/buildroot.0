Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8102FC19F2B
	for <buildroot@archiver.kernel.org>; Wed,  3 Aug 2022 21:52:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 17D4D4026F;
	Wed,  3 Aug 2022 21:52:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 17D4D4026F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cimUptWZ5c9d; Wed,  3 Aug 2022 21:52:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DE88E4021C;
	Wed,  3 Aug 2022 21:52:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DE88E4021C
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 677811BF325
 for <buildroot@lists.busybox.net>; Wed,  3 Aug 2022 21:52:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 48A084038C
 for <buildroot@lists.busybox.net>; Wed,  3 Aug 2022 21:52:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 48A084038C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2pXL0A4Voz_G for <buildroot@lists.busybox.net>;
 Wed,  3 Aug 2022 21:52:20 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id E690C40354
 for <buildroot@buildroot.org>; Wed,  3 Aug 2022 21:52:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E690C40354
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id E2E7B86E20; Wed,  3 Aug 2022 21:38:16 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 3 Aug 2022 23:52:14 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7d0d3987e921e24f46db11590cf27d6bd5780d00
X-Git-Newrev: 1500b7d5c818fb021eaa8741eec8130cbbf3477e
X-Patchwork-Hint: ignore
Message-Id: <20220803213816.E2E7B86E20@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/broadcom_northstar: new defconfig
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0205620506139504040=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0205620506139504040==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=1500b7d5c818fb021eaa8741eec8130cbbf3477e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Broadcom Northstar family of SoCs is most commonly used for home
routers. It's an ARM platform with Cortex-A9 CPU(s).

All known Northstar devices come with CFE bootloader which almost
always expects a TRX firmware format (with exception for D-Link). Some
vendors (like Luxul and Netgear) wrap TRX in their own containers.

This board code provides:

1. Minimal kernel with support for on-SoC blocks. It enables Linux
drivers for SoC, watchdog, Ethernet, switch, USB, PCIe, LEDs).

2. Post image script building firmware images. In uses Buildroot
packages tools (lzma_alone, otrx, lxlfw) to build
bootloader-compatible images that can be flashed.

Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
Reviewed-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                             |  2 +
 board/broadcom/northstar/linux.config  | 70 ++++++++++++++++++++++++++++++++++
 board/broadcom/northstar/post-image.sh | 40 +++++++++++++++++++
 board/broadcom/northstar/readme.txt    | 38 ++++++++++++++++++
 configs/broadcom_northstar_defconfig   | 14 +++++++
 5 files changed, 164 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index a8b53f41da..ac000f1ba1 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2468,6 +2468,8 @@ F:	board/avnet/s6lx9_microboard/
 F:	configs/s6lx9_microboard_defconfig
 
 N:	Rafał Miłecki <rafal@milecki.pl>
+F:	board/broadcom/northstar/
+F:	configs/broadcom_northstar_defconfig
 F:	package/firmware-utils/
 
 N:	Rahul Bedarkar <rahulbedarkar89@gmail.com>
diff --git a/board/broadcom/northstar/linux.config b/board/broadcom/northstar/linux.config
new file mode 100644
index 0000000000..47e6990032
--- /dev/null
+++ b/board/broadcom/northstar/linux.config
@@ -0,0 +1,70 @@
+CONFIG_EMBEDDED=y
+CONFIG_ARCH_BCM=y
+CONFIG_ARCH_BCM_5301X=y
+CONFIG_ARCH_BCM_53573=y
+CONFIG_SMP=y
+CONFIG_NR_CPUS=2
+CONFIG_HIGHMEM=y
+CONFIG_ARM_APPENDED_DTB=y
+CONFIG_CMDLINE="ubi.mtd=ubi root=ubi0:rootfs rootfstype=ubifs"
+CONFIG_CMDLINE_FORCE=y
+# CONFIG_SUSPEND is not set
+CONFIG_NET=y
+CONFIG_PACKET=y
+CONFIG_UNIX=y
+CONFIG_INET=y
+CONFIG_BRIDGE=y
+CONFIG_BRIDGE_VLAN_FILTERING=y
+CONFIG_NET_DSA=y
+CONFIG_VLAN_8021Q=y
+CONFIG_PCI=y
+CONFIG_BCM47XX_NVRAM=y
+CONFIG_BCM47XX_SPROM=y
+CONFIG_MTD=y
+CONFIG_MTD_BCM47XX_PARTS=y
+CONFIG_MTD_PARSER_TRX=y
+CONFIG_MTD_BCM47XXSFLASH=y
+CONFIG_MTD_RAW_NAND=y
+CONFIG_MTD_NAND_BRCMNAND=y
+CONFIG_MTD_SPI_NOR=y
+CONFIG_MTD_UBI=y
+CONFIG_NETDEVICES=y
+CONFIG_VXLAN=y
+CONFIG_VETH=y
+CONFIG_B53=y
+CONFIG_BGMAC_BCMA=y
+CONFIG_BROADCOM_PHY=y
+CONFIG_MDIO_BUS_MUX_MMIOREG=y
+CONFIG_SERIAL_8250=y
+CONFIG_SERIAL_8250_CONSOLE=y
+CONFIG_SERIAL_8250_NR_UARTS=2
+CONFIG_SERIAL_8250_RUNTIME_UARTS=2
+CONFIG_SERIAL_OF_PLATFORM=y
+CONFIG_SPI=y
+CONFIG_THERMAL=y
+CONFIG_WATCHDOG=y
+CONFIG_BCM47XX_WDT=y
+CONFIG_BCMA_HOST_SOC=y
+CONFIG_BCMA_DRIVER_GMAC_CMN=y
+CONFIG_BCMA_DRIVER_GPIO=y
+CONFIG_USB=y
+CONFIG_USB_LEDS_TRIGGER_USBPORT=y
+CONFIG_USB_XHCI_HCD=y
+CONFIG_USB_XHCI_PLATFORM=y
+CONFIG_USB_EHCI_HCD=y
+CONFIG_USB_OHCI_HCD=y
+# CONFIG_USB_OHCI_HCD_PCI is not set
+CONFIG_USB_HCD_BCMA=y
+CONFIG_NEW_LEDS=y
+CONFIG_LEDS_CLASS=y
+CONFIG_LEDS_GPIO=y
+CONFIG_LEDS_TRIGGERS=y
+CONFIG_LEDS_TRIGGER_TIMER=y
+CONFIG_LEDS_TRIGGER_HEARTBEAT=y
+CONFIG_LEDS_TRIGGER_DEFAULT_ON=y
+CONFIG_PHY_BCM_NS_USB2=y
+CONFIG_PHY_BCM_NS_USB3=y
+CONFIG_UBIFS_FS=y
+CONFIG_DEBUG_LL=y
+CONFIG_DEBUG_UNCOMPRESS=y
+CONFIG_EARLY_PRINTK=y
diff --git a/board/broadcom/northstar/post-image.sh b/board/broadcom/northstar/post-image.sh
new file mode 100755
index 0000000000..b6150fc539
--- /dev/null
+++ b/board/broadcom/northstar/post-image.sh
@@ -0,0 +1,40 @@
+#!/bin/sh
+
+# $1: images directory path
+# $2: device dts filename
+# $3: board id
+build_lxl() {
+	local images="$1"
+	local device="$2"
+	local board="$3"
+
+	$HOST_DIR/bin/lzma_alone e $images/zImage.$device $images/zImage.$device.lzma -d16
+	rm -f $images/zImage.$device
+	$HOST_DIR/bin/otrx create $images/$device.trx -f $images/zImage.$device.lzma -a 0x20000 -f $images/rootfs.ubi
+	rm -f $images/zImage.$device.lzma
+	$HOST_DIR/bin/lxlfw create $images/$device.lxl -i $images/$device.trx -b "$board"
+}
+
+# $1: images directory path
+# $2: device dts filename
+build_trx() {
+	local images="$1"
+	local device="$2"
+
+	$HOST_DIR/bin/lzma_alone e $images/zImage.$device $images/zImage.$device.lzma -d16
+	rm -f $images/zImage.$device
+	$HOST_DIR/bin/otrx create $images/$device.trx -f $images/zImage.$device.lzma -a 0x20000 -f $images/rootfs.ubi
+	rm -f $images/zImage.$device.lzma
+}
+
+devices="$(sed -n 's/^BR2_LINUX_KERNEL_INTREE_DTS_NAME="\([a-z0-9 \-]*\)"$/\1/p' ${BR2_CONFIG})"
+for device in $devices; do
+	case "$device" in
+		"bcm4708-smartrg-sr400ac")
+			build_trx "$1" "$device"
+			;;
+		"bcm47094-luxul-xwr-3150-v1")
+			build_lxl "$1" "$device" "XWR-3150"
+			;;
+	esac
+done
diff --git a/board/broadcom/northstar/readme.txt b/board/broadcom/northstar/readme.txt
new file mode 100644
index 0000000000..18c9b03c13
--- /dev/null
+++ b/board/broadcom/northstar/readme.txt
@@ -0,0 +1,38 @@
+Broadcom Northstar
+
+Intro
+=====
+
+This readme covers Northstar family of Broadcom SoCs. It includes:
+  - BCM4708 (2 x 800 MHz)
+  - BCM47081 (1 x 800 MHz)
+  - BCM4709 (2 x 1 GHz)
+  - BCM47094 (2 x 1 GHz) (AKA BCM4709C0)
+
+Northstar platform is used in some home routers by multiple vendors. There are
+over 100 market devices based on it and they can all be supported with 1 kernel.
+
+There is no point in having separated board for each model. This board code is
+meant for all supported Northstar devices.
+
+All Northstar devices come with CFE bootloader by default. It's basically closed
+source as sources are available for some old releases only. There is no U-Boot (or
+any other) drop-in replacement or second stage loader with Northstar support.
+
+CFE supports flashing firmware images over TFTP and HTTP (depending on vendor /
+device setup).
+
+How to build it
+===============
+
+  $ make broadcom_ns_defconfig
+
+  $ make
+
+How to flash over HTTP
+======================
+
+Power on device and press (and hold) CTRL+C in serial console terminal. When CFE
+gets into prompt mode it'll automatically start built-in HTTP server. Navigate
+to http://192.168.1.1/ (unless IP was changed - verify with "ifconfig") and
+upload new firmware using a web browser.
diff --git a/configs/broadcom_northstar_defconfig b/configs/broadcom_northstar_defconfig
new file mode 100644
index 0000000000..1008de168f
--- /dev/null
+++ b/configs/broadcom_northstar_defconfig
@@ -0,0 +1,14 @@
+BR2_arm=y
+BR2_cortex_a9=y
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/broadcom/northstar/post-image.sh"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/broadcom/northstar/linux.config"
+BR2_LINUX_KERNEL_APPENDED_ZIMAGE=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="bcm4708-smartrg-sr400ac bcm47094-luxul-xwr-3150-v1"
+# BR2_TARGET_ROOTFS_TAR is not set
+BR2_TARGET_ROOTFS_UBI=y
+BR2_TARGET_ROOTFS_UBI_SUBSIZE=2048
+BR2_TARGET_ROOTFS_UBIFS_LEBSIZE=0x1f000
+BR2_PACKAGE_HOST_FIRMWARE_UTILS=y
+BR2_PACKAGE_HOST_LZMA_ALONE=y

--===============0205620506139504040==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0205620506139504040==--
