From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 1 May 2015 22:57:18 +0200
Subject: [Buildroot] [git commit] gpu-viv-bin-mx6q: make fb/x11 choice
	explicit
Message-ID: <20150501205734.30D298081B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=87523028fa4c559ca38f30858b775904273c483a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This approach is less error-prone during development.

Tested-by: Gary Bisson <gary.bisson@boundarydevices.com>
Reviewed-by: Gary Bisson <gary.bisson@boundarydevices.com>
Signed-off-by: J??r??me Pouiller <jezz@sysmic.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/freescale-imx/gpu-viv-bin-mx6q/Config.in   |   23 ++++++++++++++++++-
 .../gpu-viv-bin-mx6q/gpu-viv-bin-mx6q.mk           |    2 +-
 2 files changed, 22 insertions(+), 3 deletions(-)

diff --git a/package/freescale-imx/gpu-viv-bin-mx6q/Config.in b/package/freescale-imx/gpu-viv-bin-mx6q/Config.in
index c59535e..c770346 100644
--- a/package/freescale-imx/gpu-viv-bin-mx6q/Config.in
+++ b/package/freescale-imx/gpu-viv-bin-mx6q/Config.in
@@ -7,8 +7,6 @@ config BR2_PACKAGE_GPU_VIV_BIN_MX6Q
 	select BR2_PACKAGE_HAS_LIBEGL
 	select BR2_PACKAGE_HAS_LIBGLES
 	select BR2_PACKAGE_HAS_LIBOPENVG
-	select BR2_PACKAGE_XLIB_LIBXDAMAGE if BR2_PACKAGE_XORG7
-	select BR2_PACKAGE_XLIB_LIBXEXT if BR2_PACKAGE_XORG7
 	depends on BR2_arm # Only relevant for i.MX6
 	# Library binaries are linked against libc.so.6
 	depends on BR2_TOOLCHAIN_USES_GLIBC
@@ -25,6 +23,27 @@ config BR2_PACKAGE_GPU_VIV_BIN_MX6Q
 
 if BR2_PACKAGE_GPU_VIV_BIN_MX6Q
 
+choice
+	prompt "Output option"
+	help
+	  There are two versions of this library: one for
+	  direct framebuffer access, one for X11 rendering.
+	  Choose here which version to install.
+
+config BR2_PACKAGE_GPU_VIV_BIN_MX6Q_OUTPUT_X11
+	bool "X11"
+	depends on BR2_PACKAGE_XORG7
+	select BR2_PACKAGE_XLIB_LIBXDAMAGE
+	select BR2_PACKAGE_XLIB_LIBXEXT
+
+comment "X11 backend needs Xorg package"
+	depends on !BR2_PACKAGE_XORG7
+
+config BR2_PACKAGE_GPU_VIV_BIN_MX6Q_OUTPUT_FB
+	bool "Framebuffer"
+
+endchoice
+
 config BR2_PACKAGE_PROVIDES_LIBEGL
 	default "gpu-viv-bin-mx6q"
 
diff --git a/package/freescale-imx/gpu-viv-bin-mx6q/gpu-viv-bin-mx6q.mk b/package/freescale-imx/gpu-viv-bin-mx6q/gpu-viv-bin-mx6q.mk
index bad1658..f96087b 100644
--- a/package/freescale-imx/gpu-viv-bin-mx6q/gpu-viv-bin-mx6q.mk
+++ b/package/freescale-imx/gpu-viv-bin-mx6q/gpu-viv-bin-mx6q.mk
@@ -21,7 +21,7 @@ GPU_VIV_BIN_MX6Q_REDISTRIBUTE = NO
 GPU_VIV_BIN_MX6Q_PROVIDES = libegl libgles libopenvg
 
 # DirectFB is not supported (wrong version)
-ifeq ($(BR2_PACKAGE_XORG7),y)
+ifeq ($(BR2_PACKAGE_GPU_VIV_BIN_MX6Q_OUTPUT_X11),y)
 GPU_VIV_BIN_MX6Q_DEPENDENCIES = xlib_libXdamage xlib_libXext
 GPU_VIV_BIN_MX6Q_LIB_TARGET = x11
 else
