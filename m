From: Peter Seiderer <ps.report@gmx.net>
Date: Sun, 10 Mar 2019 18:51:09 +0100
Subject: [Buildroot] [RFC v1] package/gst1-plugins-bad: add webrtcbin option
Message-ID: <20190310175109.13444-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
Notes:
  - just compile tested yet
  - named webrtcbin option (instead of webrtc), because of the
    BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_WEBRTC entry in Config.in.legacy
    (see [1] for history)

[1] https://git.buildroot.net/buildroot/commit/?id=4c06d2490a07f0b88f42c56c7409899fd2f5608a
---
 package/gstreamer1/gst1-plugins-bad/Config.in         | 11 +++++++++++
 .../gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk   |  7 +++++++
 2 files changed, 18 insertions(+)

diff --git a/package/gstreamer1/gst1-plugins-bad/Config.in b/package/gstreamer1/gst1-plugins-bad/Config.in
index 869f0a9d45..5d0480cfb0 100644
--- a/package/gstreamer1/gst1-plugins-bad/Config.in
+++ b/package/gstreamer1/gst1-plugins-bad/Config.in
@@ -558,6 +558,17 @@ config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_WEBP
 	help
 	  Webp image format plugin
 
+config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_WEBRTCBIN
+	bool "webrtcbin"
+	depends on !BR2_STATIC_LIBS # libnice -> gnutls
+	select BR2_PACKAGE_GST1_PLUGINS_BASE # libgstsdp
+	select BR2_PACKAGE_LIBNICE
+	help
+	  WebRTC plugins (webrtcbin - a bin for webrtc connections)
+
+comment "webrtcbin needs a toolchain w/ dynamic library"
+	depends on BR2_STATIC_LIBS
+
 config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_WEBRTCDSP
 	bool "webrtcdsp"
 	# All depends from webrtc-audio-processing
diff --git a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
index f5b081f972..2220554a2d 100644
--- a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
+++ b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
@@ -703,6 +703,13 @@ else
 GST1_PLUGINS_BAD_CONF_OPTS += --disable-webp
 endif
 
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_WEBRTCBIN),y)
+GST1_PLUGINS_BAD_CONF_OPTS += --enable-webrtc
+GST1_PLUGINS_BAD_DEPENDENCIES += gst1-plugins-base libnice
+else
+GST1_PLUGINS_BAD_CONF_OPTS += --disable-webrtc
+endif
+
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_WEBRTCDSP),y)
 GST1_PLUGINS_BAD_CONF_OPTS += --enable-webrtcdsp
 GST1_PLUGINS_BAD_DEPENDENCIES += webrtc-audio-processing
-- 
2.21.0
