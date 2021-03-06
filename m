From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 6 Mar 2021 21:37:08 +0100
Subject: [Buildroot] [git commit] package/kodi: bump version to 19.0-Matrix
Message-ID: <20210308072137.90B2C88918@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=148e695e37561fe45d4726cb68f6454464d17797
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Rebased patch 0001.

Removed patch 0002, not needed anymore due to use of system ffmpeg
package.

Added patch 0002 to fix build with gcc-4.9, gcc-4.8 stays broken.

Switch from python2 to python3, reworked dependencies.

Rework platform handling following upstream changes, only the choice
of a render system (OpenGL vs. OpenGLES) is needed now, for details
see upstream PR 18534. Add configure options to force detection of the
host version of wayland-scanner.

Use system ffmpeg instead of internal build.

Added dependency to spdlog, for reference see upstream PR 17498.

cpluff was removed upstream.

Add configure option to use host version of flatc.

Add configure option to disable tests, for reference see upstream PR
17489.

Added optional dependency to libudfread, for reference see upstream PR
17612.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../kodi-jsonschemabuilder.mk                      |   2 +-
 package/kodi-texturepacker/kodi-texturepacker.mk   |   2 +-
 ....cmake-use-CMAKE_FIND_ROOT_PATH-to-fix-cr.patch |  17 +--
 package/kodi/0002-Fix-crosscompiling-issues.patch  |  76 ------------
 ...2-linux-fix-drm-object-build-with-gcc-4.9.patch |  34 ++++++
 package/kodi/Config.in                             | 135 +++++++++------------
 package/kodi/kodi.hash                             |   3 +-
 package/kodi/kodi.mk                               |  96 ++++++++-------
 8 files changed, 152 insertions(+), 213 deletions(-)

diff --git a/package/kodi-jsonschemabuilder/kodi-jsonschemabuilder.mk b/package/kodi-jsonschemabuilder/kodi-jsonschemabuilder.mk
index 2c7f77d050..57062c3c8c 100644
--- a/package/kodi-jsonschemabuilder/kodi-jsonschemabuilder.mk
+++ b/package/kodi-jsonschemabuilder/kodi-jsonschemabuilder.mk
@@ -6,7 +6,7 @@
 
 # Not possible to directly refer to kodi variables, because of
 # first/second expansion trickery...
-KODI_JSONSCHEMABUILDER_VERSION = 18.9-Leia
+KODI_JSONSCHEMABUILDER_VERSION = 19.0-Matrix
 KODI_JSONSCHEMABUILDER_SITE = $(call github,xbmc,xbmc,$(KODI_JSONSCHEMABUILDER_VERSION))
 KODI_JSONSCHEMABUILDER_SOURCE = kodi-$(KODI_JSONSCHEMABUILDER_VERSION).tar.gz
 KODI_JSONSCHEMABUILDER_DL_SUBDIR = kodi
diff --git a/package/kodi-texturepacker/kodi-texturepacker.mk b/package/kodi-texturepacker/kodi-texturepacker.mk
index 7b13904ef4..fd43566379 100644
--- a/package/kodi-texturepacker/kodi-texturepacker.mk
+++ b/package/kodi-texturepacker/kodi-texturepacker.mk
@@ -6,7 +6,7 @@
 
 # Not possible to directly refer to kodi variables, because of
 # first/second expansion trickery...
-KODI_TEXTUREPACKER_VERSION = 18.9-Leia
+KODI_TEXTUREPACKER_VERSION = 19.0-Matrix
 KODI_TEXTUREPACKER_SITE = $(call github,xbmc,xbmc,$(KODI_TEXTUREPACKER_VERSION))
 KODI_TEXTUREPACKER_SOURCE = kodi-$(KODI_TEXTUREPACKER_VERSION).tar.gz
 KODI_TEXTUREPACKER_DL_SUBDIR = kodi
diff --git a/package/kodi/0001-kodi-config.cmake-use-CMAKE_FIND_ROOT_PATH-to-fix-cr.patch b/package/kodi/0001-kodi-config.cmake-use-CMAKE_FIND_ROOT_PATH-to-fix-cr.patch
index 5abb77e777..057d2254bc 100644
--- a/package/kodi/0001-kodi-config.cmake-use-CMAKE_FIND_ROOT_PATH-to-fix-cr.patch
+++ b/package/kodi/0001-kodi-config.cmake-use-CMAKE_FIND_ROOT_PATH-to-fix-cr.patch
@@ -8,18 +8,21 @@ When cross-compiling, the location at build time of the libraries is
 not the same as the one at run-time. The CMAKE_FIND_ROOT_PATH variable
 is here to handle this difference, so use it in kodi-config.cmake.
 
+Upstream status: Reverted (PR 17616)
+
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 (rebased and simplified for Kodi 17.0-Krypton)
 Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+(rebased for Kodi 19.0-Matrix)
 ---
- project/cmake/KodiConfig.cmake.in | 4 ++--
+ cmake/KodiConfig.cmake.in | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)
 
-diff --git a/project/cmake/KodiConfig.cmake.in b/project/cmake/KodiConfig.cmake.in
-index 76626ec..ffb8e1d 100644
+diff --git a/cmake/KodiConfig.cmake.in b/cmake/KodiConfig.cmake.in
+index a06d889fca9d..ff299807ea44 100644
 --- a/cmake/KodiConfig.cmake.in
 +++ b/cmake/KodiConfig.cmake.in
