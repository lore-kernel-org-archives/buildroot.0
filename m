From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Thu, 23 Jan 2020 01:04:02 +0100
Subject: [Buildroot] [git commit] package/kodi-visualisation-shadertoy: bump
 version to 1.2.3-Leia
Message-ID: <20200122235421.D87C083874@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7f0d48c881ae951d1d122c7ae816d0ad0e012009
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Added dependency to glm.
Although glm depends on BR2_INSTALL_LIBSTDCPP this dependency was not
added because Kodi itself already depends on C++.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 ...GLES2-also-search-for-egl-with-pkg-config.patch | 44 ----------------------
 package/kodi-visualisation-shadertoy/Config.in     |  1 +
 .../kodi-visualisation-shadertoy.hash              |  2 +-
 .../kodi-visualisation-shadertoy.mk                |  6 +--
 4 files changed, 5 insertions(+), 48 deletions(-)

diff --git a/package/kodi-visualisation-shadertoy/0001-FindOpenGLES2-also-search-for-egl-with-pkg-config.patch b/package/kodi-visualisation-shadertoy/0001-FindOpenGLES2-also-search-for-egl-with-pkg-config.patch
deleted file mode 100644
index 8de96a6de3..0000000000
--- a/package/kodi-visualisation-shadertoy/0001-FindOpenGLES2-also-search-for-egl-with-pkg-config.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From 9c428c3c9f120a11468f98546bcc754d2c3302af Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Thu, 30 Jul 2015 10:02:15 +0200
-Subject: [PATCH] FindOpenGLES2: also search for egl with pkg-config
-
-The non-pkg-config path looks for both EGL *and* OpenGL ES, but not
-the pkg-config path, which might lead to missing libraries/headers if
-egl.pc has more header paths or libraries than glesv2.pc.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- CMakeLists.txt      | 2 +-
- FindOpenGLES2.cmake | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 8b084cf..81bbe27 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -35,7 +35,7 @@
-     endif()
-   endif()
- 
--  include_directories(${OpenGL_INCLUDE_DIR}
-+  include_directories(${OpenGL_INCLUDE_DIR} ${OpenGLES2_INCLUDE_DIRS}
-                       ${KODI_INCLUDE_DIR}
-                       ${p8-platform_INCLUDE_DIRS}
-                       ${PROJECT_SOURCE_DIR}/lib/kissfft
-diff --git a/FindOpenGLES2.cmake b/FindOpenGLES2.cmake
-index e1b7d21..2a9ce0d 100644
---- a/FindOpenGLES2.cmake
-+++ b/FindOpenGLES2.cmake
-@@ -7,7 +7,7 @@
- 
- find_package(PkgConfig)
- if(PKG_CONFIG_FOUND)
--  pkg_check_modules(OpenGLES2 glesv2)
-+  pkg_check_modules(OpenGLES2 glesv2 egl)
- endif(PKG_CONFIG_FOUND)
- 
- if(NOT OPENGLES2_FOUND)
--- 
-2.5.0
-
diff --git a/package/kodi-visualisation-shadertoy/Config.in b/package/kodi-visualisation-shadertoy/Config.in
index 3b981d0bf4..1fabba5ef5 100644
--- a/package/kodi-visualisation-shadertoy/Config.in
+++ b/package/kodi-visualisation-shadertoy/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_KODI_VISUALISATION_SHADERTOY
 	bool "kodi-visualisation-shadertoy"
+	select BR2_PACKAGE_GLM
 	select BR2_PACKAGE_LIBPLATFORM
 	help
 	  Shadertoy visualiser for Kodi
diff --git a/package/kodi-visualisation-shadertoy/kodi-visualisation-shadertoy.hash b/package/kodi-visualisation-shadertoy/kodi-visualisation-shadertoy.hash
index ae8c59ddb0..cf3e06daa7 100644
--- a/package/kodi-visualisation-shadertoy/kodi-visualisation-shadertoy.hash
+++ b/package/kodi-visualisation-shadertoy/kodi-visualisation-shadertoy.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 4456e88bc94bcb3e2481286b27926a1f6d85d6f857de31a46d50f44fead01abd  kodi-visualisation-shadertoy-1.1.5.tar.gz
+sha256 7b09de334ed3c96d2e2552e0594b8f76c11e36edfc10efd725851140132a4d4f  kodi-visualisation-shadertoy-1.2.3-Leia.tar.gz
diff --git a/package/kodi-visualisation-shadertoy/kodi-visualisation-shadertoy.mk b/package/kodi-visualisation-shadertoy/kodi-visualisation-shadertoy.mk
index a2b1b14d9f..add0f3ddea 100644
--- a/package/kodi-visualisation-shadertoy/kodi-visualisation-shadertoy.mk
+++ b/package/kodi-visualisation-shadertoy/kodi-visualisation-shadertoy.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-KODI_VISUALISATION_SHADERTOY_VERSION = 1.1.5
-KODI_VISUALISATION_SHADERTOY_SITE = $(call github,notspiff,visualization.shadertoy,v$(KODI_VISUALISATION_SHADERTOY_VERSION))
+KODI_VISUALISATION_SHADERTOY_VERSION = 1.2.3-Leia
+KODI_VISUALISATION_SHADERTOY_SITE = $(call github,xbmc,visualization.shadertoy,$(KODI_VISUALISATION_SHADERTOY_VERSION))
 KODI_VISUALISATION_SHADERTOY_LICENSE = GPL-2.0+
 KODI_VISUALISATION_SHADERTOY_LICENSE_FILES = src/main.cpp
-KODI_VISUALISATION_SHADERTOY_DEPENDENCIES = kodi libplatform
+KODI_VISUALISATION_SHADERTOY_DEPENDENCIES = glm kodi libplatform
 
 $(eval $(cmake-package))
