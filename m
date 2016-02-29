From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 29 Feb 2016 23:44:22 +0100
Subject: [Buildroot] [git commit] package/kodi: bump version to 16.0-Jarvis
Message-ID: <20160302202800.3E85B7F98B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6922b41dd8bb5294e9cfcef6ea6678737150a815
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add two new hard dependencies:

- libdcadec
https://github.com/xbmc/xbmc/commit/0997117a659a09e7b1c5bcb110f3526ea16698be

- libcrossguid
https://github.com/xbmc/xbmc/commit/6f8171f53992fc2eaabf71f6fa47ebed1da0d43d

Kodi moved to C++11 so we need gcc >= 4.7:
https://github.com/xbmc/xbmc/pull/6412

wavpack support was removed in favour of ffmpeg:
https://github.com/xbmc/xbmc/commit/7916902c9e6f7a523265594f3ad7f921f93f1cd4

Enabled giflib support by default.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Config.in.legacy                                    |  7 +++++++
 ...g.cmake-use-CMAKE_FIND_ROOT_PATH-to-fix-cr.patch | 21 ++++++++++++---------
 package/kodi/Config.in                              | 20 ++++++++------------
 package/kodi/kodi.hash                              |  2 +-
 package/kodi/kodi.mk                                | 13 +++----------
 5 files changed, 31 insertions(+), 32 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 179cf47..0771967 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -145,6 +145,13 @@ endif
 ###############################################################################
 comment "Legacy options removed in 2016.05"
 
+config BR2_PACKAGE_KODI_WAVPACK
+	bool "wavpack"
+	select BR2_LEGACY
+	help
+	  wavpack support was removed in favour of ffmpeg:
+	  https://github.com/xbmc/xbmc/commit/7916902c9e6f7a523265594f3ad7f921f93f1cd4
+
 config BR2_PACKAGE_KODI_RSXS
 	bool "rsxs support in Kodi was moved to an addon"
 	select BR2_LEGACY
diff --git a/package/kodi/0004-kodi-config.cmake-use-CMAKE_FIND_ROOT_PATH-to-fix-cr.patch b/package/kodi/0004-kodi-config.cmake-use-CMAKE_FIND_ROOT_PATH-to-fix-cr.patch
index 641525c..2678a78 100644
--- a/package/kodi/0004-kodi-config.cmake-use-CMAKE_FIND_ROOT_PATH-to-fix-cr.patch
+++ b/package/kodi/0004-kodi-config.cmake-use-CMAKE_FIND_ROOT_PATH-to-fix-cr.patch
@@ -17,14 +17,17 @@ diff --git a/project/cmake/kodi-config.cmake.in b/project/cmake/kodi-config.cmak
 index 76626ec..ffb8e1d 100644
 --- a/project/cmake/kodi-config.cmake.in
 +++ b/project/cmake/kodi-config.cmake.in
-@@ -4,12 +4,12 @@ SET(APP_NAME_UC @APP_NAME_UC@)
- SET(APP_VERSION_MAJOR @APP_VERSION_MAJOR@)
- SET(APP_VERSION_MINOR @APP_VERSION_MINOR@)
- SET(@APP_NAME_UC at _PREFIX @APP_PREFIX@)
--SET(@APP_NAME_UC at _INCLUDE_DIR @APP_INCLUDE_DIR@)
--SET(@APP_NAME_UC at _LIB_DIR @APP_LIB_DIR@)
-+SET(@APP_NAME_UC at _INCLUDE_DIR ${CMAKE_FIND_ROOT_PATH}/@APP_INCLUDE_DIR@)
-+SET(@APP_NAME_UC at _LIB_DIR ${CMAKE_FIND_ROOT_PATH}/@APP_LIB_DIR@)
+@@ -7,15 +7,15 @@
+   SET(@APP_NAME_UC at _PREFIX @APP_PREFIX@)
+ ENDIF()
+ IF(NOT @APP_NAME_UC at _INCLUDE_DIR)
+-  SET(@APP_NAME_UC at _INCLUDE_DIR @APP_INCLUDE_DIR@)
++  SET(@APP_NAME_UC at _INCLUDE_DIR ${CMAKE_FIND_ROOT_PATH}/@APP_INCLUDE_DIR@)
+ ENDIF()
+ IF(NOT @APP_NAME_UC at _LIB_DIR)
+-  SET(@APP_NAME_UC at _LIB_DIR @APP_LIB_DIR@)
++  SET(@APP_NAME_UC at _LIB_DIR ${CMAKE_FIND_ROOT_PATH}/@APP_LIB_DIR@)
+ ENDIF()
  IF(NOT WIN32)
    SET(CMAKE_CXX_FLAGS "$ENV{CXXFLAGS} @CXX11_SWITCH@")
  ENDIF()
