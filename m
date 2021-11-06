Return-Path: <SRS0=GWv0=PZ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3951C433F5
	for <buildroot@archiver.kernel.org>; Sat,  6 Nov 2021 17:30:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 286026103A
	for <buildroot@archiver.kernel.org>; Sat,  6 Nov 2021 17:30:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 286026103A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 704C9401FE;
	Sat,  6 Nov 2021 17:30:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lB3ATvEj-0hO; Sat,  6 Nov 2021 17:30:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BBE044023D;
	Sat,  6 Nov 2021 17:30:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 627701BF391
 for <buildroot@lists.busybox.net>; Sat,  6 Nov 2021 17:30:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5F379403BE
 for <buildroot@lists.busybox.net>; Sat,  6 Nov 2021 17:30:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OCLAhgllQUBI for <buildroot@lists.busybox.net>;
 Sat,  6 Nov 2021 17:30:26 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6922F403B3
 for <buildroot@buildroot.org>; Sat,  6 Nov 2021 17:30:26 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by relay11.mail.gandi.net (Postfix) with ESMTPSA id B64B2100003;
 Sat,  6 Nov 2021 17:30:21 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peko@dell.be.48ers.dk>)
 id 1mjPWG-0002Pu-TC; Sat, 06 Nov 2021 18:30:20 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat,  6 Nov 2021 18:29:55 +0100
Message-Id: <20211106172956.9193-2-peter@korsgaard.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211106172956.9193-1-peter@korsgaard.com>
References: <20211106172956.9193-1-peter@korsgaard.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 2/2] configs/nezha_defconfig: new defconfig
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
Cc: samuel@sholland.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add a defconfig for the Allwinner Nezha, a raspberrypi-style board built
around the RISC-V 64bit D1 SoC.

There is currently no upstream support, so use the git repos from Samuel
Holland as explained on the linux-sunxi wiki:

https://linux-sunxi.org/Allwinner_Nezha

The U-Boot DTB is also used by opensbi, but the two branches are
unfortunately not in sync at the moment, so add a patch to fix the
compatible for the PLIC so opensbi makes it available to S-Mode (Linux).

The use of the sun20i-d1-spl SPL bootloader / TOC1 file format also makes it
a bit more complicated to build the boot image.  As this is expected to only
be a temporary issue, add a U-Boot patch to build the TOC1 image as part of
the build rather than adding explicit support in our U-Boot package to do
it.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Changes since v1:
 - Use github macro/tarballs for linux/opensbi/u-boot
 - Use rootfs overlay for extlinux.conf
 - Use kilobytes (K) for offsets in genimage.cfg

 DEVELOPERS                                    |  2 +
 board/nezha/genimage.cfg                      | 37 +++++++++++++
 .../nezha/overlay/boot/extlinux/extlinux.conf |  4 ++
 ...un20i-d1.dtsi-adjust-plic-compatible.patch | 36 +++++++++++++
 ...pport-building-u-boot.toc1-for-nezda.patch | 54 +++++++++++++++++++
 board/nezha/readme.txt                        | 24 +++++++++
 configs/nezha_defconfig                       | 33 ++++++++++++
 7 files changed, 190 insertions(+)
 create mode 100644 board/nezha/genimage.cfg
 create mode 100644 board/nezha/overlay/boot/extlinux/extlinux.conf
 create mode 100644 board/nezha/patches/uboot/0001-arch-riscv-dts-sun20i-d1.dtsi-adjust-plic-compatible.patch
 create mode 100644 board/nezha/patches/uboot/0002-Makefile-HACK-Support-building-u-boot.toc1-for-nezda.patch
 create mode 100644 board/nezha/readme.txt
 create mode 100644 configs/nezha_defconfig

diff --git a/DEVELOPERS b/DEVELOPERS
index 19d527b396..70262eac8c 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2105,6 +2105,7 @@ N:	Peter Korsgaard <peter@korsgaard.com>
 F:	board/arrow/avenger96/
 F:	board/beagleboneai/
 F:	board/minnowboard/
+F:	board/nezha/
 F:	board/librecomputer/lafrite/
 F:	board/nexbox/a95x/
 F:	board/openblocks/a6/
@@ -2119,6 +2120,7 @@ F:	configs/lafrite_defconfig
 F:	configs/minnowboard_max-graphical_defconfig
 F:	configs/minnowboard_max_defconfig
 F:	configs/nexbox_a95x_defconfig
+F:	configs/nezha_defconfig
 F:	configs/openblocks_a6_defconfig
 F:	configs/orangepi_pc_defconfig
 F:	configs/orangepi_r1_defconfig
