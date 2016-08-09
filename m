From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 9 Aug 2016 15:43:58 +0200
Subject: [Buildroot] [git commit] gst1-imx: fix V4L2 plugin build with
	kernel headers < 3.18
Message-ID: <20160809134402.6838A82113@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0b5553fef7d6afc77c6011c7d8d3ffab36c93397
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch fix the following build issue:
http://autobuild.buildroot.net/results/b46/b460a770c8f4e992d29dde8fe37fc23a949937f2

It has been submitted to the package maintainers:
https://github.com/Freescale/gstreamer-imx/pull/106

Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...1-v4l2src-Add-V4L2_PIX_FMT_XRGB555X-check.patch | 33 ++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/package/gstreamer1/gst1-imx/0001-v4l2src-Add-V4L2_PIX_FMT_XRGB555X-check.patch b/package/gstreamer1/gst1-imx/0001-v4l2src-Add-V4L2_PIX_FMT_XRGB555X-check.patch
new file mode 100644
index 0000000..67ac055
--- /dev/null
+++ b/package/gstreamer1/gst1-imx/0001-v4l2src-Add-V4L2_PIX_FMT_XRGB555X-check.patch
@@ -0,0 +1,33 @@
+From 1ca05ebb7cb63607d14983948105dd1483ea6b65 Mon Sep 17 00:00:00 2001
+From: Gary Bisson <gary.bisson@boundarydevices.com>
+Date: Tue, 9 Aug 2016 10:26:15 +0200
+Subject: [PATCH] v4l2src: Add V4L2_PIX_FMT_XRGB555X check
+
+Since this format was added in kernel 3.18, any prior version will
+fail to compile.
+
+Issue reported by Buildroot autobuilder with 3.10 kernel headers:
+http://autobuild.buildroot.net/results/b46/b460a770c8f4e992d29dde8fe37fc23a949937f2/
+
+Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
+---
+ src/v4l2src/v4l2src.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/src/v4l2src/v4l2src.c b/src/v4l2src/v4l2src.c
+index c77ae49..12b392a 100644
+--- a/src/v4l2src/v4l2src.c
++++ b/src/v4l2src/v4l2src.c
+@@ -447,7 +447,9 @@ static GstCaps *gst_imx_v4l2src_caps_for_current_setup(GstImxV4l2VideoSrc *v4l2s
+ 		case V4L2_PIX_FMT_RGB555:
+ 			gst_fmt = GST_VIDEO_FORMAT_RGB15;
+ 			break;
++#ifdef V4L2_PIX_FMT_XRGB555X
+ 		case V4L2_PIX_FMT_XRGB555X:
++#endif
+ 		case V4L2_PIX_FMT_RGB555X:
+ 			gst_fmt = GST_VIDEO_FORMAT_BGR15;
+ 			break;
+-- 
+2.8.1
+
