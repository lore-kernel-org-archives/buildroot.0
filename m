Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C4AFC27C4F
	for <buildroot@archiver.kernel.org>; Tue, 18 Jun 2024 08:10:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 09C3060B5C;
	Tue, 18 Jun 2024 08:10:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZNvjEjaPe04D; Tue, 18 Jun 2024 08:10:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D827F60B6C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D827F60B6C;
	Tue, 18 Jun 2024 08:10:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B15781BF282
 for <buildroot@lists.busybox.net>; Tue, 18 Jun 2024 08:10:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AB44440BB9
 for <buildroot@lists.busybox.net>; Tue, 18 Jun 2024 08:10:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8lbnjTNnJr0r for <buildroot@lists.busybox.net>;
 Tue, 18 Jun 2024 08:10:28 +0000 (UTC)
X-Greylist: delayed 430 seconds by postgrey-1.37 at util1.osuosl.org;
 Tue, 18 Jun 2024 08:10:28 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6611140154
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6611140154
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=68.232.154.123;
 helo=esa.microchip.iphmx.com;
 envelope-from=prvs=892ae8cca=jamie.gibbons@microchip.com; receiver=<UNKNOWN> 
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.154.123])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6611140154
 for <buildroot@buildroot.org>; Tue, 18 Jun 2024 08:10:28 +0000 (UTC)
X-CSE-ConnectionGUID: UNLDkdqiTgqQ0IXG/4pWEw==
X-CSE-MsgGUID: iuYJ4UVOSFmpcflIJhJzGQ==
X-IronPort-AV: E=Sophos;i="6.08,247,1712646000"; d="scan'208";a="195414587"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 18 Jun 2024 01:03:17 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 18 Jun 2024 01:03:11 -0700
Received: from jamie-dev.microchip.com (10.10.85.11) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Tue, 18 Jun 2024 01:03:10 -0700
To: <buildroot@buildroot.org>
Date: Tue, 18 Jun 2024 09:05:04 +0100
Message-ID: <20240618080504.3964101-1-jamie.gibbons@microchip.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1718698228; x=1750234228;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=URL3H1PFwkNeK1Z/lkfGqrvoBZo9yAvJFMwYa4W8scA=;
 b=a6KfjT4NoJD3QIZ6cG8WxxcTQU856p5XvlMrBEer3ZrL3FumNuLMvM93
 gJ12CE88eRyR30EeGL+/Qu8gvNKF7sYcq5tTsvGmaqvYlyHb9Mv1sVfy6
 wJ7+sZXSVkr0d8fiWw7sKnKCTEsROABlOdi3DEWbqp3R95057fckDKCm8
 A5zwdxTMGkaubblw48j8EDO3hEQqBICZGD2USzrMxs9Gwzt4uWrG6IJaU
 RLlPE9V5nP+IIXoPqmUlFlTY+68HPItkyycbqxJyGHZT8/g7AN+g735+e
 dyHu5jxQccG3B0+ptBbc945qPvtzSL21e9IYQ7ygeMGVMwjcBuRMKFvR0
 A==;
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=microchip.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=microchip.com header.i=@microchip.com
 header.a=rsa-sha256 header.s=mchp header.b=a6KfjT4N
Subject: [Buildroot] [PATCH v2 1/1] configs/beaglev_fire: add support for
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
From: Jamie Gibbons via buildroot <buildroot@buildroot.org>
Reply-To: Jamie Gibbons <jamie.gibbons@microchip.com>
Cc: Conor Dooley <Conor.Dooley@microchip.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Valentina Fernandez <valentina.fernandezalanis@microchip.com>, Jamie
 Gibbons <jamie.gibbons@microchip.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

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
---
v1 -> v2:
- README updates
- renamed U-Boot boot script
- combined gateware update scripts
- replaced mtd_debug with flash_erase and dd in gateware update script
- fixed genimage for initramfs image generation
- removed unused target packages
---
 DEVELOPERS                                    |   2 +
 board/beaglev_fire/README.txt                 | 134 ++++++++++++++++++
 board/beaglev_fire/beaglev_fire.its           |  55 +++++++
 board/beaglev_fire/boot.cmd                   |  15 ++
 board/beaglev_fire/config.yaml                |  28 ++++
 board/beaglev_fire/genimage.cfg               |  35 +++++
 board/beaglev_fire/post-image.sh              |  14 ++
 .../usr/share/microchip/update-gateware.sh    |  32 +++++
 board/beaglev_fire/uboot-fragment.config      |   3 +
 configs/beaglev_fire_defconfig                |  32 +++++
 10 files changed, 350 insertions(+)
 create mode 100644 board/beaglev_fire/README.txt
 create mode 100644 board/beaglev_fire/beaglev_fire.its
 create mode 100644 board/beaglev_fire/boot.cmd
 create mode 100644 board/beaglev_fire/config.yaml
 create mode 100644 board/beaglev_fire/genimage.cfg
 create mode 100755 board/beaglev_fire/post-image.sh
 create mode 100644 board/beaglev_fire/rootfs-overlay/usr/share/microchip/update-gateware.sh
 create mode 100644 board/beaglev_fire/uboot-fragment.config
 create mode 100644 configs/beaglev_fire_defconfig

