Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A18BBC25B10
	for <buildroot@archiver.kernel.org>; Thu,  9 May 2024 20:08:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3352E40242;
	Thu,  9 May 2024 20:08:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aAovd5mNrzXc; Thu,  9 May 2024 20:08:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5AC8A40186
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5AC8A40186;
	Thu,  9 May 2024 20:08:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 15B761BF31C
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 20:08:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F3F0483FC5
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 20:08:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WukQK0OI8SLx for <buildroot@lists.busybox.net>;
 Thu,  9 May 2024 20:08:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CDE3583FC3
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id CDE3583FC3
 for <buildroot@buildroot.org>; Thu,  9 May 2024 20:08:31 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B7E2686D5A; Thu,  9 May 2024 20:08:31 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 9 May 2024 22:08:14 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1223c116665a3fb5ec44218b5f256d813dc1a28f
X-Git-Newrev: b29fe222572694803f43ed4bd989729f8f33232d
X-Patchwork-Hint: ignore
Message-Id: <20240509200831.B7E2686D5A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/beagleboneai64_defconfig: new
 defconfig
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=b29fe222572694803f43ed4bd989729f8f33232d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Adds support for BeagleBone AI-64 board by introducing the
beagleboneai64_defconfig file and related support files.

The BeagleBone AI-64 uses the TI J721E SoC, also known as DRA829, also
known as TDA4VM.

Retrieve BSP settings from meta-ti (may be useful for other TI boards):

- This defconfig requires u-boot binman support added in u-boot since
  2023.10.
  See FOSDEM 2024 talk by TI folks about Binman and how it simplify
  the overall boot-loader build flow [1].

- Set BR2_TARGET_ARM_TRUSTED_FIRMWARE_TARGET_BOARD = "generic"
  meta-ti]$ git grep TFA_BOARD
  meta-ti-bsp/conf/machine/beagleplay.conf:TFA_BOARD = "lite"
  meta-ti-bsp/conf/machine/include/am62axx.inc:TFA_BOARD = "lite"
  meta-ti-bsp/conf/machine/include/am62pxx.inc:TFA_BOARD = "lite"
  meta-ti-bsp/conf/machine/include/am62xx.inc:TFA_BOARD = "lite"
  meta-ti-bsp/conf/machine/include/am64xx.inc:TFA_BOARD = "lite"
  meta-ti-bsp/conf/machine/include/am65xx.inc:TFA_BOARD = "generic"
  meta-ti-bsp/conf/machine/include/j7200.inc:TFA_BOARD = "generic"
  meta-ti-bsp/conf/machine/include/j721e.inc:TFA_BOARD = "generic"
  meta-ti-bsp/conf/machine/include/j721s2.inc:TFA_BOARD = "generic"
  meta-ti-bsp/conf/machine/include/j722s.inc:TFA_BOARD = "lite"
  meta-ti-bsp/conf/machine/include/j784s4.inc:TFA_BOARD = "j784s4"

- Set BR2_TARGET_UBOOT_NEEDS_ATF_BL31 to provide BL31 variable pointing
  to ATF bl31.bin to the U-Boot build process [2].

- Set BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL32_OPTEE to OP-TEE as BL32
  secure payload. meta-ti set "SPD=opteed" to build ATF [3].

