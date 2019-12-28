From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 28 Dec 2019 19:29:59 +0100
Subject: [Buildroot] [PATCH 1/1] package/mesa3d: fix build with egl but
 without drm, wayland or x11
Message-ID: <20191228182959.3790300-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

A user can enable mesa3d and EGL by selecting
BR2_PACKAGE_MESA3D_OPENGL_EGL

This will result in a build failure if the user does not select a driver
that enables drm, wayland or x11 as platforms will be empty.

To fix this build failure, always enable surfaceless platform which
defining property is that it has no native surfaces:
https://gitlab.freedesktop.org/mesa/mesa/blob/master/docs/specs/EGL_MESA_platform_surfaceless.txt

Fixes:
 - http://autobuild.buildroot.org/results/8960b950f79be82f81db20be41fa4b47bc76dee8

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/mesa3d/mesa3d.mk | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 4204e186f5..72686c72ea 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -158,22 +158,23 @@ endef
 MESA3D_POST_INSTALL_STAGING_HOOKS += MESA3D_REMOVE_OPENGL_HEADERS
 endif
 
+MESA3D_PLATFORMS = surfaceless
 ifeq ($(BR2_PACKAGE_MESA3D_DRI_DRIVER),y)
-MESA3D_PLATFORMS = drm
+MESA3D_PLATFORMS += drm
 else ifeq ($(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_VC4),y)
-MESA3D_PLATFORMS = drm
+MESA3D_PLATFORMS += drm
 else ifeq ($(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_ETNAVIV),y)
-MESA3D_PLATFORMS = drm
+MESA3D_PLATFORMS += drm
 else ifeq ($(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_FREEDRENO),y)
-MESA3D_PLATFORMS = drm
+MESA3D_PLATFORMS += drm
 else ifeq ($(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_LIMA),y)
-MESA3D_PLATFORMS = drm
+MESA3D_PLATFORMS += drm
 else ifeq ($(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_PANFROST),y)
-MESA3D_PLATFORMS = drm
+MESA3D_PLATFORMS += drm
 else ifeq ($(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_VIRGL),y)
-MESA3D_PLATFORMS = drm
+MESA3D_PLATFORMS += drm
 else ifeq ($(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_RADEONSI),y)
-MESA3D_PLATFORMS = drm
+MESA3D_PLATFORMS += drm
 endif
 ifeq ($(BR2_PACKAGE_WAYLAND),y)
 MESA3D_DEPENDENCIES += wayland wayland-protocols
-- 
2.24.0
