From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 26 May 2019 21:06:49 +0200
Subject: [Buildroot] [git commit] package/gstreamer1/gst1-plugins-good: add
 option to enable/disable jack plugin
Message-ID: <20190602201236.1F61D8EDF1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d3b0edbba14c343b299b96dfdeeebc465a71ba78
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Currently there is no explicit way to turn the jack plugin on or off.
Create a menu entry allowing users to disable or enable the plugin,
like we have for other features (for example the Pulseaudio plugin).

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gstreamer1/gst1-plugins-good/Config.in            | 13 +++++++++++++
 package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk |  2 +-
 2 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/package/gstreamer1/gst1-plugins-good/Config.in b/package/gstreamer1/gst1-plugins-good/Config.in
index 3af05ba6b4..433084fd6b 100644
--- a/package/gstreamer1/gst1-plugins-good/Config.in
+++ b/package/gstreamer1/gst1-plugins-good/Config.in
@@ -345,6 +345,19 @@ config BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_GDKPIXBUF
 comment "gdkpixbuf needs a toolchain w/ wchar, threads"
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
 
+config BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_JACK
+	bool "jack"
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on !BR2_STATIC_LIBS
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
+	select BR2_PACKAGE_JACK2
+	help
+	  JACK audio source/sink plugin
+
+comment "jack needs a toolchain w/ C++, dynamic library"
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
+	depends on !BR2_INSTALL_LIBSTDCPP || BR2_STATIC_LIBS
+
 config BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_PULSE
 	bool "pulseaudio"
 	depends on BR2_TOOLCHAIN_HAS_THREADS # pulseaudio
diff --git a/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk b/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk
index 462d5e1307..829d27a2da 100644
--- a/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk
+++ b/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk
@@ -30,7 +30,7 @@ GST1_PLUGINS_GOOD_CONF_OPTS += \
 
 GST1_PLUGINS_GOOD_DEPENDENCIES = gstreamer1 gst1-plugins-base
 
-ifeq ($(BR2_PACKAGE_JACK2),y)
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_JACK),y)
 GST1_PLUGINS_GOOD_CONF_OPTS += --enable-jack
 GST1_PLUGINS_GOOD_DEPENDENCIES += jack2
 else
