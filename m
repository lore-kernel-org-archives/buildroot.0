From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 12 Feb 2020 15:16:16 -0700
Subject: [Buildroot] [PATCH 1/1] package/mesa3d: allow selecting GLX platform
Message-ID: <20200212221616.53785-1-james.hilliard1@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/mesa3d/Config.in | 36 ++++++++++++++++++++++++++++++++++++
 package/mesa3d/mesa3d.mk |  6 ++++++
 2 files changed, 42 insertions(+)

diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index dbfc59bad5..b8b8451bbd 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -414,8 +414,40 @@ config BR2_PACKAGE_MESA3D_OPENGL_GLX
 comment "OpenGL GLX support needs X11"
 	depends on !BR2_PACKAGE_XORG7
 
+if BR2_PACKAGE_MESA3D_OPENGL_GLX
+
+choice
+	prompt "GLX platform"
+
+config BR2_PACKAGE_MESA3D_OPENGL_GLX_DRI
+	bool "dri"
+
+config BR2_PACKAGE_MESA3D_OPENGL_GLX_XLIB
+	bool "xlib"
+	depends on !BR2_PACKAGE_MESA3D_DRI_DRIVER
+
+comment "xlib conflicts with any mesa3d dri drivers"
+	depends on BR2_PACKAGE_MESA3D_DRI_DRIVER
+
+config BR2_PACKAGE_MESA3D_OPENGL_GLX_GALLIUM_XLIB
+	bool "gallium-xlib"
+	depends on !BR2_PACKAGE_MESA3D_DRI_DRIVER
+	depends on BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
+	depends on BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SWRAST
+
+comment "gallium-xlib conflicts with any mesa3d dri drivers and requires gallium w/ swrast"
+	depends on BR2_PACKAGE_MESA3D_DRI_DRIVER || \
+		!BR2_PACKAGE_MESA3D_GALLIUM_DRIVER || \
+		!BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SWRAST
+
+endchoice
+
+endif
+
 config BR2_PACKAGE_MESA3D_OPENGL_EGL
 	bool "OpenGL EGL"
+	depends on !BR2_PACKAGE_MESA3D_OPENGL_GLX || \
+		BR2_PACKAGE_MESA3D_OPENGL_GLX_DRI
 	select BR2_PACKAGE_HAS_LIBEGL
 	select BR2_PACKAGE_HAS_LIBEGL_WAYLAND
 	select BR2_PACKAGE_MESA3D_GBM
@@ -423,6 +455,10 @@ config BR2_PACKAGE_MESA3D_OPENGL_EGL
 	  Use the Khronos EGL APIs. EGL is a window manager for OpenGL
 	  applications similar to GLX, for X, and WGL, for Windows.
 
+comment "OpenGL EGL is incompatible w/ non-dri GLX platforms"
+	depends on BR2_PACKAGE_MESA3D_OPENGL_GLX
+	depends on !BR2_PACKAGE_MESA3D_OPENGL_GLX_DRI
+
 config BR2_PACKAGE_MESA3D_OPENGL_ES
 	bool "OpenGL ES"
 	select BR2_PACKAGE_HAS_LIBGLES
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index c14716bf15..a853454e05 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -57,7 +57,13 @@ ifeq ($(BR2_PACKAGE_MESA3D_OPENGL_GLX),y)
 #  dri          : dri based GLX requires at least one DRI driver || dri based GLX requires shared-glapi
 #  xlib         : xlib conflicts with any dri driver
 #  gallium-xlib : Gallium-xlib based GLX requires at least one gallium driver || Gallium-xlib based GLX requires softpipe or llvmpipe || gallium-xlib conflicts with any dri driver.
+ifeq ($(BR2_PACKAGE_MESA3D_OPENGL_GLX_DRI),y)
 MESA3D_CONF_OPTS += -Dglx=dri
+else ifeq ($(BR2_PACKAGE_MESA3D_OPENGL_GLX_XLIB),y)
+MESA3D_CONF_OPTS += -Dglx=xlib
+else ifeq ($(BR2_PACKAGE_MESA3D_OPENGL_GLX_GALLIUM_XLIB),y)
+MESA3D_CONF_OPTS += -Dglx=gallium-xlib
+endif
 ifeq ($(BR2_PACKAGE_MESA3D_NEEDS_XA),y)
 MESA3D_CONF_OPTS += -Dgallium-xa=true
 else
-- 
2.20.1
