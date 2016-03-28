From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 28 Mar 2016 18:48:15 -0300
Subject: [Buildroot] [PATCH] mesa3d: enable DRI drivers for xorg-less
	configurations
Message-ID: <1459201695-30709-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

mesa3d can in fact build the DRI infrastructure/drivers just fine
without lingering x11 libs around, it just needs libdrm & friends which
are already accounted for.

So make the libGL (full OpenGL) providing abilities dependant on x11
being present.

It serves it's purpose for EGL+GLES hardware acceleration, and can in
fact be built without them, but it's probably not very useful (still,
leave the option for people inclined to do so).

Simple test defconfig:

BR2_arm=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_PACKAGE_MESA3D=y
BR2_PACKAGE_MESA3D_DRI_DRIVER_SWRAST=y
BR2_PACKAGE_MESA3D_DRI_DRIVER_NOUVEAU=y
BR2_PACKAGE_MESA3D_DRI_DRIVER_RADEON=y
BR2_PACKAGE_MESA3D_OPENGL_EGL=y
BR2_PACKAGE_MESA3D_OPENGL_ES=y

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/mesa3d/Config.in | 9 +++------
 package/mesa3d/mesa3d.mk | 3 +++
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index a7aa297..8f6ab75 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -28,13 +28,14 @@ config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
 
 config BR2_PACKAGE_MESA3D_DRI_DRIVER
 	select BR2_PACKAGE_MESA3D_DRIVER
-	select BR2_PACKAGE_HAS_LIBGL
+	select BR2_PACKAGE_HAS_LIBGL if BR2_PACKAGE_XORG7
 	select BR2_PACKAGE_XLIB_LIBXSHMFENCE if BR2_PACKAGE_XPROTO_DRI3PROTO
 	select BR2_PACKAGE_XPROTO_PRESENTPROTO if BR2_PACKAGE_XPROTO_DRI3PROTO
 	bool
 
 config BR2_PACKAGE_PROVIDES_LIBGL
-	default "mesa3d" if BR2_PACKAGE_MESA3D_DRI_DRIVER
+	default "mesa3d" if BR2_PACKAGE_MESA3D_DRI_DRIVER && \
+		BR2_PACKAGE_XORG7
 
 config BR2_PACKAGE_MESA3D_DRIVER
 	bool
@@ -89,8 +90,6 @@ config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_VIRGL
 comment "DRI drivers need X.Org"
 	depends on !BR2_PACKAGE_XORG7
 
-if BR2_PACKAGE_XORG7
-
 comment "DRI drivers"
 
 config BR2_PACKAGE_MESA3D_DRI_DRIVER_SWRAST
@@ -130,8 +129,6 @@ config BR2_PACKAGE_MESA3D_DRI_DRIVER_RADEON
 	help
 	  Legacy Radeon driver for R100 series GPUs.
 
-endif # BR2_PACKAGE_XORG7
-
 comment "Off-screen Rendering"
 
 config BR2_PACKAGE_MESA3D_OSMESA
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index ff2f932..b8ccd1f 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -102,7 +102,10 @@ endif
 ifeq ($(BR2_PACKAGE_XLIB_LIBXXF86VM),y)
 MESA3D_DEPENDENCIES += xlib_libXxf86vm
 endif
+# libGL is only provided for a full xorg stack
+ifeq ($(BR2_PACKAGE_XORG7),y)
 MESA3D_PROVIDES += libgl
+endif
 MESA3D_CONF_OPTS += \
 	--enable-shared-glapi \
 	--enable-driglx-direct \
-- 
2.7.3
