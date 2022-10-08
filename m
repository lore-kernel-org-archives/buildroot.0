Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 010EDC433FE
	for <buildroot@archiver.kernel.org>; Sat,  8 Oct 2022 18:46:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4B4854136C;
	Sat,  8 Oct 2022 18:46:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4B4854136C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0OtziorHFee9; Sat,  8 Oct 2022 18:46:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BBDC040922;
	Sat,  8 Oct 2022 18:46:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BBDC040922
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8858C1BF2CC
 for <buildroot@lists.busybox.net>; Sat,  8 Oct 2022 18:46:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 63CF0404CA
 for <buildroot@lists.busybox.net>; Sat,  8 Oct 2022 18:46:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 63CF0404CA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id j3Xvylmuqmgc for <buildroot@lists.busybox.net>;
 Sat,  8 Oct 2022 18:46:06 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 248DD40137
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 248DD40137
 for <buildroot@buildroot.org>; Sat,  8 Oct 2022 18:46:05 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (unknown [IPv6:2001:4b98:dc4:8::227])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id 83021CCC7C
 for <buildroot@buildroot.org>; Sat,  8 Oct 2022 18:40:25 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 37DC220005;
 Sat,  8 Oct 2022 18:40:18 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peko@dell.be.48ers.dk>)
 id 1ohEkD-009lQF-U8; Sat, 08 Oct 2022 20:40:17 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat,  8 Oct 2022 20:40:16 +0200
Message-Id: <20221008184016.2327196-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] configs/visionfive_defconfig: new defconfig
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

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
 DEVELOPERS                                    |  2 ++
 board/visionfive/genimage.cfg                 | 21 ++++++++++++
 .../overlay/boot/extlinux/extlinux.conf       |  4 +++
 board/visionfive/overlay/boot/uEnv.txt        | 15 +++++++++
 board/visionfive/readme.txt                   | 32 +++++++++++++++++++
 configs/visionfive_defconfig                  | 17 ++++++++++
 6 files changed, 91 insertions(+)
 create mode 100644 board/visionfive/genimage.cfg
 create mode 100644 board/visionfive/overlay/boot/extlinux/extlinux.conf
 create mode 100644 board/visionfive/overlay/boot/uEnv.txt
 create mode 100644 board/visionfive/readme.txt
 create mode 100644 configs/visionfive_defconfig

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
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
