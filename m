From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 17 Jan 2019 09:56:49 +0100
Subject: [Buildroot] [git commit] package/gst1-plugins-bad: fix build with
 fdk-aac 2.0
Message-ID: <20190117085622.C5D297FE17@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0faf57a4491411c532cccde7aaa9175c63ea84fb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/343/343249ab34ab77be3b8077f544b9d1e2d4852796/
http://autobuild.buildroot.net/results/edc/edca961f2c4d1946385ac86a756308caaf22d79d/

Fdk-aac 2.0 dropped some legacy APIs, breaking the build of the fdk-aac
plugin.  Add two upstream upstream patches to fix building against fdk-aac
2.0.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Reviewed-by: Ryan Barnett <ryan.barnett@rockwellcollins.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0001-fdkaacenc-Remove-MODE_2_1.patch           | 32 ++++++++++++++
 ...se-WAV-channel-mapping-instead-of-interle.patch | 49 ++++++++++++++++++++++
 2 files changed, 81 insertions(+)

diff --git a/package/gstreamer1/gst1-plugins-bad/0001-fdkaacenc-Remove-MODE_2_1.patch b/package/gstreamer1/gst1-plugins-bad/0001-fdkaacenc-Remove-MODE_2_1.patch
new file mode 100644
index 0000000000..a9c5d44d92
--- /dev/null
+++ b/package/gstreamer1/gst1-plugins-bad/0001-fdkaacenc-Remove-MODE_2_1.patch
@@ -0,0 +1,32 @@
+From f4fdb9770c76113f38515245fecc5f11b3ace20d Mon Sep 17 00:00:00 2001
+From: "Jan Alexander Steffens (heftig)" <jan.steffens@gmail.com>
+Date: Tue, 4 Dec 2018 17:54:42 +0100
+Subject: [PATCH] fdkaacenc: Remove MODE_2_1
+
+This is not a standard mode and no longer supported by fdk-aac 2.0.0.
+
+For https://gitlab.freedesktop.org/gstreamer/gst-plugins-bad/issues/825
+
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+---
+ ext/fdkaac/gstfdkaacenc.c | 4 ----
+ 1 file changed, 4 deletions(-)
+
+diff --git a/ext/fdkaac/gstfdkaacenc.c b/ext/fdkaac/gstfdkaacenc.c
+index ad2bcb492..8410e684c 100644
+--- a/ext/fdkaac/gstfdkaacenc.c
++++ b/ext/fdkaac/gstfdkaacenc.c
+@@ -71,10 +71,6 @@ static const struct
+   GST_AUDIO_CHANNEL_POSITION_FRONT_CENTER,
+           GST_AUDIO_CHANNEL_POSITION_FRONT_LEFT,
+           GST_AUDIO_CHANNEL_POSITION_FRONT_RIGHT}}, {
+-    3, MODE_2_1, {
+-  GST_AUDIO_CHANNEL_POSITION_FRONT_LEFT,
+-          GST_AUDIO_CHANNEL_POSITION_FRONT_RIGHT,
+-          GST_AUDIO_CHANNEL_POSITION_LFE1}}, {
+     4, MODE_1_2_1, {
+   GST_AUDIO_CHANNEL_POSITION_FRONT_CENTER,
+           GST_AUDIO_CHANNEL_POSITION_FRONT_LEFT,
+-- 
+2.11.0
+
diff --git a/package/gstreamer1/gst1-plugins-bad/0002-fdkaacdec-Use-WAV-channel-mapping-instead-of-interle.patch b/package/gstreamer1/gst1-plugins-bad/0002-fdkaacdec-Use-WAV-channel-mapping-instead-of-interle.patch
new file mode 100644
index 0000000000..0049714266
--- /dev/null
+++ b/package/gstreamer1/gst1-plugins-bad/0002-fdkaacdec-Use-WAV-channel-mapping-instead-of-interle.patch
@@ -0,0 +1,49 @@
+From 19d34f6b5e1633d5ec4bb2832c58470f0c829cab Mon Sep 17 00:00:00 2001
+From: "Jan Alexander Steffens (heftig)" <jan.steffens@gmail.com>
+Date: Wed, 5 Dec 2018 10:10:39 +0100
+Subject: [PATCH] fdkaacdec: Use WAV channel mapping instead of interleave
+ setting
+
+The latter is going away in libfdk-aac 2.0.0. Instead, MPEG-style output
+is always non-interleaved and WAV-style output is always interleaved.
+Earlier libfdk-aac also defaults interleaving accordingly.
+
+Since our reordering looks at the associated PCE indices instead of the
+actual channel order, we're agnostic to the mapping.
+
+For https://gitlab.freedesktop.org/gstreamer/gst-plugins-bad/issues/825
+
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+---
+ ext/fdkaac/gstfdkaacdec.c | 12 ++++--------
+ 1 file changed, 4 insertions(+), 8 deletions(-)
+
+diff --git a/ext/fdkaac/gstfdkaacdec.c b/ext/fdkaac/gstfdkaacdec.c
+index c27183752..f5136b334 100644
+--- a/ext/fdkaac/gstfdkaacdec.c
++++ b/ext/fdkaac/gstfdkaacdec.c
+@@ -151,17 +151,13 @@ gst_fdkaacdec_set_format (GstAudioDecoder * dec, GstCaps * caps)
+     gst_buffer_unref (codec_data);
+   }
+ 
++  /* Choose WAV channel mapping to get interleaving even with libfdk-aac 2.0.0
++   * The pChannelIndices retain the indices from the standard MPEG mapping so
++   * we're agnostic to the actual order. */
+   if ((err =
+           aacDecoder_SetParam (self->dec, AAC_PCM_OUTPUT_CHANNEL_MAPPING,
+-              0)) != AAC_DEC_OK) {
+-    GST_ERROR_OBJECT (self, "Failed to set output channel mapping: %d", err);
+-    return FALSE;
+-  }
+-
+-  if ((err =
+-          aacDecoder_SetParam (self->dec, AAC_PCM_OUTPUT_INTERLEAVED,
+               1)) != AAC_DEC_OK) {
+-    GST_ERROR_OBJECT (self, "Failed to set interleaved output: %d", err);
++    GST_ERROR_OBJECT (self, "Failed to set output channel mapping: %d", err);
+     return FALSE;
+   }
+ 
+-- 
+2.11.0
+
