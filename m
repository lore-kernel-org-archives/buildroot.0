From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun, 1 Apr 2018 12:52:27 +0200
Subject: [Buildroot] [git commit] New board: SolidRun ClearFog Base
Message-ID: <20180401105231.56FF881566@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ee156ad4804f0f23c4f939831377a0bb9d42717d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

My goal was to rely on upstreamed features as much as possible, which
means that some bits are only half-baked for now:

- Due to the DTS restructuring in upstream kernel, we require 4.11+. The
latest LTS or CIP kernels do not know about the -Base model.

- Linux has no generic support for SFP cages (yet). It seems that this
has hit the net-next tree in August 2017, but there's been no release
(it's probably targettting 4.14). Also, the merge only included the
required infrastructure; the mvneta driver conversion is not included.
Patches which finalize this exist in Russel King's tree and also in
random vendor trees.

- There's no access to the SPI flash in these versions of
uboot/linux/dts.

Signed-off-by: Jan Kundr??t <jan.kundrat@cesnet.cz>
[Arnout:
 - rename to solidrun_clearfog_defconfig;
 - specify kernel headers version (default is now 4.15);
 - remove ext2 fs size override, the 4 extra MB are not needed;
 - U-Boot needs dtc and openssl;
 - add comments to defconfig;
 - update .gitlab-ci.yml;
 - mention in readme.txt that SFP support is missing;
 - add Jan to DEVELOPERS.
]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 .gitlab-ci.yml                         |  1 +
 DEVELOPERS                             |  4 ++
 board/solidrun/clearfog/boot.scr.txt   |  5 +++
 board/solidrun/clearfog/genimage.cfg   | 16 ++++++++
 board/solidrun/clearfog/linux.fragment |  1 +
 board/solidrun/clearfog/post-build.sh  |  3 ++
 board/solidrun/clearfog/readme.txt     | 68 ++++++++++++++++++++++++++++++++++
 configs/solidrun_clearfog_defconfig    | 44 ++++++++++++++++++++++
 8 files changed, 142 insertions(+)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index fcb53d6451..423f729660 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -240,6 +240,7 @@ snps_archs38_haps_defconfig: *defconfig
 snps_archs38_hsdk_defconfig: *defconfig
 snps_archs38_vdk_defconfig: *defconfig
 socrates_cyclone5_defconfig: *defconfig
+solidrun_clearfog_defconfig: *defconfig
 solidrun_macchiatobin_mainline_defconfig: *defconfig
 solidrun_macchiatobin_marvell_defconfig: *defconfig
 stm32f429_disco_defconfig: *defconfig
diff --git a/DEVELOPERS b/DEVELOPERS
index ee66cdd6c1..45c13d39eb 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -861,6 +861,10 @@ F:	package/yad/
 N:	Jan Heylen <jan.heylen@nokia.com>
 F:	package/opentracing-cpp/
 
+N:	Jan Kundr??t <jan.kundrat@cesnet.cz>
+F:	configs/solidrun_clearfog_defconfig
+F:	board/solidrun/clearfog/
+
 N:	Jan Kraval <jan.kraval@gmail.com>
 F:	board/orangepi/orangepi-lite
 F:	configs/orangepi_lite_defconfig
diff --git a/board/solidrun/clearfog/boot.scr.txt b/board/solidrun/clearfog/boot.scr.txt
new file mode 100644
index 0000000000..a2332e3960
--- /dev/null
+++ b/board/solidrun/clearfog/boot.scr.txt
@@ -0,0 +1,5 @@
+setenv fdtfile armada-388-clearfog-base.dtb
+setenv bootargs root=/dev/mmcblk0p1
+load ${devtype} ${devnum}:${distro_bootpart} ${fdt_addr_r} ${prefix}/${fdtfile}
+load ${devtype} ${devnum}:${distro_bootpart} ${kernel_addr_r} ${prefix}/zImage
+bootz ${kernel_addr_r} - ${fdt_addr_r}
diff --git a/board/solidrun/clearfog/genimage.cfg b/board/solidrun/clearfog/genimage.cfg
new file mode 100644
index 0000000000..8963619cc5
--- /dev/null
+++ b/board/solidrun/clearfog/genimage.cfg
@@ -0,0 +1,16 @@
+image sdcard.img {
+	hdimage {
+	}
+
+	partition u-boot {
+		in-partition-table = "no"
+		image = "u-boot-spl.kwb"
+		offset = 512
+	}
+
+	partition rootfs {
+		partition-type = 0x83
+		image = "rootfs.ext4"
+		offset = 1M
+	}
+}
diff --git a/board/solidrun/clearfog/linux.fragment b/board/solidrun/clearfog/linux.fragment
new file mode 100644
index 0000000000..b7ed5b00d6
--- /dev/null
+++ b/board/solidrun/clearfog/linux.fragment
@@ -0,0 +1 @@
+CONFIG_SENSORS_MCP3021=y
diff --git a/board/solidrun/clearfog/post-build.sh b/board/solidrun/clearfog/post-build.sh
new file mode 100755
index 0000000000..ff22ebd6e5
--- /dev/null
+++ b/board/solidrun/clearfog/post-build.sh
@@ -0,0 +1,3 @@
+#!/bin/sh
+
+install -m 0644 -D $BINARIES_DIR/boot.scr $TARGET_DIR/boot/boot.scr
diff --git a/board/solidrun/clearfog/readme.txt b/board/solidrun/clearfog/readme.txt
new file mode 100644
index 0000000000..b56f0a9b49
--- /dev/null
+++ b/board/solidrun/clearfog/readme.txt
@@ -0,0 +1,68 @@
+**********************
+SolidRun Clearfog Base
+**********************
+
+This file documents Buildroot's support for the Clearfog Base by Solid Run.
+
+Vendor's documentation:
+https://wiki.solid-run.com/doku.php?id=products:a38x:documents
+
+Warning for eMMC variant of the MicroSoM
+========================================
+
+If you bought a MicroSoM version that includes an on-board eMMC flash, the
+built-in microSD card slot *WILL NOT WORK*. The Internet says that you have to
+upload the first bootloader via UART. This manual does not cover these steps;
+only MicroSoMs without the eMMC are supported.
+
+Limitations
+===========
+
+There's no access to the SPI flash in this combination of kernel/uboot/dts.
+
+There is no support for the SFP.
+
+Build
+=====
+
+Start with the default Buildroot's configuration for Clearfog:
+
+  make solidrun_clearfog_defconfig
+
+Build all components:
+
+  make
+
+The results of the build are available in ./output/images.
+
+Create a bootable SD card
+=========================
+
+To determine the device associated to the SD card have a look in the
+/proc/partitions file:
+
+  cat /proc/partitions
+
+Buildroot prepares a bootable "sdcard.img" image in the output/images/
+directory, ready to be dumped on a microSD card. Launch the following
+command as root:
+
+  dd if=./output/images/sdcard.img of=/dev/<your-microsd-device>
+
+*** WARNING! The script will destroy all the card content. Use with care! ***
+
+For details about the medium image layout, see the definition in
+board/solidrun/clearfog/genimage.cfg.
+
+Boot the Clearfog board
+=======================
+
+Here's how to boot the board:
+
+- Set up the DIP switches for microSD boot. The correct values are:
+  1: off, 2: off, 3: ON, 4: ON, 5: ON. In this scheme, switch #1" is closer to
+  the ethernet ports and #5 is closer to the microSD card, "ON" means towards
+  the SOM, and "off" means towards the SFP cage.
+- Connect to the board's console over the microUSB port.
+- Insert the SD card into the slot on the board (pins up).
+- Power up the board.
diff --git a/configs/solidrun_clearfog_defconfig b/configs/solidrun_clearfog_defconfig
new file mode 100644
index 0000000000..7c426e5ad9
--- /dev/null
+++ b/configs/solidrun_clearfog_defconfig
@@ -0,0 +1,44 @@
+# Architecture
+BR2_arm=y
+BR2_cortex_a9=y
+BR2_ARM_ENABLE_NEON=y
+BR2_ARM_ENABLE_VFP=y
+BR2_ARM_FPU_NEON=y
+
+# Linux headers same as kernel, a 4.12 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_12=y
+
+# System configuration
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/solidrun/clearfog/post-build.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/solidrun/clearfog/genimage.cfg"
+
+# Kernel
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.12.10"
+BR2_LINUX_KERNEL_DEFCONFIG="mvebu_v7"
+BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/solidrun/clearfog/linux.fragment"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="armada-388-clearfog-base"
+BR2_LINUX_KERNEL_INSTALL_TARGET=y
+
+# Filesystem
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+# BR2_TARGET_ROOTFS_TAR is not set
+BR2_PACKAGE_HOST_GENIMAGE=y
+
+# Bootloader
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2017.07"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="clearfog"
+BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
+# BR2_TARGET_UBOOT_FORMAT_BIN is not set
+BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
+BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot-spl.kwb"
+BR2_TARGET_UBOOT_BOOT_SCRIPT=y
+BR2_TARGET_UBOOT_BOOT_SCRIPT_SOURCE="board/solidrun/clearfog/boot.scr.txt"
