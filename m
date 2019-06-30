From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 30 Jun 2019 16:04:57 +0200
Subject: [Buildroot] [PATCH 03/31] package/mesa3d: add optional support for
 libva
In-Reply-To: <20190630140525.6537-1-bernd.kuhls@t-online.de>
References: <20190630140525.6537-1-bernd.kuhls@t-online.de>
Message-ID: <20190630140525.6537-4-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Kodi 18.0-Leia will support vaapi on r600 and radeonsi.
We need libva support in mesa3d for this. To avoid the circular
dependency we switch from using mesa3d in libva to use libva in mesa3d.

This patch is the second step: enable libva support in mesa3d.

To fix a new configure error caused by this patch

    configure: error: VA requires at least one of the x11 drm or wayland
    platforms

with this defconfig

BR2_PACKAGE_MESA3D=y
BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_R600=y
BR2_PACKAGE_MESA3D_OPENGL_EGL=y
BR2_PACKAGE_LIBVA=y

we add drm to mesa platforms for r600.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/mesa3d/mesa3d.mk | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 15dbc4fa3d..58f0351328 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -111,6 +111,12 @@ MESA3D_CONF_OPTS += \
 	-Dshared-glapi=true \
 	-Dgallium-drivers=$(subst $(space),$(comma),$(MESA3D_GALLIUM_DRIVERS-y)) \
 	-Dgallium-extra-hud=true
+ifeq ($(BR2_PACKAGE_LIBVA),y)
+MESA3D_CONF_OPTS += -Dgallium-va=true
+MESA3D_DEPENDENCIES += libva
+else
+MESA3D_CONF_OPTS += -Dgallium-va=false
+endif
 endif
 
 ifeq ($(BR2_PACKAGE_MESA3D_DRI_DRIVER),)
@@ -151,10 +157,6 @@ endif
 #   - Building OpenGL ES without OpenGL is not supported, so always keep opengl enabled.
 MESA3D_CONF_OPTS += -Dopengl=true
 
-# libva and mesa3d have a circular dependency
-# we do not need libva support in mesa3d, therefore disable this option
-MESA3D_CONF_OPTS += -Dgallium-va=false
-
 # libGL is only provided for a full xorg stack
 ifeq ($(BR2_PACKAGE_XORG7),y)
 MESA3D_PROVIDES += libgl
@@ -176,6 +178,8 @@ else ifeq ($(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_VIRGL),y)
 MESA3D_PLATFORMS = drm
 else ifeq ($(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_RADEONSI),y)
 MESA3D_PLATFORMS = drm
+else ifeq ($(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_R600),y)
+MESA3D_PLATFORMS = drm
 endif
 ifeq ($(BR2_PACKAGE_WAYLAND),y)
 MESA3D_DEPENDENCIES += wayland wayland-protocols
-- 
2.20.1
