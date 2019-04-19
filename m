From: aduskett at gmail.com <aduskett@gmail.com>
Date: Fri, 19 Apr 2019 17:15:55 -0400
Subject: [Buildroot] [PATCH 04/10] package/gstreamer1/gst-plugins-{base, good,
 bad, ugly}: bump to 1.16.0
In-Reply-To: <20190419211601.53431-1-aduskett@gmail.com>
References: <20190419211601.53431-1-aduskett@gmail.com>
Message-ID: <20190419211601.53431-4-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

These are grouped together because the compositor plugin is now in base instead
of bad.

Other changes:
  - Remove upstreamed patches:
      - 0001-fdkaacenc-Remove-MODE_2_1.patch
      - 0002-fdkaacdec-Use-WAV-channel-mapping-instead-of-interle.patch
  - Add BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_COMPOSITOR to Config.in.legacy
  - Remove COPYING.LIB from gst-plugins-base mk file and hash file as it no
    longer exists.
  - Add BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_COMPOSITOR to gst1-plugins-base.mk

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
 Config.in.legacy                              |  6 +++
 .../0001-fdkaacenc-Remove-MODE_2_1.patch      | 32 ------------
 ...V-channel-mapping-instead-of-interle.patch | 49 -------------------
 package/gstreamer1/gst1-plugins-bad/Config.in |  5 --
 .../gst1-plugins-bad/gst1-plugins-bad.hash    |  4 +-
 .../gst1-plugins-bad/gst1-plugins-bad.mk      |  8 +--
 .../gstreamer1/gst1-plugins-base/Config.in    |  5 ++
 .../gst1-plugins-base/gst1-plugins-base.hash  |  5 +-
 .../gst1-plugins-base/gst1-plugins-base.mk    | 10 +++-
 .../gst1-plugins-good/gst1-plugins-good.hash  |  4 +-
 .../gst1-plugins-good/gst1-plugins-good.mk    |  2 +-
 .../gst1-plugins-ugly/gst1-plugins-ugly.hash  |  4 +-
 .../gst1-plugins-ugly/gst1-plugins-ugly.mk    |  2 +-
 13 files changed, 30 insertions(+), 106 deletions(-)
 delete mode 100644 package/gstreamer1/gst1-plugins-bad/0001-fdkaacenc-Remove-MODE_2_1.patch
 delete mode 100644 package/gstreamer1/gst1-plugins-bad/0002-fdkaacdec-Use-WAV-channel-mapping-instead-of-interle.patch

diff --git a/Config.in.legacy b/Config.in.legacy
index ec5079da65..4d2c8dde0d 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -1651,6 +1651,12 @@ config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_DATAURISRC
 	help
 	  Dataurisrc has moved to gstreamer core and is always built.
 
+config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_COMPOSITOR
+	bool "compositor moved to gst1-plugins-base"
+	select BR2_LEGACY
+	help
+	  compositor has moved to gst1-plugins-base.
+
 config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_DCCP
 	bool "dccp removed"
 	select BR2_LEGACY
