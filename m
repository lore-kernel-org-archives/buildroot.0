From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 9 Dec 2016 20:10:38 +0100
Subject: [Buildroot] [git commit] package/efl: enable libdrm support
Message-ID: <20161209191439.756A2802B5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d654c3979145c26fddd3f51475b8fe0e4c16bb95
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

drm can be used without compositor, just like it was with
the framebuffer for standalone applications

As stated in configure.ac, libdrm support needs libdrm, elput,
libxkbcommon and libgbm.

libgbm is only provided by mesa3d package when OpenGL EGL support is
enabled, so add a direct dependency on mesa3d.

Rework the libxkbcommon dependency since it's now required for
elput and libdrm support.

[1] https://www.enlightenment.org/about-wayland

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Pierre Floury <devpfl@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/efl/Config.in | 13 +++++++++++++
 package/efl/efl.mk    | 11 ++++++++++-
 2 files changed, 23 insertions(+), 1 deletion(-)

diff --git a/package/efl/Config.in b/package/efl/Config.in
index 5d687e8..0692d80 100644
--- a/package/efl/Config.in
+++ b/package/efl/Config.in
@@ -193,6 +193,19 @@ config BR2_PACKAGE_EFL_ELPUT
 	  ecore_drm, etc) to handle interfacing with libinput without
 	  having to duplicate the code in each subsystem.
 
+config BR2_PACKAGE_EFL_DRM
+	bool "Evas DRM Engine"
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libdrm
+	depends on BR2_PACKAGE_MESA3D_OPENGL_EGL # require libgbm from mesa3d
+	select BR2_PACKAGE_EFL_ELPUT
+	select BR2_PACKAGE_LIBDRM
+	select BR2_PACKAGE_LIBXKBCOMMON
+	help
+	  This option enable building support for the Evas DRM Engine.
+
+comment "Evas DRM Engine needs mesa3d w/ EGL support, threads"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_PACKAGE_MESA3D_OPENGL_EGL
+
 comment "libevas loaders"
 
 config BR2_PACKAGE_EFL_PNG
diff --git a/package/efl/efl.mk b/package/efl/efl.mk
index e08f252..d823af2 100644
--- a/package/efl/efl.mk
+++ b/package/efl/efl.mk
@@ -150,7 +150,7 @@ endif # BR2_PACKAGE_OPENSSL
 
 ifeq ($(BR2_PACKAGE_EFL_ELPUT),y)
 EFL_CONF_OPTS += --enable-elput
-EFL_DEPENDENCIES += libinput libxkbcommon
+EFL_DEPENDENCIES += libinput
 else
 EFL_CONF_OPTS += --disable-elput
 endif
@@ -194,6 +194,15 @@ else ifeq ($(BR2_PACKAGE_EFL_OPENGL_NONE),y)
 EFL_CONF_OPTS += --with-opengl=none
 endif
 
+ifeq ($(BR2_PACKAGE_EFL_DRM),y)
+EFL_CONF_OPTS += --enable-drm
+EFL_DEPENDENCIES += libdrm libegl mesa3d
+else
+EFL_CONF_OPTS += --disable-drm
+endif
+
+EFL_DEPENDENCIES += $(if $(BR2_PACKAGE_LIBXKBCOMMON),libxkbcommon)
+
 # Loaders that need external dependencies needs to be --enable-XXX=yes
 # otherwise the default is '=static'.
 # All other loaders are statically built-in
