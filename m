From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Wed, 16 May 2018 17:51:59 +0200
Subject: [Buildroot] [PATCH 1/3] imx-gpu-viv: add Wayland backend option
In-Reply-To: <20180516155201.10279-1-gary.bisson@boundarydevices.com>
References: <20180516155201.10279-1-gary.bisson@boundarydevices.com>
Message-ID: <20180516155201.10279-2-gary.bisson@boundarydevices.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This package has been tested with Wayland back-end using weston-imx
repository on a i.MX6Q Nitrogen6x:
https://source.codeaurora.org/external/imx/weston-imx/
(tag rel_imx_4.9.51_8mq_ga to work with both i.MX6 and i.MX8MQ)

Weston was started as follows:
 # export XDG_RUNTIME_DIR=/tmp
 # weston --tty=1 --device=/dev/fb0

Finally the Vivante sample apps were started from weston-terminal:
 # cd /usr/share/examples/viv_samples/vdk/
 # ./tutorial7

Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
---
 package/freescale-imx/imx-gpu-viv/Config.in      | 10 +++++++++-
 package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk | 10 ++++++++++
 2 files changed, 19 insertions(+), 1 deletion(-)

diff --git a/package/freescale-imx/imx-gpu-viv/Config.in b/package/freescale-imx/imx-gpu-viv/Config.in
index cf58ad475c..4e753a41f3 100644
--- a/package/freescale-imx/imx-gpu-viv/Config.in
+++ b/package/freescale-imx/imx-gpu-viv/Config.in
@@ -12,7 +12,7 @@ config BR2_PACKAGE_IMX_GPU_VIV
 	select BR2_PACKAGE_HAS_LIBGLES
 	select BR2_PACKAGE_HAS_LIBOPENVG
 	help
-	  Userspace libraries for Vivante GPU on i.MX6 platforms
+	  Userspace libraries for Vivante GPU on i.MX platforms
 
 	  It contains libraries and headers for GLES, OpenCL, and
 	  OpenVG. It also contains a DRI plugin for X11. It also
@@ -44,12 +44,20 @@ comment "X11 backend needs Xorg package"
 config BR2_PACKAGE_IMX_GPU_VIV_OUTPUT_FB
 	bool "Framebuffer"
 
+config BR2_PACKAGE_IMX_GPU_VIV_OUTPUT_WL
+	bool "Wayland"
+	# libdrm needed by gbm_viv.so
+	select BR2_PACKAGE_LIBDRM
+	select BR2_PACKAGE_WAYLAND
+	select BR2_PACKAGE_HAS_LIBEGL_WAYLAND
+
 endchoice
 
 config BR2_PACKAGE_IMX_GPU_VIV_OUTPUT
 	string
 	default "x11" if BR2_PACKAGE_IMX_GPU_VIV_OUTPUT_X11
 	default "fb" if BR2_PACKAGE_IMX_GPU_VIV_OUTPUT_FB
+	default "wl" if BR2_PACKAGE_IMX_GPU_VIV_OUTPUT_WL
 
 config BR2_PACKAGE_PROVIDES_LIBEGL
 	default "imx-gpu-viv"
diff --git a/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk b/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk
index 0dc2072984..a339c22978 100644
--- a/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk
+++ b/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk
@@ -25,6 +25,10 @@ ifeq ($(IMX_GPU_VIV_LIB_TARGET),x11)
 IMX_GPU_VIV_DEPENDENCIES += xlib_libXdamage xlib_libXext xlib_libXfixes
 endif
 
+ifeq ($(IMX_GPU_VIV_LIB_TARGET),wl)
+IMX_GPU_VIV_DEPENDENCIES += libdrm wayland
+endif
+
 define IMX_GPU_VIV_EXTRACT_CMDS
 	$(call FREESCALE_IMX_EXTRACT_HELPER,$(IMX_GPU_VIV_DL_DIR)/$(IMX_GPU_VIV_SOURCE))
 endef
@@ -62,6 +66,12 @@ define IMX_GPU_VIV_FIXUP_PKGCONFIG
 endef
 endif
 
+ifeq ($(IMX_GPU_VIV_LIB_TARGET),wl)
+define IMX_GPU_VIV_FIXUP_PKGCONFIG
+	ln -sf egl_wayland.pc $(@D)/gpu-core/usr/lib/pkgconfig/egl.pc
+endef
+endif
+
 ifeq ($(IMX_GPU_VIV_LIB_TARGET),x11)
 define IMX_GPU_VIV_FIXUP_PKGCONFIG
 	for lib in egl gbm glesv1_cm glesv2 vg; do \
-- 
2.17.0
