Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3F19EB64D9
	for <buildroot@archiver.kernel.org>; Wed, 12 Jul 2023 12:52:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9F430834C6;
	Wed, 12 Jul 2023 12:52:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9F430834C6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TBUYX3pXo0RU; Wed, 12 Jul 2023 12:52:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6A7FC82214;
	Wed, 12 Jul 2023 12:52:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6A7FC82214
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C8B7C1BF3C1
 for <buildroot@lists.busybox.net>; Wed, 12 Jul 2023 12:52:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A2A84607A1
 for <buildroot@lists.busybox.net>; Wed, 12 Jul 2023 12:52:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A2A84607A1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id X21zVHMYl6cO for <buildroot@lists.busybox.net>;
 Wed, 12 Jul 2023 12:52:12 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 22CA8605C9
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.154.123])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 22CA8605C9
 for <buildroot@buildroot.org>; Wed, 12 Jul 2023 12:52:12 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="6.01,199,1684825200"; d="scan'208";a="224313459"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 12 Jul 2023 05:52:09 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 12 Jul 2023 05:52:04 -0700
Received: from jamie-dev.microchip.com (10.10.115.15) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2507.21 via Frontend Transport; Wed, 12 Jul 2023 05:52:02 -0700
To: <buildroot@buildroot.org>
Date: Wed, 12 Jul 2023 13:51:54 +0100
Message-ID: <20230712125154.1361000-3-jamie.gibbons@microchip.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230712125154.1361000-1-jamie.gibbons@microchip.com>
References: <20230712125154.1361000-1-jamie.gibbons@microchip.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1689166332; x=1720702332;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=LuxjXUWhvVB/9kRrJxrLFiyIolJ8jgAgSJ2aITouQd0=;
 b=BMLqJ8adyzeGIH7yvT9aQW0agUfX7uNg/XdDf24gSe+EGKepazGSBZmJ
 nI8sZDRE6OSSRwIuHBSINk9ulahW0A9pHkbswl7Ajo89MxI4ZDSwu4R+P
 JpSERfijepkG4GJfaauBxpSubW+G2cXgegdujq4R5pdspJvOR6AOUpWdZ
 ASrij2s397BZmlNMhm82thBPGhXrDg0M23m6zsPh39D/JC8XHKsLaytqz
 hqoAyJhHCkqzVlteFu57o2NQ9e6MCc/1PBC1owmhQyjCg9Lei0Fjnz+8H
 954zIepMOenWTqh41gjvQMYs38eFScDkyVsY01ONqqQKuwRN0aI1Ztoq0
 A==;
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com
 header.a=rsa-sha256 header.s=mchp header.b=BMLqJ8ad
Subject: [Buildroot] [PATCH v3 2/2] configs/microchip_mpfs_icicle: add
 support for Microchip's Icicle Kit
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
From: Jamie Gibbons via buildroot <buildroot@buildroot.org>
Reply-To: Jamie Gibbons <jamie.gibbons@microchip.com>
Cc: Conor Dooley <Conor.Dooley@microchip.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Valentina Fernandez Alanis <Valentina.FernandezAlanis@microchip.com>, Jamie
 Gibbons <jamie.gibbons@microchip.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add support for the icicle kit, the main development board for
Microchip's PolarFire SoC.

The configuration file is microchip_mpfs_icicle_defconfig. It builds a
bootable kernel image with an embedded root file system. The image
built can be flashed to the board using the eMMC or an SD card.

The yaml configuration file is used by the hss payload generator. It
maps the ELF binaries or binary blobs to the individual application
harts (U54s).

The image generator script sets the partitions of the image.

The kernel fragment file ses additional configurations for the icicle
kit in buildroot that are not in the default configuration.

The image tree souce file creates a FIT image.

The post image script creates the payload using the payload generator
host package and finally, creates the FIT image using the ITS after the
kernel build.

The U-Boot script and additional U-Boot configurations ensure that
U-Boot behaves as expected for the icicle kit and boots the FIT image.

The readme.txt file documents how to build and boot the icicle kit with
this configuration.

