From: bogdan at nimblex.org <bogdan@nimblex.org>
Date: Wed, 19 Dec 2012 16:58:42 +0000
Subject: [Buildroot] [PATCH 2/4] gstreamer: port to gstreamer-1.0
In-Reply-To: <1355936324-9585-1-git-send-email-bogdan@nimblex.org>
References: <1355936324-9585-1-git-send-email-bogdan@nimblex.org>
Message-ID: <1355936324-9585-2-git-send-email-bogdan@nimblex.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Bogdan Radulescu <bogdan@nimblex.net>

Initial commit of updated gstreamer + plugins which compile

Signed-off-by: Bogdan Radulescu <bogdan@nimblex.net>
---
 package/multimedia/gst-ffmpeg/gst-ffmpeg.mk        |   2 +-
 .../gst-plugins-base/gst-plugins-base-tremor.patch | 139 ---------------------
 .../gst-plugins-base/gst-plugins-base.mk           |   4 +-
 .../gst-plugins-good-linux36.patch                 |  37 ------
 .../gst-plugins-good/gst-plugins-good.mk           |   4 +-
 .../gst-plugins-ugly/gst-plugins-ugly.mk           |   4 +-
 package/multimedia/gstreamer/gstreamer.mk          |   4 +-
 7 files changed, 9 insertions(+), 185 deletions(-)
 delete mode 100644 package/multimedia/gst-plugins-base/gst-plugins-base-tremor.patch
 delete mode 100644 package/multimedia/gst-plugins-good/gst-plugins-good-linux36.patch

diff --git a/package/multimedia/gst-ffmpeg/gst-ffmpeg.mk b/package/multimedia/gst-ffmpeg/gst-ffmpeg.mk
index ead490e..2570cea 100644
--- a/package/multimedia/gst-ffmpeg/gst-ffmpeg.mk
+++ b/package/multimedia/gst-ffmpeg/gst-ffmpeg.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-GST_FFMPEG_VERSION = 0.10.13
+GST_FFMPEG_VERSION = 0.11.2
 GST_FFMPEG_SOURCE = gst-ffmpeg-$(GST_FFMPEG_VERSION).tar.bz2
 GST_FFMPEG_SITE = http://gstreamer.freedesktop.org/src/gst-ffmpeg
 GST_FFMPEG_INSTALL_STAGING = YES
