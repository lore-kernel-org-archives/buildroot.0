From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 26 Nov 2017 22:00:17 +0100
Subject: [Buildroot] [git commit branch/2017.02.x] gstreamer: needs dynamic
 libraries
Message-ID: <20171126213911.30BED8157F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=db87bb911f02777baf816059b43e573d2d69feb3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

Fixes:
http://autobuild.buildroot.net/results/49d/49dcec0bd2f3bb78c18675a9fa5c9c53cc183fd2/

g_cclosure_marshal_VOID__VOID is defined both in libgobject.a and
libgstreamer.a. It is probably possible to fix this, but gstreamer0.10
has been deprecated for a long time now and is anyway unlikely to be
used in static-only situations, so let's just require dynamic linking.

Propagate to the reverse dependencies. opencv3 already did depend on
dynamic libs.

[Peter: add autobuild reference]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 0eee5465e51229c4c17d7930ca2095caace4f8d2)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gstreamer/gstreamer/Config.in | 6 ++++--
 package/libplayer/Config.in           | 6 ++++--
 package/opencv/Config.in              | 7 +++++--
 3 files changed, 13 insertions(+), 6 deletions(-)

diff --git a/package/gstreamer/gstreamer/Config.in b/package/gstreamer/gstreamer/Config.in
index eb1249a..99c90f1 100644
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
index 37fbb26..82293c0 100644
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
 
 config BR2_PACKAGE_LIBPLAYER_PYTHON
 	depends on BR2_PACKAGE_PYTHON
diff --git a/package/opencv/Config.in b/package/opencv/Config.in
index c046baa..5de4cf7 100644
--- a/package/opencv/Config.in
+++ b/package/opencv/Config.in
@@ -211,13 +211,16 @@ config BR2_PACKAGE_OPENCV_WITH_GSTREAMER
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
