From: =?UTF-8?q?Micha=C5=82=20=C5=81yszczek?= <michal.lyszczek@gmail.com>
Date: Sun, 30 Jul 2017 15:25:42 +0200
Subject: [Buildroot] [PATCH 1/1] Added new board - EVB SoCrates based on
	Altera Cyclone 5
Message-ID: <20170730132542.432-1-michal.lyszczek@gmail.com>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net

From: Micha? ?yszczek <michal.lyszczek@bofc.pl>

Configuration contains:
- binary uboot SPL
- building uboot from altera's github
- booting from SD card
- working ethernet, serial, spi, i2c, fpga_manager, gpio
- minimal rootfs with busybox (~3.5Mb)
- ready to flash SD card image

Signed-off-by: Micha? ?yszczek <michal.lyszczek@bofc.pl>
---
 board/altera/socrates_cyclone5/boot-env.txt     |   3 +
 board/altera/socrates_cyclone5/boot.txt         |   7 +
 board/altera/socrates_cyclone5/create_sdcard.sh |  43 +++++
 board/altera/socrates_cyclone5/genimage.cfg     |  39 +++++
 board/altera/socrates_cyclone5/linux-4.1.config | 218 ++++++++++++++++++++++++
 board/altera/socrates_cyclone5/linux.dts        |  92 ++++++++++
 board/altera/socrates_cyclone5/preloader.bin    | Bin 0 -> 38176 bytes
 board/altera/socrates_cyclone5/readme.txt       |  52 ++++++
 configs/socrates_cyclone5_defconfig             |  34 ++++
 9 files changed, 488 insertions(+)
 create mode 100644 board/altera/socrates_cyclone5/boot-env.txt
 create mode 100644 board/altera/socrates_cyclone5/boot.txt
 create mode 100755 board/altera/socrates_cyclone5/create_sdcard.sh
 create mode 100644 board/altera/socrates_cyclone5/genimage.cfg
 create mode 100644 board/altera/socrates_cyclone5/linux-4.1.config
 create mode 100644 board/altera/socrates_cyclone5/linux.dts
 create mode 100644 board/altera/socrates_cyclone5/preloader.bin
 create mode 100644 board/altera/socrates_cyclone5/readme.txt
 create mode 100644 configs/socrates_cyclone5_defconfig

