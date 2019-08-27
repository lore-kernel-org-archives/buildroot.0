From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 27 Aug 2019 11:47:00 +0300
Subject: [Buildroot] [PATCH] package/strace: fix build with v5.2 kernel
 headers
Message-ID: <8b26b1e1fe517cdb7e414a47c7b5d6733ea4d638.1566895620.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add upstream patch with a workaround to incompatible change in kernel
headers.

Regenerate the v4l2_pix_fmts.h header which is pre-generated from
v4l2_pix_fmts.in in the strace tarball.

Fixes:
http://autobuild.buildroot.net/results/5494c9e21e623a9b7d87e06d86ed5e95d696c21a/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 ...ts.in-work-around-V4L2_PIX_FMT_BGRA4.patch | 42 +++++++++++++++++++
 package/strace/strace.mk                      |  7 ++++
 2 files changed, 49 insertions(+)
 create mode 100644 package/strace/0001-xlat-v4l2_pix_fmts.in-work-around-V4L2_PIX_FMT_BGRA4.patch

diff --git a/package/strace/0001-xlat-v4l2_pix_fmts.in-work-around-V4L2_PIX_FMT_BGRA4.patch b/package/strace/0001-xlat-v4l2_pix_fmts.in-work-around-V4L2_PIX_FMT_BGRA4.patch
new file mode 100644
index 000000000000..3057b6ee0c11
--- /dev/null
+++ b/package/strace/0001-xlat-v4l2_pix_fmts.in-work-around-V4L2_PIX_FMT_BGRA4.patch
@@ -0,0 +1,42 @@
+From 60da39553ff92cf741bf7f54daff636bb28cbb3c Mon Sep 17 00:00:00 2001
+From: Eugene Syromyatnikov <evgsyr@gmail.com>
+Date: Wed, 24 Jul 2019 00:32:53 +0200
+Subject: [PATCH] xlat/v4l2_pix_fmts.in: work around V4L2_PIX_FMT_BGRA444 value
+ change
+
+* xlat/v4l2_pix_fmts.in: Undefine V4L2_PIX_FMT_BGRA444 as it has changed
+its value in Linux commit v5.2-rc5-403-g22be8233b34f.
+
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+---
+Upstream status: commit 60da39553ff92
+
+ xlat/v4l2_pix_fmts.in | 11 ++++++++++-
+ 1 file changed, 10 insertions(+), 1 deletion(-)
+
+diff --git a/xlat/v4l2_pix_fmts.in b/xlat/v4l2_pix_fmts.in
+index 3276d3818a12..e742d07ac51c 100644
+--- a/xlat/v4l2_pix_fmts.in
++++ b/xlat/v4l2_pix_fmts.in
+@@ -37,8 +37,17 @@ V4L2_PIX_FMT_RGB332  v4l2_fourcc('R', 'G', 'B', '1') /*  8  RGB-3-3-2     */
+ V4L2_PIX_FMT_H264_NO_SC v4l2_fourcc('A', 'V', 'C', '1') /* H264 without start codes */
+ V4L2_PIX_FMT_PWC1     v4l2_fourcc('P', 'W', 'C', '1') /* pwc older webcam */
+ V4L2_PIX_FMT_MPEG1    v4l2_fourcc('M', 'P', 'G', '1') /* MPEG-1 ES     */
+-V4L2_PIX_FMT_BGRA444 v4l2_fourcc('B', 'A', '1', '2') /* 16  bbbbgggg rrrraaaa */
+ V4L2_PIX_FMT_SGRBG12 v4l2_fourcc('B', 'A', '1', '2') /* 12  GRGR.. BGBG.. */
++#ifndef STRACE_WORKAROUND_FOR_V4L2_PIX_FMT_BGRA444
++# define STRACE_WORKAROUND_FOR_V4L2_PIX_FMT_BGRA444
++/*
++ * V4L2_PIX_FMT_BGRA444 was introduced in Linux commit v5.2-rc1~33^2~24 with
++ * the value of v4l2_fourcc('B', 'A', '1', '2') and changed in commit
++ * v5.2-rc5-403-g22be8233b34f as it clashed with V4L2_PIX_FMT_SGRBG12.
++ */
++# undef V4L2_PIX_FMT_BGRA444
++#endif
++V4L2_PIX_FMT_BGRA444 v4l2_fourcc('G', 'A', '1', '2') /* 16  bbbbgggg rrrraaaa */
+ V4L2_PIX_FMT_RGBA444 v4l2_fourcc('R', 'A', '1', '2') /* 16  rrrrgggg bbbbaaaa */
+ V4L2_PIX_FMT_ABGR444 v4l2_fourcc('A', 'B', '1', '2') /* 16  aaaabbbb ggggrrrr */
+ V4L2_PIX_FMT_SGBRG12 v4l2_fourcc('G', 'B', '1', '2') /* 12  GBGB.. RGRG.. */
+-- 
+2.23.0.rc1
+
diff --git a/package/strace/strace.mk b/package/strace/strace.mk
index 9049e52d4a73..0fdd7d66ffb0 100644
--- a/package/strace/strace.mk
+++ b/package/strace/strace.mk
@@ -11,6 +11,13 @@ STRACE_LICENSE = LGPL-2.1+
 STRACE_LICENSE_FILES = COPYING LGPL-2.1-or-later
 STRACE_CONF_OPTS = --enable-mpers=check
 
+# Regenerate v4l2_pix_fmts.h since we patch v4l2_pix_fmts.in
+define STRACE_GEN_V4L2_PIX_FMT
+	$(@D)/xlat/gen.sh $(@D)/xlat/v4l2_pix_fmts.in $(@D)/xlat/v4l2_pix_fmts.h
+endef
+
+STRACE_POST_PATCH_HOOKS += STRACE_GEN_V4L2_PIX_FMT
+
 # strace bundle some kernel headers to build libmpers, this mixes userspace
 # headers and kernel headers which break the build with musl.
 # The stddef.h from gcc is used instead of the one from musl.
-- 
2.23.0.rc1
