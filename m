From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 28 Jul 2018 22:31:16 +0200
Subject: [Buildroot] [git commit] package/mesa3d: switch to xorgproto
Message-ID: <20180728211151.AA2758A392@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=40a324e3fa92e9c208a21943d9ea430b6bec0081
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The new package xorgproto will combine and replace all current xproto_*
packages. For details read
https://lists.x.org/archives/xorg-announce/2018-February/002835.html

Removed dri3 handling because xorgproto always installs dri3proto.

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/mesa3d/Config.in | 18 ++++--------------
 package/mesa3d/mesa3d.mk |  8 +++-----
 2 files changed, 7 insertions(+), 19 deletions(-)

diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index 8c1877fbc1..dd36a5e0fd 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -8,9 +8,7 @@ menuconfig BR2_PACKAGE_MESA3D
 	select BR2_PACKAGE_EXPAT
 	select BR2_PACKAGE_HAS_LIBGL if BR2_PACKAGE_XORG7
 	select BR2_PACKAGE_WAYLAND_PROTOCOLS if BR2_PACKAGE_WAYLAND
-	select BR2_PACKAGE_XPROTO_DRI2PROTO if BR2_PACKAGE_XORG7
-	select BR2_PACKAGE_XPROTO_GLPROTO if BR2_PACKAGE_XORG7
-	select BR2_PACKAGE_XPROTO_XF86DRIPROTO if BR2_PACKAGE_XORG7
+	select BR2_PACKAGE_XORGPROTO if BR2_PACKAGE_XORG7
 	select BR2_PACKAGE_XLIB_LIBX11 if BR2_PACKAGE_XORG7
 	select BR2_PACKAGE_XLIB_LIBXEXT if BR2_PACKAGE_XORG7
 	select BR2_PACKAGE_XLIB_LIBXDAMAGE if BR2_PACKAGE_XORG7
@@ -59,15 +57,7 @@ config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
 config BR2_PACKAGE_MESA3D_DRI_DRIVER
 	bool
 	select BR2_PACKAGE_MESA3D_DRIVER
-	# xlib-libxshmfence needs sync_4, so we cannot select it if
-	# BR2_TOOLCHAIN_HAS_SYNC_4 is false. xproto-presentproto
-	# doesn't need sync_4, but it is only needed in conjunction
-	# with xlib-libxshmfence and dri3proto to provide dri3
-	# support, so we also only select it if sync_4 is available.
-	select BR2_PACKAGE_XLIB_LIBXSHMFENCE if \
-		(BR2_PACKAGE_XPROTO_DRI3PROTO && BR2_TOOLCHAIN_HAS_SYNC_4)
-	select BR2_PACKAGE_XPROTO_PRESENTPROTO if \
-		(BR2_PACKAGE_XPROTO_DRI3PROTO && BR2_TOOLCHAIN_HAS_SYNC_4)
+	select BR2_PACKAGE_XLIB_LIBXSHMFENCE if BR2_TOOLCHAIN_HAS_SYNC_4
 
 config BR2_PACKAGE_MESA3D_VULKAN_DRIVER
 	bool
@@ -221,9 +211,9 @@ config BR2_PACKAGE_MESA3D_VULKAN_DRIVER_INTEL
 	depends on BR2_i386 || BR2_x86_64
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_18 # memfd.h
 	depends on BR2_TOOLCHAIN_USES_GLIBC # ifunc, static_assert
-	depends on BR2_PACKAGE_XORG7 # xproto_dri3proto
+	depends on BR2_PACKAGE_XORG7 # xorgproto
 	select BR2_PACKAGE_MESA3D_VULKAN_DRIVER
-	select BR2_PACKAGE_XPROTO_DRI3PROTO
+	select BR2_PACKAGE_XORGPROTO
 	help
 	  Vulkan driver for Intel hardware from Ivy Bridge onward.
 
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 21891864b3..5c01f92e22 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -57,13 +57,11 @@ endif
 
 ifeq ($(BR2_PACKAGE_XORG7),y)
 MESA3D_DEPENDENCIES += \
-	xproto_xf86driproto \
-	xproto_dri2proto \
-	xproto_glproto \
 	xlib_libX11 \
 	xlib_libXext \
 	xlib_libXdamage \
 	xlib_libXfixes \
+	xorgproto \
 	libxcb
 MESA3D_CONF_OPTS += --enable-glx --disable-mangling
 # quote from mesa3d configure "Building xa requires at least one non swrast gallium driver."
@@ -113,8 +111,8 @@ ifeq ($(BR2_PACKAGE_MESA3D_DRI_DRIVER),)
 MESA3D_CONF_OPTS += \
 	--without-dri-drivers --disable-dri3
 else
-ifeq ($(BR2_PACKAGE_XLIB_LIBXSHMFENCE)$(BR2_PACKAGE_XPROTO_DRI3PROTO),yy)
-MESA3D_DEPENDENCIES += xlib_libxshmfence xproto_dri3proto xproto_presentproto
+ifeq ($(BR2_PACKAGE_XLIB_LIBXSHMFENCE),y)
+MESA3D_DEPENDENCIES += xlib_libxshmfence
 MESA3D_CONF_OPTS += --enable-dri3
 else
 MESA3D_CONF_OPTS += --disable-dri3
