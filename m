From: Romain Naour <romain.naour@gmail.com>
Date: Sat, 17 Sep 2016 23:56:58 +0200
Subject: [Buildroot] [PATCH v2 2/2] package/efl: add Evas GL DRM Engine
	support
In-Reply-To: <1474149418-16756-1-git-send-email-romain.naour@gmail.com>
References: <1474149418-16756-1-git-send-email-romain.naour@gmail.com>
Message-ID: <1474149418-16756-2-git-send-email-romain.naour@gmail.com>
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
v2: rename the option to BR2_PAKCAGE_EFL_GLES_DRM (ThomasP)
    fix the help text (ThomasP)
---
 package/efl/Config.in | 11 +++++++++++
 package/efl/efl.mk    |  6 ++++++
 2 files changed, 17 insertions(+)

diff --git a/package/efl/Config.in b/package/efl/Config.in
index 9f9fcf0..b6feac1 100644
--- a/package/efl/Config.in
+++ b/package/efl/Config.in
@@ -206,6 +206,17 @@ config BR2_PACKAGE_EFL_DRM
 comment "Evas DRM Engine needs mesa3d w/ EGL support, threads"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_PACKAGE_MESA3D_OPENGL_EGL
 
+config BR2_PAKCAGE_EFL_GLES_DRM
+	bool "Evas GLES DRM Engine"
+	depends on BR2_PACKAGE_EFL_DRM
+	depends on BR2_PACKAGE_EFL_OPENGLES # OpenGL ES with EGL support only
+	help
+	  This option enable building support for the Evas DRM OpenGL ES
+	  based engine.
+
+comment "Evas GL DRM Engine needs Evas DRM Engine, OpenGL ES w/ EGL"
+	depends on BR2_PACKAGE_EFL_DRM && !BR2_PACKAGE_EFL_OPENGLES
+
 comment "libevas loaders"
 
 config BR2_PACKAGE_EFL_PNG
diff --git a/package/efl/efl.mk b/package/efl/efl.mk
index 8ba478a..a04166e 100644
--- a/package/efl/efl.mk
+++ b/package/efl/efl.mk
@@ -205,6 +205,12 @@ else
 EFL_CONF_OPTS += --disable-drm
 endif
 
+ifeq ($(BR2_PAKCAGE_EFL_GLES_DRM),y)
+EFL_CONF_OPTS += --enable-gl-drm
+else
+EFL_CONF_OPTS += --disable-gl-drm
+endif
+
 EFL_DEPENDENCIES += $(if $(BR2_PACKAGE_LIBXKBCOMMON),libxkbcommon)
 
 # Loaders that need external dependencies needs to be --enable-XXX=yes
-- 
2.5.5
