From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 4 Feb 2020 21:49:17 +0100
Subject: [Buildroot] [git commit] package/mesa3d: add v3d driver support
Message-ID: <20200204203835.742AE8B729@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e904534ad36f8ac4ad0e108fe306b376bb9444fd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Support for v3d was added in mainline 4.18, and requires a few options
to be set in the kernel, so we list that in the help text.

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
[yann.morin.1998 at free.fr: tweak the help text]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/mesa3d/Config.in | 15 +++++++++++++++
 package/mesa3d/mesa3d.mk |  3 +++
 2 files changed, 18 insertions(+)

diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index 5929e15442..94e3f2cb9e 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -224,6 +224,21 @@ config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_TEGRA
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
+
+	  It requires a kernel 4.18+ with DRM V3D support enabled:
+
+	  - CONFIG_DRM_V3D
+	  - CONFIG_DRM_VC4
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