@@ -32,7 +35,7 @@ index 76626ec..ffb8e1d 100644
 +LIST(APPEND CMAKE_MODULE_PATH ${CMAKE_FIND_ROOT_PATH}/@APP_LIB_DIR@)
  ADD_DEFINITIONS(@ARCH_DEFINES@ -DBUILD_KODI_ADDON)
  
- include(addon-helpers)
+ if(NOT CORE_SYSTEM_NAME)
 -- 
 2.5.0
 
diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index af5e40b..09bd0cd 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -2,10 +2,11 @@ config BR2_PACKAGE_KODI_ARCH_SUPPORTS
 	bool
 	default y if (BR2_arm || (BR2_mipsel && BR2_TOOLCHAIN_USES_GLIBC) || BR2_i386 || BR2_x86_64) && BR2_PACKAGE_BOOST_ARCH_SUPPORTS
 
-comment "kodi needs a toolchain w/ C++, threads, wchar, dynamic library"
+comment "kodi needs a toolchain w/ C++, threads, wchar, dynamic library, gcc >= 4.7"
 	depends on BR2_PACKAGE_KODI_ARCH_SUPPORTS
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS \
-		|| !BR2_USE_WCHAR || BR2_STATIC_LIBS
+		|| !BR2_USE_WCHAR || BR2_STATIC_LIBS \
+		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_4_7
 	depends on BR2_USE_MMU
 
 config BR2_PACKAGE_KODI_EGL_GLES
@@ -42,11 +43,14 @@ menuconfig BR2_PACKAGE_KODI
 	select BR2_PACKAGE_FFMPEG_SWSCALE
 	select BR2_PACKAGE_FONTCONFIG
 	select BR2_PACKAGE_FREETYPE
+	select BR2_PACKAGE_GIFLIB
 	select BR2_PACKAGE_JASPER
 	select BR2_PACKAGE_JPEG
 	select BR2_PACKAGE_LIBASS
 	select BR2_PACKAGE_LIBCDIO
+	select BR2_PACKAGE_LIBCROSSGUID
 	select BR2_PACKAGE_LIBCURL
+	select BR2_PACKAGE_LIBDCADEC
 	select BR2_PACKAGE_LIBFRIBIDI
 	select BR2_PACKAGE_LIBGLEW if BR2_PACKAGE_KODI_GL
 	select BR2_PACKAGE_LIBGLU if BR2_PACKAGE_KODI_GL
@@ -86,6 +90,7 @@ menuconfig BR2_PACKAGE_KODI
 	select BR2_PACKAGE_ZLIB
 	select BR2_TOOLCHAIN_GLIBC_GCONV_LIBS_COPY if BR2_TOOLCHAIN_USES_GLIBC # runtime UTF conversion support
 	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_7
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_PACKAGE_KODI_EGL_GLES || BR2_PACKAGE_KODI_GL
 	depends on BR2_USE_MMU # python
