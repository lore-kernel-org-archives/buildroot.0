From: Peter Seiderer <ps.report@gmx.net>
Date: Sat, 16 Mar 2019 23:14:40 +0100
Subject: [Buildroot] [PATCH v2] package/gst1-plugins-bad: add webrtc option
Message-ID: <20190316221440.24465-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- remove old webrtc Config.in.legacy entry introduced by [1] (misnamed
  webrtc option was introduced with 2017.02, renamed to webrtcdsp for
  2017.08 and although backported to 2017.02.4)

[1] https://git.buildroot.net/buildroot/commit/?id=4c06d2490a07f0b88f42c56c7409899fd2f5608a

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
Changes v1 -> v2:
  - renamed option form webrtcbin to webrtc
  - remove legacy webrtc Config.in.legacy entry
---
 Config.in.legacy                                      | 10 ----------
 package/gstreamer1/gst1-plugins-bad/Config.in         | 11 +++++++++++
 .../gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk   |  7 +++++++
 3 files changed, 18 insertions(+), 10 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 2030b51e1d..0a0bce41f9 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -1685,16 +1685,6 @@ config BR2_PACKAGE_GST1_PLUGINS_UGLY_PLUGIN_MAD
 	bool "mad (*.mp3 audio) removed"
 	select BR2_LEGACY
 
-config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_WEBRTC
-	bool "gst1-plugins-bad webrtc renamed to webrtcdsp"
-	select BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_WEBRTCDSP
-	select BR2_LEGACY
-	help
-	  The WebRTC plugin in GStreamer 1.x has always been named
-	  webrtcdsp, but was wrongly introduced in Buildroot under the
-	  name webrtc. Therefore, we have renamed the option to match
-	  the actual name of the GStreamer plugin.
-
 config BR2_STRIP_none
 	bool "Strip command 'none' has been removed"
 	select BR2_LEGACY
diff --git a/package/gstreamer1/gst1-plugins-bad/Config.in b/package/gstreamer1/gst1-plugins-bad/Config.in
index 869f0a9d45..6830902f3a 100644
--- a/package/gstreamer1/gst1-plugins-bad/Config.in
+++ b/package/gstreamer1/gst1-plugins-bad/Config.in
@@ -558,6 +558,17 @@ config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_WEBP
 	help
 	  Webp image format plugin
 
+config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_WEBRTC
+	bool "webrtc"
+	depends on !BR2_STATIC_LIBS # libnice -> gnutls
+	select BR2_PACKAGE_GST1_PLUGINS_BASE # libgstsdp
+	select BR2_PACKAGE_LIBNICE
+	help
+	  WebRTC plugins (webrtcbin - a bin for webrtc connections)
+
+comment "webrtc needs a toolchain w/ dynamic library"
+	depends on BR2_STATIC_LIBS
+
 config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_WEBRTCDSP
 	bool "webrtcdsp"
 	# All depends from webrtc-audio-processing
diff --git a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
index f5b081f972..e4e7661ac4 100644
--- a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
+++ b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
@@ -703,6 +703,13 @@ else
 GST1_PLUGINS_BAD_CONF_OPTS += --disable-webp
 endif
 
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_WEBRTC),y)
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
