From: sunil at amarulasolutions.com <sunil@amarulasolutions.com>
Date: Sun,  3 May 2020 14:41:16 +0530
Subject: [Buildroot] [PATCH v2 1/2] configs/rockpro64: new defconfig
In-Reply-To: <1588497077-27220-1-git-send-email-sunil@amarulasolutions.com>
References: <20200502233409.4a90d4b2@windsurf.home>
 <1588497077-27220-1-git-send-email-sunil@amarulasolutions.com>
Message-ID: <1588497077-27220-2-git-send-email-sunil@amarulasolutions.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Suniel Mahesh <sunil@amarulasolutions.com>

A defconfig for the rockpro64 was added in
59e1077b4ebe79622a454b0a8a840e4349a0440d, but then removed
in 10f49213b7e2837ae6ed63fc16fbdaa954ecd87f because an ARM32
compiler was needed to build ATF, and this was not supported
back then.

Now, since package/arm-gnu-a-toolchain/ has been added, this
defconfig can be re-introduced.

Following new changes are introduced in comparision with the
older changeset:

    - renamed defconfig from pine64_rockpro64 to rockpro64
    - updated readme
    - using a GPT partition layout
    - update defconfig to build ATF
    - bump u-boot to 2020.04
    - bump linux to 5.4.35

Signed-off-by: Suniel Mahesh <sunil@amarulasolutions.com>
---
Changes for v2:
- merged this patch @ http://patchwork.ozlabs.org/project/buildroot/list/?series=174156
  into this series.
- change contact for just only rockpro64.
- As suggested by Thomas Pettazzoni, rk3399 targets does not need
  pylibfdt or pyelftools, but only a host Python interpreter. Remove
  them and add python, python3 in defconfig.
---
 .gitlab-ci.yml                       |  1 +
 DEVELOPERS                           |  2 ++
 board/pine64/rockpro64/extlinux.conf |  4 +++
 board/pine64/rockpro64/genimage.cfg  | 39 +++++++++++++++++++++++
 board/pine64/rockpro64/post-build.sh |  5 +++
 board/pine64/rockpro64/readme.txt    | 60 ++++++++++++++++++++++++++++++++++++
 configs/rockpro64_defconfig          | 56 +++++++++++++++++++++++++++++++++
 7 files changed, 167 insertions(+)
 create mode 100644 board/pine64/rockpro64/extlinux.conf
 create mode 100644 board/pine64/rockpro64/genimage.cfg
 create mode 100755 board/pine64/rockpro64/post-build.sh
 create mode 100644 board/pine64/rockpro64/readme.txt
 create mode 100644 configs/rockpro64_defconfig

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index fa8e077..32c3247 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -318,6 +318,7 @@ raspberrypi_defconfig: { extends: .defconfig }
 riotboard_defconfig: { extends: .defconfig }
 roc_pc_rk3399_defconfig: { extends: .defconfig }
 rock64_defconfig: { extends: .defconfig }
+rockpro64_defconfig: { extends: .defconfig }
 roseapplepi_defconfig: { extends: .defconfig }
 s6lx9_microboard_defconfig: { extends: .defconfig }
 sheevaplug_defconfig: { extends: .defconfig }
diff --git a/DEVELOPERS b/DEVELOPERS
index e427ab1..2b562d5 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2425,7 +2425,9 @@ F:	package/powertop/
 
 N:	Suniel Mahesh <sunil@amarulasolutions.com>
 F:	board/firefly/
+F:	board/pine64/rockpro64
 F:	configs/roc_pc_rk3399_defconfig
+F:	configs/rockpro64_defconfig
 F:	package/arm-gnu-a-toolchain/
 
 N:	Sven Haardiek <sven.haardiek@iotec-gmbh.de>
