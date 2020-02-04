From: Peter Seiderer <ps.report@gmx.net>
Date: Tue,  4 Feb 2020 15:44:11 +0100
Subject: [Buildroot] [PATCH v1 1/2] package/mesa3d: add v3d driver support
In-Reply-To: <20200204144412.6666-1-ps.report@gmx.net>
References: <20200204144412.6666-1-ps.report@gmx.net>
Message-ID: <20200204144412.6666-2-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/mesa3d/Config.in | 12 ++++++++++++
 package/mesa3d/mesa3d.mk |  3 +++
 2 files changed, 15 insertions(+)

diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index 5929e15442..1351d1cd97 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -224,6 +224,18 @@ config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_TEGRA
 	help
 	  Adds support for Nvidia Tegra GPUs, requires nouveau.
 
+config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_V3D
+	bool "Gallium v3d driver"
+	depends on BR2_arm || BR2_aarch64
+	select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
+	select BR2_PACKAGE_MESA3D_GALLIUM_KMSRO
+	select BR2_PACKAGE_LIBDRM_VC4
+	select BR2_PACKAGE_MESA3D_OPENGL_EGL
+	help
+	  Driver for Broadcom VC6 (rpi4) GPUs (needs kmsro and vc4).
+	  It requires a recent enough mainline/raspberrypi kernel with
+	  drm v3d (CONFIG_DRM_V3D, CONFIG_DRM_VC4) support enabled.
+
 config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_VC4
 	bool "Gallium vc4 driver"
 	depends on BR2_arm || BR2_aarch64
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index c7e5be55a0..1a18cf3c58 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -84,6 +84,7 @@ MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_RADEONSI) += radeonsi
 MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SVGA)     += svga
 MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SWRAST)   += swrast
 MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_TEGRA)    += tegra
+MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_V3D)      += v3d
 MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_VC4)      += vc4
 MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_VIRGL)    += virgl
 # DRI Drivers
@@ -162,6 +163,8 @@ endif
 MESA3D_PLATFORMS = surfaceless
 ifeq ($(BR2_PACKAGE_MESA3D_DRI_DRIVER),y)
 MESA3D_PLATFORMS += drm
+else ifeq ($(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_V3D),y)
+MESA3D_PLATFORMS += drm
 else ifeq ($(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_VC4),y)
 MESA3D_PLATFORMS += drm
 else ifeq ($(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_ETNAVIV),y)
-- 
2.25.0
