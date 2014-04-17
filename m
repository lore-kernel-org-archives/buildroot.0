From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 17 Apr 2014 22:57:27 +0200
Subject: [Buildroot] [git commit] package/mesa3d: simplify the code enabling
	full-OpenGL
Message-ID: <20140417210125.4561F9C845@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ca2176efaf76b62badae290aee3fd0e3567aeff5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
driver is selected. We can use that variable rather than comparing the
lists of drivers.

Also, rearrange the code in a more logical way, by moving the code that
enables OpenGL nearer to the code enabling EGL and GLES.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Paul Cercueil <paul@crapouillou.net>
Cc: Bernd Kuhls <berndkuhls@hotmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/mesa3d/mesa3d.mk |   18 ++++++++----------
 1 files changed, 8 insertions(+), 10 deletions(-)

diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 1e2cc53..0d41efa 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -58,16 +58,6 @@ MESA3D_DRI_DRIVERS-$(BR2_PACKAGE_MESA3D_DRI_DRIVER_SWRAST) += swrast
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
@@ -90,6 +80,14 @@ endif
 
 # APIs
 
+# At least one API is required, for buildroot enable OpenGL API by default.
+# Other APIs (EGL, EGL_ES) are optional
+ifeq ($(BR2_PACKAGE_MESA3D_DRIVER),y)
+MESA3D_CONF_OPT += --enable-opengl
+else
+MESA3D_CONF_OPT += --disable-opengl
+endif
+
 ifeq ($(BR2_PACKAGE_MESA3D_OPENGL_EGL),y)
 # egl depends on gbm, gbm depends on udev
 MESA3D_DEPENDENCIES += udev
