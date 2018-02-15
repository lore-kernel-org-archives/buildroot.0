From: Pierre CROKAERT <pct@crookies.net>
Date: Thu, 15 Feb 2018 17:50:37 +0100
Subject: [Buildroot] [V2 PATCH 1/1] Odroid XU4: Hardkernel new board support
In-Reply-To: <20180215105112.70b2e028@windsurf.lan>
References: <20180215105112.70b2e028@windsurf.lan>
Message-ID: <1518713437-2163-1-git-send-email-pct@crookies.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch provides support for the board Odroid XU4
This version is using a recent 4.14 kernel released by Hardkernel,
and the current u-boot 2017.05 also from Hardkernel.
The support was implemented based on comments about Andi's patch (https://patchwork.ozlabs.org/patch/640695/).

Signed-off-by: Pierre CROKAERT <pct@crookies.net>
---
I made all the modifications we discussed.
I have also changed the kernel branch to use the latest branch maintained by Hardkernel.
This patch also includes to replacement of boot.cmd by boot.ini.
I think it is a better start to support the OdroidXU4 board.

 board/hardkernel/odroidxu4/boot.ini      | 197 +++++++++++++++++++++++++++++++
 board/hardkernel/odroidxu4/genimage.cfg  |  55 +++++++++
 board/hardkernel/odroidxu4/post-image.sh |  24 ++++
 board/hardkernel/odroidxu4/readme.txt    |  37 ++++++
 configs/odroidxu4_defconfig              |  25 ++++
 5 files changed, 338 insertions(+)
 create mode 100644 board/hardkernel/odroidxu4/boot.ini
 create mode 100644 board/hardkernel/odroidxu4/genimage.cfg
 create mode 100755 board/hardkernel/odroidxu4/post-image.sh
 create mode 100644 board/hardkernel/odroidxu4/readme.txt
 create mode 100644 configs/odroidxu4_defconfig

