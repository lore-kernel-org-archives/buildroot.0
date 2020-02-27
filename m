From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu, 27 Feb 2020 18:47:11 +0100
Subject: [Buildroot] [PATCH/next 3/6] package/mediastreamer: bump to version
 4.3.1
In-Reply-To: <20200227174714.3727844-1-fontaine.fabrice@gmail.com>
References: <20200227174714.3727844-1-fontaine.fabrice@gmail.com>
Message-ID: <20200227174714.3727844-3-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Drop first patch (already in version)
- Update second patch
- License is GPL-3.0+ since version 4.3.0 and
  https://gitlab.linphone.org/BC/public/mediastreamer2/commit/85094197cfaaaa8768a86562a0bce9d3d738d2da
- Switch to cmake-package and so drop third patch as autotools is not
  updated anymore (and fails to build due to missing po/Makefile.in.in)
- Add a mandatory dependency to mbedtls (to enable crypto support in
  bctoolbox)
- Add bcg729, jpegturbo, libgsm, libpcap, libsrtp and zxing-cpp optional
  dependencies
- Add a dependency on dynamic library as no pkg-config calls are done in
  cmake (static build with ffmepg and opus will fail for example)
- Drop libupnp optional dependency (not available anymore)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...mpilation-issue-with-latest-bctoobox.patch |  38 -----
 ...-nowebcam.c-fix-build-without-ffmpeg.patch |  55 +++++++
 ...FER_PADDING_SIZE-to-determine-paddin.patch |  24 +--
 ...ffmpeg-and-avcodec-function-conflict.patch |  42 -----
 package/mediastreamer/Config.in               |   9 +-
 package/mediastreamer/mediastreamer.hash      |   4 +-
 package/mediastreamer/mediastreamer.mk        | 153 ++++++++++++------
 7 files changed, 171 insertions(+), 154 deletions(-)
 delete mode 100644 package/mediastreamer/0001-fix-compilation-issue-with-latest-bctoobox.patch
 create mode 100644 package/mediastreamer/0001-src-videofilters-nowebcam.c-fix-build-without-ffmpeg.patch
 delete mode 100644 package/mediastreamer/0002-m4-fix-local-ffmpeg-and-avcodec-function-conflict.patch