diff --git a/package/gstreamer1/gst1-plugins-bad/0001-fdkaacenc-Remove-MODE_2_1.patch b/package/gstreamer1/gst1-plugins-bad/0001-fdkaacenc-Remove-MODE_2_1.patch
deleted file mode 100644
index a9c5d44d92..0000000000
--- a/package/gstreamer1/gst1-plugins-bad/0001-fdkaacenc-Remove-MODE_2_1.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From f4fdb9770c76113f38515245fecc5f11b3ace20d Mon Sep 17 00:00:00 2001
-From: "Jan Alexander Steffens (heftig)" <jan.steffens@gmail.com>
-Date: Tue, 4 Dec 2018 17:54:42 +0100
-Subject: [PATCH] fdkaacenc: Remove MODE_2_1
-
-This is not a standard mode and no longer supported by fdk-aac 2.0.0.
-
-For https://gitlab.freedesktop.org/gstreamer/gst-plugins-bad/issues/825
-
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
----
- ext/fdkaac/gstfdkaacenc.c | 4 ----
- 1 file changed, 4 deletions(-)
-
-diff --git a/ext/fdkaac/gstfdkaacenc.c b/ext/fdkaac/gstfdkaacenc.c
-index ad2bcb492..8410e684c 100644
---- a/ext/fdkaac/gstfdkaacenc.c
-+++ b/ext/fdkaac/gstfdkaacenc.c
-@@ -71,10 +71,6 @@ static const struct
-   GST_AUDIO_CHANNEL_POSITION_FRONT_CENTER,
-           GST_AUDIO_CHANNEL_POSITION_FRONT_LEFT,
-           GST_AUDIO_CHANNEL_POSITION_FRONT_RIGHT}}, {
--    3, MODE_2_1, {
--  GST_AUDIO_CHANNEL_POSITION_FRONT_LEFT,
--          GST_AUDIO_CHANNEL_POSITION_FRONT_RIGHT,
--          GST_AUDIO_CHANNEL_POSITION_LFE1}}, {
-     4, MODE_1_2_1, {
-   GST_AUDIO_CHANNEL_POSITION_FRONT_CENTER,
-           GST_AUDIO_CHANNEL_POSITION_FRONT_LEFT,
--- 
-2.11.0
-
diff --git a/package/gstreamer1/gst1-plugins-bad/0002-fdkaacdec-Use-WAV-channel-mapping-instead-of-interle.patch b/package/gstreamer1/gst1-plugins-bad/0002-fdkaacdec-Use-WAV-channel-mapping-instead-of-interle.patch
deleted file mode 100644
index 0049714266..0000000000
--- a/package/gstreamer1/gst1-plugins-bad/0002-fdkaacdec-Use-WAV-channel-mapping-instead-of-interle.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-From 19d34f6b5e1633d5ec4bb2832c58470f0c829cab Mon Sep 17 00:00:00 2001
-From: "Jan Alexander Steffens (heftig)" <jan.steffens@gmail.com>
-Date: Wed, 5 Dec 2018 10:10:39 +0100
-Subject: [PATCH] fdkaacdec: Use WAV channel mapping instead of interleave
- setting
-
-The latter is going away in libfdk-aac 2.0.0. Instead, MPEG-style output
-is always non-interleaved and WAV-style output is always interleaved.
-Earlier libfdk-aac also defaults interleaving accordingly.
-
-Since our reordering looks at the associated PCE indices instead of the
-actual channel order, we're agnostic to the mapping.
-
-For https://gitlab.freedesktop.org/gstreamer/gst-plugins-bad/issues/825
-
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
----
- ext/fdkaac/gstfdkaacdec.c | 12 ++++--------
- 1 file changed, 4 insertions(+), 8 deletions(-)
-
-diff --git a/ext/fdkaac/gstfdkaacdec.c b/ext/fdkaac/gstfdkaacdec.c
-index c27183752..f5136b334 100644
---- a/ext/fdkaac/gstfdkaacdec.c
-+++ b/ext/fdkaac/gstfdkaacdec.c
-@@ -151,17 +151,13 @@ gst_fdkaacdec_set_format (GstAudioDecoder * dec, GstCaps * caps)
-     gst_buffer_unref (codec_data);
-   }
- 
-+  /* Choose WAV channel mapping to get interleaving even with libfdk-aac 2.0.0
-+   * The pChannelIndices retain the indices from the standard MPEG mapping so
-+   * we're agnostic to the actual order. */
-   if ((err =
-           aacDecoder_SetParam (self->dec, AAC_PCM_OUTPUT_CHANNEL_MAPPING,
--              0)) != AAC_DEC_OK) {
--    GST_ERROR_OBJECT (self, "Failed to set output channel mapping: %d", err);
--    return FALSE;
--  }
--
--  if ((err =
--          aacDecoder_SetParam (self->dec, AAC_PCM_OUTPUT_INTERLEAVED,
-               1)) != AAC_DEC_OK) {
--    GST_ERROR_OBJECT (self, "Failed to set interleaved output: %d", err);
-+    GST_ERROR_OBJECT (self, "Failed to set output channel mapping: %d", err);
-     return FALSE;
-   }
- 
--- 
-2.11.0
-
diff --git a/package/gstreamer1/gst1-plugins-bad/Config.in b/package/gstreamer1/gst1-plugins-bad/Config.in
index 6830902f3a..054dae8f65 100644
--- a/package/gstreamer1/gst1-plugins-bad/Config.in
+++ b/package/gstreamer1/gst1-plugins-bad/Config.in
@@ -51,11 +51,6 @@ config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_AUDIOMIXMATRIX
 	help
 	  Audio N:M mixer plugin
 
-config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_COMPOSITOR
-	bool "compositor"
-	help
-	  Video compositor plugin
-
 config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_AUDIOVISUALIZERS
 	bool "audiovisualizers"
 	help
diff --git a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.hash b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.hash
index cb4bf64677..0c1627de86 100644
--- a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.hash
+++ b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.hash
@@ -1,4 +1,4 @@
-# From https://gstreamer.freedesktop.org/src/gst-plugins-bad/gst-plugins-bad-1.14.4.tar.xz.sha256sum
-sha256 910b4e0e2e897e8b6d06767af1779d70057c309f67292f485ff988d087aa0de5 gst-plugins-bad-1.14.4.tar.xz
+# From https://gstreamer.freedesktop.org/src/gst-plugins-bad/gst-plugins-bad-1.16.0.tar.xz.sha256sum
+sha256 22139de35626ada6090bdfa3423b27b7fc15a0198331d25c95e6b12cb1072b05 gst-plugins-bad-1.16.0.tar.xz
 sha256 0b12e4d1cd5db5f8a0c04fc98a1d8c3acc533097b6198d6644420da78d460223 COPYING
 sha256 cf9b86bcf2d298e8cf5b9d8982f9dab296465b002fdfa0347357a0732f961e03 COPYING.LIB
diff --git a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
index e4e7661ac4..0b513769f3 100644
--- a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
+++ b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_PLUGINS_BAD_VERSION = 1.14.4
+GST1_PLUGINS_BAD_VERSION = 1.16.0
 GST1_PLUGINS_BAD_SOURCE = gst-plugins-bad-$(GST1_PLUGINS_BAD_VERSION).tar.xz
 GST1_PLUGINS_BAD_SITE = https://gstreamer.freedesktop.org/src/gst-plugins-bad
 GST1_PLUGINS_BAD_INSTALL_STAGING = YES
@@ -138,12 +138,6 @@ else
 GST1_PLUGINS_BAD_CONF_OPTS += --disable-audiomixmatrix
 endif
 
-ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_COMPOSITOR),y)
-GST1_PLUGINS_BAD_CONF_OPTS += --enable-compositor
-else
-GST1_PLUGINS_BAD_CONF_OPTS += --disable-compositor
-endif
-
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_AUDIOVISUALIZERS),y)
 GST1_PLUGINS_BAD_CONF_OPTS += --enable-audiovisualizers
 else