diff --git a/board/altera/socrates_cyclone5/boot-env.txt b/board/altera/socrates_cyclone5/boot-env.txt
new file mode 100644
index 0000000..30c55a1
--- /dev/null
+++ b/board/altera/socrates_cyclone5/boot-env.txt
@@ -0,0 +1,3 @@
+source_env=fatload mmc 0:1 0x2000000 boot.scr; source 0x2000000
+bootcmd=run source_env; run start
+bootdelay=1
diff --git a/board/altera/socrates_cyclone5/boot.txt b/board/altera/socrates_cyclone5/boot.txt
new file mode 100644
index 0000000..0a70ff3
--- /dev/null
+++ b/board/altera/socrates_cyclone5/boot.txt
@@ -0,0 +1,7 @@
+setenv linux_load_address 0x100000
+setenv linux_dtb_load_address 0x100
+setenv linux_load 'mmc rescan; fatload mmc 0:1 ${linux_load_address} zImage; fatload mmc 0:1 ${linux_dtb_load_address} linux.dtb'
+
+setenv bootargs 'console=ttyS0,115200 root=/dev/mmcblk0p3 rw rootwait'
+
+setenv start 'run linux_load; bootz ${linux_load_address} - ${linux_dtb_load_address}'
diff --git a/board/altera/socrates_cyclone5/create_sdcard.sh b/board/altera/socrates_cyclone5/create_sdcard.sh
new file mode 100755
index 0000000..f7981e3
--- /dev/null
+++ b/board/altera/socrates_cyclone5/create_sdcard.sh
@@ -0,0 +1,43 @@
+#!/bin/bash
+#
+# Script generates sdcard image for altera cyclone5 (socrates board)
+
+# $1 - image directory (output/images)
+
+BOARD_DIR="$(dirname $0)"
+IMAGES_DIR="$1"
+GENIMAGE_CFG="$BOARD_DIR/genimage.cfg"
+GENIMAGE_TMP="$BUILD_DIR/genimage.tmp"
+
+###
+# create altera preloader image that consists of 4 64k images
+#
+
+dd if="$BOARD_DIR/preloader.bin" of="$IMAGES_DIR/preloader.bin" bs=64k count=1 seek=0
+dd if="$BOARD_DIR/preloader.bin" of="$IMAGES_DIR/preloader.bin" bs=64k count=1 seek=1
+dd if="$BOARD_DIR/preloader.bin" of="$IMAGES_DIR/preloader.bin" bs=64k count=1 seek=2
+dd if="$BOARD_DIR/preloader.bin" of="$IMAGES_DIR/preloader.bin" bs=64k count=1 seek=3
+truncate -s256k "$IMAGES_DIR/preloader.bin"
+
+###
+# append real uboot at the end of altera preloader to create complete uboot
+# image
+#
+
+cat "$IMAGES_DIR/preloader.bin" "$IMAGES_DIR/u-boot.img" > \
+    "$IMAGES_DIR/boot_partition.img"
+
+###
+# create sdcard image according to genimage.cfg
+#
+
+rm -fr "$GENIMAGE_TMP"
+
+genimage                     \
+--rootpath   "$TARGET_DIR"   \
+--tmppath    "$GENIMAGE_TMP" \
+--inputpath  "$BINARIES_DIR" \
+--outputpath "$BINARIES_DIR" \
+--config     "$GENIMAGE_CFG"
+
+exit 0
diff --git a/board/altera/socrates_cyclone5/genimage.cfg b/board/altera/socrates_cyclone5/genimage.cfg
new file mode 100644
index 0000000..cfb5746
--- /dev/null
+++ b/board/altera/socrates_cyclone5/genimage.cfg
@@ -0,0 +1,39 @@
+image boot.vfat {
+	vfat {
+		files = {
+			"zImage",
+			"linux.dtb",
+			"boot.scr"
+		}
+	}
+	size = 10321920
+}
+
+image sdcard.img {
+	hdimage {
+	}
+
+	partition uboot-env {
+		in-partition-table = "no"
+		image = "uboot-env.bin"
+		offset = 512
+	}
+
+	partition boot {
+		partition-type = 0xc
+		bootable = "true"
+		image = "boot.vfat"
+	}
+
+	partition preboot {
+		partition-type = 0xa2
+		image = "boot_partition.img"
+		size = 1M
+	}
+
+	partition rootfs {
+		partition-type = 0x83
+		image = "rootfs.ext2"
+		size = 500M
+	}
+}
diff --git a/board/altera/socrates_cyclone5/linux-4.1.config b/board/altera/socrates_cyclone5/linux-4.1.config
new file mode 100644
index 0000000..295bdb8
--- /dev/null
+++ b/board/altera/socrates_cyclone5/linux-4.1.config
@@ -0,0 +1,218 @@
+CONFIG_DEFAULT_HOSTNAME="hdp"
+CONFIG_SYSVIPC=y
+CONFIG_FHANDLE=y
+CONFIG_NO_HZ_IDLE=y
+CONFIG_HIGH_RES_TIMERS=y
+CONFIG_IKCONFIG=y
+CONFIG_IKCONFIG_PROC=y
+CONFIG_LOG_BUF_SHIFT=14
+CONFIG_CGROUPS=y
+CONFIG_CPUSETS=y
+CONFIG_NAMESPACES=y
+CONFIG_EMBEDDED=y
+CONFIG_PROFILING=y
+CONFIG_OPROFILE=y
+CONFIG_JUMP_LABEL=y
+CONFIG_MODULES=y
+CONFIG_MODULE_UNLOAD=y
+# CONFIG_LBDAF is not set
+# CONFIG_BLK_DEV_BSG is not set
+# CONFIG_IOSCHED_DEADLINE is not set
+# CONFIG_IOSCHED_CFQ is not set
+CONFIG_ARCH_SOCFPGA=y
+CONFIG_SOCFPGA_SUSPEND=y
+CONFIG_ARM_THUMBEE=y
+CONFIG_PCI=y
+CONFIG_PCI_MSI=y
+CONFIG_PCIE_ALTERA=y
+CONFIG_PCIE_ALTERA_MSI=y
+CONFIG_SMP=y
+CONFIG_SCHED_MC=y
+CONFIG_SCHED_SMT=y
+CONFIG_NR_CPUS=2
+CONFIG_AEABI=y
+CONFIG_ZBOOT_ROM_TEXT=0x0
+CONFIG_ZBOOT_ROM_BSS=0x0
+CONFIG_VFP=y
+CONFIG_NEON=y
+CONFIG_NET=y
+CONFIG_PACKET=y
+CONFIG_UNIX=y
+CONFIG_NET_KEY=y
+CONFIG_NET_KEY_MIGRATE=y
+CONFIG_INET=y
+CONFIG_IP_MULTICAST=y
+CONFIG_IP_PNP=y
+CONFIG_IP_PNP_DHCP=y
+CONFIG_IP_PNP_BOOTP=y
+CONFIG_IP_PNP_RARP=y
+CONFIG_IPV6=y
+CONFIG_NETWORK_PHY_TIMESTAMPING=y
+CONFIG_VLAN_8021Q=y
+CONFIG_VLAN_8021Q_GVRP=y
+CONFIG_CAN=y
+CONFIG_CAN_C_CAN=y
+CONFIG_CAN_C_CAN_PLATFORM=y
+CONFIG_CAN_DEBUG_DEVICES=y
+# CONFIG_WIRELESS is not set
+CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
+CONFIG_DEVTMPFS=y
+CONFIG_DEVTMPFS_MOUNT=y
+CONFIG_MTD=y
+CONFIG_MTD_BLOCK=y
+CONFIG_MTD_M25P80=y
+CONFIG_MTD_NAND=y
+CONFIG_MTD_NAND_DENALI=y
+CONFIG_MTD_NAND_DENALI_DT=y
+CONFIG_MTD_SPI_NOR=y
+# CONFIG_MTD_SPI_NOR_USE_4K_SECTORS is not set
+CONFIG_SPI_CADENCE_QUADSPI=y
+CONFIG_OF_CONFIGFS=y
+CONFIG_BLK_DEV_RAM=y
+CONFIG_BLK_DEV_RAM_COUNT=2
+CONFIG_BLK_DEV_RAM_SIZE=8192
+CONFIG_SRAM=y
+CONFIG_ALTERA_HWMUTEX=y
+CONFIG_ALTERA_SYSID=y
+CONFIG_EEPROM_AT24=y
+CONFIG_EEPROM_93CX6=m
+CONFIG_ALTERA_STAPL=y
+CONFIG_NETDEVICES=y
+# CONFIG_NET_VENDOR_3COM is not set
+# CONFIG_NET_VENDOR_ADAPTEC is not set
+# CONFIG_NET_VENDOR_AGERE is not set
+# CONFIG_NET_VENDOR_ALTEON is not set
+# CONFIG_NET_VENDOR_AMD is not set
+# CONFIG_NET_VENDOR_ARC is not set
+# CONFIG_NET_VENDOR_ATHEROS is not set
+# CONFIG_NET_CADENCE is not set
+# CONFIG_NET_VENDOR_BROADCOM is not set
+# CONFIG_NET_VENDOR_BROCADE is not set
+# CONFIG_NET_VENDOR_CHELSIO is not set
+# CONFIG_NET_VENDOR_CIRRUS is not set
+# CONFIG_NET_VENDOR_CISCO is not set
+# CONFIG_NET_VENDOR_DEC is not set
+# CONFIG_NET_VENDOR_DLINK is not set
+# CONFIG_NET_VENDOR_EMULEX is not set
+# CONFIG_NET_VENDOR_EXAR is not set
+# CONFIG_NET_VENDOR_FARADAY is not set
+# CONFIG_NET_VENDOR_HISILICON is not set
+# CONFIG_NET_VENDOR_HP is not set
+# CONFIG_NET_VENDOR_INTEL is not set
+# CONFIG_NET_VENDOR_MARVELL is not set
+# CONFIG_NET_VENDOR_MELLANOX is not set
+# CONFIG_NET_VENDOR_MICREL is not set
+# CONFIG_NET_VENDOR_MICROCHIP is not set
+# CONFIG_NET_VENDOR_MYRI is not set
+# CONFIG_NET_VENDOR_NATSEMI is not set
+# CONFIG_NET_VENDOR_NVIDIA is not set
+# CONFIG_NET_VENDOR_OKI is not set
+# CONFIG_NET_PACKET_ENGINE is not set
+# CONFIG_NET_VENDOR_QLOGIC is not set
+# CONFIG_NET_VENDOR_QUALCOMM is not set
+# CONFIG_NET_VENDOR_REALTEK is not set
+# CONFIG_NET_VENDOR_RDC is not set
+# CONFIG_NET_VENDOR_ROCKER is not set
+# CONFIG_NET_VENDOR_SAMSUNG is not set
+# CONFIG_NET_VENDOR_SEEQ is not set
+# CONFIG_NET_VENDOR_SILAN is not set
+# CONFIG_NET_VENDOR_SIS is not set
+# CONFIG_NET_VENDOR_SMSC is not set
+CONFIG_STMMAC_ETH=y
+# CONFIG_NET_VENDOR_SUN is not set
+# CONFIG_NET_VENDOR_TEHUTI is not set
+# CONFIG_NET_VENDOR_TI is not set
+# CONFIG_NET_VENDOR_VIA is not set
+# CONFIG_NET_VENDOR_WIZNET is not set
+CONFIG_STE10XP=y
+# CONFIG_WLAN is not set
+# CONFIG_INPUT_MOUSEDEV is not set
+CONFIG_INPUT_EVDEV=y
+# CONFIG_INPUT_KEYBOARD is not set
+# CONFIG_INPUT_MOUSE is not set
+# CONFIG_SERIO_SERPORT is not set
+CONFIG_SERIO_AMBAKMI=y
+CONFIG_SERIO_LIBPS2=y
+CONFIG_LEGACY_PTY_COUNT=16
+CONFIG_SERIAL_8250=y
+CONFIG_SERIAL_8250_CONSOLE=y
+CONFIG_SERIAL_8250_NR_UARTS=2
+CONFIG_SERIAL_8250_RUNTIME_UARTS=2
+CONFIG_SERIAL_8250_DW=y
+CONFIG_I2C=y
+CONFIG_I2C_CHARDEV=y
+CONFIG_I2C_DESIGNWARE_PLATFORM=y
+CONFIG_SPI=y
+CONFIG_SPI_ALTERA=y
+CONFIG_SPI_DESIGNWARE=y
+CONFIG_SPI_DW_MMIO=y
+CONFIG_SPI_SPIDEV=y
+CONFIG_GPIOLIB=y
+CONFIG_GPIO_SYSFS=y
+CONFIG_GPIO_ALTERA=y
+CONFIG_GPIO_DWAPB=y
+CONFIG_GPIO_A10SYCON=y
+CONFIG_SENSORS_A10SYCON=y
+CONFIG_SENSORS_MAX1619=y
+CONFIG_PMBUS=y
+CONFIG_SENSORS_LTC2978=y
+CONFIG_SENSORS_LTC2978_REGULATOR=y
+CONFIG_WATCHDOG=y
+CONFIG_DW_WATCHDOG=y
+CONFIG_SSB=m
+CONFIG_SSB_DRIVER_PCICORE=y
+CONFIG_MFD_A10SYCON=y
+CONFIG_REGULATOR=y
+CONFIG_REGULATOR_FIXED_VOLTAGE=y
+# CONFIG_VGA_ARB is not set
+# CONFIG_USB_SUPPORT is not set
+CONFIG_MMC=y
+CONFIG_MMC_DW=y
+CONFIG_MMC_DW_IDMAC=y
+CONFIG_NEW_LEDS=y
+CONFIG_LEDS_CLASS=y
+CONFIG_LEDS_GPIO=y
+CONFIG_LEDS_TRIGGERS=y
+CONFIG_LEDS_TRIGGER_TIMER=y
+CONFIG_LEDS_TRIGGER_CPU=y
+CONFIG_RTC_CLASS=y
+# CONFIG_RTC_HCTOSYS is not set
+CONFIG_RTC_DRV_DS1307=y
+CONFIG_DMADEVICES=y
+CONFIG_PL330_DMA=y
+CONFIG_UIO=m
+CONFIG_MAILBOX=y
+CONFIG_ALTERA_MBOX=y
+CONFIG_ARM_SMMU=y
+CONFIG_A10SYCON_RESET=y
+CONFIG_FPGA=y
+CONFIG_FPGA_REGION=y
+CONFIG_FPGA_MGR_SOCFPGA=y
+CONFIG_FPGA_MGR_SOCFPGA_A10=y
+CONFIG_FPGA_BRIDGE=y
+CONFIG_SOCFPGA_FPGA_BRIDGE=y
+CONFIG_ALTERA_FREEZE_BRIDGE=y
+CONFIG_EXT2_FS=y
+CONFIG_EXT2_FS_XATTR=y
+CONFIG_EXT2_FS_POSIX_ACL=y
+CONFIG_EXT3_FS=y
+CONFIG_EXT4_FS=y
+# CONFIG_DNOTIFY is not set
+CONFIG_VFAT_FS=m
+CONFIG_TMPFS=y
+CONFIG_JFFS2_FS=y
+CONFIG_NFS_FS=y
+CONFIG_NFS_V4=y
+CONFIG_ROOT_NFS=y
+CONFIG_NLS_CODEPAGE_437=m
+CONFIG_NLS_ISO8859_1=m
+CONFIG_PRINTK_TIME=y
+CONFIG_DEBUG_INFO=y
+CONFIG_DEBUG_FS=y
+# CONFIG_SCHED_DEBUG is not set
+# CONFIG_DEBUG_BUGVERBOSE is not set
+# CONFIG_FTRACE is not set
+# CONFIG_ARM_UNWIND is not set
+CONFIG_CRC_CCITT=m
+CONFIG_LIBCRC32C=m
+CONFIG_XZ_DEC=y
diff --git a/board/altera/socrates_cyclone5/linux.dts b/board/altera/socrates_cyclone5/linux.dts
new file mode 100644
index 0000000..f915f44
--- /dev/null
+++ b/board/altera/socrates_cyclone5/linux.dts
@@ -0,0 +1,92 @@
+/*
+ * Copyright Altera Corporation (C) 2012,2014. All rights reserved.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms and conditions of the GNU General Public License,
+ * version 2, as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope it will be useful, but WITHOUT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
+ * more details.
+ *
+ * You should have received a copy of the GNU General Public License along with
+ * this program.  If not, see <http://www.gnu.org/licenses/>.
+ */
+
+#include "socfpga_cyclone5.dtsi"
+
+/ {
+	model = "EBC SOCrates";
+	compatible = "ebv,socrates", "altr,socfpga_cyclone5", "altr,socfpga";
+
+	chosen {
+		bootargs = "earlyprintk";
+		stdout-path = "serial0:115200n8";
+	};
+
+	memory {
+		name = "memory";
+		device_type = "memory";
+		reg = <0x0 0x40000000>; /* 1GB */
+	};
+
+	leds {
+		compatible = "gpio-leds";
+		hps0 {
+			label = "hps_led0";
+			gpios = <&portb 28 1>;
+		};
+	};
+};
+
+&gmac1 {
+	status = "okay";
+	phy-mode = "rgmii";
+
+	rxd0-skew-ps = <0>;
+	rxd1-skew-ps = <0>;
+	rxd2-skew-ps = <0>;
+	rxd3-skew-ps = <0>;
+	txen-skew-ps = <0>;
+	txc-skew-ps = <2600>;
+	rxdv-skew-ps = <0>;
+	rxc-skew-ps = <2000>;
+	max-frame-size = <3800>;
+};
+
+&gpio0 {
+	status = "okay";
+};
+
+&gpio1 {
+	status = "okay";
+};
+
+&gpio2 {
+	status = "okay";
+};
+
+&mmc0 {
+	cd-gpios = <&portb 18 0>;
+};
+
+&spi0 {
+	status = "okay";
+
+	spidev at 0 {
+		/* spidev causes a WARN_ON() so spoof with DAC compat */
+		compatible = "rohm,dh2228fv";
+		reg = <0>;	/* chip select */
+		spi-max-frequency = <1000000>;
+		enable-dma = <1>;
+	};
+};
+
+&uart0 {
+	status = "okay";
+};
+
+&usb1 {
+	status = "okay";
+};
diff --git a/board/altera/socrates_cyclone5/preloader.bin b/board/altera/socrates_cyclone5/preloader.bin
new file mode 100644
index 0000000000000000000000000000000000000000..ff7993386fae9a7c570fad0654beddefd35771c1
GIT binary patch
literal 38176
zcmd443wTu3)jz!VIcM&ZWO4y=1J29 at 2uYMlf{LJJm<fj at 0|Wsrf^AO-_C4XE5qhCj
z%W%<Rt8E~nka$6{Zvk6Lz*M8g31C}mYu_0zEtgsbkOq^gCnRxB63F@g_9Q{-*Y|t=
z-}n5V_xqkad-nD0%i3$Nz4lsb?_?6vk*2<Q>A!O#(e)g-T(|-_51dGKeH#4r_e at Qh
zwa8OQNa+MZmQxez@)AO`cM!r{+pz!lwqM&uTp1yqge09GPueaXC&7zEoqXPrl>8ZI
zZM*15qMyA_UcBT;vVUeqxpcU%8A<1;B-3a0a691k4(E^4r<`Ywklh!@B$+>BWlr8u
zZlq2V+TqX+XA54W)?mC1Pty3$IAidlCn at Q(M0NN1vFJBZMfBzW>fQ^Fzf>BYcR?Tj
z)a5%CJavJ{vp*rx$1V}M;=CX~cF9a0yOcn7pTESBetpA7m(ic|cSN7ZH&0y<)NfuO
zfYZOLcO=aoe({ni{NY8i;HFRRC8VF!wq6bn>Uzx_Ky}-Tmq_idOQu>2>bdtKPe|sp
zSub81zhF1YZ at Gkc$Fv2(3pq$53wFS5xs;v!;-w&&b%BVxFH*ALJQ0Jp2qaiEpzG5a
zywr-DJ`u^ni-Zs>zOPr48ZWC!8!wCE!V8+NcL+D+IY{GW2ibU87|tWeqxg<^YA+Gb
z#!KqYTQ5J2`4AktFJ`dzJi#dO)?MNjY&lOBY`#>XZs>gwZZY!tk$iFUr6pg9*CI}D
z$bb4P at u_HIssm$086s|sw at 1ZblzMhw-0azXo_M!k61<z?Z@S**Rg8sr!#Y_I)}z6&
zz83>dgMZ?2U1#t$H#-8EO0tQbv^X>5V at 7&1*_A01_4k^&g{W_8L_MY%)VbFT>esFr
zOHJjqKK>YSreqpaZcqqNlr^`OYz*t!J9Pd1R?P9$LER9jQ1zlrd8u5l_*9-FV!e!c
z3=tC6r7L?=m-uY~NAvChp8nKgDJxe<zU`w@Ws~ogP+J!j8ZuKdveKu88qztbtKHE`
zLdWMVcd&0$@YPb~xH-9e&j9C6x1Q2Gp3S})A^6@?nkce3*E^~BCZvcWe`R!WR(eBv
zK`1LTE9-qt^t`Wm2yzIklhyY`vzBIVrji~zrh7BZt;PVW-59T(xU#G$k8ebAr0=YJ
zV&Gl{?TA0|-Ok!&^|5y0L^30^FrDkti&D~4GIK)<GugMO!@=@K>Tom*Xzy=2$#S&v
z<qH+$i^MhD3i>1jmR9>zFSoREX|*fv<4epP7g$o=)*W=j>tXToMb++};JQVX!}%<(
zdim?|_#B*JxuK!&9~`MI9ybRp<x4AdSAFGD#nlrmS}HG9d_BPw=DSn}x0KBo+8NbW
zM5i?y1Hy!{az@U5z>FmW=}mm#qe?!IEl+C=28VEqkf2WT-wc_G*EOGYBuZogKfrZO
zl@@mx_@^$<B0|Kd-r4umWhddHieylCUVZ+ug;1xdo=n*0&6dpdtR(H{x>(8F8%l1z
z`q3w3wxHf!RAuJXyNgpxc(u5w0pa3!IH at Sh!mCN~u%4V{<yAe^R#JbE>r9<RC)037
zX<n4xWDb!6!*Q3CFO4qc)tj%mqN4PtCbvCHNNo`Xhnqx2w?o}fA%qBLp5ahyScnP;
zc@YW{ZU)Ka&e9nq>Xw#_bGH~uof5BFuNil8jWxih9gphz+i;iQ9L-b-e<HXyE6H<H
z7(OIqB{*e&2Una}o+=+%xp^fE+Y$Dy<X0}_eH}-+qt&VYP1XL6O}wdmmMYRz*(npZ
zTV}ZW+=3%|E!@*^JK=aG72o<X+o^JLAWO+GWZ8&oqnu^nD-#1pWM5^La<tpV!4)4}
zZVPN$o~7_uhes-pb_cml`27R&yv5vd|8j;OU#<V9PgKb$J=K^brAcF@%yQx;B604L
zwo9q<ho5lt!%qZit+Umc>r8c)I%D038mUzzOBc21v5k65S6WhUM3IOa<z{=o(AVOd
z|L|VXr`opjE^D1>J9U|##&_FEogS;!KhTIbp|SO{`uLL=o1-}`=gCF|Yvf6t-q9bi
zH)5Tr#&;4i&ct$F9Zyn}%qB4}H<aWe(InT=?oCb$@^bU}aC*KuG&Ga6go at UZv*udw
z5`WE{0@PazJoUg=vHl)wv;>k|ma<IQ2Ds>McTbYv-;?Y1t3KW)Ta;ZsLzs&Hb)J1g
z at XdihhH{`RL(Wou>bnwot<0>v79gtZ<^4mYFGpT2<(0Du`^(N6GW=BLQSR@Ny=68f
zD<R9^?~$v9%AJV3ay^Z>htfWX?4EbC!n?_KT1TB$H+6A!L^Qkg*pk7CJsZ}!Ri5{&
zR^CfV&-xnP at 9ud7ef3u5%Xvz@@72h*@>IpG>L?=u8&Z(=Qsk+4S`yOC!)eb(o<N#k
z^$f><9(g=oh7QMn9P!+ek9th_hU16o-q7>tfgi<7u^w>4B{%e}J at 5mT+Oq+0^HvSD
zxuNGj4tzJBs#mdEMpExPP*a|))C8#Non`Znq~3L44fdQh<(YtJoo_==*@0Dvueu(e
zb)Xt?g1sdRd&7pF+YfvjbvM`>1b@%^>$Ti`pc17juYWc1z_$?p*7f+f1K&XW8`tBb
z4=h71yt)DK+r-0N at 4Mx|Jt$eBQtVlo%E2x=b3>2*noyjfupS(W$78R}$Jbe)7k*G(
zzd8cB4Lu#NmCmo|A?u3eV&zaT*|4GK{A;sW*@Tj^EZ{@3oT>;#tYxnsGqA|tv$Z(&
z#<U&};JXzt8!5+n_)qjuSjW<)0{f<xQ+2~EtDp6!C|-Br^}6NhBN*^ypLV~N7a)_y
zgIaIY?urV)VWa)_ at 0#JK{bIk_4*xxui#S*uj;#;2Hm1TYhPwk!hI<5VE8MS`@3=Oz
z5x&D`cD at dO%jX+|Z^C~Et_@B!ZxY{w56}EQ{8<iR)}P>q;ZDIVxa)|%0{-2z1 at ayE
ze#1_(9{$Q-7|4 at YXSq!Yf$_uhJ?piqY!aR-=L2KSz{Y$<kLlNllejsFh<fb6H9gjO
zjfjRuwKa%3xInssy)nMWE>LRXaiW at r_FTCJJdPgwR0lsJnp^eQWu4^qh4t7!b$<L3
z-;!D8R&zP{70d}{>EF6V*b9S^LH&QL+_6F3Z=o&%O4UF%dH3`_TfC<?xGqCsvsW``
ze6FL}ahj-Cd7|=UPw&&kx~q+3E1SF<y*V8m$1pJ2p8>khTZo!Oco&^q(XpAY=<uTS
z_F}G|TyZpKD??>zh;wD&TdUt3%EUMS+VV4Kx$Sz(giLET&-+#N at dE29Q-JS$k6WZo
z^(;_!&WRq>V;A&-%4v)*Iy|WV4ZNYF**ez^ia>d{tj8YE^;l3hmYdy+WH)AorBdt)
zsqy`Zga>u at -89fv^Ss&McnqCwh74&XzI;v>CF;~;o8jxRwK@@}wX*tu62LAqUyvSe
zOpr1e2eLd<e!RS*=gx<cWm?B=H?%xoMeB+CoOZ`{xPz(kQ!O^<A2i}P3-<@pz==mH
z9x1zBeq{bRE$8Jz`R*3%BMwv4a=pw4DD%(u at 0N~oQu(`OjNZ;rij^}O@wk;4^2L?K
zGG8lfOK6eTnD5tPbbw)&)?cMiX=N!d?@<H~FF);}ZeG5q)J|hz9^pOJTM>4zDnM at 4
zDptl_Jq;;)R^7o;;^B+&uzNMjty=Au&5~i89{Zr*u*;aMopvg-RF2**pI^!RLU}?<
z<r)@Z{f}19Ei=pFN}<p!%kkgctEV9xT|FmIDideALVBV#jlIzgG)$bac3Nne+;jRD
zEibJ(+-;`2duKYdX;eNRj|m<sJ0D=_EL0f}%>oSkYVe`kWsl;8Unt)aZ$0?XNDtic
zTu}|yc;vB7Bo58x(V-qrn$P<9i!~l)Vj1=3l#<DP5rb?{TxFBJWO9Gx(i-P{k1`&4
z<FDss4d+dGAPafv$ji8%mo}Vt{{y3tmyEpB>v;*od9CdvwA&ljWjHTf0-+=b|5tD|
zaHVi7;LLFE!;!)9<WKO!a3|mdxHPynIAD%=99WT3X2rRLa#k5B#Gz8sA91hY>r>@D
zD+T;=^+WW4B5VeyWe!ZkUi5PB%#>Wv+9BF+WE{)SuwGE_DLB?XJJn<>?{ynySxaf*
zd)<E$4C>JVGw8Q40C7N}L49YyfEWwCG2m!r<MFP4lt$sRaU_&Gnp45KZCqq8<?_>%
z+z=62ZLB8t&GQ4M;kwwYvXrM$3kk8Yv3l6}Gtq}ErNNYPA|o)=m-Op>d30d(4So6E
zKx!Z*3QjWKV&cDTam9c=!1_Ma=Wh&H!D$`sK9YLM%i3k|9~r~P2+xHJ!tI1(bCQ9+
zq$>{4xx6sVO^7VgR?lVQNxR;osRJqT`qQFZ?wE*UxG(>H^y3CBH}qx90EyyEZ)W{q
zxWLB01U_s3>FaH`byLTZLo_$>U)naPT7N1a!Qje9H|l?*^>h7}8(?>;AMJ`aw!L_`
z?OOPbW}I at 9$CYww{~!xxBh))coLTU@;Ag`BbTD(S9{b1O?g7D_Ub at T9sUHvOvB7wJ
zRO#rsEafax#^|g>YUwTuryfWA?s(i0kN*+zpT^?}rLC78URLJtyCn3)k97SNxDZ?v
zZu8%>{B(n^XTh<v^eylgz^#OHU~jxMD9jZ>t0(C)ewXXJLDk;}jW#z6f#<Q~p403>
ziqp;y`hjaLx?YMrUaXnJoTs^=QE`2{Op(4lS5Pws1vL*lGnI&XStCv=67^&F9Q-JJ
z9{%4nK~2XF{u at n?{R*yL8;t!!7u3XSMEyrUaWdXty{g9!B2BpFR#H_iX~8@$oUfcR
zjt{$)ik_Jd%_}D&<4N5zQGe6tz4At7SvhN~5#hHB=ajSd_V@8($(0`^&n_qGD}8J)
zW90?)%vHB?+QgmASI!tMsBdUDBkHaFBl{guf7UOkze68Zqklp4x9#fCm_YyHWBT3j
zn2rpO>0Ok0?JBRD`ynssXY-h^oHeF}CY4UYTwlD#exug}^|`AP5ITDe^u?pcTKceG
zHt}j at pP>Hys)(FF11?+pNNx}KlgImL0>hkB_%3*rs6~Al<?m}=jO+=t@@&6b8eMiw
z99^!*{8!!5sIueYD1`64DyY?0({MJ=YV=@jJh at WW+k!*#p2mkT-)nXKGMv0l*B`_D
zZ-;vk?oGI}aNTfikmIzDhMW^Jo%8TL@EhT7f7=z{ax>&nr}^9&5fMDIOU;gREH0cb
zeQMiKxTkilPZbeP51f`KL^p$PxifW7?}kPHT0T=wi_*zsA_)PZ*slrM-YcIJX2$6<
z<AIKJ&*Hc|E=+INB8Dh&8UlVzbeN@@ITTn&LW?n`1#nF6G_5&7B9kj3x5RswjNUDe
z6vw$25i^b%2FLD}2V-;eTxl@&HQgYk{7bKV=sj!Gr`m^o2Yl+99%bbx>W#fW+|YNN
zVTT`_I*&RBV at _}~gRykf#mc1VVs8Iww?bWh)gEsX`{+>Hssny<;EX&Pqa7UqJ-uPH
zF6=@hqou>66{7L6ii}gDaQ`}1KClSVq{jZB>a{R9u<@Il4ZxGes{-gJ1s}@?EG{OO
z<AXzUSOWPRcsJ}V#!{Bgsr6Td0F(3as#_x=HouclcBmY6r^+>7;e;6nOhO`LJU4x!
zNhZlIjlwEz0Vhq=p9J|SG{jCk?)VwB1fdm9lFy%^w?7<CRr=bGc5~}Uek}5}GCJ{`
zrqxz-oXC9FdrrF?wPH2vbJGip{Ij(5f;?%_?2IsYyf%komKVU)!iC}fj(vK?B$6wf
zp)==(SxjqpsL_g8gcduBF1Dws8;B_~5mW)a=r9^b%dMBS$LCn+w0c4~a5^M-P%JZa
z@~LKUQR7NmaKc}tIiqbFiPFMYyP%F2tR?9M!YM=NCdeztlnK$hHJ6wc$dpad-9E!H
z?2_KI2W_(16Kl5t^D)9aHbO%<6C+GPU$n@(?M4QLc>7djJs=^5qeN770WJ+L8_oge
z4&;>PlsTID-aAvc-kOCeORxs=f9m at J>x!Lx$Csxlz=#mTN`{TuH^j||XWS5HYi;xm
zaRKqv8{+I#;kY5ra4s8Xs&#$lCL1UP+sDY3u>QzXx_-xx!}?bAS$#aLYj9 at 7)8IUC
z)8KNE$Ab&t^J#<wZxmmP_?FQau2gUmm!S5&$@rq0I6ssH`kkKSh*;)Y1J<(VeA7bN
zk|iKYuN=%&1eJoL$(Bv!e$8IsXk~KgxC~j<buR}x1@}*+y)*d2YiYy!fgp4cOiz#y
zguI*VzIgYb-p}ONhVoOI*CWhGm6^|%n}O#zeYC8A-eEP|=iOv8Ta%l+$wu^<n43AQ
znbF|-&8=yhbjV#9-;`aQ)^bM9s9aLXVB*EP2og{8CbQrPnm74o9@{|-y^U_ZcXt)v
zvp(nbUh@=l#GuYJWLanT1n<TPpU?N_L|^Z9Oc5eSyX`o`lSSExr^n+~#Do4c#2cq@
z$hYx{2uH8y)%uNyd#4!VdH$Z={yn|xQ)%?Up7p62GA(Lt_q5sqybE$G$mGD6VwEnE
zA^qCQs~WH6o5H4m?#fc?<;=>Z@)?<(H%lEy^b)u`7@dTp?(%VW`S^a)eb=nB{<8=D
z9n?>U=aEc3q7zrLR7YqL-`nJN<ng`Ub*!JP9~ttMNX;Ba^A;k+VL;Xa2Cjo~7zpZ2
zA<J6Q6I{$-;06p1egy^xzXF4UH^AWFS731Pzl8x#`Z89>a?DO5lNFBiCCKLE|0jL%
z{(lY^;=)Nh$ANj|<1-a}=y11<zSO%u*)H?F<a*4En0Fm5Vlyn{u{lncKaP-`3DO=S
zO6*&~$@d1U=+qG$7>hOay+NVivj_)F%Z$$jb|^L%EvCREq!`O}U?!8Kn5Q!w6{b7n
zR3>G%LN<hQL1HN19A8hHecZ8BnHKlAGaAC`VDbY<b)?O#-%i>atsLohg6wNy7>V9o
z$4BhY9&_&Hh$EmwbCuGv=gP;Bup|TsVtnsMRU at hYL@G`WPEpE0 at 5c->ImA1l7p!;3
z<1!D{uN)I(Sa1TuHO;ikOk8t+MvTL40=p(O$1&Zg&NOCOrJmqD4AYB&>CIok^yaT%
zdh-pK-ux9zZ~kvEJrmM at TDZ~I8mR#tV*N9h66a4DTmXY;)yRAR1}JBq+=Z1nRE`T|
zU{;Q5mnYWDVPj(YCY(9rX&+D2W6xd_C3aTOW79)yya|wuurfBxggJj8VvWNurD at NV
ze^!Bqh{qsrmy!XsA6)-7JKiTd`o-YI<ZEXkbz}RM8T}QJ#>er4q9-ILKEJs~z&oh(
z??kCP=Vi+IpjiufoGe}fPwinbk#9IStzt$zhlOt~v&rW)wedmsA5o%sKIE&QQ{e05
z;s6!Xhie%5x{4qA(#qT9?+kq*r^@blsXpXYs1IAfwbxDvyocW`Wl1&3Es8MR-}k_C
z at 6`qOP+1;jSvgjUNv{n5HoaEok<N4!T-@KP8(F#aBfX)h<%h$)aDx|tqyV&aD(J5O
zIGEvt0{C!59HP&RHWQ>1q-6wZuotl&=Er+D;o9i36v(gi*kV0xzJO3M;KlPP^YZ1C
zxetq?Y(}1hzK-PN%R^~*pr2n&E7DC!V|W#B6YY=mi}i`k(c_Kv(ncw<!Per-27lzb
zJMaXdpzw#gttLj}4|m%QS<37la`!KK*N<AFVANzzPp!8>nbQ-T^UL1#V|MqhcW||Q
z9qo0vv34dht(=$7_G3L`58NGirFVVWtG(;9;`>|Ow%K<E<{kr2(fI_wteWKeBc+fT
z8tR1YdhC~1ZwrW6(Q`#$l5k5Ym2W9qESlw)de7ZuXvn_ZCKmxueuK3s)Te}hgSD89
z-}EUC{5DQW!f$j+B7VJ7(n4$>T_%~K!81nlB_TRP;-a*HM7f5!Xu-+2nqAHgo`;Ok
zVe_)NWIC+_?X30;)ZvKNmmaULaY{nGZu^&Yr`?Bo3sCPJtlsBP?{j4?7i8LlPSi-O
z<;#?#naMJfIS)yXM&_L11cN>C4B-RAm76~4_8FxlX`4hR5RvRCl%`7oVCxj!+(bo3
zRFFK96Y<-wk{v`G$rXV^pGW9abHV2kj!CFCX;|Bqmf36`Cybsyrs7w=3CBjWk#=qY
ztUFtVq_aH(qPtkma!m)H2$^nRJXW%!9C8Pl>kTf?a3(|gwP9_lY!8e@&Ymyq{&e_s
z>R;Q<fkA|{))CxgV;UI`!*e?uSA0C`{GT)$B~x8m!$(?a?MK?&-Kj04i`r-unity-
z18;Saq#w?!=-4QjLlr%a30ca75<}1WNlO)+2*d`3)`8Pv9Mr=6I5wsFe+wNa!yvBC
z2VUvr-t{RgW~}>dx0U}baMa&ZJBx8#ELGUf*D;J;9$+}TyqxWZhHc-Rz2ew?Wfp~Y
zK2FQ3$>e1b4=~TN-3-m-$^mnO19)MnuM{2fJ;1zs%2tUl^=_;@teFMYTN*ZsBw7S)
zysPY9<UIP&VXcQ}Ib4`WDvci2$nF60%yK#CH^ncN-vBnHgx`o`>Kk!PeIt&kZ^SY6
z4YnifN at uv5Y>slfjM2%!D1H|g6?T!RVHd0GcGlyaVh5$CfmhTE_&DgTJKKe!)%I`s
zpzP~B*?Zk~p`?c_&IXUh_|o^ft%wIp(hz5S>3iKaArWE5mk#CCmKYIdd at 0K->DgVv
z)^D6IO*8E(a}T=Q@~A*r6WeDq74!*Og{(}5=Y}ZjA@~GOdI%cXVVP+h?*$9F5l`Z@
z5V*qd#SDJ+#<k#RPI3!#tqPqX%3K$d+iDTUp9?5=xSUZegY<YKPF_7sbLL%lPV3oD
zoT;+mfF3Iz$d#Zu%F$yl_X|%84N3X7Q;_9MB+pKkXl;?iJ;P%aH4b`PrZ%zMhfk47
z=d{;fek?jw5*h&61+-YGyU<RjTCRLQ!(6Z?oEu+v5BGypd6l}Jx(t!E#BFD_JT*vi
zJHqoNGR3QI3zCAhkz7gGr^jB at O*s$tyj|mzES<!fi<0;ClZkZF2eYe=e;~2dYKYVZ
zNX}SUXke|e9@D9M>}0>W0IiNTM4q at Iw?ZWrI%%jE)8f70o_*@FnZtNotQY0zMIb^7
zyy}(UQ2XB+YX6~JDY1mnjIsS>5^Aww-C4#@x$|_!*Y26U;204vL~U4)Lc`l#jwDdO
z1$-Cfg}Q_Yy{$scup~{f44C>lG5*_8$B+A24d0YV&iC5s9Y1f+l?sviNWbA#QU^U9
zgKk|qdZfoV^ykS4z17;4VSNm6G-5>Nf)^rn(GR4z at g1v8j*sI*&0LF-m`6r(>6)X7
z-j;FeuiD9!Ux#09FK7|=G3dnxO->T69G5GxKIpOLJ~om&r11rlPB|fu(PKk!`D%Tw
z*XUG|+ZkpMWHcuc@*M^bXT0^v656&7!Eo<2v58I<!RIFCkm$!*d4YRMzGu#sy<fap
z{DO}={hwdFd24?=ac4+}e8MqW$Y1$>s(G>&!7Q&OIjJRwU?oMTW)zDBeZT>FyB at 3R
zV{MJ8&|@8aj)|-XG>2gj_w>-*xg<7stFL)lfCFE<Q+AgKb)QD2wu{o3s3pMW<?XKI
zBzz|@EE$@a4Lt*|xdDAgI|-Rfv4>ziWWyiPO^D at c^N+DE;#zC)3rw3lv_^vKnC^}`
zGti&Uu9BSe`NhgIh3zymWRnYcEs?r>iSFQb=rPx|LdnxqtQ1H~6*_&XO!C?xvtzv8
z9Zgnck-`-(!U>+DK0{O&c_*9mC7LLipq(A+mlyqFXKA*sX9YaqZD!5QTDdgaTb>kw
z^@Th$FuCdWoHY41)Om}0Tyz4$ZiJog^r*jul}K)yhP}uh&B1R%luVc)kCN#OXu at Sr
zAft(WcdMI=vTt1Oo68Blf4P?|_rhoUS89Cs@(jl;O%kxD2zy$PkY0z2>sjw?iu3kF
zok>!x-k#tB4z^MbP|T({Z{OB!C*B^iARBQ;G26PWhzGrCh%<`W)@>t+2s4T~lvnFD
zBF-o#%k%c^_A-trPB9(4>;YWj at WB4a=pLhac7z$tyXg}hT2Wf}gp|;*U9vxKYnj9L
z?nz^z=L|L$DaVz3Ikh^goYcMJ%Q{v(ypQjR at 8kS-4*OQ3#x;~mcS($E)*<tRUP~cy
zzGkvw^X6mMKHpAv4Z3WB+d;95lzb&TOs$1zE-W5~Xti)7tp<<C_HZ_TjM`RoY_eE-
z8*`p(6ncZ-5pXs#)w0u(ahrghGv@_!#4@~7yN7q`ky8@(9_-*uCNgwN!v2CdlZgzS
zlCZx(CNgwN8p>lbk)cx(%LDItgG?k#F at V;HF8jV&np;eZ|FToe7ZITWE5&N8Kc~Ha
z at as}T=2-%Jqn*<w^DaH+=z}hJKZ6e0{<S7rXM)9zX{UgkUk_NL#S(qSw6jPuB7VDW
z+i7Vy<+ar^d8@6#Ybo#Gtu;;ckfkkDw$C<4j5~?Tyo<G^$3E6flQN)_>hq_nG|9f7
z3;Q&&#u!})D?l+%2&L^u+(A9d%;wxrK~rsY;*{4TAGOn&_E#5alRRR+F_N}_p*G1O
zPEHT`;wcp!<yK=jZ8$$YRIXAhnR1E2*W$L8^#t!_e05m|Z`lWKx<#56H8fZ{d5+D-
zJz;h-y#;&r5X>1Dlqs(c2=(}lpMGuo$#!z{obZh>$RD_ItRz>85a)v(7CReL+I|UR
za at Nv9jA3$bgmK5VIzz+JuJQb?*@sWx@|9WrZTpwA8bWxOqrfcI`rkl&n4^f#>VfuU
z(t&oyq5rDgxQop~k!0Gb$G$&k+hu7u?X_)d>ffjyY at aa<`$G{Tj*Yf}*D{3{YED4-
zP{a-hJKGMlBTmHJS0f2sp2Tm)!=pk>;{sQN5 at bHgKi6&ttl7-)kvQ%~rbHR^SxR}N
z7rkRLyf1mB>-aj%D_tKMc%|zjLmuOmu8(YlSIUa7{47HQ!#aDp(2y$Iu%l;#lAj at t
zlAD{TlXnfqT5-O<aNZIRzj4hY{q6kl84c%YcBW?Xjy(~3JrUCyj%QNfecEexX)eb-
znoE8nYnSiMkV9hp(VHQgWX}6MLh=pu?}un{g(_P3&g1Jokd`@)Wp3&=aHj31U55IF
znTGAz`?*fYWa=9-Ep_IG1)8^DAl+CO$4JKz-u)qSfhOL8{CZmntA*>VN;EdWCdF?5
zQaUnBLG6%^WX7c<jDi+jr=XC9a=sq2aD;*$?Y1Hw^o>wZ$TPSR3ObZm>l>k<ED!v>
zkMZ|$IHsg1YfHxG**|)VaJ@|~Q24b+P=@8FC`Y=+C$0tUWs=$dsosq1<dUYH{GV;}
zNEb=`pKWn%32V>7plZ*u&g}`_$7s)7oR>%T$uA||L;ECVa+tag?UPJub;B&j>A(%M
z9H#?}O2uaxw8|4Of>zmIHPkcu_~%ZZZ^*2ly*E at Z4Php|?S+zOO1hBJC7Gve=y~xq
zwvs2u>E8e8wQGv6UFa&&qX`Yg(3 at l`)=mq*t=d*nR|zdbVAJe$nLoR6_Uo|Ppkns$
z{>fx_Ot#7Pd$xvOi=S6a(vyu(NF$sXv)hAxBV_T!e<P2UDsKXYH@Z1>CdVY7STPHk
zB$Dy28CJIIz^;;7{eUZF*w1gDg>}MCwk&4e&Q=ne6CY$VY}aKgj`1NZm%-UoYusko
zF4RrKd1ElPgz329|3iNq at _{VqulbV<o|Z^fbQ(^@w*7;#*CAi%i5R7!{X7|vW|9_0
z3zP86BrS~gnH%Eg*Hm+qZ!kuM252-JxTq157E?o(VyUw<kcnI!*DyYxocf~4+QnJl
z!imEXzPV+ZR3<HiKJ_oxUT=S^i%Sy1EQNwLc3q|7nDgZ3FCwfjOPOAFz#}D|zYl#q
zTkU?E^)v;oGx^W|^Imb7)d1`dnQnoI6&=Au(rFQ1BJ at iNH+-sw9E@gJXY~Z{V%TrH
zeyaWw_y135Iw0$c<^~wO&z9eSM1Gp|T%{g+LbG(46U(Gmq@OU#mov<LxesCN<_N=*
z94o^SLG=o0=-HvK>|uw#a^635!+HPE$nHG6haJK^I{xLnZ;P at s2E*g{`5m~-a2q>z
z8f2wy6Cq=!g%8bcicE;}79 at 9i*d3o6l3yI(VgKLHjs>%m%w|WtT}od*U7~JUOX`?3
z?9G0XYsKEq+i;?v$Vcf!CQagO9L~{P-G~3M$5$ciCtG_X{a)8>lhWoHr2-|#o+Ff~
z7NG#v)UKWlK3|V_ZJu19ymGLlgOu3I3uHPWMG03cE$rq(p;Ux6f7CBXxh)=PXrI2=
zM<DYPC3Xvd!H2cc61Q!vZ_HBclChRao`~D}Ytfa^Rce_HPPGh<@u^ybt>JT8+rfKK
zgRrXzSZ%vXCRttup8#pWQ<t}r>Cz0z2tKI0&(aX*K3n#H13DJxKG`?K#p)Q0eLi5C
zI67*QuK1a4%WQ2DPGfh+c}a7qOq(Rq+rYC;QE?8p)QLC$J`!!GU%OkI2(Hr*xmTMA
zt|uMkCVCjhDdrDznm7M5!Z+L|ozv0}G9J%Vmx~oGN`2{rvEu`qaKnUHj60oDxdeQz
zwY<tsvTRnKAMWekCdPF=*kMX!++)iA$>1I**D$VenYpFQoYW02*ivU|c+q$KqcKrt
zoyW#S!yBaw?HgJcx0b><U+}|*$k15QL;m<!%u~9+{{fzfY0=x77HX5x|6`Ha+T`ee
zf%}_`FaC%xn4bntdNM%{InsVN?f{ATCY%lgoKn+E24g}W5$)%{8BgyHv-S4RNJ;~7
zTI=bgW0`2v^G$6M$;zw)Z*{w5>Y}DMLz&oX(0U%YDjwWbkx*x-%Y2pVJhm3L4Q+hq
zM!L|EvX{Yjfi{t}b at GXKX<qwX;GwcI*OgRsJf4`?+jw(gZ}b7iP5rssmiSul`f=c@
zcxKm-UNSyc_y{2ngSauu(vJGLlPqPKZ>Yqdk%sz-;l;MhKWRk%v2Sn4B&F;%Jj+_7
zxAG;z&Yeh0m&`W{wQokC%iA>=>+i=|X+j!ooyS{uNmHboahpTLIdL#{sXqy8md#|U
zY}x<RWjmp+RLo<GwzuhnE at BgJHiy0`{jSr-2WBUph3vud4e2(?5 at q@$hVN``#n;%x
zLsDj!KK=MHF}|a;Fd32cZSd&nA#vhy$<$Ckd&1us23b3KIv8u}pNt!1tX<$wV;q0X
ztldYoB~7f&d(fs8ZDz;Yyc=zfiJIyyU3&2cog9R|Ngr+S@w*<)5;2CK_8U4+ez)4;
z>^T1rI~5qh8!`=1aiX=0T932?mu_RFYWnQ~A_}|G!GC8eh6Y<n1pD{#N)z<ThK9{P
z<5>Z}{MjG-hIaAHIQ?Mbi_<;W870B4Xh@zS@XWSoM4rOJYzL=)rWYE##%KhjZ@{x_
zv51Zne2yqFTOLLu%*_d)j7zF_w@~!yR?Qknf#kwkmgKU^v^Q9p2pR87y&E2~LYwM<
zoFW0aOs^KFU+gRnSpm}*B*twP5<w4AOJF;yz<I{!@?HAWt)cN^vSMHUTz08ks+h}C
zU_<jXq%=(P$Lu2B4GCWK1I`Y|#>QkcOW<&x6+O*q*LBBVYKxif7`otp(H3_`GRkyl
zlVCeDFJrD5_+u|5t~}`7Xpv18^7<la0c#F%Wk{Lwb#3%@4Q{r~p`4J%*0LEh!ZgYw
ze@mcy%v4OUH#adUPh7`L$S|H^KA5a)q~A<tLUQKK*Io1G6)S&}vn!WYK3DlS?3fSe
z)L8&5r&9-GuW3R-EHeALwFDP|t({&P^;HbUzO6A#ouMq28mb?}Y5F4J>MXEwujshf
zvhL7rkamH>vva;J8 at 6AsYJ14@W}!GwYA}<!-*(Pkhr2rsk#y2f@2luIOx?#B&fgZ9
zt{kh*Ygq!hA6Ku(qJs+#(S}b@>iKx7De+P{(AEeAzl$)fL0V*n(oo&qG!E at iF;l)N
z%IZmtI3ymLunYZs{j`>1aAp}MdV+}K;(8NWbhw?RWtw_VGF<;_`(TWR#Px5HPutno
zJ&- at bmhftB{L3uUg_DeXq_?!R4@r0!3>jQU>_Zr?L&oDPm`8F7DhlMkg0fHU2|}NF
zEp~WtFgCW2$&`$!^SQwZu-%!!)`N1^B%BzG?dfv|ILzVi at r|?M?@i89qW+-It?a5k
zQ(b1>Rk_ftPu>#Jox3Xayfc*uxz1FcscyinH_kl<vpfTL3i9Rj=qP;mjXsyMs5+vg
zRO7}?2W-;($<Xu7kX;IgGK;Fi!#U96`)#rZI&F2+T!z03fFr}WQ3`(n+!L_xv18r6
z0^b3@6f~fwIYXH<cdKvKvCU+$CNAK6lW~$H%OMS%$n<^Y2oD)niWSnSMeHn_3Vw=d
z0ENhr>oP2+XJmFhBc~juapaKCPB~2PIFiR?SWE+HjOYEU3~MZ`7~XE52tE76(oAI=
z`tvigKy!MHy~)t at dzoF!|ET3bHn_OA+iO~X1zXX^2X%eRDqZh^4XLRd>k-!QahncU
zciebahFJ$bBiwyA0c-{4$_*%MC>M$$O>`}d+lbwB<OF4RfQZ+)+Zsp&mI%eOzL>j^
z)yc}4Zuk{ksU_ at t_9c^NufSDn!J62e@@Nvd%#*Y+rKGv8k-o~yqXU-xnKI|LK<@b(
z?x-Bmuf<+~KL5|4W4w}7y0r34Wql=Vdtt{b=(uqir`<!RtyDSag1#!KyD+k#9@{dQ
z+V~9(_TX_k%hp8*_`>KlTN_MAeoC{8%bQMVg1FtppELxPDa%%-&q1ok)<o6RcbT2T
z7L-eR-O>C(BhtNdo96B3_Rif!w{z-i1A at fuWp{r?sT})?!z(n_%z-35x2BnsvX!wC
z=@g8 at 84vc(g+8h-)J at nWUho-@8{<BA>Sj=~npVbB)wGtPogmzLIICoYCE=EIvur4{
z!?C)Vog-B}p^-AId`)xq{6oq&lnE+t$ju~QeEyxBo((H<)Fk1R-r(ZbdxPJCpj3oD
zML(qEm+bVVMr0p at EA==)q4n54{h+crGb!Knk*$nbO)tV-NpGeFH&(EoS`R5VWf{w7
ztJFZnZ{R$eos|YFgEwnoPy96O&C$Nv%<M&X2N%HFcXyYWpFh_L`&X(``a=3ImG3I=
z`dH7#MDj{*Z&{$3vzKLBOLi)!mBaE@8TU2lz49K}2Uyhm9z8xQfEDjehZW<~q3_C-
zth`<5GMln8Iehab>^sjXzn9;XIoJ+k_jT4}c$GF&@`=2Xds{s78WjV|qEuv6C3WUk
zo|1RUd{kAMmCN#DtSz!cu3tbVmqiZZMqlEwV`l2Cb!_y?3iVgYLgx|TW$ZKc=+ALk
zZN1AXOy*8)vrH=-6-}E=Pc17<jxI(@vh9IFJ7iJ&H*lvSw(l1jquwiv7i{!B6WV6~
zk@Jy4q4ThiFmJcA+h>YU*AtGPc&l+s4EK*@OO#5biin#Nn_wmNgz}Ov7I|MeCGV0q
z%YQ_RB*ftQ9^m>2;QA8I8{PA>6nD#RK*!cX#Ea)i?!Z~nWiviEZ}iQEk0z=n<8OMe
zZWwcnL>&{m&4$jSTv(~~2@%p|=DgLlK6BWw98osHhL`90k`Lr<azT_Uo*rFi%?u0q
z+^IvBX~pT$w0w-NI4!yuDaE!2ij#20WTWf0eZSbkMz^reC!9KDf25d;&cvPSAGy&I
zeP6LhNrC0;QPlrOHiq=2aXas&^3Tq<DO-KUun(5xJoj`~QbET at bOtScuspY#i_g$o
zQcbu-$x(UXcb!7wyIo012_J3FkW^}v<VBUKmGgl?=j0dVrLtd3jDGw4yV&!-UOA at H
za8@X(QW%z2$;-~aj#+dZ``An;-KA7?ypm|@PmCq`zb<pQ1^2XaMBXCT%29bnbh%Z?
z<4(P7nO20E%)?lVFq24e*&ZmeLkG^rdcpSnqWDaH{VmMo%l03+9w{<(9<iU(%;*26
znQQ)IHZ-O=+Z{qbcjfPz;C1=`42l8WLo}rP$7~_|!=bVIV#oW@@{iH723zx;j!j+#
zZy+o`#Q`hXEG#5KG3Ofy1A>X;r7r2TW+$by3%-Pg{T)Cf?V}^g2t2R`DlUM}n+uq%
zs?4uEs at ZoR)y%sYZ0v2PqwfGV*0X%Z2=tFC_+rX&;PD@$ZA!Qur?D=x<xSHcBD+jN
zWECu#IewLFjJ^hIIGjA9bjIVeyTYrKg{0n>cxq)+rjLsVw=E?7?K7lTp at STuH4HcR
zD~s8zS$+o at SyDdf-WIF~aGe%YwlY63wIoA{pE3%^gdoFM?3kJ~l~JPf5TixRKJPo%
z8oTtFo1``2H+|2u^T at INzW<1LOW&GJmCcf~gvy4<tIFJx5|s+~$@8PQC%l~&j|u(0
z(`vdkup!+fn?pEL?9Nn8rtHw~fk|(bEH0UuC48YXnuj~eN&NVdX=rKYHGlT>Fsc8b
zlMtLhJ^OvX1;l2Qm`diT)WqcVA810&*l-JAEu3=Vywad7m7UQ=%DyhUWwL6r7 at Rz?
zjO9ZQ1Dc3Y^7jJE`P0B)f_>#$S~;sZ8Mnf>hHwWOH=>6^uR`a_X1XCODStyO=e4~G
z at S0;dYb^1}ugU9RZ63Gc`56hZbv{Bz8GPp=UIM2zo22o9QvVB}pL(qS8kr(Ug=cFI
zG5QKRTkwL9tt=tJDC>S-ZYWO at rsw2kol4D1J)MO!ETK-hQsz#9cJj7pPTouMc{w>G
zbUAourO=hmS5~qY516(WuXz9$*vXEn!c`h2qSh)(u>6VBB4$qwe*5Ym at ZeMIo9O`#
zbUHmSF0!;b1*d<mI^`{6xL)?bKO-MeQr<E|&&b~C_3^N`D6^8=kogelVz%s?P^P|;
zm9a)EdP<RJDnEnPabw{j1MYJZ@QrM*on*+krxq~q5<<sphTW0$TLtfVsGsy-sQzJ7
zMNhDbi02immJRHw-U%vWLJ!AYWxtu|r!ineT@?3q47fkM7xj%p9jx!~!{+>+uP-WN
zcV29z_A+y`B~y>hy*d!ve(h at Pak$_$ej1l6oFeK3&4BtC-=jkYGuYmSZ`$_hI_np!
z%Zz&$??bXt(R04&ea$RVRqLZJ0r$1c-uJ;z=&=)TzYjWoC)!@ud<rLfqJ9fjfkd6g
zZU?o@Dt$Og)a*grGijPxIvE%n9?)Z@`qh~C8qMV-XXJ!NDq#uHLmsM7gX<dS>}|Sr
zK0-CP3#6aWwmLl3<`O!Msy{-E%wpv@*hm~wcF!TX3nB%uOFGfc=gx`H9k~*#i&<X`
z)dX9zFbAm>M{>%jnm^F0abo!wcf0F-G%S`*iHc?80 at feAoM(v8z2-u}Mb(S}F6t=U
z<%48r7ZFk0UDQQkam?xigmZr%P8#mp=Yy<ow82vii{$SP_3);64`EFs5%INlD<CQj
zY;7NUU*iG5=cjNCuCKx$q=fz+{=4wo;fJ-f!t^;CVC|NOyD4~m!s$SN8v9RZjzST(
zDS6V)IpDWiN%K>UfWca`n{G4g6SmX+zt++`qufTw=uCCg&DSv<`dK|8&I>Zj*sUo4
z!y2moy`P-|>AqisnnTl$6WRN~xb&8ao_=7_fAx!!8E;k8G;eK8a2qC|6l&$_ at a=c_
zHAZQv;hUjGE$GP-_&V5_?IW;~*sBLygk66$2q$Tey68}^{2;pxW%JHxO2F9v*8iZI
zj4Q$P&cqW#J$Sx94QKmv$BfAR5V<J?tFRyzHe*~tZ{Ib#Mc2o`Ihs?rt&Kj_yVlo1
zXMq#mM)w)rg2ehX7JbrVt6;Cq=<Hsd^*PQ_;!cF6oJ#DLP#w6Z<Jv2P?aWyUZpWa#
z9k7uxw?d+X_5M2Mpcw5iTY#T5{scCPdh9%4L2@4ohqc-T3nbu>`W at ZbQW_6EsNdUU
z=``>weTzzpOH;j*B`a>a(;2X_gB{fT+4GK_&}u!{DNM#rEBB%gZ|K~T8yYXUSKFHI
zED at q7v?o1xmMryu!|z at tN`~ziQ4c95`4#FYJ}o3V-OgWYb_c&N4U%9dteSFc0>;=k
z$VrVDC65`iHyU8cq9R3!r%ZGs4f<f>H`I-Fv(gukHw|#7m{(grtsf=1nrPG@(daGM
zxkc$~C3-9wl9ykGnS>erlZLF><^m4;hGFqD=yVz+R>M-9klA|!E2ClUNzsA+WjjVW
z&D%`-Ea<%+dle^i*lE7_7frnDFIuD63d($^WazY5x6c+%-z80E^WW#fyERXSGF<5{
zd@mNQPHFm3%c&Kje?gtxfaQv1`zV)rJBxWF)4mVmqcm>kT#z{Lhqd;g*p!ZX-t2>>
zIXZPsT2F9Aa)jQLblUFn02i`F)4s9z-X&R{#;wo6^f=bN)Mt!(FrN+RVOj_>0O?o0
z`Uq=dW>!Sv286d?iO`*iak<#r7<W5d-|+a8pw+6EMoUYZ^w?=otZ7YQjIAqUn@>3H
zK~L885pfA1ven~o889np;wTqhfpM7te^(qLP0~qCEDX%f4Fx2cza^A{k*A4ys~e=}
zLdlr3G>^5(^ei7escjX1=r>{f#_cSeD;Y3;VK;*T*0hVmy2fpONa1$3yxm2U*qBYV
ztgc*XEZR0=)OZQvT6&WW{hHLrMembHl;qqu`_~cF=V|E_ER#z30b&1dU=cc`MIa$I
zUN%-n74+B&^w at ajgqB^H1^ak*=1QOAXg#uO8|E at u+62EKv~k6z6?&|xl at NXnak2IC
z>)xg{sXf656M(H&Hy2-(Q$0!BP3}ZM;l*nt*Q=i0<ZuaHHN>%xsx_KxO-fI2`RE9b
z at lW-<4jLj#3H!2yq`Fb at Zyt+(b9j?`RRdoVYSnz6S5U?hFU at Kl`2sIm;Tt`+=9&T8
z20ga_8o9}<zOre;D#xzmhUVVj%#`}noz8Dpef#BaN57pCIo!SZe&HtjsdJYNs*N|8
zEac!k*n!Ry;5aw}H=*j_yu;l`jZ`&JNTe4u&c8=<Iwr2F_P@a&?dE4M3AJ@^Uhtl_
z#Q~`krTvE9`$8MN?`cmuoU7l{wk{|QA-v#r+<}GVm7O?!c&p6pGDVMeTS#3JaUSVD
zQsnOl66)c)IBr%Kp;TRQt#eE>_<7eFGQf8m259l_0Rzn_c@I{@WF2btFnaOcCle`q
zjb+Pl>XRM@#e^_*zXw{QySHeYJnmHqSLTeGfcsl7 at Q#!BMon>;F{qBfYzSf}u9Dmf
z;iL;cD6jKLr$x{->=0LT-`=6Md1$`#^bYMW9x`c%b`rZh`8JbRaqb=32{F~bL;I_U
zSk>t<<(#kM_`+peazc8-&wbtw&SMTe?z;oy-|2ZzdrsV;9q?o|?a-p0vw|u5@&iY@
zw_x-oDT}h{0AI}dyhGdVIc4Hb?9eX6OCItJjUly%6cM#42za<Ju3)3|s;7guVJr)V
zu_bNas7a%q%@Rgq_8-7lyz2gq30=Q8j(T<?>@@_~f|@PG?$KBu3xHc``waW3+wjbX
znpkVX>rS|Ja20l#GrJ-`I}b_YTYK)u%vP>d=;V~QF5G`hxezuU=Ozo0sbwTOwai&X
zqOPiYd0*(_YRJykU0mT_Rp%pWZ7|`=k8eGvy;;lJG)$s1)5D^awa>EO=>Aaq4%%Lg
z{nGMGcAeL4$3ASUv!dlO@!l at l*j=6VRz3gmiEgytz*nEdYYl2LpPauUV#GMvm)Uir
zajTHkXL)Aqztqt?z(!oSvA7zqgz+ at LJaTdM>}VRH#0BSp^TJ^-CAAOh`fkX)W+Ln$
z9GEbUWWsep)B;B?tZ=RQx*_kxkAVl1PP6fd5*rP(d_5j-WiTj8Es*&?qrC_IYeu~H
zJxF6Ej>JoR8hl1;@%WqGHC<fIo%CZAG|D*siz_Csy13f4W^@m^mB+d3;tFE~E!=ia
zJJmEvooSjHJ!Np8WV1R%0~jxouy53a#2rI8x@iDh6UNz!))KJWC+=V+IX7GJ--)-}
z7!=&1R0VoeJ#caLY17=$J%O(W7Dm5b&NODOHOW3Jw1fQ3zVM;|v{cqb+QeF>N%;)=
zqc@!2>VM)2-pNBv|BNivY`_y%Q^|lBx8Gfi^k at VaDn1J=t at oWl_yEEO5I%u$8^Ub}
z{~6&Z!cm0Zj~Kd65L4F)D&Vyo5!5sknHspTdXYBSlj^^?;^OKvCd0|I#<?L+pb)oq
zwxG=upd@;1-nA3jb26F0ILH&)PEv$d-BSHqwEYXVXs?3WyzX$-x}OmuIH&ZxcerY~
zsB15{>T9kBq3ccZy7nW-)7m=mJ+0A0w!N;c_hf>*J>OUL;L}=-D0H1CN4rh4$Ts{s
z>9*4cxouBt4?D6F`E7WiME$UD&x1nO7bK|+t6(9VpQ=Z(uR&igC4jcGyFLtmf@(j<
z-lTXM__P&{d^dv+zV#$cdra5!;BJGv417x|H@e#ZvsC5Y>}0u3dj&7f1hrpz5(2oJ
zT*!WfLOXuVg<<TBS>QH<>)H at 92fTQxZ;8yyKG`8d{)Y3*Wt<~s&4Zh(>$e1So$+aE
z^AnA1xBA6ZPm5d?EFFwBUV9Ml3Te@*RV3f5_5 at F8>EMuef;;!Bp9SdzQMw;9`*rZM
zjLtoKmF*P|_YYy$--BlN`IU^1d?2tz+e}2s<^?aC56-LS<huRfo*B;z%<s=_d0umP
z_U8+s`vdN(6&2uMzkA!nAr5*Juvn0}I;Pc_2o1h3GMS}d<XoM54dacMfm^<(^y12N
zuX`0=`?gOA;SRT#uVsBn=wI+Q<A;el>YC7id*)|HfnSUqdn`(BBI at Q~S-`cb-j^M6
z%y3t^*DNs at PY4ZFpjmhWU<Gk6jSlr;x|`oV(xx7}h&LBH!>OJs;5wbC$8bM(gx8mG
zLje6eh7xlltX<y~$M=c)*Q??hHi}sW?wN`ZC@)@);W~Kw%}`!|Q`>wDE=xkGe$F5=
zD|N0k<X3}!9<cd!pF#2tkKpyILn9c|rQi0KW8<QqH@Vj=GuXiI2aDZRU-p~2*`A&j
zW#^AP34O=v9)g!1dkj7MN7x|U)MUr(9=`gZ>LAd~0#d&nFgFoM;i$U`RGEktSY+P`
zykk!_GTIi at H;_e$kMRFmvr)3oD^R9@=SvFPN+A=VC$v}a&cQQyGvjR^j}vquG?qWV
znxlN$ZonB<^A5(gzQgeB5!AC8?w8<?EYM#u9w|#+CYzuMh|A-1xig}4HTJ1ifHUt0
z=zyb@eaCQ?wYz2IW2>vGpZDDncCX56idOHO!%KX0PqnSZSvoHIDo!NTq;y<*2~{&8
zi6Y{11)7M;<;ronO4*6q@Kwqf>CEzrD{bJ#cFyr#Nm;jCIku9{;3KJk%B@!&QIgkt
zwu-&-mXcXnrJP&-WtmUIB(Lx6{gvxh3;BkyIo}R!4i*nVZn;ud$z&WqW^fb5;9mHQ
zkK5Gvy#P6|WhFapE?2g%-fl3Qq%-;=51}=EV1Jagq!%q+L2gpQ`;-pJMrRhgp;7V{
z|GJY;Na&i0M*(J%DuwCG at bX0woz91=ph;V1>Wfq<q|3npYwSORW_&9#yH7%+_AV?Y
z{5Y{Z4@^qqAC@~I-E{Deg;<CmNF1o>IBI)XdAG}y<b&LYLk+MuzQfXKFZOBK@A$Oz
zI}E2G$xF0%Q9E(}wfzrf(n*uOh5fO4S6R!bdz~LP4a=2O`53UxuWmy42tpl7m2#$X
zztX8J@*{WoN$DU`>X*-MS`~ktg~5xgtLSM1mgP%p6;8Es);tc at ExKoMv}o%?iapOB
z0yp4iR%q{os&6$d#wfgaO{0x3HThK0hxGx<mWuk1V`h at q(&=WvW7+C^O?@X5T9zw|
zR-7?#C)t@dKiXi5oLHxvG9{m6Z^Kk6w(!|i-N1u}RmGUuWvkZVH*3|QN*c{V`lC&(
zp1>Eu<(XcR_j)A5^u<Y5AMQd7k9Gy5EuXXV?QN}0kNC5f9;c**;qyw|cyQhYI%|R!
zp1n`P-g{W8q$nw>iPIt+I|+Jf<}6`zT{vsS62-TCi88D5UgfY>E3$6^Jx65q(v`lJ
z!`&7iEm~;ysgQ|GpVh(n?o~cmu~fl2s9XlgKIk{mnhlU%RP;PuL!D!=&XNb&nYtkS
z*z!DO?{c$eOc_z18XObITPaGvta=ZU4Rc;v;2#L36{cc`OvmrV<(-QAep|>5Xu2^g
zfH)k&_q*5lduSEoHQe{Jm8-`Nzhefr?uC_x?qN87p5gWqU4QiJx;|=Y{OtqsUq~}T
z6YuH?u4Oto9+1GB6!93_b9Q_2M#M(E#f3GTAWapiGYvg|{hHWfL)|~@$7?OEmU6 at L
z_bP*zONhDr$Z|8}pXTz7mA>UByjSxWRu!Z&p^wqdHMp_Mbp20wUx;wJGni>4cp>A_
zvj>+M2Tl?<|IlU^w~nvjAHqv)>-g`Oa)h<qx(^O=HHX<={Sdznujc*e>_NVT|IxoG
z?c&x3@%@eE at rDs<Z$RzV$+U(>i2BDj*&7Ff<VN~gaN9&ZqG|2o`nH3PR`O`uK?2<n
zn=3P9b%N)t$%GQyG;fQ5(SF`H7<>2{4{0LF?GBq;tr*8UpmFStrFNa25cz7H5#y)F
zbHJ{VQ==L0>z>lgcuUyqfPEz8JKG3R|MMD?wG6$(#NIEY5|glgAMj%7L~PTo&>XTC
z_h^@Xs{nhai6j9p?LDKjkQ10(gE{_rh=ju6GuRt^?V)MSCF2sLG>s;uH?iIQ at 4D8G
zS7wlRCB()=r*ZN3WnhD&n_J`Gfm(MXj|<Rg?ByBU@fxZR>AgrF8qEuMKZD*urA1l}
zVdDe`Fw!o{eTs6Vv}VpfLF<R!e+I at Cb5cqZEna9IX!nide7GN2?3j_1|EExr+ud<-
zoxg)mrR+TytPDXMdUFKxagqys4-^wKfHXTCyL;ZHGZ~x?I~yMI`ApomHlqjs0F3aC
zN%NDY#PG_d at pF?kXqKjL?jZcxgNrq{XLE-`q~V{MuE27V7lhlln at 0zdAielq)7LfO
zTl8y+_qPWZX%iMahI0S+p-b)C$?7J)D7nN~j#g&UJBC_WINVB4L~Y#)J-WHM&5w7l
z^fte_mDyPQJRSS3v`c!&mvHRPET=SYwnxeh&65gB at -R1-<5m`%_0QXftQ(k)?+Gc4
zw~!NYbCFDX%4a=}n}X{0tHkw6rey%9Vd?%(n*lOG7jaV&a{8OU4=Zu=*#kav=s$5!
z?Kc at 4W|8!=Sy$Ryk@C7vIQ~l3{hcO5N_t>cnYp6FLpI>|R^x&Wnur at JyF}^mC%DTO
zm-WyRPI5H=#Fr}Z;q3Lah!kj%^h`%9UU%a?%{0tQsZm4DhX?5$TzGZ|@9u9mNQ<+C
z625>tJzEoIXzkEL at PIVOmt>aI`EWy4qgnlU(PX2~(>y-x?Vx;vDLG;oZ<kWDaMK`P
zIK3F(;oF&Cuy2L<w;9e766Ga2!&(BVQW($<pq>g1_29+Il9F-TAhQI1&or-3&*UPs
z at QZfFX%NCzig7;9?SrrTCIHH}KnC6q+1QG#p7<LJ!Dn_7wfS&2p9(k8ZmZ8QPH=(S
zNTSwBh5;`5Ll-wd2P-=MezR#{T(YN-)(D;NLF!=ae4PI<eN<;6r4e8Dq-eSSxYaa}
znw;7x@wCfBXVq{Kd&{Qm%xHr1UjGLctCJ3-6sL4<;rK2OzZo>=NVYxtp?i`4td$O=
zx;#ZkYHTgsST5=t>nY|Ra!4w0rF%Y^bnE<$(ubH2yoUYiw`RjSZnp6_yXU3H_UOY}
zq6zm&>=o^V$O0)Jd&Qxv`8dffO?i2Mcb~O9bvc)q!BZ(xPMID%HQ3h8=fh=lHhZUy
zCYP|+MvZPum%+jhQ2L?UD#DMCn8ZhH(G1yK=Mnm3iLLXe`0asw%+B(iv@?)M29p1j
zfUzZZ*}FV;izfW(4;ISaQW{A9Y>__^H*qW)|If2l!p2zaDY9r>fkmTtJljq}FJiyl
z4fornk676}jhZ(a?|G$%5~PgyZO+4kLc>|3>4fN_Ut5>G)5o0=G at 7rqFCUjL-J7-1
zC!9$IE^!(iA8RMMdqX+tkO at myGF>Imo`1yfOlwbv<-~Z<W5&BZ(`b;KFMOn}-#uFO
z+QvU8gx~72+R`CCrZ&}RR7F}Eng|W^XqB`4;UL|X4*qZ*WKX6u3w;74@Kv3DzCyjp
zVvjxqI}mzDg_>_MMn^-6k`2w7K9$|KVYXLR)QkV+5T<t+q6=|0c%_RI_^>q|79t)u
zo%9qWnv<hwJ;@m+lUQkMmtM$iOAGN%yuAVq1-FylMmtT3k%QDbqjc7NbSL#Yq(qHo
zXGnZKQ6o6_+ay-|<p}KT4=|l(`{3`h#D=$FvpPc>ttKbE(#aEhM9krsG=4gFf at 0P5
zw~HOowRGC3l3*q~<#XZ3z+=)|SikM@epjd-F0UpzL~o(>K6MGVvc??ZZn<J~oEXjY
zc~V-)lOyK*`x-qiIs<b2zZo!3eeEm9&A^HkP8jyxdmo!64flEXhCa;@ojmk1bOv_<
zsh|ZU_gA6Z^xW*xaf(AiJ&%mcSE6KqC3W$7l225!X#(D!A~|@&q2`z8&8Kh5Pl%ML
z4q-G_eLn8~*`i{;J?xIBdWG(GPre!XRQRmDL=}Wi{F;T!?R&5`Et3;*+q*)wCKiJ4
zV*3M9i6uAXRN{c?HqXqS_B?z$MxnQ+jwMr!XEyj)J8`b>HWJO0ir3$qFGkj_ugM;&
zE%_92qc*!yDqIg8&#f;3>)-9NB=M*01AMAyMt6I%WQ^wJ+ajq-V|Mab+|N2|l?;%#
zv;B}pt#~t?u2&|T!c;wHoO?4LUV1YPe`m5SvU)OJN-$a at wHl4S+qF8$5P3X%t~1_~
zLZjqa{{ZZ2GB-L-Rpp9d<EaVp*pm3~*z+skr*Evr@2HKV&#%j!5H_585V5fvYjShL
z3Fp5X&smStzj<ScDhhh^W25ne=%zEt6z(I;;EcZZ)UkMt>=uLzum+Lt?Y<mjbE~!E
zy?zUMI#)_orUUcD!GiP2C~LyKlC|sS<yphrsj|Gn@N3cPyn^tWJV+jcCAgh%PMdqg
zzLz+0Qvo-zr&|s6DHvHr$GDV4H7PM$;~HTR1$z!o<K7PbulBAzzRBwRpQLG<rnhhr
z5fD#>Vv)-NRKy~h^b%TZZD>IdaWqZdCV|{cQd?1HT12}|8FJaGPDGf>oKx-=6k3>b
zxanxQD2PHuHjB7ffo=6R_I=(<`cf{N+i#!!{@}nj-}gDsdCui|pL0&~_I(p*C_;5@
z at xuo-N4vBucMj5wNf@qaHR3*TmeDJCQ#;kUzIObzH@6+>>Rgxdf~w|5V^=S#c at Wh+
z5Oog3y%6=Nlbx`n)pxO$6;jKxKBa}q)OTrHFtU{Tt~jyn__jo}U5~#oXg`lnp>N#L
zv{qVMKW0}yg1_w!MeEp!m!<qXyFL5b@$}pwM#T)NpN~wQV%0C5X~k2SOZs#faP8{t
zuk}wRJyB%+9qu<sKEcxJ@{4d!$lxwbDrRMJ7oK{F!y2G53~nBs@qK)+1KlmZ^>bbN
zAv}kfWu=^6R%(weBY(TU>C;Y9?VwV8OI+_}I)C|{89Mzn+NF<nJc!3P<Cd`@@woeR
z0j~Owvktb7D+<+W#{FRS)Woi~#3yF7)0s_p+=K5W8DO=wX9YFam9!gqIy|b?CADV`
z84(;;+h^Upp!PaTJ63|5ZfZB+T9=*|4^M1M9D6lB2jMP<q&?V^hP8W#Q#9z>db^ic
zS0xVGm(ZTk$<un{GwH1KxV9zY)B1hdBf~W~PHlG&*Wp`_6WV%hx$4XMFFQX@$E&t|
z30D43T1!9q<laX+>R6doi*G}STXqM=dNoEc1+(g_Ka2<_JlQcoS|v{7y{!(vxq#>D
zx20{2+Z2aqICTT*Z*WJy(bC^=PsHIaJI1CA);9+yw{#AzYsfX9>{r(d*Q776!?UiZ
z at LcK1Rd}|H?zh*i(&9S;aqhHFTUqnVr&x6Di5(BH=3Lxwp4Gha#E#(F6Ll)N4zfih
zTOeyxvIg>wfXcoC_A0p!vPC6ZAZt{z2J((MDtjC3RdO9<i%PaY)~I9+<Q=6ddo%1+
zavfxgO141OsALV~9XG4&O|VzVb&xG8*#a5sL(E?q$UDB%E$`s4SIKpdEh^apS)-CQ
zkat|AvNytBCD%c=sALOdjY`%)-jS}dXRuevb&xG8*#cRkk~PeTZyZf&#=B`AoJ^5|
z=S#KxOKoRxvR-_;g>|MivEf~<qmIYnGsjzh-`0^})_%oKJ%cA4=<_k5)to%2&HPg<
z&)IA4pI4Uaur37$CqIU-L|QE7FEw8w=I;duCwFP^c}bPxaC`=N>0tbn6w}E%%AbII
z(kW#~N1!~jo-t2<eE$mMTCJ8LOH3N%$BRcn4h_%H>Ww^3Z_H;&Mm;kau`(H%Zi3N*
z{1#v+@^DR2%4fAE*h~PxZsg5F*(`7&&^U;(CkN at ldN8hNpj_9DQu+SqNh2_`4`X-q
z(S!A1=*Hm~wzX(SN<TIw){L~L{dw!uq{pv#-Iw^I({qE@J?l8WdbxAO*oH%CKWlpb
zp25fWw>KQz^OF(9o0GQPx9)q1qnbW`?8 at fFPU9<Ap5$xi7T&ex)M3l^2k+na-hdOw
zKJZQ5wD0t97VceeTcfv6%bI!4`Cn9i^XZ$y4 at zfi`X2NqI2@DGzx+$8{?T3BKk>Up
zPw_EJ#s1J;u2pTv;%=P0Pj|~V3sd*Z+hln5%Qc&>^ER%}edo<r51GGs?ZuD02gX*<
zK2oqd^_}-`pVan?7flC;<*>t3qf_7A)z9AAyy^7Dj3KXYxb5-fTX&~FyRB(OlQv7=
z5I<-A!IU?K9#3BP@O^>r^eT4G{Kb{_9g{{?ZC-47|L%ml4ryNFdm67b?*Huj3)kIs
z)uzn}&mL=jdfdLIj#Y0a)@Faf(ig2s`f>lpv=3iRo%_J3Nk08gyw1lovmJjtJ$2r^
zO1pQ^0h6%sR#tiPPs<a$_dcr`xZ||Ge#YzRe|h8JTETYwmENB;ZU5nY4O_lGa^(k=
zMWf!k?9_dG9}$Z8eKpg*zU22)H|0dwYpai%UfpMT_Q;fXmmiqqd%f*vU!8tu@7&{_
zysr=Xv#kxTU$!<?ycZs&%m2fbapUF`8(w(xzSIwHyer=Jf<=3c(U`pbA)fMP<|g-y
z4GRN2X<yZrr;pixpZ3M!?>4 at 9aQM}Yt!p=~dG|M$Pug&MUFycs6K8LG<(J;AEqp=K
zpEhr3ej?@Q=C~*Jtc%<*dH*Lb*X()fvSEjG3;Mku?w#!T=)sB3WjD?BrLLJZcYgBj
zv|~@5Nm_c%OU$rtMdJPWOVc~|tkys5KB*b}_nirzJ7-k>?RPFAde?aG6(1+e^WQyi
z-{0Fu?EU_%`R^Iun(~1waAeCDUwpQGQQr1fF5kasZAHiGci#El(za(_-+5p{*~ufN
zpSxadbIo||xepRH-F(aV^@Z<^NIg(I(D3qKr^Jn~n6I<^>a&U?(~r2;e749x=AP{y
z>mwWNzZ<Zi>a~@70-58Fy33Z=q`Vb3Ir-Hs{j^tqXIT97?Gv~DIxBhG`X#eAj?m5B
zF#Gv4 at 9rG4yLHnKR~#I9<x7X}Si95t<gk;DPk*|4Zna^lPy6$Pq@UhAKJCOpS7NBo
z3>IHMrFnVZ`AtV(8nN!)2?IB$Jh^DklGN?{|M1FZ at 86ek<WTayJ$oO@J-YAnt_>f!
z{R`f^>g|5p>+Tq~<*y&stPRvmex?5(XXzV)bJNfKc49)+Y<%oHvqJch=cUT7y=Ugx
z3wC?^)gCph{PUjFcc(4T-MVu_+zs|&uIK;OucEbNvZv@!jsK=8bK72ef7Uw(tCEkH
zJ0~8vzWk-ve*WtfuO5D2_xj1l&ulUcI=OAz4|Z<-t!e3o^5<4>92!5qb?efEci$d9
z<M6a**TEs9=T~iLnqq%lJJ5aSvJru6uiu`$@tH*_zZ!TXe%7O(X-8?X1Ssp2xEhdv
zOyf07{ETSMO=t939apPZGy$l?VLf9}fGq$640+K9!3)6vdk7#I>s}PcQR3$S*s~;w
zqr{X)dgQy48S8ipFaVD*)&RNTQ&a)D;YFzo`#tz=)cY}z!dQEX_AIbeD%S&P2`p+<
zLDlBD^~IsSZk)fqMAWB(s=k@M7&{=gkMZERBT>e~;B+19Fm~fC{qxfJ8q##E0c8}p
zd)Sb_de);?l_xufcB5|q4*`Fa>V>y(0IURB06Ld=jp8M`5@;bc@*V?|-E#oWi5~3}
zKY+5`370KU%gvM#Wo&36cri!RnCo>>3LYdgW4(uh3m4;sTeK*NPc1ma>F*6b%Lp><
zW^&OMxu|F#J-4W6Z@y^#2~z#IV-cGnP65>~wXbx_Bz217vpaQnis__WGNOGxmb5g|
z3Ry%?<d&F*x-V8Lbw7@VpF-}D6rzRbx0nL0VQ;1+`Aw|NOykmVm66m1PJYuG6~ARL
z4UAx_j0=a<k}*o-YLVt$>dq8=!BL9F9K{S;3^!;oS~!~Zl=Ha8#8T>XutUlKP<1`}
z70=i%3||A09Hq!IM>7^<1P__D6|BEDDN4 at 9c{U at +K*u0nfLn}(a7}lkCS7khnM?1Y
zTsG<<esgjtbu}B6prX_)gS*9Kjw{d%DD2%DT@_78iOaV2RjZ1$c+VxOP!B9oU5wdf
zkSS(m7UM$fa)o{<ONdI*jXMZrKlNnAZ{1y%W`H=3D25C_6=KZfwtvA-Vx!D#zL0;E
z{D0q1a7MSE(2hnMb0Jh&hX2q{rpH-!b~b)P?gh5ySDJHJ2^Tm-Pjj6Y;)UTfBB*p0
zoY4fvHj)UJ!DGsBkw2a7`;dyUlqAvDI5ICLId3QD_+8Iy*(X8Plg(5$c^^rf6Vxad
z#VEHR6rhXFNqrHYSkI(-PWA2ES4W|Osvqi~Fn?&#{?%D02N$&cwc(>&#QK1GQbiN`
z#zS>5rYeI<2?K>GOl+7|(E-ymwufn%Kx0TPQF^uP6c@;PwDT?eB$}SzPf;3(=r6UO
zlt%x#pO_7PI!RrN`AM9+5dSql4cUDPemY&aWJ=tkIK at wlk)LE$!$<#ypQKU!-}&i(
z9Zz!5h<@shC&^DzJe~f3;ivyJp3Xb(n3=-sJn{6odfw@^X9bOV-gU>*J%>*>tRj^%
z-xU5Q^DY)ojfHH$fC0)dFU06BO)6>bn(2tv6OMs^P}hYR<)D=od=y8D0!GG(sD=x$
zq!k-IgJUE!fNcXdEm!mv`(o~=r%vI`tQ%@tmBa-riiK0z5ihJ#mfs7oyxYaP+<ukP
z2QXGNdRt8`i`PE-g0BDu14Do;U=%PGxE{cT24)3p0R4TOsAs~^L=R(pOs}LYN{Z0U
zD~)F-T`bA@7BS(*=5vx%AXiM<^CZ$!S1y`*wlB9DqjOr7GK_Nmd72fojEcfEX6(4^
z>&9O{;RZ`?UVeeKTeep^oI({V@>d0NczJ%ArGyvc<?-^|0&eD}+Dy}gS_3Nxg#sb9
zIv?tQ!%-ay2~GnGR|<|mwLiiq@l0>EfeE3I-RTUGD4IJ%fncmaEa$8uQp+`g&^&tx
zRXKT;-QyLUBYCAK66Rqc!ZXp(Ii*5&ze{kq1;@OYL8jMxzLH9PexW85s0oYJ6-9)Q
zJ>m)Y(NAa2NG{X{1xG|4HLnT<e4IKdgu`;)NFEaGPNjgyAC5qjdX>Y=s{MYC-^B|`
zimW`}V|V!j;fTk<rwQQ*A3b_Bv)RL8a+g&cnt|mNm*(A)!wX8w^Tu$8H-JH8I{7Vy
z^UqR^J-^C2wtNoUF{iA+df@`Lf{PR=u}xPjy-r@DYBoQ=>;jtUma=IomAbDbC3zRn
zOf9z+^;DG=low3P;d!OS`35EnGc08#23B;dwUp=Z8TN?7?F_iM;I~&I66BMg!;Ac$
zh{x{r%qL%$l$7C=xI8!!p>V879 at Ld|W>LacczY~Alg8=EMH^*Pc_id<xdg;7dJ#Yz
zJ0gOUm*&Y6;G8nk{i7V`E0zZ@a`e~YrC{RarFmA{WDB=>?UAZL$Y)?xL6_a*k5n;f
zGR5RMZoA(ZsHze(#)h3CyH9m^9_<`^FzCI9*=sR2kJBY|AH@oL$Atu+J;-E^<x2*0
zBv;0AeKmZj(mOu%Ugc2H-#?MN0#XU7dr}7`a>Y){l`Z8W@}OW#rDA<Wq1dsiekvpP
z6(xG~`hL#jemgy3iUFoHOzz~Sb2@^Y3wJoyyke-dYpNZ?S#GJNEFV)b_cmT0$V2D|
z6ixFy!61S{h`7bI3e(r)^7{lVbk1slM*`gAzZ;?E#FV$>#g+<>pBEI^%1RN-vL(a%
zCHU{2Ba3qcA&9kwl^0AMormbN6c^=|S*8`0-pXy3^6~=Ai1VndmZD;n$`%rW_7Ful
z`Vo%ULlN#1e1XtC+ at VB&z;9qfh792aWo4yhoQ`Z>-1;hTalY}0Ti}%ed&o&D1Dif7
zHxP)hT&!;%pWP+!8c)Q{eV(w7W+L2>SC(gB2B{b?w-xiTrZMA2o5tWj&$3jzxG9^m
zuH&Ql*fBX{vvbCb9ge*r=*{6ipMyJvyFCtp`vVbPMJs$phDzzdq?T9k9FFY+b<lbr
zGp_W`la}5dx?2OhB)5#yd9g>TLjw1NrP^g%to7n5k%y6 at VPC*0z_}5W4Rd)@6Q|`&
z1DodY34!Veud!o&fsuneL(Ba=21aXJzSMuL(6J%F9fmx6HSHi7{PsX~NFF5BO at 4M^
zD+^MW&_=Cc8vKnV0{P;u#cKl9SdS_N?!cshzi}Q>&RhFE at zr2p<Tc4a+PuVm<nT&y
zr|?(%Dus|_fsM-{2+lC~*=w^zYdD^)YeJrgAp2Fyp_;^q5wORGBY_}y_~7UgJMDqv
zYk9dpgoAAC``NWD)6xBpWjaS^I>{3`aDe2UAht%#25eX4D<>ubxdxfR0BXm0?hbe(
z6iQ*ii}e*JJTshw6N`#D%lA0_*F?ArTYDI;Lug1_AZApxFnTmjNKr{a>GWw74uKFw
zi*kmrUpws)JFlz`<J{0V5%O?~I8d<>=B)8KJagRGfP3gH#nTGPEIfY(27+$;#dGOF
zZyf=DIN(Ke+<5Es;^LdAr<v90EIMq#wjC1RCRAjGuaVt3`l9dW{#Q!6*6_b-`%=4?
zJaEYamppLE1D8B-F%QtytBZkbd+IM#A6@*WM64W(8LAgWr|9W=kQz!+B~M+Rj+MSB
zdW99cZ^KGm-<GM3p8ZnfZ`1yNqpaeOOMG@*kw5+$iM|tx&>~|On9wTY0GQA&qXSIn
zl+gtyu*W3m!33j>{$K)^kp(80WJ~}P%rXkW1e=VRU_ylqH<%EVQ41zSWi)^Zi)A!|
z2`go+0Tb5BXaW;jWb6VHT4fvn6WV2TfC-&4y1)dsM1menFv{o;CU6;9V1h};1TeuY
zqYzB6$(RWyRLF3H2|*dPU_w+z1DLQ_MkAQ8QpOrEVXcfNFrh`pE-;~0#sM&)T}B6(
z&?%z}OkhhT;1}@D5R5YVg9%(l7MNg?F#$|4%P0gBY%*qo2^BKjU_wwvEtn9M(Euha
zmeB|%tdy|^Ojs+U2~22_u?tLSm2m(}XqV9eCUnZ^0uvaXQ6uPO7{P@8GB}u!CBp<J
zOpsv)6AES6z=WAHD!>G{j3Ag$D<cXfG{{&CCN#=e2_~$Ou at +2_KI732a`8mv@cBH1
ii=`%|<WsXTW~AHiJags>U<~jf^1hMtfAQScx_<x|bJyqq

literal 0
HcmV?d00001

diff --git a/board/altera/socrates_cyclone5/readme.txt b/board/altera/socrates_cyclone5/readme.txt
new file mode 100644
index 0000000..8630be1
--- /dev/null
+++ b/board/altera/socrates_cyclone5/readme.txt
@@ -0,0 +1,52 @@
+EBV SoCrates Evaluation Board
+
+Intro
+=====
+
+More information about board can be found here:
+https://rocketboards.org/foswiki/Documentation/EBVSoCratesEvaluationBoard
+
+Build
+=====
+
+First, load socrates config for buildroot
+
+    make socrates_cyclone5_defconfig
+
+Build everything
+
+    make
+
+Following files will be generated in output/images
+
+.
+??? boot.scr
+??? boot.vfat
+??? boot_partition.img
+??? linux.dtb
+??? preloader.bin
+??? rootfs.ext2
+??? rootfs.ext4 -> rootfs.ext2
+??? rootfs.tar
+??? sdcard.img
+??? u-boot.bin
+??? u-boot.img
+??? uboot-env.bin
+??? zImage
+
+
+Creating bootable SD card
+=========================
+
+Simply invoke
+
+dd if=output/images/sdcard.img of=/dev/sdX
+
+Where X is your SD card device (not partition)
+
+Booting
+=======
+
+Pins 6:8 on P18 selector is used to determine boot device. To boot socrates from
+sdcard set these pins to value 0x5 (101b). Rest pins are used to determine how
+to configure FPGA and are not associate with booting into Linux kernel.
diff --git a/configs/socrates_cyclone5_defconfig b/configs/socrates_cyclone5_defconfig
new file mode 100644
index 0000000..95640ef
--- /dev/null
+++ b/configs/socrates_cyclone5_defconfig
@@ -0,0 +1,34 @@
+BR2_arm=y
+BR2_cortex_a9=y
+BR2_ARM_ENABLE_NEON=y
+BR2_ARM_ENABLE_VFP=y
+BR2_ARM_FPU_NEON=y
+BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
+BR2_KERNEL_HEADERS_4_1=y
+BR2_GCC_VERSION_5_X=y
+BR2_GCC_ENABLE_LTO=y
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/altera/socrates_cyclone5/create_sdcard.sh"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_GIT=y
+BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/altera-opensource/linux-socfpga.git"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="rel_socfpga-4.1.33-ltsi_17.07.02_pr"
+BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/altera/socrates_cyclone5/linux-4.1.config"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_USE_CUSTOM_DTS=y
+BR2_LINUX_KERNEL_CUSTOM_DTS_PATH="board/altera/socrates_cyclone5/linux.dts"
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_ROOTFS_EXT2_SIZE="10M"
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BOARDNAME="socfpga_cyclone5"
+BR2_TARGET_UBOOT_CUSTOM_GIT=y
+BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://github.com/altera-opensource/u-boot-socfpga.git"
+BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="rel_socfpga_v2013.01.01_16.10.02_pr"
+BR2_TARGET_UBOOT_FORMAT_IMG=y
+BR2_TARGET_UBOOT_ENVIMAGE=y
+BR2_TARGET_UBOOT_ENVIMAGE_SOURCE="board/altera/socrates_cyclone5/boot-env.txt"
+BR2_TARGET_UBOOT_ENVIMAGE_SIZE="4096"
+BR2_TARGET_UBOOT_BOOT_SCRIPT=y
+BR2_TARGET_UBOOT_BOOT_SCRIPT_SOURCE="board/altera/socrates_cyclone5/boot.txt"
+BR2_PACKAGE_HOST_GENIMAGE=y
-- 
2.10.2
