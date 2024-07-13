Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A45FFC3DA42
	for <buildroot@archiver.kernel.org>; Sat, 13 Jul 2024 09:17:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5DAD6606C2;
	Sat, 13 Jul 2024 09:17:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id u-ezWT9Jm2XS; Sat, 13 Jul 2024 09:17:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B852160670
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B852160670;
	Sat, 13 Jul 2024 09:17:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 68E991BF4D6
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 09:17:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 56095845CA
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 09:17:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P-yQ8qXXh8Ww for <buildroot@lists.busybox.net>;
 Sat, 13 Jul 2024 09:17:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CD19D845C9
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id CD19D845C9
 for <buildroot@buildroot.org>; Sat, 13 Jul 2024 09:17:33 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B601B863F0; Sat, 13 Jul 2024 09:17:33 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 13 Jul 2024 11:16:46 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9954315fc5b2026552a0f0175307ec8784b51578
X-Git-Newrev: 92a8ad923e33e3fdf8c76caf2825de9b36b2ff43
X-Patchwork-Hint: ignore
Message-Id: <20240713091733.B601B863F0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/beaglev_fire: add support for
 BeagleV Fire
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=92a8ad923e33e3fdf8c76caf2825de9b36b2ff43
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add support for the BeagleV Fire, the Beagleboard SBC powered by
Microchip's PolarFire SoC.

The configuration file is beaglev_fire_defconfig. It builds a
bootable kernel image with an embedded root file system. The image
built can be flashed to the board using the eMMC.

The yaml configuration file is used by the hss payload generator. It
maps the ELF binaries or binary blobs to the application hart.

The image generator script sets the partitions of the image.

The image tree souce file creates a FIT image.

The post image script creates the payload using the payload generator
host package and finally, creates the FIT image using the ITS after the
kernel build. It also creates the BMAP file for use with the BMAP
command line tool to transfer the image to the board.

The U-Boot script and additional U-Boot configurations ensure that
U-Boot behaves as expected for the BeagleV-Fire and boots the FIT image.

The rootfs-overlay contains script for updating the BeagleV-Fire
gateware.

The README.txt documents how to build and boot the Beagle-V Fire with
this configuration. It also explains how to program a custom bitstream.

Signed-off-by: Jamie Gibbons <jamie.gibbons@microchip.com>
Reviewed-by: Valentina Fernandez <valentina.fernandezalanis@microchip.com>
[Romain:
  - move board files to board/beagleboard directory
  - enable BR2_DOWNLOAD_FORCE_CHECK_HASHES and add hashes files
  - enable BR2_KERNEL_HEADERS_AS_KERNEL for linux-headers to avoid specify
    BR2_DEFAULT_KERNEL_VERSION
  - add BR2_PACKAGE_HOST_DOSFSTOOLS for mkdosfs (host variant)
]
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 DEVELOPERS                                         |   2 +
 board/beagleboard/beaglev_fire/README.txt          | 134 +++++++++++++++++++++
 board/beagleboard/beaglev_fire/beaglev_fire.its    |  55 +++++++++
 board/beagleboard/beaglev_fire/boot.cmd            |  15 +++
 board/beagleboard/beaglev_fire/config.yaml         |  28 +++++
 board/beagleboard/beaglev_fire/genimage.cfg        |  35 ++++++
 .../patches/linux-headers/linux-headers.hash       |   1 +
 .../beaglev_fire/patches/linux/linux.hash          |   2 +
 .../beaglev_fire/patches/uboot/uboot.hash          |   2 +
 board/beagleboard/beaglev_fire/post-image.sh       |  14 +++
 .../usr/share/microchip/update-gateware.sh         |  32 +++++
 .../beagleboard/beaglev_fire/uboot-fragment.config |   3 +
 configs/beaglev_fire_defconfig                     |  33 +++++
 13 files changed, 356 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 7b0f65fbfb..5336f0fe76 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1500,7 +1500,9 @@ F:	package/swaybg/
 F:	package/yad/
 
 N:	Jamie Gibbons <jamie.gibbons@microchip.com>
+F:	board/beagleboard/beaglev_fire/
 F:	board/microchip/mpfs_icicle/
+F:	configs/beaglev_fire_defconfig
 F:	configs/microchip_mpfs_icicle_defconfig
 F:	package/microchip-hss-payload-generator/
 
