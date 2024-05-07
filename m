Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D290BC10F1A
	for <buildroot@archiver.kernel.org>; Tue,  7 May 2024 14:40:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6BB30821B4;
	Tue,  7 May 2024 14:40:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2kN2TiP5UjxU; Tue,  7 May 2024 14:40:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9F42E821B5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9F42E821B5;
	Tue,  7 May 2024 14:40:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0D38F1BF290
 for <buildroot@lists.busybox.net>; Tue,  7 May 2024 14:40:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EDD214090F
 for <buildroot@lists.busybox.net>; Tue,  7 May 2024 14:40:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yavrD4hZgZ0U for <buildroot@lists.busybox.net>;
 Tue,  7 May 2024 14:40:23 +0000 (UTC)
X-Greylist: delayed 428 seconds by postgrey-1.37 at util1.osuosl.org;
 Tue, 07 May 2024 14:40:23 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 9C80C408A8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9C80C408A8
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=68.232.153.233;
 helo=esa.microchip.iphmx.com;
 envelope-from=prvs=8508e6beb=jamie.gibbons@microchip.com; receiver=<UNKNOWN> 
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.153.233])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9C80C408A8
 for <buildroot@buildroot.org>; Tue,  7 May 2024 14:40:23 +0000 (UTC)
X-CSE-ConnectionGUID: U8TyX3p0Rj+nbHm3lFiNng==
X-CSE-MsgGUID: 9ICJPCK/QduEc6bHMZqZdA==
X-IronPort-AV: E=Sophos;i="6.08,142,1712646000"; d="scan'208";a="23987795"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 07 May 2024 07:33:16 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 7 May 2024 07:33:03 -0700
Received: from jamie-dev.microchip.com (10.10.85.11) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Tue, 7 May 2024 07:33:02 -0700
To: <buildroot@buildroot.org>
Date: Tue, 7 May 2024 15:34:09 +0100
Message-ID: <20240507143409.230685-1-jamie.gibbons@microchip.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1715092823; x=1746628823;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=gqNN4KlP1Iw/V3f6trNIl1dj40OCbJVYDICyzUqUzMs=;
 b=q9yaLXDTTSyPeM8M5a5JcBUa/KJFDdVO3/fn9MoT9wQ8J/wOvLkUkuee
 MKFiPO/zp0WYnc0ur+Mx8OjTECNkOwg/2YWnNkmCMfP8KsBMGLd+wTEmN
 J8t/8FPZWgfSlq+AiViRlKzp1o/HlGnBhOR1XcIX9htz2MprrR+yITD2O
 JS032L8emony+9jFirpasArTc7wy3awjm/6Z0KxJQMj8cAaZ0OPu8ow9y
 y4ism4D5L8Q1AINgZLicWhWMZOLrFDy6QZknoscvtFoFVSBW4wyvP7ezE
 YKgjQMvt3cakskXYSiIcBe6c5QtKiVOdF+vISgNVs1mlnI53C3spgLnAq
 A==;
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=microchip.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=microchip.com header.i=@microchip.com
 header.a=rsa-sha256 header.s=mchp header.b=q9yaLXDT
Subject: [Buildroot] [PATCH 1/1] configs/beaglev_fire: add support for
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

The rootfs-overlay contains scripts for updating the BeagleV-Fire
gateware.

The README.txt documents how to build and boot the Beagle-V Fire with
this configuration. It also explains how to program a custom bitstream.

Signed-off-by: Jamie Gibbons <jamie.gibbons@microchip.com>
Reviewed-by: Valentina Fernandez <valentina.fernandezalanis@microchip.com>
---
 DEVELOPERS                                    |  2 +
 board/beaglev_fire/README.txt                 | 90 +++++++++++++++++++
 board/beaglev_fire/beaglev_fire.its           | 56 ++++++++++++
 board/beaglev_fire/config.yaml                | 28 ++++++
 board/beaglev_fire/genimage.cfg               | 36 ++++++++
 board/beaglev_fire/post-image.sh              | 14 +++
 board/beaglev_fire/rootfs-overlay/etc/motd    |  5 ++
 .../beagleboard/gateware/change-gateware.sh   | 25 ++++++
 .../usr/share/microchip/update-gateware.sh    | 36 ++++++++
 board/beaglev_fire/uboot-env.txt              | 16 ++++
 board/beaglev_fire/uboot-fragment.config      |  1 +
 configs/beaglev_fire_defconfig                | 40 +++++++++
 12 files changed, 349 insertions(+)
 create mode 100644 board/beaglev_fire/README.txt
 create mode 100644 board/beaglev_fire/beaglev_fire.its
 create mode 100644 board/beaglev_fire/config.yaml
 create mode 100644 board/beaglev_fire/genimage.cfg
 create mode 100755 board/beaglev_fire/post-image.sh
 create mode 100644 board/beaglev_fire/rootfs-overlay/etc/motd
 create mode 100644 board/beaglev_fire/rootfs-overlay/usr/share/beagleboard/gateware/change-gateware.sh
 create mode 100644 board/beaglev_fire/rootfs-overlay/usr/share/microchip/update-gateware.sh
 create mode 100644 board/beaglev_fire/uboot-env.txt
 create mode 100644 board/beaglev_fire/uboot-fragment.config
 create mode 100644 configs/beaglev_fire_defconfig

