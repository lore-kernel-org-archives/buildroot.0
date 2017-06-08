From: Oleksandr Zhadan <oleks@arcturusnetworks.com>
Date: Thu,  8 Jun 2017 16:44:00 -0400
Subject: [Buildroot] [PATCH v3 1/1] configs/arcturus_ucls1012a: new defconfig
Message-ID: <20170608204400.21287-1-oleks@arcturusnetworks.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The uCLS1012A-SOM product family (ucls1012a) is an Arcturus Networks Inc.
64bit ARM Cortex-A53 class System on Module powered by a NXP QorIQ LS1012A
Low Power Communication Processor.  This 314 pin MXM3.0/SMARC module card
contains DDR3, QSPI NOR Flash, eMMC NAND Flash, optional Audio CODEC and is
available with 1 or 2 Gig-Ethernet PHYs.

Signed-off-by: Oleksandr Zhadan <oleks@arcturusnetworks.com>
Signed-off-by: Michael Durrant <mdurrant@arcturusnetworks.com>
---

Changes v2 -> v3:
    - commit title is changed (from "Arcturus uCLS1012A-SOM support")
    - new updates in readme.txt
    - ls1012a network firmware moved into kernel
    - do not remove any intermediate files
    - fix relative patches inside ucls1012a.its

Changes v1 -> v2:
    - updated readme.txt
    - fixed post-image.sh (Do not have to remove Image and *.dtb files)
---

 board/arcturus/aarch64-ucls1012a/post-build.sh     |  5 ++
 board/arcturus/aarch64-ucls1012a/post-image.sh     |  9 +++
 board/arcturus/aarch64-ucls1012a/readme.txt        | 74 ++++++++++++++++++++++
 .../rootfs_overlay/etc/init.d/S09modload           | 14 ++++
 board/arcturus/aarch64-ucls1012a/ucls1012a.its     | 52 +++++++++++++++
 configs/arcturus_ucls1012a_defconfig               | 23 +++++++
 6 files changed, 177 insertions(+)
 create mode 100755 board/arcturus/aarch64-ucls1012a/post-build.sh
 create mode 100755 board/arcturus/aarch64-ucls1012a/post-image.sh
 create mode 100644 board/arcturus/aarch64-ucls1012a/readme.txt
 create mode 100755 board/arcturus/aarch64-ucls1012a/rootfs_overlay/etc/init.d/S09modload
 create mode 100644 board/arcturus/aarch64-ucls1012a/ucls1012a.its
 create mode 100644 configs/arcturus_ucls1012a_defconfig

