From: Sven Neumann <s.neumann@raumfeld.com>
Date: Thu, 20 Dec 2012 11:49:26 +0100
Subject: [Buildroot] [PATCH] gst-plugins-base: make alsa plug-in configurable
Message-ID: <1356000566-32423-1-git-send-email-s.neumann@raumfeld.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It may be desirable not to use the alsa sink for playback
even though alsa-lib is installed. So make this a configuration
option. This also takes care of selecting the proper options
for alsa-lib
(BR2_PACKAGE_ALSA_LIB_MIXER and BR2_PACKAGE_ALSA_LIB_PCM).

Signed-off-by: Sven Neumann <s.neumann@raumfeld.com>
---
 package/multimedia/gst-plugins-base/Config.in           |    6 ++++++
 package/multimedia/gst-plugins-base/gst-plugins-base.mk |    3 +--
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/package/multimedia/gst-plugins-base/Config.in b/package/multimedia/gst-plugins-base/Config.in
index 5d82533..70d664d 100644
--- a/package/multimedia/gst-plugins-base/Config.in
+++ b/package/multimedia/gst-plugins-base/Config.in
@@ -73,6 +73,12 @@ config BR2_PACKAGE_GST_PLUGINS_BASE_PLUGIN_VOLUME
 
 comment "plugins with external dependencies (there may be more available)"
 
+config BR2_PACKAGE_GST_PLUGINS_BASE_PLUGIN_ALSA
+	bool "alsa (mandatory for audio playback)"
+        select BR2_PACKAGE_ALSA_LIB
+        select BR2_PACKAGE_ALSA_LIB_MIXER
+        select BR2_PACKAGE_ALSA_LIB_PCM
+
 config BR2_PACKAGE_GST_PLUGINS_BASE_PLUGIN_OGG
 	bool "ogg (*.ogg audio/video)"
 	select BR2_PACKAGE_LIBOGG
diff --git a/package/multimedia/gst-plugins-base/gst-plugins-base.mk b/package/multimedia/gst-plugins-base/gst-plugins-base.mk
index b044516..02e7ca4 100644
--- a/package/multimedia/gst-plugins-base/gst-plugins-base.mk
+++ b/package/multimedia/gst-plugins-base/gst-plugins-base.mk
@@ -40,8 +40,7 @@ ifeq ($(BR2_PACKAGE_ORC),y)
 GST_PLUGINS_BASE_DEPENDENCIES += orc
 endif
 
-# alsa support needs pcm+mixer support, but configure fails to check for it
-ifeq ($(BR2_PACKAGE_ALSA_LIB)$(BR2_PACKAGE_ALSA_LIB_MIXER)$(BR2_PACKAGE_ALSA_LIB_PCM),yyy)
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_BASE_PLUGIN_ALSA),y)
 GST_PLUGINS_BASE_DEPENDENCIES += alsa-lib
 else
 GST_PLUGINS_BASE_CONF_OPT += --disable-alsa
-- 
1.7.10.4
