From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon,  4 Nov 2019 21:14:19 +0100
Subject: [Buildroot] [PATCH v7 18/18] package/kodi-visualisation-*: mass
 version bump
In-Reply-To: <20191104201419.2757-1-bernd.kuhls@t-online.de>
References: <20191104201419.2757-1-bernd.kuhls@t-online.de>
Message-ID: <20191104201419.2757-19-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Visualisation repos were moved to the xbmc project:
https://github.com/xbmc/repo-binary-addons/commit/38166cbdfa18d361e5b6009296a78c69a1172879
https://github.com/xbmc/repo-binary-addons/commit/57b8ed5fb9b5f0368738260b762cc0bab1147172

kodi-visualisation-goom:
- removed patch 0001, not needed anymore
- added patch to fix static build

Rebased
package/kodi-visualisation-shadertoy/0001-FindOpenGLES2-also-search-for-egl-with-pkg-config.patch

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 .../kodi-visualisation-fishbmc.hash           |  2 +-
 .../kodi-visualisation-fishbmc.mk             |  4 +-
 .../0001-cross-compile.patch                  | 32 --------------
 .../0001-lib-goom2k4-0-fix-static-build.patch | 32 ++++++++++++++
 .../kodi-visualisation-goom.hash              |  2 +-
 .../kodi-visualisation-goom.mk                |  4 +-
 ...-also-search-for-egl-with-pkg-config.patch | 44 -------------------
 .../kodi-visualisation-shadertoy.hash         |  2 +-
 .../kodi-visualisation-shadertoy.mk           |  4 +-
 .../kodi-visualisation-spectrum.hash          |  2 +-
 .../kodi-visualisation-spectrum.mk            |  4 +-
 .../kodi-visualisation-waveform.hash          |  2 +-
 .../kodi-visualisation-waveform.mk            |  4 +-
 13 files changed, 47 insertions(+), 91 deletions(-)
 delete mode 100644 package/kodi-visualisation-goom/0001-cross-compile.patch
 create mode 100644 package/kodi-visualisation-goom/0001-lib-goom2k4-0-fix-static-build.patch
 delete mode 100644 package/kodi-visualisation-shadertoy/0001-FindOpenGLES2-also-search-for-egl-with-pkg-config.patch

diff --git a/package/kodi-visualisation-fishbmc/kodi-visualisation-fishbmc.hash b/package/kodi-visualisation-fishbmc/kodi-visualisation-fishbmc.hash
index 21d80a31cb..cd4734eaab 100644
--- a/package/kodi-visualisation-fishbmc/kodi-visualisation-fishbmc.hash
+++ b/package/kodi-visualisation-fishbmc/kodi-visualisation-fishbmc.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 cf42a21978578cb5ecb10c20fe09791183d8ef2998ff9d956a84142a7dda8f72  kodi-visualisation-fishbmc-4.1.0.tar.gz
+sha256 8142fe4a32c0c113945c5fc9745e54639ca73308371d292e3422730bfad1d064  kodi-visualisation-fishbmc-5.1.2-Leia.tar.gz
diff --git a/package/kodi-visualisation-fishbmc/kodi-visualisation-fishbmc.mk b/package/kodi-visualisation-fishbmc/kodi-visualisation-fishbmc.mk
index 8360660ef4..a89c559d26 100644
--- a/package/kodi-visualisation-fishbmc/kodi-visualisation-fishbmc.mk
+++ b/package/kodi-visualisation-fishbmc/kodi-visualisation-fishbmc.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-KODI_VISUALISATION_FISHBMC_VERSION = 4.1.0
-KODI_VISUALISATION_FISHBMC_SITE = $(call github,notspiff,visualization.fishbmc,v$(KODI_VISUALISATION_FISHBMC_VERSION))
+KODI_VISUALISATION_FISHBMC_VERSION = 5.1.2-Leia
+KODI_VISUALISATION_FISHBMC_SITE = $(call github,xbmc,visualization.fishbmc,$(KODI_VISUALISATION_FISHBMC_VERSION))
 KODI_VISUALISATION_FISHBMC_LICENSE = GPL-2.0+
 KODI_VISUALISATION_FISHBMC_LICENSE_FILES = visualization.fishbmc/LICENSE
 KODI_VISUALISATION_FISHBMC_DEPENDENCIES = kodi
