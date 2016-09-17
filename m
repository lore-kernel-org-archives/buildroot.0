From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 17 Sep 2016 16:57:54 +0200
Subject: [Buildroot] [git commit] package/efl: add OpenGL/OpenGLES support
Message-ID: <20160917165030.7E1D281922@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=87b73f50a3df962e2b07a966557f888dec89c2cc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Allow to enable graphic acceleration using OpenGL or OpenGLES with efl
libraries.

The full OpenGL option depend on X11, because full OpenGL means GLX,
which means X11. Also select efl xlib support when full OpenGL is
selected.

Enable OpenGL ES when EGL API is enabled, otherwise the build fail with
this error:
configure: error: OpenGL ES requires EGL, please add --enable-egl to your configure options to switch to EGL + OpenGL ES.

With the upcomming Wayland support in EFL Buildroot packaging,
OpenGL ES support is recommended.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
[Thomas:
 - use a single ifeq/else ifeq/else ifeq/endif block
 - remove the "default" for the choice, move the "none" choice at the
   end, and simply rely on the first choice having its dependencies met
   being automatically enable by kconfig. So OpenGL first, then
   OpenGLES, and then none.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/efl/Config.in | 28 ++++++++++++++++++++++++++++
 package/efl/efl.mk    | 15 ++++++++++++---
 2 files changed, 40 insertions(+), 3 deletions(-)

diff --git a/package/efl/Config.in b/package/efl/Config.in
index 1cc681c..fa6d761 100644
--- a/package/efl/Config.in
+++ b/package/efl/Config.in
@@ -155,6 +155,34 @@ config BR2_PACKAGE_EFL_X_XLIB
 	select BR2_PACKAGE_XLIB_LIBXTST
 	select BR2_PACKAGE_XPROTO_GLPROTO
 
+choice
+	bool "OpenGL support"
+	help
+	  libevas can be configured to use HW acceleration with OpenGL or
+	  OpenGL ES.
+
+config BR2_PACKAGE_EFL_OPENGL
+	bool "OpenGL"
+	depends on BR2_PACKAGE_HAS_LIBGL
+	depends on BR2_PACKAGE_XORG7
+	select BR2_PACKAGE_EFL_X_XLIB
+
+comment "OpenGL support needs X11 and an OpenGL provider"
+	depends on !BR2_PACKAGE_HAS_LIBGL || !BR2_PACKAGE_XORG7
+
+config BR2_PACKAGE_EFL_OPENGLES
+	bool "OpenGL ES (w/ EGL)"
+	depends on BR2_PACKAGE_HAS_LIBEGL
+	depends on BR2_PACKAGE_HAS_LIBGLES
+
+comment "OpenGL ES support needs an OpenGL ES w/ EGL provider"
+	depends on !BR2_PACKAGE_HAS_LIBGLES || !BR2_PACKAGE_HAS_LIBEGL
+
+config BR2_PACKAGE_EFL_OPENGL_NONE
+	bool "none"
+
+endchoice # OpenGL support
+
 comment "libevas loaders"
 
 config BR2_PACKAGE_EFL_PNG
diff --git a/package/efl/efl.mk b/package/efl/efl.mk
index 83588c1..853c9dc 100644
--- a/package/efl/efl.mk
+++ b/package/efl/efl.mk
@@ -28,7 +28,6 @@ EFL_DEPENDENCIES = host-pkgconf host-efl host-luajit dbus freetype \
 # --disable-sdl: disable sdl2 support.
 # --disable-spectre: disable spectre image loader.
 # --disable-xinput22: disable X11 XInput v2.2+ support.
-# --with-opengl=none: disable opengl support.
 # --with-doxygen: disable doxygen documentation
 EFL_CONF_OPTS = \
 	--with-edje-cc=$(HOST_DIR)/usr/bin/edje_cc \
@@ -43,8 +42,7 @@ EFL_CONF_OPTS = \
 	--disable-sdl \
 	--disable-spectre \
 	--disable-xinput22 \
-	--with-doxygen=no \
-	--with-opengl=none
+	--with-doxygen=no
 
 # Disable untested configuration warning.
 ifeq ($(BR2_PACKAGE_EFL_HAS_RECOMMENDED_CONFIG),)
@@ -182,6 +180,17 @@ else
 EFL_CONF_OPTS += --with-x11=none
 endif
 
+ifeq ($(BR2_PACKAGE_EFL_OPENGL),y)
+EFL_CONF_OPTS += --with-opengl=full
+EFL_DEPENDENCIES += libgl
+# OpenGL ES requires EGL
+else ifeq ($(BR2_PACKAGE_EFL_OPENGLES),y)
+EFL_CONF_OPTS += --with-opengl=es --enable-egl
+EFL_DEPENDENCIES += libegl libgles
+else ifeq ($(BR2_PACKAGE_EFL_OPENGL_NONE),y)
+EFL_CONF_OPTS += --with-opengl=none
+endif
+
 # Loaders that need external dependencies needs to be --enable-XXX=yes
 # otherwise the default is '=static'.
 # All other loaders are statically built-in