diff --git a/board/hardkernel/odroidxu4/boot.ini b/board/hardkernel/odroidxu4/boot.ini
new file mode 100644
index 0000000..a4d007e
--- /dev/null
+++ b/board/hardkernel/odroidxu4/boot.ini
@@ -0,0 +1,197 @@
+ODROIDXU-UBOOT-CONFIG
+
+# U-Boot Parameters
+setenv initrd_high "0xffffffff"
+setenv fdt_high "0xffffffff"
+
+# Mac address configuration
+setenv macaddr "00:1e:06:61:7a:39"
+
+#------------------------------------------------------------------------------------------------------
+# Basic Ubuntu Setup. Don't touch unless you know what you are doing.
+# --------------------------------
+setenv bootrootfs "console=tty1 root=/dev/mmcblk1p2 rootwait rw fsck.repair=yes net.ifnames=0"
+
+# boot commands
+setenv bootcmd "load mmc 0:1 0x40008000 zImage; load mmc 0:1 0x44000000 exynos5422-odroidxu4.dtb; bootz 0x40008000 - 0x44000000"
+
+# --- Screen Configuration for HDMI --- # 
+# ---------------------------------------
+# Uncomment only ONE line! Leave all commented for automatic selection.
+# Uncomment only the setenv line!
+# ---------------------------------------
+# ODROID-VU forced resolution
+# setenv videoconfig "video=HDMI-A-1:1280x800 at 60"
+# -----------------------------------------------
+# ODROID-VU forced EDID
+# setenv videoconfig "drm_kms_helper.edid_firmware=edid/1280x800.bin"
+# -----------------------------------------------
+# 1920x1080 (1080P) with monitor provided EDID information. (1080p-edid)
+# setenv videoconfig "video=HDMI-A-1:1920x1080 at 60"
+# -----------------------------------------------
+# 1920x1080 (1080P) without monitor data using generic information (1080p-noedid)
+# setenv videoconfig "drm_kms_helper.edid_firmware=edid/1920x1080.bin"
+# -----------------------------------------------
+# 1920x1080 50hz (1080P) with monitor provided EDID information. (1080p 50hz-edid)
+# setenv videoconfig "video=HDMI-A-1:1920x1080 at 50"
+# -----------------------------------------------
+# 1920x1080 50hz (1080P) without monitor data using generic information (1080p 50hz-noedid)
+# setenv videoconfig "drm_kms_helper.edid_firmware=edid/1920x1080_50hz.bin"
+# -----------------------------------------------
+# 1440x900 with monitor provided EDID information.
+# setenv videoconfig "video=HDMI-A-1:1440x900 at 60"
+# -----------------------------------------------
+# 1440x900 without monitor data using generic information 
+# setenv videoconfig "drm_kms_helper.edid_firmware=edid/1440x900.bin"
+# -----------------------------------------------
+# 1280x720 (720P) with monitor provided EDID information. (720p-edid)
+# setenv videoconfig "video=HDMI-A-1:1280x720 at 60"
+# -----------------------------------------------
+# 1280x720 (720P) without monitor data using generic information (720p-noedid)
+# setenv videoconfig "drm_kms_helper.edid_firmware=edid/1280x720.bin"
+# -----------------------------------------------
+# 1024x768 without monitor data using generic information
+# setenv videoconfig "drm_kms_helper.edid_firmware=edid/1024x768.bin"
+# -----------------------------------------------
+# 800x600 without monitor data using generic information 
+# setenv videoconfig "drm_kms_helper.edid_firmware=edid/800x600.bin"
+# -----------------------------------------------
+# 800x480 without monitor data using generic information (ODROID 7")
+# setenv videoconfig "drm_kms_helper.edid_firmware=edid/800x480.bin"
+# -----------------------------------------------
+# 720x576 without monitor data using generic information 
+# setenv videoconfig "drm_kms_helper.edid_firmware=edid/720x576.bin"
+# -----------------------------------------------
+# 720x480 without monitor data using generic information 
+# setenv videoconfig "drm_kms_helper.edid_firmware=edid/720x480.bin"
+# -----------------------------------------------
+# 640x480 without monitor data using generic information
+# setenv videoconfig "drm_kms_helper.edid_firmware=edid/640x480.bin"
+
+
+# --- HDMI / DVI Mode Selection ---
+# ------------------------------------------
+# - HDMI Mode
+setenv vout "hdmi"
+# - DVI Mode (disables sound over HDMI as per DVI compat)
+# setenv vout "dvi"
+
+
+# --- CPU Governor Setup ---
+# Uncomment only one line. New governor is set after 90secs after boot.
+# ------------------------------------------
+# - Performance (Keep all the CPU's at Maximum frequency)
+setenv governor "performance"
+# ------------------------------------------
+# - Ondemand
+# setenv governor "ondemand"
+# ------------------------------------------
+# - Interactive (Pretty much just like ondemand with more possible customization via sysfs.)
+# setenv governor "interactive"
+# ------------------------------------------
+# - Conservative (Like ondemand, but do the frequency transitions more slowly, great for battery powered applications)
+# setenv governor "conservative"
+# ------------------------------------------
+# - Powersave (Keeps the CPU's to the lowest possible temps)
+# setenv governor "powersave"
+
+
+#------------------------------------------------------------------------------
+#
+# HDMI-PHY Parameter Control
+#
+#------------------------------------------------------------------------------
+#------------------------------------------------------------------------------
+#
+# HDMI Hot Plug detection
+#
+#------------------------------------------------------------------------------
+#
+# Forces the HDMI subsystem to ignore the check if the cable is connected or 
+# not.
+# false : disable the detection and force it as connected.
+# true : let cable, board and monitor decide the connection status.
+# 
+# default: true
+# 
+#------------------------------------------------------------------------------
+setenv HPD "true"
+
+#------------------------------------------------------------------------------
+#
+#  TMDS data amplitude control.
+#
+#------------------------------------------------------------------------------
+#
+#  1LSB corresponds to 20 mVdiff amplitude level.
+#  tx_amp_lvl : 0 = 760 mVdiff(Min), 31 = 1380 mVdiff(Max)
+#
+#  Hardkernel default hdmi_tx_amp_lvl = 31(1380 mVdiff);
+#------------------------------------------------------------------------------
+setenv hdmi_tx_amp_lvl  "31"
+
+#------------------------------------------------------------------------------
+#
+#  TMDS data amplitude fine control for each channel.
+#
+#------------------------------------------------------------------------------
+#
+#  1LSB corresponds to 20 mVdiff amplitude level.
+#  tx_lvl : 0 = 0 mVdiff(Min), 3 = 60 mVdiff(Max)
+#
+#  Hardkernel default
+#      hdmi_tx_lvl_ch0 = 3, hdmi_tx_lvl_ch1 = 3, hdmi_tx_lvl_ch2 = 3,
+#------------------------------------------------------------------------------
+setenv hdmi_tx_lvl_ch0      "3"
+setenv hdmi_tx_lvl_ch1      "3"
+setenv hdmi_tx_lvl_ch2      "3"
+
+#------------------------------------------------------------------------------
+#
+#  TMDS data pre-emphasis level control.
+#
+#------------------------------------------------------------------------------
+#
+#  1LSB corresponds to -0.45dB emphasis level except for 1
+#  tx_emp_lvl : 0 = 0 db(Min), 1 = -0.25 db, 2 = 0.7 db, 15 = -7.45 db(Max)
+#
+#  Hardkernel default hdmi_tx_emp_lvl = 6 (-2.50 db);
+#------------------------------------------------------------------------------
+setenv hdmi_tx_emp_lvl      "6"
+
+#------------------------------------------------------------------------------
+#
+#  TMDS clock amplitude control.
+#
+#------------------------------------------------------------------------------
+#
+#  1LSB corresponds to 20 mVdiff amplitude level.
+#  clk_amp_lvl : 0 = 790 mVdiff(Min), 31 = 1410 mVdiff(Max)
+#
+#  Hardkernel default hdmi_clk_amp_lvl = 31 (1410 mVdiff)
+#------------------------------------------------------------------------------
+setenv hdmi_clk_amp_lvl     "31"
+
+#------------------------------------------------------------------------------
+#
+#  TMDS data source termination resistor control.
+#
+#------------------------------------------------------------------------------
+#
+#  tx_res :
+#      0 = Source Termination OFF(Min), 1 = 200 ohm, 2 = 300 ohm, 3 = 120 ohm(Max)
+#
+#  Hardkernrel default hdmi_tx_res = 0 (Source Termination OFF)
+#------------------------------------------------------------------------------
+setenv hdmi_tx_res      "0"
+
+#------------------------------------------------------------------------------
+
+setenv hdmi_phy_control "hdmi_tx_amp_lvl=${hdmi_tx_amp_lvl} hdmi_tx_lvl_ch0=${hdmi_tx_lvl_ch0} hdmi_tx_lvl_ch1=${hdmi_tx_lvl_ch1} hdmi_tx_lvl_ch2=${hdmi_tx_lvl_ch2} hdmi_tx_emp_lvl=${hdmi_tx_emp_lvl} hdmi_clk_amp_lvl=${hdmi_clk_amp_lvl} hdmi_tx_res=${hdmi_tx_res} HPD=${HPD} vout=${vout}"
+
+# final boot args
+setenv bootargs "${bootrootfs} ${videoconfig} smsc95xx.macaddr=${macaddr} governor=${governor} ${hdmi_phy_control}"
+# drm.debug=0xff
+# Boot the board
+boot
+
diff --git a/board/hardkernel/odroidxu4/genimage.cfg b/board/hardkernel/odroidxu4/genimage.cfg
new file mode 100644
index 0000000..585b5cb
--- /dev/null
+++ b/board/hardkernel/odroidxu4/genimage.cfg
@@ -0,0 +1,55 @@
+image boot.vfat {
+	vfat {
+		files = {
+			"boot.ini",
+			"zImage",
+			"exynos5422-odroidxu4.dtb"
+		}
+	}
+	size = 129M
+}
+
+image sdcard.img {
+	hdimage {
+	}
+
+	partition bl1 {
+		in-partition-table = "no"
+		image = "bl1.bin.hardkernel"
+		offset = 512
+		size = 15360
+	}
+
+	partition bl2 {
+		in-partition-table = "no"
+		image = "bl2.bin.hardkernel.720k_uboot"
+		offset = 15872
+		size = 16384
+	}
+
+	partition u-boot {
+		in-partition-table = "no"
+		image = "u-boot-dtb.bin"
+		offset = 32256
+		size = 720k
+	}
+
+	partition tzsw {
+		in-partition-table = "no"
+		image = "tzsw.bin.hardkernel"
+		offset = 769536
+		size = 256k
+	}
+
+	partition vfat {
+		partition-type = 0xC
+		image = "boot.vfat"
+		offset = 2097152
+	}
+
+	partition rootfs {
+		partition-type = 0x83
+		image = "rootfs.ext4"
+		size = 1024M
+	}
+}
diff --git a/board/hardkernel/odroidxu4/post-image.sh b/board/hardkernel/odroidxu4/post-image.sh
new file mode 100755
index 0000000..025906c
--- /dev/null
+++ b/board/hardkernel/odroidxu4/post-image.sh
@@ -0,0 +1,24 @@
+#!/bin/sh
+
+BOARD_DIR="$(dirname $0)"
+GENIMAGE_CFG="${BOARD_DIR}/genimage.cfg"
+GENIMAGE_TMP="${BUILD_DIR}/genimage.tmp"
+
+cp ${BOARD_DIR}/boot.ini ${BINARIES_DIR}/
+
+# The bl1.bin.hardkernel file provided by the uboot hardkernel repository is overwritten
+# by the bl2.bin.hardkernel in the sd_fusing.sh script because it is too big.
+# In order to implement this in genimage, we need to truncate the bl1.bin file
+# so that it does not exceed the available place.
+# An issue has been filled about this: https://github.com/hardkernel/u-boot/issues/45
+truncate -s 15360 ${BINARIES_DIR}/bl1.bin.hardkernel
+
+rm -rf "${GENIMAGE_TMP}"
+
+genimage                           \
+	--rootpath "${TARGET_DIR}"     \
+	--tmppath "${GENIMAGE_TMP}"    \
+	--inputpath "${BINARIES_DIR}"  \
+	--outputpath "${BINARIES_DIR}" \
+	--config "${GENIMAGE_CFG}"
+
diff --git a/board/hardkernel/odroidxu4/readme.txt b/board/hardkernel/odroidxu4/readme.txt
new file mode 100644
index 0000000..e3cba8b
--- /dev/null
+++ b/board/hardkernel/odroidxu4/readme.txt
@@ -0,0 +1,37 @@
+Odroid XU-4 board with Samsung Exynos 5422 SoC
+
+How to build it
+===============
+
+  $ make odroidxu4_defconfig
+
+Then you can edit the build options using
+
+  $ make menuconfig
+
+Compile all and build rootfs image:
+
+  $ make
+
+Note: you will need to have access to the network, since Buildroot will
+download the packages' sources.
+
+Result of the build
+-------------------
+
+After building, you should obtain all output files in output/images/
+
+
+How to write the SD card or eMMC
+================================
+
+Once the build process is finished you will have an image called "sdcard.img"
+in the output/images/ directory.
+
+Copy the bootable "sdcard.img" onto an SD card or eMMC with "dd":
+
+  $ sudo dd if=output/images/sdcard.img of=/dev/sdX
+
+Insert the SDcard into your ODROID-XU4, and power it up. Your new system
+should come up now.
+
diff --git a/configs/odroidxu4_defconfig b/configs/odroidxu4_defconfig
new file mode 100644
index 0000000..f457b05
--- /dev/null
+++ b/configs/odroidxu4_defconfig
@@ -0,0 +1,25 @@
+BR2_arm=y
+BR2_cortex_a7=y
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/hardkernel/odroidxu4/post-image.sh"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_GIT=y
+BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/hardkernel/linux.git"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="4.14.16-104"
+BR2_LINUX_KERNEL_DEFCONFIG="odroidxu4"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="exynos5422-odroidxu4"
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_ROOTFS_EXT2_SIZE="1024M"
+# BR2_TARGET_ROOTFS_TAR is not set
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_GIT=y
+BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://github.com/hardkernel/u-boot.git"
+BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="88af53fbcef8386cb4d5f04c19f4b2bcb69e90ca"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="odroid-xu4"
+BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_TARGET_UBOOT_FORMAT_DTB_BIN=y
+BR2_TARGET_UBOOT_SPL=y
+BR2_TARGET_UBOOT_SPL_NAME="sd_fuse/bl1.bin.hardkernel sd_fuse/bl2.bin.hardkernel.720k_uboot sd_fuse/tzsw.bin.hardkernel "
+BR2_PACKAGE_HOST_GENIMAGE=y
-- 
2.7.4
