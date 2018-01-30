From: Sergey Matyukevich <geomatsi@gmail.com>
Date: Wed, 31 Jan 2018 00:13:07 +0300
Subject: [Buildroot] [PATCH] macchiatobin: bump kernel and u-boot versions
Message-ID: <20180130211307.13653-1-geomatsi@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bump Linux to 4.15 and U-Boot to 2018.01. Remove networking dts patches
since they has landed in Linux 4.15. Update readme.txt: fix mainline BSP
versions and update boot selection for board rev 1.3.

Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
---
 ...arvell-extend-the-cp110-syscon-register-a.patch |  45 --------
 ...arvell-add-comphy-nodes-on-cp110-master-a.patch | 118 ---------------------
 ...arvell-mcbin-add-comphy-references-to-Eth.patch |  58 ----------
 board/solidrun/macchiatobin/readme.txt             |  26 +++--
 configs/solidrun_macchiatobin_mainline_defconfig   |   7 +-
 5 files changed, 20 insertions(+), 234 deletions(-)
 delete mode 100644 board/solidrun/macchiatobin/patches/linux/0001-arm64-dts-marvell-extend-the-cp110-syscon-register-a.patch
 delete mode 100644 board/solidrun/macchiatobin/patches/linux/0002-arm64-dts-marvell-add-comphy-nodes-on-cp110-master-a.patch
 delete mode 100644 board/solidrun/macchiatobin/patches/linux/0003-arm64-dts-marvell-mcbin-add-comphy-references-to-Eth.patch