diff --git a/package/mediastreamer/0001-fix-compilation-issue-with-latest-bctoobox.patch b/package/mediastreamer/0001-fix-compilation-issue-with-latest-bctoobox.patch
deleted file mode 100644
index 7bc9733c85..0000000000
--- a/package/mediastreamer/0001-fix-compilation-issue-with-latest-bctoobox.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From 26f884bf977977041fe6f98a0af186be1580bf22 Mon Sep 17 00:00:00 2001
-From: Simon Morlat <simon.morlat@linphone.org>
-Date: Thu, 29 Sep 2016 15:26:18 +0200
-Subject: [PATCH] fix compilation issue with latest bctoobox
-
-[Upstream commit https://github.com/BelledonneCommunications/mediastreamer2/commit/26f884bf977977041fe6f98a0af186be1580bf22]
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- configure.ac           | 2 +-
- src/crypto/dtls_srtp.c | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 7ab20a08f..244d87275 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -1116,7 +1116,7 @@ fi
- 
- 
- dnl check bctoolbox library
--PKG_CHECK_MODULES(BCTOOLBOX, bctoolbox >= 0.0.0, found_bctoolbox=true, found_bctoolbox=false)
-+PKG_CHECK_MODULES(BCTOOLBOX, bctoolbox >= 0.4.0, found_bctoolbox=true, found_bctoolbox=false)
- if test "$found_bctoolbox" = "true" ; then
- 	LIBS="$LIBS $BCTOOLBOX_LIBS"
- 	CFLAGS="$CFLAGS $BCTOOLBOX_CFLAGS"
-diff --git a/src/crypto/dtls_srtp.c b/src/crypto/dtls_srtp.c
-index e2c8e1c44..fd37eb5cb 100644
---- a/src/crypto/dtls_srtp.c
-+++ b/src/crypto/dtls_srtp.c
-@@ -705,7 +705,7 @@ static int ms_dtls_srtp_initialise_bctbx_dtls_context(DtlsBcToolBoxContext *dtls
- 	bctbx_ssl_config_set_authmode(dtlsContext->ssl_config, BCTBX_SSL_VERIFY_OPTIONAL);
- 	bctbx_ssl_config_set_own_cert( dtlsContext->ssl_config, dtlsContext->crt, dtlsContext->pkey );
- 	/* This is useless as peer would certainly be a self signed certificate and we won't verify it but avoid runtime warnings */
--	bctbx_ssl_config_set_ca_chain(dtlsContext->ssl_config, dtlsContext->crt, NULL);
-+	bctbx_ssl_config_set_ca_chain(dtlsContext->ssl_config, dtlsContext->crt);
- 
- 	/* we are not ready yet to actually start the ssl context, this will be done by calling bctbx_ssl_setup when stream starts */
- 	return 0;
diff --git a/package/mediastreamer/0001-src-videofilters-nowebcam.c-fix-build-without-ffmpeg.patch b/package/mediastreamer/0001-src-videofilters-nowebcam.c-fix-build-without-ffmpeg.patch
new file mode 100644
index 0000000000..8e7812c389
--- /dev/null
+++ b/package/mediastreamer/0001-src-videofilters-nowebcam.c-fix-build-without-ffmpeg.patch
@@ -0,0 +1,55 @@
+From 342f59f1603f759b6dd90754f8dba14d08947f55 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Thu, 27 Feb 2020 16:18:35 +0100
+Subject: [PATCH] src/videofilters/nowebcam.c: fix build without ffmpeg or jpeg
+
+jpeg2yuv is only defined if ffmpeg or turbojpeg is available
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ CMakeLists.txt              | 3 +++
+ src/videofilters/nowebcam.c | 4 ++++
+ 2 files changed, 7 insertions(+)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 0efc1a5f..6668db2b 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -336,7 +336,10 @@ if(ENABLE_JPEG)
+ 	if(NOT TURBOJPEG_FOUND)
+ 		message(WARNING "Could not find libturbo-jpeg, mediastreamer2 will be compiled without LibJpeg-Turbo")
+ 		set(ENABLE_JPEG OFF CACHE BOOL "Enable JPEG support" FORCE)
++		add_definitions(-DNO_JPEG)
+ 	endif()
++else()
++	add_definitions(-DNO_JPEG)
+ endif()
+ if(ENABLE_QRCODE)
+ 	find_package(Zxing)
+diff --git a/src/videofilters/nowebcam.c b/src/videofilters/nowebcam.c
+index a2344dcd..afb0d7b1 100644
+--- a/src/videofilters/nowebcam.c
++++ b/src/videofilters/nowebcam.c
+@@ -107,7 +107,9 @@ static mblk_t *_ms_load_jpeg_as_yuv(const char *jpgpath, MSVideoSize *reqsize) {
+ 	if (err != st_sizel) {
+ 		  ms_error("Could not read as much as wanted !");
+ 	}
++#if !(defined(NO_FFMPEG) && defined(NO_JPEG))
+ 	m = jpeg2yuv(jpgbuf, st_sizel, reqsize);
++#endif
+ 	ms_free(jpgbuf);
+ 	if (m == NULL) {
+ 		CloseHandle(fd);
+@@ -140,7 +142,9 @@ static mblk_t *_ms_load_jpeg_as_yuv(const char *jpgpath, MSVideoSize *reqsize) {
+ 		if (err != statbuf.st_size) {
+ 			ms_error("Could not read as much as wanted: %i<>%li !", err, (long)statbuf.st_size);
+ 		}
++#if !(defined(NO_FFMPEG) && defined(NO_JPEG))
+ 		m = jpeg2yuv(jpgbuf,statbuf.st_size,reqsize);
++#endif
+ 		ms_free(jpgbuf);
+ 		if (m == NULL) {
+ 			close(fd);
+-- 
+2.25.0
+
diff --git a/package/mediastreamer/0002-Use-AV_INPUT_BUFFER_PADDING_SIZE-to-determine-paddin.patch b/package/mediastreamer/0002-Use-AV_INPUT_BUFFER_PADDING_SIZE-to-determine-paddin.patch
index 792c3eeb44..fc66e9a9f9 100644
--- a/package/mediastreamer/0002-Use-AV_INPUT_BUFFER_PADDING_SIZE-to-determine-paddin.patch
+++ b/package/mediastreamer/0002-Use-AV_INPUT_BUFFER_PADDING_SIZE-to-determine-paddin.patch
@@ -17,6 +17,8 @@ Downloaded from
 https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=901735
 
 Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+[Fabrice: updated for 4.3.1]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 ---
  src/utils/ffmpeg-priv.h     | 4 ++++
  src/videofilters/nowebcam.c | 4 ++--
@@ -37,28 +39,6 @@ index c0745a9a..d59ea0e1 100644
  #ifndef HAVE_FUN_avcodec_encode_video2
  int avcodec_encode_video2 (AVCodecContext *avctx, AVPacket *avpkt, const AVFrame *frame, int *got_packet_ptr);
  #endif
-diff --git a/src/videofilters/nowebcam.c b/src/videofilters/nowebcam.c
-index bd2ca838..4783de05 100644
---- a/src/videofilters/nowebcam.c
-+++ b/src/videofilters/nowebcam.c
-@@ -32,7 +32,7 @@ Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.
- #ifndef NO_FFMPEG
- #include "ffmpeg-priv.h"
- #else
--#define FF_INPUT_BUFFER_PADDING_SIZE 32
-+#define AV_INPUT_BUFFER_PADDING_SIZE 32
- #endif
- 
- #if TARGET_OS_IPHONE
-@@ -248,7 +248,7 @@ static mblk_t *_ms_load_jpeg_as_yuv(const char *jpgpath, MSVideoSize *reqsize){
- 			ms_error("Cannot load %s",jpgpath);
- 			return NULL;
- 		}
--		jpgbuf=(uint8_t*)ms_malloc0(statbuf.st_size + FF_INPUT_BUFFER_PADDING_SIZE);
-+		jpgbuf=(uint8_t*)ms_malloc0(statbuf.st_size + AV_INPUT_BUFFER_PADDING_SIZE);
- 		if (jpgbuf==NULL)
- 		{
- 			close(fd);
 -- 
 2.18.0
 
diff --git a/package/mediastreamer/0002-m4-fix-local-ffmpeg-and-avcodec-function-conflict.patch b/package/mediastreamer/0002-m4-fix-local-ffmpeg-and-avcodec-function-conflict.patch
deleted file mode 100644
index cdaa0fab24..0000000000
--- a/package/mediastreamer/0002-m4-fix-local-ffmpeg-and-avcodec-function-conflict.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From d12e74a559602b3dff9a6bf38fcbb139535c9c9c Mon Sep 17 00:00:00 2001
-From: Giulio Benetti <giulio.benetti@micronovasrl.com>
-Date: Mon, 3 Sep 2018 20:27:00 +0200
-Subject: [PATCH] m4: fix local ffmpeg and avcodec function conflict
-
-Autotools miss avcodec function check.
-This is due to linker library list order, -ldrm is appended too early
-respect to -lavutil. This results in missing drm library functions for
-avcodec functions:
-- drmGetVersion()
-- drmFreeVersion()
-So these functions:
-- avcodec_get_context_defaults3
-- avcodec_open2
-- avcodec_encode_video2
-can't link correctly during check and they seem not to be present.
-Then macros HAVE_FUN_avcodec_* are not defined in mediastreamer-config.h
-So local avcodec functions conflict with real avcodec library functions.
-
-In acinclude.m4 file, swap $FFMPEG_LIBS and -lavutil if avcodec is found.
-
-Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
----
- acinclude.m4 | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/acinclude.m4 b/acinclude.m4
-index 6c31ed82..89ff6643 100644
---- a/acinclude.m4
-+++ b/acinclude.m4
-@@ -110,7 +110,7 @@ AC_DEFUN([MS_CHECK_VIDEO],[
- 			if test x$avcodec_found = xno ; then
- 			   AC_MSG_WARN([Could not find libavcodec (from ffmpeg) headers and library.])
- 			else
--			   FFMPEG_LIBS="$FFMPEG_LIBS -lavutil"
-+			   FFMPEG_LIBS="-lavutil $FFMPEG_LIBS"
- 			fi
- 			
- 			
--- 
-2.17.1
-
diff --git a/package/mediastreamer/Config.in b/package/mediastreamer/Config.in
index 91861c16c1..b3ba5a0cb0 100644
--- a/package/mediastreamer/Config.in
+++ b/package/mediastreamer/Config.in
@@ -1,8 +1,10 @@
 config BR2_PACKAGE_MEDIASTREAMER
 	bool "mediastreamer"
-	depends on BR2_INSTALL_LIBSTDCPP # ortp
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on !BR2_STATIC_LIBS
 	depends on BR2_TOOLCHAIN_HAS_THREADS # ortp
 	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # ortp
+	select BR2_PACKAGE_MBEDTLS
 	select BR2_PACKAGE_ORTP
 	help
 	  Mediastreamer is a powerful and lightweighted streaming
@@ -14,8 +16,9 @@ config BR2_PACKAGE_MEDIASTREAMER
 
 	  http://www.linphone.org/technical-corner/mediastreamer2
 
-comment "mediastreamer needs a toolchain w/ threads, C++"
-	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
+comment "mediastreamer needs a toolchain w/ threads, C++, dynamic library"
+	depends on !BR2_INSTALL_LIBSTDCPP || \
+		!BR2_TOOLCHAIN_HAS_THREADS || !BR2_STATIC_LIBS
 
 comment "mediastreamer needs a toolchain not affected by GCC bug 64735"
 	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_64735
diff --git a/package/mediastreamer/mediastreamer.hash b/package/mediastreamer/mediastreamer.hash
index 8ebf64af09..5b72426781 100644
--- a/package/mediastreamer/mediastreamer.hash
+++ b/package/mediastreamer/mediastreamer.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  1144849c0c96abafb1153adf56109f0f195a9e4a53cf28cb611bbca7a9012c1a  mediastreamer-2.14.0.tar.gz
-sha256  ba9ed2269151ad63b922598f3c5c19ddf781b2bbb6cb843ed9f085ecd1679c5d  COPYING
+sha256  b7251495c0bf2c71508b7cdf29999326af0bd215ec4c647b3ebb60796ee72503  mediastreamer-4.3.1.tar.gz
+sha256  1b3782ccad7b8614100cda30d3faf42fc39f2e97932908c543005053b654ca68  LICENSE.txt
diff --git a/package/mediastreamer/mediastreamer.mk b/package/mediastreamer/mediastreamer.mk
index 3c9756936a..dcec66dfcd 100644
--- a/package/mediastreamer/mediastreamer.mk
+++ b/package/mediastreamer/mediastreamer.mk
@@ -4,110 +4,169 @@
 #
 ################################################################################
 
-MEDIASTREAMER_VERSION = 2.14.0
-MEDIASTREAMER_SITE = http://download.savannah.nongnu.org/releases/linphone/mediastreamer
+MEDIASTREAMER_VERSION = 4.3.1
+MEDIASTREAMER_SITE = \
+	https://gitlab.linphone.org/BC/public/mediastreamer2/-/archive/$(MEDIASTREAMER_VERSION)
+MEDIASTREAMER_LICENSE = GPL-3.0+
+MEDIASTREAMER_LICENSE_FILES = LICENSE.txt
 MEDIASTREAMER_INSTALL_STAGING = YES
-# host-vim needed for the xxd utility
-MEDIASTREAMER_DEPENDENCIES = host-intltool host-pkgconf ortp host-gettext host-vim
-# tests fail linking on some architectures, so disable them
-MEDIASTREAMER_CONF_OPTS = --disable-tests --disable-glx --disable-strict
-MEDIASTREAMER_LICENSE = GPL-2.0+
-MEDIASTREAMER_LICENSE_FILES = COPYING
-
-# patching configure.ac
-MEDIASTREAMER_AUTORECONF = YES
+MEDIASTREAMER_DEPENDENCIES = ortp
+MEDIASTREAMER_CONF_OPTS = \
+	-DENABLE_DOC=OFF \
+	-DENABLE_GL=OFF \
+	-DENABLE_GLX=OFF \
+	-DENABLE_MKV=OFF \
+	-DENABLE_SOUND=OFF \
+	-DENABLE_STRICT=OFF \
+	-DENABLE_TOOLS=OFF \
+	-DENABLE_UNIT_TESTS=OFF \
+	-DENABLE_ZRTP=OFF
 
 ifeq ($(BR2_PACKAGE_ALSA_LIB_MIXER)$(BR2_PACKAGE_ALSA_LIB_PCM),yy)
-MEDIASTREAMER_CONF_OPTS += --enable-alsa
+MEDIASTREAMER_CONF_OPTS += \
+	-DENABLE_ALSA=ON \
+	-DENABLE_SOUND=ON
 MEDIASTREAMER_DEPENDENCIES += alsa-lib
 else
-MEDIASTREAMER_CONF_OPTS += --disable-alsa
+MEDIASTREAMER_CONF_OPTS += -DENABLE_ALSA=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_BCG729),y)
+MEDIASTREAMER_CONF_OPTS += -DENABLE_G729=ON
+MEDIASTREAMER_DEPENDENCIES += bcg729
+else
+MEDIASTREAMER_CONF_OPTS += -DENABLE_G729=OFF
 endif
 
-ifeq ($(BR2_PACKAGE_LIBUPNP),y)
-MEDIASTREAMER_CONF_OPTS += --enable-upnp
-MEDIASTREAMER_DEPENDENCIES += libupnp
+ifeq ($(BR2_PACKAGE_JPEG_TURBO),y)
+MEDIASTREAMER_CONF_OPTS += -DENABLE_JPEG=ON
+MEDIASTREAMER_DEPENDENCIES += jpeg
 else
-MEDIASTREAMER_CONF_OPTS += --disable-upnp
+MEDIASTREAMER_CONF_OPTS += -DENABLE_JPEG=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_LIBGSM),y)
+MEDIASTREAMER_CONF_OPTS += -DENABLE_GSM=ON
+MEDIASTREAMER_DEPENDENCIES += libgsm
+else
+MEDIASTREAMER_CONF_OPTS += -DENABLE_GSM=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_LIBPCAP),y)
+MEDIASTREAMER_CONF_OPTS += -DENABLE_PCAP=ON
+MEDIASTREAMER_DEPENDENCIES += libpcap
+else
+MEDIASTREAMER_CONF_OPTS += -DENABLE_PCAP=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_LIBSRTP),y)
+MEDIASTREAMER_CONF_OPTS += -DENABLE_SRTP=ON
+MEDIASTREAMER_DEPENDENCIES += libsrtp
+else
+MEDIASTREAMER_CONF_OPTS += -DENABLE_SRTP=OFF
 endif
 
 ifeq ($(BR2_PACKAGE_LIBVPX),y)
-MEDIASTREAMER_CONF_OPTS += --enable-vp8
+MEDIASTREAMER_CONF_OPTS += -DENABLE_VPX=ON
 MEDIASTREAMER_DEPENDENCIES += libvpx
 else
-MEDIASTREAMER_CONF_OPTS += --disable-vp8
+MEDIASTREAMER_CONF_OPTS += -DENABLE_VPX=OFF
 endif
 
 ifeq ($(BR2_PACKAGE_OPUS),y)
-MEDIASTREAMER_CONF_OPTS += --enable-opus
+MEDIASTREAMER_CONF_OPTS += -DENABLE_OPUS=ON
 MEDIASTREAMER_DEPENDENCIES += opus
 else
-MEDIASTREAMER_CONF_OPTS += --disable-opus
+MEDIASTREAMER_CONF_OPTS += -DENABLE_OPUS=OFF
 endif
 
-# portaudio backend needs speex as well
-ifeq ($(BR2_PACKAGE_PORTAUDIO)$(BR2_PACKAGE_SPEEX)$(BR2_PACKAGE_SPEEXDSP),yyy)
-MEDIASTREAMER_CONF_OPTS += --enable-portaudio
-MEDIASTREAMER_DEPENDENCIES += portaudio speex
+ifeq ($(BR2_PACKAGE_PORTAUDIO),y)
+MEDIASTREAMER_CONF_OPTS += \
+	-DENABLE_PORTAUDIO=ON \
+	-DENABLE_SOUND=ON
+MEDIASTREAMER_DEPENDENCIES += portaudio
 else
-MEDIASTREAMER_CONF_OPTS += --disable-portaudio
+MEDIASTREAMER_CONF_OPTS += -DENABLE_PORTAUDIO=OFF
 endif
 
 ifeq ($(BR2_PACKAGE_PULSEAUDIO),y)
-MEDIASTREAMER_CONF_OPTS += --enable-pulseaudio
+MEDIASTREAMER_CONF_OPTS += \
+	-DENABLE_PULSEAUDIO=ON \
+	-DENABLE_SOUND=ON
 MEDIASTREAMER_DEPENDENCIES += pulseaudio
 else
-MEDIASTREAMER_CONF_OPTS += --disable-pulseaudio
+MEDIASTREAMER_CONF_OPTS += -DENABLE_PULSEAUDIO=OFF
 endif
 
-ifeq ($(BR2_PACKAGE_SPEEX)$(BR2_PACKAGE_SPEEXDSP),yy)
-MEDIASTREAMER_CONF_OPTS += --enable-speex
+ifeq ($(BR2_PACKAGE_SPEEX),y)
+MEDIASTREAMER_CONF_OPTS += -DENABLE_SPEEX_CODEC=ON
 MEDIASTREAMER_DEPENDENCIES += speex
 else
-MEDIASTREAMER_CONF_OPTS += --disable-speex
+MEDIASTREAMER_CONF_OPTS += -DENABLE_SPEEX_CODEC=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_SPEEXDSP),y)
+MEDIASTREAMER_CONF_OPTS += -DENABLE_SPEEX_DSP=ON
+MEDIASTREAMER_DEPENDENCIES += speexdsp
+else
+MEDIASTREAMER_CONF_OPTS += -DENABLE_SPEEX_DSP=OFF
 endif
 
 ifeq ($(BR2_PACKAGE_FFMPEG_SWSCALE),y)