diff --git a/board/nezha/genimage.cfg b/board/nezha/genimage.cfg
new file mode 100644
index 0000000000..9860b83eca
--- /dev/null
+++ b/board/nezha/genimage.cfg
@@ -0,0 +1,37 @@
+# Minimal SD card image for the Allwinner Nezha
+
+image sdcard.img {
+	hdimage {
+	}
+
+	partition boot0-1 {
+		in-partition-table = "no"
+		image = "boot0_sdcard_sun20iw1p1.bin"
+		offset = 8K
+	}
+
+	partition boot0-2 {
+		in-partition-table = "no"
+		image = "boot0_sdcard_sun20iw1p1.bin"
+		offset = 128K
+	}
+
+	partition u-boot-1 {
+		in-partition-table = "no"
+		image = "u-boot.toc1"
+		offset = 12288K
+	}
+
+	partition u-boot-2 {
+		in-partition-table = "no"
+		image = "u-boot.toc1"
+		offset = 16400K
+	}
+
+	partition rootfs {
+		partition-type = 0x83
+		image = "rootfs.ext4"
+		bootable = "true"
+		offset = 18M
+	}
+}
diff --git a/board/nezha/overlay/boot/extlinux/extlinux.conf b/board/nezha/overlay/boot/extlinux/extlinux.conf
new file mode 100644
index 0000000000..02232f4d16
--- /dev/null
+++ b/board/nezha/overlay/boot/extlinux/extlinux.conf
@@ -0,0 +1,4 @@
+label linux
+  kernel /boot/Image
+  devicetree /boot/sun20i-d1-nezha.dtb
+  append console=ttyS0,115200 root=/dev/mmcblk0p1 ro rootwait
diff --git a/board/nezha/patches/uboot/0001-arch-riscv-dts-sun20i-d1.dtsi-adjust-plic-compatible.patch b/board/nezha/patches/uboot/0001-arch-riscv-dts-sun20i-d1.dtsi-adjust-plic-compatible.patch
new file mode 100644
index 0000000000..3524f44a61
--- /dev/null
+++ b/board/nezha/patches/uboot/0001-arch-riscv-dts-sun20i-d1.dtsi-adjust-plic-compatible.patch
@@ -0,0 +1,36 @@
+From 99cf8f37ceb1def9e7bbaccc395cf2275723e03d Mon Sep 17 00:00:00 2001
+From: Peter Korsgaard <peter@korsgaard.com>
+Date: Thu, 4 Nov 2021 22:15:13 +0100
+Subject: [PATCH] arch/riscv/dts/sun20i-d1.dtsi: adjust plic compatible to
+ match opensbi
+
+The T-HEAD PLIC is by default not accessible from S-mode, and access must be
+enabled by opensbi to make it accessible to Linux.
+
+The DTB is used both by U-Boot and opensbi (but the PLIC node is ignored by
+U-Boot), so change the compatible to match what opensbi expects to fix a
+crash during Linux boot:
+
+https://github.com/riscv-software-src/opensbi/commit/78c2b19218bd
+
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+---
+ arch/riscv/dts/sun20i-d1.dtsi | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/arch/riscv/dts/sun20i-d1.dtsi b/arch/riscv/dts/sun20i-d1.dtsi
+index 280e0336d4..56d02c33b0 100644
+--- a/arch/riscv/dts/sun20i-d1.dtsi
++++ b/arch/riscv/dts/sun20i-d1.dtsi
+@@ -1136,7 +1136,7 @@
+ 
+ 		plic: interrupt-controller@10000000 {
+ 			compatible = "allwinner,sun20i-d1-plic",
+-				     "sifive,plic-1.0.0";
++				     "thead,c900-plic";
+ 			reg = <0x10000000 0x4000000>;
+ 			#address-cells = <0>;
+ 			interrupts-extended = <&cpu0_intc 11>,
+-- 
+2.20.1
+
diff --git a/board/nezha/patches/uboot/0002-Makefile-HACK-Support-building-u-boot.toc1-for-nezda.patch b/board/nezha/patches/uboot/0002-Makefile-HACK-Support-building-u-boot.toc1-for-nezda.patch
new file mode 100644
index 0000000000..6e89a921df
--- /dev/null
+++ b/board/nezha/patches/uboot/0002-Makefile-HACK-Support-building-u-boot.toc1-for-nezda.patch
@@ -0,0 +1,54 @@
+From 4a923e0e4ef6d2b41cb89d658e269adada847573 Mon Sep 17 00:00:00 2001
+From: Peter Korsgaard <peter@korsgaard.com>
+Date: Thu, 4 Nov 2021 22:32:04 +0100
+Subject: [PATCH] Makefile: HACK: Support building u-boot.toc1 for nezda board
+
+For easier integration into Buildroot.  The boot0 / toc1 logic is WIP until
+U-Boot gains SPL support for the D1, so add a hack to make it easier to
+integrate in Buildroot as-is.
+
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+---
+ Makefile  | 9 +++++++++
+ nezha.cfg | 9 +++++++++
+ 2 files changed, 18 insertions(+)
+ create mode 100644 nezha.cfg
+
+diff --git a/Makefile b/Makefile
+index f911f70344..259d93bf80 100644
+--- a/Makefile
++++ b/Makefile
+@@ -1084,6 +1084,15 @@ endif
+ .binman_stamp: FORCE
+ 	@touch $@
+ 
++fw_dynamic.bin: $(OPENSBI)
++	$(call if_changed,copy)
++
++MKIMAGEFLAGS_u-boot.toc1 = -T sunxi_toc1
++u-boot.toc1: nezha.cfg fw_dynamic.bin inputs
++	$(call if_changed,mkimage)
++
++all: u-boot.toc1
++
+ ifeq ($(CONFIG_DEPRECATED),y)
+ 	$(warning "You have deprecated configuration options enabled in your .config! Please check your configuration.")
+ endif
+diff --git a/nezha.cfg b/nezha.cfg
+new file mode 100644
+index 0000000000..2d23b9b388
+--- /dev/null
++++ b/nezha.cfg
+@@ -0,0 +1,9 @@
++[opensbi]
++file = fw_dynamic.bin
++addr = 0x40000000
++[dtb]
++file = arch/riscv/dts/sun20i-d1-nezha.dtb
++addr = 0x44000000
++[u-boot]
++file = u-boot-nodtb.bin
++addr = 0x4a000000
+-- 
+2.20.1
+
diff --git a/board/nezha/readme.txt b/board/nezha/readme.txt
new file mode 100644
index 0000000000..fd4c6707de
--- /dev/null
+++ b/board/nezha/readme.txt
@@ -0,0 +1,24 @@
+Allwinner Nezha
+===============
+
+Nezha is is a low-cost RISC-V 64-bit based platform, powered by an
+Allwinner D1 SoC.
+
+How to build
+============
+
+$ make nezha_defconfig
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
+Connect a TTL UART to the debug connector, insert the microSD card and
+plug in a USB-C cable to the PWR connector to boot the system.
diff --git a/configs/nezha_defconfig b/configs/nezha_defconfig
new file mode 100644
index 0000000000..d4724de2f3
--- /dev/null
+++ b/configs/nezha_defconfig
@@ -0,0 +1,33 @@
+BR2_riscv=y
+BR2_GLOBAL_PATCH_DIR="board/nezha/patches"
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_14=y
+BR2_ROOTFS_OVERLAY="board/nezha/overlay"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/nezha/genimage.cfg"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,smaeul,linux,012f5a3d01be6d44e32c74bb3637ec281790b297)/linux-012f5a3d01be6d44e32c74bb3637ec281790b297.tar.gz"
+BR2_LINUX_KERNEL_DEFCONFIG="nezha"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="allwinner/sun20i-d1-nezha"
+BR2_LINUX_KERNEL_INSTALL_TARGET=y
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+# BR2_TARGET_ROOTFS_TAR is not set
+BR2_TARGET_OPENSBI=y
+BR2_TARGET_OPENSBI_CUSTOM_TARBALL=y
+BR2_TARGET_OPENSBI_CUSTOM_TARBALL_LOCATION="$(call github,smaeul,opensbi,b9125c6f8909d1cc0417795737fc13cb6297ff11)/opensbi-b9125c6f8909d1cc0417795737fc13cb6297ff11.tar.gz"
+BR2_TARGET_OPENSBI_PLAT="generic"
+# BR2_TARGET_OPENSBI_INSTALL_JUMP_IMG is not set
+BR2_TARGET_SUN20I_D1_SPL=y
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,smaeul,u-boot,62392d3b8a624a80646c1876533336f90140088d)/uboot-62392d3b8a624a80646c1876533336f90140088d.tar.gz"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="nezha"
+BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_TARGET_UBOOT_NEEDS_OPENSBI=y
+# BR2_TARGET_UBOOT_FORMAT_BIN is not set
+BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
+BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot.toc1"
+BR2_PACKAGE_HOST_GENIMAGE=y
-- 
2.20.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
