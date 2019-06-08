From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sat, 8 Jun 2019 20:45:15 +0200
Subject: [Buildroot] [git commit] package/gstreamer1/gst1-plugins-bad:
 bluez-plugin depends on bluez5_utils
Message-ID: <20190608184649.0F9AD8B4DD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7c28f2d659c05cf1af1f6051d0668a252457dc0e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

autotools doesn't throw an error if bluez_utils is found and is older than
version 5. It just doesn't build the plugin. As such, select bluez5_utils
instead. This was found with the meson conversion, because meson does
throw an error.

All dependencies of bluez5_utils are added, though some of them are
already implicit by gstreamer1 itself. This simplifies things if the
dependencies change in the future (suggested by Thomas).

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
[Arnout: add bluez5_utils comment to dependencies, extend commit log]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/gstreamer1/gst1-plugins-bad/Config.in      | 22 +++++++++++++++-------
 .../gst1-plugins-bad/gst1-plugins-bad.mk           |  2 +-
 2 files changed, 16 insertions(+), 8 deletions(-)

diff --git a/package/gstreamer1/gst1-plugins-bad/Config.in b/package/gstreamer1/gst1-plugins-bad/Config.in
index e1e7b05a59..fa04a23bdf 100644
--- a/package/gstreamer1/gst1-plugins-bad/Config.in
+++ b/package/gstreamer1/gst1-plugins-bad/Config.in
@@ -310,17 +310,25 @@ config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_ASSRENDER
 
 config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_BLUEZ
 	bool "bluez"
-	depends on !BR2_STATIC_LIBS # bluez_utils
-	depends on BR2_USE_WCHAR # bluez_utils
-	depends on BR2_TOOLCHAIN_HAS_THREADS # bluez_utils
-	depends on BR2_USE_MMU # bluez_utils
-	select BR2_PACKAGE_BLUEZ_UTILS
+	depends on BR2_USE_WCHAR # bluez5_utils -> libglib2
+	depends on BR2_TOOLCHAIN_HAS_THREADS # bluez5_utils -> dbus, libglib2
+	depends on BR2_USE_MMU # bluez5_utils -> dbus
+	depends on !BR2_STATIC_LIBS # bluez5_utils -> uses dlfcn
+	depends on !BR2_PACKAGE_BLUEZ_UTILS # bluez5_utils -> conflicts with 4.x version
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_4 # bluez5_utils
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # bluez5_utils
+	select BR2_PACKAGE_BLUEZ5_UTILS
 	help
 	  Bluetooth audio A2DP/AVDTP sink, AVDTP source plugin
 
-comment "bluez plugin needs a toolchain w/ wchar, threads, dynamic library"
+comment "bluez plugin needs a toolchain w/ wchar, threads, headers >= 3.4, dynamic library"
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
+		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_4 || BR2_STATIC_LIBS
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on BR2_USE_MMU
-	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
+
+comment "bluez plugin conflicts with older bluez-utils version"
+	depends on BR2_PACKAGE_BLUEZ_UTILS
 
 config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_BZ2
 	bool "bz2"
diff --git a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
index 32edde4901..e21ffae3d9 100644
--- a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
+++ b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
@@ -84,7 +84,7 @@ GST1_PLUGINS_BAD_CONF_OPTS += --enable-orc
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_BLUEZ),y)
-GST1_PLUGINS_BAD_DEPENDENCIES += bluez_utils
+GST1_PLUGINS_BAD_DEPENDENCIES += bluez5_utils
 GST1_PLUGINS_BAD_CONF_OPTS += --enable-bluez
 else
 GST1_PLUGINS_BAD_CONF_OPTS += --disable-bluez
