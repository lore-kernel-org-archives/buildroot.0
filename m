From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 26 May 2019 21:22:35 +0200
Subject: [Buildroot] [git commit] package/gstreamer1/gst1-plugins-bad: add
 bluez plugin option
Message-ID: <20190602201236.39C40801CD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=500dd3b29f34515dbdd3c4199acb236eb10afe45
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Currently there is no explicit way to turn the bluez plugin on or off.
Create a menu entry allowing users to disable or enable the plugin.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
[Thomas: really replicate all dependencies of BR2_PACKAGE_BLUEZ_UTILS]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gstreamer1/gst1-plugins-bad/Config.in           | 14 ++++++++++++++
 package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk |  2 +-
 2 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/package/gstreamer1/gst1-plugins-bad/Config.in b/package/gstreamer1/gst1-plugins-bad/Config.in
index 35d6bddd05..b1232af16e 100644
--- a/package/gstreamer1/gst1-plugins-bad/Config.in
+++ b/package/gstreamer1/gst1-plugins-bad/Config.in
@@ -308,6 +308,20 @@ config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_ASSRENDER
 	bool "assrender"
 	select BR2_PACKAGE_LIBASS
 
+config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_BLUEZ
+	bool "bluez"
+	depends on !BR2_STATIC_LIBS # bluez_utils
+	depends on BR2_USE_WCHAR # bluez_utils
+	depends on BR2_TOOLCHAIN_HAS_THREADS # bluez_utils
+	depends on BR2_USE_MMU # bluez_utils
+	select BR2_PACKAGE_BLUEZ_UTILS
+	help
+	  Bluetooth audio A2DP/AVDTP sink, AVDTP source plugin
+
+comment "bluez plugin needs a toolchain w/ wchar, threads, dynamic library"
+	depends on BR2_USE_MMU
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
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
