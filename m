From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 29 Feb 2016 23:38:44 +0100
Subject: [Buildroot] [git commit] package/kodi-screensaver-rsxs: new package
Message-ID: <20160302202800.063B480203@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=75ce17d0e15062b6997c7a55e24b70ad96b2685d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Config.in.legacy                                   |  7 ++++
 .../kodi-screensaver-rsxs/0001-cross-compile.patch | 37 ++++++++++++++++++++++
 package/kodi-screensaver-rsxs/Config.in            | 10 ++++++
 .../kodi-screensaver-rsxs.hash                     |  2 ++
 .../kodi-screensaver-rsxs/kodi-screensaver-rsxs.mk | 14 ++++++++
 package/kodi/Config.in                             | 12 +------
 package/kodi/kodi.mk                               | 20 ++----------
 7 files changed, 73 insertions(+), 29 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 3def8a1..179cf47 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -145,6 +145,13 @@ endif
 ###############################################################################
 comment "Legacy options removed in 2016.05"
 
+config BR2_PACKAGE_KODI_RSXS
+	bool "rsxs support in Kodi was moved to an addon"
+	select BR2_LEGACY
+	select BR2_PACKAGE_KODI_SCREENSAVER_RSXS
+	help
+	  rsxs support in Kodi was moved to an addon
+
 config BR2_PACKAGE_KODI_GOOM
 	bool "Goom support in Kodi was moved to an addon"
 	select BR2_LEGACY