diff --git a/board/solidrun/macchiatobin/patches/linux/0001-arm64-dts-marvell-extend-the-cp110-syscon-register-a.patch b/board/solidrun/macchiatobin/patches/linux/0001-arm64-dts-marvell-extend-the-cp110-syscon-register-a.patch
deleted file mode 100644
index bcfeb1ecf9..0000000000
--- a/board/solidrun/macchiatobin/patches/linux/0001-arm64-dts-marvell-extend-the-cp110-syscon-register-a.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-From c25a2b8559989011d43fb901824dd8b981fc6b7b Mon Sep 17 00:00:00 2001
-From: Sergey Matyukevich <geomatsi@gmail.com>
-Date: Fri, 8 Dec 2017 23:08:34 +0300
-Subject: [PATCH] arm64: dts: marvell: extend the cp110 syscon register area length
-
-This patch extends on both cp110 the system register area length to
-include some of the comphy registers as well.
-
-Signed-off-by: Antoine Tenart <antoine.tenart@free-electrons.com>
-Signed-off-by: Gregory CLEMENT <gregory.clement@free-electrons.com>
-Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
----
- arch/arm64/boot/dts/marvell/armada-cp110-master.dtsi | 2 +-
- arch/arm64/boot/dts/marvell/armada-cp110-slave.dtsi  | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/arch/arm64/boot/dts/marvell/armada-cp110-master.dtsi b/arch/arm64/boot/dts/marvell/armada-cp110-master.dtsi
-index f2aa2a81de4d..4dd8c7d53764 100644
---- a/arch/arm64/boot/dts/marvell/armada-cp110-master.dtsi
-+++ b/arch/arm64/boot/dts/marvell/armada-cp110-master.dtsi
-@@ -143,7 +143,7 @@
- 
- 			cpm_syscon0: system-controller at 440000 {
- 				compatible = "syscon", "simple-mfd";
--				reg = <0x440000 0x1000>;
-+				reg = <0x440000 0x2000>;
- 
- 				cpm_clk: clock {
- 					compatible = "marvell,cp110-clock";
-diff --git a/arch/arm64/boot/dts/marvell/armada-cp110-slave.dtsi b/arch/arm64/boot/dts/marvell/armada-cp110-slave.dtsi
-index 4fe70323abb3..43fa491da6ce 100644
---- a/arch/arm64/boot/dts/marvell/armada-cp110-slave.dtsi
-+++ b/arch/arm64/boot/dts/marvell/armada-cp110-slave.dtsi
-@@ -143,7 +143,7 @@
- 
- 			cps_syscon0: system-controller at 440000 {
- 				compatible = "syscon", "simple-mfd";
--				reg = <0x440000 0x1000>;
-+				reg = <0x440000 0x2000>;
- 
- 				cps_clk: clock {
- 					compatible = "marvell,cp110-clock";
--- 
-2.11.0
-
diff --git a/board/solidrun/macchiatobin/patches/linux/0002-arm64-dts-marvell-add-comphy-nodes-on-cp110-master-a.patch b/board/solidrun/macchiatobin/patches/linux/0002-arm64-dts-marvell-add-comphy-nodes-on-cp110-master-a.patch
deleted file mode 100644
index b2989667eb..0000000000
--- a/board/solidrun/macchiatobin/patches/linux/0002-arm64-dts-marvell-add-comphy-nodes-on-cp110-master-a.patch
+++ /dev/null
@@ -1,118 +0,0 @@
-From f05fc07443118bb3017c2b6938c63f48845329ca Mon Sep 17 00:00:00 2001
-From: Sergey Matyukevich <geomatsi@gmail.com>
-Date: Fri, 8 Dec 2017 23:10:36 +0300
-Subject: [PATCH] arm64: dts: marvell: add comphy nodes on cp110 master and slave
-
-This patch describes the comphy available in the cp110 master and slave.
-This comphy provides serdes lanes used by various controllers such as
-the network one.
-
-Signed-off-by: Antoine Tenart <antoine.tenart@free-electrons.com>
-Signed-off-by: Gregory CLEMENT <gregory.clement@free-electrons.com>
-Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
----
- .../boot/dts/marvell/armada-cp110-master.dtsi      | 38 ++++++++++++++++++++++
- .../arm64/boot/dts/marvell/armada-cp110-slave.dtsi | 38 ++++++++++++++++++++++
- 2 files changed, 76 insertions(+)
-
-diff --git a/arch/arm64/boot/dts/marvell/armada-cp110-master.dtsi b/arch/arm64/boot/dts/marvell/armada-cp110-master.dtsi
-index 4dd8c7d53764..b91c27ccee33 100644
---- a/arch/arm64/boot/dts/marvell/armada-cp110-master.dtsi
-+++ b/arch/arm64/boot/dts/marvell/armada-cp110-master.dtsi
-@@ -109,6 +109,44 @@
- 				};
- 			};
- 
-+			cpm_comphy: phy at 120000 {
-+				compatible = "marvell,comphy-cp110";
-+				reg = <0x120000 0x6000>;
-+				marvell,system-controller = <&cpm_syscon0>;
-+				#address-cells = <1>;
-+				#size-cells = <0>;
-+
-+				cpm_comphy0: phy at 0 {
-+					reg = <0>;
-+					#phy-cells = <1>;
-+				};
-+
-+				cpm_comphy1: phy at 1 {
-+					reg = <1>;
-+					#phy-cells = <1>;
-+				};
-+
-+				cpm_comphy2: phy at 2 {
-+					reg = <2>;
-+					#phy-cells = <1>;
-+				};
-+
-+				cpm_comphy3: phy at 3 {
-+					reg = <3>;
-+					#phy-cells = <1>;
-+				};
-+
-+				cpm_comphy4: phy at 4 {
-+					reg = <4>;
-+					#phy-cells = <1>;
-+				};
-+
-+				cpm_comphy5: phy at 5 {
-+					reg = <5>;
-+					#phy-cells = <1>;
-+				};
-+			};
-+
- 			cpm_mdio: mdio at 12a200 {
- 				#address-cells = <1>;
- 				#size-cells = <0>;
-diff --git a/arch/arm64/boot/dts/marvell/armada-cp110-slave.dtsi b/arch/arm64/boot/dts/marvell/armada-cp110-slave.dtsi
-index 43fa491da6ce..6849348ae214 100644
---- a/arch/arm64/boot/dts/marvell/armada-cp110-slave.dtsi
-+++ b/arch/arm64/boot/dts/marvell/armada-cp110-slave.dtsi
-@@ -109,6 +109,44 @@
- 				};
- 			};
- 
-+			cps_comphy: phy at 120000 {
-+				compatible = "marvell,comphy-cp110";
-+				reg = <0x120000 0x6000>;
-+				marvell,system-controller = <&cps_syscon0>;
-+				#address-cells = <1>;
-+				#size-cells = <0>;
-+
-+				cps_comphy0: phy at 0 {
-+					reg = <0>;
-+					#phy-cells = <1>;
-+				};
-+
-+				cps_comphy1: phy at 1 {
-+					reg = <1>;
-+					#phy-cells = <1>;
-+				};
-+
-+				cps_comphy2: phy at 2 {
-+					reg = <2>;
-+					#phy-cells = <1>;
-+				};
-+
-+				cps_comphy3: phy at 3 {
-+					reg = <3>;
-+					#phy-cells = <1>;
-+				};
-+
-+				cps_comphy4: phy at 4 {
-+					reg = <4>;
-+					#phy-cells = <1>;
-+				};
-+
-+				cps_comphy5: phy at 5 {
-+					reg = <5>;
-+					#phy-cells = <1>;
-+				};
-+			};
-+
- 			cps_mdio: mdio at 12a200 {
- 				#address-cells = <1>;
- 				#size-cells = <0>;
--- 
-2.11.0
-
diff --git a/board/solidrun/macchiatobin/patches/linux/0003-arm64-dts-marvell-mcbin-add-comphy-references-to-Eth.patch b/board/solidrun/macchiatobin/patches/linux/0003-arm64-dts-marvell-mcbin-add-comphy-references-to-Eth.patch
deleted file mode 100644
index dcbd8779a3..0000000000
--- a/board/solidrun/macchiatobin/patches/linux/0003-arm64-dts-marvell-mcbin-add-comphy-references-to-Eth.patch
+++ /dev/null
@@ -1,58 +0,0 @@
-From 7a67e72567a9b6104c7ebe134e710610cfb88a6e Mon Sep 17 00:00:00 2001
-From: Sergey Matyukevich <geomatsi@gmail.com>
-Date: Fri, 8 Dec 2017 23:11:29 +0300
-Subject: [PATCH] arm64: dts: marvell: mcbin: add comphy references to Ethernet ports
-
-This patch adds comphy phandles to the Ethernet ports in the mcbin
-device tree. The comphy is used to configure the serdes PHYs used by
-these ports.
-
-Signed-off-by: Antoine Tenart <antoine.tenart@free-electrons.com>
-Reviewed-by: Andrew Lunn <andrew@lunn.ch>
-Signed-off-by: Gregory CLEMENT <gregory.clement@free-electrons.com>
-Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
----
- arch/arm64/boot/dts/marvell/armada-8040-mcbin.dts | 9 +++++++++
- 1 file changed, 9 insertions(+)
-
-diff --git a/arch/arm64/boot/dts/marvell/armada-8040-mcbin.dts b/arch/arm64/boot/dts/marvell/armada-8040-mcbin.dts
-index acf5c7d16d79..49d6590507b5 100644
---- a/arch/arm64/boot/dts/marvell/armada-8040-mcbin.dts
-+++ b/arch/arm64/boot/dts/marvell/armada-8040-mcbin.dts
-@@ -222,8 +222,11 @@
- 
- &cpm_eth0 {
- 	status = "okay";
-+	/* Network PHY */
- 	phy = <&phy0>;
- 	phy-mode = "10gbase-kr";
-+	/* Generic PHY, providing serdes lanes */
-+	phys = <&cpm_comphy4 0>;
- };
- 
- &cpm_sata0 {
-@@ -257,15 +260,21 @@
- 
- &cps_eth0 {
- 	status = "okay";
-+	/* Network PHY */
- 	phy = <&phy8>;
- 	phy-mode = "10gbase-kr";
-+	/* Generic PHY, providing serdes lanes */
-+	phys = <&cps_comphy4 0>;
- };
- 
- &cps_eth1 {
- 	/* CPS Lane 0 - J5 (Gigabit RJ45) */
- 	status = "okay";
-+	/* Network PHY */
- 	phy = <&ge_phy>;
- 	phy-mode = "sgmii";
-+	/* Generic PHY, providing serdes lanes */
-+	phys = <&cps_comphy0 1>;
- };
- 
- &cps_pinctrl {
--- 
-2.11.0
-
diff --git a/board/solidrun/macchiatobin/readme.txt b/board/solidrun/macchiatobin/readme.txt
index cdfe740c4e..dfbd6e793b 100644
--- a/board/solidrun/macchiatobin/readme.txt
+++ b/board/solidrun/macchiatobin/readme.txt
@@ -15,8 +15,8 @@ How to build
 There are two build options: mainline support and vendor support.
 
 For the mainline BSP, we use:
- - Linux v4.14.4
- - U-Boot v2017.11
+ - Linux v4.15
+ - U-Boot v2018.01
 
 For the vendor BSP, we use the sources available from Marvell Github
 page at https://github.com/MarvellEmbeddedProcessors, which uses:
@@ -24,10 +24,10 @@ page at https://github.com/MarvellEmbeddedProcessors, which uses:
  - U-Boot v2017.03
 
 At the moment mainline support for the board is a work in progress.
-Mainline kernel 4.14 with provided patches enables eth2 in 1Gb (RJ45
-connector J5) and eth0 in 10Gb (SFP connector J15). The vendor BSP
-enables more hardware features out of the box, e.g. all the network
-interfaces.
+Mainline kernel 4.15 enables eth2 in 1Gb (RJ45 connector J5) and
+eth0 in 10Gb (SFP connector CON15 and RJ45 connector CON16).
+The vendor BSP enables more hardware features out of the box,
+e.g. all the network interfaces.
 
 To use the mainline BSP run the following commands:
 
@@ -54,13 +54,21 @@ How to boot the board
 =====================
 
 The MacchiatoBin board can be setup to load the bootloader from
-different sources including eMMC, SPI flash, and SD-card. In order to
-select boot from SD-card DIP switches SW1 and SW2 should be configured
-as follows:
+different sources including eMMC, SPI flash, and SD-card.
+
+On Rev 1.2 board to select boot from SD-card the DIP switches
+SW1 and SW2 should be configured as follows:
 
 SW2: 01110
 SW1: 1xxxx
 
+The upcoming Rev 1.3 board will have a single pins header J1 instead
+of the SW1/2 DIP switches. To boot from SD-card the setting of J1
+jumpers should match the DIP switches of Rev v1.2 board
+from left to right:
+
+J1: 011101xxxx
+
 Insert the micro SDcard in the MacchiatoBin board and power it up.
 The serial console is accessible at the micro-USB Type-B connector
 marked CON9. The serial line settings are 115200 8N1.
diff --git a/configs/solidrun_macchiatobin_mainline_defconfig b/configs/solidrun_macchiatobin_mainline_defconfig
index aae8e36959..526c021fe7 100644
--- a/configs/solidrun_macchiatobin_mainline_defconfig
+++ b/configs/solidrun_macchiatobin_mainline_defconfig
@@ -1,6 +1,5 @@
 BR2_aarch64=y
-BR2_GLOBAL_PATCH_DIR="board/solidrun/macchiatobin/patches"
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_14=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_15=y
 BR2_TARGET_GENERIC_HOSTNAME="mcbin"
 BR2_TARGET_GENERIC_ISSUE="Welcome to Buildroot for Marvell MacchiatoBin"
 
@@ -21,12 +20,12 @@ BR2_TARGET_MV_DDR_MARVELL=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BOARDNAME="mvebu_mcbin-88f8040"
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2017.11"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2018.01"
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.14.4"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.15"
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="marvell/armada-8040-mcbin"
-- 
2.16.1
