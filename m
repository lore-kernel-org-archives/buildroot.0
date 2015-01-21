From: =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>
Date: Wed, 21 Jan 2015 12:23:26 +0100
Subject: [Buildroot] [RFC 2/4] gpu-viv-bin-mx6q: is a libgl provider
In-Reply-To: <1421839408-15839-1-git-send-email-jezz@sysmic.org>
References: <1421839408-15839-1-git-send-email-jezz@sysmic.org>
Message-ID: <1421839408-15839-3-git-send-email-jezz@sysmic.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

With help of opengl-registry package, we can declare gpu-viv-bin-mx6q as
libgl_provider.

Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
---
 package/freescale-imx/gpu-viv-bin-mx6q/Config.in           |  5 +++++
 package/freescale-imx/gpu-viv-bin-mx6q/gl.pc               | 10 ++++++++++
 package/freescale-imx/gpu-viv-bin-mx6q/gpu-viv-bin-mx6q.mk |  5 +++--
 package/x11r7/xdriver_xf86-video-imx-viv/Config.in         |  2 --
 4 files changed, 18 insertions(+), 4 deletions(-)
 create mode 100644 package/freescale-imx/gpu-viv-bin-mx6q/gl.pc

diff --git a/package/freescale-imx/gpu-viv-bin-mx6q/Config.in b/package/freescale-imx/gpu-viv-bin-mx6q/Config.in
index 6135d40..2e29865 100644
--- a/package/freescale-imx/gpu-viv-bin-mx6q/Config.in
+++ b/package/freescale-imx/gpu-viv-bin-mx6q/Config.in
@@ -4,9 +4,11 @@ comment "gpu-viv-bin-mx6q needs an (e)glibc toolchain"
 
 config BR2_PACKAGE_GPU_VIV_BIN_MX6Q
 	bool "gpu-viv-bin-mx6q"
+	select BR2_PACKAGE_HAS_LIBGL
 	select BR2_PACKAGE_HAS_LIBEGL
 	select BR2_PACKAGE_HAS_LIBGLES
 	select BR2_PACKAGE_HAS_LIBOPENVG
+	select BR2_PACKAGE_OPENGL_REGISTRY
 	depends on BR2_arm # Only relevant for i.MX6
 	# Library binaries are linked against libc.so.6
 	depends on BR2_TOOLCHAIN_USES_GLIBC
@@ -57,6 +59,9 @@ config BR2_PACKAGE_GPU_VIV_BIN_MX6Q_OUTPUT
 	default "dfb" if BR2_PACKAGE_GPU_VIV_BIN_MX6Q_OUTPUT_DIRECTFB
 	default "fb" if BR2_PACKAGE_GPU_VIV_BIN_MX6Q_OUTPUT_FB
 
+config BR2_PACKAGE_PROVIDES_LIBGL
+	default "gpu-viv-bin-mx6q"
+
 config BR2_PACKAGE_PROVIDES_LIBEGL
 	default "gpu-viv-bin-mx6q"
 
diff --git a/package/freescale-imx/gpu-viv-bin-mx6q/gl.pc b/package/freescale-imx/gpu-viv-bin-mx6q/gl.pc
new file mode 100644
index 0000000..1b3c3b8
--- /dev/null
+++ b/package/freescale-imx/gpu-viv-bin-mx6q/gl.pc
@@ -0,0 +1,10 @@
+prefix=/usr
+exec_prefix=${prefix}
+libdir=${exec_prefix}/lib
+includedir=${prefix}/include
+
+Name: gl
+Description: Freescale gpu-viv-bin-mx6q implementation of GL
+Version: 9.2.0
+Libs: -L${libdir} -lGAL -lGL
+Cflags: -I${includedir}/
diff --git a/package/freescale-imx/gpu-viv-bin-mx6q/gpu-viv-bin-mx6q.mk b/package/freescale-imx/gpu-viv-bin-mx6q/gpu-viv-bin-mx6q.mk
index e07e5ca..5d15a39 100644
--- a/package/freescale-imx/gpu-viv-bin-mx6q/gpu-viv-bin-mx6q.mk
+++ b/package/freescale-imx/gpu-viv-bin-mx6q/gpu-viv-bin-mx6q.mk
@@ -19,7 +19,8 @@ GPU_VIV_BIN_MX6Q_LICENSE = Freescale Semiconductor Software License Agreement
 GPU_VIV_BIN_MX6Q_LICENSE_FILES = EULA
 GPU_VIV_BIN_MX6Q_REDISTRIBUTE = NO
 
-GPU_VIV_BIN_MX6Q_PROVIDES = libegl libgles libopenvg
+GPU_VIV_BIN_MX6Q_DEPENDENCIES = opengl-registry
+GPU_VIV_BIN_MX6Q_PROVIDES = libgl libegl libgles libopenvg
 GPU_VIV_BIN_MX6Q_LIB_TARGET = $(call qstrip,$(BR2_PACKAGE_GPU_VIV_BIN_MX6Q_OUTPUT))
 
 define GPU_VIV_BIN_MX6Q_EXTRACT_CMDS
@@ -52,7 +53,7 @@ define GPU_VIV_BIN_MX6Q_INSTALL_STAGING_CMDS
 			#define EGL_API_FB \n\
 			#endif' $(STAGING_DIR)/usr/include/EGL/eglvivante.h; \
 	fi
-	for lib in egl glesv2 vg; do \
+	for lib in egl glesv2 vg gl; do \
 		$(INSTALL) -m 0644 -D \
 			package/freescale-imx/gpu-viv-bin-mx6q/$${lib}.pc \
 			$(STAGING_DIR)/usr/lib/pkgconfig/$${lib}.pc; \
diff --git a/package/x11r7/xdriver_xf86-video-imx-viv/Config.in b/package/x11r7/xdriver_xf86-video-imx-viv/Config.in
index 8926a50..79db1c5 100644
--- a/package/x11r7/xdriver_xf86-video-imx-viv/Config.in
+++ b/package/x11r7/xdriver_xf86-video-imx-viv/Config.in
@@ -1,8 +1,6 @@
 config BR2_PACKAGE_XDRIVER_XF86_VIDEO_IMX_VIV
 	bool "xf86-video-imx-viv"
 	depends on BR2_PACKAGE_GPU_VIV_BIN_MX6Q_OUTPUT_X11
-	select BR2_PACKAGE_MESA3D # Needed in order to compile xorg with glx/dri
-	select BR2_PACKAGE_MESA3D_DRI_DRIVER
 	select BR2_PACKAGE_LIBDRM
 	select BR2_PACKAGE_XPROTO_XPROTO
 	select BR2_PACKAGE_XPROTO_XF86DRIPROTO
-- 
1.9.1