-@@ -8,7 +8,7 @@ if(NOT @APP_NAME_UC at _PREFIX)
+@@ -9,7 +9,7 @@ if(NOT @APP_NAME_UC at _PREFIX)
    set(@APP_NAME_UC at _PREFIX @APP_PREFIX@)
  endif()
  if(NOT @APP_NAME_UC at _INCLUDE_DIR)
@@ -28,10 +31,10 @@ index 76626ec..ffb8e1d 100644
  endif()
  if(NOT @APP_NAME_UC at _LIB_DIR)
    set(@APP_NAME_UC at _LIB_DIR @APP_LIB_DIR@)
-@@ -20,7 +20,7 @@ endif()
- if(NOT WIN32)
-   set(CMAKE_CXX_FLAGS "$ENV{CXXFLAGS} @CXX11_SWITCH@")
+@@ -18,7 +18,7 @@ if(NOT @APP_NAME_UC at _DATA_DIR)
+   set(@APP_NAME_UC at _DATA_DIR @APP_DATA_DIR@)
  endif()
+ set(APP_RENDER_SYSTEM @APP_RENDER_SYSTEM@)
 -list(APPEND CMAKE_MODULE_PATH @APP_LIB_DIR@ @APP_DATA_DIR@/cmake)
 +list(APPEND CMAKE_MODULE_PATH ${CMAKE_FIND_ROOT_PATH}/@APP_LIB_DIR@ ${CMAKE_FIND_ROOT_PATH}/@APP_DATA_DIR@/cmake)
  
