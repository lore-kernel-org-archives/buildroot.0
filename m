Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF37EEC8738
	for <buildroot@archiver.kernel.org>; Thu,  7 Sep 2023 15:21:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 97F8683B09;
	Thu,  7 Sep 2023 15:21:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 97F8683B09
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4EJO4UwrDh04; Thu,  7 Sep 2023 15:21:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 80E4183BB4;
	Thu,  7 Sep 2023 15:21:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 80E4183BB4
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 16B391BF313
 for <buildroot@lists.busybox.net>; Thu,  7 Sep 2023 14:52:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B4E6341E4A
 for <buildroot@lists.busybox.net>; Thu,  7 Sep 2023 14:51:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B4E6341E4A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UIPkx19KUkLY for <buildroot@lists.busybox.net>;
 Thu,  7 Sep 2023 14:51:31 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6AC7341DB2
 for <buildroot@buildroot.org>; Thu,  7 Sep 2023 14:51:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6AC7341DB2
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 58FEF80E3F; Thu,  7 Sep 2023 14:51:28 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 8 Aug 2023 23:50:17 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 312fcbf0ed995738afbf21a507a3cedea65db876
X-Git-Newrev: 87280a43a94dc868511f6b19e13d56787d8f470f
X-Patchwork-Hint: ignore
Message-Id: <20230907145128.58FEF80E3F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/microchip_mpfs_icicle: new
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

commit: https://git.buildroot.net/buildroot/commit/?id=87280a43a94dc868511f6b19e13d56787d8f470f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add support for the icicle kit, the main development board for
Microchip's PolarFire SoC.

The configuration file is microchip_mpfs_icicle_defconfig. It builds a
bootable kernel image with an embedded root file system. The image
built can be flashed to the board using the eMMC or an SD card.

The yaml configuration file is used by the hss payload generator. It
maps the ELF binaries or binary blobs to the individual application
harts (U54s).

The image generator script sets the partitions of the image.

The kernel fragment file sets additional configurations for the icicle
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
Reviewed-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                         |  2 +
 board/microchip/mpfs_icicle/README.txt             | 62 ++++++++++++++++++++++
 board/microchip/mpfs_icicle/config.yaml            | 28 ++++++++++
 board/microchip/mpfs_icicle/genimage.cfg           | 34 ++++++++++++
 board/microchip/mpfs_icicle/linux.fragment         |  1 +
 board/microchip/mpfs_icicle/mpfs_icicle.its        | 53 ++++++++++++++++++
 board/microchip/mpfs_icicle/post-image.sh          |  8 +++
 board/microchip/mpfs_icicle/uboot-env.txt          | 16 ++++++
 .../mpfs_icicle/uboot-fragment-rootfs.config       |  3 ++
 configs/microchip_mpfs_icicle_defconfig            | 33 ++++++++++++
 10 files changed, 240 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 6daff7c078..2cfff87cd5 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1476,6 +1476,8 @@ F:	package/swaybg/
 F:	package/yad/
 
 N:	Jamie Gibbons <jamie.gibbons@microchip.com>
+F:	board/microchip/mpfs_icicle/
+F:	configs/microchip_mpfs_icicle_defconfig
 F:	package/microchip-hss-payload-generator/
 
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
index 0000000000..c0e95e1642
--- /dev/null
+++ b/board/microchip/mpfs_icicle/post-image.sh
@@ -0,0 +1,8 @@
+#!/bin/sh
+HSS_PAYLOAD_GENERATOR=${HOST_DIR}/bin/hss-payload-generator
+MKIMAGE=${HOST_DIR}/bin/mkimage
+
+${HSS_PAYLOAD_GENERATOR} -c board/microchip/mpfs_icicle/config.yaml ${BINARIES_DIR}/payload.bin
+cp board/microchip/mpfs_icicle/mpfs_icicle.its ${BINARIES_DIR}/mpfs_icicle.its
+(cd ${BINARIES_DIR} && ${MKIMAGE} -f mpfs_icicle.its mpfs_icicle.itb)
+support/scripts/genimage.sh -c board/microchip/mpfs_icicle/genimage.cfg
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
index 0000000000..b2568cae6a
--- /dev/null
+++ b/configs/microchip_mpfs_icicle_defconfig
@@ -0,0 +1,33 @@
+BR2_riscv=y
+BR2_riscv_custom=y
+BR2_RISCV_ISA_CUSTOM_RVM=y
+BR2_RISCV_ISA_CUSTOM_RVF=y
+BR2_RISCV_ISA_CUSTOM_RVD=y
+BR2_RISCV_ISA_CUSTOM_RVC=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
+BR2_TARGET_GENERIC_HOSTNAME="mpfs_icicle"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/microchip/mpfs_icicle/post-image.sh"
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
