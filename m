From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 9 Dec 2016 20:12:06 +0100
Subject: [Buildroot] [git commit] package/efl: add Wayland support
Message-ID: <20161209191439.813CB802B5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f30eec41f95ed99909eb2c7590d83c12b9142df2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The EFL Wayland support was removed with commit [1] since the dependecy
on libdrm was missing. Also it requires OpenGL ES with EGL, Evas DRM
and Evas GLES DRM support [2].

As stated in configure, Evas GLES DRM engine support (gl_drm) depends
on wayland-client to build (wayland-client >= 1.8.0).

So, enable gl_drm only when wayland support is selected.

[1] 4f04be1659f186765f506c68f5bfbf6845fc40dc
[2] https://www.enlightenment.org/about-wayland

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Pierre Floury <devpfl@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/efl/Config.in | 12 ++++++++++++
 package/efl/efl.mk    | 10 ++++++++++
 2 files changed, 22 insertions(+)

diff --git a/package/efl/Config.in b/package/efl/Config.in
index 0692d80..c51fc56 100644
--- a/package/efl/Config.in
+++ b/package/efl/Config.in
@@ -155,6 +155,18 @@ config BR2_PACKAGE_EFL_X_XLIB
 	select BR2_PACKAGE_XLIB_LIBXTST
 	select BR2_PACKAGE_XPROTO_GLPROTO
 
+config BR2_PACKAGE_EFL_WAYLAND
+	bool "Wayland support"
+	depends on BR2_TOOLCHAIN_HAS_THREADS # Evas DRM Engine -> libdrm
+	depends on BR2_PACKAGE_MESA3D_OPENGL_EGL # Evas DRM Engine
+	depends on BR2_PACKAGE_EFL_OPENGLES # OpenGL ES with EGL support only
+	select BR2_PACKAGE_EFL_DRM
+	select BR2_PACKAGE_WAYLAND
+
+comment "Wayland support needs OpenGL ES w/ EGL, threads"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_PACKAGE_MESA3D_OPENGL_EGL \
+		|| !BR2_PACKAGE_EFL_OPENGLES
+
 choice
 	bool "OpenGL support"
 	help
diff --git a/package/efl/efl.mk b/package/efl/efl.mk
index d823af2..7a8e47f 100644
--- a/package/efl/efl.mk
+++ b/package/efl/efl.mk
@@ -201,6 +201,16 @@ else
 EFL_CONF_OPTS += --disable-drm
 endif
 
+# The EFL Wayland support requires Evas GLES DRM engine support
+# which depends on wayland-client to build.
+# So enable gl_drm only when wayland support is selected.
+ifeq ($(BR2_PACKAGE_EFL_WAYLAND),y)
+EFL_DEPENDENCIES += wayland
+EFL_CONF_OPTS += --enable-wayland --enable-gl-drm
+else
+EFL_CONF_OPTS += --disable-wayland --disable-gl-drm
+endif
+
 EFL_DEPENDENCIES += $(if $(BR2_PACKAGE_LIBXKBCOMMON),libxkbcommon)
 
 # Loaders that need external dependencies needs to be --enable-XXX=yes
