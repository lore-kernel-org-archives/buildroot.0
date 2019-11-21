From: Changming Huang <jerry.huang@nxp.com>
Date: Thu, 21 Nov 2019 18:23:24 +0800
Subject: [Buildroot] [PATCH v2 10/10] configs/freescale_ls1028ardb*: new
 board
In-Reply-To: <20191121102324.35225-1-jerry.huang@nxp.com>
References: <20191121102324.35225-1-jerry.huang@nxp.com>
Message-ID: <20191121102324.35225-11-jerry.huang@nxp.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This is to support Freescale/NXP LS1028ARDB in Buildroot.
The board is setup to track the Linux at 4.19 via NXP LSDK-19.09.

The target will build uboot and RCW binary with arm-trusted-firmware support.

board/freescale/ls1028ardb/: scripts related with ls1028ardb
freescale_ls1028ardb-emmc_defconfig: defconfig boot from emmc chip on board
freescale_ls1028ardb-sd_defconfig: defconfig boot from SD card
freescale_ls1028ardb-xspi_defconfig: defconfig boot from FlexSPI chip on board

Signed-off-by: Changming Huang <jerry.huang@nxp.com>
---
changes since v1:
1. add new option in configs/freescale_ls1028ardb-xxxx_defconfig
---
 .gitlab-ci.yml                                |   3 +
 DEVELOPERS                                    |   2 +
 .../ls1028ardb/genimage.emmc.cfg.template     |  52 +++++++
 .../ls1028ardb/genimage.sd.cfg.template       |  52 +++++++
 .../ls1028ardb/genimage.xspi.cfg.template     |  53 +++++++
 board/freescale/ls1028ardb/kernel.its         |  59 ++++++++
 .../ls1028ardb/ls1028-10-network.rules        |  16 +++
 board/freescale/ls1028ardb/post-cfg-udev.sh   |  10 ++
 board/freescale/ls1028ardb/readme.txt         |  61 ++++++++
 .../ls1028ardb/u-boot-environment-emmc.txt    |  22 +++
 .../ls1028ardb/u-boot-environment-sd.txt      |  21 +++
 .../ls1028ardb/u-boot-environment-xspi.txt    |  22 +++
 configs/freescale_ls1028ardb-emmc_defconfig   | 136 ++++++++++++++++++
 configs/freescale_ls1028ardb-sd_defconfig     | 135 +++++++++++++++++
 configs/freescale_ls1028ardb-xspi_defconfig   | 129 +++++++++++++++++
 15 files changed, 773 insertions(+)
 create mode 100644 board/freescale/ls1028ardb/genimage.emmc.cfg.template
 create mode 100644 board/freescale/ls1028ardb/genimage.sd.cfg.template
 create mode 100644 board/freescale/ls1028ardb/genimage.xspi.cfg.template
 create mode 100644 board/freescale/ls1028ardb/kernel.its
 create mode 100644 board/freescale/ls1028ardb/ls1028-10-network.rules
 create mode 100755 board/freescale/ls1028ardb/post-cfg-udev.sh
 create mode 100644 board/freescale/ls1028ardb/readme.txt
 create mode 100644 board/freescale/ls1028ardb/u-boot-environment-emmc.txt
 create mode 100644 board/freescale/ls1028ardb/u-boot-environment-sd.txt
 create mode 100644 board/freescale/ls1028ardb/u-boot-environment-xspi.txt
 create mode 100644 configs/freescale_ls1028ardb-emmc_defconfig
 create mode 100644 configs/freescale_ls1028ardb-sd_defconfig
 create mode 100644 configs/freescale_ls1028ardb-xspi_defconfig

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 1d71257a20..b1ac4b9d28 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -183,6 +183,9 @@ freescale_imx8qxpmek_defconfig: { extends: .defconfig }
 freescale_p1025twr_defconfig: { extends: .defconfig }
 freescale_t1040d4rdb_defconfig: { extends: .defconfig }
 freescale_t2080_qds_rdb_defconfig: { extends: .defconfig }
+freescale_ls1028ardb-emmc_defconfig: { extends: .defconfig }
+freescale_ls1028ardb-sd_defconfig: { extends: .defconfig }
+freescale_ls1028ardb-xspi_defconfig: { extends: .defconfig }
 friendlyarm_nanopi_a64_defconfig: { extends: .defconfig }
 friendlyarm_nanopi_neo2_defconfig: { extends: .defconfig }
 friendlyarm_nanopi_neo_plus2_defconfig: { extends: .defconfig }
diff --git a/DEVELOPERS b/DEVELOPERS
index 42411b51cf..6ed1ee5379 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2549,3 +2549,5 @@ F:	package/tinc/
 N:	Changming Huang <jerry.huang@nxp.com>
 F:	package/freescale-qoriq/fsl-qoriq-cadence-dp-fw/
 F:	board/freescale/common/ls/