diff --git a/package/gstreamer1/gst1-plugins-base/Config.in b/package/gstreamer1/gst1-plugins-base/Config.in
index 340926ecb9..5c915d79b2 100644
--- a/package/gstreamer1/gst1-plugins-base/Config.in
+++ b/package/gstreamer1/gst1-plugins-base/Config.in
@@ -43,6 +43,11 @@ config BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_AUDIOTESTSRC
 	help
 	  Creates audio test signals of given frequency and volume
 
+config BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_COMPOSITOR
+	bool "compositor"
+	help
+	  Video compositor plugin
+
 config BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_ENCODING
 	bool "encoding"
 	help
diff --git a/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.hash b/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.hash
index c508bdc00d..21db608c60 100644
--- a/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.hash
+++ b/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.hash
@@ -1,4 +1,3 @@
-# From https://gstreamer.freedesktop.org/src/gst-plugins-base/gst-plugins-base-1.14.4.tar.xz.sha256sum
-sha256 ca6139490e48863e7706d870ff4e8ac9f417b56f3b9e4b3ce490c13b09a77461 gst-plugins-base-1.14.4.tar.xz
+# From https://gstreamer.freedesktop.org/src/gst-plugins-base/gst-plugins-base-1.16.0.tar.xz.sha256sum
+sha256 4093aa7b51e28fb24dfd603893fead8d1b7782f088b05ed0f22a21ef176fb5ae gst-plugins-base-1.16.0.tar.xz
 sha256 78fb5977f177ab71cba77a4a127d29b93cb1ca5c25962204b31f183a20cf5c7a COPYING
-sha256 f445dc78b88496f7e20c7a2a461b95baba5865c8919b8289ac24ac0a80c6ce7a COPYING.LIB
diff --git a/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk b/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk
index fb976f9a94..30625f8f1d 100644
--- a/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk
+++ b/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-GST1_PLUGINS_BASE_VERSION = 1.14.4
+GST1_PLUGINS_BASE_VERSION = 1.16.0
 GST1_PLUGINS_BASE_SOURCE = gst-plugins-base-$(GST1_PLUGINS_BASE_VERSION).tar.xz
 GST1_PLUGINS_BASE_SITE = https://gstreamer.freedesktop.org/src/gst-plugins-base
 GST1_PLUGINS_BASE_INSTALL_STAGING = YES