diff --git a/package/kodi/0002-Fix-crosscompiling-issues.patch b/package/kodi/0002-Fix-crosscompiling-issues.patch
deleted file mode 100644
index 12bb66dde0..0000000000
--- a/package/kodi/0002-Fix-crosscompiling-issues.patch
+++ /dev/null
@@ -1,76 +0,0 @@
-From d2c343a20bb61098d0450b15ea2d1dacd28d954a Mon Sep 17 00:00:00 2001
-From: Bernd Kuhls <bernd.kuhls@t-online.de>
-Date: Sun, 12 Aug 2018 15:13:24 +0200
-Subject: [PATCH] Fix crosscompiling issues
-
-The codepath for KODI_DEPENDSBUILD needs to be used in order to provide
-the correct crosscompiling options to ffmpeg. The CMake option
-KODI_DEPENDSBUILD itself can not be enabled because it disables the
-internal build of libdvd*.
-
-To link kodi.bin with the statically built ffmpeg libraries kodi uses
-a wrapper script which calls pkgconfig. Our pkgconfig is patched to
-alter paths which breaks the link command in this case, to fix this
-PKG_CONFIG_SYSROOT_DIR was added.
-
-Also remove configure option --cpu from ffmpeg_conf to fix build
-errors.
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
----
- project/cmake/modules/FindFFMPEG.cmake     | 16 +++++++---------
- tools/depends/target/ffmpeg/CMakeLists.txt |  2 +-
- 2 files changed, 8 insertions(+), 10 deletions(-)
-
-diff --git a/project/cmake/modules/FindFFMPEG.cmake b/project/cmake/modules/FindFFMPEG.cmake
-index 28cc80710e..1ac8793149 100644
---- a/cmake/modules/FindFFMPEG.cmake
-+++ b/cmake/modules/FindFFMPEG.cmake
-@@ -234,14 +234,12 @@
-                      -DENABLE_VAAPI=${ENABLE_VAAPI}
-                      -DENABLE_VDPAU=${ENABLE_VDPAU})
- 
--  if(KODI_DEPENDSBUILD)
-     set(CROSS_ARGS -DDEPENDS_PATH=${DEPENDS_PATH}
-                    -DPKG_CONFIG_EXECUTABLE=${PKG_CONFIG_EXECUTABLE}
-                    -DCROSSCOMPILING=${CMAKE_CROSSCOMPILING}
-                    -DCMAKE_TOOLCHAIN_FILE=${CMAKE_TOOLCHAIN_FILE}
--                   -DOS=${OS}
-+                   -DOS=linux
-                    -DCMAKE_AR=${CMAKE_AR})
--  endif()
-   set(LINKER_FLAGS ${CMAKE_EXE_LINKER_FLAGS})
-   list(APPEND LINKER_FLAGS ${SYSTEM_LDFLAGS})
- 
-@@ -280,12 +278,12 @@
- "#!${BASH_COMMAND}
- if [[ $@ == *${APP_NAME_LC}.bin* || $@ == *${APP_NAME_LC}${APP_BINARY_SUFFIX}* || $@ == *${APP_NAME_LC}.so* || $@ == *${APP_NAME_LC}-test* ]]
- then
--  avformat=`PKG_CONFIG_PATH=${CMAKE_BINARY_DIR}/${CORE_BUILD_DIR}/lib/pkgconfig ${PKG_CONFIG_EXECUTABLE} --libs --static libavcodec`
--  avcodec=`PKG_CONFIG_PATH=${CMAKE_BINARY_DIR}/${CORE_BUILD_DIR}/lib/pkgconfig ${PKG_CONFIG_EXECUTABLE} --libs --static libavformat`
--  avfilter=`PKG_CONFIG_PATH=${CMAKE_BINARY_DIR}/${CORE_BUILD_DIR}/lib/pkgconfig ${PKG_CONFIG_EXECUTABLE} --libs --static libavfilter`
--  avutil=`PKG_CONFIG_PATH=${CMAKE_BINARY_DIR}/${CORE_BUILD_DIR}/lib/pkgconfig ${PKG_CONFIG_EXECUTABLE} --libs --static libavutil`
--  swscale=`PKG_CONFIG_PATH=${CMAKE_BINARY_DIR}/${CORE_BUILD_DIR}/lib/pkgconfig ${PKG_CONFIG_EXECUTABLE} --libs --static libswscale`
--  swresample=`PKG_CONFIG_PATH=${CMAKE_BINARY_DIR}/${CORE_BUILD_DIR}/lib/pkgconfig ${PKG_CONFIG_EXECUTABLE} --libs --static libswresample`
-+  avformat=`PKG_CONFIG_SYSROOT_DIR=${CMAKE_BINARY_DIR}/${CORE_BUILD_DIR} PKG_CONFIG_PATH=${CMAKE_BINARY_DIR}/${CORE_BUILD_DIR}/lib/pkgconfig ${PKG_CONFIG_EXECUTABLE} --libs --static libavcodec`
-+  avcodec=`PKG_CONFIG_SYSROOT_DIR=${CMAKE_BINARY_DIR}/${CORE_BUILD_DIR} PKG_CONFIG_PATH=${CMAKE_BINARY_DIR}/${CORE_BUILD_DIR}/lib/pkgconfig ${PKG_CONFIG_EXECUTABLE} --libs --static libavformat`
-+  avfilter=`PKG_CONFIG_SYSROOT_DIR=${CMAKE_BINARY_DIR}/${CORE_BUILD_DIR} PKG_CONFIG_PATH=${CMAKE_BINARY_DIR}/${CORE_BUILD_DIR}/lib/pkgconfig ${PKG_CONFIG_EXECUTABLE} --libs --static libavfilter`
-+  avutil=`PKG_CONFIG_SYSROOT_DIR=${CMAKE_BINARY_DIR}/${CORE_BUILD_DIR} PKG_CONFIG_PATH=${CMAKE_BINARY_DIR}/${CORE_BUILD_DIR}/lib/pkgconfig ${PKG_CONFIG_EXECUTABLE} --libs --static libavutil`
-+  swscale=`PKG_CONFIG_SYSROOT_DIR=${CMAKE_BINARY_DIR}/${CORE_BUILD_DIR} PKG_CONFIG_PATH=${CMAKE_BINARY_DIR}/${CORE_BUILD_DIR}/lib/pkgconfig ${PKG_CONFIG_EXECUTABLE} --libs --static libswscale`
-+  swresample=`PKG_CONFIG_SYSROOT_DIR=${CMAKE_BINARY_DIR}/${CORE_BUILD_DIR} PKG_CONFIG_PATH=${CMAKE_BINARY_DIR}/${CORE_BUILD_DIR}/lib/pkgconfig ${PKG_CONFIG_EXECUTABLE} --libs --static libswresample`
-   gnutls=`PKG_CONFIG_PATH=${DEPENDS_PATH}/lib/pkgconfig/ ${PKG_CONFIG_EXECUTABLE}  --libs-only-l --static --silence-errors gnutls`
-   $@ $avcodec $avformat $avcodec $avfilter $swscale $swresample -lpostproc $gnutls
- else
-diff --git a/tools/depends/target/ffmpeg/CMakeLists.txt b/tools/depends/target/ffmpeg/CMakeLists.txt
-index fda6b0cac4..af3afa6b60 100644
---- a/tools/depends/target/ffmpeg/CMakeLists.txt
-+++ b/tools/depends/target/ffmpeg/CMakeLists.txt
-@@ -13,7 +13,7 @@
- if(CROSSCOMPILING)
-   set(pkgconf "PKG_CONFIG_LIBDIR=${DEPENDS_PATH}/lib/pkgconfig")
-   list(APPEND ffmpeg_conf --pkg-config=${PKG_CONFIG_EXECUTABLE} --pkg-config-flags=--static)
--  list(APPEND ffmpeg_conf --enable-cross-compile --cpu=${CPU} --arch=${CPU} --target-os=${OS})
-+  list(APPEND ffmpeg_conf --enable-cross-compile --arch=${CPU} --target-os=${OS})
-   list(APPEND ffmpeg_conf --ar=${CMAKE_AR} --strip=${CMAKE_STRIP})
-   message(STATUS "CROSS: ${ffmpeg_conf}")
- endif()
diff --git a/package/kodi/0002-linux-fix-drm-object-build-with-gcc-4.9.patch b/package/kodi/0002-linux-fix-drm-object-build-with-gcc-4.9.patch
new file mode 100644
index 0000000000..b9a0efd336
--- /dev/null
+++ b/package/kodi/0002-linux-fix-drm-object-build-with-gcc-4.9.patch
@@ -0,0 +1,34 @@
+From 4f3b35c58ffb755cd7371faa44e2914fd7be3f0a Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd.kuhls@t-online.de>
+Date: Mon, 4 Jan 2021 22:32:28 +0100
+Subject: [PATCH] [linux] fix drm object build with gcc-4.9
+
+Fixes build error introduced by PR18858:
+
+kodi/xbmc/windowing/gbm/drm/DRMObject.cpp: In member function 'std::tuple<bool, long unsigned int> KODI::WINDOWING::GBM::CDRMObject::GetPropertyValue(const string&, const string&) const':
+kodi/xbmc/windowing/gbm/drm/DRMObject.cpp:103:39: error: converting to 'std::tuple<bool, long unsigned int>' from initializer list would use explicit constructor 'constexpr std::tuple<_T1, _T2>::tuple(_U1&&, _U2&&) [with _U1 = bool; _U2 = long long unsigned int&; <template-parameter-2-3> = void; _T1 = bool; _T2 = long unsigned int]'
+     return {true, prop->enums[j].value};
+
+Patch sent upstream: https://github.com/xbmc/xbmc/pull/19020
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ xbmc/windowing/gbm/drm/DRMObject.cpp | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/xbmc/windowing/gbm/drm/DRMObject.cpp b/xbmc/windowing/gbm/drm/DRMObject.cpp
+index 7d27c6f059..f93f014f7d 100644
+--- a/xbmc/windowing/gbm/drm/DRMObject.cpp
++++ b/xbmc/windowing/gbm/drm/DRMObject.cpp
+@@ -100,7 +100,7 @@ std::tuple<bool, uint64_t> CDRMObject::GetPropertyValue(const std::string& name,
+     if (prop->enums[j].name != valueName)
+       continue;
+ 
+-    return {true, prop->enums[j].value};
++    return std::make_tuple(true, prop->enums[j].value);
+   }
+ 
+   return std::make_tuple(false, 0);
+-- 
+2.29.2
+
diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index 745df41e20..4fc2f832ac 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -5,103 +5,97 @@ config BR2_PACKAGE_KODI_ARCH_SUPPORTS
 	depends on !(BR2_i386 && !BR2_X86_CPU_HAS_SSE)
 	depends on BR2_USE_MMU # libcdio, and others
 
