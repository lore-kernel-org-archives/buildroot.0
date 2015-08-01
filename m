From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat,  1 Aug 2015 15:31:35 +0200
Subject: [Buildroot] [PATCH 2/2] package/kodi-screensaver-rsxs: new package
In-Reply-To: <1438435895-1751-1-git-send-email-bernd.kuhls@t-online.de>
References: <1438435895-1751-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1438435895-1751-2-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also remove options BR2_PACKAGE_XLIB_XMU and BR2_PACKAGE_XLIB_XMU as
well, they are not needed and never worked anyway due to typos ;)

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 Config.in.legacy                                   |  7 +++++
 .../kodi-screensaver-rsxs/0001-cross-compile.patch | 34 ++++++++++++++++++++++
 package/kodi-screensaver-rsxs/Config.in            | 10 +++++++
 .../kodi-screensaver-rsxs/kodi-screensaver-rsxs.mk | 12 ++++++++
 package/kodi/Config.in                             | 12 +-------
 package/kodi/kodi.mk                               | 20 ++-----------
 6 files changed, 66 insertions(+), 29 deletions(-)
 create mode 100644 package/kodi-screensaver-rsxs/0001-cross-compile.patch
 create mode 100644 package/kodi-screensaver-rsxs/Config.in
 create mode 100644 package/kodi-screensaver-rsxs/kodi-screensaver-rsxs.mk

diff --git a/Config.in.legacy b/Config.in.legacy
index 2391e84..41e2f6f 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -107,6 +107,13 @@ endif
 ###############################################################################
 comment "Legacy options removed in 2015.08"
 
+config BR2_PACKAGE_KODI_RSXS
+	select BR2_LEGACY
+	bool "rsxs support in Kodi was moved to an addon"
+	select BR2_PACKAGE_KODI_SCREENSAVER_RSXS
+	help
+	  rsxs support in Kodi was moved to an addon
+
 config BR2_PACKAGE_KODI_GOOM
 	select BR2_LEGACY
 	bool "Goom support in Kodi was moved to an addon"
diff --git a/package/kodi-screensaver-rsxs/0001-cross-compile.patch b/package/kodi-screensaver-rsxs/0001-cross-compile.patch
new file mode 100644
index 0000000..0f03ec2
--- /dev/null
+++ b/package/kodi-screensaver-rsxs/0001-cross-compile.patch
@@ -0,0 +1,34 @@
+Fix cross-compilation
+
+Use the cross-compiler and not the host version.
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
index 0000000..4abebe5
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
+comment "rsxs needs an OpenGL backend"
+	depends on !BR2_PACKAGE_KODI_GL
diff --git a/package/kodi-screensaver-rsxs/kodi-screensaver-rsxs.mk b/package/kodi-screensaver-rsxs/kodi-screensaver-rsxs.mk
new file mode 100644
index 0000000..2df7683
--- /dev/null
+++ b/package/kodi-screensaver-rsxs/kodi-screensaver-rsxs.mk
@@ -0,0 +1,12 @@
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
+$(eval $(cmake-package))
diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index 04caec3..ac48b78 100644
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
@@ -284,6 +273,7 @@ menu "Screensavers"
 	source "package/kodi-screensaver-greynetic/Config.in"
 	source "package/kodi-screensaver-pingpong/Config.in"
 	source "package/kodi-screensaver-pyro/Config.in"
+	source "package/kodi-screensaver-rsxs/Config.in"
 	source "package/kodi-screensaver-stars/Config.in"
 endmenu
 
diff --git a/package/kodi/kodi.mk b/package/kodi/kodi.mk
index 1622f7b..80554e9 100644
--- a/package/kodi/kodi.mk
+++ b/package/kodi/kodi.mk
@@ -35,6 +35,7 @@ KODI_CONF_OPTS +=  \
 	--disable-openmax \
 	--disable-projectm \
 	--disable-pulse \
+	--disable-rsxs \
 	--disable-ssh \
 	--disable-vdpau \
 	--disable-vtbdecoder \
@@ -90,24 +91,8 @@ ifeq ($(BR2_PACKAGE_KODI_GL),y)
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
@@ -218,7 +203,6 @@ endef
 KODI_PRE_CONFIGURE_HOOKS += KODI_BOOTSTRAP
 
 define KODI_CLEAN_UNUSED_ADDONS
-	rm -Rf $(TARGET_DIR)/usr/share/kodi/addons/screensaver.rsxs.plasma
 	rm -Rf $(TARGET_DIR)/usr/share/kodi/addons/visualization.milkdrop
 	rm -Rf $(TARGET_DIR)/usr/share/kodi/addons/visualization.projectm
 	rm -Rf $(TARGET_DIR)/usr/share/kodi/addons/visualization.itunes
-- 
2.1.4
