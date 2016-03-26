From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 26 Mar 2016 23:21:18 +0100
Subject: [Buildroot] [PATCH 13/18] package/ffmpeg: Add patch required by
	Kodi 16.0-Jarvis
In-Reply-To: <1459030883-15232-1-git-send-email-bernd.kuhls@t-online.de>
References: <1459030883-15232-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1459030883-15232-13-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 .../ffmpeg/0013-hevc-support-main10-decoding.patch | 77 ++++++++++++++++++++++
 1 file changed, 77 insertions(+)
 create mode 100644 package/ffmpeg/0013-hevc-support-main10-decoding.patch

diff --git a/package/ffmpeg/0013-hevc-support-main10-decoding.patch b/package/ffmpeg/0013-hevc-support-main10-decoding.patch
new file mode 100644
index 0000000..ef42394
--- /dev/null
+++ b/package/ffmpeg/0013-hevc-support-main10-decoding.patch
@@ -0,0 +1,77 @@
+From bbab50b66f61f38415ea1fbc93314712b90901e2 Mon Sep 17 00:00:00 2001
+From: Hendrik Leppkes <h.leppkes@gmail.com>
+Date: Sat, 30 Jan 2016 17:10:56 +0100
+Subject: [PATCH] hevc: support Main10 decoding through dxva2
+
+Patch is part of the Kodi patch set for ffmpeg, downloaded from
+https://github.com/xbmc/FFmpeg/.
+
+Patch was backported from upstream commit:
+http://git.videolan.org/?p=ffmpeg.git;a=commitdiff;h=ccb94789e2968329947f1c2e00d019f387f9c409
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ Changelog            |  4 ++++
+ libavcodec/hevc.c    | 13 ++++++++++++-
+ libavcodec/version.h |  2 +-
+ 3 files changed, 17 insertions(+), 2 deletions(-)
+
+diff --git a/Changelog b/Changelog
+index 2e1cd36..1c60cde 100644
+--- a/Changelog
++++ b/Changelog
+@@ -1,6 +1,10 @@
+ Entries are sorted chronologically from oldest to youngest within each release,
+ releases are sorted from youngest to oldest.
+ 
++version <next>:
++- DXVA2-accelerated HEVC Main10 decoding
++
++
+ version 3.0:
+ - Common Encryption (CENC) MP4 encoding and decoding support
+ - DXV decoding
+diff --git a/libavcodec/hevc.c b/libavcodec/hevc.c
+index 203f90a..0d53a33 100644
+--- a/libavcodec/hevc.c
++++ b/libavcodec/hevc.c
+@@ -347,7 +347,9 @@ static int set_sps(HEVCContext *s, const HEVCSPS *sps, enum AVPixelFormat pix_fm
+ 
+     export_stream_params(s->avctx, &s->ps, sps);
+ 
+-    if (sps->pix_fmt == AV_PIX_FMT_YUV420P || sps->pix_fmt == AV_PIX_FMT_YUVJ420P) {
++    switch (sps->pix_fmt) {
++    case AV_PIX_FMT_YUV420P:
++    case AV_PIX_FMT_YUVJ420P:
+ #if CONFIG_HEVC_DXVA2_HWACCEL
+         *fmt++ = AV_PIX_FMT_DXVA2_VLD;
+ #endif
+@@ -360,6 +362,15 @@ static int set_sps(HEVCContext *s, const HEVCSPS *sps, enum AVPixelFormat pix_fm
+ #if CONFIG_HEVC_VDPAU_HWACCEL
+         *fmt++ = AV_PIX_FMT_VDPAU;
+ #endif
++        break;
++    case AV_PIX_FMT_YUV420P10:
++#if CONFIG_HEVC_DXVA2_HWACCEL
++        *fmt++ = AV_PIX_FMT_DXVA2_VLD;
++#endif
++#if CONFIG_HEVC_D3D11VA_HWACCEL
++        *fmt++ = AV_PIX_FMT_D3D11VA_VLD;
++#endif
++        break;
+     }
+ 
+     if (pix_fmt == AV_PIX_FMT_NONE) {
+diff --git a/libavcodec/version.h b/libavcodec/version.h
+index 37a35e0..08140b0 100644
+--- a/libavcodec/version.h
++++ b/libavcodec/version.h
+@@ -30,7 +30,7 @@
+ 
+ #define LIBAVCODEC_VERSION_MAJOR  57
+ #define LIBAVCODEC_VERSION_MINOR  24
+-#define LIBAVCODEC_VERSION_MICRO 102
++#define LIBAVCODEC_VERSION_MICRO 103
+ 
+ #define LIBAVCODEC_VERSION_INT  AV_VERSION_INT(LIBAVCODEC_VERSION_MAJOR, \
+                                                LIBAVCODEC_VERSION_MINOR, \
-- 
2.8.0.rc3