-comment "kodi needs python w/ .py modules, a uClibc or glibc toolchain w/ C++, threads, wchar, dynamic library, gcc >= 4.8"
+comment "kodi needs python3 w/ .py modules, a uClibc or glibc toolchain w/ C++, threads, wchar, dynamic library, gcc >= 4.9"
 	depends on BR2_PACKAGE_KODI_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS \
 		|| !BR2_USE_WCHAR || BR2_STATIC_LIBS \
-		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 \
+		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 \
 		|| BR2_TOOLCHAIN_USES_MUSL \
-		|| !BR2_PACKAGE_PYTHON \
-		|| BR2_PACKAGE_PYTHON_PYC_ONLY
+		|| !BR2_PACKAGE_PYTHON3 \
+		|| BR2_PACKAGE_PYTHON3_PYC_ONLY
 
 config BR2_PACKAGE_KODI_PLATFORM_SUPPORTS
 	bool
 
-config BR2_PACKAGE_KODI_PLATFORM_SUPPORTS_RBPI
+config BR2_PACKAGE_KODI_PLATFORM_SUPPORTS_GBM
 	bool
 	default y
-	# List of valid CPUs can be found here:
-	# https://github.com/xbmc/xbmc/blob/Krypton/project/cmake/scripts/rbpi/ArchSetup.cmake#L12
-	depends on BR2_arm1176jzf_s || BR2_cortex_a7 || BR2_cortex_a53
-	depends on BR2_PACKAGE_RPI_USERLAND
+	depends on BR2_PACKAGE_HAS_LIBGL || BR2_PACKAGE_HAS_LIBGLES
+	depends on BR2_PACKAGE_MESA3D_GBM
 	depends on BR2_PACKAGE_HAS_UDEV # libinput
 	select BR2_PACKAGE_KODI_PLATFORM_SUPPORTS
+	select BR2_PACKAGE_LIBINPUT
+	select BR2_PACKAGE_LIBXKBCOMMON
 
-config BR2_PACKAGE_KODI_PLATFORM_SUPPORTS_WAYLAND_GL
-	bool
-	default y
-	depends on BR2_PACKAGE_HAS_LIBGL
-	depends on BR2_PACKAGE_HAS_LIBEGL_WAYLAND # waylandpp
-	depends on BR2_HOST_GCC_AT_LEAST_4_9 # waylandpp
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # waylandpp
-	depends on BR2_PACKAGE_WAYLAND # waylandpp
-	select BR2_PACKAGE_KODI_PLATFORM_SUPPORTS
-
-config BR2_PACKAGE_KODI_PLATFORM_SUPPORTS_WAYLAND_GLES
+config BR2_PACKAGE_KODI_PLATFORM_SUPPORTS_WAYLAND
 	bool
 	default y
-	depends on BR2_PACKAGE_HAS_LIBGLES
+	depends on BR2_PACKAGE_HAS_LIBGL || BR2_PACKAGE_HAS_LIBGLES
 	depends on BR2_PACKAGE_HAS_LIBEGL_WAYLAND # waylandpp
 	depends on BR2_HOST_GCC_AT_LEAST_4_9 # waylandpp
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # waylandpp
 	depends on BR2_PACKAGE_WAYLAND # waylandpp
 	select BR2_PACKAGE_KODI_PLATFORM_SUPPORTS
+	select BR2_PACKAGE_LIBXKBCOMMON
+	select BR2_PACKAGE_WAYLANDPP
 
-config BR2_PACKAGE_KODI_PLATFORM_SUPPORTS_X11_OPENGL
+config BR2_PACKAGE_KODI_PLATFORM_SUPPORTS_X11
 	bool
 	default y
