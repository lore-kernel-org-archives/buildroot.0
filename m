From: Vincent Stehle <vincent.stehle@laposte.net>
Date: Wed,  9 Nov 2016 17:38:23 +0100
Subject: [Buildroot] [PATCH] configs: freescale_imx31_3stack: bump kernel
	version to 4.1.15_2.0.0_ga
In-Reply-To: <20161105143516.00291507@free-electrons.com>
References: <20161105143516.00291507@free-electrons.com>
Message-ID: <20161109163823.25501-1-vincent.stehle@laposte.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Vincent Stehl? <vincent.stehle@laposte.net>

Switch to the kernel of release 4.1.15_2.0.0_ga, as it builds properly with
gcc 5.x, which is now the default.

We add a linux config fragment to disable the framebuffer, to repair the
build for imx_v6_v7_defconfig.

Suggested-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Vincent Stehl? <vincent.stehle@laposte.net>
Signed-off-by: Julien Olivain <juju@cotds.org>
Tested-by: Julien Olivain <juju@cotds.org>
Cc: Fabio Estevam <fabio.estevam@nxp.com>
---


Hello Thomas and Fabio,

My friend Julien got the i.MX31 PDK and he could kindly test a few
buildroot configs!

His experiments show that mainline kernel will not boot "as is" on the PDK.
What he proposed instead is that we switch to a recent NXP/Freescale
release based on kernel 4.1, which does boot on the PDK.

Is that proposal fine with you, please?

Best regards,

Vincent.


 board/freescale/imx31_3stack/linux.fragment |  1 +
 configs/freescale_imx31_3stack_defconfig    | 12 ++++++------
 2 files changed, 7 insertions(+), 6 deletions(-)
 create mode 100644 board/freescale/imx31_3stack/linux.fragment

diff --git a/board/freescale/imx31_3stack/linux.fragment b/board/freescale/imx31_3stack/linux.fragment
new file mode 100644
index 0000000..8d89e8e
--- /dev/null
+++ b/board/freescale/imx31_3stack/linux.fragment
@@ -0,0 +1 @@
+CONFIG_FB_MXS=n
diff --git a/configs/freescale_imx31_3stack_defconfig b/configs/freescale_imx31_3stack_defconfig
index bf1afad..0476fc1 100644
--- a/configs/freescale_imx31_3stack_defconfig
+++ b/configs/freescale_imx31_3stack_defconfig
@@ -3,18 +3,18 @@ BR2_arm=y
 BR2_arm1136jf_s=y
 BR2_ARM_EABIHF=y
 
-# Linux headers same as kernel, a 3.15 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_15=y
+# Linux headers same as kernel, a 4.1 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_1=y
 
 # system
 BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
 
 # kernel
 BR2_LINUX_KERNEL=y
-# Note: sadly the Linux kernel will not boot on the i.MX31 PDK, starting with
-# v3.16 and at least up to v4.0-rc4; this is why we use v3.15.y here.
-BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.15.10"
+BR2_LINUX_KERNEL_CUSTOM_GIT=y
+BR2_LINUX_KERNEL_CUSTOM_REPO_URL="git://git.freescale.com/imx/linux-imx.git"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="rel_imx_4.1.15_2.0.0_ga"
 BR2_LINUX_KERNEL_DEFCONFIG="imx_v6_v7"
+BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/freescale/imx31_3stack/linux.fragment"
 BR2_TARGET_ROOTFS_CPIO_GZIP=y
 BR2_TARGET_ROOTFS_INITRAMFS=y
-- 
2.10.2
