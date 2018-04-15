From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 15 Apr 2018 22:05:32 +0200
Subject: [Buildroot] [git commit] ffmpeg: remove Blackfin related patch
Message-ID: <20180415200629.98011886C4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=81d494dfb051e495094e408cca15bc573ed793bd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

And renumber remaining patches.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../ffmpeg/0001-bfin-disable-optimization.patch    | 26 ----------------------
 ...g-pthreads.patch => 0001-ffmpeg-pthreads.patch} |  0
 2 files changed, 26 deletions(-)

diff --git a/package/ffmpeg/0001-bfin-disable-optimization.patch b/package/ffmpeg/0001-bfin-disable-optimization.patch
deleted file mode 100644
index 1d8a4f015d..0000000000
--- a/package/ffmpeg/0001-bfin-disable-optimization.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-Fix bfin compile error
-
-See gcc bug report:
-https://gcc.gnu.org/bugzilla/show_bug.cgi?id=77311
-
-Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
-
-diff -Nur ffmpeg-2.8.7.orig/libavcodec/hevcdsp_template.c ffmpeg-2.8.7/libavcodec/hevcdsp_template.c
---- ffmpeg-2.8.7.orig/libavcodec/hevcdsp_template.c	2016-03-29 04:25:16.000000000 +0200
-+++ ffmpeg-2.8.7/libavcodec/hevcdsp_template.c	2016-08-12 21:32:36.728178969 +0200
-@@ -1517,7 +1517,14 @@
- #define TQ2 pix[2  * xstride + 3 * ystride]
- #define TQ3 pix[3  * xstride + 3 * ystride]
- 
--static void FUNC(hevc_loop_filter_luma)(uint8_t *_pix,
-+// Blackfin gcc 6.1.x fails with
-+// unable to find a register to spill in class CCREGS
-+#if defined(__bfin__)
-+#define disable_opt __attribute__ ((optimize("O1")))
-+#else
-+#define disable_opt 
-+#endif
-+static void disable_opt FUNC(hevc_loop_filter_luma)(uint8_t *_pix,
-                                         ptrdiff_t _xstride, ptrdiff_t _ystride,
-                                         int beta, int *_tc,
-                                         uint8_t *_no_p, uint8_t *_no_q)
diff --git a/package/ffmpeg/0002-ffmpeg-pthreads.patch b/package/ffmpeg/0001-ffmpeg-pthreads.patch
similarity index 100%
rename from package/ffmpeg/0002-ffmpeg-pthreads.patch
rename to package/ffmpeg/0001-ffmpeg-pthreads.patch