diff --git a/DEVELOPERS b/DEVELOPERS
index 8bfd36f1d8..59783cc989 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1489,7 +1489,9 @@ F:	package/swaybg/
 F:	package/yad/
 
 N:	Jamie Gibbons <jamie.gibbons@microchip.com>
+F:	board/beaglev_fire/
 F:	board/microchip/mpfs_icicle/
+F:	configs/beaglev_fire_defconfig
 F:	configs/microchip_mpfs_icicle_defconfig
 F:	package/microchip-hss-payload-generator/
 
diff --git a/board/beaglev_fire/README.txt b/board/beaglev_fire/README.txt
new file mode 100644
index 0000000000..f78f30ba5d
--- /dev/null
+++ b/board/beaglev_fire/README.txt
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
+    'cp -r ./LinuxProgramming /path/to/your/buildroot/board/beaglev_fire/rootfs-overlay/etc/'
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
\ No newline at end of file
diff --git a/board/beaglev_fire/beaglev_fire.its b/board/beaglev_fire/beaglev_fire.its
new file mode 100644
index 0000000000..97c878c118
--- /dev/null
+++ b/board/beaglev_fire/beaglev_fire.its
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
diff --git a/board/beaglev_fire/boot.cmd b/board/beaglev_fire/boot.cmd
new file mode 100644
index 0000000000..05f4858bac
--- /dev/null
+++ b/board/beaglev_fire/boot.cmd
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
diff --git a/board/beaglev_fire/config.yaml b/board/beaglev_fire/config.yaml
new file mode 100644
index 0000000000..5fccdfd34f
--- /dev/null
+++ b/board/beaglev_fire/config.yaml
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
diff --git a/board/beaglev_fire/genimage.cfg b/board/beaglev_fire/genimage.cfg
new file mode 100644
index 0000000000..ef650704c6
--- /dev/null
+++ b/board/beaglev_fire/genimage.cfg
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
diff --git a/board/beaglev_fire/post-image.sh b/board/beaglev_fire/post-image.sh
new file mode 100755
index 0000000000..43be1356cf
--- /dev/null
+++ b/board/beaglev_fire/post-image.sh
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
diff --git a/board/beaglev_fire/rootfs-overlay/usr/share/microchip/update-gateware.sh b/board/beaglev_fire/rootfs-overlay/usr/share/microchip/update-gateware.sh
new file mode 100644
index 0000000000..f455037b60
--- /dev/null
+++ b/board/beaglev_fire/rootfs-overlay/usr/share/microchip/update-gateware.sh
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
diff --git a/board/beaglev_fire/uboot-fragment.config b/board/beaglev_fire/uboot-fragment.config
new file mode 100644
index 0000000000..e2a5eb9438
--- /dev/null
+++ b/board/beaglev_fire/uboot-fragment.config
@@ -0,0 +1,3 @@
+CONFIG_USE_BOOTARGS=y
+CONFIG_BOOTARGS="root=/dev/mmcblk0p3 rootwait uio_pdrv_genirq.of_id=generic-uio"
+CONFIG_MPFS_PRIORITISE_QSPI_BOOT=n
diff --git a/configs/beaglev_fire_defconfig b/configs/beaglev_fire_defconfig
new file mode 100644
index 0000000000..277c8329fd
--- /dev/null
+++ b/configs/beaglev_fire_defconfig
@@ -0,0 +1,32 @@
+BR2_riscv=y
+BR2_RISCV_ISA_RVC=y
+BR2_KERNEL_HEADERS_VERSION=y
+BR2_DEFAULT_KERNEL_VERSION="6.1.30"
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
+BR2_SYSTEM_DHCP="eth0"
+BR2_ROOTFS_OVERLAY="board/beaglev_fire/rootfs-overlay/"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/beaglev_fire/post-image.sh"
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
+BR2_TARGET_UBOOT_CONFIG_FRAGMENT_FILES="board/beaglev_fire/uboot-fragment.config"
+BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_MICROCHIP_HSS_PAYLOAD_GENERATOR=y
+BR2_PACKAGE_HOST_MTOOLS=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SUPPORT=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT_SOURCE="board/beaglev_fire/boot.cmd"
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