@@ -138,15 +143,13 @@ config BR2_PACKAGE_KODI_LIBCEC
 	bool "hdmi cec"
 	depends on !BR2_STATIC_LIBS # libcec
 	depends on BR2_PACKAGE_HAS_UDEV
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 # libcec
 	select BR2_PACKAGE_LIBCEC
 	help
 	  Enable CEC (Consumer Electronics Control) support.
 	  Select this if you want Kodi to support HDMI CEC.
 
 comment "hdmi cec support needs udev /dev management and a toolchain w/ dynamic library"
-	depends on BR2_STATIC_LIBS || !BR2_PACKAGE_HAS_UDEV || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_7
+	depends on BR2_STATIC_LIBS || !BR2_PACKAGE_HAS_UDEV
 
 config BR2_PACKAGE_KODI_LIRC
 	bool "lirc"
@@ -230,13 +233,6 @@ config BR2_PACKAGE_KODI_LIBVA
 comment "libva support needs a toolchain w/ dynamic library"
 	depends on BR2_STATIC_LIBS
 
-config BR2_PACKAGE_KODI_WAVPACK
-	bool "wavpack"
-	select BR2_PACKAGE_WAVPACK
-	help
-	  Enable WAV input support.
-	  Select this if you want to play back WV files.
-
 config BR2_PACKAGE_KODI_OPTICALDRIVE
 	bool
 
diff --git a/package/kodi/kodi.hash b/package/kodi/kodi.hash
index 14af9af..229446b 100644
--- a/package/kodi/kodi.hash
+++ b/package/kodi/kodi.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256	dd8aeb942e6de5d1488e243e1346cff3f6597e21b5131a3ba72ff5cc82037110	kodi-15.2-Isengard.tar.gz
+sha256	0421ea1337cdee674f8a36d995f54152b5ddc4100e53410b3aeeb3b3f7d53946	kodi-16.0-Jarvis.tar.gz
diff --git a/package/kodi/kodi.mk b/package/kodi/kodi.mk
index ef3f174..94a8cd8 100644
--- a/package/kodi/kodi.mk
+++ b/package/kodi/kodi.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_VERSION = 15.2-Isengard
+KODI_VERSION = 16.0-Jarvis
 KODI_SITE = $(call github,xbmc,xbmc,$(KODI_VERSION))
 KODI_LICENSE = GPLv2
 KODI_LICENSE_FILES = LICENSE.GPL
@@ -12,8 +12,8 @@ KODI_LICENSE_FILES = LICENSE.GPL
 KODI_INSTALL_STAGING = YES
 KODI_DEPENDENCIES = host-gawk host-gettext host-gperf host-zip host-giflib \
 	host-libjpeg host-lzo host-nasm host-libpng host-swig
-KODI_DEPENDENCIES += boost bzip2 expat ffmpeg fontconfig freetype jasper jpeg \
-	libass libcdio libcurl libfribidi libgcrypt libmpeg2 \
+KODI_DEPENDENCIES += boost bzip2 expat ffmpeg fontconfig freetype giflib jasper jpeg \
+	libass libcdio libcrossguid libcurl libdcadec libfribidi libgcrypt libmpeg2 \
 	libogg libplist libpng libsamplerate libsquish libvorbis libxml2 \
 	libxslt lzo ncurses openssl pcre python readline sqlite taglib tiff \
 	tinyxml yajl zlib
@@ -30,12 +30,9 @@ KODI_CONF_ENV = \
 
 KODI_CONF_OPTS +=  \
 	--with-ffmpeg=shared \
-	--disable-goom \
 	--disable-joystick \
 	--disable-openmax \
-	--disable-projectm \
 	--disable-pulse \
-	--disable-rsxs \
 	--disable-vdpau \
 	--disable-vtbdecoder \
 	--enable-optimizations
@@ -178,10 +175,6 @@ else
 KODI_CONF_OPTS += --disable-lirc
 endif
 
-ifeq ($(BR2_PACKAGE_KODI_WAVPACK),y)
-KODI_DEPENDENCIES += wavpack
-endif
-
 ifeq ($(BR2_PACKAGE_KODI_LIBTHEORA),y)
 KODI_DEPENDENCIES += libtheora
 endif
