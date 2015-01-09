From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri,  9 Jan 2015 23:46:23 +0100
Subject: [Buildroot] [PATCH 5/5 v2] configs: add a DT-enabled Raspberry Pi
	defconfig
In-Reply-To: <cover.1420843412.git.yann.morin.1998@free.fr>
References: <cover.1420843412.git.yann.morin.1998@free.fr>
Message-ID: <b65d009bf4aeb83b97e02a9fd03c14888b5f1ce2.1420843412.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This is an example of a Device-Tree-enabled Raspberry Pi defconfig.

We have to use a 3.18-based kernel for that, but there are a few
limitations:

  - we can not use the minimalist RPi defconfig bundled with the kernel,
    namely bcmrpi_quick_defconfig, because it is not DT-enabled, and
    sets CONFIG_ARM_PATCH_PHYS_VIRT to 'n', which prompts a value for
    CONFIG_PHYS_OFFSET, as it as no default for the bcm familly;

  - we have to use the 'default' but bloated bcmrpi_defconfig, which
    makes for a very fat kernel with lots of modules, and takes ages to
    build;

  - most importantly, the rpi-3.18.y branch is constantly rebased, so
    there is no guarantee that the sha1 I use today will still be usable
    in the long term. Using the name of hte branch is not better either.

To compensate for an already overly-long build time for such a
minimalist system (18min 20s, as compared to 6min 30s when using
bcmrpi_quick), I decided to use an external toolchain rather than build
our own.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 configs/raspberrypi_dt_defconfig | 12 ++++++++++++
 1 file changed, 12 insertions(+)
 create mode 100644 configs/raspberrypi_dt_defconfig

diff --git a/configs/raspberrypi_dt_defconfig b/configs/raspberrypi_dt_defconfig
new file mode 100644
index 0000000..188ece9
--- /dev/null
+++ b/configs/raspberrypi_dt_defconfig
@@ -0,0 +1,12 @@
+BR2_arm=y
+BR2_arm1176jzf_s=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TARGET_GENERIC_GETTY_PORT="tty1"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_GIT=y
+BR2_LINUX_KERNEL_CUSTOM_REPO_URL="git://github.com/raspberrypi/linux.git"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="b9c9f8fc69aaba236169798c18dc1590fccf7acd"
+BR2_LINUX_KERNEL_DEFCONFIG="bcmrpi"
+BR2_LINUX_KERNEL_ZIMAGE=y
+BR2_PACKAGE_RPI_FIRMWARE=y
+BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTBS=y
-- 
1.9.1
