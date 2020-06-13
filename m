From: sunil at amarulasolutions.com <sunil@amarulasolutions.com>
Date: Sun, 14 Jun 2020 00:02:34 +0530
Subject: [Buildroot] [PATCH 4/4] configs/nanopc_t4: new defconfig
In-Reply-To: <1592073154-13731-1-git-send-email-sunil@amarulasolutions.com>
References: <1592073154-13731-1-git-send-email-sunil@amarulasolutions.com>
Message-ID: <1592073154-13731-5-git-send-email-sunil@amarulasolutions.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Suniel Mahesh <sunil@amarulasolutions.com>

A defconfig for the friendlyarm nanopc-t4 was added in
c23895f06e0988319a1959764a402b57bc21ffaf, but then removed
in 8efd4463f78fd68c85b45cc0da347dfb805abb7e because an ARM32
compiler was needed to build ATF, and this was not supported
back then.

Now, since package/arm-gnu-a-toolchain/ has been added, this
defconfig can be re-introduced.

Following new changes are introduced in comparision with the
older changeset:

	- updated readme
	- GPT partition layout is being used
	- update defconfig to build ATF
	- bump u-boot to 2020.04
	- bump linux to 5.4.46

Signed-off-by: Suniel Mahesh <sunil@amarulasolutions.com>
---
NOTE:
- new patch
---
 .gitlab-ci.yml                            |  1 +
 DEVELOPERS                                |  2 ++
 board/friendlyarm/nanopc-t4/extlinux.conf |  4 +++
 board/friendlyarm/nanopc-t4/genimage.cfg  | 39 +++++++++++++++++++++
 board/friendlyarm/nanopc-t4/post-build.sh |  5 +++
 board/friendlyarm/nanopc-t4/readme.txt    | 45 +++++++++++++++++++++++++
 configs/nanopc_t4_defconfig               | 56 +++++++++++++++++++++++++++++++
 7 files changed, 152 insertions(+)
 create mode 100644 board/friendlyarm/nanopc-t4/extlinux.conf
 create mode 100644 board/friendlyarm/nanopc-t4/genimage.cfg
 create mode 100755 board/friendlyarm/nanopc-t4/post-build.sh
 create mode 100644 board/friendlyarm/nanopc-t4/readme.txt
 create mode 100644 configs/nanopc_t4_defconfig

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 4ff0b4b..a3b268d 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -225,6 +225,7 @@ mx53loco_defconfig: { extends: .defconfig }
 mx6cubox_defconfig: { extends: .defconfig }
 mx6sx_udoo_neo_defconfig: { extends: .defconfig }
 mx6udoo_defconfig: { extends: .defconfig }
+nanopc_t4_defconfig: { extends: .defconfig }
 nanopi_m1_defconfig: { extends: .defconfig }
 nanopi_m1_plus_defconfig: { extends: .defconfig }
 nanopi_m4_defconfig: { extends: .defconfig }
diff --git a/DEVELOPERS b/DEVELOPERS
index 220bb34..4a1cab4 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2392,9 +2392,11 @@ F:	package/powertop/
 
 N:	Suniel Mahesh <sunil@amarulasolutions.com>
 F:	board/firefly/
+F:	board/friendlyarm/nanopc-t4
 F:	board/friendlyarm/nanopi-m4
 F:	board/orangepi/orangepi-rk3399
 F:	board/pine64/rockpro64
+F: 	configs/nanopc_t4_defconfig
 F: 	configs/nanopi_m4_defconfig
 F:	configs/orangepi_rk3399_defconfig
 F:	configs/roc_pc_rk3399_defconfig
