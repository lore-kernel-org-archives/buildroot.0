From: Markos Chandras <markos.chandras@gmail.com>
Date: Thu, 4 Oct 2012 09:44:38 +0100
Subject: [Buildroot] [PATCH] gst-plugins-good: Add upstream patch to fix
	building with Linux 3.6
Message-ID: <1349340278-15827-1-git-send-email-markos.chandras@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Markos Chandras <markos.chandras@imgtec.com>

Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
---
 .../gst-plugins-good-linux36.patch                 |   37 ++++++++++++++++++++
 1 files changed, 37 insertions(+), 0 deletions(-)
 create mode 100644 package/multimedia/gst-plugins-good/gst-plugins-good-linux36.patch

diff --git a/package/multimedia/gst-plugins-good/gst-plugins-good-linux36.patch b/package/multimedia/gst-plugins-good/gst-plugins-good-linux36.patch
new file mode 100644
index 0000000..5d7cd93
--- /dev/null
+++ b/package/multimedia/gst-plugins-good/gst-plugins-good-linux36.patch
@@ -0,0 +1,37 @@
+Fix building with Linux headers 3.6
+
+Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
+
+From bfb1ac952b4c3caaba0297bbe7dc73ea92f9b292 Mon Sep 17 00:00:00 2001
+From: Matthias Clasen <mclasen@redhat.com>
+Date: Thu, 09 Aug 2012 07:35:23 +0000
+Subject: v4l2: fix build with recent kernels, the v4l2_buffer input field was removed
+
+This was unused apparently and removed in the kernel in commit:
+
+ From 2b719d7baf490e24ce7d817c6337b7c87fda84c1 Mon Sep 17 00:00:00 2001
+ From: Sakari Ailus <sakari.ailus@iki.fi>
+ Date: Wed, 2 May 2012 09:40:03 -0300
+ Subject: [PATCH] [media] v4l: drop v4l2_buffer.input and V4L2_BUF_FLAG_INPUT
+
+ Remove input field in struct v4l2_buffer and flag V4L2_BUF_FLAG_INPUT which
+ tells the former is valid. The flag is used by no driver currently.
+
+https://bugzilla.gnome.org/show_bug.cgi?id=681491
+---
+(limited to 'sys/v4l2/gstv4l2bufferpool.c')
+
+diff --git a/sys/v4l2/gstv4l2bufferpool.c b/sys/v4l2/gstv4l2bufferpool.c
+index 2e3a563..5aaed5a 100644
+--- a/sys/v4l2/gstv4l2bufferpool.c
++++ b/sys/v4l2/gstv4l2bufferpool.c
+@@ -182,7 +182,6 @@ gst_v4l2_buffer_new (GstV4l2BufferPool * pool, guint index, GstCaps * caps)
+     GST_LOG_OBJECT (pool->v4l2elem, "  MMAP offset:  %u",
+         ret->vbuffer.m.offset);
+   GST_LOG_OBJECT (pool->v4l2elem, "  length:    %u", ret->vbuffer.length);
+-  GST_LOG_OBJECT (pool->v4l2elem, "  input:     %u", ret->vbuffer.input);
+ 
+   ret->mmap_length = ret->vbuffer.length;
+   data = (guint8 *) v4l2_mmap (0, ret->vbuffer.length,
+--
+cgit v0.9.0.2-2-gbebe
-- 
1.7.1
