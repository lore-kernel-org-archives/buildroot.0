From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 10 Sep 2018 21:57:33 +0200
Subject: [Buildroot] [git commit] board: resurrect support for RIoTboard
Message-ID: <20180910195652.AD1D783BEA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=11f869a0664871bb65abae86b8a0a2973a8f1b4b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Resurrect support for RIoTboard after 2018.02.x deprecation.

Signed-off-by: Nikolay Dimitrov <nikolay.dimitrov@retrohub.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .gitlab-ci.yml                                     |  1 +
 DEVELOPERS                                         |  4 +++
 board/embest/riotboard/genimage.cfg                | 17 +++++++++
 board/embest/riotboard/readme.txt                  | 38 ++++++++++++++++++++
 .../rootfs_overlay/boot/extlinux/extlinux.conf     |  6 ++++
 configs/riotboard_defconfig                        | 41 ++++++++++++++++++++++
 6 files changed, 107 insertions(+)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index d4807c5c85..d3d544b020 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -230,6 +230,7 @@ raspberrypi3_64_defconfig: *defconfig
 raspberrypi3_defconfig: *defconfig
 raspberrypi3_qt5we_defconfig: *defconfig
 raspberrypi_defconfig: *defconfig
+riotboard_defconfig: *defconfig
 roseapplepi_defconfig: *defconfig
 s6lx9_microboard_defconfig: *defconfig
 sheevaplug_defconfig: *defconfig
diff --git a/DEVELOPERS b/DEVELOPERS
index 5b4127b8a8..b05564dd44 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1512,6 +1512,10 @@ F:	package/exiv2/
 F:	package/nvidia-tegra23/nvidia-tegra23-binaries/
 F:	package/nvidia-tegra23/nvidia-tegra23-codecs/
 
+N:	Nikolay Dimitrov <nikolay.dimitrov@retrohub.org>
+F:	board/embest/riotboard/
+F:	configs/riotboard_defconfig
+
 N:	Nimai Mahajan <nimaim@gmail.com>
 F:	package/libucl/
 
diff --git a/board/embest/riotboard/genimage.cfg b/board/embest/riotboard/genimage.cfg
new file mode 100644
index 0000000000..1221c83b9a
--- /dev/null
+++ b/board/embest/riotboard/genimage.cfg
@@ -0,0 +1,17 @@
+image sdcard.img {
+    hdimage {
+    }
+
+    partition u-boot {
+        in-partition-table = "no"
+        image = "u-boot.imx"
+        offset = 1024
+    }
+
+    partition rootfs {
+        partition-type = 0x83
+        image = "rootfs.ext2"
+        offset = 1M
+        size = 60M
+    }
+}
diff --git a/board/embest/riotboard/readme.txt b/board/embest/riotboard/readme.txt
new file mode 100644
index 0000000000..4ba836fa5a
--- /dev/null
+++ b/board/embest/riotboard/readme.txt
@@ -0,0 +1,38 @@
+Buildroot for Embest RIoTboard
+==============================
+
+This is a small development board, based on Freescale IMX6 Solo SoC
+(single core ARM Cortex-A9).
+
+More details about the board can be found at:
+
+  http://www.embest-tech.com/riotboard
+
+1. Compiling buildroot
+----------------------
+
+$ make riotboard_defconfig
+$ make
+
+2. Installing buildroot
+-----------------------
+
+Prepare an SD-card and plug it into your card reader. Always double
+check the block device before writing to it, as writing to the wrong
+block device can cause irrecoverable data loss. Now you can write the
+image to your SD-card:
+
+sudo dd if=output/images/sdcard.img of=/dev/<sdcard-block-device> bs=1M
+
+3. Running buildroot
+--------------------
+
+Position the board so you can read the label "RIoTboard" on the right
+side of SW1 DIP switches. Configure the SW1 swiches like this:
+
+1   0  1   0   0  1   0  1
+ON OFF ON OFF OFF ON OFF ON
+
+Now plug your prepared SD-card in slot J6. Connect a serial console
+(115200, 8, N, 1) to header J18. Connect a 5V/1A power supply to the
+board and enjoy.
diff --git a/board/embest/riotboard/rootfs_overlay/boot/extlinux/extlinux.conf b/board/embest/riotboard/rootfs_overlay/boot/extlinux/extlinux.conf
new file mode 100644
index 0000000000..23e48a0da7
--- /dev/null
+++ b/board/embest/riotboard/rootfs_overlay/boot/extlinux/extlinux.conf
@@ -0,0 +1,6 @@
+default buildroot
+
+label buildroot
+kernel /boot/zImage
+devicetree /boot/imx6dl-riotboard.dtb
+append console=ttymxc1,115200 root=/dev/mmcblk1p1 rw
diff --git a/configs/riotboard_defconfig b/configs/riotboard_defconfig
new file mode 100644
index 0000000000..6a37e64f8c
--- /dev/null
+++ b/configs/riotboard_defconfig
@@ -0,0 +1,41 @@
+# architecture
+BR2_arm=y
+BR2_cortex_a9=y
+BR2_ARM_ENABLE_NEON=y
+BR2_ARM_ENABLE_VFP=y
+BR2_ARM_FPU_VFPV3=y
+
+# system
+BR2_TARGET_GENERIC_GETTY=y
+BR2_TARGET_GENERIC_GETTY_PORT="ttymxc1"
+
+# bootloader
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2018.07"
+BR2_TARGET_UBOOT_BOARDNAME="riotboard"
+BR2_TARGET_UBOOT_FORMAT_IMX=y
+
+# Linux headers same as kernel, a 4.18 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_18=y
+
+# kernel
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.18"
+BR2_LINUX_KERNEL_DEFCONFIG="imx_v6_v7"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6dl-riotboard"
+BR2_LINUX_KERNEL_INSTALL_TARGET=y
+
+# required tools to create the SD card image
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_MTOOLS=y
+
+# rootfs
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_ROOTFS_OVERLAY="board/embest/riotboard/rootfs_overlay"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/embest/riotboard/genimage.cfg"