-	depends on BR2_PACKAGE_HAS_LIBEGL
-	depends on BR2_PACKAGE_HAS_LIBGL
+	depends on BR2_PACKAGE_HAS_LIBGL || BR2_PACKAGE_HAS_LIBGLES
 	depends on BR2_PACKAGE_XORG7
 	select BR2_PACKAGE_KODI_PLATFORM_SUPPORTS
+	select BR2_PACKAGE_XLIB_LIBXRANDR
 
-comment "kodi needs an OpenGL EGL backend with OpenGL support"
+comment "kodi needs an OpenGL EGL backend with OpenGL or GLES support"
 	depends on !BR2_PACKAGE_KODI_PLATFORM_SUPPORTS
 
 menuconfig BR2_PACKAGE_KODI
 	bool "kodi"
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # libass -> harfbuzz
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # C++14
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on !BR2_TOOLCHAIN_USES_MUSL
 	depends on BR2_USE_WCHAR
-	depends on !BR2_STATIC_LIBS # gnutls, python and others
+	depends on !BR2_STATIC_LIBS # gnutls, python3 and others
+	depends on BR2_PACKAGE_HAS_LIBEGL
 	depends on BR2_PACKAGE_KODI_ARCH_SUPPORTS
 	depends on BR2_PACKAGE_KODI_PLATFORM_SUPPORTS
-	depends on BR2_PACKAGE_PYTHON
-	depends on !BR2_PACKAGE_PYTHON_PYC_ONLY
+	depends on BR2_PACKAGE_PYTHON3
+	depends on !BR2_PACKAGE_PYTHON3_PYC_ONLY
 	select BR2_NEEDS_HOST_JAVA
-	select BR2_PACKAGE_EXPAT
+	select BR2_PACKAGE_FFMPEG
+	select BR2_PACKAGE_FFMPEG_GPL
+	select BR2_PACKAGE_FFMPEG_POSTPROC
+	select BR2_PACKAGE_FFMPEG_SWSCALE
 	select BR2_PACKAGE_FLATBUFFERS
 	select BR2_PACKAGE_FMT
-	select BR2_PACKAGE_FONTCONFIG
+	select BR2_PACKAGE_FONTCONFIG # needed for libass
 	select BR2_PACKAGE_FREETYPE
 	select BR2_PACKAGE_FSTRCMP
-	select BR2_PACKAGE_GNUTLS
 	select BR2_PACKAGE_LIBASS
 	select BR2_PACKAGE_LIBCDIO
 	select BR2_PACKAGE_LIBCROSSGUID
 	select BR2_PACKAGE_LIBCURL
+	select BR2_PACKAGE_LIBDRM
 	select BR2_PACKAGE_LIBFRIBIDI
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 	select BR2_PACKAGE_LIBICONV_EXTRA_ENCODINGS if !BR2_ENABLE_LOCALE
 	select BR2_PACKAGE_LIBPLIST
 	select BR2_PACKAGE_LZO
-	select BR2_PACKAGE_NCURSES
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_PCRE
 	select BR2_PACKAGE_PCRE_UCP
-	select BR2_PACKAGE_PYTHON_2TO3
-	select BR2_PACKAGE_PYTHON_BSDDB
-	select BR2_PACKAGE_PYTHON_CURSES
-	select BR2_PACKAGE_PYTHON_PYEXPAT
-	select BR2_PACKAGE_PYTHON_SQLITE
-	select BR2_PACKAGE_PYTHON_SSL
-	select BR2_PACKAGE_PYTHON_UNICODEDATA
-	select BR2_PACKAGE_PYTHON_ZLIB
+	select BR2_PACKAGE_PYTHON3_2TO3
+	select BR2_PACKAGE_PYTHON3_PYEXPAT
+	select BR2_PACKAGE_PYTHON3_SQLITE
+	select BR2_PACKAGE_PYTHON3_SSL
+	select BR2_PACKAGE_PYTHON3_UNICODEDATA
+	select BR2_PACKAGE_PYTHON3_ZLIB
 	select BR2_PACKAGE_RAPIDJSON
+	select BR2_PACKAGE_SPDLOG
 	select BR2_PACKAGE_SQLITE
 	select BR2_PACKAGE_TAGLIB
 	select BR2_PACKAGE_TINYXML
@@ -196,34 +190,17 @@ config BR2_PACKAGE_KODI_MYSQL
 	  Enable MySQL support
 
 choice
-	prompt "platform"
-	default BR2_PACKAGE_KODI_PLATFORM_X11_OPENGL
-
-config BR2_PACKAGE_KODI_PLATFORM_RBPI
-	bool "Raspberry Pi"
-	depends on BR2_PACKAGE_KODI_PLATFORM_SUPPORTS_RBPI
-	select BR2_PACKAGE_LIBINPUT
-	select BR2_PACKAGE_LIBXKBCOMMON
+	prompt "render system"
+	default BR2_PACKAGE_KODI_RENDER_SYSTEM_GL
 
-config BR2_PACKAGE_KODI_PLATFORM_WAYLAND_GL
-	bool "Wayland/OpenGL"
-	depends on BR2_PACKAGE_KODI_PLATFORM_SUPPORTS_WAYLAND_GL
+config BR2_PACKAGE_KODI_RENDER_SYSTEM_GL
+	bool "OpenGL"
+	depends on BR2_PACKAGE_HAS_LIBGL
 	select BR2_PACKAGE_LIBGLU
