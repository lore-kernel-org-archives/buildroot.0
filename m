From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun,  4 Mar 2018 22:31:37 +0100
Subject: [Buildroot] [PATCH 23/23] configs/ts4900: explicitly specify Linux
 kernel version
In-Reply-To: <20180304213137.24681-1-thomas.petazzoni@bootlin.com>
References: <20180304213137.24681-1-thomas.petazzoni@bootlin.com>
Message-ID: <20180304213137.24681-24-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The ts4900 defconfig currently fails to build because it selects
kernel headers 4.12, but doesn't specify a kernel version, and
therefore 4.15 is built causing the following error:

Incorrect selection of kernel headers: expected 4.12.x, got 4.15.x

In commit 7c3a7d808e751d4b608a4c50a0ae4d13dedebab7 ("configs/ts4900:
bump kernel version to 4.12"), when this defconfig was switched from
using a vendor provided kernel to the mainline kernel, the kernel
version was no longer explicitly specified.

Since this commit indicated 4.12, and the kernel headers version
selected is also 4.12, we also use that as the fixed kernel version.

Fixes:

  https://gitlab.com/buildroot.org/buildroot/-/jobs/55306955

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 configs/ts4900_defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/configs/ts4900_defconfig b/configs/ts4900_defconfig
index 082234fcad..e7950cea4b 100644
--- a/configs/ts4900_defconfig
+++ b/configs/ts4900_defconfig
@@ -3,6 +3,8 @@ BR2_cortex_a9=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_12=y
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/technologic/ts4900/post-image.sh"
 BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.12"
 BR2_LINUX_KERNEL_DEFCONFIG="imx_v6_v7"
 BR2_LINUX_KERNEL_UIMAGE=y
 BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x10008000"
-- 
2.14.3
