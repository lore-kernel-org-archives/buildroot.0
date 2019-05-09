From: aduskett at gmail.com <aduskett@gmail.com>
Date: Thu,  9 May 2019 18:46:23 -0400
Subject: [Buildroot] [PATCH 4/4] package/gstreamer1/gst1-plugins-bad: Add
 bluez plugin
In-Reply-To: <20190509224624.80437-1-aduskett@gmail.com>
References: <20190509224624.80437-1-aduskett@gmail.com>
Message-ID: <20190509224624.80437-6-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

Currently there is no explicit way to turn the bluez plugin on or off.
Create a menu entry allowing users to disable or enable the plugin.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
 package/gstreamer1/gst1-plugins-bad/Config.in          | 10 ++++++++++
 .../gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk    |  2 +-
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/package/gstreamer1/gst1-plugins-bad/Config.in b/package/gstreamer1/gst1-plugins-bad/Config.in
index 35d6bddd05..b0b253bf12 100644
--- a/package/gstreamer1/gst1-plugins-bad/Config.in
+++ b/package/gstreamer1/gst1-plugins-bad/Config.in
@@ -308,6 +308,16 @@ config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_ASSRENDER
 	bool "assrender"
 	select BR2_PACKAGE_LIBASS
 
+config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_BLUEZ
+	bool "bluez"
+	depends on !BR2_STATIC_LIBS
+	select BR2_PACKAGE_BLUEZ_UTILS
+	help
+	  Bluetooth audio A2DP/AVDTP sink, AVDTP source plugin
+
+comment "bluez needs a toolchain w/ dynamic library"
+	depends on BR2_STATIC_LIBS
+
 config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_BZ2
 	bool "bz2"
 	select BR2_PACKAGE_BZIP2
diff --git a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
index ad1adbc385..32edde4901 100644
--- a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
+++ b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
@@ -83,7 +83,7 @@ GST1_PLUGINS_BAD_DEPENDENCIES += orc
 GST1_PLUGINS_BAD_CONF_OPTS += --enable-orc
 endif
 
-ifeq ($(BR2_PACKAGE_BLUEZ_UTILS),y)
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_BLUEZ),y)
 GST1_PLUGINS_BAD_DEPENDENCIES += bluez_utils
 GST1_PLUGINS_BAD_CONF_OPTS += --enable-bluez
 else
-- 
2.21.0
