From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat,  3 Apr 2021 11:02:45 +0200
Subject: [Buildroot] [PATCH v2 1/1] package/{mesa3d,
 mesa3d-headers}: bump version to 21.0.1
Message-ID: <20210403090245.760697-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Release notes:
21.0.0: https://lists.freedesktop.org/archives/mesa-announce/2021-March/000622.html
21.0.1: https://lists.freedesktop.org/archives/mesa-announce/2021-March/000624.html

OSMesa classic support was removed:
https://cgit.freedesktop.org/mesa/mesa/commit/?h=21.0&id=ee802372180a2b4460cc7abb53438e45c6b6f1e4

DRI swrast driver was removed:
https://cgit.freedesktop.org/mesa/mesa/commit/?h=21.0&id=435de835cd639d1b9bb96f81fc224771dc90af6d

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
v2: - osmesa needs swrast driver (Yann)
    - updated other packages following the renamed osmesa Config.in
      option (Yann)

 Config.in.legacy                         | 22 ++++++++++++++--------
 package/mesa3d-demos/mesa3d-demos.mk     |  2 +-
 package/mesa3d-headers/mesa3d-headers.mk |  2 +-
 package/mesa3d/Config.in                 | 20 +++++---------------
 package/mesa3d/mesa3d.hash               |  6 +++---
 package/mesa3d/mesa3d.mk                 |  9 ++++-----
 package/wine/wine.mk                     |  2 +-
 7 files changed, 29 insertions(+), 34 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 8ebbc4c295..da48a78158 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,20 @@ endif
 
 comment "Legacy options removed in 2021.05"
 
+config BR2_PACKAGE_MESA3D_OSMESA_CLASSIC
+	bool "mesa OSMesa option renamed"
+	select BR2_LEGACY
+	select BR2_PACKAGE_MESA3D_OSMESA
+	help
+	  The option was renamed in order to match the naming used
+	  by the meson buildsystem.
+
+config BR2_PACKAGE_MESA3D_DRI_DRIVER_SWRAST
+	bool "mesa DRI swrast driver removed"
+	select BR2_LEGACY
+	help
+	  The DRI swrast driver was removed.
+
 config BR2_PACKAGE_KODI_SCREENSAVER_CRYSTALMORPH
 	bool "kodi-screensaver-crystalmorph removed"
 	select BR2_LEGACY
@@ -886,14 +900,6 @@ config BR2_PACKAGE_KODI_AUDIODECODER_OPUS
 	help
 	  This package is incompatible with Kodi 18.x.
 
-config BR2_PACKAGE_MESA3D_OSMESA
-	bool "mesa OSMesa option renamed"
-	select BR2_PACKAGE_MESA3D_OSMESA_CLASSIC if BR2_PACKAGE_MESA3D_DRI_DRIVER_SWRAST
-	select BR2_LEGACY
-	help
-	  The option was renamed in order to match the naming used
-	  by the meson buildsystem.
-
 config BR2_PACKAGE_HOSTAPD_DRIVER_RTW
 	bool "hostapd rtl871xdrv driver removed"
 	select BR2_LEGACY
diff --git a/package/mesa3d-demos/mesa3d-demos.mk b/package/mesa3d-demos/mesa3d-demos.mk
index e9aa44dc2e..ddff9b9ed9 100644
--- a/package/mesa3d-demos/mesa3d-demos.mk
+++ b/package/mesa3d-demos/mesa3d-demos.mk
@@ -61,7 +61,7 @@ ifeq ($(BR2_PACKAGE_LIBFREEGLUT),y)
 MESA3D_DEMOS_DEPENDENCIES += libfreeglut
 MESA3D_DEMOS_CONF_OPTS += --with-glut=$(STAGING_DIR)/usr
 # osmesa support depends on glut
-ifeq ($(BR2_PACKAGE_MESA3D_OSMESA_CLASSIC),y)
+ifeq ($(BR2_PACKAGE_MESA3D_OSMESA),y)
 MESA3D_DEMOS_CONF_OPTS += --enable-osmesa
 else
 MESA3D_DEMOS_CONF_OPTS += --disable-osmesa
diff --git a/package/mesa3d-headers/mesa3d-headers.mk b/package/mesa3d-headers/mesa3d-headers.mk
index 6e2f0b5a79..07c19a04c1 100644
--- a/package/mesa3d-headers/mesa3d-headers.mk
+++ b/package/mesa3d-headers/mesa3d-headers.mk
@@ -12,7 +12,7 @@ endif
 
 # Not possible to directly refer to mesa3d variables, because of
 # first/second expansion trickery...
-MESA3D_HEADERS_VERSION = 20.3.4
+MESA3D_HEADERS_VERSION = 21.0.1
 MESA3D_HEADERS_SOURCE = mesa-$(MESA3D_HEADERS_VERSION).tar.xz
 MESA3D_HEADERS_SITE = https://mesa.freedesktop.org/archive
 MESA3D_HEADERS_DL_SUBDIR = mesa3d
diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index a96fd46bbe..6a803d65a4 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -64,7 +64,7 @@ config BR2_PACKAGE_MESA3D_DRI_DRIVER
 	select BR2_PACKAGE_MESA3D_GBM if \
 		!BR2_PACKAGE_MESA3D_OPENGL_GLX && \
 		!BR2_PACKAGE_MESA3D_OPENGL_EGL && \
-		!BR2_PACKAGE_MESA3D_OSMESA_CLASSIC
+		!BR2_PACKAGE_MESA3D_OSMESA
 	select BR2_PACKAGE_XLIB_LIBXSHMFENCE if \
 		(BR2_PACKAGE_XORG7 && BR2_TOOLCHAIN_HAS_SYNC_4)
 
