From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat,  5 Apr 2014 14:10:11 +0200
Subject: [Buildroot] [PATCH 07/13] package/mesa3d: simplify the code
	enabling full-OpenGL
In-Reply-To: <cover.1396699629.git.yann.morin.1998@free.fr>
References: <cover.1396699629.git.yann.morin.1998@free.fr>
Message-ID: <73095adccb04f8bc24a6ee28a292c3d5d1cb9b66.1396699629.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Currently, full-OpenGL is enabled by checking that at least one driver
is enabled. This is done by checking that the just-constructed lists of
drivers are not empty.

But we already have a variable that is set to 'y' as soon as a driver
is selected:

  - DRI drivers select BR2_PACKAGE_MESA3D_DRI_DRIVER

  - Gallium drivers select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER

  - both BR2_PACKAGE_MESA3D_DRI_DRIVER and BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
    select BR2_PACKAGE_MESA3D_DRIVER

So, BR2_PACKAGE_MESA3D_DRIVER is set to 'y' as soon as at least one
driver is selected. WE can use that variable rather than comparing the
lists of drivers.

Also, rearrange the code in a more logical way, by moving the code that
enables OpenGL nearer to the code enabling EGL and GLES.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Paul Cercueil <paul@crapouillou.net>
Cc: Bernd Kuhls <berndkuhls@hotmail.com>
---
 package/mesa3d/mesa3d.mk | 18 ++++++++----------
 1 file changed, 8 insertions(+), 10 deletions(-)

diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index f40b2ee..511fc51 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -57,16 +57,6 @@ MESA3D_DRI_DRIVERS-$(BR2_PACKAGE_MESA3D_DRI_DRIVER_SWRAST) += swrast
 MESA3D_DRI_DRIVERS-$(BR2_PACKAGE_MESA3D_DRI_DRIVER_I965)   += i965
 MESA3D_DRI_DRIVERS-$(BR2_PACKAGE_MESA3D_DRI_DRIVER_RADEON) += radeon
 
-# at least one API is required, for buildroot enable OpenGL API by default
-# other APIs (EGL, EGL_ES) are optional
-ifeq ($(MESA3D_GALLIUM_DRIVERS-y)$(MESA3D_DRI_DRIVERS-y),)
-MESA3D_CONF_OPT += \
-	--disable-opengl
-else
-MESA3D_CONF_OPT += \
-	--enable-opengl
-endif
-
 ifeq ($(MESA3D_GALLIUM_DRIVERS-y),)
 MESA3D_CONF_OPT += \
 	--without-gallium-drivers
@@ -89,6 +79,14 @@ endif
 
 # APIs
 
+# at least one API is required, for buildroot enable OpenGL API by default
+# other APIs (EGL, EGL_ES) are optional
+ifeq ($(BR2_PACKAGE_MESA3D_DRIVER),y)
+MESA3D_CONF_OPT += --enable-opengl
+else
+MESA3D_CONF_OPT += --disable-opengl
+endif
+
 ifeq ($(BR2_PACKAGE_MESA3D_OPENGL_EGL),y)
 # egl depends on gbm, gbm depends on udev
 MESA3D_DEPENDENCIES += udev
-- 
1.8.3.2
