From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 30 Dec 2020 23:57:39 +0100
Subject: [Buildroot] [git commit] package/gstreamer1/gst1-plugins-base: fix
 build with gcc 4.8
Message-ID: <20201230224009.A8C9A8423D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1e36a0e29b845b8c83b8f2e58966d4746051d05f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix build of gst1-plugins-base in version 1.18.2 with gcc 4.8

Fixes:
 - http://autobuild.buildroot.org/results/91f8a78a012fb30f323d82d1d7094f28d018a768

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Reviewed-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...t-video-gstvideoaggregator.c-fix-build-wi.patch | 45 ++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/package/gstreamer1/gst1-plugins-base/0001-gst-libs-gst-video-gstvideoaggregator.c-fix-build-wi.patch b/package/gstreamer1/gst1-plugins-base/0001-gst-libs-gst-video-gstvideoaggregator.c-fix-build-wi.patch
new file mode 100644
index 0000000000..87cd6493f5
--- /dev/null
+++ b/package/gstreamer1/gst1-plugins-base/0001-gst-libs-gst-video-gstvideoaggregator.c-fix-build-wi.patch
@@ -0,0 +1,45 @@
+From 012ca1bcd234ee02f576dd58b1f09baba18b89b0 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Mon, 14 Dec 2020 07:42:55 +0100
+Subject: [PATCH] gst-libs/gst/video/gstvideoaggregator.c: fix build with gcc
+ 4.8
+
+Fix the following build failure with gcc 4.8 which has been added with
+https://gitlab.freedesktop.org/gstreamer/gst-plugins-base/-/commit/d268c193ad39fb970351ed62898be806ebd0a71e:
+
+../gst-libs/gst/video/gstvideoaggregator.c: In function 'gst_video_aggregator_init':
+../gst-libs/gst/video/gstvideoaggregator.c:2762:3: error: 'for' loop initial declarations are only allowed in C99 mode
+   for (gint i = 0; i < gst_caps_get_size (src_template); i++) {
+   ^
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status:
+https://gitlab.freedesktop.org/gstreamer/gst-plugins-base/-/merge_requests/974]
+---
+ gst-libs/gst/video/gstvideoaggregator.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/gst-libs/gst/video/gstvideoaggregator.c b/gst-libs/gst/video/gstvideoaggregator.c
+index 2e3d813be..04dad6563 100644
+--- a/gst-libs/gst/video/gstvideoaggregator.c
++++ b/gst-libs/gst/video/gstvideoaggregator.c
+@@ -2786,6 +2786,7 @@ gst_video_aggregator_init (GstVideoAggregator * vagg,
+ {
+   GstCaps *src_template;
+   GstPadTemplate *pad_template;
++  gint i;
+ 
+   vagg->priv = gst_video_aggregator_get_instance_private (vagg);
+   vagg->priv->current_caps = NULL;
+@@ -2800,7 +2801,7 @@ gst_video_aggregator_init (GstVideoAggregator * vagg,
+   pad_template =
+       gst_element_class_get_pad_template (GST_ELEMENT_CLASS (klass), "src");
+   src_template = gst_pad_template_get_caps (pad_template);
+-  for (gint i = 0; i < gst_caps_get_size (src_template); i++) {
++  for (i = 0; i < gst_caps_get_size (src_template); i++) {
+     const GValue *v =
+         gst_structure_get_value (gst_caps_get_structure (src_template, i),
+         "format");
+-- 
+2.29.2
+