-	select BR2_PACKAGE_LIBXKBCOMMON
-	select BR2_PACKAGE_WAYLANDPP
 
-config BR2_PACKAGE_KODI_PLATFORM_WAYLAND_GLES
-	bool "Wayland/GLES"
-	depends on BR2_PACKAGE_KODI_PLATFORM_SUPPORTS_WAYLAND_GLES
-	select BR2_PACKAGE_LIBXKBCOMMON
-	select BR2_PACKAGE_WAYLANDPP
-
-config BR2_PACKAGE_KODI_PLATFORM_X11_OPENGL
-	bool "X11/OpenGL"
-	depends on BR2_PACKAGE_KODI_PLATFORM_SUPPORTS_X11_OPENGL
-	select BR2_PACKAGE_LIBDRM
-	select BR2_PACKAGE_LIBGLU
-	select BR2_PACKAGE_XLIB_LIBXRANDR
+config BR2_PACKAGE_KODI_RENDER_SYSTEM_GLES
+	bool "GLES"
+	depends on BR2_PACKAGE_HAS_LIBGLES
 
 endchoice
 
@@ -257,40 +234,40 @@ config BR2_PACKAGE_KODI_LIBUSB
 	# https://github.com/xbmc/xbmc/blob/Jarvis/configure.ac#L1554
 	# "if libudev is available, we don't need libusb"
 	depends on !BR2_PACKAGE_HAS_UDEV
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # libusb
 	select BR2_PACKAGE_LIBUSB
 	select BR2_PACKAGE_LIBUSB_COMPAT
 	help
 	  Enable libusb support.
 
-comment "usb support needs a toolchain w/ gcc >= 4.9"
-	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
-
 config BR2_PACKAGE_KODI_LIBVA
 	bool "va"
 	depends on \
-		BR2_PACKAGE_KODI_PLATFORM_WAYLAND_GL || \
-		BR2_PACKAGE_KODI_PLATFORM_WAYLAND_GLES || \
-		BR2_PACKAGE_KODI_PLATFORM_X11_OPENGL
+		BR2_PACKAGE_KODI_PLATFORM_SUPPORTS_GBM || \
+		BR2_PACKAGE_KODI_PLATFORM_SUPPORTS_WAYLAND || \
+		(BR2_PACKAGE_KODI_PLATFORM_SUPPORTS_X11 && \
+			BR2_PACKAGE_KODI_RENDER_SYSTEM_GL)
 	select BR2_PACKAGE_LIBVA
 	help
 	  Enable libva support.
 
-comment "libva support needs platform 'Wayland' or 'X11/OpenGL'"
+comment "libva support needs platform 'gbm', 'Wayland' or 'X11/OpenGL'"
 	depends on \
-		!BR2_PACKAGE_KODI_PLATFORM_WAYLAND_GL && \
-		!BR2_PACKAGE_KODI_PLATFORM_WAYLAND_GLES && \
-		!BR2_PACKAGE_KODI_PLATFORM_X11_OPENGL
+		!BR2_PACKAGE_KODI_PLATFORM_SUPPORTS_GBM && \
+		!BR2_PACKAGE_KODI_PLATFORM_SUPPORTS_WAYLAND && \
+		(!BR2_PACKAGE_KODI_PLATFORM_SUPPORTS_X11 || \
+			!BR2_PACKAGE_KODI_RENDER_SYSTEM_GL)
 
 config BR2_PACKAGE_KODI_LIBVDPAU
 	bool "vdpau"
-	depends on BR2_PACKAGE_KODI_PLATFORM_X11_OPENGL
+	depends on BR2_PACKAGE_KODI_PLATFORM_X11 && \
+		BR2_PACKAGE_KODI_RENDER_SYSTEM_GL
 	select BR2_PACKAGE_LIBVDPAU
 	help
 	  Enable libvdpau support.
 
 comment "libvdpau support needs platform 'X11/OpenGL'"
-	depends on !BR2_PACKAGE_KODI_PLATFORM_X11_OPENGL
+	depends on !BR2_PACKAGE_KODI_PLATFORM_SUPPORTS_X11 || \
+		!BR2_PACKAGE_KODI_RENDER_SYSTEM_GL
 
 config BR2_PACKAGE_KODI_UPNP
 	bool "upnp"
diff --git a/package/kodi/kodi.hash b/package/kodi/kodi.hash
index 545f87909f..17bbc33714 100644
--- a/package/kodi/kodi.hash
+++ b/package/kodi/kodi.hash
@@ -1,6 +1,5 @@
 # Locally computed
-sha256  bdf8afa9356b1f815de9984801d3e0d2b46a719e747895b75528f20995c59d2b  kodi-18.9-Leia.tar.gz
-sha256  e11e7594af35f36ab2711252c3d6bb106908f26605498aef4a9be2d7bc001db2  kodi-ffmpeg-4.0.4-Leia-18.4.tar.gz
+sha256  f7ef8a6f45862ae3b7ebfce4950d74f534be3cb4a0e67ce640963746b3f668f2  kodi-19.0-Matrix.tar.gz
 sha256  38816f8373e243bc5950449b4f3b18938c4e1c59348e3411e23f31db4072e40d  kodi-libdvdcss-1.4.2-Leia-Beta-5.tar.gz
 sha256  071e414e61b795f2ff9015b21a85fc009dde967f27780d23092643916538a57a  kodi-libdvdnav-6.0.0-Leia-Alpha-3.tar.gz
 sha256  a30b6aa0aad0f2c505bc77948af2d5531a80b6e68112addb4c123fca24d5d3bf  kodi-libdvdread-6.0.0-Leia-Alpha-3.tar.gz
