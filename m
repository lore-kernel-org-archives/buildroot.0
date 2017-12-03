From: Sergey Matyukevich <geomatsi@gmail.com>
Date: Sun,  3 Dec 2017 21:18:18 +0300
Subject: [Buildroot] [PATCH v3 4/4] solidrun/macchiatobin: add new board
In-Reply-To: <20171203181818.10087-1-geomatsi@gmail.com>
References: <20171203181818.10087-1-geomatsi@gmail.com>
Message-ID: <20171203181818.10087-5-geomatsi@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add MacchiatoBin board by SolidRun. This board is based on Marvell
Armada 8040 SoC. Board support package includes the following
two options: mainline and vendor BSPs.

Mainline BSP:
- Marvell ATF v1.3-armada-17.10
- mainline U-Boot v2017.09
- mainline Linux kernel v4.14

Marvell BSP with more hardware support enabled:
- Marvell ATF v1.3-armada-17.10
- vendor U-Boot based on v2017.03
- Marvell Linux kernel based v4.4.52

More details about this board are available on wiki:
- http://wiki.macchiatobin.net

Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
---
 DEVELOPERS                                         |   9 +-
 board/solidrun/macchiatobin/genimage.cfg           |  16 +++
 board/solidrun/macchiatobin/linux-extras.config    |   3 +
 ...rm64-dts-marvell-extend-cp110-syscon-regs.patch |  38 +++++++
 ...m64-dts-marvell-add-comphy-nodes-on-cp110.patch | 111 +++++++++++++++++++++
 .../0003-arm64-dts-marvell-mcbin-add-comphy.patch  |  52 ++++++++++
 board/solidrun/macchiatobin/post-build.sh          |   5 +
 board/solidrun/macchiatobin/readme.txt             |  82 +++++++++++++++
 board/solidrun/macchiatobin/uEnv-example.txt       |   7 ++
 configs/solidrun_macchiatobin_mainline_defconfig   |  45 +++++++++
 configs/solidrun_macchiatobin_marvell_defconfig    |  45 +++++++++
 11 files changed, 410 insertions(+), 3 deletions(-)
 create mode 100644 board/solidrun/macchiatobin/genimage.cfg
 create mode 100644 board/solidrun/macchiatobin/linux-extras.config
 create mode 100644 board/solidrun/macchiatobin/patches/linux/0001-arm64-dts-marvell-extend-cp110-syscon-regs.patch
 create mode 100644 board/solidrun/macchiatobin/patches/linux/0002-arm64-dts-marvell-add-comphy-nodes-on-cp110.patch
 create mode 100644 board/solidrun/macchiatobin/patches/linux/0003-arm64-dts-marvell-mcbin-add-comphy.patch
 create mode 100755 board/solidrun/macchiatobin/post-build.sh
 create mode 100644 board/solidrun/macchiatobin/readme.txt
 create mode 100644 board/solidrun/macchiatobin/uEnv-example.txt
 create mode 100644 configs/solidrun_macchiatobin_mainline_defconfig
 create mode 100644 configs/solidrun_macchiatobin_marvell_defconfig

diff --git a/DEVELOPERS b/DEVELOPERS
index 87b18cc9b9..54c45d60cf 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1513,12 +1513,15 @@ F:	boot/binaries-marvell/
 F:	boot/mv-ddr-marvell/
 F:	package/armbian-firmware/
 F:	package/xr819-xradio/
-F:	board/orangepi/orangepi-zero
-F:	board/orangepi/orangepi-one
 F:	board/linksprite/pcduino
+F:	board/orangepi/orangepi-one
+F:	board/orangepi/orangepi-zero
+F:	board/solidrun/macchiatobin
+F:	configs/linksprite_pcduino_defconfig
 F:	configs/orangepi_one_defconfig
 F:	configs/orangepi_zero_defconfig
