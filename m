From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue, 27 Dec 2016 11:44:56 +0100
Subject: [Buildroot] [PATCH 1/1] package/libvpx: disable on blackfin
Message-ID: <20161227104456.24379-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes
http://autobuild.buildroot.net/results/533/533810941afbdd71cdd3eaeeb654ec3728daade0/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/gstreamer/gst-plugins-bad/Config.in    | 1 +
 package/gstreamer1/gst1-plugins-good/Config.in | 2 ++
 package/libvpx/Config.in                       | 2 ++
 package/tvheadend/Config.in                    | 2 +-
 4 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/package/gstreamer/gst-plugins-bad/Config.in b/package/gstreamer/gst-plugins-bad/Config.in
index d95edaa57..d54415a17 100644
--- a/package/gstreamer/gst-plugins-bad/Config.in
+++ b/package/gstreamer/gst-plugins-bad/Config.in
@@ -318,6 +318,7 @@ config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_VCD
 
 config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_VP8
 	bool "vp8"
+	depends on !BR2_bfin # libvpx
 	select BR2_PACKAGE_LIBVPX
 
 config BR2_PACKAGE_GST_PLUGINS_BAD_ZBAR
diff --git a/package/gstreamer1/gst1-plugins-good/Config.in b/package/gstreamer1/gst1-plugins-good/Config.in
index 95318d988..27f24f5e7 100644
--- a/package/gstreamer1/gst1-plugins-good/Config.in
+++ b/package/gstreamer1/gst1-plugins-good/Config.in
@@ -361,11 +361,13 @@ comment "taglib needs a toolchain w/ C++, wchar"
 config BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_VPX
 	bool "vpx (webm)"
 	select BR2_PACKAGE_LIBVPX
+	depends on !BR2_bfin # libvpx
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libvpx
 	help
 	  VP8 plugin
 
 comment "libvpx needs a toolchain w/ threads"
+	depends on !BR2_bfin
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
 
 config BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_WAVPACK
diff --git a/package/libvpx/Config.in b/package/libvpx/Config.in
index 6b0400c0a..67a4c578f 100644
--- a/package/libvpx/Config.in
+++ b/package/libvpx/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_LIBVPX
 	bool "libvpx"
+	depends on !BR2_bfin
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	help
 	  A high-quality, open video format that's freely available to
@@ -8,4 +9,5 @@ config BR2_PACKAGE_LIBVPX
 	  http://webmproject.org
 
 comment "libvpx needs a toolchain w/ threads"
+	depends on !BR2_bfin
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/tvheadend/Config.in b/package/tvheadend/Config.in
index b274a1309..fc39d6f48 100644
--- a/package/tvheadend/Config.in
+++ b/package/tvheadend/Config.in
@@ -12,7 +12,7 @@ config BR2_PACKAGE_TVHEADEND
 	select BR2_PACKAGE_DTV_SCAN_TABLES
 	select BR2_PACKAGE_FFMPEG_AVRESAMPLE if BR2_PACKAGE_FFMPEG
 	select BR2_PACKAGE_FFMPEG_SWSCALE if BR2_PACKAGE_FFMPEG
-	select BR2_PACKAGE_LIBVPX if BR2_PACKAGE_FFMPEG
+	select BR2_PACKAGE_LIBVPX if BR2_PACKAGE_FFMPEG && !BR2_bfin # libvpx
 	select BR2_PACKAGE_X264 if BR2_PACKAGE_FFMPEG
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 	select BR2_PACKAGE_OPENSSL
-- 
2.11.0
