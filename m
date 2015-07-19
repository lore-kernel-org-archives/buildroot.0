From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 19 Jul 2015 21:05:54 +0200
Subject: [Buildroot] [PATCH/RFC v3 49/50] package/kodi-visualisation-goom:
	new package
In-Reply-To: <1437332755-9764-1-git-send-email-bernd.kuhls@t-online.de>
References: <1437332755-9764-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1437332755-9764-50-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

---
Thanks to maxime for pointing me to http://code.bulix.org/29hru6-88679
to get the cross-compilation right

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 .../0001-cross-compile.patch                       |   23 ++++++++++++++++++++
 package/kodi-visualisation-goom/Config.in          |   10 +++++++++
 .../kodi-visualisation-goom.mk                     |   17 +++++++++++++++
 package/kodi/Config.in                             |   10 +--------
 package/kodi/kodi.mk                               |    7 +-----
 5 files changed, 52 insertions(+), 15 deletions(-)
 create mode 100644 package/kodi-visualisation-goom/0001-cross-compile.patch
 create mode 100644 package/kodi-visualisation-goom/Config.in
 create mode 100644 package/kodi-visualisation-goom/kodi-visualisation-goom.mk

diff --git a/package/kodi-visualisation-goom/0001-cross-compile.patch b/package/kodi-visualisation-goom/0001-cross-compile.patch
new file mode 100644
index 0000000..5be51c6
--- /dev/null
+++ b/package/kodi-visualisation-goom/0001-cross-compile.patch
@@ -0,0 +1,23 @@
+diff -uNr visualization.goom-fb5933ba5b2143d055cc7749dc60a82f6002b305.org/CMakeLists.txt visualization.goom-fb5933ba5b2143d055cc7749dc60a82f6002b305/CMakeLists.txt
+--- visualization.goom-fb5933ba5b2143d055cc7749dc60a82f6002b305.org/CMakeLists.txt	2014-10-31 11:34:21.000000000 +0100
++++ visualization.goom-fb5933ba5b2143d055cc7749dc60a82f6002b305/CMakeLists.txt	2015-07-19 19:49:43.340054342 +0200
+@@ -13,6 +13,10 @@
+                     ${KODI_INCLUDE_DIR}
+                     ${PROJECT_SOURCE_DIR}/lib/goom2k4-0/src)
+ 
++get_filename_component( COMPILER_FILENAME "${CMAKE_C_COMPILER}" NAME )
++string( REGEX REPLACE "-[^-]+$" ""
++        TOOLCHAIN_NAME "${COMPILER_FILENAME}" )
++
+ include(ExternalProject)
+ set(update_command "")
+ if(BOOTSTRAP_IN_TREE OR NOT DEFINED BOOTSTRAP_IN_TREE)
+@@ -20,7 +24,7 @@
+ endif()
+ externalproject_add(libgoom SOURCE_DIR ${PROJECT_SOURCE_DIR}/lib/goom2k4-0
+                     "${update_command}"
+-                    CONFIGURE_COMMAND ${PROJECT_SOURCE_DIR}/lib/goom2k4-0/configure --disable-shared --enable-static --with-pic --prefix=<INSTALL_DIR>
++                    CONFIGURE_COMMAND ${PROJECT_SOURCE_DIR}/lib/goom2k4-0/configure --disable-shared --enable-static --with-pic --prefix=<INSTALL_DIR> --host=${TOOLCHAIN_NAME}
+                     BUILD_COMMAND ${MAKE}
+                     INSTALL_COMMAND "")
+ 
diff --git a/package/kodi-visualisation-goom/Config.in b/package/kodi-visualisation-goom/Config.in
new file mode 100644
index 0000000..c1f1751
--- /dev/null
+++ b/package/kodi-visualisation-goom/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_KODI_VISUALISATION_GOOM
+	bool "kodi-visualisation-goom"
+	depends on BR2_PACKAGE_KODI_GL
+	help
+	  GOOM visualiser for Kodi
+
+	  https://github.com/notspiff/visualization.goom
+
+comment "goom needs an OpenGL backend"
+	depends on !BR2_PACKAGE_KODI_GL
diff --git a/package/kodi-visualisation-goom/kodi-visualisation-goom.mk b/package/kodi-visualisation-goom/kodi-visualisation-goom.mk
new file mode 100644
index 0000000..ee593e1
--- /dev/null
+++ b/package/kodi-visualisation-goom/kodi-visualisation-goom.mk
@@ -0,0 +1,17 @@
+################################################################################
+#
+# kodi-visualisation-goom
+#
+################################################################################
+
+KODI_VISUALISATION_GOOM_VERSION = fb5933ba5b2143d055cc7749dc60a82f6002b305
+KODI_VISUALISATION_GOOM_SITE = $(call github,notspiff,visualization.goom,$(KODI_VISUALISATION_GOOM_VERSION))
+KODI_VISUALISATION_GOOM_LICENSE = GPLv2+
+KODI_VISUALISATION_GOOM_LICENSE_FILES = COPYING
+
+KODI_VISUALISATION_GOOM_DEPENDENCIES = kodi
+
+KODI_VISUALISATION_GOOM_CONF_OPTS += \
+	-DCMAKE_MODULE_PATH=$(STAGING_DIR)/usr/lib/kodi
+
+$(eval $(cmake-package))
diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index 946694b..8538231 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -136,15 +136,6 @@ config BR2_PACKAGE_KODI_LIBBLURAY
 comment "libbluray support needs a toolchain w/ dynamic library"
 	depends on BR2_STATIC_LIBS
 
-config BR2_PACKAGE_KODI_GOOM
-	bool "goom screensaver"
-	depends on BR2_PACKAGE_KODI_GL
-	help
-	  Enable goom screensaver
-
-comment "goom needs an OpenGL backend"
-	depends on !BR2_PACKAGE_KODI_GL
-
 config BR2_PACKAGE_KODI_RSXS
 	bool "rsxs screensaver"
 	depends on BR2_PACKAGE_KODI_GL
@@ -299,6 +290,7 @@ menu "Screensavers"
 endmenu
 
 menu "Visualisations"
+	source "package/kodi-visualisation-goom/Config.in"
 	source "package/kodi-visualisation-shadertoy/Config.in"
 	source "package/kodi-visualisation-spectrum/Config.in"
 	source "package/kodi-visualisation-waveforhue/Config.in"
diff --git a/package/kodi/kodi.mk b/package/kodi/kodi.mk
index 44ecea9..67310ce 100644
--- a/package/kodi/kodi.mk
+++ b/package/kodi/kodi.mk
@@ -31,6 +31,7 @@ KODI_CONF_ENV = \
 
 KODI_CONF_OPTS +=  \
 	--with-ffmpeg=shared \
+	--disable-goom \
 	--disable-joystick \
 	--disable-openmax \
 	--disable-projectm \
@@ -117,12 +118,6 @@ KODI_CONF_OPTS += --disable-gles
 endif
 endif
 
-ifeq ($(BR2_PACKAGE_KODI_GOOM),y)
-KODI_CONF_OPTS += --enable-goom
-else
-KODI_CONF_OPTS += --disable-goom
-endif
-
 ifeq ($(BR2_PACKAGE_KODI_LIBUSB),y)
 KODI_DEPENDENCIES += libusb-compat
 KODI_CONF_OPTS += --enable-libusb
-- 
1.7.10.4