- Set BR2_TARGET_OPTEE_OS_PLATFORM to "k3-j721e".
  meta-ti uses the OPTEEMACHINE to set optee-os platform [4].
  meta-ti]$ git grep OPTEEMACHINE
  meta-ti-bsp/conf/machine/am437x-hs-evm.conf:OPTEEMACHINE = "ti-am43xx"
  meta-ti-bsp/conf/machine/am57xx-hs-evm.conf:OPTEEMACHINE = "ti-am57xx"
  meta-ti-bsp/conf/machine/beagleplay.conf:OPTEEMACHINE = "k3-am62x"
  meta-ti-bsp/conf/machine/dra7xx-hs-evm.conf:OPTEEMACHINE = "ti-dra7xx"
  meta-ti-bsp/conf/machine/include/am62axx.inc:OPTEEMACHINE = "k3-am62x"
  meta-ti-bsp/conf/machine/include/am62pxx.inc:OPTEEMACHINE = "k3-am62x"
  meta-ti-bsp/conf/machine/include/am62xx.inc:OPTEEMACHINE = "k3-am62x"
  meta-ti-bsp/conf/machine/include/am64xx.inc:OPTEEMACHINE = "k3-am64x"
  meta-ti-bsp/conf/machine/include/am65xx.inc:OPTEEMACHINE = "k3-am65x"
  meta-ti-bsp/conf/machine/include/j7200.inc:OPTEEMACHINE = "k3-j721e"
  meta-ti-bsp/conf/machine/include/j721e.inc:OPTEEMACHINE = "k3-j721e"
  meta-ti-bsp/conf/machine/include/j721s2.inc:OPTEEMACHINE = "k3-j784s4"
  meta-ti-bsp/conf/machine/include/j722s.inc:OPTEEMACHINE = "k3-am62x"
  meta-ti-bsp/conf/machine/include/j784s4.inc:OPTEEMACHINE = "k3-j784s4"

- Use j721e_beagleboneai64_a72 and j721e_beagleboneai64_r5 u-boot
  defconfigs introduced in u-boot v2024.04.

- u-boot distroboot (bootflow) detect extlinux.conf file from the first
  SDcard partition, se we have to install the kernel and its dtb file.
  Use devicetreedir instead of devicetree in extlinux.conf file to
  avoid hardcoding the devicetree file name. TI boards are able to
  retrieve dtb file name from an EEPROM (see TI_I2C_BOARD_DETECT in
  uboot).

- Provide a hash file for all custom package version
  (arm-trusted-firmware, linux, ti-k3-r5-loader, uboot) to enable
  BR2_DOWNLOAD_FORCE_CHECK_HASHES.

[1] https://fosdem.org/2024/schedule/event/fosdem-2024-3067-standardizing-the-generation-and-signing-of-boot-images/
[2] https://git.yoctoproject.org/meta-ti/commit/?id=e74b9a1746d4d04757c87c1920a0f743e55ff096
[3] https://git.yoctoproject.org/meta-ti/tree/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc?h=09.02.00.004#n7
[4] https://git.yoctoproject.org/meta-arm/tree/meta-arm/recipes-security/optee/optee-os.inc?h=4.0.3#n23

More information about the board can be found at:
https://www.beagleboard.org/boards/beaglebone-ai-64

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                         |  2 +
 board/beagleboard/beagleboneai64/extlinux.conf     |  5 +++
 board/beagleboard/beagleboneai64/genimage.cfg      | 33 ++++++++++++++
 .../arm-trusted-firmware/arm-trusted-firmware.hash |  2 +
 .../patches/linux-headers/linux-headers.hash       |  1 +
 .../beagleboneai64/patches/linux/linux.hash        |  2 +
 .../patches/ti-k3-r5-loader/ti-k3-r5-loader.hash   |  2 +
 .../beagleboneai64/patches/uboot/uboot.hash        |  2 +
 board/beagleboard/beagleboneai64/post-build.sh     |  7 +++
 board/beagleboard/beagleboneai64/readme.txt        | 39 +++++++++++++++++
 configs/beagleboneai64_defconfig                   | 50 ++++++++++++++++++++++
 11 files changed, 145 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index ce0c7d62de..10f93d61aa 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2705,10 +2705,12 @@ F:	package/irssi/
 F:	package/vnstat/
 
 N:	Romain Naour <romain.naour@gmail.com>
+F:	board/beagleboard/beagleboneai64/
 F:	board/qemu/
 F:	board/ti/am574x-idk/
 F:	configs/qemu_*
 F:	configs/am574x_idk_defconfig
+F:	configs/beagleboneai64_defconfig
 F:	package/alure/
 F:	package/aubio/
 F:	package/bcc/
