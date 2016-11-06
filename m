From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 6 Nov 2016 23:20:14 +0100
Subject: [Buildroot] [git commit branch/next] gst1-plugins-bad: enable
	webrtc plugin
Message-ID: <20161107205049.E2E7B80AC4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ee267886bc090335dd94c97dca1c294addccc090
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

It's new for 1.10.0, add an explicit option for the webrtc plugin.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gstreamer1/gst1-plugins-bad/Config.in           | 17 +++++++++++++++++
 package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk |  7 +++++++
 2 files changed, 24 insertions(+)

diff --git a/package/gstreamer1/gst1-plugins-bad/Config.in b/package/gstreamer1/gst1-plugins-bad/Config.in
index 8af35cc..1e251af 100644
--- a/package/gstreamer1/gst1-plugins-bad/Config.in
+++ b/package/gstreamer1/gst1-plugins-bad/Config.in
@@ -682,6 +682,23 @@ config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_WEBP
 	help
 	  Webp image format plugin
 
+config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_WEBRTC
+	bool "webrtc"
+	# All depends from webrtc-audio-processing
+	depends on BR2_PACKAGE_WEBRTC_AUDIO_PROCESSING_ARCH_SUPPORTS
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
+	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
+	select BR2_PACKAGE_WEBRTC_AUDIO_PROCESSING
+	select BR2_PACKAGE_WEBRTC
+	help
+	  WebRTC echo-cancellation, gain control and noise suppression
+
+comment "webrtc needs a toolchain w/ C++, NPTL, gcc >= 4.8"
+	depends on BR2_PACKAGE_WEBRTC_AUDIO_PROCESSING_ARCH_SUPPORTS
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS_NPTL \
+		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
+
 config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_X265
 	bool "x265"
 	depends on BR2_INSTALL_LIBSTDCPP
diff --git a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
index cd9da7c..ba9f8ff 100644
--- a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
+++ b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
@@ -794,6 +794,13 @@ else
 GST1_PLUGINS_BAD_CONF_OPTS += --disable-webp
 endif
 
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_WEBRTC),y)
+GST1_PLUGINS_BAD_CONF_OPTS += --enable-webrtc
+GST1_PLUGINS_BAD_DEPENDENCIES += webrtc-audio-processing
+else
+GST1_PLUGINS_BAD_CONF_OPTS += --disable-webrtc
+endif
+
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_X265),y)
 GST1_PLUGINS_BAD_CONF_OPTS += --enable-x265
 GST1_PLUGINS_BAD_DEPENDENCIES += x265
