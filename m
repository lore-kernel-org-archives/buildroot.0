From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun,  3 Nov 2019 19:58:39 +0100
Subject: [Buildroot] [PATCH 1/1] package/mesa3d: VDPAU needs x11
Message-ID: <20191103185839.12004-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Commit c898f95c275a105caacbb31adf92ef94bd4530c4 added support for
Gallium VDPAU state tracker by updating Config.in to add a dependency on
XORG7. However, mesa3d.mk was not updated to reflect this dependency.

XORG7 dependency is already managed under the ifeq
BR2_PACKAGE_MESA3D_OPENGL_GLX block so reuse this block by making ifeq
depends on BR2_PACKAGE_XORG7

Fixes:
 - http://autobuild.buildroot.org/results/bbd102d59bbdca35fd1b5401df2790dd197d1e5f

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/mesa3d/mesa3d.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 9a7e0c9952..dd42021f8b 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -183,7 +183,7 @@ MESA3D_DEPENDENCIES += wayland wayland-protocols
 MESA3D_PLATFORMS += wayland
 MESA3D_CONF_OPTS += -Dwayland-scanner-path=$(HOST_DIR)/bin/wayland-scanner
 endif
-ifeq ($(BR2_PACKAGE_MESA3D_OPENGL_GLX),y)
+ifeq ($(BR2_PACKAGE_XORG7),y)
 MESA3D_DEPENDENCIES += \
 	xlib_libX11 \
 	xlib_libXext \
-- 
2.23.0
