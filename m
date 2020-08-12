From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 12 Aug 2020 11:37:46 +0200
Subject: [Buildroot] [git commit branch/next] configs/ci20: use upstream
 Linux and U-Boot
Message-ID: <20200812144330.1F79D85F4A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e580fad559417df48f7e3123a58205947a09b656
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

The vendor kernel we are currently selecting no longer builds,
and fails with a ton of:

                 from include/linux/list.h:8,
                 from include/linux/module.h:9,
                 from arch/mips/jz4740/prom.c:16:
include/linux/log2.h:22:1: error: ignoring attribute 'noreturn' because it conflicts with attribute 'const' [-Werror=a
ttributes]
   22 | int ____ilog2_NaN(void);
      | ^~~

We can't afford to fix that, so let's just move to upstream
kernel and bootloader. It doesn't make much sense to keep
using an unsupported kernel and bootloader at this point.

This means we will be missing some of the features supported
by the vendor (such as HDMI support), but it is what it is.

Linux v5.7 and v5.4 have been tested to boot fine, the latter
is picked for the defconfig as it is an LTS version.

Fixes:

  https://gitlab.com/buildroot.org/buildroot/-/jobs/674933782

Reported-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 configs/ci20_defconfig | 19 ++++++++-----------
 1 file changed, 8 insertions(+), 11 deletions(-)

diff --git a/configs/ci20_defconfig b/configs/ci20_defconfig
index 8f2604b07c..076f21bdfe 100644
--- a/configs/ci20_defconfig
+++ b/configs/ci20_defconfig
@@ -2,9 +2,8 @@
 BR2_mipsel=y
 BR2_mips_xburst=y
 # BR2_MIPS_SOFT_FLOAT is not set
-
-# Linux headers same as kernel, a 3.18 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_18=y
+BR2_KERNEL_HEADERS_AS_KERNEL=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_4=y
 
 # system
 BR2_TARGET_GENERIC_GETTY_PORT="ttyS4"
@@ -15,19 +14,17 @@ BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/ci20/genimage.cfg"
 
 # kernel
 BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,MIPS,CI20_linux,7dff33297116643485ca37141d804eddd793e834)/linux-7dff33297116643485ca37141d804eddd793e834.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.4.58"
 BR2_LINUX_KERNEL_DEFCONFIG="ci20"
 BR2_LINUX_KERNEL_INSTALL_TARGET=y
 
 # u-boot
 BR2_TARGET_UBOOT=y
-BR2_TARGET_UBOOT_BUILD_SYSTEM_LEGACY=y
-BR2_TARGET_UBOOT_BOARDNAME="ci20_mmc"
-BR2_TARGET_UBOOT_CUSTOM_GIT=y
-BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://github.com/MIPS/CI20_u-boot"
-BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="dd3c1b95dac7d10b2ca5806f65e5c1050d7dd0fa"
-BR2_TARGET_UBOOT_PATCH="board/ci20/patches/uboot"
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2020.07"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="ci20_mmc"
 BR2_TARGET_UBOOT_FORMAT_IMG=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="spl/u-boot-spl.bin"
