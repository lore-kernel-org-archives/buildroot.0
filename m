Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14A9AC4321E
	for <buildroot@archiver.kernel.org>; Fri, 14 Oct 2022 13:53:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A404C6F95F;
	Fri, 14 Oct 2022 13:53:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A404C6F95F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cINbH_riOyIu; Fri, 14 Oct 2022 13:53:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id AD31860D68;
	Fri, 14 Oct 2022 13:53:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AD31860D68
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 79B7A1C11A0
 for <buildroot@lists.busybox.net>; Fri, 14 Oct 2022 13:53:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 624E74119E
 for <buildroot@lists.busybox.net>; Fri, 14 Oct 2022 13:53:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 624E74119E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id U6jbc7eQg40Z for <buildroot@lists.busybox.net>;
 Fri, 14 Oct 2022 13:53:06 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 791A44119A
 for <buildroot@buildroot.org>; Fri, 14 Oct 2022 13:53:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 791A44119A
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 64CE286CA7; Fri, 14 Oct 2022 13:53:06 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 14 Oct 2022 15:47:21 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e381fa9cf21f4384ffd6b305829417e9d2dd4d94
X-Git-Newrev: 3cc157e2e3c80027c69819f82d8bfe37bfb04049
X-Patchwork-Hint: ignore
Message-Id: <20221014135306.64CE286CA7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/visionfive_defconfig: new defconfig
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

commit: https://git.buildroot.net/buildroot/commit/?id=3cc157e2e3c80027c69819f82d8bfe37bfb04049
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add a defconfig for the Starfive VisionFive board, a board built around the
Starfive JH7100 RISC-V 64bit SoC (same as Beaglev).

This board comes with functional lowlevel and U-Boot bootloaders in SPI
flash.  The defconfig reuses these and only builds a (6.0 based) kernel and
rootfs.

The factory shipped U-Boot is hard coded to look at MMC partition 3 and
misses some variables, so we provide a uEnv.txt to fix that up, based on
what is done in provided Fedora image.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS                                         |  2 ++
 board/visionfive/genimage.cfg                      | 21 ++++++++++++++
 .../visionfive/overlay/boot/extlinux/extlinux.conf |  4 +++
 board/visionfive/overlay/boot/uEnv.txt             | 15 ++++++++++
 board/visionfive/readme.txt                        | 32 ++++++++++++++++++++++
 configs/visionfive_defconfig                       | 17 ++++++++++++
 6 files changed, 91 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 59121c6a54..bfde353c8a 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2310,6 +2310,7 @@ F:	board/openblocks/a6/
 F:	board/orangepi/
 F:	board/pandaboard/
 F:	board/roseapplepi/
+F:	board/visionfive/
 F:	boot/shim/
 F:	boot/sun20i-d1-spl/
 F:	configs/avenger96_defconfig
@@ -2324,6 +2325,7 @@ F:	configs/orangepi_r1_defconfig
 F:	configs/pandaboard_defconfig
 F:	configs/roseapplepi_defconfig
 F:	configs/sheevaplug_defconfig
+F:	configs/visionfive_defconfig
 F:	package/bats-core/
 F:	package/docker-compose/
 F:	package/dump1090/
diff --git a/board/visionfive/genimage.cfg b/board/visionfive/genimage.cfg
new file mode 100644
index 0000000000..433387c901
--- /dev/null
+++ b/board/visionfive/genimage.cfg
@@ -0,0 +1,21 @@
+# Minimal SD card image for the Starfive VisionFive board
+
+image sdcard.img {
+	hdimage {
+	}
+
+	# u-boot is hard coded to look at 3rd partition
+	partition dummy1 {
+		size = 512
+	}
+
+	partition dummy2 {
+		size = 512
+	}
+
+	partition rootfs {
+		partition-type = 0x83
+		image = "rootfs.ext4"
+		bootable = "true"
+	}
+}
diff --git a/board/visionfive/overlay/boot/extlinux/extlinux.conf b/board/visionfive/overlay/boot/extlinux/extlinux.conf
new file mode 100644
index 0000000000..44ac6f7944
--- /dev/null
+++ b/board/visionfive/overlay/boot/extlinux/extlinux.conf
@@ -0,0 +1,4 @@
+label linux
+  kernel /boot/Image
+  devicetree /boot/jh7100-starfive-visionfive-v1.dtb
+  append console=ttyS0,115200 root=/dev/mmcblk0p3
diff --git a/board/visionfive/overlay/boot/uEnv.txt b/board/visionfive/overlay/boot/uEnv.txt
new file mode 100644
index 0000000000..b831d2d230
--- /dev/null
+++ b/board/visionfive/overlay/boot/uEnv.txt
@@ -0,0 +1,15 @@
+fdt_high=0xffffffffffffffff
+initrd_high=0xffffffffffffffff
+
+scriptaddr=0x88100000
+script_offset_f=0x1fff000
+script_size_f=0x1000
+
+kernel_addr_r=0x84000000
+kernel_comp_addr_r=0x90000000
+kernel_comp_size=0x10000000
+
+fdt_addr_r=0x88000000
+ramdisk_addr_r=0x88300000
+
+bootcmd=devnum=0; run mmc_boot
diff --git a/board/visionfive/readme.txt b/board/visionfive/readme.txt
new file mode 100644
index 0000000000..7aefa24167
--- /dev/null
+++ b/board/visionfive/readme.txt
@@ -0,0 +1,32 @@
+Starfive VisionFive
+===================
+
+The VisionFive is a low-cost RISC-V 64-bit based platform, powered by a
+Starfive JH7100 processor.
+
+https://doc-en.rvspace.org/Doc_Center/visionfive.html
+
+How to build
+============
+
+$ make visionfive_defconfig
+$ make
+
+How to write the SD card
+========================
+
+Once the build process is finished you will have an image called "sdcard.img"
+in the output/images/ directory.
+
+Copy the bootable "sdcard.img" onto an SD card with "dd":
+
+  $ sudo dd if=output/images/sdcard.img of=/dev/sdX
+
+Preparing the board
+===================
+
+Connect a TTL UART cable to pin 6 (GND), 8 (TX) and 10 (RX).
+
+Insert your SD card.
+
+Power-up the board using an USB-C cable.
diff --git a/configs/visionfive_defconfig b/configs/visionfive_defconfig
new file mode 100644
index 0000000000..9f5fb03610
--- /dev/null
+++ b/configs/visionfive_defconfig
@@ -0,0 +1,17 @@
+BR2_riscv=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_0=y
+BR2_SYSTEM_DHCP="eth0"
+BR2_ROOTFS_OVERLAY="board/visionfive/overlay"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/visionfive/genimage.cfg"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,starfive-tech,linux,cfcb617265422c0af0ae5bc9688dceba2d10b27a)/linux-cfcb617265422c0af0ae5bc9688dceba2d10b27a.tar.gz"
+BR2_LINUX_KERNEL_DEFCONFIG="visionfive"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="starfive/jh7100-starfive-visionfive-v1"
+BR2_LINUX_KERNEL_INSTALL_TARGET=y
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+# BR2_TARGET_ROOTFS_TAR is not set
+BR2_PACKAGE_HOST_GENIMAGE=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
