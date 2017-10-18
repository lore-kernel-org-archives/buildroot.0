From: Adam Duskett <aduskett@gmail.com>
Date: Tue, 17 Oct 2017 20:07:11 -0400
Subject: [Buildroot] [PATCH 1/1] freerdp: bump to 2.0.0-rc0
Message-ID: <20171018000711.29998-1-Adamduskett@outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Remove patches that has been merged/updated upstream

0001-fix-building-shared-libs.patch:
CmakeLists packages are rewritten.

0002-add-support-for-tz-package:
https://github.com/FreeRDP/FreeRDP/commit/dd93fd2b3de7bef3f4faebfe04448344a0a5ab88

0003-add-missing-define.patch:
https://github.com/FreeRDP/FreeRDP/commit/656b3be02d22a52957903e3c89660ffb0247307b

0004-ffmpeg30.patch:
https://github.com/FreeRDP/FreeRDP/commit/b7b66968f93f6ce75dd06d12638e14029bf3717b

Also add sha256sum for license file.

Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
---
 .../freerdp/0001-fix-building-shared-libs.patch    | 26 --------
 .../freerdp/0002-add-support-for-tz-package.patch  | 30 ---------
 package/freerdp/0003-add-missing-define.patch      | 44 -------------
 package/freerdp/0004-ffmpeg30.patch                | 74 ----------------------
 package/freerdp/freerdp.hash                       |  3 +-
 package/freerdp/freerdp.mk                         |  2 +-
 6 files changed, 3 insertions(+), 176 deletions(-)
 delete mode 100644 package/freerdp/0001-fix-building-shared-libs.patch
 delete mode 100644 package/freerdp/0002-add-support-for-tz-package.patch
 delete mode 100644 package/freerdp/0003-add-missing-define.patch
 delete mode 100644 package/freerdp/0004-ffmpeg30.patch