diff --git a/package/kodi/kodi.mk b/package/kodi/kodi.mk
index 3f22db48a3..bf5822eb61 100644
--- a/package/kodi/kodi.mk
+++ b/package/kodi/kodi.mk
@@ -6,7 +6,7 @@
 
 # When updating the version, please also update kodi-jsonschemabuilder
 # and kodi-texturepacker
-KODI_VERSION = 18.9-Leia
+KODI_VERSION = 19.0-Matrix
 KODI_SITE = $(call github,xbmc,xbmc,$(KODI_VERSION))
 KODI_LICENSE = GPL-2.0
 KODI_LICENSE_FILES = LICENSE.md
@@ -15,13 +15,12 @@ KODI_INSTALL_STAGING = YES
 # kodi recommends building out-of-source
 KODI_SUPPORTS_IN_SOURCE_BUILD = NO
 KODI_DEPENDENCIES = \
-	expat \
+	ffmpeg \
 	flatbuffers \
 	fmt \
 	fontconfig \
 	freetype \
 	fstrcmp \
-	gnutls \
 	host-flatbuffers \
 	host-gawk \
 	host-gettext \
@@ -35,36 +34,30 @@ KODI_DEPENDENCIES = \
 	libcdio \
 	libcrossguid \
 	libcurl \
+	libdrm \
+	libegl \
 	libfribidi \
 	libplist \
 	lzo \
-	ncurses \
 	openssl \
 	pcre \
-	python \
+	python3 \
 	rapidjson \
+	spdlog \
 	sqlite \
 	taglib \
 	tinyxml \
 	zlib
 
 # taken from tools/depends/target/*/*-VERSION
-KODI_FFMPEG_VERSION = 4.0.4-Leia-18.4
 KODI_LIBDVDCSS_VERSION = 1.4.2-Leia-Beta-5
 KODI_LIBDVDNAV_VERSION = 6.0.0-Leia-Alpha-3
 KODI_LIBDVDREAD_VERSION = 6.0.0-Leia-Alpha-3
 KODI_EXTRA_DOWNLOADS += \
-	$(call github,xbmc,FFmpeg,$(KODI_FFMPEG_VERSION))/kodi-ffmpeg-$(KODI_FFMPEG_VERSION).tar.gz \
 	$(call github,xbmc,libdvdcss,$(KODI_LIBDVDCSS_VERSION))/kodi-libdvdcss-$(KODI_LIBDVDCSS_VERSION).tar.gz \
 	$(call github,xbmc,libdvdnav,$(KODI_LIBDVDNAV_VERSION))/kodi-libdvdnav-$(KODI_LIBDVDNAV_VERSION).tar.gz \
 	$(call github,xbmc,libdvdread,$(KODI_LIBDVDREAD_VERSION))/kodi-libdvdread-$(KODI_LIBDVDREAD_VERSION).tar.gz
 
-define KODI_CPLUFF_AUTOCONF
-	cd $(KODI_SRCDIR)/lib/cpluff && ./autogen.sh
-endef
-KODI_PRE_CONFIGURE_HOOKS += KODI_CPLUFF_AUTOCONF
-KODI_DEPENDENCIES += host-automake host-autoconf host-libtool
-
 KODI_CONF_OPTS += \
 	-DCMAKE_C_FLAGS="$(TARGET_CFLAGS) $(KODI_C_FLAGS)" \
 	-DCMAKE_CXX_FLAGS="$(TARGET_CXXFLAGS) $(KODI_CXX_FLAGS)" \
@@ -72,30 +65,56 @@ KODI_CONF_OPTS += \
 	-DENABLE_CCACHE=OFF \
 	-DENABLE_DVDCSS=ON \
 	-DENABLE_INTERNAL_CROSSGUID=OFF \
-	-DENABLE_INTERNAL_FFMPEG=ON \
+	-DWITH_FFMPEG=$(STAGING_DIR)/usr \
 	-DENABLE_INTERNAL_FLATBUFFERS=OFF \
-	-DFFMPEG_URL=$(KODI_DL_DIR)/kodi-ffmpeg-$(KODI_FFMPEG_VERSION).tar.gz \
+	-DFLATBUFFERS_FLATC_EXECUTABLE=$(HOST_DIR)/bin/flatc \
 	-DKODI_DEPENDSBUILD=OFF \
 	-DENABLE_LDGOLD=OFF \
 	-DNATIVEPREFIX=$(HOST_DIR) \
 	-DDEPENDS_PATH=$(STAGING_DIR)/usr \
+	-DENABLE_TESTING=OFF \
 	-DWITH_JSONSCHEMABUILDER=$(HOST_DIR)/bin/JsonSchemaBuilder \
 	-DWITH_TEXTUREPACKER=$(HOST_DIR)/bin/TexturePacker \
 	-DLIBDVDCSS_URL=$(KODI_DL_DIR)/kodi-libdvdcss-$(KODI_LIBDVDCSS_VERSION).tar.gz \
 	-DLIBDVDNAV_URL=$(KODI_DL_DIR)/kodi-libdvdnav-$(KODI_LIBDVDNAV_VERSION).tar.gz \
 	-DLIBDVDREAD_URL=$(KODI_DL_DIR)/kodi-libdvdread-$(KODI_LIBDVDREAD_VERSION).tar.gz
 
