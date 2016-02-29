From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 29 Feb 2016 23:19:29 +0100
Subject: [Buildroot] [git commit] package/kodi-visualisation-goom: new
	package
Message-ID: <20160302202759.EC4D680203@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=56b80ece6318c35ca6115d751e24738612501988
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Config.in.legacy                                   |  7 +++++
 .../0001-cross-compile.patch                       | 32 ++++++++++++++++++++++
 package/kodi-visualisation-goom/Config.in          | 10 +++++++
 .../kodi-visualisation-goom.hash                   |  2 ++
 .../kodi-visualisation-goom.mk                     | 14 ++++++++++
 package/kodi/Config.in                             | 10 +------
 package/kodi/kodi.mk                               |  7 +----
 7 files changed, 67 insertions(+), 15 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 53baa84..3def8a1 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -145,6 +145,13 @@ endif
 ###############################################################################
 comment "Legacy options removed in 2016.05"
 
+config BR2_PACKAGE_KODI_GOOM
+	bool "Goom support in Kodi was moved to an addon"
+	select BR2_LEGACY
+	select BR2_PACKAGE_KODI_VISUALISATION_GOOM
+	help
+	  Goom support in Kodi was moved to an addon
+
 config BR2_PACKAGE_SYSTEMD_ALL_EXTRAS
 	bool "systemd all extras option has been removed"
 	select BR2_LEGACY
diff --git a/package/kodi-visualisation-goom/0001-cross-compile.patch b/package/kodi-visualisation-goom/0001-cross-compile.patch
new file mode 100644
index 0000000..8dd0fe9
--- /dev/null
+++ b/package/kodi-visualisation-goom/0001-cross-compile.patch
@@ -0,0 +1,32 @@
+Fix cross-compilation
+
+Use the cross-compiler and not the host version.
+
+Patch sent upstream:
+https://github.com/notspiff/visualization.goom/pull/4
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+
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
index 0000000..c5fa982
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
+comment "kodi-visualization-goom needs an OpenGL backend"
+	depends on !BR2_PACKAGE_KODI_GL
diff --git a/package/kodi-visualisation-goom/kodi-visualisation-goom.hash b/package/kodi-visualisation-goom/kodi-visualisation-goom.hash
new file mode 100644
index 0000000..8507c65
--- /dev/null
+++ b/package/kodi-visualisation-goom/kodi-visualisation-goom.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256 66a71a5c5a1c0016d7020fcc9941634ee465dab14644cdc96023ce0a28408338 kodi-visualisation-goom-16747b7dba9cbdcfdc8df44e849eaf09450fc86f.tar.gz
diff --git a/package/kodi-visualisation-goom/kodi-visualisation-goom.mk b/package/kodi-visualisation-goom/kodi-visualisation-goom.mk
new file mode 100644
index 0000000..89f2bab
--- /dev/null
+++ b/package/kodi-visualisation-goom/kodi-visualisation-goom.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# kodi-visualisation-goom
+#
+################################################################################
+
+KODI_VISUALISATION_GOOM_VERSION = 16747b7dba9cbdcfdc8df44e849eaf09450fc86f
+KODI_VISUALISATION_GOOM_SITE = $(call github,notspiff,visualization.goom,$(KODI_VISUALISATION_GOOM_VERSION))
+KODI_VISUALISATION_GOOM_LICENSE = GPLv2+
+KODI_VISUALISATION_GOOM_LICENSE_FILES = src/Main.cpp
+
+KODI_VISUALISATION_GOOM_DEPENDENCIES = kodi
+
+$(eval $(cmake-package))
diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index 7d28882..dcddade 100644
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
@@ -308,6 +299,7 @@ menu "Screensavers"
 endmenu
 
 menu "Visualisations"
+	source "package/kodi-visualisation-goom/Config.in"
 	source "package/kodi-visualisation-shadertoy/Config.in"
 	source "package/kodi-visualisation-spectrum/Config.in"
 	source "package/kodi-visualisation-waveforhue/Config.in"
diff --git a/package/kodi/kodi.mk b/package/kodi/kodi.mk
index bf3aa7a..94e59e7 100644
--- a/package/kodi/kodi.mk
+++ b/package/kodi/kodi.mk
@@ -30,6 +30,7 @@ KODI_CONF_ENV = \
 
 KODI_CONF_OPTS +=  \
 	--with-ffmpeg=shared \
+	--disable-goom \
 	--disable-joystick \
 	--disable-openmax \
 	--disable-projectm \
@@ -116,12 +117,6 @@ KODI_CONF_OPTS += --disable-gles
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
