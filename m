From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 17 Jun 2018 15:24:09 +0200
Subject: [Buildroot] [git commit] imx-gpu-viv: enable package for 64-bit
 i.MX processors
Message-ID: <20180617132558.62C31888DE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=84afda9ca6dad5fd828ba94fa60df52c81cc7814
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Basically enabling the package for aarch64. One difference with 32-bit
i.MX platforms resides in the fact that Wayland is the only back-end
supported. Therefore X11 and Framebuffer options are masked.

This was tested on i.MX8MQ Nitrogen8M platform (with weston-imx):
 # cd /usr/share/examples/viv_samples/vdk/
 # ./tutorial7

Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
[Thomas: drop BR2_PACKAGE_FREESCALE_IMX_HAS_VIV_GPU_WAYLAND_ONLY and
use BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8M directly.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/freescale-imx/Config.in                    |  3 ++-
 package/freescale-imx/imx-gpu-viv/Config.in        | 11 ++++++++++-
 package/freescale-imx/imx-gpu-viv/imx-gpu-viv.hash |  1 +
 package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk   |  4 ++++
 4 files changed, 17 insertions(+), 2 deletions(-)

diff --git a/package/freescale-imx/Config.in b/package/freescale-imx/Config.in
index 97aeb15764..30e71b825f 100644
--- a/package/freescale-imx/Config.in
+++ b/package/freescale-imx/Config.in
@@ -69,7 +69,8 @@ config BR2_PACKAGE_FREESCALE_IMX_HAS_VIV_GPU
 	bool
 	default y if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX6Q || \
 		BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX6S || \
-		BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX7
+		BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX7 || \
+		BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8M
 
 source "package/freescale-imx/imx-alsa-plugins/Config.in"
 source "package/freescale-imx/imx-codec/Config.in"
diff --git a/package/freescale-imx/imx-gpu-viv/Config.in b/package/freescale-imx/imx-gpu-viv/Config.in
index 4e753a41f3..a2deaf2e12 100644
--- a/package/freescale-imx/imx-gpu-viv/Config.in
+++ b/package/freescale-imx/imx-gpu-viv/Config.in
@@ -2,10 +2,14 @@ comment "imx-gpu-viv needs a glibc toolchain with armhf enabled"
 	depends on BR2_arm
 	depends on !BR2_TOOLCHAIN_USES_GLIBC || !BR2_ARM_EABIHF
 
+comment "imx-gpu-viv needs a glibc toolchain"
+	depends on BR2_aarch64
+	depends on !BR2_TOOLCHAIN_USES_GLIBC
+
 config BR2_PACKAGE_IMX_GPU_VIV
 	bool "imx-gpu-viv"
 	# Pre-built binaries only available for ARM EABIhf
-	depends on BR2_ARM_EABIHF
+	depends on (BR2_arm && BR2_ARM_EABIHF) || BR2_aarch64
 	# Library binaries are linked against libc.so.6
 	depends on BR2_TOOLCHAIN_USES_GLIBC
 	select BR2_PACKAGE_HAS_LIBEGL
@@ -34,15 +38,20 @@ choice
 config BR2_PACKAGE_IMX_GPU_VIV_OUTPUT_X11
 	bool "X11"
 	depends on BR2_PACKAGE_XORG7
+	# The i.MX8 blob doesn't support X11 output
+	depends on !BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8M
 	select BR2_PACKAGE_XLIB_LIBXDAMAGE
 	select BR2_PACKAGE_XLIB_LIBXEXT
 	select BR2_PACKAGE_XLIB_LIBXFIXES
 
 comment "X11 backend needs Xorg package"
 	depends on !BR2_PACKAGE_XORG7
+	depends on !BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8M
 
 config BR2_PACKAGE_IMX_GPU_VIV_OUTPUT_FB
 	bool "Framebuffer"
+	# The i.MX8 blob doesn't support FB output
+	depends on !BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8M
 
 config BR2_PACKAGE_IMX_GPU_VIV_OUTPUT_WL
 	bool "Wayland"
diff --git a/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.hash b/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.hash
index 3b54eec099..2cbc36a185 100644
--- a/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.hash
+++ b/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.hash
@@ -1 +1,2 @@
 sha256	dddadd164bede4793409ccfb636324dd73862c33458db66a5860f126bada25dc  imx-gpu-viv-6.2.4.p1.2-aarch32.bin
+sha256	27ed3f58681cef18f87ea20946cc89b2cef4848006064303d20583e6ed7aeec7  imx-gpu-viv-6.2.4.p1.2-aarch64.bin
diff --git a/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk b/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk
index 35ff9d457c..511e3b3b6c 100644
--- a/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk
+++ b/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk
@@ -4,7 +4,11 @@
 #
 ################################################################################
 
+ifeq ($(BR2_aarch64),y)
+IMX_GPU_VIV_VERSION = 6.2.4.p1.2-aarch64
+else
 IMX_GPU_VIV_VERSION = 6.2.4.p1.2-aarch32
+endif
 IMX_GPU_VIV_SITE = $(FREESCALE_IMX_SITE)
 IMX_GPU_VIV_SOURCE = imx-gpu-viv-$(IMX_GPU_VIV_VERSION).bin
 
