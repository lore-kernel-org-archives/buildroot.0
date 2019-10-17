From: Aussedat Louis <aussedat.louis@gmail.com>
Date: Thu, 17 Oct 2019 22:39:47 +0200
Subject: [Buildroot] [PATCH 1/1] board: Add FriendlyARM Nanopi NEO Plus2
 support
Message-ID: <20191017203947.17662-1-aussedat.louis@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: aussedatlo <aussedat.louis@gmail.com>

board with below features:
- U-Boot 2019.01
- Linux 5.0
- Default packages from buildroot

Signed-off-by: Aussedat Louis <aussedat.louis@gmail.com>
---
 .gitlab-ci.yml                                |  1 +
 DEVELOPERS                                    |  4 ++
 board/friendlyarm/nanopi-neo-plus2/boot.cmd   |  6 ++
 .../friendlyarm/nanopi-neo-plus2/genimage.cfg | 39 ++++++++++++
 .../nanopi-neo-plus2/linux-extras.config      | 10 +++
 board/friendlyarm/nanopi-neo-plus2/readme.txt | 37 +++++++++++
 ...3430-sdio.friendlyarm,nanopi-neo-plus2.txt | 53 ++++++++++++++++
 .../friendlyarm_nanopi_neo_plus2_defconfig    | 63 +++++++++++++++++++
 8 files changed, 213 insertions(+)
 create mode 100644 board/friendlyarm/nanopi-neo-plus2/boot.cmd
 create mode 100644 board/friendlyarm/nanopi-neo-plus2/genimage.cfg
 create mode 100644 board/friendlyarm/nanopi-neo-plus2/linux-extras.config
 create mode 100644 board/friendlyarm/nanopi-neo-plus2/readme.txt
 create mode 100644 board/friendlyarm/nanopi-neo-plus2/rootfs_overlay/lib/firmware/brcm/brcmfmac43430-sdio.friendlyarm,nanopi-neo-plus2.txt
 create mode 100644 configs/friendlyarm_nanopi_neo_plus2_defconfig

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 59efd51340..3f584dfb0b 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -185,6 +185,7 @@ freescale_t1040d4rdb_defconfig: { extends: .defconfig }
 freescale_t2080_qds_rdb_defconfig: { extends: .defconfig }
 friendlyarm_nanopi_a64_defconfig: { extends: .defconfig }
 friendlyarm_nanopi_neo2_defconfig: { extends: .defconfig }
+friendlyarm_nanopi_neo_plus2_defconfig: { extends: .defconfig }
 galileo_defconfig: { extends: .defconfig }
 grinn_chiliboard_defconfig: { extends: .defconfig }
 grinn_liteboard_defconfig: { extends: .defconfig }
diff --git a/DEVELOPERS b/DEVELOPERS
index 9a24ca30ca..941462a077 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2512,3 +2512,7 @@ F:	package/qjson/
 F:	package/quazip/
 F:	package/shapelib/
 F:	package/tinc/
