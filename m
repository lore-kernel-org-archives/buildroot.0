From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 31 Mar 2018 16:04:39 +0200
Subject: [Buildroot] [git commit] board: add support for ARC HS Development
 Kit (HSDK)
Message-ID: <20180331140657.E1AAE832D5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7f430a4e87970d275af087d4fefcf15fa92778f9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Synopsys DesignWare HSDK (which stands for ARC HS
Development Kit) is the latest and greatest development
platform that sports quad-core ARC HS38 in real silicon.

Most noticeable features of the board are:
 * Quad-core ARC HS38 CPU running at 1GHz
 * 4Gb of DDR
 * Built-in Vivante GPU (well supported via open source
   Etnaviv drivers)
 * Built-in Wi-Fi/Bluetooth module (RedPine RS-9113)

And as usual we have:
 * [micro] SD-card slot
 * 2 USB 2.0 ports
 * 1Gbit Ethernet port
 * Built-in Digilent JTAG probe
 * Serial port accessible via micro-USB port

Writing sdcard.img on SDcard creates two partitions:
 * FAT32 with uImage and uboot.env
 * EXT4 with root filesystem

We modify kernel config because in default hsdk kernel config
CONFIG_INITRAMFS_SOURCE parameter is set and when we build
rootfs separately (BR2_TARGET_ROOTFS_INITRAMFS is not set)
error appears. Also we set up CONFIG_ARC_UBOOT_SUPPORT which
enables usage of uboot variables in the boot process.

[Peter: Fix comments and rename defconfig to snps_archs38_hsdk_defconfig,
	Add defconfig to DEVELOPERS and fixup board/synopsys entry,
	Drop postimage script, rename env file in genimage.cfg and drop size
	setting for rootfs partition,
	Add "" for CONFIG_INITRAMFS_SOURCE in linux fragment]
Signed-off-by: Evgeniy Didin <didin@synopsys.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Alexey Brodkin <abrodkin@synopsys.com>
Cc: arc-buildroot at synopsys.com
Reviewed-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .gitlab-ci.yml                      |  1 +
 DEVELOPERS                          |  2 ++
 board/synopsys/hsdk/genimage.cfg    | 27 +++++++++++++++++++++++++
 board/synopsys/hsdk/linux.fragment  |  2 ++
 board/synopsys/hsdk/uboot.env.txt   |  9 +++++++++
 configs/snps_archs38_hsdk_defconfig | 40 +++++++++++++++++++++++++++++++++++++
 6 files changed, 81 insertions(+)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 20a5a6521a..ab0feac292 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -225,6 +225,7 @@ snps_aarch64_vdk_defconfig: *defconfig
 snps_arc700_axs101_defconfig: *defconfig
 snps_archs38_axs103_defconfig: *defconfig
 snps_archs38_haps_defconfig: *defconfig
+snps_archs38_hsdk_defconfig: *defconfig
 snps_archs38_vdk_defconfig: *defconfig
 socrates_cyclone5_defconfig: *defconfig
 solidrun_macchiatobin_mainline_defconfig: *defconfig
diff --git a/DEVELOPERS b/DEVELOPERS
index ef6589e37d..10e6220694 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -161,6 +161,8 @@ F:	package/wf111/
 
 N:	ARC Maintainers <arc-buildroot@synopsys.com>
 F:	arch/Config.in.arc
+F:	board/synopsys/
+F:	configs/snps_archs38_hsdk_defconfig
 
 N:	Ariel D'Alessandro <ariel@vanguardiasur.com.ar>
 F:	package/axfsutils/
diff --git a/board/synopsys/hsdk/genimage.cfg b/board/synopsys/hsdk/genimage.cfg
new file mode 100644
index 0000000000..87282fcb79
--- /dev/null
+++ b/board/synopsys/hsdk/genimage.cfg
@@ -0,0 +1,27 @@
+image boot.vfat {
+  vfat {
+    files = {
+      "uImage"
+    }
+    file uboot.env {
+      image = "uboot-env.bin"
+    }
+  }
+  size = 100M
+}
+
+image sdcard.img {
+  hdimage {
+  }
+
+  partition boot {
+    partition-type = 0xC
+    bootable = "true"
+    image = "boot.vfat"
+  }
+
+  partition rootfs {
+    partition-type = 0x83
+    image = "rootfs.ext4"
+  }
+}
diff --git a/board/synopsys/hsdk/linux.fragment b/board/synopsys/hsdk/linux.fragment
new file mode 100644
index 0000000000..45d6c69af5
--- /dev/null
+++ b/board/synopsys/hsdk/linux.fragment
@@ -0,0 +1,2 @@
+CONFIG_INITRAMFS_SOURCE=""
+CONFIG_ARC_UBOOT_SUPPORT=y
diff --git a/board/synopsys/hsdk/uboot.env.txt b/board/synopsys/hsdk/uboot.env.txt
new file mode 100644
index 0000000000..6bcfb56a77
--- /dev/null
+++ b/board/synopsys/hsdk/uboot.env.txt
@@ -0,0 +1,9 @@
+baudrate=115200
+bootargs=console=ttyS3,115200n8 root=/dev/mmcblk0p2 rootwait
+bootcmd=fatload mmc 0:1; bootm
+bootdelay=2
+bootfile=uImage
+loadaddr=0x82000000
+stderr=serial0 at f0005000
+stdin=serial0 at f0005000
+stdout=serial0 at f0005000
diff --git a/configs/snps_archs38_hsdk_defconfig b/configs/snps_archs38_hsdk_defconfig
new file mode 100644
index 0000000000..125063b444
--- /dev/null
+++ b/configs/snps_archs38_hsdk_defconfig
@@ -0,0 +1,40 @@
+# Architecture
+BR2_arcle=y
+BR2_archs38=y
+
+# Linux headers
+BR2_KERNEL_HEADERS_4_14=y
+
+# System
+BR2_TARGET_GENERIC_HOSTNAME="hsdk"
+BR2_TARGET_GENERIC_ISSUE="Welcome to the HSDK Platform"
+BR2_SYSTEM_DHCP="eth0"
+
+# Kernel
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.14.4"
+BR2_LINUX_KERNEL_DEFCONFIG="hsdk"
+BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/synopsys/hsdk/linux.fragment"
+
+# Filesystem / image
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+# BR2_TARGET_ROOTFS_TAR is not set
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_MTOOLS=y
+BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/synopsys/hsdk/genimage.cfg"
+
+# Bootloader
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2017.11"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="hsdk"
+BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_TARGET_UBOOT_FORMAT_ELF=y
+BR2_TARGET_UBOOT_ENVIMAGE=y
+BR2_TARGET_UBOOT_ENVIMAGE_SOURCE="board/synopsys/hsdk/uboot.env.txt"
+BR2_TARGET_UBOOT_ENVIMAGE_SIZE="0x4000"
