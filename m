From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon, 25 Apr 2016 14:20:15 +0200
Subject: [Buildroot] [PATCH 1/8] package/mesa3d: introduce new Kconfig
	option to indicate full OpenGL support
Message-ID: <1461586822-1003-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Until this commit
https://git.busybox.net/buildroot/commit/package/mesa3d?id=f1894ec95728806e09405d26663e0ea371afaeab
having an enabled DRI driver meant that X.org & full OpenGL support is
also present. This is no longer the case which makes is difficult for
users and other packages to determine whether full OpenGL support is
present or not.

This patch adds a new Kconfig option BR2_PACKAGE_MESA3D_OPENGL_GL
to indicate full OpenGL support and meaningful comments in
mesa3d/Config.in to describe what is necessary to build with full
OpenGL support.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/mesa3d/Config.in | 29 ++++++++++++++++++++++++++++-
 package/mesa3d/mesa3d.mk |  3 +--
 2 files changed, 29 insertions(+), 3 deletions(-)

diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index 45ca69c..2235f6c 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -29,6 +29,7 @@ config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
 config BR2_PACKAGE_MESA3D_DRI_DRIVER
 	select BR2_PACKAGE_MESA3D_DRIVER
 	select BR2_PACKAGE_HAS_LIBGL if BR2_PACKAGE_XORG7
+	select BR2_PACKAGE_MESA3D_OPENGL_GL if BR2_PACKAGE_XORG7
 	select BR2_PACKAGE_XLIB_LIBXSHMFENCE if BR2_PACKAGE_XPROTO_DRI3PROTO
 	select BR2_PACKAGE_XPROTO_PRESENTPROTO if BR2_PACKAGE_XPROTO_DRI3PROTO
 	bool
@@ -145,7 +146,33 @@ config BR2_PACKAGE_MESA3D_OSMESA
 
 if BR2_PACKAGE_MESA3D_DRIVER
 
-comment "Additional API Support"
+comment "API Support"
+
+if BR2_PACKAGE_MESA3D_DRI_DRIVER
+if BR2_PACKAGE_XORG7
+
+config BR2_PACKAGE_MESA3D_OPENGL_GL
+	bool "OpenGL"
+	help
+	  This helper option is only visible when enabled and indicates
+	  that Mesa3D contains full OpenGL support.
+
+endif
+endif
+
+comment "full OpenGL support needs a DRI driver"
+	depends on !BR2_PACKAGE_MESA3D_OPENGL_GL
+	depends on BR2_PACKAGE_XORG7
+
+comment "full OpenGL support needs X.org"
+	depends on BR2_PACKAGE_MESA3D_DRI_DRIVER
+	depends on !BR2_PACKAGE_MESA3D_OPENGL_GL
+	depends on !BR2_PACKAGE_XORG7
+
+comment "full OpenGL support needs a DRI driver and X.org"
+	depends on !BR2_PACKAGE_MESA3D_DRI_DRIVER
+	depends on !BR2_PACKAGE_MESA3D_OPENGL_GL
+	depends on !BR2_PACKAGE_XORG7
 
 config BR2_PACKAGE_MESA3D_OPENGL_EGL
 	bool "OpenGL EGL"
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index ab3c9be..ee491b8 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -105,8 +105,7 @@ endif
 ifeq ($(BR2_PACKAGE_XLIB_LIBXXF86VM),y)
 MESA3D_DEPENDENCIES += xlib_libXxf86vm
 endif
-# libGL is only provided for a full xorg stack
-ifeq ($(BR2_PACKAGE_XORG7),y)
+ifeq ($(BR2_PACKAGE_MESA3D_OPENGL_GL),y)
 MESA3D_PROVIDES += libgl
 endif
 MESA3D_CONF_OPTS += \
-- 
2.8.0.rc3