diff --git a/package/kodi-screensaver-rsxs/0001-cross-compile.patch b/package/kodi-screensaver-rsxs/0001-cross-compile.patch
new file mode 100644
index 0000000..56c2f4e
--- /dev/null
+++ b/package/kodi-screensaver-rsxs/0001-cross-compile.patch
@@ -0,0 +1,37 @@
+Fix cross-compilation
+
+Use the cross-compiler and not the host version.
+
+Patch sent upstream:
+https://github.com/notspiff/screensavers.rsxs/pull/5
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+
+diff -uNr screensavers.rsxs-195e0ec3fbbcb2ee2012cd560e42d05167f0f259.org/CMakeLists.txt screensavers.rsxs-195e0ec3fbbcb2ee2012cd560e42d05167f0f259/CMakeLists.txt
+--- screensavers.rsxs-195e0ec3fbbcb2ee2012cd560e42d05167f0f259.org/CMakeLists.txt	2015-03-19 12:20:23.000000000 +0100
++++ screensavers.rsxs-195e0ec3fbbcb2ee2012cd560e42d05167f0f259/CMakeLists.txt	2015-07-19 20:26:16.660481032 +0200
+@@ -33,6 +33,11 @@
+                     ${PROJECT_SOURCE_DIR}/${rsxs_dir}/src/skyrocket
+                     ${PROJECT_SOURCE_DIR}/${rsxs_dir}/src/solarwinds)
+                         
++
++get_filename_component( COMPILER_FILENAME "${CMAKE_C_COMPILER}" NAME )
++string( REGEX REPLACE "-[^-]+$" ""
++        TOOLCHAIN_NAME "${COMPILER_FILENAME}" )
++
+ include(ExternalProject)
+ set(update_command "")
+ if(BOOTSTRAP_IN_TREE OR NOT DEFINED BOOTSTRAP_IN_TREE)
+@@ -46,8 +51,11 @@
+   endif()
+ endif()
+ externalproject_add(rsxs SOURCE_DIR ${PROJECT_SOURCE_DIR}/${rsxs_dir}
+-                    CONFIGURE_COMMAND ${configure_start}
++                    CONFIGURE_COMMAND gl_cv_func_gettimeofday_clobber=no
++                                      ac_cv_func_malloc_0_nonnull=yes
++                                      ${configure_start}
+                                       --prefix=<INSTALL_DIR>
++                                      --host=${TOOLCHAIN_NAME}
+                                       --without-xscreensaver
+                                       --disable-cyclone
+                                       --disable-euphoria
diff --git a/package/kodi-screensaver-rsxs/Config.in b/package/kodi-screensaver-rsxs/Config.in
new file mode 100644
index 0000000..da12651
--- /dev/null
+++ b/package/kodi-screensaver-rsxs/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_KODI_SCREENSAVER_RSXS
+	bool "kodi-screensaver-rsxs"
+	depends on BR2_PACKAGE_KODI_GL # libglu
+	help
+	  RSXS screensaver add-ons for Kodi
+
+	  https://github.com/notspiff/screensavers.rsxs
+
+comment "kodi-screensaver-rsxs needs an OpenGL backend"
+	depends on !BR2_PACKAGE_KODI_GL
diff --git a/package/kodi-screensaver-rsxs/kodi-screensaver-rsxs.hash b/package/kodi-screensaver-rsxs/kodi-screensaver-rsxs.hash
new file mode 100644
index 0000000..568b44b
--- /dev/null
+++ b/package/kodi-screensaver-rsxs/kodi-screensaver-rsxs.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256 0797ffb720056ea2e04ac8b7ee4fc2dca1e42611ef138b347e928d8d7f3c696f kodi-screensaver-rsxs-195e0ec3fbbcb2ee2012cd560e42d05167f0f259.tar.gz
diff --git a/package/kodi-screensaver-rsxs/kodi-screensaver-rsxs.mk b/package/kodi-screensaver-rsxs/kodi-screensaver-rsxs.mk
new file mode 100644
index 0000000..c76e9da
--- /dev/null
+++ b/package/kodi-screensaver-rsxs/kodi-screensaver-rsxs.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# kodi-screensaver-rsxs
+#
+################################################################################
+
+KODI_SCREENSAVER_RSXS_VERSION = 195e0ec3fbbcb2ee2012cd560e42d05167f0f259
+KODI_SCREENSAVER_RSXS_SITE = $(call github,notspiff,screensavers.rsxs,$(KODI_SCREENSAVER_RSXS_VERSION))
+KODI_SCREENSAVER_RSXS_LICENSE = GPLv3
+KODI_SCREENSAVER_RSXS_LICENSE_FILES = lib/rsxs-1.0/COPYING
+
+KODI_SCREENSAVER_RSXS_DEPENDENCIES = kodi
+
+$(eval $(cmake-package))
diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index dcddade..af5e40b 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -81,9 +81,7 @@ menuconfig BR2_PACKAGE_KODI
 	select BR2_PACKAGE_TIFF
 	select BR2_PACKAGE_TINYXML
 	select BR2_PACKAGE_LIBDRM if BR2_PACKAGE_KODI_GL
-	select BR2_PACKAGE_XLIB_LIBXMU if BR2_PACKAGE_KODI_GL # needed by rsxs screensaver
 	select BR2_PACKAGE_XLIB_LIBXRANDR if BR2_PACKAGE_KODI_GL
-	select BR2_PACKAGE_XLIB_LIBXT if BR2_PACKAGE_KODI_GL # needed by rsxs screensaver
 	select BR2_PACKAGE_YAJL
 	select BR2_PACKAGE_ZLIB
 	select BR2_TOOLCHAIN_GLIBC_GCONV_LIBS_COPY if BR2_TOOLCHAIN_USES_GLIBC # runtime UTF conversion support
@@ -136,15 +134,6 @@ config BR2_PACKAGE_KODI_LIBBLURAY
 comment "libbluray support needs a toolchain w/ dynamic library"
 	depends on BR2_STATIC_LIBS
 
-config BR2_PACKAGE_KODI_RSXS
-	bool "rsxs screensaver"
-	depends on BR2_PACKAGE_KODI_GL
-	help
-	  Enable goom screensaver
-
-comment "rsxs needs an OpenGL backend"
-	depends on !BR2_PACKAGE_KODI_GL
-
 config BR2_PACKAGE_KODI_LIBCEC
 	bool "hdmi cec"
 	depends on !BR2_STATIC_LIBS # libcec
@@ -295,6 +284,7 @@ menu "Screensavers"
 	source "package/kodi-screensaver-greynetic/Config.in"
 	source "package/kodi-screensaver-pingpong/Config.in"
 	source "package/kodi-screensaver-pyro/Config.in"
+	source "package/kodi-screensaver-rsxs/Config.in"
 	source "package/kodi-screensaver-stars/Config.in"
 endmenu
 
diff --git a/package/kodi/kodi.mk b/package/kodi/kodi.mk
index 94e59e7..ef3f174 100644
--- a/package/kodi/kodi.mk
+++ b/package/kodi/kodi.mk
@@ -35,6 +35,7 @@ KODI_CONF_OPTS +=  \
 	--disable-openmax \
 	--disable-projectm \
 	--disable-pulse \
+	--disable-rsxs \
 	--disable-vdpau \
 	--disable-vtbdecoder \
 	--enable-optimizations
@@ -89,24 +90,8 @@ ifeq ($(BR2_PACKAGE_KODI_GL),y)
 KODI_DEPENDENCIES += libglew libglu libgl xlib_libX11 xlib_libXext \
 	xlib_libXmu xlib_libXrandr xlib_libXt libdrm
 KODI_CONF_OPTS += --enable-gl --enable-x11 --disable-gles
-ifeq ($(BR2_PACKAGE_KODI_RSXS),y)
-# fix rsxs compile
-# gcc5: http://trac.kodi.tv/ticket/16006#comment:6
-# make sure target libpng-config is used, options taken from rsxs-0.9/acinclude.m4
-KODI_CONF_ENV += \
-	ac_cv_type__Bool=yes \
-	jm_cv_func_gettimeofday_clobber=no \
-	mac_cv_pkg_png=$(STAGING_DIR)/usr/bin/libpng-config \
-	mac_cv_pkg_cppflags="`$(STAGING_DIR)/usr/bin/libpng-config --I_opts --cppflags`" \
-	mac_cv_pkg_cxxflags="`$(STAGING_DIR)/usr/bin/libpng-config --ccopts`" \
-	mac_cv_pkg_ldflags="`$(STAGING_DIR)/usr/bin/libpng-config --L_opts --R_opts`" \
-	mac_cv_pkg_libs="`$(STAGING_DIR)/usr/bin/libpng-config --libs`"
-KODI_CONF_OPTS += --enable-rsxs
 else
-KODI_CONF_OPTS += --disable-rsxs
-endif
-else
-KODI_CONF_OPTS += --disable-gl --disable-rsxs --disable-x11
+KODI_CONF_OPTS += --disable-gl --disable-x11
 ifeq ($(BR2_PACKAGE_KODI_EGL_GLES),y)
 KODI_DEPENDENCIES += libegl libgles
 KODI_CONF_ENV += CXXFLAGS="$(TARGET_CXXFLAGS) `$(PKG_CONFIG_HOST_BINARY) --cflags --libs egl`"
@@ -224,7 +209,6 @@ endef
 KODI_PRE_CONFIGURE_HOOKS += KODI_BOOTSTRAP
 
 define KODI_CLEAN_UNUSED_ADDONS
-	rm -Rf $(TARGET_DIR)/usr/share/kodi/addons/screensaver.rsxs.plasma
 	rm -Rf $(TARGET_DIR)/usr/share/kodi/addons/visualization.milkdrop
 	rm -Rf $(TARGET_DIR)/usr/share/kodi/addons/visualization.projectm
 	rm -Rf $(TARGET_DIR)/usr/share/kodi/addons/visualization.itunes
