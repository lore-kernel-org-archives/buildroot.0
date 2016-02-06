From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 6 Feb 2016 10:57:51 +0100
Subject: [Buildroot] [git commit] defconfigs: use the new
	headers-version-same-as-kernel-version option
Message-ID: <20160206095926.CB60D8081A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=036ac26a29f636582ebdec99e02a88c8926fafc4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Now that we can say that the linux headers version should match that of
the kernel to be built, we inverse the logic in our defconfigs, as it is
more sensible that way.

And also because we'll get rid of the former, converse kernel-same-as-headers
option.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 configs/freescale_imx28evk_defconfig     |  5 ++---
 configs/freescale_imx31_3stack_defconfig |  9 ++++-----
 configs/ts5x00_defconfig                 | 15 +++++++++++----
 3 files changed, 17 insertions(+), 12 deletions(-)

diff --git a/configs/freescale_imx28evk_defconfig b/configs/freescale_imx28evk_defconfig
index 9ce5217..3f2f9e7 100644
--- a/configs/freescale_imx28evk_defconfig
+++ b/configs/freescale_imx28evk_defconfig
@@ -3,8 +3,6 @@ BR2_arm=y
 BR2_arm926t=y
 
 # toolchain
-BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="3.19.2"
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_19=y
 
 # system
@@ -12,7 +10,8 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
 
 # kernel
 BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_SAME_AS_HEADERS=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.19.2"
 BR2_LINUX_KERNEL_DEFCONFIG="mxs"
 BR2_LINUX_KERNEL_ZIMAGE=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
diff --git a/configs/freescale_imx31_3stack_defconfig b/configs/freescale_imx31_3stack_defconfig
index 68781eb..ded6563 100644
--- a/configs/freescale_imx31_3stack_defconfig
+++ b/configs/freescale_imx31_3stack_defconfig
@@ -4,10 +4,6 @@ BR2_arm1136jf_s_r0=y
 BR2_ARM_EABIHF=y
 
 # toolchain
-BR2_KERNEL_HEADERS_VERSION=y
-# Note: sadly the Linux kernel will not boot on the i.MX31 PDK, starting with
-# v3.16 and at least up to v4.0-rc4; this is why we use v3.15.y here.
-BR2_DEFAULT_KERNEL_VERSION="3.15.10"
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_15=y
 
 # system
@@ -15,7 +11,10 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
 
 # kernel
 BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_SAME_AS_HEADERS=y
+# Note: sadly the Linux kernel will not boot on the i.MX31 PDK, starting with
+# v3.16 and at least up to v4.0-rc4; this is why we use v3.15.y here.
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.15.10"
 BR2_LINUX_KERNEL_DEFCONFIG="imx_v6_v7"
 BR2_LINUX_KERNEL_ZIMAGE=y
 BR2_TARGET_ROOTFS_CPIO_GZIP=y
diff --git a/configs/ts5x00_defconfig b/configs/ts5x00_defconfig
index befb655..6f140e6 100644
--- a/configs/ts5x00_defconfig
+++ b/configs/ts5x00_defconfig
@@ -1,19 +1,26 @@
+# architecture
 BR2_i386=y
 BR2_x86_i586=y
 
-# Lock headers version to match and avoid breakage
-BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="3.17.8"
+# toolchain
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_17=y
 
+# system
 BR2_TARGET_GENERIC_GETTY_PORT="ttyS1"
 BR2_ROOTFS_OVERLAY="board/ts/ts5x00/fs-overlay"
+
+# kernel
 BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_SAME_AS_HEADERS=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.17.8"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/ts/ts5x00/linux-3.17.config"
 BR2_LINUX_KERNEL_INSTALL_TARGET=y
+
+# rootfs
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
+
+# bootloader
 BR2_TARGET_SYSLINUX=y
 BR2_TARGET_SYSLINUX_MBR=y