diff --git a/board/friendlyarm/nanopc-t4/extlinux.conf b/board/friendlyarm/nanopc-t4/extlinux.conf
new file mode 100644
index 0000000..31c6b30
--- /dev/null
+++ b/board/friendlyarm/nanopc-t4/extlinux.conf
@@ -0,0 +1,4 @@
+label RK3399_NanoPC_T4 linux
+  kernel /Image
+  devicetree /rk3399-nanopc-t4.dtb
+  append earlycon=uart8250,mmio32,0xff1a0000 root=/dev/mmcblk1p4 rootwait
diff --git a/board/friendlyarm/nanopc-t4/genimage.cfg b/board/friendlyarm/nanopc-t4/genimage.cfg
new file mode 100644
index 0000000..7508c7d
--- /dev/null
+++ b/board/friendlyarm/nanopc-t4/genimage.cfg
@@ -0,0 +1,39 @@
+image boot.vfat {
+        vfat {
+                files = {
+                        "Image",
+                        "rk3399-nanopc-t4.dtb",
+                        "extlinux"
+                }
+        }
+        size = 112M
+}
+
+image sdcard.img {
+
+        hdimage {
+                gpt = true
+        }
+
+        partition loader1 {
+                image = "idbloader.img"
+                offset = 32K
+        }
+
+        partition loader2 {
+                image = "u-boot.itb"
+                offset = 8M
+        }
+
+        partition boot {
+                partition-type = 0xC
+                bootable = "true"
+                image = "boot.vfat"
+                offset = 16M
+        }
+
+        partition rootfs {
+                partition-type = 0x83
+                image = "rootfs.ext4"
+        }
+}
diff --git a/board/friendlyarm/nanopc-t4/post-build.sh b/board/friendlyarm/nanopc-t4/post-build.sh
new file mode 100755
index 0000000..ba29375
--- /dev/null
+++ b/board/friendlyarm/nanopc-t4/post-build.sh
@@ -0,0 +1,5 @@
+#!/bin/sh
+
+BOARD_DIR="$(dirname $0)"
+
+install -m 0644 -D $BOARD_DIR/extlinux.conf $BINARIES_DIR/extlinux/extlinux.conf
diff --git a/board/friendlyarm/nanopc-t4/readme.txt b/board/friendlyarm/nanopc-t4/readme.txt
new file mode 100644
index 0000000..6259c9e
--- /dev/null
+++ b/board/friendlyarm/nanopc-t4/readme.txt
@@ -0,0 +1,45 @@
+FriendlyARM NANOPC-T4
+=====================
+
+Build:
+
+  $ make nanopc_t4_defconfig
+  $ make
+
+Files created in output directory
+=================================
+
+output/images
+
+????????? bl31.elf
+????????? boot.vfat
+????????? extlinux
+????????? idbloader.img
+????????? Image
+????????? rk3399-nanopc-t4.dtb
+????????? rootfs.ext2
+????????? rootfs.ext4 -> rootfs.ext2
+????????? rootfs.tar
+????????? sdcard.img
+????????? u-boot.bin
+????????? u-boot.itb
+
+Creating bootable SD card:
+==========================
+
+Simply invoke (as root)
+
+sudo dd if=output/images/sdcard.img of=/dev/sdX && sync
+
+Where X is your SD card device
+
+Serial console
+--------------
+
+Baudrate for this board is 1500000
+
+Login:
+------
+Apply power and press the PWR button for 3 sec. Enter 'root' as login user, and the prompt is ready.
+
+https://wiki.amarulasolutions.com/bsp/rockchip/rk3399/npc_t4.html
diff --git a/configs/nanopc_t4_defconfig b/configs/nanopc_t4_defconfig
new file mode 100644
index 0000000..a936f07
--- /dev/null
+++ b/configs/nanopc_t4_defconfig
@@ -0,0 +1,56 @@
+# Architecture
+BR2_aarch64=y
+BR2_cortex_a72_a53=y
+
+# Linux headers same as kernel, a 5.4 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_4=y
+
+# Firmware
+BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_GIT=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_URL="https://git.trustedfirmware.org/TF-A/trusted-firmware-a.git"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_VERSION="11a0a46a899fcc3b1fdb214b382f3d7495d88eca"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="rk3399"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_NEEDS_ARM32_TOOLCHAIN=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_IMAGES=""
+
+# Bootloader
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2020.04"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="nanopc-t4-rk3399"
+BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_TARGET_UBOOT_NEEDS_PYTHON=y
+BR2_TARGET_UBOOT_NEEDS_PYTHON3=y
+BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
+BR2_TARGET_UBOOT_NEEDS_ATF_BL31_ELF=y
+BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
+BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot.itb"
+BR2_TARGET_UBOOT_SPL=y
+BR2_TARGET_UBOOT_SPL_NAME="idbloader.img"
+
+# Kernel
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.4.46"
+BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="rockchip/rk3399-nanopc-t4"
+BR2_LINUX_KERNEL_INSTALL_TARGET=y
+BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+
+# Filesystem
+BR2_TARGET_GENERIC_HOSTNAME="nanopc-t4"
+BR2_TARGET_GENERIC_ISSUE="Welcome to NanoPC-T4"
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_ROOTFS_EXT2_SIZE="96M"
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_MTOOLS=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS=y
+BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/friendlyarm/nanopc-t4/genimage.cfg"
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/friendlyarm/nanopc-t4/post-build.sh"
-- 
2.7.4
