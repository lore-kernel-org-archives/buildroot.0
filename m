From: Sven Haardiek <sven.haardiek@iotec-gmbh.de>
Date: Thu, 19 Apr 2018 11:37:22 +0200
Subject: [Buildroot] [PATCH 1/1] New board: FriendlyARM NanoPi Duo
Message-ID: <20180419093722.10667-1-sven.haardiek@iotec-gmbh.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Introduce a new board the FriendlyARM NanoPi Duo.

- Due to the missing defconfigs and DTS in the mainline kernel and uboot, I
  used the ones from the FriendlyARM github page.

- Most of the configuration was copied from the other friendlyarm boards.

Signed-off-by: Sven Haardiek <sven.haardiek@iotec-gmbh.de>
---
 board/friendlyarm/nanopi-duo/boot.cmd     |  8 ++++++
 board/friendlyarm/nanopi-duo/genimage.cfg | 33 +++++++++++++++++++++
 board/friendlyarm/nanopi-duo/readme.txt   | 35 +++++++++++++++++++++++
 configs/friendlyarm_nanopi_duo_defconfig  | 31 ++++++++++++++++++++
 4 files changed, 107 insertions(+)
 create mode 100644 board/friendlyarm/nanopi-duo/boot.cmd
 create mode 100644 board/friendlyarm/nanopi-duo/genimage.cfg
 create mode 100644 board/friendlyarm/nanopi-duo/readme.txt
 create mode 100644 configs/friendlyarm_nanopi_duo_defconfig

diff --git a/board/friendlyarm/nanopi-duo/boot.cmd b/board/friendlyarm/nanopi-duo/boot.cmd
new file mode 100644
index 0000000000..56a2893b4d
--- /dev/null
+++ b/board/friendlyarm/nanopi-duo/boot.cmd
@@ -0,0 +1,8 @@
+setenv fdt_high ffffffff
+
+setenv bootargs console=ttyS0,115200 earlyprintk root=/dev/mmcblk1p2 rootwait
+
+fatload mmc 0 $kernel_addr_r zImage
+fatload mmc 0 $fdt_addr_r sun8i-h2-plus-nanopi-duo.dtb
+
+bootz $kernel_addr_r - $fdt_addr_r
diff --git a/board/friendlyarm/nanopi-duo/genimage.cfg b/board/friendlyarm/nanopi-duo/genimage.cfg
new file mode 100644
index 0000000000..8b3cc1fe75
--- /dev/null
+++ b/board/friendlyarm/nanopi-duo/genimage.cfg
@@ -0,0 +1,33 @@
+image boot.vfat {
+	vfat {
+		files = {
+			"zImage",
+            "sun8i-h2-plus-nanopi-duo.dtb",
+            "boot.scr"
+		}
+	}
+	size = 16M
+}
+
+image sdcard.img {
+	hdimage {
+	}
+
+	partition spl {
+		in-partition-table = "no"
+		image = "u-boot-sunxi-with-spl.bin"
+		offset = 8192
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
+		size = 512M
+	}
+}
diff --git a/board/friendlyarm/nanopi-duo/readme.txt b/board/friendlyarm/nanopi-duo/readme.txt
new file mode 100644
index 0000000000..b8b6024171
--- /dev/null
+++ b/board/friendlyarm/nanopi-duo/readme.txt
@@ -0,0 +1,35 @@
+Intro
+=====
+
+This default configuration will allow you to start experimenting with the
+buildroot environment for the Nanopi DUO. With the current configuration
+it will bring-up the board, and allow access through the serial console.
+
+Nanopi DUO link:
+http://www.nanopi.org/Nanopi-Duo_Feature.html
+
+Wiki link:
+http://wiki.friendlyarm.com/wiki/index.php/NanoPi_Duo
+
+How to build
+============
+
+    $ make friendlyarm_nanopi_duo_defconfig
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
+Insert the micro SDcard in your Nanopi DUO and power it up. The console is on
+the serial line, 115200 8N1.
diff --git a/configs/friendlyarm_nanopi_duo_defconfig b/configs/friendlyarm_nanopi_duo_defconfig
new file mode 100644
index 0000000000..8539deaccf
--- /dev/null
+++ b/configs/friendlyarm_nanopi_duo_defconfig
@@ -0,0 +1,31 @@
+BR2_arm=y
+BR2_cortex_a7=y
+BR2_ARM_FPU_VFPV4=y
+BR2_TARGET_GENERIC_HOSTNAME="nanopi-duo"
+BR2_TARGET_GENERIC_ISSUE="Welcome to Buildroot for the NanoPi DUO"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/friendlyarm/nanopi-duo/genimage.cfg"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_GIT=y
+BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/friendlyarm/linux.git"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="sunxi-4.16.y"
+BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="sun8i-h2-plus-nanopi-duo"
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_GIT=y
+BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://github.com/friendlyarm/u-boot.git"
+BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="sunxi-v2017.x"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="nanopi_h3"
+BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
+BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
+BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot-sunxi-with-spl.bin"
+BR2_TARGET_UBOOT_BOOT_SCRIPT=y
+BR2_TARGET_UBOOT_BOOT_SCRIPT_SOURCE="board/friendlyarm/nanopi-duo/boot.cmd"
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_MTOOLS=y
-- 
2.17.0