+ifeq ($(BR2_PACKAGE_KODI_RENDER_SYSTEM_GL),y)
+KODI_CONF_OPTS += -DAPP_RENDER_SYSTEM=gl
+KODI_DEPENDENCIES += libgl libglu
+else ifeq ($(BR2_PACKAGE_KODI_RENDER_SYSTEM_GLES),y)
+KODI_CONF_OPTS += -DAPP_RENDER_SYSTEM=gles
+KODI_DEPENDENCIES += libgles
+endif
+
+ifeq ($(BR2_PACKAGE_KODI_PLATFORM_SUPPORTS_GBM),y)
+KODI_CORE_PLATFORM_NAME += gbm
+KODI_DEPENDENCIES += libinput libxkbcommon mesa3d
+endif
+
+ifeq ($(BR2_PACKAGE_KODI_PLATFORM_SUPPORTS_WAYLAND),y)
+KODI_CONF_OPTS += \
+	-DPC_WAYLANDPP_SCANNER=$(HOST_DIR)/bin/wayland-scanner \
+	-DPC_WAYLANDPP_SCANNER_FOUND=ON
+KODI_CORE_PLATFORM_NAME += wayland
+KODI_DEPENDENCIES += libxkbcommon waylandpp
+endif
+
+ifeq ($(BR2_PACKAGE_KODI_PLATFORM_SUPPORTS_X11),y)
+KODI_CORE_PLATFORM_NAME += x11
+KODI_DEPENDENCIES += \
+	xlib_libX11 \
+	xlib_libXext \
+	xlib_libXrandr
+endif
+
+KODI_CONF_OPTS += -DCORE_PLATFORM_NAME="$(KODI_CORE_PLATFORM_NAME)"
+
 ifeq ($(BR2_ENABLE_LOCALE),)
 KODI_DEPENDENCIES += libiconv
 endif
 
-ifeq ($(BR2_PACKAGE_KODI_PLATFORM_RBPI),y)
-# These CPU-specific options are only used on rbpi:
-# https://github.com/xbmc/xbmc/blob/Krypton/project/cmake/scripts/rbpi/ArchSetup.cmake#L13
-ifeq ($(BR2_arm1176jzf_s)$(BR2_cortex_a7)$(BR2_cortex_a53),y)
-KODI_CONF_OPTS += -DWITH_CPU="$(GCC_TARGET_CPU)"
-endif
-else ifeq ($(BR2_arceb)$(BR2_arcle),y)
+ifeq ($(BR2_arceb)$(BR2_arcle),y)
 KODI_CONF_OPTS += -DWITH_ARCH=arc -DWITH_CPU=arc
 else ifeq ($(BR2_armeb),y)
 KODI_CONF_OPTS += -DWITH_ARCH=arm -DWITH_CPU=arm
@@ -168,31 +187,8 @@ ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
 KODI_CXX_FLAGS += -latomic
 endif
 
-ifeq ($(BR2_PACKAGE_KODI_PLATFORM_RBPI),y)
-KODI_CONF_OPTS += -DCORE_PLATFORM_NAME=rbpi
-KODI_DEPENDENCIES += libinput libxkbcommon rpi-userland
-endif
-
-ifeq ($(BR2_PACKAGE_KODI_PLATFORM_WAYLAND_GL),y)
-KODI_CONF_OPTS += \
-	-DCORE_PLATFORM_NAME=wayland \
-	-DWAYLAND_RENDER_SYSTEM=gl
-KODI_DEPENDENCIES += libegl libgl libglu libxkbcommon waylandpp
-endif
-
-ifeq ($(BR2_PACKAGE_KODI_PLATFORM_WAYLAND_GLES),y)
-KODI_CONF_OPTS += \
-	-DCORE_PLATFORM_NAME=wayland \
-	-DWAYLAND_RENDER_SYSTEM=gles
-KODI_C_FLAGS += `$(PKG_CONFIG_HOST_BINARY) --cflags egl`
-KODI_CXX_FLAGS += `$(PKG_CONFIG_HOST_BINARY) --cflags egl`
-KODI_DEPENDENCIES += libegl libgles libxkbcommon waylandpp
-endif
-
-ifeq ($(BR2_PACKAGE_KODI_PLATFORM_X11_OPENGL),y)
-KODI_CONF_OPTS += -DCORE_PLATFORM_NAME=x11
-KODI_DEPENDENCIES += libegl libglu libgl xlib_libX11 xlib_libXext \
-	xlib_libXrandr libdrm
+ifeq ($(BR2_TOOLCHAIN_GCC_AT_LEAST_5),)
+KODI_C_FLAGS += -std=gnu99
 endif
 
 ifeq ($(BR2_PACKAGE_KODI_MYSQL),y)
@@ -348,6 +344,12 @@ else
 KODI_CONF_OPTS += -DENABLE_PULSEAUDIO=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_LIBUDFREAD),y)
+KODI_DEPENDENCIES += libudfread
+else
+KODI_CONF_OPTS += -DENABLE_INTERNAL_UDFREAD=OFF
+endif
+
 # Remove versioncheck addon, updating Kodi is done by building a new
 # buildroot image.
 KODI_ADDON_MANIFEST = $(TARGET_DIR)/usr/share/kodi/system/addon-manifest.xml