diff --git a/DEVELOPERS b/DEVELOPERS
index 77971e03db..a99420c0bd 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1484,7 +1484,9 @@ F:	package/swaybg/
 F:	package/yad/
 
 N:	Jamie Gibbons <jamie.gibbons@microchip.com>
+F:	board/beaglev_fire/
 F:	board/microchip/mpfs_icicle/
+F:	configs/beaglev_fire_defconfig
 F:	configs/microchip_mpfs_icicle_defconfig
 F:	package/microchip-hss-payload-generator/
 
diff --git a/board/beaglev_fire/README.txt b/board/beaglev_fire/README.txt
new file mode 100644
index 0000000000..ae6660f7ab
--- /dev/null
+++ b/board/beaglev_fire/README.txt
@@ -0,0 +1,90 @@
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
+    +-- beaglev_fire.itb
+    +-- beaglev_fire.its
+    +-- mpfs-beaglev-fire.dtb
+    +-- payload.bin
+    +-- rootfs.cpio
+    +-- rootfs.cpio.gz
+    +-- sdcard.img
+    +-- u-boot.bin
+
+
+Flashing the image to your eMMC
+===============================
+
+By default Buildroot builds a compatible image for you. The first partition
+of this image contains a U-Boot binary, embedded in a Hart Software
+Services (HSS) payload. The second partition contains a FAT filesystem
+with a U-Boot env and an ITB file containing the kernel and the device
+tree. The third partition contains the file system. This image can be
+written directly to the eMMC. All you need to do is dd the image to the eMMC,
+which can be done with the following command on your development host:
+
+  '$ sudo dd if=output/images/sdcard.img of=/dev/sdb bs=1M'
+
+
+Customize BeagleV-Fire Cape Gateware Using Verilog
+==================================================
+
+To customize your Beagle-V Fire gateware please follow the guide below to
+create your custom bitstream (steps 1 - 6):
+https://docs.beagleboard.org/latest/boards/beaglev/fire/demos-and-tutorials/gateware/customize-cape-gateware-verilog.html
+
+
+Program BeagleV-Fire With Your Custom Bitstream with Buildroot
+==============================================================
+
+Unzip the downloaded artifacts.zip file. 
+
+Go to the custom FPGA design directory:
+  'cd artifacts/bitstreams/my_custom_fpga_design'
+
+On your Linux host development computer, copy the bitstream to BeagleV-Fire
+board, replacing </path/to/your/> with the path to your BeagleV-Fire root file
+system.
+  'cp -r ./LinuxProgramming /path/to/your/buildroot/board/beaglev_fire/rootfs-overlay/etc/'
+
+On BeagleV-Fire,
+  1. Make your change gateware script executable
+    'chmod +x /usr/share/beagleboard/gateware/change-gateware.sh'
+  2. Create a firmware directory
+    'mkdir /lib/firmware'
+  3. initiate the reprogramming of the FPGA with your gateware bitstream:
+    '/usr/share/beagleboard/gateware/change-gateware.sh /etc/LinuxProgramming/'
+
+Wait for a couple of minutes for the BeagleV-Fire to reprogram itself.
\ No newline at end of file
diff --git a/board/beaglev_fire/beaglev_fire.its b/board/beaglev_fire/beaglev_fire.its
new file mode 100644
index 0000000000..b1591c5342
--- /dev/null
+++ b/board/beaglev_fire/beaglev_fire.its
@@ -0,0 +1,56 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Flattened Image Tree file for BVF
+ *
+ * Copyright (C) 2022 Microchip Technology Inc. and its subsidiaries.
+ * Author: Conor Dooley <conor.dooley@microchip.com>
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
index 0000000000..1ff2da68ff
--- /dev/null
+++ b/board/beaglev_fire/genimage.cfg
@@ -0,0 +1,36 @@
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
+		gpt = true
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
+		partition-type-uuid = 0FC63DAF-8483-4772-8E79-3D69D8477DE4
+		image = "rootfs.cpio"
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
diff --git a/board/beaglev_fire/rootfs-overlay/etc/motd b/board/beaglev_fire/rootfs-overlay/etc/motd
new file mode 100644
index 0000000000..6c01ba7f96
--- /dev/null
+++ b/board/beaglev_fire/rootfs-overlay/etc/motd
@@ -0,0 +1,5 @@
+
+This is version v2024.02 of PolarFire SoC Buildroot External.
+ 
+Updated images and documentation are available at:
+https://github.com/polarfire-soc/
diff --git a/board/beaglev_fire/rootfs-overlay/usr/share/beagleboard/gateware/change-gateware.sh b/board/beaglev_fire/rootfs-overlay/usr/share/beagleboard/gateware/change-gateware.sh
new file mode 100644
index 0000000000..0a35b6178b
--- /dev/null
+++ b/board/beaglev_fire/rootfs-overlay/usr/share/beagleboard/gateware/change-gateware.sh
@@ -0,0 +1,25 @@
+#!/bin/bash
+
+if [ -d "$1" ]
+then
+    echo "Changing gateware."
+    if [ -e "$1"/mpfs_bitstream.spi ]
+    then
+        if [ -e "$1"/mpfs_dtbo.spi ]
+        then
+            if ! [ -d /lib/firmware ]
+            then
+                mkdir /lib/firmware
+            fi
+            cp "$1"/mpfs_dtbo.spi /lib/firmware/mpfs_dtbo.spi
+            cp "$1"/mpfs_bitstream.spi /lib/firmware/mpfs_bitstream.spi
+            . /usr/share/microchip/update-gateware.sh
+        else
+            echo "No device tree overlay file found."
+        fi
+    else
+        echo "No gateware file found."
+    fi
+else
+    echo "No directory found for this requested gateware."
+fi
diff --git a/board/beaglev_fire/rootfs-overlay/usr/share/microchip/update-gateware.sh b/board/beaglev_fire/rootfs-overlay/usr/share/microchip/update-gateware.sh
new file mode 100644
index 0000000000..2e91c0f4f9
--- /dev/null
+++ b/board/beaglev_fire/rootfs-overlay/usr/share/microchip/update-gateware.sh
@@ -0,0 +1,36 @@
+#!/bin/bash
+echo "================================================================================"
+echo "|                            FPGA Gateware Update                              |"
+echo "|                                                                              |"
+echo "|   Please ensure that the mpfs_bitstream.spi file containing the gateware     |"
+echo "|   update has been copied to directory /lib/firmware.                         |"
+echo "|                                                                              |"
+echo "|                 !!! This will take a couple of minutes. !!!                  |"
+echo "|                                                                              |"
+echo "|               Give the system a few minutes to reboot itself                 |"
+echo "|                        after Linux has shutdown.                             |"
+echo "|                                                                              |"
+echo "================================================================================"
+
+read -rsp $'Press any key to continue...\n' -n1 key
+
+mount -t debugfs none /sys/kernel/debug
+
+# Trash exisitng device tree overlay in case the rest of the process fails:
+mtd_debug erase /dev/mtd0 0x0 0x10000
+
+# Write device tree overlay
+dtbo_ls=$(ls -l /lib/firmware/mpfs_dtbo.spi)
+dtbo_size=$(echo "$dtbo_ls" | cut -d " "  -f 5)
+
+mtd_debug write /dev/mtd0 0x400 "$dtbo_size" /lib/firmware/mpfs_dtbo.spi > /dev/zero
+
+# Fake the presence of a golden image for now.
+mtd_debug write /dev/mtd0 0 4 /dev/zero > /dev/zero
+
+# Initiate FPGA update.
+echo 1 > /sys/kernel/debug/fpga/microchip_exec_update
+
+# Reboot Linux for the gateware update to take effect.
+# FPGA reprogramming takes places between Linux shut-down and HSS restarting the board.
+reboot
diff --git a/board/beaglev_fire/uboot-env.txt b/board/beaglev_fire/uboot-env.txt
new file mode 100644
index 0000000000..1b996ed76b
--- /dev/null
+++ b/board/beaglev_fire/uboot-env.txt
@@ -0,0 +1,16 @@
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
+fdt set /soc/ethernet@20112000 mac-address ${beaglevfire_mac_addr0};
+fdt set /soc/ethernet@20110000 mac-address ${beaglevfire_mac_addr1};
+bootm go;
diff --git a/board/beaglev_fire/uboot-fragment.config b/board/beaglev_fire/uboot-fragment.config
new file mode 100644
index 0000000000..861593bd7e
--- /dev/null
+++ b/board/beaglev_fire/uboot-fragment.config
@@ -0,0 +1 @@
+CONFIG_MPFS_PRIORITISE_QSPI_BOOT=n
diff --git a/configs/beaglev_fire_defconfig b/configs/beaglev_fire_defconfig
new file mode 100644
index 0000000000..3779658509
--- /dev/null
+++ b/configs/beaglev_fire_defconfig
@@ -0,0 +1,40 @@
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
+BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y
+BR2_PACKAGE_MTD=y
+BR2_PACKAGE_DTC=y
+BR2_PACKAGE_DTC_PROGRAMS=y
+BR2_PACKAGE_BASH=y
+BR2_TARGET_ROOTFS_CPIO_GZIP=y
+BR2_TARGET_ROOTFS_INITRAMFS=y
+# BR2_TARGET_ROOTFS_TAR is not set
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,polarfire-soc,u-boot)linux4microchip+fpga-2024.02.tar.gz"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="beaglev_fire"
+BR2_TARGET_UBOOT_CONFIG_FRAGMENT_FILES="board/beaglev_fire/uboot-fragment.config"
+BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
+BR2_PACKAGE_HOST_GENEXT2FS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_GPTFDISK=y
+BR2_PACKAGE_HOST_MICROCHIP_HSS_PAYLOAD_GENERATOR=y
+BR2_PACKAGE_HOST_MTOOLS=y
+BR2_PACKAGE_HOST_SQUASHFS=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SUPPORT=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT_SOURCE="board/beaglev_fire/uboot-env.txt"
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
