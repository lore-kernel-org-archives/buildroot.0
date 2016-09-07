From: Romain Naour <romain.naour@gmail.com>
Date: Wed,  7 Sep 2016 23:08:43 +0200
Subject: [Buildroot] [PATCH 4/4] package/efl: add Evas GL DRM Engine support
In-Reply-To: <1473282523-12796-1-git-send-email-romain.naour@gmail.com>
References: <1473282523-12796-1-git-send-email-romain.naour@gmail.com>
Message-ID: <1473282523-12796-4-git-send-email-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This support is required for Enlightenment wayland support [1].

As stated in configure, Evas GL DRM Engine needs OpenGL ES with EGL and
wayland (wayland-client >= 1.8.0)

[1] https://www.enlightenment.org/about-wayland

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 package/efl/Config.in | 10 ++++++++++
 package/efl/efl.mk    |  6 ++++++
 2 files changed, 16 insertions(+)

diff --git a/package/efl/Config.in b/package/efl/Config.in
index 6171b29..c6c26d8 100644
--- a/package/efl/Config.in
+++ b/package/efl/Config.in
@@ -208,6 +208,16 @@ comment "Evas DRM Engine needs mesa3d w/ EGL support, threads"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_PACKAGE_MESA3D_OPENGL_EGL
 	depends on BR2_PACKAGE_EFL_ELPUT
 
+config BR2_PACKAGE_EFL_GL_DRM
+	bool "Evas GL DRM Engine"
+	depends on BR2_PACKAGE_EFL_DRM
+	depends on BR2_PACKAGE_EFL_OPENGLES # OpenGL ES with EGL support only
+	help
+	  This option enable building support for the Evas DRM Engine.
+
+comment "Evas GL DRM Engine needs Evas DRM Engine, OpenGL ES w/ EGL"
+	depends on BR2_PACKAGE_EFL_DRM && !BR2_PACKAGE_EFL_OPENGLES
+
 comment "libevas loaders"
 
 config BR2_PACKAGE_EFL_PNG
diff --git a/package/efl/efl.mk b/package/efl/efl.mk
index 413cf58..e7d6f52 100644
--- a/package/efl/efl.mk
+++ b/package/efl/efl.mk
@@ -205,6 +205,12 @@ EFL_CONF_OPTS += --enable-drm
 EFL_DEPENDENCIES += libdrm libegl mesa3d
 endif
 
+ifeq ($(BR2_PACKAGE_EFL_GL_DRM),y)
+EFL_CONF_OPTS += --enable-gl-drm
+else
+EFL_CONF_OPTS += --disable-gl-drm
+endif
+
 EFL_DEPENDENCIES += $(if $(BR2_PACKAGE_LIBXKBCOMMON),libxkbcommon)
 
 # Loaders that need external dependencies needs to be --enable-XXX=yes
-- 
2.5.5
