From: Waldemar Brodkorb <wbx@openadk.org>
Date: Fri, 12 Aug 2016 22:41:10 +0200
Subject: [Buildroot] [PATCH] ffmpeg: fix bfin compile
Message-ID: <20160812204110.GA2187@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

A gcc bug is triggered when Os/O2/O3 is used to compile the function.
Just force O1 for the problematic function for Blackfin.

Fixes:
  http://autobuild.buildroot.net/results/1118d568959006b7f973761884fd3f4b63be19b1/

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 package/ffmpeg/0013-bfin-disable-optimization.patch | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)
 create mode 100644 package/ffmpeg/0013-bfin-disable-optimization.patch

diff --git a/package/ffmpeg/0013-bfin-disable-optimization.patch b/package/ffmpeg/0013-bfin-disable-optimization.patch
new file mode 100644
index 0000000..38630d9
--- /dev/null
+++ b/package/ffmpeg/0013-bfin-disable-optimization.patch
@@ -0,0 +1,19 @@
+diff -Nur ffmpeg-2.8.7.orig/libavcodec/hevcdsp_template.c ffmpeg-2.8.7/libavcodec/hevcdsp_template.c
+--- ffmpeg-2.8.7.orig/libavcodec/hevcdsp_template.c	2016-03-29 04:25:16.000000000 +0200
++++ ffmpeg-2.8.7/libavcodec/hevcdsp_template.c	2016-08-12 21:32:36.728178969 +0200
+@@ -1517,7 +1517,14 @@
+ #define TQ2 pix[2  * xstride + 3 * ystride]
+ #define TQ3 pix[3  * xstride + 3 * ystride]
+ 
+-static void FUNC(hevc_loop_filter_luma)(uint8_t *_pix,
++// Blackfin gcc 6.1.x fails with
++// unable to find a register to spill in class CCREGS
++#if defined(__bfin__)
++#define disable_opt __attribute__ ((optimize("O1")))
++#else
++#define disable_opt 
++#endif
++static void disable_opt FUNC(hevc_loop_filter_luma)(uint8_t *_pix,
+                                         ptrdiff_t _xstride, ptrdiff_t _ystride,
+                                         int beta, int *_tc,
+                                         uint8_t *_no_p, uint8_t *_no_q)
-- 
2.1.4