Signed-off-by: Jamie Gibbons <jamie.gibbons@microchip.com>
---
 DEVELOPERS                                    |  2 +
 board/microchip/mpfs_icicle/README.txt        | 62 +++++++++++++++++++
 board/microchip/mpfs_icicle/config.yaml       | 28 +++++++++
 board/microchip/mpfs_icicle/genimage.cfg      | 34 ++++++++++
 board/microchip/mpfs_icicle/linux.fragment    |  1 +
 board/microchip/mpfs_icicle/mpfs_icicle.its   | 53 ++++++++++++++++
 board/microchip/mpfs_icicle/post-image.sh     | 13 ++++
 board/microchip/mpfs_icicle/uboot-env.txt     | 16 +++++
 .../mpfs_icicle/uboot-fragment-rootfs.config  |  3 +
 configs/microchip_mpfs_icicle_defconfig       | 34 ++++++++++
 10 files changed, 246 insertions(+)
 create mode 100644 board/microchip/mpfs_icicle/README.txt
 create mode 100644 board/microchip/mpfs_icicle/config.yaml
 create mode 100644 board/microchip/mpfs_icicle/genimage.cfg
 create mode 100644 board/microchip/mpfs_icicle/linux.fragment
 create mode 100644 board/microchip/mpfs_icicle/mpfs_icicle.its
 create mode 100755 board/microchip/mpfs_icicle/post-image.sh
 create mode 100644 board/microchip/mpfs_icicle/uboot-env.txt
 create mode 100644 board/microchip/mpfs_icicle/uboot-fragment-rootfs.config
 create mode 100644 configs/microchip_mpfs_icicle_defconfig

diff --git a/DEVELOPERS b/DEVELOPERS
index 2f039a2405..8df10aca21 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1460,6 +1460,8 @@ F:	package/rpm/
 F:	package/yad/
 
 N:	Jamie Gibbons <jamie.gibbons@microchip.com>
+F:	board/microchip/mpfs_icicle
+F:	configs/microchip_mpfs_icicle_defconfig
 F:	package/microchip-hss-payload-generator
 
 N:	Jan Heylen <jan.heylen@nokia.com>
