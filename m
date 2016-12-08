From: Romain Naour <romain.naour@gmail.com>
Date: Thu,  8 Dec 2016 23:24:17 +0100
Subject: [Buildroot] [PATCH v4 2/2] package/efl: add Wayland support
In-Reply-To: <1481235857-23293-1-git-send-email-romain.naour@gmail.com>
References: <1481235857-23293-1-git-send-email-romain.naour@gmail.com>
Message-ID: <1481235857-23293-2-git-send-email-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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
---
v4: new patch
    merge Evas GL DRM Engine support and with Wayland support
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
-- 
2.5.5