diff --git a/package/kodi-visualisation-goom/0001-cross-compile.patch b/package/kodi-visualisation-goom/0001-cross-compile.patch
deleted file mode 100644
index 8dd0fe9109..0000000000
--- a/package/kodi-visualisation-goom/0001-cross-compile.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-Fix cross-compilation
-
-Use the cross-compiler and not the host version.
-
-Patch sent upstream:
-https://github.com/notspiff/visualization.goom/pull/4
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
-
-diff -uNr visualization.goom-fb5933ba5b2143d055cc7749dc60a82f6002b305.org/CMakeLists.txt visualization.goom-fb5933ba5b2143d055cc7749dc60a82f6002b305/CMakeLists.txt
---- visualization.goom-fb5933ba5b2143d055cc7749dc60a82f6002b305.org/CMakeLists.txt	2014-10-31 11:34:21.000000000 +0100
-+++ visualization.goom-fb5933ba5b2143d055cc7749dc60a82f6002b305/CMakeLists.txt	2015-07-19 19:49:43.340054342 +0200
-@@ -13,6 +13,10 @@
-                     ${KODI_INCLUDE_DIR}
-                     ${PROJECT_SOURCE_DIR}/lib/goom2k4-0/src)
- 
-+get_filename_component( COMPILER_FILENAME "${CMAKE_C_COMPILER}" NAME )
-+string( REGEX REPLACE "-[^-]+$" ""
-+        TOOLCHAIN_NAME "${COMPILER_FILENAME}" )
-+
- include(ExternalProject)
- set(update_command "")
- if(BOOTSTRAP_IN_TREE OR NOT DEFINED BOOTSTRAP_IN_TREE)
-@@ -20,7 +24,7 @@
- endif()
- externalproject_add(libgoom SOURCE_DIR ${PROJECT_SOURCE_DIR}/lib/goom2k4-0
-                     "${update_command}"
--                    CONFIGURE_COMMAND ${PROJECT_SOURCE_DIR}/lib/goom2k4-0/configure --disable-shared --enable-static --with-pic --prefix=<INSTALL_DIR>
-+                    CONFIGURE_COMMAND ${PROJECT_SOURCE_DIR}/lib/goom2k4-0/configure --disable-shared --enable-static --with-pic --prefix=<INSTALL_DIR> --host=${TOOLCHAIN_NAME}
-                     BUILD_COMMAND ${MAKE}
-                     INSTALL_COMMAND "")
- 
diff --git a/package/kodi-visualisation-goom/0001-lib-goom2k4-0-fix-static-build.patch b/package/kodi-visualisation-goom/0001-lib-goom2k4-0-fix-static-build.patch
new file mode 100644
index 0000000000..c6fa30fbca
--- /dev/null
+++ b/package/kodi-visualisation-goom/0001-lib-goom2k4-0-fix-static-build.patch
@@ -0,0 +1,32 @@
+From 84ed3a0bee5f89f2ee5f84a07fb5de4ed5d84c92 Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd.kuhls@t-online.de>
+Date: Sun, 3 Nov 2019 00:07:26 +0100
+Subject: [PATCH] lib/goom2k4-0: fix static build
+
+Fixes build error:
+
+[100%] Linking CXX shared library visualization.goom.so
+/home/buildroot/br8/output/host/opt/ext-toolchain/bin/../lib/gcc/x86_64-buildroot-linux-uclibc/7.4.0/../../../../x86_64-buildroot-linux-uclibc/bin/ld:
+ lib/goom2k4-0/libgoom.a(goom_core.c.o):
+ relocation R_X86_64_32S against `.rodata' can not be used when making
+ a shared object; recompile with -fPIC
+
+Patch sent upstream as PR 19.
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ lib/goom2k4-0/CMakeLists.txt | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/lib/goom2k4-0/CMakeLists.txt b/lib/goom2k4-0/CMakeLists.txt
+index e9b1fc7..304805e 100644
+--- a/lib/goom2k4-0/CMakeLists.txt
++++ b/lib/goom2k4-0/CMakeLists.txt
+@@ -51,3 +51,4 @@ set(GOOM_HEADERS src/goom.h
+                  src/xmmx.h)
+ 
+ add_library(goom STATIC ${GOOM_SOURCES} ${GOOM_HEADERS})
++set_property(TARGET goom PROPERTY POSITION_INDEPENDENT_CODE ON)
+-- 
+2.20.1
+
diff --git a/package/kodi-visualisation-goom/kodi-visualisation-goom.hash b/package/kodi-visualisation-goom/kodi-visualisation-goom.hash
index fa5fbf6c37..6121d973bd 100644
--- a/package/kodi-visualisation-goom/kodi-visualisation-goom.hash
+++ b/package/kodi-visualisation-goom/kodi-visualisation-goom.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 501b8b1d5bd174ec71d57894293ae5eb0c1f41c3b725ab5e7b5a1c5eeea77a7f  kodi-visualisation-goom-54da35870930acd1a3a36195dd2c1498ac336b90.tar.gz
+sha256 8c7e113254d36203a8bb62247f4e2d9ee6b0cb3fb9e20993c7673eaae51625bf  kodi-visualisation-goom-abd131a7a5780dee532da9bb1a6c192fbd3f6b89.tar.gz
diff --git a/package/kodi-visualisation-goom/kodi-visualisation-goom.mk b/package/kodi-visualisation-goom/kodi-visualisation-goom.mk
index a7503a97d8..4c8bcfef5d 100644
--- a/package/kodi-visualisation-goom/kodi-visualisation-goom.mk
+++ b/package/kodi-visualisation-goom/kodi-visualisation-goom.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-KODI_VISUALISATION_GOOM_VERSION = 54da35870930acd1a3a36195dd2c1498ac336b90
-KODI_VISUALISATION_GOOM_SITE = $(call github,notspiff,visualization.goom,$(KODI_VISUALISATION_GOOM_VERSION))
+KODI_VISUALISATION_GOOM_VERSION = abd131a7a5780dee532da9bb1a6c192fbd3f6b89
+KODI_VISUALISATION_GOOM_SITE = $(call github,xbmc,visualization.goom,$(KODI_VISUALISATION_GOOM_VERSION))
 KODI_VISUALISATION_GOOM_LICENSE = GPL-2.0+
 KODI_VISUALISATION_GOOM_LICENSE_FILES = src/Main.cpp
 
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
diff --git a/package/kodi-visualisation-shadertoy/kodi-visualisation-shadertoy.hash b/package/kodi-visualisation-shadertoy/kodi-visualisation-shadertoy.hash
index ae8c59ddb0..cf3e06daa7 100644
--- a/package/kodi-visualisation-shadertoy/kodi-visualisation-shadertoy.hash
+++ b/package/kodi-visualisation-shadertoy/kodi-visualisation-shadertoy.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 4456e88bc94bcb3e2481286b27926a1f6d85d6f857de31a46d50f44fead01abd  kodi-visualisation-shadertoy-1.1.5.tar.gz
+sha256 7b09de334ed3c96d2e2552e0594b8f76c11e36edfc10efd725851140132a4d4f  kodi-visualisation-shadertoy-1.2.3-Leia.tar.gz
diff --git a/package/kodi-visualisation-shadertoy/kodi-visualisation-shadertoy.mk b/package/kodi-visualisation-shadertoy/kodi-visualisation-shadertoy.mk
index a2b1b14d9f..b928e64d9b 100644
--- a/package/kodi-visualisation-shadertoy/kodi-visualisation-shadertoy.mk
+++ b/package/kodi-visualisation-shadertoy/kodi-visualisation-shadertoy.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-KODI_VISUALISATION_SHADERTOY_VERSION = 1.1.5
-KODI_VISUALISATION_SHADERTOY_SITE = $(call github,notspiff,visualization.shadertoy,v$(KODI_VISUALISATION_SHADERTOY_VERSION))
+KODI_VISUALISATION_SHADERTOY_VERSION = 1.2.3-Leia
+KODI_VISUALISATION_SHADERTOY_SITE = $(call github,xbmc,visualization.shadertoy,$(KODI_VISUALISATION_SHADERTOY_VERSION))
 KODI_VISUALISATION_SHADERTOY_LICENSE = GPL-2.0+
 KODI_VISUALISATION_SHADERTOY_LICENSE_FILES = src/main.cpp
 KODI_VISUALISATION_SHADERTOY_DEPENDENCIES = kodi libplatform
diff --git a/package/kodi-visualisation-spectrum/kodi-visualisation-spectrum.hash b/package/kodi-visualisation-spectrum/kodi-visualisation-spectrum.hash
index 2d9ab0f3cf..7badbfdf80 100644
--- a/package/kodi-visualisation-spectrum/kodi-visualisation-spectrum.hash
+++ b/package/kodi-visualisation-spectrum/kodi-visualisation-spectrum.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 7ee78ff5c24e3f81b6e2a9208237f34667cb9faa5453d7bdb900ab65245973f1  kodi-visualisation-spectrum-1.1.1.tar.gz
+sha256 0c08c318fc3781560e2a112d17c347cd69aba3e5388472009eef774555760aeb  kodi-visualisation-spectrum-2.0.4-Leia.tar.gz
diff --git a/package/kodi-visualisation-spectrum/kodi-visualisation-spectrum.mk b/package/kodi-visualisation-spectrum/kodi-visualisation-spectrum.mk
index 016f405e40..26172fefd3 100644
--- a/package/kodi-visualisation-spectrum/kodi-visualisation-spectrum.mk
+++ b/package/kodi-visualisation-spectrum/kodi-visualisation-spectrum.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-KODI_VISUALISATION_SPECTRUM_VERSION = 1.1.1
-KODI_VISUALISATION_SPECTRUM_SITE = $(call github,notspiff,visualization.spectrum,v$(KODI_VISUALISATION_SPECTRUM_VERSION))
+KODI_VISUALISATION_SPECTRUM_VERSION = 2.0.4-Leia
+KODI_VISUALISATION_SPECTRUM_SITE = $(call github,xbmc,visualization.spectrum,v$(KODI_VISUALISATION_SPECTRUM_VERSION))
 KODI_VISUALISATION_SPECTRUM_LICENSE = GPL-2.0+
 KODI_VISUALISATION_SPECTRUM_LICENSE_FILES = COPYING
 KODI_VISUALISATION_SPECTRUM_DEPENDENCIES = kodi
diff --git a/package/kodi-visualisation-waveform/kodi-visualisation-waveform.hash b/package/kodi-visualisation-waveform/kodi-visualisation-waveform.hash
index 271dc4a9e0..a3b8d19ca6 100644
--- a/package/kodi-visualisation-waveform/kodi-visualisation-waveform.hash
+++ b/package/kodi-visualisation-waveform/kodi-visualisation-waveform.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 cf10d8d78cb2bde4a0a21bb7e467445617b46593c093ef05f336f95a048f2d54  kodi-visualisation-waveform-1.1.0.tar.gz
+sha256 d5d92688e44d2c05159267bfffe9a14b8e8073065635ecde7f4f0c570365f7d3  kodi-visualisation-waveform-3.1.0-Leia.tar.gz
diff --git a/package/kodi-visualisation-waveform/kodi-visualisation-waveform.mk b/package/kodi-visualisation-waveform/kodi-visualisation-waveform.mk
index 13a621edb0..190daa2e2d 100644
--- a/package/kodi-visualisation-waveform/kodi-visualisation-waveform.mk
+++ b/package/kodi-visualisation-waveform/kodi-visualisation-waveform.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-KODI_VISUALISATION_WAVEFORM_VERSION = 1.1.0
-KODI_VISUALISATION_WAVEFORM_SITE = $(call github,notspiff,visualization.waveform,v$(KODI_VISUALISATION_WAVEFORM_VERSION))
+KODI_VISUALISATION_WAVEFORM_VERSION = 3.1.0-Leia
+KODI_VISUALISATION_WAVEFORM_SITE = $(call github,xbmc,visualization.waveform,$(KODI_VISUALISATION_WAVEFORM_VERSION))
 KODI_VISUALISATION_WAVEFORM_LICENSE = GPL-2.0+
 KODI_VISUALISATION_WAVEFORM_LICENSE_FILES = COPYING
 KODI_VISUALISATION_WAVEFORM_DEPENDENCIES = kodi
-- 
2.20.1
