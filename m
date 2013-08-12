From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 12 Aug 2013 14:34:37 -0300
Subject: [Buildroot] [PATCH] wayland: needs threads
Message-ID: <1376328877-24327-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/383/383c6ac297250f87db9d03afa38d45b2c1adcb47/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/multimedia/gst1-plugins-bad/Config.in | 1 +
 package/wayland/Config.in                     | 4 ++++
 package/weston/Config.in                      | 1 +
 3 files changed, 6 insertions(+)

diff --git a/package/multimedia/gst1-plugins-bad/Config.in b/package/multimedia/gst1-plugins-bad/Config.in
index 878bf53..f30f2b3 100644
--- a/package/multimedia/gst1-plugins-bad/Config.in
+++ b/package/multimedia/gst1-plugins-bad/Config.in
@@ -355,6 +355,7 @@ config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_DIRECTFB
 
 config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_WAYLAND
 	bool "wayland"
+	depends on BR2_TOOLCHAIN_HAS_THREADS # wayland
 	select BR2_PACKAGE_WAYLAND
 	help
 	  Wayland Video Sink
diff --git a/package/wayland/Config.in b/package/wayland/Config.in
index e5d2649..591e0f0 100644
--- a/package/wayland/Config.in
+++ b/package/wayland/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_WAYLAND
 	bool "wayland"
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_PACKAGE_LIBFFI
 	select BR2_PACKAGE_EXPAT
 	help
@@ -8,3 +9,6 @@ config BR2_PACKAGE_WAYLAND
 	  of the protocol.
 
 	  http://wayland.freedesktop.org/
+
+comment "wayland requires a toolchain with thread support"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/weston/Config.in b/package/weston/Config.in
index 8871ce5..56eb135 100644
--- a/package/weston/Config.in
+++ b/package/weston/Config.in
@@ -11,6 +11,7 @@ config BR2_PACKAGE_WESTON
 	select BR2_PACKAGE_JPEG
 	select BR2_PACKAGE_MTDEV
 	depends on BR2_PACKAGE_UDEV
+	depends on BR2_TOOLCHAIN_HAS_THREADS # wayland
 	# Runtime dependency
 	select BR2_PACKAGE_XKEYBOARD_CONFIG
 	# Make sure at least one backend is selected
-- 
1.8.1.5
