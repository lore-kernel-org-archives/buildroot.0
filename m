From: Bilal Wasim <bilalwasim676@gmail.com>
Date: Mon, 21 Sep 2020 23:12:44 +0500
Subject: [Buildroot] [PATCH 1/3] configs: Add default configuration for
 Chromebook Elm.
In-Reply-To: <20200921181246.88781-1-bilalwasim676@gmail.com>
References: <20200921181246.88781-1-bilalwasim676@gmail.com>
Message-ID: <20200921181246.88781-2-bilalwasim676@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The architecture of the MT8173 SoC is armv8-a in a big-little config.
This SoC is supported by the Chrome-OS linux kernel, but the mainline
support is reasonably good as well (benchmarks / conformance run fine)
and so that is used. For now, the kernel is 5.9-rc5 which will be uprevd
to 5.9 once its released.

The defconfig also lists all the tools (parted, vboot) that are necessary
to create a bootable image.

Signed-off-by: Bilal Wasim <bilalwasim676@gmail.com>
---
 configs/chromebook_elm_defconfig | 35 ++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)
 create mode 100644 configs/chromebook_elm_defconfig

diff --git a/configs/chromebook_elm_defconfig b/configs/chromebook_elm_defconfig
new file mode 100644
index 0000000000..9b467ec6a8
--- /dev/null
+++ b/configs/chromebook_elm_defconfig
@@ -0,0 +1,35 @@
+# Architecture
+BR2_aarch64=y
+BR2_cortex_a72_a53=y
+
+# Filesystem
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+
+# Kernel
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.9-rc5"
+BR2_LINUX_KERNEL_PATCH="board/chromebook/elm/linux-5.9-elm-hdmi.patch"
+
+# Build Kernel with a Custom config.
+BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/chromebook/elm/linux.config"
+
+# DTS support
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="mediatek/mt8173-elm"
+
+# Package Firmware for WiFi chip.
+BR2_PACKAGE_LINUX_FIRMWARE=y
+BR2_PACKAGE_LINUX_FIRMWARE_MWIFIEX_SD8797=y
+
+# Scripts to generate final images.
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/chromebook/elm/sign.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/chromebook/mksd.sh"
+
+# Supporting host tools to build / sign FIT Image.
+BR2_PACKAGE_HOST_PARTED=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SUPPORT=y
+BR2_PACKAGE_HOST_VBOOT_UTILS=y
-- 
2.25.1
