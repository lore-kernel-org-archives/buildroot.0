From: =?UTF-8?q?Micha=C5=82=20=C5=81yszczek?= <michal.lyszczek@gmail.com>
Date: Wed,  2 Aug 2017 20:03:02 +0200
Subject: [Buildroot] [PATCH v2] New board - EVB SoCrates based on Altera
	Cyclone 5
Message-ID: <20170802180302.30300-1-michal.lyszczek@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Micha? ?yszczek <michal.lyszczek@bofc.pl>

Configuration contains:
  - building uboot (and spl) from altera's github
  - booting from SD card
  - working ethernet, serial, i2c, fpga_manager
  - minimal rootfs with busybox
  - ready to flash SD card image

Signed-off-by: Micha? ?yszczek <michal.lyszczek@bofc.pl>

---
Changes v1 -> v2:
  (all changes suggested by Thomas Petazzoni)
  - merged boot.scr and boot-env into single boot-env
  - removed create_sdcard.sh in favor of more complete genimage.cfg
  - changed size of vfat boot partition to more sane value
  - removed custom kernel defconfig and used one from kernel source tree
  - removed custom dts and used one from kernel source tree
  - corrected spelling in readme.txt
  - droped some custom config of buildroot (now using default ones)
  - added missing tools to create sdcard.img
  - removed binary SPL (all compiled from source now)

 board/altera/socrates_cyclone5/boot-env.txt |  8 ++++
 board/altera/socrates_cyclone5/genimage.cfg | 58 +++++++++++++++++++++++++++++
 board/altera/socrates_cyclone5/readme.txt   | 52 ++++++++++++++++++++++++++
 configs/socrates_cyclone5_defconfig         | 32 ++++++++++++++++
 4 files changed, 150 insertions(+)
 create mode 100644 board/altera/socrates_cyclone5/boot-env.txt
 create mode 100644 board/altera/socrates_cyclone5/genimage.cfg
 create mode 100644 board/altera/socrates_cyclone5/readme.txt
 create mode 100644 configs/socrates_cyclone5_defconfig

diff --git a/board/altera/socrates_cyclone5/boot-env.txt b/board/altera/socrates_cyclone5/boot-env.txt
new file mode 100644
index 0000000..ed5b613
--- /dev/null
+++ b/board/altera/socrates_cyclone5/boot-env.txt
@@ -0,0 +1,8 @@
+linux_load_address=0x100000
+linux_dtb_load_address=0x100
+linux_dtb=socfpga_cyclone5_socrates.dtb
+linux_load=mmc rescan; fatload mmc 0:1 ${linux_load_address} zImage; fatload mmc 0:1 ${linux_dtb_load_address} ${linux_dtb}
+bootargs=console=ttyS0,115200 root=/dev/mmcblk0p3 ro rootwait
+source_env=fatload mmc 0:1 0x2000000 boot.scr; source 0x2000000
+bootcmd=run linux_load; bootz ${linux_load_address} - ${linux_dtb_load_address}
+bootdelay=1
diff --git a/board/altera/socrates_cyclone5/genimage.cfg b/board/altera/socrates_cyclone5/genimage.cfg
new file mode 100644
index 0000000..63fef8b
--- /dev/null
+++ b/board/altera/socrates_cyclone5/genimage.cfg
@@ -0,0 +1,58 @@
+image boot.vfat {
+	vfat {
+		files = {
+			"zImage",
+			"socfpga_cyclone5_socrates.dtb"
+		}
+	}
+	size = 8M
+}
+
+image uboot.img {
+	hdimage {
+		partition-table = "no"
+	}
+
+	partition spl {
+		in-partition-table = "no"
+		image = "u-boot-spl.bin.crc"
+		offset = 0
+		size = 64k
+	}
+
+	partition uboot-full {
+		in-partition-table = "no"
+		image = "u-boot.img"
+		offset = 256k
+	}
+
+	size = 1M
+}
+
+image sdcard.img {
+	hdimage {
+	}
+
+	partition uboot-env {
+		in-partition-table = "no"
+		image = "uboot-env.bin"
+		offset = 17408 # 512 * 34 -> just after gpt
+	}
+
+	partition boot {
+		partition-type = 0xc
+		bootable = "true"
+		image = "boot.vfat"
+	}
+
+	partition uboot {
+		partition-type = 0xa2
+		image = "uboot.img"
+	}
+
+	partition rootfs {
+		partition-type = 0x83
+		image = "rootfs.ext2"
+		size = 500M
+	}
+}
diff --git a/board/altera/socrates_cyclone5/readme.txt b/board/altera/socrates_cyclone5/readme.txt
new file mode 100644
index 0000000..4e78fee
--- /dev/null
+++ b/board/altera/socrates_cyclone5/readme.txt
@@ -0,0 +1,52 @@
+EBV SoCrates Evaluation Board
+
+Intro
+=====
+
+More information about this board can be found here:
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
+??? boot.vfat
+??? rootfs.ext2
+??? rootfs.ext4 -> rootfs.ext2
+??? rootfs.tar
+??? sdcard.img
+??? socfpga_cyclone5_socrates.dtb
+??? u-boot-spl.bin
+??? u-boot-spl.bin.crc
+??? u-boot.bin
+??? u-boot.img
+??? uboot-env.bin
+??? uboot.img
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
+sdcard set these pins to value 0x5 (101b). Remaining pins are used to determine
+how to configure FPGA and are not associated with booting into Linux kernel.
diff --git a/configs/socrates_cyclone5_defconfig b/configs/socrates_cyclone5_defconfig
new file mode 100644
index 0000000..5793458
--- /dev/null
+++ b/configs/socrates_cyclone5_defconfig
@@ -0,0 +1,32 @@
+BR2_arm=y
+BR2_cortex_a9=y
+BR2_ARM_ENABLE_NEON=y
+BR2_ARM_ENABLE_VFP=y
+BR2_ARM_FPU_NEON=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_1=y
+BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/altera/socrates_cyclone5/genimage.cfg"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_GIT=y
+BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/altera-opensource/linux-socfpga.git"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="rel_socfpga-4.1.33-ltsi_17.07.02_pr"
+BR2_LINUX_KERNEL_DEFCONFIG="socfpga"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="socfpga_cyclone5_socrates"
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_GIT=y
+BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://github.com/altera-opensource/u-boot-socfpga.git"
+BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="v2017.07"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="socfpga_socrates"
+BR2_TARGET_UBOOT_FORMAT_IMG=y
+BR2_TARGET_UBOOT_SPL=y
+BR2_TARGET_UBOOT_ALTERA_SOCFPGA_IMAGE_CRC=y
+BR2_TARGET_UBOOT_ENVIMAGE=y
+BR2_TARGET_UBOOT_ENVIMAGE_SOURCE="board/altera/socrates_cyclone5/boot-env.txt"
+BR2_TARGET_UBOOT_ENVIMAGE_SIZE="8192"
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_MTOOLS=y
--
2.10.2
