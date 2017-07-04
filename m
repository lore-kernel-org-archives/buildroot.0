From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 4 Jul 2017 17:47:05 +0200
Subject: [Buildroot] [git commit branch/2017.02.x] gst1-plugins-bad: fix
	webrtc option
Message-ID: <20170704154818.2D5E27FAFC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1195d84c71c5849117f40d99189e7ae077cd88fb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

When the WebRTC plugin option was introduced in commit
ee267886bc090335dd94c97dca1c294addccc090 ("gst1-plugins-bad: enable
webrtc plugin"), it was incorrect added as "webrtc", while the actual
name of the plugin and corresponding configure option is "webrtcdsp".

This commit therefore fixes the .mk file to use the correct name. And
also, since we want to keep Buildroot option consistent with the name
of the GStreamer plugins, it renames the Config.in option as well, and
introduces the necessary Config.in.legacy handling.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 4c06d2490a07f0b88f42c56c7409899fd2f5608a)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Config.in.legacy                                        | 10 ++++++++++
 package/gstreamer1/gst1-plugins-bad/Config.in           |  6 +++---
 package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk |  6 +++---
 3 files changed, 16 insertions(+), 6 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 7decb91..0f2f95b 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,16 @@ endif
 
 comment "Legacy options removed in 2017.02"
 
+config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_WEBRTC
+	bool "gst1-plugins-bad webrtc renamed to webrtcdsp"
+	select BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_WEBRTCDSP
+	select BR2_LEGACY
+	help
+	  The WebRTC plugin in GStreamer 1.x has always been named
+	  webrtcdsp, but was wrongly introduced in Buildroot under the
+	  name webrtc. Therefore, we have renamed the option to match
+	  the actual name of the GStreamer plugin.
+
 config BR2_PACKAGE_SPICE_CLIENT
 	bool "spice client support removed"
 	select BR2_LEGACY
diff --git a/package/gstreamer1/gst1-plugins-bad/Config.in b/package/gstreamer1/gst1-plugins-bad/Config.in
index 1db5187..2fe9bb6 100644
--- a/package/gstreamer1/gst1-plugins-bad/Config.in
+++ b/package/gstreamer1/gst1-plugins-bad/Config.in
@@ -698,8 +698,8 @@ config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_WEBP
 	help
 	  Webp image format plugin
 
-config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_WEBRTC
-	bool "webrtc"
+config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_WEBRTCDSP
+	bool "webrtcdsp"
 	# All depends from webrtc-audio-processing
 	depends on BR2_PACKAGE_WEBRTC_AUDIO_PROCESSING_ARCH_SUPPORTS
 	depends on BR2_INSTALL_LIBSTDCPP
@@ -710,7 +710,7 @@ config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_WEBRTC
 	help
 	  WebRTC echo-cancellation, gain control and noise suppression
 
-comment "webrtc needs a toolchain w/ C++, NPTL, gcc >= 4.8"
+comment "webrtcdsp needs a toolchain w/ C++, NPTL, gcc >= 4.8"
 	depends on BR2_PACKAGE_WEBRTC_AUDIO_PROCESSING_ARCH_SUPPORTS
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS_NPTL \
 		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
diff --git a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
index c6a151a..9f39bbf 100644
--- a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
+++ b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
@@ -813,11 +813,11 @@ else
 GST1_PLUGINS_BAD_CONF_OPTS += --disable-webp
 endif
 
-ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_WEBRTC),y)
-GST1_PLUGINS_BAD_CONF_OPTS += --enable-webrtc
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_WEBRTCDSP),y)
+GST1_PLUGINS_BAD_CONF_OPTS += --enable-webrtcdsp
 GST1_PLUGINS_BAD_DEPENDENCIES += webrtc-audio-processing
 else
-GST1_PLUGINS_BAD_CONF_OPTS += --disable-webrtc
+GST1_PLUGINS_BAD_CONF_OPTS += --disable-webrtcdsp
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_X265),y)