diff --git a/package/freerdp/0001-fix-building-shared-libs.patch b/package/freerdp/0001-fix-building-shared-libs.patch
deleted file mode 100644
index 8922cb15b6..0000000000
--- a/package/freerdp/0001-fix-building-shared-libs.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-winpr/tools: fix building shared libs
-
-libwinpr-makecert-tool.a is used to build libxfreerdp-server.so, so even
-if we are building a static libwinpr-makecert-tool.a library, we need to
-build it with -fPIC.
-
-Patch and commit log suggested by Samuel MARTIN.
-
-Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
-Cc: Samuel Martin <s.martin49@gmail.com>
-
-diff -durN freerdp-440916eae2e07463912d5fe507677e67096eb083.orig/winpr/tools/makecert/CMakeLists.txt freerdp-440916eae2e07463912d5fe507677e67096eb083/winpr/tools/makecert/CMakeLists.txt
---- freerdp-440916eae2e07463912d5fe507677e67096eb083.orig/winpr/tools/makecert/CMakeLists.txt	2014-08-25 06:52:43.000000000 -0700
-+++ freerdp-440916eae2e07463912d5fe507677e67096eb083/winpr/tools/makecert/CMakeLists.txt	2014-10-24 15:39:39.600319523 -0700
-@@ -37,4 +37,11 @@
- add_subdirectory(cli)
- 
- set_property(TARGET ${MODULE_NAME} PROPERTY FOLDER "WinPR/Tools")
-+
-+if(BUILD_SHARED_LIBS)
-+	# build libwinpr-makecert-tool.a with PIC because it is used to build
-+	# the shared library libxfreerdp-server.so.
-+	set_property(TARGET ${MODULE_NAME} PROPERTY POSITION_INDEPENDENT_CODE TRUE)
-+endif()
-+
- export_complex_library(LIBNAME ${MODULE_NAME})
diff --git a/package/freerdp/0002-add-support-for-tz-package.patch b/package/freerdp/0002-add-support-for-tz-package.patch
deleted file mode 100644
index 93e4afde17..0000000000
--- a/package/freerdp/0002-add-support-for-tz-package.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From 605d0a85183d2f9d5b0da5629cbadf01173bbb2f Mon Sep 17 00:00:00 2001
-From: Scott Fan <fancp2007@gmail.com>
-Date: Mon, 13 Jul 2015 15:01:17 +0800
-Subject: [PATCH] Add support for tz package
-
-Fixes error message while freerdp connected the remote desktop:
-Unable to detect time zone
-
-Signed-off-by: Scott Fan <fancp2007@gmail.com>
----
- libfreerdp/locale/timezone.c | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/libfreerdp/locale/timezone.c b/libfreerdp/locale/timezone.c
-index 3070f1f..4a06786 100644
---- a/libfreerdp/locale/timezone.c
-+++ b/libfreerdp/locale/timezone.c
-@@ -1539,7 +1539,8 @@ char* freerdp_get_unix_timezone_identifier()
- 	 * America/Montreal for example.
- 	 */
- 	
--	if ((len = readlink("/etc/localtime", buf, sizeof(buf) - 1)) != -1)
-+	if ((len = readlink("/etc/localtime", buf, sizeof(buf) - 1)) != -1 ||
-+	    (len = readlink("/etc/TZ", buf, sizeof(buf) - 1)) != -1)
- 	{
- 		int num = 0;
- 		int pos = len;
--- 
-2.4.5
-
diff --git a/package/freerdp/0003-add-missing-define.patch b/package/freerdp/0003-add-missing-define.patch
deleted file mode 100644
index a8f669e102..0000000000
--- a/package/freerdp/0003-add-missing-define.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-libwinpr/comm_seria: fix missing define
-
-FreeRDP uses CMSPAR, which is defined by glibc in bits/termios.h .
-
-glibc has two flavours of bits/termios.h: a genmeric one and an
-architecture-specific one. When installing, glibc will install the
-architecture-specific file if it exists, otherwise it installs the
-generic file. Only Alpha, MIPS, PPC and Sparc have their own
-bits/termios.h.
-
-The generic bits/termios.h, as well as the Alpha, PPC and Sparc flavours
-do define CMSPAR. However, the MIPS flavour does not define it.
-
-Define CMSPAR to the value from the generic value, which is also the
-value known to the Linux kernel for MIPS.
-
-Fixes:
-    http://autobuild.buildroot.org/results/0b4/0b4793f0bf9f4c57933897f3480054a4e06528ad/
-    http://autobuild.buildroot.org/results/7a2/7a2284d0a2987158fa2e78f789b07c8c6fcdb974/
-    http://autobuild.buildroot.org/results/387/3874088c3ccd4bbf76ea0c911ca1ef64c7dc9d1c/
-    ...
-
-Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
-Cc: Peter Korsgaard <jacmet@uclibc.org>
-Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-
-diff -durN freerdp-17834af7bb378f85a3b3cc4dcadaa5125a337e16.orig/winpr/libwinpr/comm/comm_serial_sys.c freerdp-17834af7bb378f85a3b3cc4dcadaa5125a337e16/winpr/libwinpr/comm/comm_serial_sys.c
---- freerdp-17834af7bb378f85a3b3cc4dcadaa5125a337e16.orig/winpr/libwinpr/comm/comm_serial_sys.c	2015-09-04 16:20:17.000000000 +0100
-+++ freerdp-17834af7bb378f85a3b3cc4dcadaa5125a337e16/winpr/libwinpr/comm/comm_serial_sys.c	2015-10-04 11:07:41.868513726 +0100
-@@ -27,6 +27,14 @@
- #include <fcntl.h>
- #include <sys/ioctl.h>
- #include <termios.h>
-+
-+/* glibc for MIPS has its own bits/termios.h which does not define
-+ * CMSPAR, so we vampirise the value from the generic bits/termios.h
-+ */
-+#ifndef CMSPAR
-+#define CMSPAR 010000000000
-+#endif
-+
- #include <unistd.h>
- 
- #include "comm_serial_sys.h"
diff --git a/package/freerdp/0004-ffmpeg30.patch b/package/freerdp/0004-ffmpeg30.patch
deleted file mode 100644
index a7998b7894..0000000000
--- a/package/freerdp/0004-ffmpeg30.patch
+++ /dev/null
@@ -1,74 +0,0 @@
-From b7b66968f93f6ce75dd06d12638e14029bf3717b Mon Sep 17 00:00:00 2001
-From: Alexis Ballier <aballier@gentoo.org>
-Date: Thu, 17 Sep 2015 10:36:44 +0200
-Subject: [PATCH] channels/tsmf/client/ffmpeg: Fix build with ffmpeg git
- master.
-
-Replace old, deprecated and now removed, APIs with their new equivalent while retaining backward compatibility with old ffmpeg versions.
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
-[Downloaded from upstream commit:
- https://github.com/FreeRDP/FreeRDP/commit/f8ceb3f6061583c650bd4f6cddc10bc0471f2076]
----
- channels/tsmf/client/ffmpeg/tsmf_ffmpeg.c | 17 ++++++++++++++++-
- 1 file changed, 16 insertions(+), 1 deletion(-)
-
-diff --git a/channels/tsmf/client/ffmpeg/tsmf_ffmpeg.c b/channels/tsmf/client/ffmpeg/tsmf_ffmpeg.c
-index d0880e7..e1b9f83 100644
---- a/channels/tsmf/client/ffmpeg/tsmf_ffmpeg.c
-+++ b/channels/tsmf/client/ffmpeg/tsmf_ffmpeg.c
-@@ -61,6 +61,9 @@
- #define AV_CODEC_ID_AC3 CODEC_ID_AC3
- #endif
- 
-+#if LIBAVUTIL_VERSION_MAJOR < 52
-+#define AV_PIX_FMT_YUV420P PIX_FMT_YUV420P
-+#endif
- 
- typedef struct _TSMFFFmpegDecoder
- {
-@@ -102,7 +105,11 @@ static BOOL tsmf_ffmpeg_init_video_stream(ITSMFDecoder* decoder, const TS_AM_MED
- 	mdecoder->codec_context->bit_rate = media_type->BitRate;
- 	mdecoder->codec_context->time_base.den = media_type->SamplesPerSecond.Numerator;
- 	mdecoder->codec_context->time_base.num = media_type->SamplesPerSecond.Denominator;
-+#if LIBAVCODEC_VERSION_MAJOR < 55
- 	mdecoder->frame = avcodec_alloc_frame();
-+#else
-+	mdecoder->frame = av_frame_alloc();
-+#endif
- 	return TRUE;
- }
- 
-@@ -328,7 +335,11 @@ static BOOL tsmf_ffmpeg_decode_video(ITSMFDecoder* decoder, const BYTE *data, UI
- 		if (!mdecoder->decoded_data)
- 			return FALSE;
- 
-+#if LIBAVCODEC_VERSION_MAJOR < 55
- 		frame = avcodec_alloc_frame();
-+#else
-+		frame = av_frame_alloc();
-+#endif
- 		avpicture_fill((AVPicture*) frame, mdecoder->decoded_data,
- 					   mdecoder->codec_context->pix_fmt,
- 					   mdecoder->codec_context->width, mdecoder->codec_context->height);
-@@ -400,7 +411,11 @@ static BOOL tsmf_ffmpeg_decode_audio(ITSMFDecoder* decoder, const BYTE *data, UI
- 									(int16_t *) dst, &frame_size, src, src_size);
- #else
- 		{
-+#if LIBAVCODEC_VERSION_MAJOR < 55
- 			AVFrame *decoded_frame = avcodec_alloc_frame();
-+#else
-+			AVFrame *decoded_frame = av_frame_alloc();
-+#endif
- 			int got_frame = 0;
- 			AVPacket pkt;
- 			av_init_packet(&pkt);
-@@ -480,7 +495,7 @@ static UINT32 tsmf_ffmpeg_get_decoded_format(ITSMFDecoder* decoder)
- 
- 	switch (mdecoder->codec_context->pix_fmt)
- 	{
--		case PIX_FMT_YUV420P:
-+		case AV_PIX_FMT_YUV420P:
- 			return RDP_PIXFMT_I420;
- 		default:
- 			WLog_ERR(TAG, "unsupported pixel format %u",
diff --git a/package/freerdp/freerdp.hash b/package/freerdp/freerdp.hash
index 2ced373b38..f54a03e942 100644
--- a/package/freerdp/freerdp.hash
+++ b/package/freerdp/freerdp.hash
@@ -1,2 +1,3 @@
 # Locally calculated
-sha256 1db496cca391f76382ef284db2d0306d5c15bf515ee2c964319c22272d969a32  freerdp-17834af7bb378f85a3b3cc4dcadaa5125a337e16.tar.gz
+sha256 68e0e3db638a9cc00b978815d9eabedffc23f4410dcaa7a7548bb751766d5b3e  freerdp-2.0.0-rc0.tar.gz
+sha256 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30 LICENSE
diff --git a/package/freerdp/freerdp.mk b/package/freerdp/freerdp.mk
index c3a3e55d05..573f10e02d 100644
--- a/package/freerdp/freerdp.mk
+++ b/package/freerdp/freerdp.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # Changeset on the master branch
-FREERDP_VERSION = 17834af7bb378f85a3b3cc4dcadaa5125a337e16
+FREERDP_VERSION = 2.0.0-rc0
 FREERDP_SITE = $(call github,FreeRDP,FreeRDP,$(FREERDP_VERSION))
 FREERDP_DEPENDENCIES = libglib2 openssl zlib
 FREERDP_LICENSE = Apache-2.0
-- 
2.13.6
