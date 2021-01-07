From: Romain Naour <romain.naour@gmail.com>
Date: Thu,  7 Jan 2021 12:04:47 +0100
Subject: [Buildroot] [RFC: 1/4] package/freescale-imx/imx-gpu-viv:
 BR2_PACKAGE_IMX_GPU_VIV_OUTPUT_{X11, WL} are libgl provider
Message-ID: <20210107110450.4031102-1-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

libGL.so is installed when BR2_PACKAGE_IMX_GPU_VIV_OUTPUT_X11 or BR2_PACKAGE_IMX_GPU_VIV_OUTPUT_WL
is selected, so declare it as a libgl provider.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Gary Bisson <gary.bisson@boundarydevices.com>
---

Not related to this patch but mesa3d-demo doesn't build with imx-gpu-viv
as GL provider. meta-freescale provide a patch that replace glWindowPos2iARB
calls with glWindowPos2i but it was rejected by upstream.

https://github.com/Freescale/meta-freescale/blob/dunfell/recipes-graphics/mesa/mesa-demos/Replace-glWindowPos2iARB-calls-with-glWindowPos2i.patch
---
 package/freescale-imx/imx-gpu-viv/Config.in      | 6 ++++++
 package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk | 4 ++--
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/package/freescale-imx/imx-gpu-viv/Config.in b/package/freescale-imx/imx-gpu-viv/Config.in
index cca2689905..4e53044d1d 100644
--- a/package/freescale-imx/imx-gpu-viv/Config.in
+++ b/package/freescale-imx/imx-gpu-viv/Config.in
@@ -44,6 +44,7 @@ config BR2_PACKAGE_IMX_GPU_VIV_OUTPUT_X11
 	select BR2_PACKAGE_XLIB_LIBXDAMAGE
 	select BR2_PACKAGE_XLIB_LIBXEXT
 	select BR2_PACKAGE_XLIB_LIBXFIXES
+	select BR2_PACKAGE_HAS_LIBGL # libGL-x11.so
 
 comment "X11 backend needs Xorg package"
 	depends on !BR2_PACKAGE_XORG7
@@ -60,6 +61,7 @@ config BR2_PACKAGE_IMX_GPU_VIV_OUTPUT_WL
 	select BR2_PACKAGE_LIBDRM
 	select BR2_PACKAGE_WAYLAND
 	select BR2_PACKAGE_HAS_LIBEGL_WAYLAND
+	select BR2_PACKAGE_HAS_LIBGL # libGL-wl.so
 
 endchoice
 
@@ -72,6 +74,10 @@ config BR2_PACKAGE_IMX_GPU_VIV_OUTPUT
 config BR2_PACKAGE_PROVIDES_LIBEGL
 	default "imx-gpu-viv"
 
+config BR2_PACKAGE_PROVIDES_LIBGL
+	default "imx-gpu-viv" if BR2_PACKAGE_IMX_GPU_VIV_OUTPUT_X11 || \
+		BR2_PACKAGE_IMX_GPU_VIV_OUTPUT_WL
+
 config BR2_PACKAGE_PROVIDES_LIBGLES
 	default "imx-gpu-viv"
 
diff --git a/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk b/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk
index 6ae9aa7acc..f03415b336 100644
--- a/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk
+++ b/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk
@@ -61,7 +61,7 @@ endif
 
 ifeq ($(IMX_GPU_VIV_LIB_TARGET),x11)
 define IMX_GPU_VIV_FIXUP_PKGCONFIG
-	for lib in egl gbm glesv1_cm glesv2 vg; do \
+	for lib in egl gbm glesv1_cm glesv2 gl vg; do \
 		ln -sf $${lib}_x11.pc $(@D)/gpu-core/usr/lib/pkgconfig/$${lib}.pc || exit 1; \
 	done
 endef
@@ -70,7 +70,7 @@ endif
 define IMX_GPU_VIV_INSTALL_STAGING_CMDS
 	cp -r $(@D)/gpu-core/usr/* $(STAGING_DIR)/usr
 	$(IMX_GPU_VIV_FIXUP_PKGCONFIG)
-	for lib in egl gbm glesv1_cm glesv2 vg; do \
+	for lib in egl gbm glesv1_cm glesv2 gl vg; do \
 		$(INSTALL) -m 0644 -D \
 			$(@D)/gpu-core/usr/lib/pkgconfig/$${lib}.pc \
 			$(STAGING_DIR)/usr/lib/pkgconfig/$${lib}.pc; \
-- 
2.25.4