-GST1_PLUGINS_BASE_LICENSE_FILES = COPYING.LIB
+GST1_PLUGINS_BASE_LICENSE_FILES = COPYING
 GST1_PLUGINS_BASE_LICENSE = LGPL-2.0+, LGPL-2.1+
 
 # gio_unix_2_0 is only used for tests
@@ -119,6 +119,12 @@ else
 GST1_PLUGINS_BASE_CONF_OPTS += --disable-audiotestsrc
 endif
 
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_COMPOSITOR),y)
+GST1_PLUGINS_BASE_CONF_OPTS += --enable-compositor
+else
+GST1_PLUGINS_BASE_CONF_OPTS += --disable-compositor
+endif
+
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_ENCODING),y)
 GST1_PLUGINS_BASE_CONF_OPTS += --enable-encoding
 else
diff --git a/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.hash b/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.hash
index 1d08938e09..be837ab569 100644
--- a/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.hash
+++ b/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.hash
@@ -1,3 +1,3 @@
-# From https://gstreamer.freedesktop.org/src/gst-plugins-good/gst-plugins-good-1.14.4.tar.xz.sha256sum
-sha256 5f8b553260cb0aac56890053d8511db1528d53cae10f0287cfce2cb2acc70979 gst-plugins-good-1.14.4.tar.xz
+# From https://gstreamer.freedesktop.org/src/gst-plugins-good/gst-plugins-good-1.16.0.tar.xz.sha256sum
+sha256 654adef33380d604112f702c2927574cfc285e31307b79e584113858838bb0fd gst-plugins-good-1.16.0.tar.xz
 sha256 6095e9ffa777dd22839f7801aa845b31c9ed07f3d6bf8a26dc5d2dec8ccc0ef3 COPYING
diff --git a/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk b/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk
index f6a3037be0..4ef128229a 100644
--- a/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk
+++ b/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_PLUGINS_GOOD_VERSION = 1.14.4
+GST1_PLUGINS_GOOD_VERSION = 1.16.0
 GST1_PLUGINS_GOOD_SOURCE = gst-plugins-good-$(GST1_PLUGINS_GOOD_VERSION).tar.xz
 GST1_PLUGINS_GOOD_SITE = https://gstreamer.freedesktop.org/src/gst-plugins-good
 GST1_PLUGINS_GOOD_LICENSE_FILES = COPYING
diff --git a/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.hash b/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.hash
index f93c7e2340..b80887a0cc 100644
--- a/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.hash
+++ b/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.hash
@@ -1,3 +1,3 @@
-# From https://gstreamer.freedesktop.org/src/gst-plugins-ugly/gst-plugins-ugly-1.14.4.tar.xz.sha256sum
-sha256 ac02d837f166c35ff6ce0738e281680d0b90052cfb1f0255dcf6aaca5f0f6d23 gst-plugins-ugly-1.14.4.tar.xz
+# From https://gstreamer.freedesktop.org/src/gst-plugins-ugly/gst-plugins-ugly-1.16.0.tar.xz.sha256sum
+sha256 e30964c5f031c32289e0b25e176c3c95a5737f2052dfc81d0f7427ef0233a4c2 gst-plugins-ugly-1.16.0.tar.xz
 sha256 6095e9ffa777dd22839f7801aa845b31c9ed07f3d6bf8a26dc5d2dec8ccc0ef3 COPYING
diff --git a/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.mk b/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.mk
index 25546258cd..f3ac2f79d3 100644
--- a/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.mk
+++ b/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_PLUGINS_UGLY_VERSION = 1.14.4
+GST1_PLUGINS_UGLY_VERSION = 1.16.0
 GST1_PLUGINS_UGLY_SOURCE = gst-plugins-ugly-$(GST1_PLUGINS_UGLY_VERSION).tar.xz
 GST1_PLUGINS_UGLY_SITE = https://gstreamer.freedesktop.org/src/gst-plugins-ugly
 GST1_PLUGINS_UGLY_LICENSE_FILES = COPYING
-- 
2.20.1