-MEDIASTREAMER_CONF_OPTS += --enable-ffmpeg
+MEDIASTREAMER_CONF_OPTS += -DENABLE_FFMPEG=ON
 MEDIASTREAMER_DEPENDENCIES += ffmpeg
 else
-MEDIASTREAMER_CONF_OPTS += --disable-ffmpeg
+MEDIASTREAMER_CONF_OPTS += -DENABLE_FFMPEG=OFF
 endif
 
 ifeq ($(BR2_PACKAGE_SDL),y)
-MEDIASTREAMER_CONF_OPTS += --enable-sdl
+MEDIASTREAMER_CONF_OPTS += -DENABLE_SDL=ON
 MEDIASTREAMER_DEPENDENCIES += sdl
 else
-MEDIASTREAMER_CONF_OPTS += --disable-sdl
+MEDIASTREAMER_CONF_OPTS += -DENABLE_SDL=OFF
 endif
 
-# mediastreamer assumes SDL has X11 support if --enable-x11 (and X11 support
-# is only used for SDL output)
-ifeq ($(BR2_PACKAGE_SDL_X11),y)
-MEDIASTREAMER_CONF_OPTS += --enable-x11
+ifeq ($(BR2_PACKAGE_XLIB_LIBX11),y)
+MEDIASTREAMER_CONF_OPTS += -DENABLE_X11=ON
+MEDIASTREAMER_DEPENDENCIES += xlib_libX11
 else
