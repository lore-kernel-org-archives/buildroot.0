From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 31 May 2014 17:56:49 +0200
Subject: [Buildroot] [PATCH] libdvdread: needs dynamic library support
Message-ID: <1401551809-2346-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:

  http://autobuild.buildroot.org/results/0ed/0ed3152a166a69d65a226e3cef755ed370cc245b/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gstreamer1/gst1-plugins-ugly/Config.in | 5 +++--
 package/libdvdnav/Config.in                    | 5 +++--
 package/libdvdread/Config.in                   | 5 +++--
 3 files changed, 9 insertions(+), 6 deletions(-)

diff --git a/package/gstreamer1/gst1-plugins-ugly/Config.in b/package/gstreamer1/gst1-plugins-ugly/Config.in
index ad9f13c..958b8c3 100644
--- a/package/gstreamer1/gst1-plugins-ugly/Config.in
+++ b/package/gstreamer1/gst1-plugins-ugly/Config.in
@@ -41,12 +41,13 @@ comment "plugins with external dependencies (there may be more available)"
 config BR2_PACKAGE_GST1_PLUGINS_UGLY_PLUGIN_DVDREAD
 	bool "dvdread"
 	depends on BR2_LARGEFILE # libdvdread
+	depends on !BR2_PREFER_STATIC_LIB # libdvdread
 	select BR2_PACKAGE_LIBDVDREAD
 	help
 	  Access a DVD with dvdread
 
-comment "dvdread needs a toolchain w/ largefile"
-	depends on !BR2_LARGEFILE
+comment "dvdread needs a toolchain w/ dynamic library, largefile"
+	depends on !BR2_LARGEFILE || BR2_PREFER_STATIC_LIB
 
 config BR2_PACKAGE_GST1_PLUGINS_UGLY_PLUGIN_LAME
 	bool "lame (*.mp3 audio encoder)"
diff --git a/package/libdvdnav/Config.in b/package/libdvdnav/Config.in
index 6378382..fed3b16 100644
--- a/package/libdvdnav/Config.in
+++ b/package/libdvdnav/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_LIBDVDNAV
 	bool "libdvdnav"
 	depends on BR2_LARGEFILE # libdvdread
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_PREFER_STATIC_LIB # libdvdread
 	select BR2_PACKAGE_LIBDVDREAD
 	help
 	  libdvdnav is a library that allows easy use of sophisticated
@@ -10,5 +11,5 @@ config BR2_PACKAGE_LIBDVDNAV
 
 	  http://www.mplayerhq.hu
 
-comment "libdvdnav needs a toolchain w/ largefile, threads"
-	depends on !BR2_LARGEFILE || !BR2_TOOLCHAIN_HAS_THREADS
+comment "libdvdnav needs a toolchain w/ dynamic library, largefile, threads"
+	depends on !BR2_LARGEFILE || !BR2_TOOLCHAIN_HAS_THREADS || BR2_PREEFER_STATIC_LIB
diff --git a/package/libdvdread/Config.in b/package/libdvdread/Config.in
index 94f4e62..65d3d40 100644
--- a/package/libdvdread/Config.in
+++ b/package/libdvdread/Config.in
@@ -1,11 +1,12 @@
 config BR2_PACKAGE_LIBDVDREAD
 	bool "libdvdread"
 	depends on BR2_LARGEFILE
+	depends on !BR2_PREFER_STATIC_LIB
 	help
 	  libdvdread provides a simple foundation for reading
 	  DVD-Video images.
 
 	  http://www.mplayerhq.hu/MPlayer/releases/dvdnav/
 
-comment "libdvdread needs a toolchain w/ largefile"
-	depends on !BR2_LARGEFILE
+comment "libdvdread needs a toolchain w/ dynamic library, largefile"
+	depends on !BR2_LARGEFILE || BR2_PREFER_STATIC_LIB
-- 
1.9.3
