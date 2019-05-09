From: aduskett at gmail.com <aduskett@gmail.com>
Date: Thu,  9 May 2019 18:46:20 -0400
Subject: [Buildroot] [PATCH 2/5] package/gstreamer1/gst1-plugins-good: Add
 jack plugin
In-Reply-To: <20190509224624.80437-1-aduskett@gmail.com>
References: <20190509224624.80437-1-aduskett@gmail.com>
Message-ID: <20190509224624.80437-3-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

Currently there is no explicit way to turn the jack plugin on or off.
Create a menu entry allowing users to disable or enable the plugin.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
 package/gstreamer1/gst1-plugins-good/Config.in      | 13 +++++++++++++
 .../gst1-plugins-good/gst1-plugins-good.mk          |  2 +-
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
-- 
2.21.0
