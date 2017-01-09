From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 9 Jan 2017 13:56:33 +0100
Subject: [Buildroot] [git commit] package/libvpx: disable on blackfin
Message-ID: <20170109125651.6068E8188E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f716d7e84a19ecbb3b8ad3767e69142164ff33a5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes
http://autobuild.buildroot.net/results/533/533810941afbdd71cdd3eaeeb654ec3728daade0/

Triggers toolchain issue:
/tmp/ccpKbTiO.s: Assembler messages:
/tmp/ccpKbTiO.s:3800: Error: pcrel too far BFD_RELOC_BFIN_5

[Peter: extend commit message]
Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gstreamer/gst-plugins-bad/Config.in    | 1 +
 package/gstreamer1/gst1-plugins-good/Config.in | 2 ++
 package/libvpx/Config.in                       | 2 ++
 package/tvheadend/Config.in                    | 2 +-
 4 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/package/gstreamer/gst-plugins-bad/Config.in b/package/gstreamer/gst-plugins-bad/Config.in
index d95edaa..d54415a 100644
--- a/package/gstreamer/gst-plugins-bad/Config.in
+++ b/package/gstreamer/gst-plugins-bad/Config.in
@@ -318,6 +318,7 @@ config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_VCD
 
 config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_VP8
 	bool "vp8"
+	depends on !BR2_bfin # libvpx
 	select BR2_PACKAGE_LIBVPX
 
 config BR2_PACKAGE_GST_PLUGINS_BAD_ZBAR
diff --git a/package/gstreamer1/gst1-plugins-good/Config.in b/package/gstreamer1/gst1-plugins-good/Config.in
index 95318d9..27f24f5 100644
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
index 6b0400c..67a4c57 100644
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
index b274a13..fc39d6f 100644
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
