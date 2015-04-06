From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 6 Apr 2015 12:24:47 +0200
Subject: [Buildroot] [git commit] package/vlc: bump to 2.2.0
Message-ID: <20150406102526.E19C581995@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2e340beb613ab19d2e0467a477d1d4a4093e0327
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since we bumped FreeRDP, vlc no longer builds:
    http://autobuild.buildroot.org/results/8d9/8d91e3ffccee753135e9d0faa2b1ae00875606c9/
    http://autobuild.buildroot.org/results/e1f/e1f6526d1a4ac2c95998793efea2188faa708e29/

Fix that by bumping vlc to 2.2.0, as vlc-2.1.6will never support this
new version of FreeRDP.

Add dependency on kernel headers >= 3.7, because it needs DTV_STREAM_ID.
I stumbled on this whith a toolchain using headers forom 3.5, but only
tested with a toolchain with headers from 3.9, so there might be other
dependencies I missed on 3.8 or even 3.9. Let's wait for build failures
to find out...

There are quite a bunch of new --enable/disable options, so I've tried
to catter for all the changes. Most notably, there's no longer a flag to
enable.disable GL, it is now always auto-detected. Also, I've added
flags for GLES which we were missing so far, so we had to rely on the
build order to detect those dependencies (which was OK becasue libgles
sorts before vlc). Finally, SVG now has two flags to enable different
parts of SVG support, but they both depend on the same library, so
enable both.

There are new support for some features, like acceleration on RPI, but
that can well wait for further patches when someone is interested ;-) ,
vdpau HW accelearation on NVidia (we have a package for that, but not
able to test, so not added), vpx support (we have a libvpx package,
but I had no time to test), x262 and x265 support for which we're
currently lacking the packaging, and a few other exotic stuff...

Reported-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/vlc/0001-vlc-static.patch                  |    2 +-
 ...ac-add-check-for-libgcrypt-config-program.patch |   14 ++++----
 package/vlc/0004-libav.patch                       |   22 --------------
 package/vlc/Config.in                              |    7 +++-
 package/vlc/vlc.hash                               |    4 +-
 package/vlc/vlc.mk                                 |   30 ++++++++++++++------
 6 files changed, 36 insertions(+), 43 deletions(-)

diff --git a/package/vlc/0001-vlc-static.patch b/package/vlc/0001-vlc-static.patch
index faf7e80..f9aa079 100644
--- a/package/vlc/0001-vlc-static.patch
+++ b/package/vlc/0001-vlc-static.patch
@@ -13,7 +13,7 @@ diff -uNr vlc-2.1.5.org/bin/Makefile.am vlc-2.1.5/bin/Makefile.am
 diff -uNr vlc-2.1.5.org/Makefile.am vlc-2.1.5/Makefile.am
 --- vlc-2.1.5.org/Makefile.am	2014-02-14 18:40:50.000000000 +0100
 +++ vlc-2.1.5/Makefile.am	2014-08-03 12:29:52.059010766 +0200
-@@ -607,7 +607,7 @@
+@@ -932,7 +932,7 @@
  	cd lib && $(MAKE) $(AM_MAKEFLAGS) libvlc.la
  
  core: libvlc vlc$(EXEEXT)
diff --git a/package/vlc/0002-configure.ac-add-check-for-libgcrypt-config-program.patch b/package/vlc/0002-configure.ac-add-check-for-libgcrypt-config-program.patch
index 1ad6712..e9a7315 100644
--- a/package/vlc/0002-configure.ac-add-check-for-libgcrypt-config-program.patch
+++ b/package/vlc/0002-configure.ac-add-check-for-libgcrypt-config-program.patch
@@ -8,6 +8,9 @@ useful when cross-compiling), instead of using the one from the host
 system.
 
 Signed-off-by: Samuel Martin <s.martin49@gmail.com>
+[yann.morin.1998 at free.fr: adapt from 2.1.6 to 2.2.0; fix quoting in
+ AC_PATH_PROG]
+Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 ---
  configure.ac | 9 +++++----
  1 file changed, 5 insertions(+), 4 deletions(-)
@@ -16,11 +19,11 @@ diff --git a/configure.ac b/configure.ac
 index 02fb8aa..5a2267b 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -3943,16 +3943,17 @@ dnl
