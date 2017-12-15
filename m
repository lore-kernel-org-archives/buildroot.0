From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 15 Dec 2017 09:28:47 +0100
Subject: [Buildroot] [git commit] configs/solidrun_macchiatobin: add new
 defconfigs
Message-ID: <20171215082906.6AA3D83252@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9ea3da06b21ce4750dce2b0fefb130256bd56551
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add MacchiatoBin board by SolidRun. This board is based on Marvell
Armada 8040 SoC. Board support package includes the following
two options: mainline and vendor BSPs.

Mainline BSP:
- Marvell ATF v1.3-armada-17.10
- mainline U-Boot v2017.11
- mainline Linux kernel v4.14.4

Marvell BSP with more hardware support enabled:
- Marvell ATF v1.3-armada-17.10
- Marvell U-Boot based on v2017.03
- Marvell Linux kernel based v4.4.52

More details about this board are available on wiki:
- http://wiki.macchiatobin.net

Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
[Thomas: misc tweaks in readme.txt.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .gitlab-ci.yml                                     |   2 +
 DEVELOPERS                                         |   3 +
 board/solidrun/macchiatobin/genimage.cfg           |  16 +++
 board/solidrun/macchiatobin/linux-extras.config    |   3 +
 ...arvell-extend-the-cp110-syscon-register-a.patch |  45 ++++++++
 ...arvell-add-comphy-nodes-on-cp110-master-a.patch | 118 +++++++++++++++++++++
 ...arvell-mcbin-add-comphy-references-to-Eth.patch |  58 ++++++++++
 board/solidrun/macchiatobin/post-build.sh          |   5 +
 board/solidrun/macchiatobin/readme.txt             |  83 +++++++++++++++
 board/solidrun/macchiatobin/uEnv-example.txt       |   7 ++
 configs/solidrun_macchiatobin_mainline_defconfig   |  43 ++++++++
 configs/solidrun_macchiatobin_marvell_defconfig    |  43 ++++++++
 12 files changed, 426 insertions(+)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 03c0401..691669f 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -216,6 +216,8 @@ snps_archs38_axs103_defconfig: *defconfig
 snps_archs38_haps_defconfig: *defconfig
 snps_archs38_vdk_defconfig: *defconfig
 socrates_cyclone5_defconfig: *defconfig
+solidrun_macchiatobin_mainline_defconfig: *defconfig
+solidrun_macchiatobin_marvell_defconfig: *defconfig
 stm32f429_disco_defconfig: *defconfig
 stm32f469_disco_defconfig: *defconfig
 telit_evk_pro3_defconfig: *defconfig
diff --git a/DEVELOPERS b/DEVELOPERS
index b476f4e..de600f5 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1532,10 +1532,13 @@ F:	board/linksprite/pcduino
 F:	board/orangepi/orangepi-zero
 F:	board/orangepi/orangepi-one
 F:	board/orangepi/orangepi-pc-plus/
+F:	board/solidrun/macchiatobin
 F:	configs/linksprite_pcduino_defconfig
 F:	configs/orangepi_one_defconfig
 F:	configs/orangepi_pc_plus_defconfig
 F:	configs/orangepi_zero_defconfig
+F:	configs/solidrun_macchiatobin_mainline_defconfig
+F:	configs/solidrun_macchiatobin_marvell_defconfig
 F:	package/armbian-firmware/
 F:	package/rtl8189fs/
 F:	package/xr819-xradio/
diff --git a/board/solidrun/macchiatobin/genimage.cfg b/board/solidrun/macchiatobin/genimage.cfg
new file mode 100644
index 0000000..fdcda36
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
index 0000000..11267d2
--- /dev/null
+++ b/board/solidrun/macchiatobin/linux-extras.config
@@ -0,0 +1,3 @@
+CONFIG_MARVELL_PHY=y
+CONFIG_MARVELL_10G_PHY=y
+CONFIG_PHY_MVEBU_CP110_COMPHY=y
diff --git a/board/solidrun/macchiatobin/patches/linux/0001-arm64-dts-marvell-extend-the-cp110-syscon-register-a.patch b/board/solidrun/macchiatobin/patches/linux/0001-arm64-dts-marvell-extend-the-cp110-syscon-register-a.patch
new file mode 100644
index 0000000..bcfeb1e
--- /dev/null
+++ b/board/solidrun/macchiatobin/patches/linux/0001-arm64-dts-marvell-extend-the-cp110-syscon-register-a.patch
@@ -0,0 +1,45 @@
+From c25a2b8559989011d43fb901824dd8b981fc6b7b Mon Sep 17 00:00:00 2001
+From: Sergey Matyukevich <geomatsi@gmail.com>
+Date: Fri, 8 Dec 2017 23:08:34 +0300
+Subject: [PATCH] arm64: dts: marvell: extend the cp110 syscon register area length
+
+This patch extends on both cp110 the system register area length to
+include some of the comphy registers as well.
+
+Signed-off-by: Antoine Tenart <antoine.tenart@free-electrons.com>
+Signed-off-by: Gregory CLEMENT <gregory.clement@free-electrons.com>
+Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
+---
+ arch/arm64/boot/dts/marvell/armada-cp110-master.dtsi | 2 +-
+ arch/arm64/boot/dts/marvell/armada-cp110-slave.dtsi  | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
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
+-- 
+2.11.0
+
diff --git a/board/solidrun/macchiatobin/patches/linux/0002-arm64-dts-marvell-add-comphy-nodes-on-cp110-master-a.patch b/board/solidrun/macchiatobin/patches/linux/0002-arm64-dts-marvell-add-comphy-nodes-on-cp110-master-a.patch
new file mode 100644
index 0000000..b298966
--- /dev/null
+++ b/board/solidrun/macchiatobin/patches/linux/0002-arm64-dts-marvell-add-comphy-nodes-on-cp110-master-a.patch
@@ -0,0 +1,118 @@
+From f05fc07443118bb3017c2b6938c63f48845329ca Mon Sep 17 00:00:00 2001
+From: Sergey Matyukevich <geomatsi@gmail.com>
+Date: Fri, 8 Dec 2017 23:10:36 +0300
+Subject: [PATCH] arm64: dts: marvell: add comphy nodes on cp110 master and slave
+
+This patch describes the comphy available in the cp110 master and slave.
+This comphy provides serdes lanes used by various controllers such as
+the network one.
+
+Signed-off-by: Antoine Tenart <antoine.tenart@free-electrons.com>
+Signed-off-by: Gregory CLEMENT <gregory.clement@free-electrons.com>
+Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
+---
+ .../boot/dts/marvell/armada-cp110-master.dtsi      | 38 ++++++++++++++++++++++
+ .../arm64/boot/dts/marvell/armada-cp110-slave.dtsi | 38 ++++++++++++++++++++++
+ 2 files changed, 76 insertions(+)
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
+-- 
+2.11.0
+
diff --git a/board/solidrun/macchiatobin/patches/linux/0003-arm64-dts-marvell-mcbin-add-comphy-references-to-Eth.patch b/board/solidrun/macchiatobin/patches/linux/0003-arm64-dts-marvell-mcbin-add-comphy-references-to-Eth.patch
new file mode 100644
index 0000000..dcbd877
--- /dev/null
+++ b/board/solidrun/macchiatobin/patches/linux/0003-arm64-dts-marvell-mcbin-add-comphy-references-to-Eth.patch
@@ -0,0 +1,58 @@
+From 7a67e72567a9b6104c7ebe134e710610cfb88a6e Mon Sep 17 00:00:00 2001
+From: Sergey Matyukevich <geomatsi@gmail.com>
+Date: Fri, 8 Dec 2017 23:11:29 +0300
+Subject: [PATCH] arm64: dts: marvell: mcbin: add comphy references to Ethernet ports
+
+This patch adds comphy phandles to the Ethernet ports in the mcbin
+device tree. The comphy is used to configure the serdes PHYs used by
+these ports.
+
+Signed-off-by: Antoine Tenart <antoine.tenart@free-electrons.com>
+Reviewed-by: Andrew Lunn <andrew@lunn.ch>
+Signed-off-by: Gregory CLEMENT <gregory.clement@free-electrons.com>
+Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
+---
+ arch/arm64/boot/dts/marvell/armada-8040-mcbin.dts | 9 +++++++++
+ 1 file changed, 9 insertions(+)
+
+diff --git a/arch/arm64/boot/dts/marvell/armada-8040-mcbin.dts b/arch/arm64/boot/dts/marvell/armada-8040-mcbin.dts
+index acf5c7d16d79..49d6590507b5 100644
+--- a/arch/arm64/boot/dts/marvell/armada-8040-mcbin.dts
++++ b/arch/arm64/boot/dts/marvell/armada-8040-mcbin.dts
+@@ -222,8 +222,11 @@
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
+@@ -257,15 +260,21 @@
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
+-- 
+2.11.0
+
diff --git a/board/solidrun/macchiatobin/post-build.sh b/board/solidrun/macchiatobin/post-build.sh
new file mode 100755
index 0000000..9c1b5b8
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
index 0000000..cdfe740
--- /dev/null
+++ b/board/solidrun/macchiatobin/readme.txt
@@ -0,0 +1,83 @@
+Intro
+=====
+
+This default configuration will allow you to start experimenting with
+the buildroot environment for the MacchiatoBin board based on the
+Marvell Armada 8040 SoC. Documentation for the board hardware and
+software is available on the wiki at: http://wiki.macchiatobin.net
+
+This default configuration will bring up the board and allow access
+through the serial console.
+
+How to build
+============
+
+There are two build options: mainline support and vendor support.
+
+For the mainline BSP, we use:
+ - Linux v4.14.4
+ - U-Boot v2017.11
+
+For the vendor BSP, we use the sources available from Marvell Github
+page at https://github.com/MarvellEmbeddedProcessors, which uses:
+ - Linux v4.4.52
+ - U-Boot v2017.03
+
+At the moment mainline support for the board is a work in progress.
+Mainline kernel 4.14 with provided patches enables eth2 in 1Gb (RJ45
+connector J5) and eth0 in 10Gb (SFP connector J15). The vendor BSP
+enables more hardware features out of the box, e.g. all the network
+interfaces.
+
+To use the mainline BSP run the following commands:
+
+    $ make solidrun_macchiatobin_mainline_defconfig
+    $ make
+
+To use the vendor BSP run the following commands:
+
+    $ make solidrun_macchiatobin_marvell_defconfig
+    $ make
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
+The MacchiatoBin board can be setup to load the bootloader from
+different sources including eMMC, SPI flash, and SD-card. In order to
+select boot from SD-card DIP switches SW1 and SW2 should be configured
+as follows:
+
+SW2: 01110
+SW1: 1xxxx
+
+Insert the micro SDcard in the MacchiatoBin board and power it up.
+The serial console is accessible at the micro-USB Type-B connector
+marked CON9. The serial line settings are 115200 8N1.
+
+By default U-Boot will load its environment from the SPI flash. On the
+first boot SPI flash may be empty or it may contain a legacy
+environment incompatible with up-to-date mainline U-Boot and
+kernel. Then the following commands can be used to boot the board:
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
index 0000000..1967e2b
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
index 0000000..aae8e36
--- /dev/null
+++ b/configs/solidrun_macchiatobin_mainline_defconfig
@@ -0,0 +1,43 @@
+BR2_aarch64=y
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
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_FIP=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_UBOOT_AS_BL33=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES="USE_COHERENT_MEM=0"
+BR2_TARGET_BINARIES_MARVELL=y
+BR2_TARGET_BINARIES_MARVELL_8040=y
+BR2_TARGET_MV_DDR_MARVELL=y
+
+# U-Boot
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BOARDNAME="mvebu_mcbin-88f8040"
+BR2_TARGET_UBOOT_CUSTOM_VERSION=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2017.11"
+
+# Kernel
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.14.4"
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
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/solidrun/macchiatobin/genimage.cfg"
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/solidrun/macchiatobin/post-build.sh"
diff --git a/configs/solidrun_macchiatobin_marvell_defconfig b/configs/solidrun_macchiatobin_marvell_defconfig
new file mode 100644
index 0000000..1e747c3
--- /dev/null
+++ b/configs/solidrun_macchiatobin_marvell_defconfig
@@ -0,0 +1,43 @@
+BR2_aarch64=y
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
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_FIP=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_UBOOT_AS_BL33=y
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
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/solidrun/macchiatobin/genimage.cfg"
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/solidrun/macchiatobin/post-build.sh"
