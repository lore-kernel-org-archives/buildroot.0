From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue,  2 Feb 2021 10:30:23 +0100
Subject: [Buildroot] [PATCH] configs/nexbox_a95x_defconfig: bump to kernel
 5.10.12
Message-ID: <20210202093023.5970-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

and change to GPT partitions / root=PARTLABEL to find the rootfs instead of
hardcoding /dev/mmcblk1p2 as the mmc probing order has changed since commit
21b2cec61c04bd1 (mmc: Set PROBE_PREFER_ASYNCHRONOUS for drivers that existed
in v4.4).

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 board/nexbox/a95x/boot.txt     | 2 +-
 board/nexbox/a95x/genimage.cfg | 5 +++--
 configs/nexbox_a95x_defconfig  | 4 ++--
 3 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/board/nexbox/a95x/boot.txt b/board/nexbox/a95x/boot.txt
index f388ba814a..f2048e27f7 100644
--- a/board/nexbox/a95x/boot.txt
+++ b/board/nexbox/a95x/boot.txt
@@ -1,4 +1,4 @@
-setenv bootargs console=ttyAML0,115200 earlyprintk root=/dev/mmcblk1p2 rootwait
+setenv bootargs console=ttyAML0,115200 earlyprintk root=PARTLABEL=rootfs rootwait
 
 fatload mmc 0:1 0x01080000 uImage
 
diff --git a/board/nexbox/a95x/genimage.cfg b/board/nexbox/a95x/genimage.cfg
index 74e2d3a6f9..e284713c16 100644
--- a/board/nexbox/a95x/genimage.cfg
+++ b/board/nexbox/a95x/genimage.cfg
@@ -12,16 +12,17 @@ image boot.vfat {
 
 image sdcard.img {
 	hdimage {
+		gpt = true
 	}
 
 	partition boot {
-		partition-type = 0xC
+		partition-type-uuid = U
 		bootable = "true"
 		image = "boot.vfat"
 	}
 
 	partition rootfs {
-		partition-type = 0x83
+		partition-type-uuid = L
 		image = "rootfs.ext4"
 		size = 512M
 	}
diff --git a/configs/nexbox_a95x_defconfig b/configs/nexbox_a95x_defconfig
index 4820d47d52..69f8b9078f 100644
--- a/configs/nexbox_a95x_defconfig
+++ b/configs/nexbox_a95x_defconfig
@@ -1,13 +1,13 @@
 BR2_aarch64=y
 BR2_cortex_a53=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_19=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
 BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV=y
 BR2_SYSTEM_DHCP="eth0"
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/nexbox/a95x/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/nexbox/a95x/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.19.8"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.10.12"
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="amlogic/meson-gxbb-nexbox-a95x amlogic/meson-gxl-s905x-nexbox-a95x"
-- 
2.20.1
