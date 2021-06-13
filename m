From: Gwenhael Goavec-Merou <gwenj@trabucayre.com>
Date: Sun, 13 Jun 2021 18:29:19 +0200
Subject: [Buildroot] [PATCH v2] board: Add support for terasic DE10 Nano
Message-ID: <20210613162919.29269-1-gwenj@trabucayre.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>

Terasic DE10 Nano is an SoCFPGA cycloneV based board.
References:
- https://www.terasic.com.tw/cgi-bin/page/archive.pl?Language=English&CategoryNo=205&No=1046
- https://rocketboards.org/foswiki/Documentation/DE10NanoDevelopmentBoard

Note:
- there is no dts in kernel (mainline or intel), but since DE0 Nano Soc is
  similar, the corresponding dts is usually used
- Board integration in barebox is recent there is no tag with this support,
  this why an commit hash is used.

Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
---
Changes v1 -> v2:
- add defconfig and board path in DEVELOPERS
---
 DEVELOPERS                                    |  2 +
 .../de10nano_cyclone5/barebox-env/boot/mmc    |  8 +++
 .../barebox-env/init/automount                |  5 ++
 .../barebox-env/nv/boot.default               |  1 +
 .../barebox-env/nv/linux.bootargs.console     |  1 +
 board/terasic/de10nano_cyclone5/genimage.cfg  | 57 +++++++++++++++++++
 board/terasic/de10nano_cyclone5/readme.txt    | 42 ++++++++++++++
 configs/terasic_de10nano_cyclone5_defconfig   | 31 ++++++++++
 8 files changed, 147 insertions(+)
 create mode 100644 board/terasic/de10nano_cyclone5/barebox-env/boot/mmc
 create mode 100644 board/terasic/de10nano_cyclone5/barebox-env/init/automount
 create mode 100644 board/terasic/de10nano_cyclone5/barebox-env/nv/boot.default
 create mode 100644 board/terasic/de10nano_cyclone5/barebox-env/nv/linux.bootargs.console
 create mode 100644 board/terasic/de10nano_cyclone5/genimage.cfg
 create mode 100644 board/terasic/de10nano_cyclone5/readme.txt
 create mode 100644 configs/terasic_de10nano_cyclone5_defconfig

diff --git a/DEVELOPERS b/DEVELOPERS
index 0ab898d94d..b81b2c5958 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1101,6 +1101,8 @@ F:	configs/arm_juno_defconfig
 F:	board/arm/juno/
 
 N:	Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
+F:	board/terasic/de10nano_cyclone5/
+F:	configs/terasic_de10nano_cyclone5_defconfig
 F:	package/gnuradio/
 F:	package/gqrx/
 F:	package/gr-osmosdr/