+@@ -4020,16 +4020,17 @@
  AC_ARG_ENABLE(libgcrypt,
    [  --disable-libgcrypt     gcrypt support (default enabled)])
  AS_IF([test "${enable_libgcrypt}" != "no"], [
-+  AC_PATH_PROG(GCRYPT_CONFIG,libgcrypt-config,libgcrypt-config)
++  AC_PATH_PROG([GCRYPT_CONFIG],[libgcrypt-config],[libgcrypt-config])
    AC_CHECK_DECL([GCRYCTL_SET_THREAD_CBS], [
 -    libgcrypt-config --version >/dev/null || \
 +    ${GCRYPT_CONFIG} --version >/dev/null || \
@@ -32,12 +35,9 @@ index 02fb8aa..5a2267b 100644
 +      GCRYPT_CFLAGS="`${GCRYPT_CONFIG} --cflags`"
 +      GCRYPT_LIBS="`${GCRYPT_CONFIG} --libs`"
      ], [
-       AC_MSG_ERROR([libgcrypt not found. Install libgcrypt or use --disable-libgcrypt. Have a nice day.])
+       AC_MSG_ERROR([libgcrypt not found. Install libgcrypt or pass --disable-libgcrypt.])
 -    ], [`libgcrypt-config --libs`])
 +    ], [`${GCRYPT_CONFIG} --libs`])
    ], [
-     AC_MSG_ERROR([libgcrypt version 1.1.94 or higher not found. Install libgcrypt or use --disable-libgcrypt. Have a nice day.])
+     AC_MSG_ERROR([libgcrypt version 1.1.94 or higher not found. Install libgcrypt or pass --disable-libgcrypt.])
    ], [#include <gcrypt.h>]
--- 
-1.8.5.4
-
diff --git a/package/vlc/0004-libav.patch b/package/vlc/0004-libav.patch
deleted file mode 100644
index c4842d7..0000000
--- a/package/vlc/0004-libav.patch
+++ /dev/null
@@ -1,22 +0,0 @@
-VLC works fine with ffmpeg 2.4, ported from upstream
-http://git.videolan.org/?p=vlc/vlc-2.2.git;a=blobdiff;f=configure.ac;h=21a9f89585297ebb98481a29719ef35a20f040db;hp=570da72136f4a5f8142fbab696ece53dd7f84b6a;hb=4ed2079b77b8aeb6d7885cc9828a90290018a7a4;hpb=18fbf7fd17a0f4e9cabcc2e34ac54b210ba08b27
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
-
-diff --git a/configure.ac b/configure.ac
-index 570da72..21a9f89 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -2285,9 +2285,9 @@ AC_ARG_ENABLE(avcodec,
- [  --enable-avcodec        libavcodec codec (default enabled)])
- AS_IF([test "${enable_avcodec}" != "no"], [
-   PKG_CHECK_MODULES(AVCODEC,[libavcodec >= 53.34.0 libavutil >= 51.22.0], [
--    PKG_CHECK_EXISTS([libavcodec < 56],, [
--      AC_MSG_ERROR([libavcodec versions 56 and later are not supported yet.])
--    ])
-+    dnl PKG_CHECK_EXISTS([libavcodec < 56],, [
-+    dnl   AC_MSG_ERROR([libavcodec versions 56 and later are not supported yet.])
-+    dnl ])
-     VLC_SAVE_FLAGS
-     CPPFLAGS="${CPPFLAGS} ${AVCODEC_CFLAGS}"
-     CFLAGS="${CFLAGS} ${AVCODEC_CFLAGS}"
diff --git a/package/vlc/Config.in b/package/vlc/Config.in
index 323582b..af96d08 100644
--- a/package/vlc/Config.in
+++ b/package/vlc/Config.in
@@ -9,6 +9,7 @@ config BR2_PACKAGE_VLC
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_WCHAR
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_7
 	select BR2_PACKAGE_LIBVORBIS if BR2_PACKAGE_OPUS
 	help
 	  VLC is a free and open source cross-platform multimedia player
@@ -17,5 +18,7 @@ config BR2_PACKAGE_VLC
 
 	  http://www.videolan.org/vlc/
 
-comment "vlc needs a uclibc snapshot or (e)glibc toolchain w/ C++, wchar, threads"
-	depends on !(BR2_UCLIBC_VERSION_SNAPSHOT || BR2_TOOLCHAIN_USES_GLIBC) || !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
+comment "vlc needs a uclibc snapshot or (e)glibc toolchain w/ C++, wchar, threads, headers >= 3.7"
+	depends on !(BR2_UCLIBC_VERSION_SNAPSHOT || BR2_TOOLCHAIN_USES_GLIBC) \
+		|| !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR \
+		|| !BR2_TOOLCHAIN_HAS_THREADS || !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_7
diff --git a/package/vlc/vlc.hash b/package/vlc/vlc.hash
index 718a0e6..7b84cef 100644
--- a/package/vlc/vlc.hash
+++ b/package/vlc/vlc.hash
@@ -1,2 +1,2 @@
-# From http://get.videolan.org/vlc/2.1.6/vlc-2.1.6.tar.xz.sha256
-sha256	1b76cf4b96e18cf224d21b91343f7e579790c5d3e499c8a230f53da695687c04	vlc-2.1.6.tar.xz
+# From http://download.videolan.org/pub/videolan/vlc/2.2.0/vlc-2.2.0.tar.xz.sha256
+sha256  5e0a27e248c47da723a696420aca3a4dd15cc3ed8cc81618d3f1dc8661b25517  vlc-2.2.0.tar.xz
diff --git a/package/vlc/vlc.mk b/package/vlc/vlc.mk
index 1499f8b..e77d4fa 100644
--- a/package/vlc/vlc.mk
+++ b/package/vlc/vlc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-VLC_VERSION = 2.1.6
+VLC_VERSION = 2.2.0
 VLC_SITE = http://get.videolan.org/vlc/$(VLC_VERSION)
 VLC_SOURCE = vlc-$(VLC_VERSION).tar.xz
 VLC_LICENSE = GPLv2+ LGPLv2.1+
@@ -28,9 +28,7 @@ VLC_CONF_OPTS += \
 	--disable-shout \
 	--disable-twolame \
 	--disable-dca \
-	--disable-dirac \
 	--disable-schroedinger \
-	--disable-quicksync \
 	--disable-fluidsynth \
 	--disable-zvbi \
 	--disable-kate \
@@ -42,7 +40,17 @@ VLC_CONF_OPTS += \
 	--disable-projectm \
 	--disable-vsxu \
 	--disable-mtp \
-	--disable-opencv
+	--disable-opencv \
+	--disable-mmal-codec \
+	--disable-mmal-vout \
+	--disable-dvdnav \
+	--disable-vpx \
+	--disable-jpeg \
+	--disable-x262 \
+	--disable-x265 \
+	--disable-mfx \
+	--disable-vdpau \
+	--disable-addonmanagermodules \
 
 # Building static and shared doesn't work, so force static off.
 ifeq ($(BR2_STATIC_LIBS),)
@@ -118,17 +126,21 @@ VLC_CONF_OPTS += --disable-flac
 endif
 
 ifeq ($(BR2_PACKAGE_FREERDP),y)
-VLC_CONF_OPTS += --enable-libfreerdp
+VLC_CONF_OPTS += --enable-freerdp
 VLC_DEPENDENCIES += freerdp
 else
 VLC_CONF_OPTS += --disable-libfreerdp
 endif
 
 ifeq ($(BR2_PACKAGE_HAS_LIBGL),y)
-VLC_CONF_OPTS += --enable-glx
 VLC_DEPENDENCIES += libgl
+endif
+
+ifeq ($(BR2_PACKAGE_HAS_LIBGLES),y)
+VLC_CONF_OPTS += --enable-gles1 --enable-gles2
+VLC_DEPENDENCIES += libgles
 else
-VLC_CONF_OPTS += --disable-glx
+VLC_CONF_OPTS += --disable-gles1 --disable-gles2
 endif
 
 ifeq ($(BR2_PACKAGE_OPUS),y)
@@ -183,10 +195,10 @@ VLC_CONF_OPTS += --disable-png
 endif
 
 ifeq ($(BR2_PACKAGE_LIBRSVG),y)
-VLC_CONF_OPTS += --enable-svg
+VLC_CONF_OPTS += --enable-svg --enable-svgdec
 VLC_DEPENDENCIES += librsvg
 else
-VLC_CONF_OPTS += --disable-svg
+VLC_CONF_OPTS += --disable-svg --disable-svgdec
 endif
 
 ifeq ($(BR2_PACKAGE_LIBTHEORA),y)
