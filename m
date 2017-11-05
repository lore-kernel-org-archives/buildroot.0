From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun, 5 Nov 2017 21:31:22 +0100
Subject: [Buildroot] [PATCH] gstreamer: needs dynamic libraries
Message-ID: <20171105203122.23724-1-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

g_cclosure_marshal_VOID__VOID is defined both in libgobject.a and
libgstreamer.a. It is probably possible to fix this, but gstreamer0.10
has been deprecated for a long time now and is anyway unlikely to be
used in static-only situations, so let's just require dynamic linking.

Propagate to the reverse dependencies. opencv3 already did depend on
dynamic libs.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/gstreamer/gstreamer/Config.in | 6 ++++--
 package/libplayer/Config.in           | 6 ++++--
 package/opencv/Config.in              | 7 +++++--
 3 files changed, 13 insertions(+), 6 deletions(-)

diff --git a/package/gstreamer/gstreamer/Config.in b/package/gstreamer/gstreamer/Config.in
index eb1249ac5f..99c90f1a14 100644
--- a/package/gstreamer/gstreamer/Config.in
+++ b/package/gstreamer/gstreamer/Config.in
@@ -1,12 +1,14 @@
-comment "gstreamer 0.10 needs a toolchain w/ wchar, threads"
+comment "gstreamer 0.10 needs a toolchain w/ wchar, threads, dynamic library"
 	depends on BR2_USE_MMU
-	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
+		BR2_STATIC_LIBS
 
 config BR2_PACKAGE_GSTREAMER
 	bool "gstreamer 0.10"
 	depends on BR2_USE_WCHAR # glib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
 	depends on BR2_USE_MMU # glib2
+	depends on !BR2_STATIC_LIBS
 	select BR2_PACKAGE_LIBGLIB2
 	help
 	  GStreamer is an open source multimedia framework.
diff --git a/package/libplayer/Config.in b/package/libplayer/Config.in
index 0ae558d8df..82083a0eea 100644
--- a/package/libplayer/Config.in
+++ b/package/libplayer/Config.in
@@ -20,11 +20,13 @@ config BR2_PACKAGE_LIBPLAYER_GSTREAMER
 	depends on BR2_USE_WCHAR # glib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
 	depends on BR2_USE_MMU # glib2
+	depends on !BR2_STATIC_LIBS # gstreamer
 	select BR2_PACKAGE_GSTREAMER
 
-comment "gstreamer backend needs a toolchain w/ wchar, threads"
+comment "gstreamer backend needs a toolchain w/ wchar, threads, dynamic library"
 	depends on BR2_USE_MMU
-	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
+		BR2_STATIC_LIBS
 endif
 
 comment "libplayer needs a toolchain w/ threads"
diff --git a/package/opencv/Config.in b/package/opencv/Config.in
index 742ae3ebba..26109a707d 100644
--- a/package/opencv/Config.in
+++ b/package/opencv/Config.in
@@ -208,13 +208,16 @@ config BR2_PACKAGE_OPENCV_WITH_GSTREAMER
 	depends on BR2_USE_MMU # gstreamer -> libglib2
 	depends on BR2_USE_WCHAR # gstreamer -> libglib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # gstreamer -> libglib2
+	depends on !BR2_STATIC_LIBS # gstreamer
 	select BR2_PACKAGE_GSTREAMER
 	select BR2_PACKAGE_GST_PLUGINS_BASE
 	select BR2_PACKAGE_GST_PLUGINS_BASE_PLUGIN_APP
 
-comment "gstreamer-0.10 support needs a toolchain w/ wchar, threads"
+comment "gstreamer-0.10 support needs a toolchain w/ wchar, threads, dynamic library"
 	depends on BR2_USE_MMU
-	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
+		BR2_STATIC_LIBS
+
 
 config BR2_PACKAGE_OPENCV_WITH_GSTREAMER1
 	bool "gstreamer-1.x"
-- 
2.15.0
