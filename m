From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 4 Feb 2021 18:15:09 +0100
Subject: [Buildroot] [git commit] configs/nexbox_a95x_defconfig: bump to
 kernel 5.10.12
Message-ID: <20210204170218.9D2DD81839@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=850a6ae1ed007b0c071f2c3d414de3b7ef400dee
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The mmc probing order has changed since commit 21b2cec61c04bd1 (mmc: Set
PROBE_PREFER_ASYNCHRONOUS for drivers that existed in v4.4), so get rid of
the hardcoded root=/dev/mmcblk1p2.  The old vendor U-Boot unfortunately does
not have GPT support, so stick to MBR and use the legacy
root=PARTUUID=<disksignature>-<partition> format and set a fixed disk
signature, similar to how it was done for orangepi-r1 in commit 34cce93adb
(configs/orangepi_r1_defconfig: bump kernel to 5.10.10, u-boot to 2020.10).

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 board/nexbox/a95x/boot.txt     | 2 +-
 board/nexbox/a95x/genimage.cfg | 2 ++
 configs/nexbox_a95x_defconfig  | 4 ++--
 3 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/board/nexbox/a95x/boot.txt b/board/nexbox/a95x/boot.txt
index f388ba814a..eef1c8ca55 100644
--- a/board/nexbox/a95x/boot.txt
+++ b/board/nexbox/a95x/boot.txt
@@ -1,4 +1,4 @@
-setenv bootargs console=ttyAML0,115200 earlyprintk root=/dev/mmcblk1p2 rootwait
+setenv bootargs console=ttyAML0,115200 earlyprintk root=PARTUUID=feedc0de-02 rootwait
 
 fatload mmc 0:1 0x01080000 uImage
 
diff --git a/board/nexbox/a95x/genimage.cfg b/board/nexbox/a95x/genimage.cfg
index 74e2d3a6f9..63b96107c9 100644
--- a/board/nexbox/a95x/genimage.cfg
+++ b/board/nexbox/a95x/genimage.cfg
@@ -12,6 +12,8 @@ image boot.vfat {
 
 image sdcard.img {
 	hdimage {
+		# for root=PARTUUID support
+		disk-signature = 0xfeedc0de
 	}
 
 	partition boot {
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
