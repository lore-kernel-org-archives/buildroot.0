From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 22 Jun 2020 23:03:20 +0200
Subject: [Buildroot] [PATCH 2/2 v3] package/mesa3d: make it aware of
 libglvnd and support it when present
In-Reply-To: <cover.1592859356.git.yann.morin.1998@free.fr>
References: <cover.1592859356.git.yann.morin.1998@free.fr>
Message-ID: <d09d09de3bedf9fa0c91cf515269bbb4e7014dc4.1592859356.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Jakub Skrzypnik <jskrzypnik@novomatic-tech.com>

When libglvnd is enabled, mesa3d must be told so, so as it installs its
libraries with the vendor suffix (e.g. libEGL_mesa.so instead of
libEGL.so).

Additionally, the provider (in Buildroot parlance) is libglvnd, not mesa3d.

Signed-off-by: Jakub Skrzypnik <jskrzypnik@novomatic-tech.com>
[yann.morin.1998 at free.fr:
  - don't override the _PROVIDES variable, only assign when needed
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/mesa3d/Config.in | 15 +++++++++------
 package/mesa3d/mesa3d.mk | 15 +++++++++++----
 2 files changed, 20 insertions(+), 10 deletions(-)

diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index 11d04b7a3f..5417aeda1a 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -422,7 +422,8 @@ comment "gbm support needs a dri driver or a gallium driver w/ EGL support."
 config BR2_PACKAGE_MESA3D_OPENGL_GLX
 	bool "OpenGL GLX"
 	depends on BR2_PACKAGE_XORG7
-	select BR2_PACKAGE_HAS_LIBGL
+	select BR2_PACKAGE_HAS_LIBGL if !BR2_PACKAGE_LIBGLVND
+	select BR2_PACKAGE_LIBGLVND_DISPATCH_GL if BR2_PACKAGE_LIBGLVND
 	select BR2_PACKAGE_MESA3D_NEEDS_X11
 	help
 	  Enable GLX graphic acceleration (OpenGL + X11).
@@ -432,7 +433,8 @@ comment "OpenGL GLX support needs X11"
 
 config BR2_PACKAGE_MESA3D_OPENGL_EGL
 	bool "OpenGL EGL"
-	select BR2_PACKAGE_HAS_LIBEGL
+	select BR2_PACKAGE_HAS_LIBEGL if !BR2_PACKAGE_LIBGLVND
+	select BR2_PACKAGE_LIBGLVND_DISPATCH_EGL if BR2_PACKAGE_LIBGLVND
 	select BR2_PACKAGE_HAS_LIBEGL_WAYLAND
 	select BR2_PACKAGE_MESA3D_GBM
 	help
@@ -441,7 +443,8 @@ config BR2_PACKAGE_MESA3D_OPENGL_EGL
 
 config BR2_PACKAGE_MESA3D_OPENGL_ES
 	bool "OpenGL ES"
-	select BR2_PACKAGE_HAS_LIBGLES
+	select BR2_PACKAGE_HAS_LIBGLES if !BR2_PACKAGE_LIBGLVND
+	select BR2_PACKAGE_LIBGLVND_DISPATCH_GLES if BR2_PACKAGE_LIBGLVND
 	help
 	  Use the Khronos OpenGL ES APIs. This is commonly used on
 	  embedded systems and represents a subset of the OpenGL API.
@@ -449,13 +452,13 @@ config BR2_PACKAGE_MESA3D_OPENGL_ES
 endif # BR2_PACKAGE_MESA3D_DRIVER
 
 config BR2_PACKAGE_PROVIDES_LIBGL
-	default "mesa3d" if BR2_PACKAGE_MESA3D_OPENGL_GLX
+	default "mesa3d" if BR2_PACKAGE_MESA3D_OPENGL_GLX && !BR2_PACKAGE_LIBGLVND
 
 config BR2_PACKAGE_PROVIDES_LIBEGL
-	default "mesa3d" if BR2_PACKAGE_MESA3D_OPENGL_EGL
+	default "mesa3d" if BR2_PACKAGE_MESA3D_OPENGL_EGL && !BR2_PACKAGE_LIBGLVND
 
 config BR2_PACKAGE_PROVIDES_LIBGLES
-	default "mesa3d" if BR2_PACKAGE_MESA3D_OPENGL_ES
+	default "mesa3d" if BR2_PACKAGE_MESA3D_OPENGL_ES && !BR2_PACKAGE_LIBGLVND
 
 config BR2_PACKAGE_PROVIDES_LIBOPENCL
 	default "mesa3d" if BR2_PACKAGE_MESA3D_OPENCL
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 4e083979cc..2f61b4d219 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -162,9 +162,9 @@ MESA3D_CONF_OPTS += -Dopengl=true
 # we do not need libva support in mesa3d, therefore disable this option
 MESA3D_CONF_OPTS += -Dgallium-va=false
 
-# libGL is only provided for a full xorg stack
+# libGL is only provided for a full xorg stack, without libglvnd
 ifeq ($(BR2_PACKAGE_MESA3D_OPENGL_GLX),y)
-MESA3D_PROVIDES += libgl
+MESA3D_PROVIDES += $(if $(BR2_PACKAGE_LIBGLVND),,libgl)
 else
 define MESA3D_REMOVE_OPENGL_HEADERS
 	rm -rf $(STAGING_DIR)/usr/include/GL/
@@ -224,7 +224,7 @@ MESA3D_CONF_OPTS += \
 endif
 
 ifeq ($(BR2_PACKAGE_MESA3D_OPENGL_EGL),y)
-MESA3D_PROVIDES += libegl
+MESA3D_PROVIDES += $(if $(BR2_PACKAGE_LIBGLVND),,libegl)
 MESA3D_CONF_OPTS += \
 	-Degl=true
 else
@@ -233,7 +233,7 @@ MESA3D_CONF_OPTS += \
 endif
 
 ifeq ($(BR2_PACKAGE_MESA3D_OPENGL_ES),y)
-MESA3D_PROVIDES += libgles
+MESA3D_PROVIDES += $(if $(BR2_PACKAGE_LIBGLVND),,libgles)
 MESA3D_CONF_OPTS += -Dgles1=true -Dgles2=true
 else
 MESA3D_CONF_OPTS += -Dgles1=false -Dgles2=false
@@ -281,4 +281,11 @@ else
 MESA3D_CONF_OPTS += -Dzstd=false
 endif
 
+ifeq ($(BR2_PACKAGE_LIBGLVND),y)
+MESA3D_DEPENDENCIES += libglvnd
+MESA3D_CONF_OPTS += -Dglvnd=true
+else
+MESA3D_CONF_OPTS += -Dglvnd=false
+endif
+
 $(eval $(meson-package))
-- 
2.20.1