-MEDIASTREAMER_CONF_OPTS += --disable-x11
+MEDIASTREAMER_CONF_OPTS += -DENABLE_X11=OFF
 endif
 
 ifeq ($(BR2_PACKAGE_XLIB_LIBXV),y)
-MEDIASTREAMER_CONF_OPTS += --enable-xv
+MEDIASTREAMER_CONF_OPTS += -DENABLE_XV=ON
 MEDIASTREAMER_DEPENDENCIES += xlib_libXv
 else
-MEDIASTREAMER_CONF_OPTS += --disable-xv
+MEDIASTREAMER_CONF_OPTS += -DENABLE_XV=OFF
 endif
 
 ifeq ($(BR2_PACKAGE_LIBTHEORA),y)
-MEDIASTREAMER_CONF_OPTS += --enable-theora
+MEDIASTREAMER_CONF_OPTS += -DENABLE_THEORA=ON
 MEDIASTREAMER_DEPENDENCIES += libtheora
 else
-MEDIASTREAMER_CONF_OPTS += --disable-theora
+MEDIASTREAMER_CONF_OPTS += -DENABLE_THEORA=OFF
 endif
 
 ifeq ($(BR2_PACKAGE_LIBV4L),y)
-MEDIASTREAMER_CONF_OPTS += --enable-libv4l1 --enable-libv4l2
+MEDIASTREAMER_CONF_OPTS += -DENABLE_V4L=ON
 MEDIASTREAMER_DEPENDENCIES += libv4l
 else
-MEDIASTREAMER_CONF_OPTS += --disable-libv4l1 --disable-libv4l2
+MEDIASTREAMER_CONF_OPTS += -DENABLE_V4L=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_ZXING_CPP),y)
+MEDIASTREAMER_CONF_OPTS += -DENABLE_QRCODE=ON
+MEDIASTREAMER_DEPENDENCIES += zxing-cpp
+else
+MEDIASTREAMER_CONF_OPTS += -DENABLE_QRCODE=OFF
+endif
+
+ifeq ($(BR2_STATIC_LIBS),y)
+MEDIASTREAMER_CONF_OPTS += -DENABLE_SHARED=OFF -DENABLE_STATIC=ON
+else ifeq ($(BR2_SHARED_STATIC_LIBS),y)
+MEDIASTREAMER_CONF_OPTS += -DENABLE_SHARED=ON -DENABLE_STATIC=ON
+else ifeq ($(BR2_SHARED_LIBS),y)
+MEDIASTREAMER_CONF_OPTS += -DENABLE_SHARED=ON -DENABLE_STATIC=OFF
 endif
 
-$(eval $(autotools-package))
+$(eval $(cmake-package))
-- 
2.25.0
