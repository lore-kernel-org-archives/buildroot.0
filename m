From: Romain Naour <romain.naour@gmail.com>
Date: Wed,  7 Sep 2016 23:08:42 +0200
Subject: [Buildroot] [PATCH 3/4] package/efl: enable libdrm support
In-Reply-To: <1473282523-12796-1-git-send-email-romain.naour@gmail.com>
References: <1473282523-12796-1-git-send-email-romain.naour@gmail.com>
Message-ID: <1473282523-12796-3-git-send-email-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This support is required for Enlightenment wayland support [1] which
will be added in a follow up patch.

As stated in configure.ac, libdrm support needs libdrm, elput,
libxkbcommon and libgbm.

libgbm is only provided by mesa3d package when OpenGL EGL support is
enabled, so add a direct dependency on mesa3d.

Rework the libxkbcommon dependency since it's now required for
ecore-wayland and libdrm support.

[1] https://www.enlightenment.org/about-wayland

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
libgdm can be found as a standalone library on github [2] but it seems
not very active. I prefer to rely on Mesa3d version.
[2] https://github.com/robclark/libgbm
---
 package/efl/Config.in | 14 ++++++++++++++
 package/efl/efl.mk    |  9 ++++++++-
 2 files changed, 22 insertions(+), 1 deletion(-)

diff --git a/package/efl/Config.in b/package/efl/Config.in
index df13047..6171b29 100644
--- a/package/efl/Config.in
+++ b/package/efl/Config.in
@@ -194,6 +194,20 @@ config BR2_PACKAGE_EFL_ELPUT
 	  ecore_drm, etc) to handle interfacing with libinput without
 	  having to duplicate the code in each subsystem.
 
+config BR2_PACKAGE_EFL_DRM
+	bool "Evas DRM Engine"
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libdrm
+	depends on BR2_PACKAGE_MESA3D_OPENGL_EGL # require libgbm from mesa3d
+	depends on BR2_PACKAGE_EFL_ELPUT
+	select BR2_PACKAGE_LIBDRM
+	select BR2_PACKAGE_LIBXKBCOMMON
+	help
+	  This option enable building support for the Evas DRM Engine.
+
+comment "Evas DRM Engine needs mesa3d w/ EGL support, threads"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_PACKAGE_MESA3D_OPENGL_EGL
+	depends on BR2_PACKAGE_EFL_ELPUT
+
 comment "libevas loaders"
 
 config BR2_PACKAGE_EFL_PNG
diff --git a/package/efl/efl.mk b/package/efl/efl.mk
index 5b65758..413cf58 100644
--- a/package/efl/efl.mk
+++ b/package/efl/efl.mk
@@ -146,7 +146,7 @@ EFL_CONF_OPTS += --with-crypto=none
 endif # BR2_PACKAGE_OPENSSL
 
 ifeq ($(BR2_PACKAGE_WAYLAND),y)
-EFL_DEPENDENCIES += wayland libxkbcommon
+EFL_DEPENDENCIES += wayland
 EFL_CONF_OPTS += --enable-wayland
 else
 EFL_CONF_OPTS += --disable-wayland
@@ -200,6 +200,13 @@ ifeq ($(BR2_PACKAGE_EFL_OPENGL_NONE),y)
 EFL_CONF_OPTS += --with-opengl=none
 endif
 
+ifeq ($(BR2_PACKAGE_EFL_DRM),y)
+EFL_CONF_OPTS += --enable-drm
+EFL_DEPENDENCIES += libdrm libegl mesa3d
+endif
+
+EFL_DEPENDENCIES += $(if $(BR2_PACKAGE_LIBXKBCOMMON),libxkbcommon)
+
 # Loaders that need external dependencies needs to be --enable-XXX=yes
 # otherwise the default is '=static'.
 # All other loaders are statically built-in
-- 
2.5.5
