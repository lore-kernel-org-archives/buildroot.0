From: =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>
Date: Mon, 13 Oct 2014 13:10:15 +0200
Subject: [Buildroot] [PATCH v2 05/13] gpu-viv-bin-mx6q: make fb/x11 choice
	explicit
In-Reply-To: <1413198623-22373-1-git-send-email-jezz@sysmic.org>
References: <1413198623-22373-1-git-send-email-jezz@sysmic.org>
Message-ID: <1413198623-22373-6-git-send-email-jezz@sysmic.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch also prepare support for Wayland backend for
gpu-viv-bin-mx6q.

Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
---
 package/freescale-imx/gpu-viv-bin-mx6q/Config.in   | 24 ++++++++++++++++++++--
 .../gpu-viv-bin-mx6q/gpu-viv-bin-mx6q.mk           |  2 +-
 2 files changed, 23 insertions(+), 3 deletions(-)

diff --git a/package/freescale-imx/gpu-viv-bin-mx6q/Config.in b/package/freescale-imx/gpu-viv-bin-mx6q/Config.in
index 4e83dd3..904b011 100644
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
@@ -25,6 +23,28 @@ config BR2_PACKAGE_GPU_VIV_BIN_MX6Q
 
 if BR2_PACKAGE_GPU_VIV_BIN_MX6Q
 
+choice
+	prompt "Output option"
+	help
+	  There are two versions of this library: one for
+	  direct framebuffer access, one for X11 rendering.
+	  Choose here which version to install.
+
+config BR2_PACKAGE_GPU_VIV_BIN_MX6Q_OUTPUT_X11
+	depends on BR2_PACKAGE_XORG7
+	select BR2_PACKAGE_XLIB_LIBXDAMAGE
+	select BR2_PACKAGE_XLIB_LIBXEXT
+	select BR2_PACKAGE_LIBDRM
+	bool "X11"
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
index de126fe..e24d171 100644
--- a/package/freescale-imx/gpu-viv-bin-mx6q/gpu-viv-bin-mx6q.mk
+++ b/package/freescale-imx/gpu-viv-bin-mx6q/gpu-viv-bin-mx6q.mk
@@ -26,7 +26,7 @@ GPU_VIV_BIN_MX6Q_REDISTRIBUTE = NO
 GPU_VIV_BIN_MX6Q_PROVIDES = libegl libgles libopenvg
 
 # DirectFB is not supported (wrong version)
-ifeq ($(BR2_PACKAGE_XORG7),y)
+ifeq ($(BR2_PACKAGE_GPU_VIV_BIN_MX6Q_OUTPUT_X11),y)
 GPU_VIV_BIN_MX6Q_DEPENDENCIES = xlib_libXdamage xlib_libXext
 GPU_VIV_BIN_MX6Q_LIB_TARGET = x11
 else
-- 
1.9.1
