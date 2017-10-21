From: Peter Seiderer <ps.report@gmx.net>
Date: Sat, 21 Oct 2017 22:11:56 +0200
Subject: [Buildroot] [PATCH v1] gst1-plugins-bad: fix patch
	0001-openjpeg-Support-building-with-openjpeg-2.3-simpler.patch
Message-ID: <20171021201156.20753-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The previous version was by mistake mixed up with the patch 'gst-plugins-bad:
openjpeg: Remove compatibility with openjpeg 2.0'

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 ...upport-building-with-openjpeg-2.3-simpler.patch | 59 +++-------------------
 1 file changed, 7 insertions(+), 52 deletions(-)

diff --git a/package/gstreamer1/gst1-plugins-bad/0001-openjpeg-Support-building-with-openjpeg-2.3-simpler.patch b/package/gstreamer1/gst1-plugins-bad/0001-openjpeg-Support-building-with-openjpeg-2.3-simpler.patch
index 647cf5ac1a..23569424a8 100644
--- a/package/gstreamer1/gst1-plugins-bad/0001-openjpeg-Support-building-with-openjpeg-2.3-simpler.patch
+++ b/package/gstreamer1/gst1-plugins-bad/0001-openjpeg-Support-building-with-openjpeg-2.3-simpler.patch
@@ -1,4 +1,4 @@
-From 47923096270ca79f362d3809f387463f6bdc1213 Mon Sep 17 00:00:00 2001
+From b08b3ad2c4ca27519b34229b7430af5cb73cc7ef Mon Sep 17 00:00:00 2001
 From: "Jan Alexander Steffens (heftig)" <jan.steffens@gmail.com>
 Date: Thu, 19 Oct 2017 16:36:17 +0200
 Subject: [PATCH] openjpeg: Support building with openjpeg 2.3, simpler
@@ -13,12 +13,10 @@ https://bugzilla.gnome.org/show_bug.cgi?id=788703
 Upstream: https://cgit.freedesktop.org/gstreamer/gst-plugins-bad/commit/?id=bff2d834a4a38f64e555cee3d0144fde6c515acd
 Signed-off-by: Peter Seiderer <ps.report@gmx.net>
 ---
- configure.ac                  |  5 -----
- ext/openjpeg/gstopenjpeg.h    |  9 ++++-----
- ext/openjpeg/gstopenjpegdec.c |  4 ----
- ext/openjpeg/gstopenjpegenc.c |  4 ----
- ext/openjpeg/meson.build      | 20 +++++++-------------
- 5 files changed, 11 insertions(+), 31 deletions(-)
+ configure.ac               |  5 -----
+ ext/openjpeg/gstopenjpeg.h |  6 ++----
+ ext/openjpeg/meson.build   | 20 +++++++-------------
+ 3 files changed, 9 insertions(+), 22 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
 index 7a8d752..f9727ac 100644
@@ -37,21 +35,10 @@ index 7a8d752..f9727ac 100644
    else
      # Fallback to v1.5
 diff --git a/ext/openjpeg/gstopenjpeg.h b/ext/openjpeg/gstopenjpeg.h
-index 52410a4..14e46d4 100644
+index 52410a4..f9ca74a 100644
 --- a/ext/openjpeg/gstopenjpeg.h
 +++ b/ext/openjpeg/gstopenjpeg.h
-@@ -21,8 +21,9 @@
- #ifndef __GST_OPENJPEG_H__
- #define __GST_OPENJPEG_H__
- 
--#ifdef HAVE_OPENJPEG_1
- #include <openjpeg.h>
-+
-+#ifdef HAVE_OPENJPEG_1
- #define OPJ_CLRSPC_UNKNOWN CLRSPC_UNKNOWN
- #define OPJ_CLRSPC_SRGB CLRSPC_SRGB
- #define OPJ_CLRSPC_GRAY CLRSPC_GRAY
-@@ -38,10 +39,8 @@
+@@ -38,10 +38,8 @@
  #define OPJ_CPRL CPRL
  #else
  #include <stdio.h>
@@ -64,38 +51,6 @@ index 52410a4..14e46d4 100644
  # else
  #  include <openjpeg-2.0/openjpeg.h>
  # endif
-diff --git a/ext/openjpeg/gstopenjpegdec.c b/ext/openjpeg/gstopenjpegdec.c
-index 881769b..e387f19 100644
---- a/ext/openjpeg/gstopenjpegdec.c
-+++ b/ext/openjpeg/gstopenjpegdec.c
-@@ -1036,11 +1036,7 @@ gst_openjpeg_dec_handle_frame (GstVideoDecoder * decoder,
-   opj_stream_set_write_function (stream, write_fn);
-   opj_stream_set_skip_function (stream, skip_fn);
-   opj_stream_set_seek_function (stream, seek_fn);
--#ifdef HAVE_OPENJPEG_2_1
-   opj_stream_set_user_data (stream, &mstream, NULL);
--#else
--  opj_stream_set_user_data (stream, &mstream);
--#endif
-   opj_stream_set_user_data_length (stream, mstream.size);
- 
-   image = NULL;
-diff --git a/ext/openjpeg/gstopenjpegenc.c b/ext/openjpeg/gstopenjpegenc.c
-index 7514a35..1b0bdf8 100644
---- a/ext/openjpeg/gstopenjpegenc.c
-+++ b/ext/openjpeg/gstopenjpegenc.c
-@@ -958,11 +958,7 @@ gst_openjpeg_enc_handle_frame (GstVideoEncoder * encoder,
-   opj_stream_set_write_function (stream, write_fn);
-   opj_stream_set_skip_function (stream, skip_fn);
-   opj_stream_set_seek_function (stream, seek_fn);
--#ifdef HAVE_OPENJPEG_2_1
-   opj_stream_set_user_data (stream, &mstream, NULL);
--#else
--  opj_stream_set_user_data (stream, &mstream);
--#endif
-   opj_stream_set_user_data_length (stream, mstream.size);
- 
-   if (!opj_start_compress (enc, image, stream))
 diff --git a/ext/openjpeg/meson.build b/ext/openjpeg/meson.build
 index 0d97ebb..14b8583 100644
 --- a/ext/openjpeg/meson.build
-- 
2.14.2