@@ -242,15 +242,11 @@ config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SVGA
 
 config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SWRAST
 	bool "Gallium swrast driver"
-	depends on !BR2_PACKAGE_MESA3D_DRI_DRIVER_SWRAST
 	select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
 	help
 	  This is a software opengl implementation using the Gallium3D
 	  infrastructure.
 
-comment "Gallium swrast: Only one swrast provider can be built"
-	depends on BR2_PACKAGE_MESA3D_DRI_DRIVER_SWRAST
-
 config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_TEGRA
 	bool "Gallium tegra driver"
 	select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
@@ -334,13 +330,6 @@ comment "Gallium XvMC state tracker needs X.org and gallium drivers r600 or nouv
 
 comment "DRI drivers"
 
-config BR2_PACKAGE_MESA3D_DRI_DRIVER_SWRAST
-	bool "DRI swrast driver"
-	select BR2_PACKAGE_MESA3D_DRI_DRIVER
-	help
-	  This is a software opengl implementation using the DRI
-	  infrastructure.
-
 config BR2_PACKAGE_MESA3D_DRI_DRIVER_I915
 	bool "DRI i915 driver"
 	depends on BR2_i386 || BR2_x86_64
@@ -405,10 +394,11 @@ comment "intel vulkan depends on X.org and needs a glibc toolchain w/ headers >=
 
 comment "Off-screen Rendering"
 
-config BR2_PACKAGE_MESA3D_OSMESA_CLASSIC
-	bool "OSMesa (classic) library"
+config BR2_PACKAGE_MESA3D_OSMESA
+	bool "OSMesa library"
+	select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SWRAST
 	help
-	  The OSMesa classic API provides functions for
+	  The OSMesa API provides functions for
 	  making off-screen renderings.
 
 if BR2_PACKAGE_MESA3D_DRIVER
diff --git a/package/mesa3d/mesa3d.hash b/package/mesa3d/mesa3d.hash
index e7b375440d..53e65650c6 100644
--- a/package/mesa3d/mesa3d.hash
+++ b/package/mesa3d/mesa3d.hash
@@ -1,6 +1,6 @@
-# From https://lists.freedesktop.org/archives/mesa-announce/2021-January/000618.html
-sha256  dc21a987ec1ff45b278fe4b1419b1719f1968debbb80221480e44180849b4084  mesa-20.3.4.tar.xz
-sha512  81c4d032213b4aef842f1594e0e89bc0045f7ca7ce5f267b62a0f8236eb12ab09c1f780d8b3776b3072f37cd0bd8829f8a1330a749ccf462471b262ef8097477  mesa-20.3.4.tar.xz
+# From https://lists.freedesktop.org/archives/mesa-announce/2021-March/000624.html
+sha256  379fc984459394f2ab2d84049efdc3a659869dc1328ce72ef0598506611712bb  mesa-21.0.1.tar.xz
+sha512  b31b78778b6092dfaf0712f90de3074217574389c4236f8379c127739874f6bd1b47883140a26445d25e58df87e6207278efd048453096ee710d334b1dcfe419  mesa-21.0.1.tar.xz
 
 # License
 sha256  1361129baa4519b6ed27a1bf4aeee33a58b060bf7bb9b6ea415ecede04e35e46  docs/license.rst
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 4ca51f5e71..5fcbdb59dd 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # When updating the version, please also update mesa3d-headers
-MESA3D_VERSION = 20.3.4
+MESA3D_VERSION = 21.0.1
 MESA3D_SOURCE = mesa-$(MESA3D_VERSION).tar.xz
 MESA3D_SITE = https://mesa.freedesktop.org/archive
 MESA3D_LICENSE = MIT, SGI, Khronos
@@ -102,7 +102,6 @@ MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_V3D)      += v3d
 MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_VC4)      += vc4
 MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_VIRGL)    += virgl
 # DRI Drivers
-MESA3D_DRI_DRIVERS-$(BR2_PACKAGE_MESA3D_DRI_DRIVER_SWRAST) += swrast
 MESA3D_DRI_DRIVERS-$(BR2_PACKAGE_MESA3D_DRI_DRIVER_I915)   += i915
 MESA3D_DRI_DRIVERS-$(BR2_PACKAGE_MESA3D_DRI_DRIVER_I965)   += i965
 MESA3D_DRI_DRIVERS-$(BR2_PACKAGE_MESA3D_DRI_DRIVER_NOUVEAU) += nouveau
@@ -149,10 +148,10 @@ endif
 
 # APIs
 
-ifeq ($(BR2_PACKAGE_MESA3D_OSMESA_CLASSIC),y)
-MESA3D_CONF_OPTS += -Dosmesa=classic
+ifeq ($(BR2_PACKAGE_MESA3D_OSMESA),y)
+MESA3D_CONF_OPTS += -Dosmesa=true
 else
-MESA3D_CONF_OPTS += -Dosmesa=none
+MESA3D_CONF_OPTS += -Dosmesa=false
 endif
 
 # Always enable OpenGL:
diff --git a/package/wine/wine.mk b/package/wine/wine.mk
index 3179658cee..0320ca9cd4 100644
--- a/package/wine/wine.mk
+++ b/package/wine/wine.mk
@@ -191,7 +191,7 @@ else
 WINE_CONF_OPTS += --without-ldap
 endif
 
-ifeq ($(BR2_PACKAGE_MESA3D_OSMESA_CLASSIC),y)
+ifeq ($(BR2_PACKAGE_MESA3D_OSMESA),y)
 WINE_CONF_OPTS += --with-osmesa
 WINE_DEPENDENCIES += mesa3d
 else
-- 
2.29.2
