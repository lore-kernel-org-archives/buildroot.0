From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 14 Aug 2018 15:53:05 +0200
Subject: [Buildroot] [git commit branch/next] package/kodi: switch to
 internal ffmpeg version 3.1.11 build
Message-ID: <20180814134625.1619A8D2A4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a95c363809e8b026431225b3436e04a78c8f093c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Kodi 17 is incompatible with ffmpeg-4.x. To prepare the ffmpeg bump we
switch the current Kodi package to internally build and statically link
to patched ffmpeg-3.1.11 provided by upstream. Gnutls is added as
dependency to allow playback of https streams.

Upstream expects Kodi 17 to be used with ffmpeg 3.1.x (see upstream PR
12368) so we choose the upstream way to build ffmpeg instead of provi-
ding a version choice for ffmpeg in buildroot.

This commit can be reverted when Kodi is bumped to version 18, currently
released as alpha3.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/kodi/0004-Fix-ffmpeg-build-for-mips.patch | 43 ++++++++++++
 package/kodi/0005-Fix-crosscompiling-issues.patch | 81 +++++++++++++++++++++++
 package/kodi/Config.in                            |  7 +-
 package/kodi/kodi.hash                            |  2 +
 package/kodi/kodi.mk                              | 16 +++--
 5 files changed, 138 insertions(+), 11 deletions(-)

