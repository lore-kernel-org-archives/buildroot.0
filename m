From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 31 May 2020 23:18:27 +0200
Subject: [Buildroot] [git commit branch/2020.02.x] package/ffmpeg: bump
 version to 4.2.3
Message-ID: <20200531211825.8F20985F53@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2c58fdd5bba8c1233f00c72be0ada83c44cb2efe
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

Removed patch included in upstream release, reformatted hashes.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit c5e932613eaed02d983af1889d2280f493b1a20e)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...001-avcodec-cbs_jpeg-Check-length-for-SOS.patch | 33 ----------------------
 package/ffmpeg/ffmpeg.hash                         |  8 +++---
 package/ffmpeg/ffmpeg.mk                           |  5 +---
 3 files changed, 5 insertions(+), 41 deletions(-)

diff --git a/package/ffmpeg/0001-avcodec-cbs_jpeg-Check-length-for-SOS.patch b/package/ffmpeg/0001-avcodec-cbs_jpeg-Check-length-for-SOS.patch
deleted file mode 100644
index 343d496002..0000000000
--- a/package/ffmpeg/0001-avcodec-cbs_jpeg-Check-length-for-SOS.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 1812352d767ccf5431aa440123e2e260a4db2726 Mon Sep 17 00:00:00 2001
-From: Michael Niedermayer <michael@niedermayer.cc>
-Date: Sat, 7 Mar 2020 15:42:58 +0100
-Subject: [PATCH] avcodec/cbs_jpeg: Check length for SOS
-
-Fixes: out of array access
-Fixes: 19734/clusterfuzz-testcase-minimized-ffmpeg_BSF_TRACE_HEADERS_fuzzer-5673507031875584
-Fixes: 19353/clusterfuzz-testcase-minimized-ffmpeg_BSF_TRACE_HEADERS_fuzzer-5703944462663680
-
-Found-by: continuous fuzzing process https://github.com/google/oss-fuzz/tree/master/projects/ffmpeg
-Signed-off-by: Michael Niedermayer <michael@niedermayer.cc>
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Retrieved from:
-https://github.com/FFmpeg/FFmpeg/commit/1812352d767ccf5431aa440123e2e260a4db2726]
----
- libavcodec/cbs_jpeg.c | 3 +++
- 1 file changed, 3 insertions(+)
-
-diff --git a/libavcodec/cbs_jpeg.c b/libavcodec/cbs_jpeg.c
-index 6bbce5f89b7..89512a26bbf 100644
---- a/libavcodec/cbs_jpeg.c
-+++ b/libavcodec/cbs_jpeg.c
-@@ -197,6 +197,9 @@ static int cbs_jpeg_split_fragment(CodedBitstreamContext *ctx,
-         if (marker == JPEG_MARKER_SOS) {
-             length = AV_RB16(frag->data + start);
- 
-+            if (length > end - start)
-+                return AVERROR_INVALIDDATA;
-+
-             data_ref = NULL;
-             data     = av_malloc(end - start +
-                                  AV_INPUT_BUFFER_PADDING_SIZE);
diff --git a/package/ffmpeg/ffmpeg.hash b/package/ffmpeg/ffmpeg.hash
index 1f68943fc7..35bd681326 100644
--- a/package/ffmpeg/ffmpeg.hash
+++ b/package/ffmpeg/ffmpeg.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256 cb754255ab0ee2ea5f66f8850e1bd6ad5cac1cd855d0a2f4990fb8c668b0d29c  ffmpeg-4.2.2.tar.xz
-sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING.GPLv2
-sha256 b634ab5640e258563c536e658cad87080553df6f34f62269a21d554844e58bfe  COPYING.LGPLv2.1
-sha256 cad1218c22121b169fb1380178ab7a0b33cb38a3ff6d3915b8533d1d954f3ce7  LICENSE.md
+sha256  9df6c90aed1337634c1fb026fb01c154c29c82a64ea71291ff2da9aacb9aad31  ffmpeg-4.2.3.tar.xz
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING.GPLv2
+sha256  b634ab5640e258563c536e658cad87080553df6f34f62269a21d554844e58bfe  COPYING.LGPLv2.1
+sha256  cad1218c22121b169fb1380178ab7a0b33cb38a3ff6d3915b8533d1d954f3ce7  LICENSE.md
diff --git a/package/ffmpeg/ffmpeg.mk b/package/ffmpeg/ffmpeg.mk
index d01a9620da..736aa5b4ba 100644
--- a/package/ffmpeg/ffmpeg.mk
+++ b/package/ffmpeg/ffmpeg.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FFMPEG_VERSION = 4.2.2
+FFMPEG_VERSION = 4.2.3
 FFMPEG_SOURCE = ffmpeg-$(FFMPEG_VERSION).tar.xz
 FFMPEG_SITE = http://ffmpeg.org/releases
 FFMPEG_INSTALL_STAGING = YES
@@ -16,9 +16,6 @@ FFMPEG_LICENSE += and GPL-2.0+
 FFMPEG_LICENSE_FILES += COPYING.GPLv2
 endif
 
-# 0001-avcodec-cbs_jpeg-Check-length-for-SOS.patch
-FFMPEG_IGNORE_CVES += CVE-2020-12284
-
 FFMPEG_CONF_OPTS = \
 	--prefix=/usr \
 	--enable-avfilter \