+
+N:  Aussedat Louis <aussedat.louis@gmail.com>
+F:	board/friendlyarm/nanopi-neo-plus2/
+F:	configs/friendlyarm_nanopi_neo_plus2_defconfig
diff --git a/board/friendlyarm/nanopi-neo-plus2/boot.cmd b/board/friendlyarm/nanopi-neo-plus2/boot.cmd
new file mode 100644
index 0000000000..227604a23d
--- /dev/null
+++ b/board/friendlyarm/nanopi-neo-plus2/boot.cmd
@@ -0,0 +1,6 @@
+setenv bootargs console=ttyS0,115200 earlyprintk root=/dev/mmcblk0p2 rootwait
+
+fatload mmc 0 $kernel_addr_r Image
+fatload mmc 0 $fdt_addr_r sun50i-h5-nanopi-neo-plus2.dtb
+
+booti $kernel_addr_r - $fdt_addr_r
diff --git a/board/friendlyarm/nanopi-neo-plus2/genimage.cfg b/board/friendlyarm/nanopi-neo-plus2/genimage.cfg
new file mode 100644
index 0000000000..a4c2a7a894
--- /dev/null
+++ b/board/friendlyarm/nanopi-neo-plus2/genimage.cfg
@@ -0,0 +1,39 @@
+image boot.vfat {
+	vfat {
+		files = {
+			"Image",
+			"sun50i-h5-nanopi-neo-plus2.dtb",
+			"boot.scr"
+		}
+	}
+	size = 64M
+}
+
+image sdcard.img {
+	hdimage {
+	}
+
+	partition spl {
+		in-partition-table = "no"
+		image = "sunxi-spl.bin"
+		offset = 8192
+	}
+
+	partition u-boot {
+		in-partition-table = "no"
+		image = "u-boot.itb"
+		offset = 40K
+		size = 1M # 1MB - 40K
+	}
+
+	partition boot {
+		partition-type = 0xC
+		bootable = "true"
+		image = "boot.vfat"
+	}
+
+	partition rootfs {
+		partition-type = 0x83
+		image = "rootfs.ext4"
+	}
+}
diff --git a/board/friendlyarm/nanopi-neo-plus2/linux-extras.config b/board/friendlyarm/nanopi-neo-plus2/linux-extras.config
new file mode 100644
index 0000000000..f73f582331
--- /dev/null
+++ b/board/friendlyarm/nanopi-neo-plus2/linux-extras.config
@@ -0,0 +1,10 @@
+# wireless core
+CONFIG_WIRELESS=y
+CONFIG_CFG80211=y
+CONFIG_MAC80211=y
+CONFIG_CFG80211_WEXT=y
+
+# wireless drivers
+CONFIG_WLAN=y
+CONFIG_WLAN_VENDOR_BROADCOM=y
+CONFIG_BRCMFMAC=m
\ No newline at end of file
diff --git a/board/friendlyarm/nanopi-neo-plus2/readme.txt b/board/friendlyarm/nanopi-neo-plus2/readme.txt
new file mode 100644
index 0000000000..ae59952029
--- /dev/null
+++ b/board/friendlyarm/nanopi-neo-plus2/readme.txt
@@ -0,0 +1,37 @@
+Intro
+=====
+
+This default configuration will allow you to start experimenting with the
+buildroot environment for the Nanopi NEO Plus2. With the current configuration
+it will bring-up the board, and allow access through the serial console.
+
+Nanopi NEO2 link:
+http://nanopi.io/nanopi-neo-plus2.html
+
+Wiki link:
+http://wiki.friendlyarm.com/wiki/index.php/NanoPi_NEO_Plus2
+
+This configuration uses U-Boot mainline and kernel mainline.
+
+How to build
+============
+
+    $ make friendlyarm_nanopi_neo_plus2_defconfig
+    $ make
+
+Note: you will need access to the internet to download the required
+sources.
+
+How to write the SD card
+========================
+
+Once the build process is finished you will have an image called "sdcard.img"
+in the output/images/ directory.
+
+Copy the bootable "sdcard.img" onto an SD card with "dd":
+
+  $ sudo dd if=output/images/sdcard.img of=/dev/sdX
+  $ sudo sync
+
+Insert the micro SDcard in your Nanopi NEO Plus2 and power it up. The console
+is on the serial line, 115200 8N1.
diff --git a/board/friendlyarm/nanopi-neo-plus2/rootfs_overlay/lib/firmware/brcm/brcmfmac43430-sdio.friendlyarm,nanopi-neo-plus2.txt b/board/friendlyarm/nanopi-neo-plus2/rootfs_overlay/lib/firmware/brcm/brcmfmac43430-sdio.friendlyarm,nanopi-neo-plus2.txt
new file mode 100644
index 0000000000..740d172eb5
--- /dev/null
+++ b/board/friendlyarm/nanopi-neo-plus2/rootfs_overlay/lib/firmware/brcm/brcmfmac43430-sdio.friendlyarm,nanopi-neo-plus2.txt
@@ -0,0 +1,53 @@
+#AP6212_NVRAM_V1.0.1_20160606
+# 2.4 GHz, 20 MHz BW mode
+# The following parameter values are just placeholders, need to be updated.
+manfid=0x2d0
+prodid=0x0726
+vendid=0x14e4
+devid=0x43e2
+boardtype=0x0726
+boardrev=0x1101
+boardnum=22
+macaddr=00:90:4c:c5:12:38
+sromrev=11
+boardflags=0x00404201
+xtalfreq=26000
+nocrc=1
+ag0=255
+aa2g=1
+ccode=ALL
+
+pa0itssit=0x20
+extpagain2g=0
+
+#PA parameters for 2.4GHz, measured at CHIP OUTPUT
+pa2ga0=-168,7161,-820
+AvVmid_c0=0x0,0xc8
+cckpwroffset0=5
+
+# PPR params
+maxp2ga0=90
+txpwrbckof=6
+cckbw202gpo=0x5555
+legofdmbw202gpo=0x77777777
+mcsbw202gpo=0xaaaaaaaa
+
+# OFDM IIR :
+ofdmdigfilttype=7
+# PAPD mode:
+papdmode=2
+
+il0macaddr=00:90:4c:c5:12:38
+wl0id=0x431b
+
+#OOB parameters
+hostwake=0x40
+hostrdy=0x41
+usbrdy=0x03
+usbrdydelay=100
+deadman_to=0xffffffff
+# muxenab: 0x1 for UART enable, 0x10 for Host awake
+muxenab=0x10
+# CLDO PWM voltage settings - 0x4 - 1.1 volt
+#cldo_pwm=0x4
+glitch_based_crsmin=1
diff --git a/configs/friendlyarm_nanopi_neo_plus2_defconfig b/configs/friendlyarm_nanopi_neo_plus2_defconfig
new file mode 100644
index 0000000000..6a5b36b7b1
--- /dev/null
+++ b/configs/friendlyarm_nanopi_neo_plus2_defconfig
@@ -0,0 +1,63 @@
+BR2_aarch64=y
+BR2_cortex_a53=y
+BR2_ARM_FPU_VFPV4=y
+
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_0=y
+BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV=y
+BR2_ROOTFS_OVERLAY="board/friendlyarm/nanopi-neo-plus2/rootfs_overlay"
+
+# Firmware
+BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_GIT=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_URL="https://github.com/apritzel/arm-trusted-firmware.git"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="sun50iw1p1"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_VERSION="aa75c8da415158a94b82a430b2b40000778e851f"
+R2_TARGET_ARM_TRUSTED_FIRMWARE_BL31=y
+
+# Bootloader
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2019.01"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="nanopi_neo_plus2"
+BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
+BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
+BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
+BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot.itb"
+BR2_TARGET_UBOOT_SPL=y
+BR2_TARGET_UBOOT_SPL_NAME="spl/sunxi-spl.bin"
+BR2_TARGET_UBOOT_BOOT_SCRIPT=y
+BR2_TARGET_UBOOT_BOOT_SCRIPT_SOURCE="board/friendlyarm/nanopi-neo-plus2/boot.cmd"
+
+# Kernel
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.0"
+BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="allwinner/sun50i-h5-nanopi-neo-plus2"
+BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/friendlyarm/nanopi-neo-plus2/linux-extras.config"
+
+# Filesystem
+BR2_TARGET_GENERIC_ISSUE="Welcome to FriendlyARM Nanopi NEO Plus2"
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_MTOOLS=y
+BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/friendlyarm/nanopi-neo-plus2/genimage.cfg"
+
+# wireless firmware
+BR2_PACKAGE_LINUX_FIRMWARE=y
+BR2_PACKAGE_LINUX_FIRMWARE_BRCM_BCM43XXX=y
+
+# wireless tools
+BR2_PACKAGE_IW=y
+BR2_PACKAGE_WIRELESS_TOOLS=y
+BR2_PACKAGE_WIRELESS_TOOLS_LIB=y
+BR2_PACKAGE_WPA_SUPPLICANT=y
+BR2_PACKAGE_WPA_SUPPLICANT_NL80211=y
+BR2_PACKAGE_WPA_SUPPLICANT_CLI=y
-- 
2.20.1