diff --git a/board/beagleboard/beagleboneai64/extlinux.conf b/board/beagleboard/beagleboneai64/extlinux.conf
new file mode 100644
index 0000000000..582d510b5d
--- /dev/null
+++ b/board/beagleboard/beagleboneai64/extlinux.conf
@@ -0,0 +1,5 @@
+default buildroot
+label buildroot
+   kernel /Image
+   devicetreedir /
+append root=/dev/mmcblk1p2 rootwait rw console=ttyS2,115200n8
diff --git a/board/beagleboard/beagleboneai64/genimage.cfg b/board/beagleboard/beagleboneai64/genimage.cfg
new file mode 100644
index 0000000000..b5ba2d21db
--- /dev/null
+++ b/board/beagleboard/beagleboneai64/genimage.cfg
@@ -0,0 +1,33 @@
+image boot.vfat {
+	vfat {
+		files = {
+			"sysfw.itb",
+			"tiboot3.bin",
+			"tispl.bin",
+			"u-boot.img",
+			"Image",
+			"ti",
+			"extlinux",
+		}
+
+		label = "boot"
+	}
+
+	size = 64M
+}
+
+image sdcard.img {
+	hdimage {
+	}
+
+	partition u-boot {
+		partition-type = 0xC
+		bootable = "true"
+		image = "boot.vfat"
+	}
+
+	partition rootfs {
+		partition-type = 0x83
+		image = "rootfs.ext4"
+	}
+}
diff --git a/board/beagleboard/beagleboneai64/patches/arm-trusted-firmware/arm-trusted-firmware.hash b/board/beagleboard/beagleboneai64/patches/arm-trusted-firmware/arm-trusted-firmware.hash
new file mode 100644
index 0000000000..02714d06a0
--- /dev/null
+++ b/board/beagleboard/beagleboneai64/patches/arm-trusted-firmware/arm-trusted-firmware.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  2e18b881ada9198173238cca80086c787b1fa3f698944bde1743142823fc511c  arm-trusted-firmware-v2.10.tar.gz
diff --git a/board/beagleboard/beagleboneai64/patches/linux-headers/linux-headers.hash b/board/beagleboard/beagleboneai64/patches/linux-headers/linux-headers.hash
new file mode 120000
index 0000000000..5808d92afe
--- /dev/null
+++ b/board/beagleboard/beagleboneai64/patches/linux-headers/linux-headers.hash
@@ -0,0 +1 @@
+../linux/linux.hash
\ No newline at end of file
diff --git a/board/beagleboard/beagleboneai64/patches/linux/linux.hash b/board/beagleboard/beagleboneai64/patches/linux/linux.hash
new file mode 100644
index 0000000000..4b20a009a7
--- /dev/null
+++ b/board/beagleboard/beagleboneai64/patches/linux/linux.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  b66a5b863b0f8669448b74ca83bd641a856f164b29956e539bbcb5fdeeab9cc6  linux-6.6.30.tar.xz
diff --git a/board/beagleboard/beagleboneai64/patches/ti-k3-r5-loader/ti-k3-r5-loader.hash b/board/beagleboard/beagleboneai64/patches/ti-k3-r5-loader/ti-k3-r5-loader.hash
new file mode 100644
index 0000000000..97a2b4eaf9
--- /dev/null
+++ b/board/beagleboard/beagleboneai64/patches/ti-k3-r5-loader/ti-k3-r5-loader.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  18a853fe39fad7ad03a90cc2d4275aeaed6da69735defac3492b80508843dd4a  u-boot-2024.04.tar.bz2
diff --git a/board/beagleboard/beagleboneai64/patches/uboot/uboot.hash b/board/beagleboard/beagleboneai64/patches/uboot/uboot.hash
new file mode 100644
index 0000000000..97a2b4eaf9
--- /dev/null
+++ b/board/beagleboard/beagleboneai64/patches/uboot/uboot.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  18a853fe39fad7ad03a90cc2d4275aeaed6da69735defac3492b80508843dd4a  u-boot-2024.04.tar.bz2
diff --git a/board/beagleboard/beagleboneai64/post-build.sh b/board/beagleboard/beagleboneai64/post-build.sh
new file mode 100755
index 0000000000..2315ff393a
--- /dev/null
+++ b/board/beagleboard/beagleboneai64/post-build.sh
@@ -0,0 +1,7 @@
+#!/bin/sh
+
+BOARD_DIR="$(dirname "$0")"
+
+ln -sf tispl.bin_unsigned "$BINARIES_DIR"/tispl.bin
+
+install -m 0644 -D "$BOARD_DIR"/extlinux.conf "$BINARIES_DIR"/extlinux/extlinux.conf
diff --git a/board/beagleboard/beagleboneai64/readme.txt b/board/beagleboard/beagleboneai64/readme.txt
new file mode 100644
index 0000000000..fa4e189c44
--- /dev/null
+++ b/board/beagleboard/beagleboneai64/readme.txt
@@ -0,0 +1,39 @@
+BeagleBoard.org BeagleBone AI-64 Development Board
+
+Description
+===========
+
+This configuration will build a basic image for the BeagleBoard.org
+BeagleBone AI-64. For more details about the board, visit:
+
+https://www.beagleboard.org/boards/beaglebone-ai-64
+
+How to Build
+============
+
+Select the default configuration for the target:
+
+$ make beagleboneai64_defconfig
+
+Optional: modify the configuration:
+
+$ make menuconfig
+
+Build:
+
+$ make
+
+To copy the resultimg output image file to an SD card use dd:
+
+$ dd if=output/images/sdcard.img of=/dev/sdX bs=1M
+
+How to Run
+==========
+
+Insert the SD card into the BeagleBone AI-64 board, and power it up
+through the USB Type-C connector. The system should come up (make sure
+to boot from the SD card not from the eMMC). You can use a USB to
+serial adapter to connect to the connector labeled UART0 (J3) to
+communicate with the board.
+
+https://docs.beagleboard.org/latest/boards/beaglebone/ai-64/02-quick-start.html
diff --git a/configs/beagleboneai64_defconfig b/configs/beagleboneai64_defconfig
new file mode 100644
index 0000000000..d4ba61cfab
--- /dev/null
+++ b/configs/beagleboneai64_defconfig
@@ -0,0 +1,50 @@
+BR2_aarch64=y
+BR2_cortex_a72=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
+BR2_GLOBAL_PATCH_DIR="board/beagleboard/beagleboneai64/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/beagleboard/beagleboneai64/post-build.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/beagleboard/beagleboneai64/genimage.cfg"
+BR2_SYSTEM_DHCP="eth0"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.30"
+BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="ti/k3-j721e-beagleboneai64"
+BR2_LINUX_KERNEL_DTB_KEEP_DIRNAME=y
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_ROOTFS_EXT2_SIZE="256M"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="v2.10"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="k3"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_TARGET_BOARD="generic"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL32_OPTEE=y
+BR2_TARGET_OPTEE_OS=y
+BR2_TARGET_OPTEE_OS_PLATFORM="k3-j721e"
+BR2_TARGET_TI_K3_BOOT_FIRMWARE=y
+BR2_TARGET_TI_K3_R5_LOADER=y
+BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_VERSION=y
+BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_VERSION_VALUE="2024.04"
+BR2_TARGET_TI_K3_R5_LOADER_BOARD_DEFCONFIG="j721e_beagleboneai64_r5"
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.04"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="j721e_beagleboneai64_a72"
+BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
+BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
+BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
+BR2_TARGET_UBOOT_USE_BINMAN=y
+# BR2_TARGET_UBOOT_FORMAT_BIN is not set
+BR2_TARGET_UBOOT_FORMAT_IMG=y
+BR2_TARGET_UBOOT_SPL=y
+BR2_TARGET_UBOOT_SPL_NAME="tispl.bin_unsigned"
+BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="TEE=$(BINARIES_DIR)/tee-pager_v2.bin"
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_MTOOLS=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
