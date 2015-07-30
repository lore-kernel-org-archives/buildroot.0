From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 30 Jul 2015 10:23:21 +0200
Subject: [Buildroot] [git commit branch/next]
	package/kodi-visualisation-shadertoy: new package
Message-ID: <20150808105651.C13A47FE8F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=287273969ead7c4bed874288686301b0a6b56b3e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

[Thomas:
   - do not pass -DCMAKE_MODULE_PATH, no longer needed.]

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...GLES2-also-search-for-egl-with-pkg-config.patch |   44 ++++++++++++++++++++
 package/kodi-visualisation-shadertoy/Config.in     |    6 +++
 .../kodi-visualisation-shadertoy.mk                |   13 ++++++
 package/kodi/Config.in                             |    4 ++
 4 files changed, 67 insertions(+), 0 deletions(-)

diff --git a/package/kodi-visualisation-shadertoy/0001-FindOpenGLES2-also-search-for-egl-with-pkg-config.patch b/package/kodi-visualisation-shadertoy/0001-FindOpenGLES2-also-search-for-egl-with-pkg-config.patch
new file mode 100644
index 0000000..f40c173
--- /dev/null
+++ b/package/kodi-visualisation-shadertoy/0001-FindOpenGLES2-also-search-for-egl-with-pkg-config.patch
@@ -0,0 +1,44 @@
+From 9c428c3c9f120a11468f98546bcc754d2c3302af Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Date: Thu, 30 Jul 2015 10:02:15 +0200
+Subject: [PATCH] FindOpenGLES2: also search for egl with pkg-config
+
+The non-pkg-config path looks for both EGL *and* OpenGL ES, but not
+the pkg-config path, which might lead to missing libraries/headers if
+egl.pc has more header paths or libraries than glesv2.pc.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ CMakeLists.txt      | 2 +-
+ FindOpenGLES2.cmake | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 8b084cf..81bbe27 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -24,7 +24,7 @@ else()
+   endif()
+ endif()
+ 
+-include_directories(${OpenGL_INCLUDE_DIR}
++include_directories(${OpenGL_INCLUDE_DIR} ${OpenGLES2_INCLUDE_DIRS}
+                     ${GLEW_INCLUDE_DIR}
+                     ${KODI_INCLUDE_DIR}
+                     ${PROJECT_SOURCE_DIR}/lib/kissfft
+diff --git a/FindOpenGLES2.cmake b/FindOpenGLES2.cmake
+index e1b7d21..2a9ce0d 100644
+--- a/FindOpenGLES2.cmake
++++ b/FindOpenGLES2.cmake
+@@ -7,7 +7,7 @@
+ 
+ find_package(PkgConfig)
+ if(PKG_CONFIG_FOUND)
+-  pkg_check_modules(OpenGLES2 glesv2)
++  pkg_check_modules(OpenGLES2 glesv2 egl)
+ endif(PKG_CONFIG_FOUND)
+ 
+ if(NOT OPENGLES2_FOUND)
+-- 
+2.5.0
+
diff --git a/package/kodi-visualisation-shadertoy/Config.in b/package/kodi-visualisation-shadertoy/Config.in
new file mode 100644
index 0000000..10a6e55
--- /dev/null
+++ b/package/kodi-visualisation-shadertoy/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_KODI_VISUALISATION_SHADERTOY
+	bool "kodi-visualisation-shadertoy"
+	help
+	  Shadertoy visualiser for Kodi
+
+	  https://github.com/notspiff/visualization.shadertoy
diff --git a/package/kodi-visualisation-shadertoy/kodi-visualisation-shadertoy.mk b/package/kodi-visualisation-shadertoy/kodi-visualisation-shadertoy.mk
new file mode 100644
index 0000000..1b11f79
--- /dev/null
+++ b/package/kodi-visualisation-shadertoy/kodi-visualisation-shadertoy.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# kodi-visualisation-shadertoy
+#
+################################################################################
+
+KODI_VISUALISATION_SHADERTOY_VERSION = a4eaaad4ab7204a30224f2c6952f7a7035ca1c38
+KODI_VISUALISATION_SHADERTOY_SITE = $(call github,notspiff,visualization.shadertoy,$(KODI_VISUALISATION_SHADERTOY_VERSION))
+KODI_VISUALISATION_SHADERTOY_LICENSE = GPLv2+
+KODI_VISUALISATION_SHADERTOY_LICENSE_FILES = src/main.cpp
+KODI_VISUALISATION_SHADERTOY_DEPENDENCIES = kodi
+
+$(eval $(cmake-package))
diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index 758d47f..fd0a53b 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -296,4 +296,8 @@ menu "Screensavers"
 	source "package/kodi-screensaver-stars/Config.in"
 endmenu
 
+menu "Visualisations"
+	source "package/kodi-visualisation-shadertoy/Config.in"
+endmenu
+
 endif # BR2_PACKAGE_KODI