diff --git a/package/multimedia/gst-plugins-base/gst-plugins-base-tremor.patch b/package/multimedia/gst-plugins-base/gst-plugins-base-tremor.patch
deleted file mode 100644
index fa8785b..0000000
--- a/package/multimedia/gst-plugins-base/gst-plugins-base-tremor.patch
+++ /dev/null
@@ -1,139 +0,0 @@
-From 0088753651350de3060ece22c1be4153b6009515 Mon Sep 17 00:00:00 2001
-From: Peter Korsgaard <jacmet@sunsite.dk>
-Date: Wed, 25 Jan 2012 23:53:04 +0100
-Subject: [PATCH] base: vorbisdeclib: support modern Tremor versions
-
-Reported upstream as https://bugzilla.gnome.org/show_bug.cgi?id=668726
-
-Tremor changed to use standard libogg rather than its own incompatible
-copy back in Aug 2010 (r17375), causing gst-plugin-base build to fail.
-
-Tremolo so far unfortunately hasn't been updated. Restructure
-vorbisdeclib.h so the legacy _ogg_packet_wrapper code is only used for
-Tremolo.
-
-Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
----
- ext/vorbis/gstvorbisdeclib.h |   77 ++++++++++++++++++++++-------------------
- 1 files changed, 41 insertions(+), 36 deletions(-)
-
-diff --git a/ext/vorbis/gstvorbisdeclib.h b/ext/vorbis/gstvorbisdeclib.h
-index ca00af9..e147591 100644
---- a/ext/vorbis/gstvorbisdeclib.h
-+++ b/ext/vorbis/gstvorbisdeclib.h
-@@ -29,11 +29,6 @@
- 
- #ifndef TREMOR
- 
--#include <vorbis/codec.h>
--
--typedef float                          vorbis_sample_t;
--typedef ogg_packet                     ogg_packet_wrapper;
--
- #define GST_VORBIS_DEC_DESCRIPTION "decode raw vorbis streams to float audio"
- 
- #define GST_VORBIS_DEC_SRC_CAPS \
-@@ -47,6 +42,42 @@ typedef ogg_packet                     ogg_packet_wrapper;
- 
- #define GST_VORBIS_DEC_GLIB_TYPE_NAME      GstVorbisDec
- 
-+#else /* TREMOR */
-+
-+#define GST_VORBIS_DEC_DESCRIPTION "decode raw vorbis streams to integer audio"
-+
-+#define GST_VORBIS_DEC_SRC_CAPS \
-+    GST_STATIC_CAPS ("audio/x-raw-int, "   \
-+        "rate = (int) [ 1, MAX ], "        \
-+        "channels = (int) [ 1, 6 ], "      \
-+        "endianness = (int) BYTE_ORDER, "  \
-+        "width = (int) { 16, 32 }, "       \
-+        "depth = (int) 16, "               \
-+        "signed = (boolean) true")
-+
-+#define GST_VORBIS_DEC_DEFAULT_SAMPLE_WIDTH           (16)
-+
-+/* we need a different type name here */
-+#define GST_VORBIS_DEC_GLIB_TYPE_NAME      GstIVorbisDec
-+
-+/* and still have it compile */
-+typedef struct _GstVorbisDec               GstIVorbisDec;
-+typedef struct _GstVorbisDecClass          GstIVorbisDecClass;
-+
-+#endif /* TREMOR */
-+
-+#ifndef USE_TREMOLO
-+
-+#ifdef TREMOR
-+ #include <tremor/ivorbiscodec.h>
-+ typedef ogg_int32_t                    vorbis_sample_t;
-+#else
-+ #include <vorbis/codec.h>
-+ typedef float                          vorbis_sample_t;
-+#endif
-+
-+typedef ogg_packet                     ogg_packet_wrapper;
-+
- static inline guint8 *
- gst_ogg_packet_data (ogg_packet * p)
- {
-@@ -72,17 +103,11 @@ gst_ogg_packet_from_wrapper (ogg_packet_wrapper * packet)
-   return packet;
- }
- 
--#else
--
--#ifdef USE_TREMOLO
--  #include <Tremolo/ivorbiscodec.h>
--  #include <Tremolo/codec_internal.h>
--  typedef ogg_int16_t                    vorbis_sample_t;
--#else
--  #include <tremor/ivorbiscodec.h>
--  typedef ogg_int32_t                    vorbis_sample_t;
--#endif
-+#else /* USE_TREMOLO */
- 
-+#include <Tremolo/ivorbiscodec.h>
-+#include <Tremolo/codec_internal.h>
-+typedef ogg_int16_t                    vorbis_sample_t;
- typedef struct _ogg_packet_wrapper     ogg_packet_wrapper;
- 
- struct _ogg_packet_wrapper {
-@@ -91,26 +116,6 @@ struct _ogg_packet_wrapper {
-   ogg_buffer          buf;
- };
- 
--#define GST_VORBIS_DEC_DESCRIPTION "decode raw vorbis streams to integer audio"
--
--#define GST_VORBIS_DEC_SRC_CAPS \
--    GST_STATIC_CAPS ("audio/x-raw-int, "   \
--        "rate = (int) [ 1, MAX ], "        \
--        "channels = (int) [ 1, 6 ], "      \
--        "endianness = (int) BYTE_ORDER, "  \
--        "width = (int) { 16, 32 }, "       \
--        "depth = (int) 16, "               \
--        "signed = (boolean) true")
--
--#define GST_VORBIS_DEC_DEFAULT_SAMPLE_WIDTH           (16)
--
--/* we need a different type name here */
--#define GST_VORBIS_DEC_GLIB_TYPE_NAME      GstIVorbisDec
--
--/* and still have it compile */
--typedef struct _GstVorbisDec               GstIVorbisDec;
--typedef struct _GstVorbisDecClass          GstIVorbisDecClass;
--
- /* compensate minor variation */
- #define vorbis_synthesis(a, b)             vorbis_synthesis (a, b, 1)
- 
-@@ -154,7 +159,7 @@ gst_ogg_packet_from_wrapper (ogg_packet_wrapper * packet)
-   return &(packet->packet);
- }
- 
--#endif
-+#endif /* USE_TREMOLO */
- 
- typedef void (*CopySampleFunc)(vorbis_sample_t *out, vorbis_sample_t **in,
-                            guint samples, gint channels, gint width);
--- 
-1.7.8.3
-
diff --git a/package/multimedia/gst-plugins-base/gst-plugins-base.mk b/package/multimedia/gst-plugins-base/gst-plugins-base.mk
index b044516..f4aab00 100644
--- a/package/multimedia/gst-plugins-base/gst-plugins-base.mk
+++ b/package/multimedia/gst-plugins-base/gst-plugins-base.mk
@@ -3,8 +3,8 @@
 # gst-plugins-base
 #
 #############################################################
