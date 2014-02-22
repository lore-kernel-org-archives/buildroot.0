From: Ryan Barnett <ryanbarnett3@gmail.com>
Date: Sat, 22 Feb 2014 21:19:41 +0100
Subject: [Buildroot] [PATCH 1/1] mpg123: needs MMU
Message-ID: <1393100381-5380-1-git-send-email-rjbarnet@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

mpg123 needs MMU because the application that is built with this
package uses fork. Currently it is difficult to only build the
libraries for mpg123 so disabling the package all together when there
is no MMU support.

Note: mpg123 is an optional dependency of mpd but mpd already requires
BR2_USE_MMU so there is no need to add this as a dependency.

Signed-off-by: Ryan Barnett <rjbarnet@rockwellcollins.com>
---
 package/gstreamer1/gst1-plugins-bad/Config.in | 1 +
 package/mpg123/Config.in                      | 1 +
 2 files changed, 2 insertions(+)

diff --git a/package/gstreamer1/gst1-plugins-bad/Config.in b/package/gstreamer1/gst1-plugins-bad/Config.in
index 407bf31..3647e53 100644
--- a/package/gstreamer1/gst1-plugins-bad/Config.in
+++ b/package/gstreamer1/gst1-plugins-bad/Config.in
@@ -400,6 +400,7 @@ config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_MPEG2ENC
 config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_MPG123
 	bool "mpg123"
 	select BR2_PACKAGE_MPG123
+	depends on BR2_USE_MMU # mpg123
 	help
 	  mp3 decoding based on the mpg123 library
 
diff --git a/package/mpg123/Config.in b/package/mpg123/Config.in
index 18ac41c..a7ac035 100644
--- a/package/mpg123/Config.in
+++ b/package/mpg123/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_MPG123
 	bool "mpg123"
+	depends on BR2_USE_MMU # fork - in the application
 	help
 	  Fast, free and portable MPEG audio player for Unix.  It supports
 	  MPEG 1.0/2.0 layers 1, 2 and 3.
-- 
1.8.3.2