diff --git a/board/beagleboard/beaglev_fire/README.txt b/board/beagleboard/beaglev_fire/README.txt
new file mode 100644
index 0000000000..c9a824b67f
--- /dev/null
+++ b/board/beagleboard/beaglev_fire/README.txt
@@ -0,0 +1,134 @@
+Beagle-V Fire
+==============
+
+BeagleV Fire is a low-cost RISC-V 64-bit based platform, powered by
+Microchip's PolarFire SoC. This file describes how to use the
+pre-defined Buildroot configuration for the Beagle-V Fire board.
+
+Further information about the Beagle-V Fire can be found at
+https://docs.beagleboard.org/latest/boards/beaglev/fire/index.html.
+
+
+Building
+========
+
+Configure Buildroot using the default board configuration:
+
+  '$ make beaglev_fire_defconfig'
+
+Customise the build as necessary:
+
+  '$ make menuconfig'
+
+Start the build:
+
+  '$ make'
+
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
+    +-- Image.gz
+    +-- beaglev_fire.itb
+    +-- beaglev_fire.its
+    +-- mpfs-beaglev-fire.dtb
+    +-- payload.bin
+    +-- rootfs.ext2
+    +-- rootfs.ext4
+    +-- rootfs.tar
+    +-- sdcard.img
+    +-- u-boot.bin
+
+
+Flashing the image to your eMMC
+===============================
+
+By default Buildroot builds an image suitable for the eMMC. The first partition
+of this image contains a U-Boot binary, embedded in a Hart Software Services
+(HSS) payload. The second partition contains a FAT filesystem with a U-Boot env
+and an ITB file containing the kernel and the device tree. The third partition
+contains the file system. This image can be written directly to the eMMC.
+
+To do so, follow the below steps:
+
+1. Connect to BeagleV-Fire UART debug port using a 3.3v USB to UART bridge.
+
+2. Now you can run `tio <port>` in a terminal window to access the UART debug
+port connection.
+  e.g `tio /dev/ttyUSB4`
+
+3. Once you are connected properly, you can press the Reset button which will
+show you a progress bar.
+
+4. Press any key in the terminal application to stop the HSS from booting. This
+will give you access to the HSS command line interface and a ">>" for input
+will be displayed in the terminal.
+
+5. Type `usbdmsc` in the HSS command line interface. The HSS `usbdmsc` command
+exposes the eMMC as a USB mass storage device using the USB type C connector.
+If successful, a message saying "USB Host connected" will be displayed.
+
+6. The eMMC should now appear as mass storage device/drive on your host PC, as
+it is mounted through your USB type C connector.
+
+7. Now, all you need to do is dd the image to the eMMC, which can be done with
+the following command on your development host:
+
+  '$ sudo dd if=output/images/sdcard.img of=/dev/sdX bs=1M'
+
+You will have to replace /dev/sdX by the actual device name of your eMMC.
+Please, be especially cautious not to overwrite the wrong drive as this cannot
+be undone.
+
+8. Once the image transfer has completed you can type `CTRL+C` to disconnect
+your device.
+
+9. Finally, type `boot` or reset your board to boot your new Linux image.
+
+Customize BeagleV-Fire Cape Gateware Using Verilog (Optional)
+=============================================================
+
+To customize your Beagle-V Fire gateware please follow the guide below to
+create your custom bitstream (steps 1 - 6):
+https://docs.beagleboard.org/latest/boards/beaglev/fire/demos-and-tutorials/gateware/customize-cape-gateware-verilog.html
+
+
+  Program BeagleV-Fire With Your Custom Bitstream with Buildroot
+  ==============================================================
+
+  After following the steps 1-6 from the above tutorial, you should now have a
+  artifacts.zip file on your local host.
+
+  Unzip the downloaded artifacts.zip file.
+
+  Go to the custom FPGA design directory:
+    'cd artifacts/bitstreams/my_custom_fpga_design'
+
+  On your Linux host development computer, copy the bitstream to BeagleV-Fire
+  board, replacing </path/to/your/> with the path to your BeagleV-Fire root file
+  system.
+    'cp -r ./LinuxProgramming /path/to/your/buildroot/board/beagleboard/beaglev_fire/rootfs-overlay/etc/'
+
+  To apply these changes to your image, make sure to re-build it with:
+    `make`
+
+  Then, re-flash your image - to ensure you have the necessary firmware files - by
+  following the above section "Flashing the image to your eMMC".
+
+  On BeagleV-Fire,
+    1. Make your update gateware script executable
+      'chmod +x /usr/share/microchip/update-gateware.sh'
+    2. Create a firmware directory
+      'mkdir /lib/firmware'
+    3. Change to the directory of your gateware script
+      `cd /usr/share/microchip/`
+    3. initiate the reprogramming of the FPGA with your gateware bitstream:
+      './update-gateware.sh /etc/LinuxProgramming/'
+
+  Wait for a couple of minutes for the BeagleV-Fire to reprogram itself.
diff --git a/board/beagleboard/beaglev_fire/beaglev_fire.its b/board/beagleboard/beaglev_fire/beaglev_fire.its
new file mode 100644
index 0000000000..97c878c118
--- /dev/null
+++ b/board/beagleboard/beaglev_fire/beaglev_fire.its
@@ -0,0 +1,55 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Flattened Image Tree file for BVF
+ *
+ * Copyright (C) 2024 Microchip Technology Inc. and its subsidiaries.
+ *
+ */
+
+/dts-v1/;
+
+/ {
+	description = "U-Boot fitImage for the BeagleV-Fire";
+	#address-cells = <2>;
+
+		images {
+			kernel {
+				description = "Linux kernel";
+				data = /incbin/("./Image.gz");
+				type = "kernel";
+				arch = "riscv";
+				os = "linux";
+				compression = "gzip";
+				load = <0x80200000>;
+				entry = <0x80200000>;
+				hash-1 {
+					algo = "sha256";
+				};
+			};
+			base_fdt {
+				description = "Flattened Device Tree blob";
+				data = /incbin/("./mpfs-beaglev-fire.dtb");
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
+				description = "Base FDT blob for BeagleV-Fire board";
+				fdt = "base_fdt";
+			};
+		};
+};
diff --git a/board/beagleboard/beaglev_fire/boot.cmd b/board/beagleboard/beaglev_fire/boot.cmd
new file mode 100644
index 0000000000..05f4858bac
--- /dev/null
+++ b/board/beagleboard/beaglev_fire/boot.cmd
@@ -0,0 +1,15 @@
+# this assumes ${scriptaddr} is already set!!
+
+# Try to boot a fitImage from eMMC/SD
+
+setenv fdt_high 0xffffffffffffffff
+setenv initrd_high 0xffffffffffffffff
+
+load mmc 0:${distro_bootpart} ${scriptaddr} beaglev_fire.itb;
+bootm start ${scriptaddr}#kernel_dtb;
+bootm loados ${scriptaddr};
+# Try to load a ramdisk if available inside fitImage
+bootm ramdisk;
+bootm prep;
+fdt set /soc/ethernet@20110000 mac-address ${beaglevfire_mac_addr0};
+bootm go;
diff --git a/board/beagleboard/beaglev_fire/config.yaml b/board/beagleboard/beaglev_fire/config.yaml
new file mode 100644
index 0000000000..5fccdfd34f
--- /dev/null
+++ b/board/beagleboard/beaglev_fire/config.yaml
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
diff --git a/board/beagleboard/beaglev_fire/genimage.cfg b/board/beagleboard/beaglev_fire/genimage.cfg
new file mode 100644
index 0000000000..ef650704c6
--- /dev/null
+++ b/board/beagleboard/beaglev_fire/genimage.cfg
@@ -0,0 +1,35 @@
+# Image for eMMC boot on the Microchip PolarFire SOC BeagleV-Fire Board
+#
+image boot.vfat {
+	vfat {
+		files = {
+			 "beaglev_fire.itb",
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
+		partition-table-type = "gpt"
+	}
+
+	partition uboot {
+		partition-type-uuid = 21686148-6449-6E6F-744E-656564454649
+		image = "payload.bin"
+	}
+
+	partition kernel {
+		partition-type-uuid = 0FC63DAF-8483-4772-8E79-3D69D8477DE4
+		bootable = "true"
+		image = "boot.vfat"
+	}
+
+	partition root {
+		image = "rootfs.ext4"
+	}
+}
diff --git a/board/beagleboard/beaglev_fire/patches/linux-headers/linux-headers.hash b/board/beagleboard/beaglev_fire/patches/linux-headers/linux-headers.hash
new file mode 120000
index 0000000000..5808d92afe
--- /dev/null
+++ b/board/beagleboard/beaglev_fire/patches/linux-headers/linux-headers.hash
@@ -0,0 +1 @@
+../linux/linux.hash
\ No newline at end of file
diff --git a/board/beagleboard/beaglev_fire/patches/linux/linux.hash b/board/beagleboard/beaglev_fire/patches/linux/linux.hash
new file mode 100644
index 0000000000..d621dc3201
--- /dev/null
+++ b/board/beagleboard/beaglev_fire/patches/linux/linux.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  7d634bf425f2ad68c3a6aab0d67a5f0c9f59a4fae02f051054f428854913f58a  linux4microchip+fpga-2024.02.tar.gz
diff --git a/board/beagleboard/beaglev_fire/patches/uboot/uboot.hash b/board/beagleboard/beaglev_fire/patches/uboot/uboot.hash
new file mode 100644
index 0000000000..684aa15a12
--- /dev/null
+++ b/board/beagleboard/beaglev_fire/patches/uboot/uboot.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  c21209347beac37540f1c7070760498493975052b536fc02677faa2110666bab  linux4microchip+fpga-2024.02.tar.gz
diff --git a/board/beagleboard/beaglev_fire/post-image.sh b/board/beagleboard/beaglev_fire/post-image.sh
new file mode 100755
index 0000000000..43be1356cf
--- /dev/null
+++ b/board/beagleboard/beaglev_fire/post-image.sh
@@ -0,0 +1,14 @@
+#!/bin/bash
+set -e
+
+HSS_PAYLOAD_GENERATOR="${HOST_DIR}"/bin/hss-payload-generator
+MKIMAGE="${HOST_DIR}"/bin/mkimage
+BOARD_DIR="$(pwd)"/"${0%/*}"
+
+pushd "${BINARIES_DIR}"
+"${HSS_PAYLOAD_GENERATOR}" -c "${BOARD_DIR}"/config.yaml payload.bin
+cp "${BOARD_DIR}"/beaglev_fire.its "${BINARIES_DIR}"/beaglev_fire.its
+gzip -9 Image -c > Image.gz
+"${MKIMAGE}" -f beaglev_fire.its beaglev_fire.itb
+popd
+support/scripts/genimage.sh -c "${BOARD_DIR}"/genimage.cfg
diff --git a/board/beagleboard/beaglev_fire/rootfs-overlay/usr/share/microchip/update-gateware.sh b/board/beagleboard/beaglev_fire/rootfs-overlay/usr/share/microchip/update-gateware.sh
new file mode 100644
index 0000000000..f455037b60
--- /dev/null
+++ b/board/beagleboard/beaglev_fire/rootfs-overlay/usr/share/microchip/update-gateware.sh
@@ -0,0 +1,32 @@
+#!/bin/sh
+
+if [ ! -e "$1"/mpfs_bitstream.spi ]; then
+        echo "No gateware file found."
+        exit 1
+fi
+
+if [ ! -d /lib/firmware ]
+then
+    mkdir /lib/firmware
+fi
+
+cp "$1"/mpfs_dtbo.spi /lib/firmware/mpfs_dtbo.spi
+cp "$1"/mpfs_bitstream.spi /lib/firmware/mpfs_bitstream.spi
+
+mount -t debugfs none /sys/kernel/debug
+
+# Trash existing device tree overlay in case the rest of the process fails:
+flash_erase /dev/mtd0 0 1024
+
+# # Write device tree overlay
+dd if=/lib/firmware/mpfs_dtbo.spi of=/dev/mtd0 seek=1024
+
+# Fake the presence of a golden image for now.
+dd if=/dev/zero of=/dev/mtd0 count=4 bs=1
+
+# Initiate FPGA update.
+echo 1 > /sys/kernel/debug/fpga/microchip_exec_update
+
+# Reboot Linux for the gateware update to take effect.
+# FPGA reprogramming takes places between Linux shut-down and HSS restarting the board.
+reboot
diff --git a/board/beagleboard/beaglev_fire/uboot-fragment.config b/board/beagleboard/beaglev_fire/uboot-fragment.config
new file mode 100644
index 0000000000..e2a5eb9438
--- /dev/null
+++ b/board/beagleboard/beaglev_fire/uboot-fragment.config
@@ -0,0 +1,3 @@
+CONFIG_USE_BOOTARGS=y
+CONFIG_BOOTARGS="root=/dev/mmcblk0p3 rootwait uio_pdrv_genirq.of_id=generic-uio"
+CONFIG_MPFS_PRIORITISE_QSPI_BOOT=n
diff --git a/configs/beaglev_fire_defconfig b/configs/beaglev_fire_defconfig
new file mode 100644
index 0000000000..d52ec3c7d7
--- /dev/null
+++ b/configs/beaglev_fire_defconfig
@@ -0,0 +1,33 @@
+BR2_riscv=y
+BR2_RISCV_ISA_RVC=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
+BR2_GLOBAL_PATCH_DIR="board/beagleboard/beaglev_fire/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
+BR2_SYSTEM_DHCP="eth0"
+BR2_ROOTFS_OVERLAY="board/beagleboard/beaglev_fire/rootfs-overlay/"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/beagleboard/beaglev_fire/post-image.sh"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,linux4microchip,linux,linux-6.1-mchp+fpga)/linux4microchip+fpga-2024.02.tar.gz"
+BR2_LINUX_KERNEL_DEFCONFIG="mpfs"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="microchip/mpfs-beaglev-fire"
+BR2_PACKAGE_MTD=y
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,polarfire-soc,u-boot)linux4microchip+fpga-2024.02.tar.gz"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="beaglev_fire"
+BR2_TARGET_UBOOT_CONFIG_FRAGMENT_FILES="board/beagleboard/beaglev_fire/uboot-fragment.config"
+BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_MICROCHIP_HSS_PAYLOAD_GENERATOR=y
+BR2_PACKAGE_HOST_MTOOLS=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SUPPORT=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT_SOURCE="board/beagleboard/beaglev_fire/boot.cmd"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