-GST_PLUGINS_BASE_VERSION = 0.10.36
-GST_PLUGINS_BASE_SOURCE = gst-plugins-base-$(GST_PLUGINS_BASE_VERSION).tar.bz2
+GST_PLUGINS_BASE_VERSION = 1.0.3
+GST_PLUGINS_BASE_SOURCE = gst-plugins-base-$(GST_PLUGINS_BASE_VERSION).tar.xz
 GST_PLUGINS_BASE_SITE = http://gstreamer.freedesktop.org/src/gst-plugins-base
 GST_PLUGINS_BASE_INSTALL_STAGING = YES
 
diff --git a/package/multimedia/gst-plugins-good/gst-plugins-good-linux36.patch b/package/multimedia/gst-plugins-good/gst-plugins-good-linux36.patch
deleted file mode 100644
index 5d7cd93..0000000
--- a/package/multimedia/gst-plugins-good/gst-plugins-good-linux36.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-Fix building with Linux headers 3.6
-
-Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
-
-From bfb1ac952b4c3caaba0297bbe7dc73ea92f9b292 Mon Sep 17 00:00:00 2001
-From: Matthias Clasen <mclasen@redhat.com>
-Date: Thu, 09 Aug 2012 07:35:23 +0000
-Subject: v4l2: fix build with recent kernels, the v4l2_buffer input field was removed
-
-This was unused apparently and removed in the kernel in commit:
-
- From 2b719d7baf490e24ce7d817c6337b7c87fda84c1 Mon Sep 17 00:00:00 2001
- From: Sakari Ailus <sakari.ailus@iki.fi>
- Date: Wed, 2 May 2012 09:40:03 -0300
- Subject: [PATCH] [media] v4l: drop v4l2_buffer.input and V4L2_BUF_FLAG_INPUT
-
- Remove input field in struct v4l2_buffer and flag V4L2_BUF_FLAG_INPUT which
- tells the former is valid. The flag is used by no driver currently.
-
-https://bugzilla.gnome.org/show_bug.cgi?id=681491
----
-(limited to 'sys/v4l2/gstv4l2bufferpool.c')
-
-diff --git a/sys/v4l2/gstv4l2bufferpool.c b/sys/v4l2/gstv4l2bufferpool.c
-index 2e3a563..5aaed5a 100644
---- a/sys/v4l2/gstv4l2bufferpool.c
-+++ b/sys/v4l2/gstv4l2bufferpool.c
-@@ -182,7 +182,6 @@ gst_v4l2_buffer_new (GstV4l2BufferPool * pool, guint index, GstCaps * caps)
-     GST_LOG_OBJECT (pool->v4l2elem, "  MMAP offset:  %u",
-         ret->vbuffer.m.offset);
-   GST_LOG_OBJECT (pool->v4l2elem, "  length:    %u", ret->vbuffer.length);
--  GST_LOG_OBJECT (pool->v4l2elem, "  input:     %u", ret->vbuffer.input);
- 
-   ret->mmap_length = ret->vbuffer.length;
-   data = (guint8 *) v4l2_mmap (0, ret->vbuffer.length,
---
-cgit v0.9.0.2-2-gbebe
diff --git a/package/multimedia/gst-plugins-good/gst-plugins-good.mk b/package/multimedia/gst-plugins-good/gst-plugins-good.mk
index f64527d..1eefd45 100644
--- a/package/multimedia/gst-plugins-good/gst-plugins-good.mk
+++ b/package/multimedia/gst-plugins-good/gst-plugins-good.mk
@@ -3,8 +3,8 @@
 # gst-plugins-good
 #
 #############################################################
-GST_PLUGINS_GOOD_VERSION = 0.10.31
-GST_PLUGINS_GOOD_SOURCE = gst-plugins-good-$(GST_PLUGINS_GOOD_VERSION).tar.bz2
+GST_PLUGINS_GOOD_VERSION = 1.0.3
+GST_PLUGINS_GOOD_SOURCE = gst-plugins-good-$(GST_PLUGINS_GOOD_VERSION).tar.xz
 GST_PLUGINS_GOOD_SITE = http://gstreamer.freedesktop.org/src/gst-plugins-good
 
 GST_PLUGINS_GOOD_CONF_OPT = \
diff --git a/package/multimedia/gst-plugins-ugly/gst-plugins-ugly.mk b/package/multimedia/gst-plugins-ugly/gst-plugins-ugly.mk
index e23d774..c9bc653 100644
--- a/package/multimedia/gst-plugins-ugly/gst-plugins-ugly.mk
+++ b/package/multimedia/gst-plugins-ugly/gst-plugins-ugly.mk
@@ -3,8 +3,8 @@
 # gst-plugins-ugly
 #
 #############################################################
-GST_PLUGINS_UGLY_VERSION = 0.10.19
-GST_PLUGINS_UGLY_SOURCE = gst-plugins-ugly-$(GST_PLUGINS_UGLY_VERSION).tar.bz2
+GST_PLUGINS_UGLY_VERSION = 1.0.3
+GST_PLUGINS_UGLY_SOURCE = gst-plugins-ugly-$(GST_PLUGINS_UGLY_VERSION).tar.xz
 GST_PLUGINS_UGLY_SITE = http://gstreamer.freedesktop.org/src/gst-plugins-ugly
 
 GST_PLUGINS_UGLY_CONF_OPT = \
diff --git a/package/multimedia/gstreamer/gstreamer.mk b/package/multimedia/gstreamer/gstreamer.mk
index b87f029..0253da2 100644
--- a/package/multimedia/gstreamer/gstreamer.mk
+++ b/package/multimedia/gstreamer/gstreamer.mk
@@ -4,8 +4,8 @@
 # gstreamer
 #
 #############################################################
-GSTREAMER_VERSION = 0.10.36
-GSTREAMER_SOURCE = gstreamer-$(GSTREAMER_VERSION).tar.bz2
+GSTREAMER_VERSION = 1.0.3
+GSTREAMER_SOURCE = gstreamer-$(GSTREAMER_VERSION).tar.xz
 GSTREAMER_SITE = http://gstreamer.freedesktop.org/src/gstreamer
 GSTREAMER_INSTALL_STAGING = YES
 
-- 
1.7.12.1
