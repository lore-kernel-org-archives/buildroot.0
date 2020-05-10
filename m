From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 10 May 2020 22:32:45 +0200
Subject: [Buildroot] [git commit branch/2020.02.x] package/ffmpeg: fix
 CVE-2020-12284
Message-ID: <20200510203114.81C8E814A1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6a4097caf512abeaf7d545bf6886e9e94b78b1bd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

cbs_jpeg_split_fragment in libavcodec/cbs_jpeg.c in FFmpeg 4.2.2 has a
heap-based buffer overflow during JPEG_MARKER_SOS handling because of a
missing length check.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit aab52d8722b21cb1410e8e8957f81565b29352bb)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...001-avcodec-cbs_jpeg-Check-length-for-SOS.patch | 33 ++++++++++++++++++++++
 package/ffmpeg/ffmpeg.mk                           |  3 ++
 2 files changed, 36 insertions(+)

diff --git a/package/ffmpeg/0001-avcodec-cbs_jpeg-Check-length-for-SOS.patch b/package/ffmpeg/0001-avcodec-cbs_jpeg-Check-length-for-SOS.patch
new file mode 100644
index 0000000000..343d496002
--- /dev/null
+++ b/package/ffmpeg/0001-avcodec-cbs_jpeg-Check-length-for-SOS.patch
@@ -0,0 +1,33 @@
+From 1812352d767ccf5431aa440123e2e260a4db2726 Mon Sep 17 00:00:00 2001
+From: Michael Niedermayer <michael@niedermayer.cc>
+Date: Sat, 7 Mar 2020 15:42:58 +0100
+Subject: [PATCH] avcodec/cbs_jpeg: Check length for SOS
+
+Fixes: out of array access
+Fixes: 19734/clusterfuzz-testcase-minimized-ffmpeg_BSF_TRACE_HEADERS_fuzzer-5673507031875584
+Fixes: 19353/clusterfuzz-testcase-minimized-ffmpeg_BSF_TRACE_HEADERS_fuzzer-5703944462663680
+
+Found-by: continuous fuzzing process https://github.com/google/oss-fuzz/tree/master/projects/ffmpeg
+Signed-off-by: Michael Niedermayer <michael@niedermayer.cc>
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Retrieved from:
+https://github.com/FFmpeg/FFmpeg/commit/1812352d767ccf5431aa440123e2e260a4db2726]
+---
+ libavcodec/cbs_jpeg.c | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/libavcodec/cbs_jpeg.c b/libavcodec/cbs_jpeg.c
+index 6bbce5f89b7..89512a26bbf 100644
+--- a/libavcodec/cbs_jpeg.c
++++ b/libavcodec/cbs_jpeg.c
+@@ -197,6 +197,9 @@ static int cbs_jpeg_split_fragment(CodedBitstreamContext *ctx,
+         if (marker == JPEG_MARKER_SOS) {
+             length = AV_RB16(frag->data + start);
+ 
++            if (length > end - start)
++                return AVERROR_INVALIDDATA;
++
+             data_ref = NULL;
+             data     = av_malloc(end - start +
+                                  AV_INPUT_BUFFER_PADDING_SIZE);
diff --git a/package/ffmpeg/ffmpeg.mk b/package/ffmpeg/ffmpeg.mk
index 96455cb978..d01a9620da 100644
--- a/package/ffmpeg/ffmpeg.mk
+++ b/package/ffmpeg/ffmpeg.mk
@@ -16,6 +16,9 @@ FFMPEG_LICENSE += and GPL-2.0+
 FFMPEG_LICENSE_FILES += COPYING.GPLv2
 endif
 
+# 0001-avcodec-cbs_jpeg-Check-length-for-SOS.patch
+FFMPEG_IGNORE_CVES += CVE-2020-12284
+
 FFMPEG_CONF_OPTS = \
 	--prefix=/usr \
 	--enable-avfilter \
