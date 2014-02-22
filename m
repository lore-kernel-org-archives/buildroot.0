From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 22 Feb 2014 21:56:57 +0100
Subject: [Buildroot] [git commit] mpg123: needs MMU
Message-ID: <20140222210312.BFC6A9B2FF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f0862592b3caf5bc9cd347fd29634673cfbbabd7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

mpg123 needs MMU because the application that is built with this
package uses fork. Currently it is difficult to only build the
libraries for mpg123 so disabling the package all together when there
is no MMU support.

Note: mpg123 is an optional dependency of mpd but mpd already requires
BR2_USE_MMU so there is no need to add this as a dependency.

Fixes:
  http://autobuild.buildroot.net/results/5b0/5b053af566dd122ae7e58893e77d5d5f3070fb9e

Signed-off-by: Ryan Barnett <rjbarnet@rockwellcollins.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gstreamer1/gst1-plugins-bad/Config.in |    1 +
 package/mpg123/Config.in                      |    1 +
 2 files changed, 2 insertions(+), 0 deletions(-)

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
