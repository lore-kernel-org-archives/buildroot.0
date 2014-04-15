From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 15 Apr 2014 21:09:18 +0200
Subject: [Buildroot] [git commit] flac: needs wchar
Message-ID: <20140415190927.3C6809C7C7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1bf512e9fff9fef1eb5f58c3279ca007cbabd0ab
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/873/873a1b3551c5fe04fa477fd682ff91fecdd41606/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/flac/Config.in                         |    4 ++++
 package/gstreamer/gst-plugins-good/Config.in   |    4 ++++
 package/gstreamer1/gst1-plugins-good/Config.in |    4 ++++
 package/minidlna/Config.in                     |    5 +++--
 package/mpd/Config.in                          |    2 +-
 5 files changed, 16 insertions(+), 3 deletions(-)

diff --git a/package/flac/Config.in b/package/flac/Config.in
index 06f170b..267acb7 100644
--- a/package/flac/Config.in
+++ b/package/flac/Config.in
@@ -1,6 +1,10 @@
 config BR2_PACKAGE_FLAC
 	bool "flac"
+	depends on BR2_USE_WCHAR
 	help
 	  FLAC is an Open Source lossless audio codec.
 
 	  http://flac.sourceforge.net/
+
+comment "flac needs a toolchain w/ wchar"
+	depends on !BR2_USE_WCHAR
diff --git a/package/gstreamer/gst-plugins-good/Config.in b/package/gstreamer/gst-plugins-good/Config.in
index 254dbcb..9c2b884 100644
--- a/package/gstreamer/gst-plugins-good/Config.in
+++ b/package/gstreamer/gst-plugins-good/Config.in
@@ -183,8 +183,12 @@ config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_CAIRO
 
 config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_FLAC
 	bool "flac (libFLAC)"
+	depends on BR2_USE_WCHAR # flac
 	select BR2_PACKAGE_FLAC
 
+comment "flac needs a toolchain w/ wchar"
+	depends on !BR2_USE_WCHAR
+
 config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_GDKPIXBUF
 	bool "gdkpixbuf"
 	depends on BR2_USE_WCHAR # gdk-pixbuf -> libglib2
diff --git a/package/gstreamer1/gst1-plugins-good/Config.in b/package/gstreamer1/gst1-plugins-good/Config.in
index 818412c..9fd6114 100644
--- a/package/gstreamer1/gst1-plugins-good/Config.in
+++ b/package/gstreamer1/gst1-plugins-good/Config.in
@@ -281,10 +281,14 @@ config BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_CAIRO
 
 config BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_FLAC
 	bool "flac (libFLAC)"
+	depends on BR2_USE_WCHAR # flac
 	select BR2_PACKAGE_FLAC
 	help
 	  The FLAC Lossless compressor Codec
 
+comment "flac needs a toolchain w/ wchar"
+	depends on !BR2_USE_WCHAR
+
 config BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_GDKPIXBUF
 	bool "gdkpixbuf"
 	select BR2_PACKAGE_GDK_PIXBUF
diff --git a/package/minidlna/Config.in b/package/minidlna/Config.in
index 02720e9..4a46b0c 100644
--- a/package/minidlna/Config.in
+++ b/package/minidlna/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_MINIDLNA
 	bool "minidlna"
 	depends on BR2_LARGEFILE # ffmpeg
 	depends on BR2_INET_IPV6 # ffmpeg
+	depends on BR2_USE_WCHAR # flac
 	depends on BR2_USE_MMU # fork
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_PACKAGE_FFMPEG
@@ -20,6 +21,6 @@ config BR2_PACKAGE_MINIDLNA
 
 	  http://minidlna.sourceforge.net/
 
-comment "minidlna needs a toolchain w/ largefile, IPv6, threads"
+comment "minidlna needs a toolchain w/ largefile, IPv6, threads, wchar"
 	depends on BR2_USE_MMU
-	depends on !(BR2_LARGEFILE && BR2_INET_IPV6 && BR2_TOOLCHAIN_HAS_THREADS)
+	depends on !(BR2_LARGEFILE && BR2_INET_IPV6 && BR2_TOOLCHAIN_HAS_THREADS && BR2_USE_WCHAR)
diff --git a/package/mpd/Config.in b/package/mpd/Config.in
index 063c65d..7237b89 100644
--- a/package/mpd/Config.in
+++ b/package/mpd/Config.in
@@ -1,7 +1,7 @@
 menuconfig BR2_PACKAGE_MPD
 	bool "mpd"
 	depends on BR2_INSTALL_LIBSTDCPP
-	depends on BR2_USE_WCHAR # libglib2
+	depends on BR2_USE_WCHAR # libglib2, flac
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
 	depends on BR2_USE_MMU # libglib2
 	# avr32, sparc & CS powerpc gcc are too old