diff --git a/board/terasic/de10nano_cyclone5/barebox-env/boot/mmc b/board/terasic/de10nano_cyclone5/barebox-env/boot/mmc
new file mode 100644
index 0000000000..fed2b0b45d
--- /dev/null
+++ b/board/terasic/de10nano_cyclone5/barebox-env/boot/mmc
@@ -0,0 +1,8 @@
+#!/bin/sh
+
+global.bootm.oftree="/boot/socfpga_cyclone5_de0_nano_soc.dtb"
+global.bootm.image="/boot/zImage"
+
+#bootargs-ip
+
+global.linux.bootargs.dyn.root="root=/dev/mmcblk0p3 rw rootwait"
diff --git a/board/terasic/de10nano_cyclone5/barebox-env/init/automount b/board/terasic/de10nano_cyclone5/barebox-env/init/automount
new file mode 100644
index 0000000000..4092ecbaec
--- /dev/null
+++ b/board/terasic/de10nano_cyclone5/barebox-env/init/automount
@@ -0,0 +1,5 @@
+#!/bin/sh
+
+# SD card slot, first partition
+mkdir -p /mnt/mmcblk0p2
+automount -d /mnt/mmcblk0p2 'mount /dev/mmc0.1 /mnt/mmcblk0p2'
diff --git a/board/terasic/de10nano_cyclone5/barebox-env/nv/boot.default b/board/terasic/de10nano_cyclone5/barebox-env/nv/boot.default
new file mode 100644
index 0000000000..61f529d69a
--- /dev/null
+++ b/board/terasic/de10nano_cyclone5/barebox-env/nv/boot.default
@@ -0,0 +1 @@
+mmc
diff --git a/board/terasic/de10nano_cyclone5/barebox-env/nv/linux.bootargs.console b/board/terasic/de10nano_cyclone5/barebox-env/nv/linux.bootargs.console
new file mode 100644
index 0000000000..476b1fbe49
--- /dev/null
+++ b/board/terasic/de10nano_cyclone5/barebox-env/nv/linux.bootargs.console
@@ -0,0 +1 @@
+console=ttyS0,115200
diff --git a/board/terasic/de10nano_cyclone5/genimage.cfg b/board/terasic/de10nano_cyclone5/genimage.cfg
new file mode 100644
index 0000000000..3261c62741
--- /dev/null
+++ b/board/terasic/de10nano_cyclone5/genimage.cfg
@@ -0,0 +1,57 @@
+image boot.vfat {
+	vfat {
+		file zImage {
+            image = "zImage"
+        }
+
+        file socfpga_cyclone5_de0_nano_soc.dtb {
+            image = "socfpga_cyclone5_de0_nano_soc.dtb"
+        }
+
+        file barebox.bin {
+            image = "barebox-socfpga-de10_nano.img"
+        }
+
+        file barebox.env {
+            image = "barebox-env"
+        }
+	}
+	size = 8M
+}
+
+image boot.img {
+	hdimage {
+		partition-table = "no"
+	}
+
+	partition spl {
+		in-partition-table = "no"
+		image = "barebox-socfpga-de10_nano-xload.img"
+		offset = 0
+		size = 64k
+	}
+
+	size = 1M
+}
+
+image sdcard.img {
+	hdimage {
+	}
+
+	partition spl {
+		partition-type = 0xa2
+		image = "boot.img"
+	}
+
+	partition boot {
+		partition-type = 0xc
+		bootable = "true"
+		image = "boot.vfat"
+	}
+
+	partition rootfs {
+		partition-type = 0x83
+		image = "rootfs.ext2"
+		size = 500M
+	}
+}
diff --git a/board/terasic/de10nano_cyclone5/readme.txt b/board/terasic/de10nano_cyclone5/readme.txt
new file mode 100644
index 0000000000..c5aafef320
--- /dev/null
+++ b/board/terasic/de10nano_cyclone5/readme.txt
@@ -0,0 +1,42 @@
+Terasic DE10 Nano Development Board
+
+Intro
+=====
+
+More information about this board can be found here:
+https://rocketboards.org/foswiki/Documentation/DE10NanoDevelopmentBoard
+
+Build
+=====
+
+First, load socrates config for buildroot
+
+    make terasic_de10nano_cyclone5_defconfig
+
+Build everything
+
+    make
+
+Following files will be generated in output/images
+
+.
+??? barebox-env
+??? barebox-socfpga-de10_nano.img
+??? barebox-socfpga-de10_nano-xload.img
+??? boot.img
+??? boot.vfat
+??? rootfs.ext2
+??? rootfs.ext4 -> rootfs.ext2
+??? rootfs.tar
+??? sdcard.img
+??? socfpga_cyclone5_de0_nano_soc.dtb
+??? zImage
+
+Creating bootable SD card
+=========================
+
+Simply invoke
+
+dd if=output/images/sdcard.img of=/dev/sdX
+
+Where X is your SD card device (not partition)
diff --git a/configs/terasic_de10nano_cyclone5_defconfig b/configs/terasic_de10nano_cyclone5_defconfig
new file mode 100644
index 0000000000..85e7d15298
--- /dev/null
+++ b/configs/terasic_de10nano_cyclone5_defconfig
@@ -0,0 +1,31 @@
+BR2_arm=y
+BR2_cortex_a9=y
+BR2_ARM_ENABLE_NEON=y
+BR2_ARM_ENABLE_VFP=y
+BR2_ARM_FPU_NEON=y
+BR2_KERNEL_HEADERS_5_11=y
+BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/terasic/de10nano_cyclone5/genimage.cfg"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_GIT=y
+BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/altera-opensource/linux-socfpga.git"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="rel_socfpga-5.11_21.06.01_pr"
+BR2_LINUX_KERNEL_DEFCONFIG="socfpga"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="socfpga_cyclone5_de0_nano_soc"
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_BAREBOX=y
+BR2_TARGET_BAREBOX_CUSTOM_GIT=y
+BR2_TARGET_BAREBOX_CUSTOM_GIT_REPO_URL="git://git.pengutronix.de/barebox"
+BR2_TARGET_BAREBOX_CUSTOM_GIT_VERSION="ac0d216bd657d044ea7aa22b7f2138752f3c6629"
+BR2_TARGET_BAREBOX_BOARD_DEFCONFIG="socfpga"
+BR2_TARGET_BAREBOX_IMAGE_FILE="images/barebox-socfpga-de10_nano.img"
+BR2_TARGET_BAREBOX_CUSTOM_ENV=y
+BR2_TARGET_BAREBOX_CUSTOM_ENV_PATH="board/terasic/de10nano_cyclone5/barebox-env"
+BR2_TARGET_BAREBOX_AUX=y
+BR2_TARGET_BAREBOX_AUX_BOARD_DEFCONFIG="socfpga-xload-2"
+BR2_TARGET_BAREBOX_AUX_IMAGE_FILE="images/barebox-socfpga-de10_nano-xload.img"
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_MTOOLS=y
-- 
2.31.1