diff --git a/board/pine64/rockpro64/extlinux.conf b/board/pine64/rockpro64/extlinux.conf
new file mode 100644
index 0000000..ea081a1
--- /dev/null
+++ b/board/pine64/rockpro64/extlinux.conf
@@ -0,0 +1,4 @@
+label RK3399_ROCKPRO64 linux
+  kernel /Image
+  devicetree /rk3399-rockpro64.dtb
+  append earlycon=uart8250,mmio32,0xff1a0000 root=/dev/mmcblk0p4 rw rootwait
diff --git a/board/pine64/rockpro64/genimage.cfg b/board/pine64/rockpro64/genimage.cfg
new file mode 100644
index 0000000..41358ed
--- /dev/null
+++ b/board/pine64/rockpro64/genimage.cfg
@@ -0,0 +1,39 @@
+image boot.vfat {
+	vfat {
+		files = {
+			"Image",
+			"rk3399-rockpro64.dtb",
+			"extlinux"
+		}
+	}
+	size = 112M
+}
+
+image sdcard.img {
+
+	hdimage {
+		gpt = true
+	}
+
+	partition loader1 {
+		image = "idbloader.img"
+		offset = 32K
+	}
+
+	partition loader2 {
+		image = "u-boot.itb"
+		offset = 8M
+	}
+
+	partition boot {
+		partition-type = 0xC
+		bootable = "true"
+		image = "boot.vfat"
+		offset = 16M
+	}
+
+	partition rootfs {
+		partition-type = 0x83
+		image = "rootfs.ext4"
+	}
+}
diff --git a/board/pine64/rockpro64/post-build.sh b/board/pine64/rockpro64/post-build.sh
new file mode 100755
index 0000000..ba29375
--- /dev/null
+++ b/board/pine64/rockpro64/post-build.sh
@@ -0,0 +1,5 @@
+#!/bin/sh
+
+BOARD_DIR="$(dirname $0)"
+
+install -m 0644 -D $BOARD_DIR/extlinux.conf $BINARIES_DIR/extlinux/extlinux.conf
diff --git a/board/pine64/rockpro64/readme.txt b/board/pine64/rockpro64/readme.txt
new file mode 100644
index 0000000..de86970
--- /dev/null
+++ b/board/pine64/rockpro64/readme.txt
@@ -0,0 +1,60 @@
+PINE64 ROCKPro64
+================
+https://www.pine64.org/rockpro64/
+
+Build:
+======
+  $ make rockpro64_defconfig
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
+????????? rk3399-rockpro64.dtb
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
+Where X is your SD card device.
+
+Booting:
+========
+RockPro64 has a 40-pin PI-2 GPIO Bus.
+
+Connect a jumper between pin 23 and pin 25 for SD card boot.
+
+Serial console:
+---------------
+The pin layout for serial console on PI-2 GPIO Bus is as follows:
+
+pin 6:  gnd
+pin 8:  tx
+pin 10: rx
+
+Initially connect pin 6 and pin 8(transmit). Apply power to RockPro64, once the
+power is on then connect pin 10(receive).
+
+Baudrate for this board is 1500000.
+
+Login:
+------
+Enter 'root' as login user, and the prompt is ready.
+
+https://wiki.amarulasolutions.com/bsp/rockchip/rk3399/rockpro64.html
diff --git a/configs/rockpro64_defconfig b/configs/rockpro64_defconfig
new file mode 100644
index 0000000..6721349
--- /dev/null
+++ b/configs/rockpro64_defconfig
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
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="rockpro64-rk3399"
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
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.4.35"
+BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="rockchip/rk3399-rockpro64"
+BR2_LINUX_KERNEL_INSTALL_TARGET=y
+BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+
+# Filesystem
+BR2_TARGET_GENERIC_HOSTNAME="rockpro64"
+BR2_TARGET_GENERIC_ISSUE="Welcome to ROCKPRO64..!!"
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_ROOTFS_EXT2_SIZE="64M"
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_MTOOLS=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS=y
+BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/pine64/rockpro64/genimage.cfg"
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/pine64/rockpro64/post-build.sh"
-- 
2.7.4
