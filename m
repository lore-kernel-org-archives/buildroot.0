From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 17 Apr 2014 22:56:02 +0200
Subject: [Buildroot] [git commit] package/mesa3d: re-arrange menu items
Message-ID: <20140417210125.31F029C80A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7c4765f574ffa5a81d67413c7caaa0e83b60520f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Make mesa3d a menuconfig, ie. a sub-menu on the boolean option.

Move drivers and additional API selections out of their own submenus,
add a comment as separator.

This will make it easier to further re-arrange the config items in
the following patches, to fix-enhance the packaging to handle the
full-openGL provider stuff.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Paul Cercueil <paul@crapouillou.net>
Cc: Bernd Kuhls <berndkuhls@hotmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/mesa3d/Config.in |   15 ++++++++-------
 1 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index 81f2272..801a203 100644
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
@@ -61,6 +61,8 @@ comment "DRI drivers needs a toolchain w/ dynamic library"
 
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
 
 config BR2_PACKAGE_PROVIDES_LIBEGL
 	default "mesa3d" if BR2_PACKAGE_MESA3D_OPENGL_EGL
@@ -115,7 +116,7 @@ config BR2_PACKAGE_PROVIDES_LIBEGL
 config BR2_PACKAGE_PROVIDES_LIBGLES
 	default "mesa3d" if BR2_PACKAGE_MESA3D_OPENGL_ES
 
-endif
+endif # BR2_PACKAGE_MESA3D
 
 comment "mesa3d needs a toolchain w/ C++, largefile"
 	depends on !BR2_LARGEFILE || !BR2_INSTALL_LIBSTDCPP
