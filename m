From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun,  7 Apr 2019 19:13:18 +0200
Subject: [Buildroot] [PATCH 2/2] package/mesa3d: add optional support for
 libva
In-Reply-To: <20190407171318.19852-1-bernd.kuhls@t-online.de>
References: <20190407171318.19852-1-bernd.kuhls@t-online.de>
Message-ID: <20190407171318.19852-2-bernd.kuhls@t-online.de>
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

Added upstream patch, for details see LibreELEC PR 2403 and Kodi
PR 13333.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/mesa3d/mesa3d.mk | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 9779de788c..7e7f913180 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -124,6 +124,12 @@ MESA3D_CONF_OPTS += \
 	--enable-shared-glapi \
 	--with-gallium-drivers=$(subst $(space),$(comma),$(MESA3D_GALLIUM_DRIVERS-y)) \
 	--enable-gallium-extra-hud
+ifeq ($(BR2_PACKAGE_LIBVA),y)
+MESA3D_CONF_OPTS += --enable-va
+MESA3D_DEPENDENCIES += libva
+else
+MESA3D_CONF_OPTS += --disable-va
+endif
 endif
 
 ifeq ($(BR2_PACKAGE_MESA3D_DRI_DRIVER),)
@@ -165,10 +171,6 @@ endif
 #   - it is needed for GLES (mesa3d's ./configure is a bit weird)
 MESA3D_CONF_OPTS += --enable-opengl --enable-dri
 
-# libva and mesa3d have a circular dependency
-# we do not need libva support in mesa3d, therefore disable this option
-MESA3D_CONF_OPTS += --disable-va
-
 # libGL is only provided for a full xorg stack
 ifeq ($(BR2_PACKAGE_XORG7),y)
 MESA3D_PROVIDES += libgl
@@ -190,6 +192,8 @@ else ifeq ($(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_VIRGL),y)
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
