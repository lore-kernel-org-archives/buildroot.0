From: =?UTF-8?q?Jan=20Kundr=C3=A1t?= <jan.kundrat@cesnet.cz>
Date: Mon, 4 Sep 2017 16:58:10 +0200
Subject: [Buildroot] [PATCH v2 1/1] New board: SolidRun ClearFog Base
In-Reply-To: <20170904104128.rbpp3qjkgyi6kafu@sapphire.tkos.co.il>
References: <20170904104128.rbpp3qjkgyi6kafu@sapphire.tkos.co.il>
Message-ID: <286913cf8082a174d123f2581b9e61ad5250d8b7.1504541978.git.jan.kundrat@cesnet.cz>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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

Signed-off-by: Jan Kundr?t <jan.kundrat@cesnet.cz>

---
Changes v1 -> v2:
    - added a README
    - use boot.scr instead of patching uboot
    - use ithe internal toolchain
    - use the generic genimage.sh
    - use buildroot's defaults where possible
    - pin uboot version

Signed-off-by: Jan Kundr?t <jan.kundrat@cesnet.cz>
---
 board/solidrun/clearfog/boot.scr.txt   |  5 +++
 board/solidrun/clearfog/genimage.cfg   | 16 +++++++++
 board/solidrun/clearfog/linux.fragment |  1 +
 board/solidrun/clearfog/post-build.sh  |  3 ++
 board/solidrun/clearfog/readme.txt     | 62 ++++++++++++++++++++++++++++++++++
 configs/clearfog_defconfig             | 31 +++++++++++++++++
 6 files changed, 118 insertions(+)
 create mode 100644 board/solidrun/clearfog/boot.scr.txt
 create mode 100644 board/solidrun/clearfog/genimage.cfg
 create mode 100644 board/solidrun/clearfog/linux.fragment
 create mode 100755 board/solidrun/clearfog/post-build.sh
 create mode 100644 board/solidrun/clearfog/readme.txt
 create mode 100644 configs/clearfog_defconfig

diff --git a/board/solidrun/clearfog/boot.scr.txt b/board/solidrun/clearfog/boot.scr.txt
new file mode 100644
index 0000000..a2332e3
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
index 0000000..8963619
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
index 0000000..b7ed5b0
--- /dev/null
+++ b/board/solidrun/clearfog/linux.fragment
@@ -0,0 +1 @@
+CONFIG_SENSORS_MCP3021=y
diff --git a/board/solidrun/clearfog/post-build.sh b/board/solidrun/clearfog/post-build.sh
new file mode 100755
index 0000000..ff22ebd
--- /dev/null
+++ b/board/solidrun/clearfog/post-build.sh
@@ -0,0 +1,3 @@
+#!/bin/sh
+
+install -m 0644 -D $BINARIES_DIR/boot.scr $TARGET_DIR/boot/boot.scr
diff --git a/board/solidrun/clearfog/readme.txt b/board/solidrun/clearfog/readme.txt
new file mode 100644
index 0000000..0962d49
--- /dev/null
+++ b/board/solidrun/clearfog/readme.txt
@@ -0,0 +1,62 @@
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
+Build
+=====
+
+Start with the default Buildroot's configuration for Clearfog:
+
+  make clearfog_defconfig
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
+  the SOM, and "off" means towards the SFP cage. Yes, it's different than what
+  the vendor says in the manual.
+- Connect to the board's console over the microUSB port.
+- Insert the SD card into the slot on the board (pins up).
+- Power up the board.
diff --git a/configs/clearfog_defconfig b/configs/clearfog_defconfig
new file mode 100644
index 0000000..05df38c
--- /dev/null
+++ b/configs/clearfog_defconfig
@@ -0,0 +1,31 @@
+BR2_arm=y
+BR2_cortex_a9=y
+BR2_ARM_ENABLE_NEON=y
+BR2_ARM_ENABLE_VFP=y
+BR2_ARM_FPU_NEON=y
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/solidrun/clearfog/post-build.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/solidrun/clearfog/genimage.cfg"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.12.10"
+BR2_LINUX_KERNEL_DEFCONFIG="mvebu_v7"
+BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/solidrun/clearfog/linux.fragment"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="armada-388-clearfog-base"
+BR2_LINUX_KERNEL_INSTALL_TARGET=y
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_ROOTFS_EXT2_SIZE="64M"
+# BR2_TARGET_ROOTFS_TAR is not set
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2017.07"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="clearfog"
+# BR2_TARGET_UBOOT_FORMAT_BIN is not set
+BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
+BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot-spl.kwb"
+BR2_TARGET_UBOOT_BOOT_SCRIPT=y
+BR2_TARGET_UBOOT_BOOT_SCRIPT_SOURCE="board/solidrun/clearfog/boot.scr.txt"
+BR2_PACKAGE_HOST_GENIMAGE=y
-- 
2.10.2
