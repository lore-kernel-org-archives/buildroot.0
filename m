From: Gleb Mazovetskiy <glex.spb@gmail.com>
Date: Sun,  3 Jan 2021 12:59:26 +0000
Subject: [Buildroot] [PATCH 1/1] package/solarus: Fix OpenGLES2 build
Message-ID: <20210103125927.1045995-1-glex.spb@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

1. Adds a patch that fixes OpenGLES2 build
   https://gitlab.com/solarus-games/solarus/-/merge_requests/1364

2. Updates Config.in and solarus.mk to support OpenGLES2

Signed-off-by: Gleb Mazovetskiy <glex.spb@gmail.com>
---
 ...0001-Add-a-basic-FindOpenGLES2.cmake.patch | 48 +++++++++++++++++++
 package/solarus/Config.in                     |  2 +-
 package/solarus/solarus.mk                    |  8 +++-
 3 files changed, 56 insertions(+), 2 deletions(-)
 create mode 100644 package/solarus/0001-Add-a-basic-FindOpenGLES2.cmake.patch

diff --git a/package/solarus/0001-Add-a-basic-FindOpenGLES2.cmake.patch b/package/solarus/0001-Add-a-basic-FindOpenGLES2.cmake.patch
new file mode 100644
index 0000000000..59bf9e8cf4
--- /dev/null
+++ b/package/solarus/0001-Add-a-basic-FindOpenGLES2.cmake.patch
@@ -0,0 +1,48 @@
+From 2bf0e98f17d92fd86ee61be179e3cebe93f75ea7 Mon Sep 17 00:00:00 2001
+From: Gleb Mazovetskiy <glex.spb@gmail.com>
+Date: Sun, 3 Jan 2021 12:38:13 +0000
+Subject: [PATCH] Add a basic FindOpenGLES2.cmake
+
+Fixes #1324
+---
+ cmake/modules/FindOpenGLES2.cmake | 28 ++++++++++++++++++++++++++++
+ 1 file changed, 28 insertions(+)
+ create mode 100644 cmake/modules/FindOpenGLES2.cmake
+
+diff --git a/cmake/modules/FindOpenGLES2.cmake b/cmake/modules/FindOpenGLES2.cmake
+new file mode 100644
+index 000000000..70fd5e6f0
+--- /dev/null
++++ b/cmake/modules/FindOpenGLES2.cmake
+@@ -0,0 +1,28 @@
++# Try to find OpenGLES2. Once done this will define:
++#     OPENGLES2_FOUND
++#     OPENGLES2_INCLUDE_DIRS
++#     OPENGLES2_LIBRARIES
++#     OPENGLES2_DEFINITIONS
++
++find_package(PkgConfig QUIET)
++
++pkg_check_modules(PC_OPENGLES2 glesv2)
++
++if (PC_OPENGLES2_FOUND)
++    set(OPENGLES2_DEFINITIONS ${PC_OPENGLES2_CFLAGS_OTHER})
++endif ()
++
++find_path(OPENGLES2_INCLUDE_DIRS NAMES GLES2/gl2.h
++    HINTS ${PC_OPENGLES2_INCLUDEDIR} ${PC_OPENGLES2_INCLUDE_DIRS}
++)
++
++set(OPENGLES2_NAMES ${OPENGLES2_NAMES} glesv2 GLESv2)
++find_library(OPENGLES2_LIBRARIES NAMES ${OPENGLES2_NAMES}
++    HINTS ${PC_OPENGLES2_LIBDIR} ${PC_OPENGLES2_LIBRARY_DIRS}
++)
++
++include(FindPackageHandleStandardArgs)
++find_package_handle_standard_args(OpenGLES2 REQUIRED_VARS OPENGLES2_INCLUDE_DIRS OPENGLES2_LIBRARIES
++                                  FOUND_VAR OPENGLES2_FOUND)
++
++mark_as_advanced(OPENGLES2_INCLUDE_DIRS OPENGLES2_LIBRARIES)
+-- 
+2.27.0
+
diff --git a/package/solarus/Config.in b/package/solarus/Config.in
index b0f4121f6d..bcfa640890 100644
--- a/package/solarus/Config.in
+++ b/package/solarus/Config.in
@@ -6,7 +6,7 @@ config BR2_PACKAGE_SOLARUS
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # openal
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # openal
 	depends on !BR2_STATIC_LIBS # SDL2
-	depends on BR2_PACKAGE_HAS_LIBGL
+	depends on BR2_PACKAGE_HAS_LIBGL || BR2_PACKAGE_HAS_LIBGLES
 	select BR2_PACKAGE_GLM
 	select BR2_PACKAGE_LIBMODPLUG
 	select BR2_PACKAGE_LIBOGG
diff --git a/package/solarus/solarus.mk b/package/solarus/solarus.mk
index 92e849ef02..57f8607f98 100644
--- a/package/solarus/solarus.mk
+++ b/package/solarus/solarus.mk
@@ -16,7 +16,7 @@ SOLARUS_LICENSE_FILES = license.txt
 # Install libsolarus.so
 SOLARUS_INSTALL_STAGING = YES
 
-SOLARUS_DEPENDENCIES = glm libgl libmodplug libogg libvorbis openal physfs \
+SOLARUS_DEPENDENCIES = glm libmodplug libogg libvorbis openal physfs \
 	sdl2 sdl2_image sdl2_ttf
 
 # Disable launcher GUI (requires Qt5)
@@ -24,6 +24,12 @@ SOLARUS_CONF_OPTS = \
 	-DSOLARUS_GUI=OFF \
 	-DSOLARUS_TESTS=OFF
 
+ifeq ($(BR2_PACKAGE_HAS_LIBGL),y)
+SOLARUS_DEPENDENCIES += libgl
+else
+SOLARUS_DEPENDENCIES += libgles
+endif
+
 ifeq ($(BR2_PACKAGE_LUAJIT),y)
 SOLARUS_CONF_OPTS += -DSOLARUS_USE_LUAJIT=ON
 SOLARUS_DEPENDENCIES += luajit
-- 
2.27.0