+F:	board/freescale/ls1028ardb/
+F:	configs/freescale_ls1028ardb*
diff --git a/board/freescale/ls1028ardb/genimage.emmc.cfg.template b/board/freescale/ls1028ardb/genimage.emmc.cfg.template
new file mode 100644
index 0000000000..b5f00147f4
--- /dev/null
+++ b/board/freescale/ls1028ardb/genimage.emmc.cfg.template
@@ -0,0 +1,52 @@
+# Minimal eMMC boot image for the NXP boards Template
+#
+# We mimic the .sdcard NXP's image format:
+# * the SD card must have 4 kB free space at the beginning,
+# * U-Boot is dumped as is,
+# * a FAT partition at offset 64 MB is containing Image and DTB files
+# * a single root filesystem partition is required (ext2, ext3 or ext4)
+#
+
+image boot.vfat {
+  vfat {
+    files = {
+      %FILES%
+    }
+  }
+  size = 256M
+}
+
+image sdcard.img {
+  hdimage {
+  }
+
+  partition rcw {
+    in-partition-table = "no"
+    image = "bl2_emmc.pbl"
+    offset = 4096
+  }
+
+  partition u-boot {
+    in-partition-table = "no"
+    image = "fip.bin"
+    offset = 1M
+  }
+
+  partition u-boot-environment {
+    in-partition-table = "no"
+    image = "uboot-env.bin"
+    offset = 5M
+  }
+
+  partition boot {
+    partition-type = 0xC
+    bootable = "true"
+    image = "boot.vfat"
+    offset = 64M
+  }
+
+  partition rootfs {
+    partition-type = 0x83
+    image = "rootfs.ext2"
+  }
+}
diff --git a/board/freescale/ls1028ardb/genimage.sd.cfg.template b/board/freescale/ls1028ardb/genimage.sd.cfg.template
new file mode 100644
index 0000000000..97903fcd13
--- /dev/null
+++ b/board/freescale/ls1028ardb/genimage.sd.cfg.template
@@ -0,0 +1,52 @@
+# Minimal SD card image for the NXP boards Template
+#
+# We mimic the .sdcard NXP's image format:
+# * the SD card must have 4 kB free space at the beginning,
+# * U-Boot is dumped as is,
+# * a FAT partition at offset 64 MB is containing Image and DTB files
+# * a single root filesystem partition is required (ext2, ext3 or ext4)
+#
+
+image boot.vfat {
+  vfat {
+    files = {
+      %FILES%
+    }
+  }
+  size = 256M
+}
+
+image sdcard.img {
+  hdimage {
+  }
+
+  partition rcw {
+    in-partition-table = "no"
+    image = "bl2_sd.pbl"
+    offset = 4096
+  }
+
+  partition u-boot {
+    in-partition-table = "no"
+    image = "fip.bin"
+    offset = 1M
+  }
+
+  partition u-boot-environment {
+    in-partition-table = "no"
+    image = "uboot-env.bin"
+    offset = 5M
+  }
+
+  partition boot {
+    partition-type = 0xC
+    bootable = "true"
+    image = "boot.vfat"
+    offset = 64M
+  }
+
+  partition rootfs {
+    partition-type = 0x83
+    image = "rootfs.ext2"
+  }
+}
diff --git a/board/freescale/ls1028ardb/genimage.xspi.cfg.template b/board/freescale/ls1028ardb/genimage.xspi.cfg.template
new file mode 100644
index 0000000000..14d75a17f3
--- /dev/null
+++ b/board/freescale/ls1028ardb/genimage.xspi.cfg.template
@@ -0,0 +1,53 @@
+# Minimal QSPI image for the NXP boards Template
+#
+# We mimic the .sdcard NXP's image format:
+# * the SD card must have 4 kB free space at the beginning,
+# * U-Boot is dumped as is,
+# * a single root filesystem partition is required (ext2, ext3 or ext4)
+#
+flash xspi-256M-128K {
+        pebsize = 128K
+        numpebs = 2048
+        minimum-io-unit-size = 128k
+}
+
+image xspi.cpio.img {
+  flash {
+  }
+  flashtype = "xspi-256M-128K"
+
+  partition rcw {
+    in-partition-table = "no"
+    image = "bl2_flexspi_nor.pbl"
+    offset = 0
+    size = 1M
+  }
+
+  partition u-boot {
+    in-partition-table = "no"
+    image = "fip.bin"
+    offset = 1M
+    size = 4M
+  }
+
+  partition u-boot-environment {
+    in-partition-table = "no"
+    image = "uboot-env.bin"
+    offset = 5M
+    size = 1M
+  }
+
+  partition dp-firmware {
+    in-partition-table = "no"
+    image = "ls1028a-dp-fw.bin"
+    offset = 0x940000
+    size = 256K
+  }
+
+  partition boot {
+    in-partition-table = "no"
+    image = "kernel.itb"
+    offset = 16M
+    size = 48M
+  }
+}
diff --git a/board/freescale/ls1028ardb/kernel.its b/board/freescale/ls1028ardb/kernel.its
new file mode 100644
index 0000000000..08e9700f30
--- /dev/null
+++ b/board/freescale/ls1028ardb/kernel.its
@@ -0,0 +1,59 @@
+/*
+ * Copyright 2019 NXP
+ *
+ * Changming Huang <jerry.huang@nxp.com>
+ *
+ * SPDX-License-Identifier: GPL-2.0+
+ */
+
+/dts-v1/;
+
+/ {
+	description = "Image file for the LS1028A Linux Kernel";
+	#address-cells = <1>;
+
+	images {
+		kernel at 1 {
+			description = "ARM64 Linux kernel";
+			data = /incbin/("./Image.gz");
+			type = "kernel";
+			arch = "arm64";
+			os = "linux";
+			compression = "gzip";
+			load = <0x80080000>;
+			entry = <0x80080000>;
+		};
+		fdt at 1 {
+			description = "Flattened Device Tree blob";
+			data = /incbin/("./fsl-ls1028a-rdb.dtb");
+			type = "flat_dt";
+			arch = "arm64";
+			compression = "none";
+			load = <0x90000000>;
+		};
+		ramdisk at 1 {
+			description = "LS1028 Ramdisk";
+                        data = /incbin/("./rootfs.cpio.gz");
+			type = "ramdisk";
+			arch = "arm64";
+			os = "linux";
+			compression = "gzip";
+		};
+	};
+
+	configurations {
+		default = "config at 1";
+		config at 1 {
+			description = "Boot Linux kernel";
+			kernel = "kernel at 1";
+			fdt = "fdt at 1";
+			ramdisk = "ramdisk at 1";
+		};
+		ls1028ardb {
+			description = "Boot Linux kernel";
+			kernel = "kernel at 1";
+			fdt = "fdt at 1";
+			ramdisk = "ramdisk at 1";
+		};
+	};
+};
diff --git a/board/freescale/ls1028ardb/ls1028-10-network.rules b/board/freescale/ls1028ardb/ls1028-10-network.rules
new file mode 100644
index 0000000000..19f41634bd
--- /dev/null
+++ b/board/freescale/ls1028ardb/ls1028-10-network.rules
@@ -0,0 +1,16 @@
+# ENETC rules
+ACTION=="add", SUBSYSTEM=="net", KERNELS=="0000:00:00.0", DRIVERS=="fsl_enetc", NAME:="eno0"
+ACTION=="add", SUBSYSTEM=="net", KERNELS=="0000:00:00.1", DRIVERS=="fsl_enetc", NAME:="eno1"
+ACTION=="add", SUBSYSTEM=="net", KERNELS=="0000:00:00.2", DRIVERS=="fsl_enetc", NAME:="eno2"
+ACTION=="add", SUBSYSTEM=="net", KERNELS=="0000:00:00.6", DRIVERS=="fsl_enetc", NAME:="eno3"
+ACTION=="add", SUBSYSTEM=="net", KERNELS=="0000:00:01.0", DRIVERS=="fsl_enetc_vf", NAME:="eno0vf0"
+ACTION=="add", SUBSYSTEM=="net", KERNELS=="0000:00:01.1", DRIVERS=="fsl_enetc_vf", NAME:="eno0vf1"
+ACTION=="add", SUBSYSTEM=="net", KERNELS=="0000:00:01.2", DRIVERS=="fsl_enetc_vf", NAME:="eno1vf0"
+ACTION=="add", SUBSYSTEM=="net", KERNELS=="0000:00:01.3", DRIVERS=="fsl_enetc_vf", NAME:="eno1vf1"
+# LS1028 switch rules
+ACTION=="add", SUBSYSTEM=="net", KERNELS=="0000:00:00.5", DRIVERS=="mscc_felix", ATTR{phys_port_name}=="p0", NAME="swp0"
+ACTION=="add", SUBSYSTEM=="net", KERNELS=="0000:00:00.5", DRIVERS=="mscc_felix", ATTR{phys_port_name}=="p1", NAME="swp1"
+ACTION=="add", SUBSYSTEM=="net", KERNELS=="0000:00:00.5", DRIVERS=="mscc_felix", ATTR{phys_port_name}=="p2", NAME="swp2"
+ACTION=="add", SUBSYSTEM=="net", KERNELS=="0000:00:00.5", DRIVERS=="mscc_felix", ATTR{phys_port_name}=="p3", NAME="swp3"
+ACTION=="add", SUBSYSTEM=="net", KERNELS=="0000:00:00.5", DRIVERS=="mscc_felix", ATTR{phys_port_name}=="p4", NAME="swp4"
+ACTION=="add", SUBSYSTEM=="net", KERNELS=="0000:00:00.5", DRIVERS=="mscc_felix", ATTR{phys_port_name}=="p5", NAME="swp5"
diff --git a/board/freescale/ls1028ardb/post-cfg-udev.sh b/board/freescale/ls1028ardb/post-cfg-udev.sh
new file mode 100755
index 0000000000..76a71b3916
--- /dev/null
+++ b/board/freescale/ls1028ardb/post-cfg-udev.sh
@@ -0,0 +1,10 @@
+#!/usr/bin/env bash
+
+main()
+{
+	cp board/freescale/ls1028ardb/ls1028-10-network.rules ${TARGET_DIR}/etc/udev/rules.d/10-network.rules
+
+	exit $?
+}
+
+main $@
diff --git a/board/freescale/ls1028ardb/readme.txt b/board/freescale/ls1028ardb/readme.txt
new file mode 100644
index 0000000000..713babd7c3
--- /dev/null
+++ b/board/freescale/ls1028ardb/readme.txt
@@ -0,0 +1,61 @@
+LS1028ARDB board is one platform based on LS1028A silicon for industry,
+which is supported in LSDK-19.09.
+
+One simple image file is created by buildroot, which includes RCW, uboot,
+Linux kernel, rootfs and other necessary binaries for this board.
+
+To program the image file created by buildroot into the flash.
+There are two way to do it:
+
+1. Program the image file on PC machine for SD card boot
+  $ sudo dd if=./output/images/sdcard.img of=/dev/sdx
+  # or in some other host machine:
+  $ sudo dd if=./output/images/sdcard.img of=/dev/mmcblkx
+
+  # find the right SD Card device name in your host machine and replace the
+  # ?sdx? or ?mmcblkx?.
+
+2. Program the image file on board for eMMC and XSPI boot
+Make sure your board has ipaddr, netmask, and serverip defined to reach your
+tftp server.
+
+  2.1 Program eMMC boot image file to eMMC chip
+    # Make sure output/images/sdcard.img is stored to tftp server
+    # Below command is one example
+    => tftpboot 0xa0000000 sdcard.img
+    => mmc dev 1
+    => mmc erase 0 0x200000
+    => mmc write 0xa0000000 0 0x200000
+
+    # The size "0x200000" will be changed when the image size is different.
+
+  2.2 Program XSPI boot image file to flash
+    # Make sure output/images/xspi.cpio.img is stored to tftp server
+    # Below command is one example
+    => tftpboot 0xa0000000 xspi.cpio.img
+    => sf probe
+    => sf erase 0 $filesize
+    => sf write 0xa0000000 0 $filesize
+
+3. Booting your new system
+Before booting the new system, we should make sure the switch setting is right.
+below switch setting is for each booting mode:
+    +-----------+---------------------+
+    |Boot mode  | Switch setting      |
+    +---------------------------------+
+    |SD boot    | SW2[1~4] = 0b?1000  |
+    +---------------------------------+
+    |eMMC boot  | SW2[1~4] = 0b?1001  |
+    +---------------------------------+
+    |XSPI boot  | SW2[1~4] = 0b?1111  |
+    +-----------+---------------------+
+
+or we use following command to reset the board in uboot prompt:
+  # boot from SD card
+  => qixis_reset sd
+
+  # boot from eMMC chip
+  => qixis_reset emmc
+
+  # boot from XSPI
+  => qixis_reset qspi
diff --git a/board/freescale/ls1028ardb/u-boot-environment-emmc.txt b/board/freescale/ls1028ardb/u-boot-environment-emmc.txt
new file mode 100644
index 0000000000..01a97aa89d
--- /dev/null
+++ b/board/freescale/ls1028ardb/u-boot-environment-emmc.txt
@@ -0,0 +1,22 @@
+baudrate=115200
+bootcmd=setenv bootargs root=/dev/mmcblk1p2 rootwait rw earlycon=uart8250,0x21c0500 console=ttyS0,115200 cma=256M video=1920x1080-32 at 60;mmc dev 1;mmcinfo;fatload mmc 1:1 ${dp_load} ${dp_file};hdp load ${dp_load} ${dp_offset};fatload mmc 1:1 ${loadaddr} ${bootfile};fatload mmc 1:1 ${fdtaddr} ${fdtfile};booti ${loadaddr} - ${fdtaddr}
+bootdelay=3
+bootfile=Image
+fdtfile=fsl-ls1028a-rdb.dtb
+eth2addr=00:1F:7B:63:35:E9
+ethact=FM1 at DTSEC3
+ethprime=FM1 at DTSEC3
+fdt_high=0xffffffffffffffff
+fdtcontroladdr=ffc01550
+fman_ucode=ffc12090
+hwconfig=fsl_ddr:bank_intlv=auto
+initrd_high=0xffffffffffffffff
+loadaddr=0xa0000000
+fdtaddr=0xb0000000
+dp_file=ls1028a-dp-fw.bin
+dp_load=0x90000000
+dp_offset=0x2000
+stderr=serial
+stdin=serial
+stdout=serial
+rollbackboot=setenv bootargs root=/dev/ram0 rootwait rw earlycon=uart8250,0x21c0500 console=ttyS0,115200;mmcinfo;fatload mmc 0:1 ${loadaddr} ${bootfile};bootm ${loadaddr}
diff --git a/board/freescale/ls1028ardb/u-boot-environment-sd.txt b/board/freescale/ls1028ardb/u-boot-environment-sd.txt
new file mode 100644
index 0000000000..820989280f
--- /dev/null
+++ b/board/freescale/ls1028ardb/u-boot-environment-sd.txt
@@ -0,0 +1,21 @@
+baudrate=115200
+bootcmd=setenv bootargs root=/dev/mmcblk0p2 rootwait rw earlycon=uart8250,0x21c0500 console=ttyS0,115200 cma=256M video=1920x1080-32 at 60;mmcinfo;fatload mmc 0:1 ${dp_load} ${dp_file}; hdp load ${dp_load} ${dp_offset};fatload mmc 0:1 ${loadaddr} ${bootfile};fatload mmc 0:1 ${fdtaddr} ${fdtfile};booti ${loadaddr} - ${fdtaddr}
+bootdelay=3
+bootfile=Image
+fdtfile=fsl-ls1028a-rdb.dtb
+eth2addr=00:1F:7B:63:35:E9
+ethact=FM1 at DTSEC3
+ethprime=FM1 at DTSEC3
+fdt_high=0xffffffffffffffff
+fdtcontroladdr=ffc01550
+fman_ucode=ffc12090
+hwconfig=fsl_ddr:bank_intlv=auto
+initrd_high=0xffffffffffffffff
+loadaddr=0xa0000000
+fdtaddr=0xb0000000
+dp_file=ls1028a-dp-fw.bin
+dp_load=0x90000000
+dp_offset=0x2000
+stderr=serial
+stdin=serial
+stdout=serial
diff --git a/board/freescale/ls1028ardb/u-boot-environment-xspi.txt b/board/freescale/ls1028ardb/u-boot-environment-xspi.txt
new file mode 100644
index 0000000000..5677cdddaa
--- /dev/null
+++ b/board/freescale/ls1028ardb/u-boot-environment-xspi.txt
@@ -0,0 +1,22 @@
+baudrate=115200
+bootcmd=setenv bootargs root=/dev/ram0 rw earlycon=uart8250,0x21c0500 console=ttyS0,115200 cma=256M video=1920x1080-32 at 60; sf probe 0:0; sf read $dp_load $dp_start $dp_size; hdp load $dp_load $dp_offset; sf read $kernel_load $kernel_start $kernel_size && bootm $kernel_load
+bootdelay=3
+eth2addr=00:1F:7B:63:35:E9
+ethact=FM1 at DTSEC3
+ethprime=FM1 at DTSEC3
+fdt_high=0xffffffffffffffff
+fdtcontroladdr=ffc01550
+fman_ucode=ffc12090
+hwconfig=fsl_ddr:bank_intlv=auto
+initrd_high=0xffffffffffffffff
+kernel_load=0xa0000000
+kernel_size=0x3000000
+kernel_start=0x1000000
+dp_load=0x90000000
+dp_start=0x940000
+dp_size=0x40000
+dp_offset=0x2000
+stderr=serial
+stdin=serial
+stdout=serial
+rollbackboot=setenv bootargs root=/dev/ram0 rootwait rw earlycon=uart8250,0x21c0500 console=ttyS0,115200;mmcinfo;fatload mmc 0:1 ${loadaddr} ${bootfile};bootm $loadaddr
diff --git a/configs/freescale_ls1028ardb-emmc_defconfig b/configs/freescale_ls1028ardb-emmc_defconfig
new file mode 100644
index 0000000000..c34db6cb0b
--- /dev/null
+++ b/configs/freescale_ls1028ardb-emmc_defconfig
@@ -0,0 +1,136 @@
+# Architecture
+BR2_aarch64=y
+BR2_cortex_a72=y
+
+# Filesystem
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_ROOTFS_EXT2_GZIP=y
+BR2_TARGET_ROOTFS_EXT2_SIZE="500M"
+
+# Hostname and issue
+BR2_TARGET_GENERIC_HOSTNAME="LS1028ARDB"
+
+# Linux headers same as kernel
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_19=y
+
+# toolchain
+BR2_TOOLCHAIN_EXTERNAL=y
+
+# bootloader
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_FORMAT_DTB_BIN=y
+BR2_TARGET_UBOOT_BOARDNAME="ls1028ardb_tfa"
+BR2_TARGET_UBOOT_CUSTOM_GIT=y
+BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://source.codeaurora.org/external/qoriq/qoriq-components/u-boot"
+BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="LSDK-19.09"
+BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_TARGET_UBOOT_FORMAT_BIN=n
+BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
+BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot-dtb.bin"
+BR2_PACKAGE_UBOOT_TOOLS_MKIMAGE=y
+BR2_TARGET_UBOOT_ENVIMAGE=y
+BR2_TARGET_UBOOT_ENVIMAGE_SOURCE="board/freescale/ls1028ardb/u-boot-environment-emmc.txt"
+BR2_TARGET_UBOOT_ENVIMAGE_SIZE="0x2000"
+
+# Kernel
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_GIT=y
+BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://source.codeaurora.org/external/qoriq/qoriq-components/linux"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="LSDK-19.09-V4.19"
+BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
+BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="$(LINUX_DIR)/arch/arm64/configs/lsdk.config"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="freescale/fsl-ls1028a-rdb"
+BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
+BR2_LINUX_KERNEL_IMAGE_TARGET_NAME="Image"
+
+# Serial port config
+BR2_TARGET_GENERIC_GETTY=y
+BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
+
+# required tools to create the microSD image
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_MTOOLS=y
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/freescale/common/ls/post-image.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="$(LINUX_DIR) $(TOPDIR) $(UBOOT_DIR)"
+
+# busybox setting
+#BR2_PACKAGE_BUSYBOX_CONFIG_FRAGMENT_FILES="board/freescale/common/ls/busybox.config"
+BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y
+
+# packages for rcw
+BR2_PACKAGE_HOST_RCW=y
+BR2_PACKAGE_HOST_RCW_ATF=y
+BR2_PACKAGE_HOST_RCW_BOOT_MODE="emmc"
+BR2_PACKAGE_HOST_RCW_BIN="ls1028ardb/R_SQPP_0x85bb/rcw_1300_emmcboot.bin"
+
+#Display port firmware
+BR2_PACKAGE_FSL_QORIQ_CADENCE_DP_FW=y
+
+# basic packages and tools
+BR2_PACKAGE_MTD=y
+BR2_PACKAGE_MTD_MTD_DEBUG=y
+BR2_PACKAGE_SYSSTAT=y
+BR2_PACKAGE_E2FSPROGS=y
+BR2_PACKAGE_RT_TESTS=y
+BR2_PACKAGE_OPENSSH=y
+BR2_PACKAGE_OPENSSL=y
+BR2_PACKAGE_WGET=y
+
+# docker packages
+BR2_PACKAGE_DOCKER_CONTAINERD=y
+BR2_PACKAGE_DOCKER_ENGINE=y
+BR2_PACKAGE_DOCKER_ENGINE_DAEMON=y
+BR2_PACKAGE_DOCKER_ENGINE_EXPERIMENTAL=y
+BR2_PACKAGE_DOCKER_ENGINE_DRIVER_BTRFS=y
+BR2_PACKAGE_DOCKER_ENGINE_DRIVER_DEVICEMAPPER=y
+BR2_PACKAGE_DOCKER_ENGINE_DRIVER_VFS=y
+BR2_PACKAGE_UTIL_LINUX_LIBMOUNT=y
+BR2_PACKAGE_CGROUPFS_MOUNT=y
+BR2_PACKAGE_LIBCGROUP=y
+
+# ca-certs packages
+BR2_PACKAGE_CA_CERTIFICATES=y
+
+# dhcpd package
+BR2_PACKAGE_DHCPCD=y
+BR2_PACKAGE_DHCP=y
+BR2_PACKAGE_DHCP_CLIENT=y
+
+# resize2fs package
+BR2_PACKAGE_E2FSPROGS_RESIZE2FS=y
+
+# Text editors
+BR2_PACKAGE_NANO=y
+
+#eudev support
+BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/freescale/ls1028ardb/post-cfg-udev.sh"
+
+BR2_PACKAGE_ETHTOOL=y
+BR2_PACKAGE_COLLECTD_CURL=y
+BR2_PACKAGE_COLLECTD_CURL_JSON=y
+BR2_PACKAGE_COLLECTD_CURL_XML=y
+BR2_PACKAGE_LIBCURL=y
+BR2_PACKAGE_CURL=y
+BR2_PACKAGE_LIBCURL_VERBOSE=y
+BR2_PACKAGE_FLICKCURL=y
+BR2_PACKAGE_FLICKCURL_UTILS=y
+BR2_PACKAGE_BASH=y
+BR2_SYSTEM_BIN_SH_BASH=y
+BR2_SYSTEM_BIN_SH="bash"
+
+BR2_PACKAGE_HAVEGED=y
+
+# Arm-Trusted-Firmware
+BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_FIP=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_UBOOT_AS_BL33=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_UBOOT_BL33_IMAGE="u-boot-dtb.bin"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_GIT=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_URL="https://source.codeaurora.org/external/qoriq/qoriq-components/atf"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_VERSION="LSDK-19.09"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="ls1028ardb"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_IMAGES="fip.bin bl2_emmc.pbl"
diff --git a/configs/freescale_ls1028ardb-sd_defconfig b/configs/freescale_ls1028ardb-sd_defconfig
new file mode 100644
index 0000000000..39e125528f
--- /dev/null
+++ b/configs/freescale_ls1028ardb-sd_defconfig
@@ -0,0 +1,135 @@
+# Architecture
+BR2_aarch64=y
+BR2_cortex_a72=y
+
+# Filesystem
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_ROOTFS_EXT2_GZIP=y
+BR2_TARGET_ROOTFS_EXT2_SIZE="500M"
+
+# Hostname and issue
+BR2_TARGET_GENERIC_HOSTNAME="LS1028ARDB"
+
+# Linux headers same as kernel
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_19=y
+
+# toolchain
+BR2_TOOLCHAIN_EXTERNAL=y
+
+# bootloader
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BOARDNAME="ls1028ardb_tfa"
+BR2_TARGET_UBOOT_CUSTOM_GIT=y
+BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://source.codeaurora.org/external/qoriq/qoriq-components/u-boot"
+BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="LSDK-19.09"
+BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_TARGET_UBOOT_FORMAT_BIN=n
+BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
+BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot-dtb.bin"
+BR2_PACKAGE_UBOOT_TOOLS_MKIMAGE=y
+BR2_TARGET_UBOOT_ENVIMAGE=y
+BR2_TARGET_UBOOT_ENVIMAGE_SOURCE="board/freescale/ls1028ardb/u-boot-environment-sd.txt"
+BR2_TARGET_UBOOT_ENVIMAGE_SIZE="0x2000"
+
+# Kernel
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_GIT=y
+BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://source.codeaurora.org/external/qoriq/qoriq-components/linux"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="LSDK-19.09-V4.19"
+BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
+BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="$(LINUX_DIR)/arch/arm64/configs/lsdk.config"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="freescale/fsl-ls1028a-rdb"
+BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
+BR2_LINUX_KERNEL_IMAGE_TARGET_NAME="Image"
+
+# Serial port config
+BR2_TARGET_GENERIC_GETTY=y
+BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
+
+# required tools to create the microSD image
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_MTOOLS=y
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/freescale/common/ls/post-image.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="$(LINUX_DIR) $(TOPDIR) $(UBOOT_DIR)"
+
+# busybox setting
+BR2_PACKAGE_BUSYBOX_CONFIG_FRAGMENT_FILES="board/freescale/common/ls/busybox.config"
+BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y
+
+# packages for rcw
+BR2_PACKAGE_HOST_RCW=y
+BR2_PACKAGE_HOST_RCW_ATF=y
+BR2_PACKAGE_HOST_RCW_BOOT_MODE="sd"
+BR2_PACKAGE_HOST_RCW_BIN="ls1028ardb/R_SQPP_0x85bb/rcw_1300_sdboot.bin"
+
+#Display port firmware
+BR2_PACKAGE_FSL_QORIQ_CADENCE_DP_FW=y
+
+# basic packages and tools
+BR2_PACKAGE_MTD=y
+BR2_PACKAGE_MTD_MTD_DEBUG=y
+BR2_PACKAGE_SYSSTAT=y
+BR2_PACKAGE_E2FSPROGS=y
+BR2_PACKAGE_RT_TESTS=y
+BR2_PACKAGE_OPENSSH=y
+BR2_PACKAGE_OPENSSL=y
+BR2_PACKAGE_WGET=y
+
+# docker packages
+BR2_PACKAGE_DOCKER_CONTAINERD=y
+BR2_PACKAGE_DOCKER_ENGINE=y
+#BR2_PACKAGE_DOCKER_ENGINE_DAEMON=y
+BR2_PACKAGE_DOCKER_ENGINE_EXPERIMENTAL=y
+BR2_PACKAGE_DOCKER_ENGINE_DRIVER_BTRFS=y
+BR2_PACKAGE_DOCKER_ENGINE_DRIVER_DEVICEMAPPER=y
+BR2_PACKAGE_DOCKER_ENGINE_DRIVER_VFS=y
+BR2_PACKAGE_UTIL_LINUX_LIBMOUNT=y
+BR2_PACKAGE_CGROUPFS_MOUNT=y
+BR2_PACKAGE_LIBCGROUP=y
+
+# ca-certs packages
+BR2_PACKAGE_CA_CERTIFICATES=y
+
+# dhcpd package
+BR2_PACKAGE_DHCPCD=y
+BR2_PACKAGE_DHCP=y
+BR2_PACKAGE_DHCP_CLIENT=y
+
+# resize2fs package
+BR2_PACKAGE_E2FSPROGS_RESIZE2FS=y
+
+# Text editors
+BR2_PACKAGE_NANO=y
+
+#eudev support
+BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/freescale/ls1028ardb/post-cfg-udev.sh"
+
+BR2_PACKAGE_ETHTOOL=y
+BR2_PACKAGE_COLLECTD_CURL=y
+BR2_PACKAGE_COLLECTD_CURL_JSON=y
+BR2_PACKAGE_COLLECTD_CURL_XML=y
+BR2_PACKAGE_LIBCURL=y
+BR2_PACKAGE_CURL=y
+BR2_PACKAGE_LIBCURL_VERBOSE=y
+BR2_PACKAGE_FLICKCURL=y
+BR2_PACKAGE_FLICKCURL_UTILS=y
+BR2_PACKAGE_BASH=y
+BR2_SYSTEM_BIN_SH_BASH=y
+BR2_SYSTEM_BIN_SH="bash"
+
+BR2_PACKAGE_HAVEGED=y
+
+# Arm-Trusted-Firmware
+BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_FIP=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_UBOOT_AS_BL33=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_UBOOT_BL33_IMAGE="u-boot-dtb.bin"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_GIT=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_URL="https://source.codeaurora.org/external/qoriq/qoriq-components/atf"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_VERSION="LSDK-19.09"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="ls1028ardb"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_IMAGES="fip.bin bl2_sd.pbl"
diff --git a/configs/freescale_ls1028ardb-xspi_defconfig b/configs/freescale_ls1028ardb-xspi_defconfig
new file mode 100644
index 0000000000..2c5b24edee
--- /dev/null
+++ b/configs/freescale_ls1028ardb-xspi_defconfig
@@ -0,0 +1,129 @@
+# Architecture
+BR2_aarch64=y
+BR2_cortex_a72=y
+
+# Filesystem
+BR2_TARGET_ROOTFS_CPIO=y
+BR2_TARGET_ROOTFS_CPIO_GZIP=y
+BR2_TARGET_ROOTFS_CPIO_UIMAGE=y
+
+# Hostname and issue
+BR2_TARGET_GENERIC_HOSTNAME="LS1028ARDB"
+
+# Linux headers same as kernel
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_19=y
+
+# toolchain
+BR2_TOOLCHAIN_EXTERNAL=y
+
+# bootloader
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BOARDNAME="ls1028ardb_tfa"
+BR2_TARGET_UBOOT_CUSTOM_GIT=y
+BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://source.codeaurora.org/external/qoriq/qoriq-components/u-boot"
+BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="LSDK-19.09"
+BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_TARGET_UBOOT_FORMAT_BIN=n
+BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
+BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot-dtb.bin"
+BR2_TARGET_UBOOT_ENVIMAGE=y
+BR2_TARGET_UBOOT_ENVIMAGE_SOURCE="board/freescale/ls1028ardb/u-boot-environment-xspi.txt"
+BR2_TARGET_UBOOT_ENVIMAGE_SIZE="0x2000"
+
+# Kernel
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_GIT=y
+BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://source.codeaurora.org/external/qoriq/qoriq-components/linux"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="LSDK-19.09-V4.19"
+BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
+BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="$(LINUX_DIR)/arch/arm64/configs/lsdk.config"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="freescale/fsl-ls1028a-rdb"
+BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
+BR2_LINUX_KERNEL_IMAGE_TARGET_NAME="Image.gz"
+
+# Serial port config
+BR2_TARGET_GENERIC_GETTY=y
+BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
+
+# required tools to create the microSD image
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_MTOOLS=y
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/freescale/common/ls/post-image-spi.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="$(LINUX_DIR) $(TOPDIR) $(UBOOT_DIR)"
+
+# busybox setting
+BR2_PACKAGE_BUSYBOX_CONFIG_FRAGMENT_FILES="board/freescale/common/ls/busybox.config"
+BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y
+
+# packages for rcw
+BR2_PACKAGE_HOST_RCW=y
+BR2_PACKAGE_HOST_RCW_ATF=y
+BR2_PACKAGE_HOST_RCW_BOOT_MODE="flexspi_nor"
+BR2_PACKAGE_HOST_RCW_BIN="ls1028ardb/R_SQPP_0x85bb/rcw_1500_gpu600.bin"
+
+#Display port firmware
+BR2_PACKAGE_FSL_QORIQ_CADENCE_DP_FW=y
+
+# basic packages and tools
+BR2_PACKAGE_MTD=y
+BR2_PACKAGE_MTD_MTD_DEBUG=y
+BR2_PACKAGE_SYSSTAT=y
+BR2_PACKAGE_E2FSPROGS=y
+BR2_PACKAGE_RT_TESTS=y
+BR2_PACKAGE_OPENSSH=y
+BR2_PACKAGE_OPENSSL=y
+BR2_PACKAGE_WGET=y
+
+# ca-certs packages
+BR2_PACKAGE_CA_CERTIFICATES=y
+
+# curl package
+BR2_PACKAGE_CURL=y
+BR2_PACKAGE_LIBCURL=y
+
+# dhcpd package
+BR2_PACKAGE_DHCPCD=y
+BR2_PACKAGE_DHCP=y
+BR2_PACKAGE_DHCP_CLIENT=y
+
+# resize2fs package
+BR2_PACKAGE_E2FSPROGS_RESIZE2FS=y
+
+# Text editors
+BR2_PACKAGE_NANO=y
+
+#eudev support
+BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/freescale/ls1028ardb/post-cfg-udev.sh"
+
+# gzip,tar packages
+BR2_PACKAGE_GZIP=y
+BR2_PACKAGE_TAR=y
+
+# python package
+BR2_PACKAGE_PYTHON=y
+
+BR2_PACKAGE_DOSFSTOOLS_MKFS_FAT=y
+BR2_PACKAGE_FILE=y
+
+BR2_PACKAGE_ETHTOOL=y
+BR2_PACKAGE_NET_TOOLS=y
+BR2_PACKAGE_BASH=y
+BR2_SYSTEM_BIN_SH_BASH=y
+BR2_SYSTEM_BIN_SH="bash"
+
+# haveged
+BR2_PACKAGE_HAVEGED=y
+
+# Arm-Trusted-Firmware
+BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_FIP=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_UBOOT_AS_BL33=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_UBOOT_BL33_IMAGE="u-boot-dtb.bin"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_GIT=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_URL="https://source.codeaurora.org/external/qoriq/qoriq-components/atf"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_VERSION="LSDK-19.09"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="ls1028ardb"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_IMAGES="fip.bin bl2_flexspi_nor.pbl"
-- 
2.17.1
