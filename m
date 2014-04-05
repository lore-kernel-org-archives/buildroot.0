From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat,  5 Apr 2014 14:10:08 +0200
Subject: [Buildroot] [PATCH 04/13] package/mesa3d: re-arrange menu items
In-Reply-To: <cover.1396699629.git.yann.morin.1998@free.fr>
References: <cover.1396699629.git.yann.morin.1998@free.fr>
Message-ID: <474bfee73482d300dd106a3bc8965251a6d1fa57.1396699629.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Make mesa3d a menuconfig, ie. a sub-menu on the boolean option.

Move drivers and additional API selections out of their own submenus,
add a comment as separator.

This will make it easier to further re-arrange the config items in
the following patches, to fix-enhance the packaging to handle the
full-openGL provider stuff.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Paul Cercueil <paul@crapouillou.net>
Cc: Bernd Kuhls <berndkuhls@hotmail.com>
---
 package/mesa3d/Config.in | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index c5312f5..607cc6c 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -1,4 +1,4 @@
-config BR2_PACKAGE_MESA3D
+menuconfig BR2_PACKAGE_MESA3D
 	bool "Mesa 3D Graphics Library"
 	select BR2_PACKAGE_LIBDRM
 	select BR2_PACKAGE_EXPAT
@@ -31,7 +31,7 @@ config BR2_PACKAGE_MESA3D_DRI_DRIVER
 config BR2_PACKAGE_MESA3D_DRIVER
 	bool
 
-menu "Drivers"
+comment "Gallium drivers"
 
 config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_NOUVEAU
 	bool "Gallium nouveau driver"
@@ -61,6 +61,8 @@ comment "DRI drivers need dynamic library"
 
 if !BR2_PREFER_STATIC_LIB
 
+comment "DRI drivers"
+
 config BR2_PACKAGE_MESA3D_DRI_DRIVER_SWRAST
 	bool "DRI swrast driver"
 	select BR2_PACKAGE_MESA3D_DRI_DRIVER
@@ -87,10 +89,9 @@ config BR2_PACKAGE_MESA3D_DRI_DRIVER_RADEON
 
 endif # !BR2_PREFER_STATIC_LIB
 
-endmenu
+if BR2_PACKAGE_MESA3D_DRIVER
 
-menu "Additional API Support"
-depends on BR2_PACKAGE_MESA3D_DRIVER
+comment "Additional API Support"
 
 config BR2_PACKAGE_MESA3D_OPENGL_EGL
 	bool "EGL"
@@ -107,7 +108,7 @@ config BR2_PACKAGE_MESA3D_OPENGL_ES
 	  Use the Khronos OpenGL ES APIs.  This is commonly used on embedded
 	  systems and represents a subset of the OpenGL API.
 
-endmenu
+endif # BR2_PACKAGE_MESA3D_DRIVER
 
 config BR2_PACKAGE_PROVIDES_OPENGL_EGL
 	default "mesa3d" if BR2_PACKAGE_MESA3D_OPENGL_EGL
@@ -115,7 +116,7 @@ config BR2_PACKAGE_PROVIDES_OPENGL_EGL
 config BR2_PACKAGE_PROVIDES_OPENGL_ES
 	default "mesa3d" if BR2_PACKAGE_MESA3D_OPENGL_ES
 
-endif
+endif # BR2_PACKAGE_MESA3D
 
 comment "mesa3d needs a toolchain w/ C++, largefile"
 	depends on !BR2_LARGEFILE || !BR2_INSTALL_LIBSTDCPP
-- 
1.8.3.2