-F:	configs/linksprite_pcduino_defconfig
+F:	configs/solidrun_macchiatobin_mainline_defconfig
+F:	configs/solidrun_macchiatobin_marvell_defconfig
 
 N:	Sergio Prado <sergio.prado@e-labworks.com>
 F:	package/libgdiplus/
diff --git a/board/solidrun/macchiatobin/genimage.cfg b/board/solidrun/macchiatobin/genimage.cfg
new file mode 100644
index 0000000000..fdcda368a2
--- /dev/null
+++ b/board/solidrun/macchiatobin/genimage.cfg
@@ -0,0 +1,16 @@
+image sdcard.img {
+	hdimage {
+	}
+
+	partition uboot {
+		in-partition-table = "no"
+		image = "flash-image.bin"
+		offset = 0x200000
+	}
+
+	partition rootfs {
+		partition-type = 0x83
+		offset = 0x2200000
+		image = "rootfs.ext4"
+	}
+}
diff --git a/board/solidrun/macchiatobin/linux-extras.config b/board/solidrun/macchiatobin/linux-extras.config
new file mode 100644
index 0000000000..11267d2f80
--- /dev/null
+++ b/board/solidrun/macchiatobin/linux-extras.config
@@ -0,0 +1,3 @@
+CONFIG_MARVELL_PHY=y
+CONFIG_MARVELL_10G_PHY=y
+CONFIG_PHY_MVEBU_CP110_COMPHY=y
diff --git a/board/solidrun/macchiatobin/patches/linux/0001-arm64-dts-marvell-extend-cp110-syscon-regs.patch b/board/solidrun/macchiatobin/patches/linux/0001-arm64-dts-marvell-extend-cp110-syscon-regs.patch
new file mode 100644
index 0000000000..87a4a93ff4
--- /dev/null
+++ b/board/solidrun/macchiatobin/patches/linux/0001-arm64-dts-marvell-extend-cp110-syscon-regs.patch
@@ -0,0 +1,38 @@
+commit 0f0dfbec373eef37dcb424b5b24ce899f05249cd
+Author: Antoine Tenart <antoine.tenart@free-electrons.com>
+Date:   Mon Sep 18 09:58:08 2017 +0200
+
+    arm64: dts: marvell: extend the cp110 syscon register area length
+    
+    This patch extends on both cp110 the system register area length to
+    include some of the comphy registers as well.
+    
+    Signed-off-by: Antoine Tenart <antoine.tenart@free-electrons.com>
+    Signed-off-by: Gregory CLEMENT <gregory.clement@free-electrons.com>
+
+diff --git a/arch/arm64/boot/dts/marvell/armada-cp110-master.dtsi b/arch/arm64/boot/dts/marvell/armada-cp110-master.dtsi
+index f2aa2a81de4d..4dd8c7d53764 100644
+--- a/arch/arm64/boot/dts/marvell/armada-cp110-master.dtsi
++++ b/arch/arm64/boot/dts/marvell/armada-cp110-master.dtsi
+@@ -143,7 +143,7 @@
+ 
+ 			cpm_syscon0: system-controller at 440000 {
+ 				compatible = "syscon", "simple-mfd";
+-				reg = <0x440000 0x1000>;
++				reg = <0x440000 0x2000>;
+ 
+ 				cpm_clk: clock {
+ 					compatible = "marvell,cp110-clock";
+diff --git a/arch/arm64/boot/dts/marvell/armada-cp110-slave.dtsi b/arch/arm64/boot/dts/marvell/armada-cp110-slave.dtsi
+index 4fe70323abb3..43fa491da6ce 100644
+--- a/arch/arm64/boot/dts/marvell/armada-cp110-slave.dtsi
++++ b/arch/arm64/boot/dts/marvell/armada-cp110-slave.dtsi
+@@ -143,7 +143,7 @@
+ 
+ 			cps_syscon0: system-controller at 440000 {
+ 				compatible = "syscon", "simple-mfd";
+-				reg = <0x440000 0x1000>;
++				reg = <0x440000 0x2000>;
+ 
+ 				cps_clk: clock {
+ 					compatible = "marvell,cp110-clock";
diff --git a/board/solidrun/macchiatobin/patches/linux/0002-arm64-dts-marvell-add-comphy-nodes-on-cp110.patch b/board/solidrun/macchiatobin/patches/linux/0002-arm64-dts-marvell-add-comphy-nodes-on-cp110.patch
new file mode 100644
index 0000000000..738abfa670
--- /dev/null
+++ b/board/solidrun/macchiatobin/patches/linux/0002-arm64-dts-marvell-add-comphy-nodes-on-cp110.patch
@@ -0,0 +1,111 @@
+commit c90dab5d2bf4f6726e5900c6baeb3ed9ff7fbb03
+Author: Antoine Tenart <antoine.tenart@free-electrons.com>
+Date:   Mon Sep 18 09:58:09 2017 +0200
+
+    arm64: dts: marvell: add comphy nodes on cp110 master and slave
+    
+    This patch describes the comphy available in the cp110 master and slave.
+    This comphy provides serdes lanes used by various controllers such as
+    the network one.
+    
+    Signed-off-by: Antoine Tenart <antoine.tenart@free-electrons.com>
+    Signed-off-by: Gregory CLEMENT <gregory.clement@free-electrons.com>
+
+diff --git a/arch/arm64/boot/dts/marvell/armada-cp110-master.dtsi b/arch/arm64/boot/dts/marvell/armada-cp110-master.dtsi
+index 4dd8c7d53764..b91c27ccee33 100644
+--- a/arch/arm64/boot/dts/marvell/armada-cp110-master.dtsi
++++ b/arch/arm64/boot/dts/marvell/armada-cp110-master.dtsi
+@@ -109,6 +109,44 @@
+ 				};
+ 			};
+ 
++			cpm_comphy: phy at 120000 {
++				compatible = "marvell,comphy-cp110";
++				reg = <0x120000 0x6000>;
++				marvell,system-controller = <&cpm_syscon0>;
++				#address-cells = <1>;
++				#size-cells = <0>;
++
++				cpm_comphy0: phy at 0 {
++					reg = <0>;
++					#phy-cells = <1>;
++				};
++
++				cpm_comphy1: phy at 1 {
++					reg = <1>;
++					#phy-cells = <1>;
++				};
++
++				cpm_comphy2: phy at 2 {
++					reg = <2>;
++					#phy-cells = <1>;
++				};
++
++				cpm_comphy3: phy at 3 {
++					reg = <3>;
++					#phy-cells = <1>;
++				};
++
++				cpm_comphy4: phy at 4 {
++					reg = <4>;
++					#phy-cells = <1>;
++				};
++
++				cpm_comphy5: phy at 5 {
++					reg = <5>;
++					#phy-cells = <1>;
++				};
++			};
++
+ 			cpm_mdio: mdio at 12a200 {
+ 				#address-cells = <1>;
+ 				#size-cells = <0>;
+diff --git a/arch/arm64/boot/dts/marvell/armada-cp110-slave.dtsi b/arch/arm64/boot/dts/marvell/armada-cp110-slave.dtsi
+index 43fa491da6ce..6849348ae214 100644
+--- a/arch/arm64/boot/dts/marvell/armada-cp110-slave.dtsi
++++ b/arch/arm64/boot/dts/marvell/armada-cp110-slave.dtsi
+@@ -109,6 +109,44 @@
+ 				};
+ 			};
+ 
++			cps_comphy: phy at 120000 {
++				compatible = "marvell,comphy-cp110";
++				reg = <0x120000 0x6000>;
++				marvell,system-controller = <&cps_syscon0>;
++				#address-cells = <1>;
++				#size-cells = <0>;
++
++				cps_comphy0: phy at 0 {
++					reg = <0>;
++					#phy-cells = <1>;
++				};
++
++				cps_comphy1: phy at 1 {
++					reg = <1>;
++					#phy-cells = <1>;
++				};
++
++				cps_comphy2: phy at 2 {
++					reg = <2>;
++					#phy-cells = <1>;
++				};
++
++				cps_comphy3: phy at 3 {
++					reg = <3>;
++					#phy-cells = <1>;
++				};
++
++				cps_comphy4: phy at 4 {
++					reg = <4>;
++					#phy-cells = <1>;
++				};
++
++				cps_comphy5: phy at 5 {
++					reg = <5>;
++					#phy-cells = <1>;
++				};
++			};
++
+ 			cps_mdio: mdio at 12a200 {
+ 				#address-cells = <1>;
+ 				#size-cells = <0>;
diff --git a/board/solidrun/macchiatobin/patches/linux/0003-arm64-dts-marvell-mcbin-add-comphy.patch b/board/solidrun/macchiatobin/patches/linux/0003-arm64-dts-marvell-mcbin-add-comphy.patch
new file mode 100644
index 0000000000..ef9baa0cb6
--- /dev/null
+++ b/board/solidrun/macchiatobin/patches/linux/0003-arm64-dts-marvell-mcbin-add-comphy.patch
@@ -0,0 +1,52 @@
+commit 26c08c06b8270ebdd1b8841bdf7e48f07a06cf3d
+Author: Antoine Tenart <antoine.tenart@free-electrons.com>
+Date:   Thu Sep 21 09:54:07 2017 +0200
+
+    arm64: dts: marvell: mcbin: add comphy references to Ethernet ports
+    
+    This patch adds comphy phandles to the Ethernet ports in the mcbin
+    device tree. The comphy is used to configure the serdes PHYs used by
+    these ports.
+    
+    Signed-off-by: Antoine Tenart <antoine.tenart@free-electrons.com>
+    Reviewed-by: Andrew Lunn <andrew@lunn.ch>
+    Signed-off-by: Gregory CLEMENT <gregory.clement@free-electrons.com>
+
+diff --git a/arch/arm64/boot/dts/marvell/armada-8040-mcbin.dts b/arch/arm64/boot/dts/marvell/armada-8040-mcbin.dts
+index e7a7cbee2fe4..a59a35c182bd 100644
+--- a/arch/arm64/boot/dts/marvell/armada-8040-mcbin.dts
++++ b/arch/arm64/boot/dts/marvell/armada-8040-mcbin.dts
+@@ -224,8 +224,11 @@
+ 
+ &cpm_eth0 {
+ 	status = "okay";
++	/* Network PHY */
+ 	phy = <&phy0>;
+ 	phy-mode = "10gbase-kr";
++	/* Generic PHY, providing serdes lanes */
++	phys = <&cpm_comphy4 0>;
+ };
+ 
+ &cpm_sata0 {
+@@ -259,15 +262,21 @@
+ 
+ &cps_eth0 {
+ 	status = "okay";
++	/* Network PHY */
+ 	phy = <&phy8>;
+ 	phy-mode = "10gbase-kr";
++	/* Generic PHY, providing serdes lanes */
++	phys = <&cps_comphy4 0>;
+ };
+ 
+ &cps_eth1 {
+ 	/* CPS Lane 0 - J5 (Gigabit RJ45) */
+ 	status = "okay";
++	/* Network PHY */
+ 	phy = <&ge_phy>;
+ 	phy-mode = "sgmii";
++	/* Generic PHY, providing serdes lanes */
++	phys = <&cps_comphy0 1>;
+ };
+ 
+ &cps_pinctrl {
diff --git a/board/solidrun/macchiatobin/post-build.sh b/board/solidrun/macchiatobin/post-build.sh
new file mode 100755
index 0000000000..9c1b5b883c
--- /dev/null
+++ b/board/solidrun/macchiatobin/post-build.sh
@@ -0,0 +1,5 @@
+#!/bin/sh
+
+BOARD_DIR="$(dirname $0)"
+
+install -m 0644 -D ${BOARD_DIR}/uEnv-example.txt ${TARGET_DIR}/boot/uEnv-example.txt
diff --git a/board/solidrun/macchiatobin/readme.txt b/board/solidrun/macchiatobin/readme.txt
new file mode 100644
index 0000000000..7fee6a11e0
--- /dev/null
+++ b/board/solidrun/macchiatobin/readme.txt
@@ -0,0 +1,82 @@
+Intro
+=====
+
+This default configuration will allow you to start experimenting with the
+buildroot environment for the MacchiatoBin board based on Marvell Armada
+8040 SoC. Documentation for the board hardware and software
+is available on wiki: http://wiki.macchiatobin.net
+
+This default configuration will bring-up the board and allow
+access through the serial console.
+
+How to build
+============
+
+There are two build options. The first option is mainline BSP:
+ - Linux v4.14
+ - U-Boot v2017.09
+
+Marvell BSP is based on the following Linux and U-Boot versions:
+ - Linux v4.4.52
+ - U-Boot v2017.03
+Sources are available on Marvell GitHub page:
+   https://github.com/MarvellEmbeddedProcessors
+
+At the moment mainline support for the board is a work in progress.
+Mainline kernel 4.14 with provided patches enables eth2 in 1Gb
+(RJ45 connector J5) and eth0 in 10Gb (SFP connector J15).
+Vendor BSP enables more hardware features out of the box,
+e.g. all the network interfaces.
+
+To use mainline BSP run the following commands:
+    $ make solidrun_macchiatobin_mainline_defconfig
+    $ make
+
+To use vendor BSP run the following commands:
+    $ make solidrun_macchiatobin_marvell_defconfig
+    $ make
+
+Note: you will need access to the internet to download
+all the required sources.
+
+How to write the SD card
+========================
+
+Once the build process is finished you will have an image
+called "sdcard.img" in the output/images/ directory.
+
+Copy the bootable "sdcard.img" onto an SD card with "dd":
+
+  $ sudo dd if=output/images/sdcard.img of=/dev/sdX bs=1M conv=fsync
+  $ sudo sync
+
+How to boot the board
+=====================
+
+MacchiatoBin board can be setup to load bootloader from different
+sources including eMMC, SPI flash, and SD-card. In order to select
+boot from SD-card DIP switches SW1 and SW2 should be configured
+as follows:
+SW2: 01110
+SW1: 1xxxx
+
+Insert the micro SDcard in MacchiatoBin board and power it up.
+Serial console is accessible at the micro-USB Type-B connector
+marked CON9. The serial line setings are 115200 8N1.
+
+By default U-Boot will use environment from SPI flash. On first boot
+SPI flash may be empty or it may keep legacy environment incompatible
+with up-to-date mainline U-Boot and kernel. Then the following
+commands can be used to boot the board:
+
+=> ext4load mmc 1:1 0x01700000 /boot/uEnv-example.txt
+=> env import -t 0x01700000 $filesize
+=> boot
+
+The example environment from uEnv-example.txt can be written to
+SPI flash using the following commands:
+
+=> env default -f -a
+=> ext4load mmc 1:1 0x01700000 /boot/uEnv-example.txt
+=> env import -t 0x01700000 $filesize
+=> saveenv
diff --git a/board/solidrun/macchiatobin/uEnv-example.txt b/board/solidrun/macchiatobin/uEnv-example.txt
new file mode 100644
index 0000000000..1967e2badd
--- /dev/null
+++ b/board/solidrun/macchiatobin/uEnv-example.txt
@@ -0,0 +1,7 @@
+bootargs=console=ttyS0,115200 root=/dev/mmcblk1p1 rw rootwait
+fdt_addr=0x1000000
+fdt_high=0xffffffffffffffff
+fdt_name=boot/armada-8040-mcbin.dtb
+kernel_addr=0x2000000
+image_name=boot/Image
+bootcmd=mmc dev 1; ext4load mmc 1:1 $kernel_addr $image_name; ext4load mmc 1:1 $fdt_addr $fdt_name; booti $kernel_addr - $fdt_addr
diff --git a/configs/solidrun_macchiatobin_mainline_defconfig b/configs/solidrun_macchiatobin_mainline_defconfig
new file mode 100644
index 0000000000..aca798ab05
--- /dev/null
+++ b/configs/solidrun_macchiatobin_mainline_defconfig
@@ -0,0 +1,45 @@
+BR2_aarch64=y
+
+#
+BR2_GLOBAL_PATCH_DIR="board/solidrun/macchiatobin/patches"
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_14=y
+BR2_TARGET_GENERIC_HOSTNAME="mcbin"
+BR2_TARGET_GENERIC_ISSUE="Welcome to Buildroot for Marvell MacchiatoBin"
+
+# Firmware
+BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_GIT=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_URL="https://github.com/MarvellEmbeddedProcessors/atf-marvell.git"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_VERSION="atf-v1.3-armada-17.10"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="a80x0_mcbin"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES="USE_COHERENT_MEM=0"
+BR2_TARGET_BINARIES_MARVELL=y
+BR2_TARGET_BINARIES_MARVELL_8040=y
+BR2_TARGET_MV_DDR_MARVELL=y
+
+# U-Boot
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BOARDNAME="mvebu_mcbin-88f8040"
+BR2_TARGET_UBOOT_CUSTOM_VERSION=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2017.09"
+
+# Kernel
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.14"
+BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="marvell/armada-8040-mcbin"
+BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/solidrun/macchiatobin/linux-extras.config"
+BR2_LINUX_KERNEL_INSTALL_TARGET=y
+
+# rootfs
+BR2_TARGET_ROOTFS_TAR=y
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_MTOOLS=y
+BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/solidrun/macchiatobin/genimage.cfg"
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/solidrun/macchiatobin/post-build.sh"
diff --git a/configs/solidrun_macchiatobin_marvell_defconfig b/configs/solidrun_macchiatobin_marvell_defconfig
new file mode 100644
index 0000000000..26a1943cd8
--- /dev/null
+++ b/configs/solidrun_macchiatobin_marvell_defconfig
@@ -0,0 +1,45 @@
+BR2_aarch64=y
+
+#
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_4=y
+BR2_TARGET_GENERIC_HOSTNAME="mcbin"
+BR2_TARGET_GENERIC_ISSUE="Welcome to Buildroot for Marvell MacchiatoBin"
+
+# Firmware
+BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_GIT=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_URL="https://github.com/MarvellEmbeddedProcessors/atf-marvell.git"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_VERSION="atf-v1.3-armada-17.10"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="a80x0_mcbin"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES="USE_COHERENT_MEM=0"
+BR2_TARGET_BINARIES_MARVELL=y
+BR2_TARGET_BINARIES_MARVELL_8040=y
+BR2_TARGET_MV_DDR_MARVELL=y
+
+# U-Boot
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_CUSTOM_GIT=y
+BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://github.com/MarvellEmbeddedProcessors/u-boot-marvell"
+BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="u-boot-2017.03-armada-17.10"
+BR2_TARGET_UBOOT_BOARDNAME="mvebu_mcbin-88f8040"
+
+# Kernel
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_GIT=y
+BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/MarvellEmbeddedProcessors/linux-marvell"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="linux-4.4.52-armada-17.10"
+BR2_LINUX_KERNEL_DEFCONFIG="mvebu_v8_lsp"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="marvell/armada-8040-mcbin"
+BR2_LINUX_KERNEL_INSTALL_TARGET=y
+
+# rootfs
+BR2_TARGET_ROOTFS_TAR=y
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_MTOOLS=y
+BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/solidrun/macchiatobin/genimage.cfg"
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/solidrun/macchiatobin/post-build.sh"
-- 
2.11.0
