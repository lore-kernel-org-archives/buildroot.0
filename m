From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 19 Jul 2015 21:05:55 +0200
Subject: [Buildroot] [PATCH/RFC v3 50/50] package/kodi-screensaver-rsxs: new
	package
In-Reply-To: <1437332755-9764-1-git-send-email-bernd.kuhls@t-online.de>
References: <1437332755-9764-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1437332755-9764-51-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 .../kodi-screensaver-rsxs/0001-cross-compile.patch |   28 ++++++++++++++++++++
 package/kodi-screensaver-rsxs/Config.in            |    6 +++++
 .../kodi-screensaver-rsxs/kodi-screensaver-rsxs.mk |   15 +++++++++++
 package/kodi/Config.in                             |   12 +--------
 package/kodi/kodi.mk                               |   20 ++------------
 5 files changed, 52 insertions(+), 29 deletions(-)
 create mode 100644 package/kodi-screensaver-rsxs/0001-cross-compile.patch
 create mode 100644 package/kodi-screensaver-rsxs/Config.in
 create mode 100644 package/kodi-screensaver-rsxs/kodi-screensaver-rsxs.mk

diff --git a/package/kodi-screensaver-rsxs/0001-cross-compile.patch b/package/kodi-screensaver-rsxs/0001-cross-compile.patch
new file mode 100644
index 0000000..8b16298
--- /dev/null
+++ b/package/kodi-screensaver-rsxs/0001-cross-compile.patch
@@ -0,0 +1,28 @@
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
index 0000000..810f785
--- /dev/null
+++ b/package/kodi-screensaver-rsxs/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_KODI_SCREENSAVER_RSXS
+	bool "kodi-screensaver-rsxs"
+	help
+	  RSXS screensaver add-ons for Kodi
+
+	  https://github.com/notspiff/screensavers.rsxs
diff --git a/package/kodi-screensaver-rsxs/kodi-screensaver-rsxs.mk b/package/kodi-screensaver-rsxs/kodi-screensaver-rsxs.mk
new file mode 100644
index 0000000..b36e83d
--- /dev/null
+++ b/package/kodi-screensaver-rsxs/kodi-screensaver-rsxs.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# kodi-screensaver-rsxs
+#
+################################################################################
+
+KODI_SCREENSAVER_RSXS_VERSION = 195e0ec3fbbcb2ee2012cd560e42d05167f0f259
+KODI_SCREENSAVER_RSXS_SITE = $(call github,notspiff,screensavers.rsxs,$(KODI_SCREENSAVER_RSXS_VERSION))
+
+KODI_SCREENSAVER_RSXS_DEPENDENCIES = kodi
+
+KODI_SCREENSAVER_RSXS_CONF_OPTS += \
+	-DCMAKE_MODULE_PATH=$(STAGING_DIR)/usr/lib/kodi
+
+$(eval $(cmake-package))
diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index 8538231..98fc126 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -81,9 +81,7 @@ menuconfig BR2_PACKAGE_KODI
 	select BR2_PACKAGE_TIFF
 	select BR2_PACKAGE_TINYXML
 	select BR2_PACKAGE_LIBDRM if BR2_PACKAGE_KODI_GL
-	select BR2_PACKAGE_XLIB_XMU if BR2_PACKAGE_KODI_GL # needed by rsxs screensaver
 	select BR2_PACKAGE_XLIB_XRANDR if BR2_PACKAGE_KODI_GL
-	select BR2_PACKAGE_XLIB_XT if BR2_PACKAGE_KODI_GL # needed by rsxs screensaver
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
@@ -286,6 +275,7 @@ menu "Screensavers"
 	source "package/kodi-screensaver-greynetic/Config.in"
 	source "package/kodi-screensaver-pingpong/Config.in"
 	source "package/kodi-screensaver-pyro/Config.in"
+	source "package/kodi-screensaver-rsxs/Config.in"
 	source "package/kodi-screensaver-stars/Config.in"
 endmenu
 
diff --git a/package/kodi/kodi.mk b/package/kodi/kodi.mk
index 67310ce..36b580c 100644
--- a/package/kodi/kodi.mk
+++ b/package/kodi/kodi.mk
@@ -36,6 +36,7 @@ KODI_CONF_OPTS +=  \
 	--disable-openmax \
 	--disable-projectm \
 	--disable-pulse \
+	--disable-rsxs \
 	--disable-ssh \
 	--disable-vdpau \
 	--disable-vtbdecoder \
@@ -91,24 +92,8 @@ ifeq ($(BR2_PACKAGE_KODI_GL),y)
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
 KODI_CONF_ENV += CXXFLAGS="$(TARGET_CXXFLAGS) `$(PKG_CONFIG_HOST_BINARY) --cflags egl`"
@@ -225,7 +210,6 @@ endef
 KODI_POST_INSTALL_STAGING_HOOKS += KODI_FIX_CONFIG_CMAKE
 
 define KODI_CLEAN_UNUSED_ADDONS
-	rm -Rf $(TARGET_DIR)/usr/share/kodi/addons/screensaver.rsxs.plasma
 	rm -Rf $(TARGET_DIR)/usr/share/kodi/addons/visualization.milkdrop
 	rm -Rf $(TARGET_DIR)/usr/share/kodi/addons/visualization.projectm
 	rm -Rf $(TARGET_DIR)/usr/share/kodi/addons/visualization.itunes
-- 
1.7.10.4