diff --git a/board/microchip/mpfs_icicle/README.txt b/board/microchip/mpfs_icicle/README.txt
new file mode 100644
index 0000000000..de20ecc410
--- /dev/null
+++ b/board/microchip/mpfs_icicle/README.txt
@@ -0,0 +1,62 @@
+Microchip PolarFire SoC Icicle Kit
+==================================
+
+This file describes how to use the pre-defined Buildroot
+configuration for Microchip's PolarFire SoC Icicle Kit.
+
+Further information about the PolarFire SoC Icicle Kit can be found
+at https://github.com/polarfire-soc/polarfire-soc-documentation
+
+Building
+========
+
+Configure Buildroot using the default board configuration:
+
+  '$ make microchip_mpfs_icicle_defconfig'
+
+Customise the build as necessary:
+
+  '$ make menuconfig'
+
+Start the build:
+
+  '$ make'
+
+Result of the build
+===================
+
+Once the build has finished you will have the following files:
+
+    output/images/
+    +-- boot.scr
+    +-- boot.vfat
+    +-- Image
+    +-- mpfs_icicle.itb
+    +-- mpfs_icicle.its
+    +-- mpfs-icicle-kit.dtb
+    +-- payload.bin
+    +-- rootfs.ext2
+    +-- rootfs.ext4
+    +-- rootfs.tar
+    +-- sdcard.img
+    +-- u-boot.bin
+
+
+Creating a bootable SD card with genimage
+=========================================
+
+By default Buildroot builds a SD card image for you. The first partition
+of this image contains a U-Boot binary, embedded in a Hart Software
+Services (HSS) payload. The second partition contains a FAT filesystem
+with a U-Boot env and an ITB file containing the kernel and the device
+tree. The third partition contains the file system. This image can be
+written directly to the eMMC or an SD card. All you need to do is dd the
+image to the eMMC or your SD card, which can be done with the following
+command on your development host:
+
+  '$ sudo dd if=output/images/sdcard.img of=/dev/sdb bs=1M'
+
+For instructions on how to transfer the image to the eMMC/SD, please refer to
+the "Programming the Linux image" section of our guide on updating
+PolarFire SoC dev kits:
+https://github.com/polarfire-soc/polarfire-soc-documentation/blob/master/reference-designs-fpga-and-development-kits/updating-mpfs-kit.md.
diff --git a/board/microchip/mpfs_icicle/config.yaml b/board/microchip/mpfs_icicle/config.yaml
new file mode 100644
index 0000000000..5fccdfd34f
--- /dev/null
+++ b/board/microchip/mpfs_icicle/config.yaml
@@ -0,0 +1,28 @@
+#
+# HSS Payload Generator - buildroot configuration file
+#
+
+# First, we can optionally set a name for our image, otherwise one will be created dynamically
+set-name: 'PolarFire-SoC-HSS::U-Boot'
+
+#
+# Next, we'll define the entry point addresses for each hart, as follows:
+#
+hart-entry-points: {u54_1: '0x80200000', u54_2: '0x80200000', u54_3: '0x80200000', u54_4: '0x80200000'}
+#
+# Finally, we'll define a payloads (source binary file) that will be placed at certain regions in memory
+# The payload section is defined with the keyword payloads, and then a number of individual
+# payload descriptors.
+#
+# Each payload has a name (path to its ELF/bin file), an owner-hart, and optionally 1-3 secondary-harts.
+#
+# Additionally, it has a privilege mode in which it will start execution.
+#  * Valid privilege modes are PRV_M, PRV_S and PRV_U.
+#
+#
+# In this case, the only payload is the u-boot s-mode binary.
+#
+# Case only matters for the ELF path names, not the keywords.
+#
+payloads:
+  u-boot.bin: {exec-addr: '0x80200000', owner-hart: u54_1, secondary-hart: u54_2, secondary-hart: u54_3, secondary-hart: u54_4, priv-mode: prv_s}
diff --git a/board/microchip/mpfs_icicle/genimage.cfg b/board/microchip/mpfs_icicle/genimage.cfg
new file mode 100644
index 0000000000..6955d3365a
--- /dev/null
+++ b/board/microchip/mpfs_icicle/genimage.cfg
@@ -0,0 +1,34 @@
+# Image for eMMC or SDCard boot on the Microchip PolarFire SOC Icicle Board
+#
+image boot.vfat {
+	vfat {
+		files = {
+			 "mpfs_icicle.itb",
+		}
+
+		file boot.scr {
+			image = "boot.scr"
+		}
+	}
+	size = 60M
+}
+
+image sdcard.img {
+	hdimage {
+		gpt = true
+	}
+
+	partition uboot {
+		partition-type-uuid = 21686148-6449-6E6F-744E-656564454649
+		image = "payload.bin"
+	}
+
+	partition kernel {
+		bootable = "true"
+		image = "boot.vfat"
+	}
+
+	partition root {
+		image = "rootfs.ext4"
+	}
+}
diff --git a/board/microchip/mpfs_icicle/linux.fragment b/board/microchip/mpfs_icicle/linux.fragment
new file mode 100644
index 0000000000..0cecddb61b
--- /dev/null
+++ b/board/microchip/mpfs_icicle/linux.fragment
@@ -0,0 +1 @@
+CONFIG_POLARFIRE_SOC_DMA_NONCOHERENT=y
diff --git a/board/microchip/mpfs_icicle/mpfs_icicle.its b/board/microchip/mpfs_icicle/mpfs_icicle.its
new file mode 100644
index 0000000000..a62b079fa1
--- /dev/null
+++ b/board/microchip/mpfs_icicle/mpfs_icicle.its
@@ -0,0 +1,53 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Flattened Image Tree file for Icicle Kit
+ *
+ */
+
+/dts-v1/;
+
+/ {
+	description = "U-Boot fitImage for the MPFS";
+	address-cells = <1>;
+
+		images {
+			kernel {
+				description = "Linux kernel";
+				data = /incbin/("./Image");
+				type = "kernel";
+				arch = "riscv";
+				os = "linux";
+				compression = "none";
+				load = <0x80200000>;
+				entry = <0x80200000>;
+				hash-1 {
+					algo = "sha256";
+				};
+			};
+			base_fdt {
+				description = "Flattened Device Tree blob";
+				data = /incbin/("./mpfs-icicle-kit.dtb");
+				type = "flat_dt";
+				arch = "riscv";
+				compression = "none";
+				load = <0x8a000000>;
+				hash-1 {
+					algo = "sha256";
+				};
+			};
+		};
+
+		configurations {
+			default = "kernel_dtb";
+			kernel_dtb {
+				description = "1 Linux kernel, FDT blob";
+				kernel = "kernel";
+				fdt = "base_fdt";
+			};
+
+			base_dtb {
+				description = "Base FDT blob for MPFS Icicle board";
+				fdt = "base_fdt";
+			};
+		};
+};
diff --git a/board/microchip/mpfs_icicle/post-image.sh b/board/microchip/mpfs_icicle/post-image.sh
new file mode 100755
index 0000000000..54cc6d71f8
--- /dev/null
+++ b/board/microchip/mpfs_icicle/post-image.sh
@@ -0,0 +1,13 @@
+#!/usr/bin/env bash
+
+BASE_DIR=$(pwd)
+HSS_PAYLOAD_GENERATOR=$HOST_DIR/bin/hss-payload-generator
+MKIMAGE=$HOST_DIR/bin/mkimage
+GENIMAGE=${BASE_DIR}/support/scripts/genimage.sh
+GENIMAGE_CFG=${BASE_DIR}/$2
+
+cd "${BINARIES_DIR}" || exit
+${HSS_PAYLOAD_GENERATOR} -c "${BASE_DIR}"/board/microchip/mpfs_icicle/config.yaml payload.bin
+cp "${BASE_DIR}"/board/microchip/mpfs_icicle/mpfs_icicle.its ./
+${MKIMAGE} -f mpfs_icicle.its mpfs_icicle.itb
+${GENIMAGE} -c "${GENIMAGE_CFG}"
diff --git a/board/microchip/mpfs_icicle/uboot-env.txt b/board/microchip/mpfs_icicle/uboot-env.txt
new file mode 100644
index 0000000000..8a655085ed
--- /dev/null
+++ b/board/microchip/mpfs_icicle/uboot-env.txt
@@ -0,0 +1,16 @@
+# this assumes ${scriptaddr} is already set!!
+
+# Try to boot a fitImage from eMMC/SD
+
+setenv fdt_high 0xffffffffffffffff
+setenv initrd_high 0xffffffffffffffff
+
+load mmc 0:${distro_bootpart} ${scriptaddr} mpfs_icicle.itb;
+bootm start ${scriptaddr}#kernel_dtb;
+bootm loados ${scriptaddr};
+# Try to load a ramdisk if available inside fitImage
+bootm ramdisk;
+bootm prep;
+fdt set /soc/ethernet@20112000 mac-address ${icicle_mac_addr0};
+fdt set /soc/ethernet@20110000 mac-address ${icicle_mac_addr1};
+bootm go;
diff --git a/board/microchip/mpfs_icicle/uboot-fragment-rootfs.config b/board/microchip/mpfs_icicle/uboot-fragment-rootfs.config
new file mode 100644
index 0000000000..e2a5eb9438
--- /dev/null
+++ b/board/microchip/mpfs_icicle/uboot-fragment-rootfs.config
@@ -0,0 +1,3 @@
+CONFIG_USE_BOOTARGS=y
+CONFIG_BOOTARGS="root=/dev/mmcblk0p3 rootwait uio_pdrv_genirq.of_id=generic-uio"
+CONFIG_MPFS_PRIORITISE_QSPI_BOOT=n
diff --git a/configs/microchip_mpfs_icicle_defconfig b/configs/microchip_mpfs_icicle_defconfig
new file mode 100644
index 0000000000..9ad1bf66d8
--- /dev/null
+++ b/configs/microchip_mpfs_icicle_defconfig
@@ -0,0 +1,34 @@
+BR2_riscv=y
+BR2_riscv_custom=y
+BR2_RISCV_ISA_CUSTOM_RVM=y
+BR2_RISCV_ISA_CUSTOM_RVF=y
+BR2_RISCV_ISA_CUSTOM_RVD=y
+BR2_RISCV_ISA_CUSTOM_RVC=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
+BR2_TARGET_GENERIC_HOSTNAME="mpfs_icicle"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/microchip/mpfs_icicle/post-image.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="board/microchip/mpfs_icicle/genimage.cfg"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,linux4microchip,linux,linux-6.1-mchp+fpga)/linux4microchip+fpga-2023.06.tar.gz"
+BR2_LINUX_KERNEL_DEFCONFIG="mpfs"
+BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/microchip/mpfs_icicle/linux.fragment"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="microchip/mpfs-icicle-kit"
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,polarfire-soc,u-boot)linux4microchip+fpga-2023.06.tar.gz"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="microchip_mpfs_icicle"
+BR2_TARGET_UBOOT_CONFIG_FRAGMENT_FILES="board/microchip/mpfs_icicle/uboot-fragment-rootfs.config"
+BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_MICROCHIP_HSS_PAYLOAD_GENERATOR=y
+BR2_PACKAGE_HOST_MTOOLS=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SUPPORT=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT_SOURCE="board/microchip/mpfs_icicle/uboot-env.txt"
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