diff --git a/package/kodi/0004-Fix-ffmpeg-build-for-mips.patch b/package/kodi/0004-Fix-ffmpeg-build-for-mips.patch
new file mode 100644
index 0000000000..709a2d39da
--- /dev/null
+++ b/package/kodi/0004-Fix-ffmpeg-build-for-mips.patch
@@ -0,0 +1,43 @@
+From e3882a7d6c2e47731c0435d0faa3594041d58a2c Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd.kuhls@t-online.de>
+Date: Sun, 12 Aug 2018 15:12:29 +0200
+Subject: [PATCH] Fix ffmpeg build for mips
+
+Backported from upstream master branch:
+https://github.com/xbmc/xbmc/commit/71e09dd1ac66059e31e6240352da7091d820ef83
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ tools/depends/target/ffmpeg/CMakeLists.txt | 2 +-
+ tools/depends/target/ffmpeg/Makefile       | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/tools/depends/target/ffmpeg/CMakeLists.txt b/tools/depends/target/ffmpeg/CMakeLists.txt
+index 0a9e9d38ea..fda6b0cac4 100644
+--- a/tools/depends/target/ffmpeg/CMakeLists.txt
++++ b/tools/depends/target/ffmpeg/CMakeLists.txt
+@@ -63,7 +63,7 @@ endif()
+ if(CPU MATCHES arm OR CORE_SYSTEM_NAME STREQUAL rbpi)
+   list(APPEND ffmpeg_conf --enable-pic --disable-armv5te --disable-armv6t2)
+ elseif(CPU MATCHES mips)
+-  list(APPEND ffmpeg_conf --disable-mips32r2 --disable-mipsdspr1 --disable-mipsdspr2)
++  list(APPEND ffmpeg_conf --disable-mips32r2 --disable-mipsdsp --disable-mipsdspr2)
+ endif()
+ 
+ find_package(GnuTls)
+diff --git a/tools/depends/target/ffmpeg/Makefile b/tools/depends/target/ffmpeg/Makefile
+index ea1113d293..098f6c0c14 100644
+--- a/tools/depends/target/ffmpeg/Makefile
++++ b/tools/depends/target/ffmpeg/Makefile
+@@ -58,7 +58,7 @@ ifeq ($(findstring arm, $(CPU)), arm)
+   ffmpg_config += --enable-pic --disable-armv5te --disable-armv6t2
+ endif
+ ifeq ($(findstring mips, $(CPU)), mips)
+-  ffmpg_config += --disable-mips32r2 --disable-mipsdspr1 --disable-mipsdspr2
++  ffmpg_config += --disable-mips32r2 --disable-mipsdsp --disable-mipsdspr2
+ endif
+ ifeq ($(Configuration), Release)
+   ffmpg_config += --disable-debug
+-- 
+2.18.0
+
diff --git a/package/kodi/0005-Fix-crosscompiling-issues.patch b/package/kodi/0005-Fix-crosscompiling-issues.patch
new file mode 100644
index 0000000000..63f71cabe1
--- /dev/null
+++ b/package/kodi/0005-Fix-crosscompiling-issues.patch
@@ -0,0 +1,81 @@
+From d2c343a20bb61098d0450b15ea2d1dacd28d954a Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd.kuhls@t-online.de>
+Date: Sun, 12 Aug 2018 15:13:24 +0200
+Subject: [PATCH] Fix crosscompiling issues
+
+The codepath for KODI_DEPENDSBUILD needs to be used in order to provide
+the correct crosscompiling options to ffmpeg. The CMake option
+KODI_DEPENDSBUILD itself can not be enabled because it disables the
+internal build of libdvd*.
+
+To link kodi.bin with the statically built ffmpeg libraries kodi uses
+a wrapper script which calls pkgconfig. Our pkgconfig is patched to
+alter paths which breaks the link command in this case, to fix this
+PKG_CONFIG_SYSROOT_DIR was added.
+
+Also remove configure option --cpu from ffmpeg_conf to fix build
+errors.
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ project/cmake/modules/FindFFMPEG.cmake     | 16 +++++++---------
+ tools/depends/target/ffmpeg/CMakeLists.txt |  2 +-
+ 2 files changed, 8 insertions(+), 10 deletions(-)
+
+diff --git a/project/cmake/modules/FindFFMPEG.cmake b/project/cmake/modules/FindFFMPEG.cmake
+index 28cc80710e..1ac8793149 100644
+--- a/project/cmake/modules/FindFFMPEG.cmake
++++ b/project/cmake/modules/FindFFMPEG.cmake
+@@ -233,16 +233,14 @@ if(NOT FFMPEG_FOUND)
+     message(STATUS "FFMPEG_URL: ${FFMPEG_URL}")
+   endif()
+ 
+-  if(KODI_DEPENDSBUILD)
+     set(CROSS_ARGS -DDEPENDS_PATH=${DEPENDS_PATH}
+                    -DPKG_CONFIG_EXECUTABLE=${PKG_CONFIG_EXECUTABLE}
+                    -DCROSSCOMPILING=${CMAKE_CROSSCOMPILING}
+                    -DCMAKE_TOOLCHAIN_FILE=${CMAKE_TOOLCHAIN_FILE}
+-                   -DOS=${OS}
++                   -DOS=linux
+                    -DCMAKE_C_COMPILER=${CMAKE_C_COMPILER}
+                    -DCMAKE_CXX_COMPILER=${CMAKE_CXX_COMPILER}
+                    -DCMAKE_AR=${CMAKE_AR})
+-  endif()
+ 
+   externalproject_add(ffmpeg
+                       URL ${FFMPEG_URL}
+@@ -270,12 +268,12 @@ if(NOT FFMPEG_FOUND)
+ "#!/bin/bash
+ if [[ $@ == *${APP_NAME_LC}.bin* || $@ == *${APP_NAME_LC}.so* || $@ == *${APP_NAME_LC}-test* ]]
+ then
+-  avformat=`PKG_CONFIG_PATH=${CMAKE_BINARY_DIR}/${CORE_BUILD_DIR}/lib/pkgconfig ${PKG_CONFIG_EXECUTABLE} --libs --static libavcodec`
+-  avcodec=`PKG_CONFIG_PATH=${CMAKE_BINARY_DIR}/${CORE_BUILD_DIR}/lib/pkgconfig ${PKG_CONFIG_EXECUTABLE} --libs --static libavformat`
+-  avfilter=`PKG_CONFIG_PATH=${CMAKE_BINARY_DIR}/${CORE_BUILD_DIR}/lib/pkgconfig ${PKG_CONFIG_EXECUTABLE} --libs --static libavfilter`
+-  avutil=`PKG_CONFIG_PATH=${CMAKE_BINARY_DIR}/${CORE_BUILD_DIR}/lib/pkgconfig ${PKG_CONFIG_EXECUTABLE} --libs --static libavutil`
+-  swscale=`PKG_CONFIG_PATH=${CMAKE_BINARY_DIR}/${CORE_BUILD_DIR}/lib/pkgconfig ${PKG_CONFIG_EXECUTABLE} --libs --static libswscale`
+-  swresample=`PKG_CONFIG_PATH=${CMAKE_BINARY_DIR}/${CORE_BUILD_DIR}/lib/pkgconfig ${PKG_CONFIG_EXECUTABLE} --libs --static libswresample`
++  avformat=`PKG_CONFIG_SYSROOT_DIR=${CMAKE_BINARY_DIR}/${CORE_BUILD_DIR} PKG_CONFIG_PATH=${CMAKE_BINARY_DIR}/${CORE_BUILD_DIR}/lib/pkgconfig ${PKG_CONFIG_EXECUTABLE} --libs --static libavcodec`
++  avcodec=`PKG_CONFIG_SYSROOT_DIR=${CMAKE_BINARY_DIR}/${CORE_BUILD_DIR} PKG_CONFIG_PATH=${CMAKE_BINARY_DIR}/${CORE_BUILD_DIR}/lib/pkgconfig ${PKG_CONFIG_EXECUTABLE} --libs --static libavformat`
++  avfilter=`PKG_CONFIG_SYSROOT_DIR=${CMAKE_BINARY_DIR}/${CORE_BUILD_DIR} PKG_CONFIG_PATH=${CMAKE_BINARY_DIR}/${CORE_BUILD_DIR}/lib/pkgconfig ${PKG_CONFIG_EXECUTABLE} --libs --static libavfilter`
++  avutil=`PKG_CONFIG_SYSROOT_DIR=${CMAKE_BINARY_DIR}/${CORE_BUILD_DIR} PKG_CONFIG_PATH=${CMAKE_BINARY_DIR}/${CORE_BUILD_DIR}/lib/pkgconfig ${PKG_CONFIG_EXECUTABLE} --libs --static libavutil`
++  swscale=`PKG_CONFIG_SYSROOT_DIR=${CMAKE_BINARY_DIR}/${CORE_BUILD_DIR} PKG_CONFIG_PATH=${CMAKE_BINARY_DIR}/${CORE_BUILD_DIR}/lib/pkgconfig ${PKG_CONFIG_EXECUTABLE} --libs --static libswscale`
++  swresample=`PKG_CONFIG_SYSROOT_DIR=${CMAKE_BINARY_DIR}/${CORE_BUILD_DIR} PKG_CONFIG_PATH=${CMAKE_BINARY_DIR}/${CORE_BUILD_DIR}/lib/pkgconfig ${PKG_CONFIG_EXECUTABLE} --libs --static libswresample`
+   gnutls=`PKG_CONFIG_PATH=${DEPENDS_PATH}/lib/pkgconfig/ ${PKG_CONFIG_EXECUTABLE}  --libs-only-l --static --silence-errors gnutls`
+   $@ $avcodec $avformat $avcodec $avfilter $swscale $swresample -lpostproc $gnutls
+ else
+diff --git a/tools/depends/target/ffmpeg/CMakeLists.txt b/tools/depends/target/ffmpeg/CMakeLists.txt
+index fda6b0cac4..af3afa6b60 100644
+--- a/tools/depends/target/ffmpeg/CMakeLists.txt
++++ b/tools/depends/target/ffmpeg/CMakeLists.txt
+@@ -9,7 +9,7 @@ set(ffmpeg_conf "")
+ if(CROSSCOMPILING)
+   set(pkgconf "PKG_CONFIG_LIBDIR=${DEPENDS_PATH}/lib/pkgconfig")
+   list(APPEND ffmpeg_conf --pkg-config=${PKG_CONFIG_EXECUTABLE} --pkg-config-flags=--static)
+-  list(APPEND ffmpeg_conf --enable-cross-compile --cpu=${CPU} --arch=${CPU} --target-os=${OS})
++  list(APPEND ffmpeg_conf --enable-cross-compile --arch=${CPU} --target-os=${OS})
+   list(APPEND ffmpeg_conf --cc=${CMAKE_C_COMPILER} --cxx=${CMAKE_CXX_COMPILER} --ar=${CMAKE_AR})
+   message(STATUS "CROSS: ${ffmpeg_conf}")
+ endif()
+-- 
+2.18.0
+
diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index 5f9c95a7a0..e84f5c4014 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -40,19 +40,16 @@ menuconfig BR2_PACKAGE_KODI
 	depends on !BR2_TOOLCHAIN_USES_MUSL
 	depends on BR2_PACKAGE_KODI_EGL_GLES || BR2_PACKAGE_KODI_GL_EGL
 	depends on BR2_USE_WCHAR
-	depends on !BR2_STATIC_LIBS # python and others
+	depends on !BR2_STATIC_LIBS # gnutls, python and others
 	depends on BR2_PACKAGE_KODI_ARCH_SUPPORTS
 	depends on BR2_PACKAGE_PYTHON
 	depends on !BR2_PACKAGE_PYTHON_PYC_ONLY
 	select BR2_NEEDS_HOST_JAVA
 	select BR2_PACKAGE_BZIP2
 	select BR2_PACKAGE_EXPAT
-	select BR2_PACKAGE_FFMPEG
-	select BR2_PACKAGE_FFMPEG_GPL
-	select BR2_PACKAGE_FFMPEG_POSTPROC # postproc depends on GPL
-	select BR2_PACKAGE_FFMPEG_SWSCALE
 	select BR2_PACKAGE_FONTCONFIG
 	select BR2_PACKAGE_FREETYPE
+	select BR2_PACKAGE_GNUTLS
 	select BR2_PACKAGE_LIBASS
 	select BR2_PACKAGE_LIBCDIO
 	select BR2_PACKAGE_LIBCROSSGUID
diff --git a/package/kodi/kodi.hash b/package/kodi/kodi.hash
index 23a11ca494..8018c67a3a 100644
--- a/package/kodi/kodi.hash
+++ b/package/kodi/kodi.hash
@@ -1,5 +1,7 @@
 # Locally computed
 sha256 c8312fe92e5bab1cdac1da93d60baed88fa1574146c50c44e3c86d01671c2b1d  kodi-17.6-Krypton.tar.gz
+# Locally computed - ffmpeg
+sha256 7df8bce40765b39de5766ca9d08b5b9ac1f498c65c805c989461b907cee6b7c0  3.1.11-Krypton-17.5.tar.gz
 # Locally computed - libdvdcss
 sha256 b6eb2d929ff56cb051152c32010afc5e7cf5fe8c5ae32dca412a2b46b6b57e34  2f12236.tar.gz
 # Locally computed - libdvdnav
diff --git a/package/kodi/kodi.mk b/package/kodi/kodi.mk
index f3fa0b55b0..4242f2fccc 100644
--- a/package/kodi/kodi.mk
+++ b/package/kodi/kodi.mk
@@ -15,9 +15,9 @@ KODI_INSTALL_STAGING = YES
 KODI_DEPENDENCIES = \
 	bzip2 \
 	expat \
-	ffmpeg \
 	fontconfig \
 	freetype \
+	gnutls \
 	host-gawk \
 	host-gperf \
 	host-kodi-jsonschemabuilder \
@@ -47,11 +47,15 @@ KODI_DEPENDENCIES = \
 
 KODI_SUBDIR = project/cmake
 
+# taken from tools/depends/target/ffmpeg/FFMPEG-VERSION
+KODI_FFMPEG_VERSION = 3.1.11-Krypton-17.5
+KODI_EXTRA_DOWNLOADS += \
+	https://github.com/xbmc/FFmpeg/archive/$(KODI_FFMPEG_VERSION).tar.gz \
+
 KODI_LIBDVDCSS_VERSION = 2f12236
 KODI_LIBDVDNAV_VERSION = 981488f
 KODI_LIBDVDREAD_VERSION = 17d99db
-
-KODI_EXTRA_DOWNLOADS = \
+KODI_EXTRA_DOWNLOADS += \
 	https://github.com/xbmc/libdvdcss/archive/$(KODI_LIBDVDCSS_VERSION).tar.gz \
 	https://github.com/xbmc/libdvdnav/archive/$(KODI_LIBDVDNAV_VERSION).tar.gz \
 	https://github.com/xbmc/libdvdread/archive/$(KODI_LIBDVDREAD_VERSION).tar.gz
@@ -62,12 +66,12 @@ KODI_CONF_OPTS += \
 	-DENABLE_CCACHE=OFF \
 	-DENABLE_DVDCSS=ON \
 	-DENABLE_INTERNAL_CROSSGUID=OFF \
-	-DENABLE_INTERNAL_FFMPEG=OFF \
+	-DENABLE_INTERNAL_FFMPEG=ON \
+	-DFFMPEG_URL=$(KODI_DL_DIR)/$(KODI_FFMPEG_VERSION).tar.gz \
 	-DKODI_DEPENDSBUILD=OFF \
 	-DENABLE_OPENSSL=ON \
 	-DNATIVEPREFIX=$(HOST_DIR) \
-	-DDEPENDS_PATH=$(@D) \
-	-DWITH_FFMPEG=$(STAGING_DIR)/usr \
+	-DDEPENDS_PATH=$(STAGING_DIR)/usr \
 	-DWITH_TEXTUREPACKER=$(HOST_DIR)/bin/TexturePacker \
 	-DLIBDVDCSS_URL=$(KODI_DL_DIR)/$(KODI_LIBDVDCSS_VERSION).tar.gz \
 	-DLIBDVDNAV_URL=$(KODI_DL_DIR)/$(KODI_LIBDVDNAV_VERSION).tar.gz \
