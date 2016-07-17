From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 17 Jul 2016 18:27:54 +0200
Subject: [Buildroot] [PATCH v3 2/3] package/mesa3d: provides libgl not only
	with DRI drivers
In-Reply-To: <1468772875-5090-1-git-send-email-bernd.kuhls@t-online.de>
References: <1468772875-5090-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1468772875-5090-2-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch is a follow-up for
https://github.com/buildroot/buildroot/commit/999d4a263118ab8581190d3e3c8bdc471896628f

libGL.so and support files are not only available with DRI drivers but
also with Gallium drivers, in fact mesa3d can be built without any
driver enabled - unless X.org is disabled it will provide libGL.so.

Tested using this defconfig:
BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
BR2_TOOLCHAIN_BUILDROOT_CXX=y
BR2_PACKAGE_KODI=y
BR2_PACKAGE_KODI_VISUALISATION_WAVEFORHUE=y
BR2_PACKAGE_MESA3D=y
BR2_PACKAGE_XORG7=y

Fixes
http://autobuild.buildroot.net/results/d97/d97a80e6de066a7dea08b284eab24fc44b11d661/

kodi-visualisation-waveforhue detects OpenGL installed by mesa3d but the
kodi package itself does not select libglew before because mesa3d was
not listed as a provider for libgl in the buildroot build system.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
v3: fixed X.org comment typo (Yann)
    moved before the Vulkan driver patch and rebased (Yann)
v2: never released

 package/mesa3d/Config.in | 9 ++++-----
 package/mesa3d/mesa3d.mk | 9 +++++----
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index 45ca69c..a7c8743 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -6,6 +6,7 @@ menuconfig BR2_PACKAGE_MESA3D
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	select BR2_PACKAGE_LIBDRM
 	select BR2_PACKAGE_EXPAT
+	select BR2_PACKAGE_HAS_LIBGL if BR2_PACKAGE_XORG7
 	select BR2_PACKAGE_XPROTO_DRI2PROTO if BR2_PACKAGE_XORG7
 	select BR2_PACKAGE_XPROTO_GLPROTO if BR2_PACKAGE_XORG7
 	select BR2_PACKAGE_XPROTO_XF86DRIPROTO if BR2_PACKAGE_XORG7
@@ -28,15 +29,10 @@ config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
 
 config BR2_PACKAGE_MESA3D_DRI_DRIVER
 	select BR2_PACKAGE_MESA3D_DRIVER
-	select BR2_PACKAGE_HAS_LIBGL if BR2_PACKAGE_XORG7
 	select BR2_PACKAGE_XLIB_LIBXSHMFENCE if BR2_PACKAGE_XPROTO_DRI3PROTO
 	select BR2_PACKAGE_XPROTO_PRESENTPROTO if BR2_PACKAGE_XPROTO_DRI3PROTO
 	bool
 
-config BR2_PACKAGE_PROVIDES_LIBGL
-	default "mesa3d" if BR2_PACKAGE_MESA3D_DRI_DRIVER && \
-		BR2_PACKAGE_XORG7
-
 config BR2_PACKAGE_MESA3D_DRIVER
 	bool
 
@@ -163,6 +159,9 @@ config BR2_PACKAGE_MESA3D_OPENGL_ES
 
 endif # BR2_PACKAGE_MESA3D_DRIVER
 
+config BR2_PACKAGE_PROVIDES_LIBGL
+	default "mesa3d" if BR2_PACKAGE_XORG7
+
 config BR2_PACKAGE_PROVIDES_LIBEGL
 	default "mesa3d" if BR2_PACKAGE_MESA3D_OPENGL_EGL
 
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 19dec49..3be8831 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -109,10 +109,6 @@ endif
 ifeq ($(BR2_PACKAGE_XLIB_LIBXXF86VM),y)
 MESA3D_DEPENDENCIES += xlib_libXxf86vm
 endif
-# libGL is only provided for a full xorg stack
-ifeq ($(BR2_PACKAGE_XORG7),y)
-MESA3D_PROVIDES += libgl
-endif
 MESA3D_CONF_OPTS += \
 	--enable-shared-glapi \
 	--enable-driglx-direct \
@@ -135,6 +131,11 @@ MESA3D_CONF_OPTS += --enable-opengl --enable-dri
 # we do not need libva support in mesa3d, therefore disable this option
 MESA3D_CONF_OPTS += --disable-va
 
+# libGL is only provided for a full xorg stack
+ifeq ($(BR2_PACKAGE_XORG7),y)
+MESA3D_PROVIDES += libgl
+endif
+
 ifeq ($(BR2_PACKAGE_MESA3D_OPENGL_EGL),y)
 MESA3D_PROVIDES += libegl
 ifeq ($(BR2_PACKAGE_MESA3D_DRI_DRIVER),y)
-- 
2.8.1