diff --git a/board/arcturus/aarch64-ucls1012a/post-build.sh b/board/arcturus/aarch64-ucls1012a/post-build.sh
new file mode 100755
index 000000000..e1bfd046c
--- /dev/null
+++ b/board/arcturus/aarch64-ucls1012a/post-build.sh
@@ -0,0 +1,5 @@
+#!/bin/sh
+
+# Network Driver Firmware
+mkdir -p ${TARGET_DIR}/lib/firmware
+cp -f ${BUILD_DIR}/linux-custom/firmware/ppfe/* ${TARGET_DIR}/lib/firmware/
diff --git a/board/arcturus/aarch64-ucls1012a/post-image.sh b/board/arcturus/aarch64-ucls1012a/post-image.sh
new file mode 100755
index 000000000..d506724a3
--- /dev/null
+++ b/board/arcturus/aarch64-ucls1012a/post-image.sh
@@ -0,0 +1,9 @@
+#!/bin/sh
+
+echo ---------Making ITB partition image---------
+
+cp -f board/arcturus/aarch64-ucls1012a/ucls1012a.its ${BINARIES_DIR}/
+MKIMAGE=${HOST_DIR}/usr/bin/mkimage
+MKIMAGE_IN=${BINARIES_DIR}/ucls1012a.its
+MKIMAGE_OUT=${BINARIES_DIR}/part0-000000.itb
+${MKIMAGE} -f $MKIMAGE_IN $MKIMAGE_OUT
diff --git a/board/arcturus/aarch64-ucls1012a/readme.txt b/board/arcturus/aarch64-ucls1012a/readme.txt
new file mode 100644
index 000000000..5cf420e9d
--- /dev/null
+++ b/board/arcturus/aarch64-ucls1012a/readme.txt
@@ -0,0 +1,74 @@
+Arcturus uCLS1012A SoM
+======================
+
+This tutorial describes how to use the predefined Buildroot
+configuration for the Arcturus uCLS101A SoM platform.
+
+Additional information about the uCLS1012A System on Module can be found at
+https://www.arcturusnetworks.com/products/ucls1012a
+and product support for registered users at
+https://www.arcturusnetworks.com/support
+
+Building
+--------
+
+Return to the top directory <buildrootdir> and execute the following commands.
+
+  make arcturus_ucls1012a_defconfig
+  make
+
+Result of the build
+-------------------
+
+After building, you should obtain this tree:
+
+    output/images/
+    +-- arc-ucls1012a.dtb
+    +-- Image
+    +-- part0-000000.itb
+    +-- rootfs.cpio
+    +-- rootfs.cpio.gx
+    +-- rootfs.tar
+    +-- u-boot.bin
+    +-- ucls1012a.its
+
+Flashing
+--------
+
+You'll need to program the image created by buildroot into the SPI NOR flash.
+
+1. Reboot your module and via the serial console press <escape> to enter the B$
+u-boot shell.
+   From the shell you will need to update four environment variables replacing the
+   IPv4 IP Address with ones that will work with your network and tftp server.
+
+   B$ setenv ipaddr 192.168.1.81
+   B$ setenv serverip 192.168.1.80
+   B$ setenv gatewayip 192.168.1.1
+   B$ setenv netmask 255.255.255.0
+   B$ saveenv
+
+2. Enable tftp server to serve the <buildrootdir>/output/images/ folder.
+
+3. Program the new U-Boot binary (optional)
+    If you don't feel confident upgrading your bootloader then don't do it,
+    it's unnecessary most of the time.
+
+    B$ tftp u-boot.bin
+    B$ run program_uboot
+
+4. Program the ITB image (includes Kernel, DTB and Ramdisk)
+
+    B$ tftp part0-000000.itb
+    B$ run program0
+
+5. Booting your new system
+
+    Reboot your system by reset command
+    B$ reset
+
+        or
+
+    B$ run bootcmd
+
+Good Luck !
diff --git a/board/arcturus/aarch64-ucls1012a/rootfs_overlay/etc/init.d/S09modload b/board/arcturus/aarch64-ucls1012a/rootfs_overlay/etc/init.d/S09modload
new file mode 100755
index 000000000..07d1d855a
--- /dev/null
+++ b/board/arcturus/aarch64-ucls1012a/rootfs_overlay/etc/init.d/S09modload
@@ -0,0 +1,14 @@
+#!/bin/sh
+#
+case "$1" in
+	start)
+		modprobe pfe
+		;;
+	stop)
+		;;
+	restart|reload)
+		;;
+	*)
+		echo "Usage: $0 {start|stop|restart}"
+		exit 1
+esac
diff --git a/board/arcturus/aarch64-ucls1012a/ucls1012a.its b/board/arcturus/aarch64-ucls1012a/ucls1012a.its
new file mode 100644
index 000000000..2bac65884
--- /dev/null
+++ b/board/arcturus/aarch64-ucls1012a/ucls1012a.its
@@ -0,0 +1,52 @@
+/*
+ * Copyright (C) 2017, Arcturus Networks Inc.
+ *
+ * This file is licensed under the terms of the GNU General Public
+ * License version 2.  This program is licensed "as is" without any
+ * warranty of any kind, whether express or implied.
+ */
+
+/dts-v1/;
+
+/ {
+	description = "Image file for the Arcturus uCLS1012A Linux Kernel";
+	#address-cells = <1>;
+
+	images {
+		kernel {
+			description = "Linux kernel";
+			data = /incbin/("Image");
+			type = "kernel";
+			arch = "arm64";
+			os = "linux";
+			compression = "none";
+			load = <0x80080000>;
+			entry = <0x80080000>;
+		};
+		fdt {
+			description = "Flattened Device Tree Blob";
+			data = /incbin/("arc-ucls1012a.dtb");
+			type = "flat_dt";
+			arch = "arm64";
+			compression = "none";
+			load = <0x90000000>;
+		};
+		ramdisk {
+			description = "Ramdisk";
+                        data = /incbin/("rootfs.cpio.gz");
+			type = "ramdisk";
+			arch = "arm64";
+			os = "linux";
+			compression = "gzip";
+		};
+	};
+
+	configurations {
+		default = "config";
+		config {
+			kernel = "kernel";
+			fdt = "fdt";
+			ramdisk = "ramdisk";
+		};
+	};
+};
diff --git a/configs/arcturus_ucls1012a_defconfig b/configs/arcturus_ucls1012a_defconfig
new file mode 100644
index 000000000..64557fde7
--- /dev/null
+++ b/configs/arcturus_ucls1012a_defconfig
@@ -0,0 +1,23 @@
+BR2_aarch64=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TARGET_GENERIC_HOSTNAME="ucls1012a"
+BR2_TARGET_GENERIC_ISSUE="Welcome to uCLS1012A-SOM"
+BR2_SYSTEM_DHCP="eth0"
+BR2_ROOTFS_OVERLAY="board/arcturus/aarch64-ucls1012a/rootfs_overlay"
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/arcturus/aarch64-ucls1012a/post-build.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/arcturus/aarch64-ucls1012a/post-image.sh"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="https://www.arcturusnetworks.com/OSS/kernel-ucls1012a.tar.gz"
+BR2_LINUX_KERNEL_DEFCONFIG="ucls1012a"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="arcturus/arc-ucls1012a"
+BR2_TARGET_ROOTFS_CPIO=y
+BR2_TARGET_ROOTFS_CPIO_GZIP=y
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="https://www.arcturusnetworks.com/OSS/u-boot-ucls1012a.tar.gz"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="UCLS1012A_QSPI"
+BR2_PACKAGE_HOST_UBOOT_TOOLS=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SUPPORT=y
-- 
2.11.0
