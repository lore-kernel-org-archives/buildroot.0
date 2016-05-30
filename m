From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 30 May 2016 21:25:27 +0200
Subject: [Buildroot] [git commit] package/gstreamer/gst-ffmpeg: needs gcc >=
	5.x on SuperH
Message-ID: <20160530192959.B6C218010F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=89eeadfcfd2ecd92b43ecd4890ee5a067bd3b6c7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Compilation triggers an ICE in gcc with gcc <= 4.9 using this defconfig

BR2_sh=y
BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
BR2_PACKAGE_GSTREAMER=y
BR2_PACKAGE_GST_FFMPEG=y
BR2_PACKAGE_GST_FFMPEG_GPL=y

The problem is known upstream, a fix was never committed to gcc <= 4.9:
https://gcc.gnu.org/bugzilla/show_bug.cgi?id=65151

Compiling gst-ffmpeg with gcc5 works fine using this defconfig:

BR2_sh=y
BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
BR2_GCC_VERSION_5_X=y
BR2_PACKAGE_GSTREAMER=y
BR2_PACKAGE_GST_FFMPEG=y
BR2_PACKAGE_GST_FFMPEG_GPL=y

This patch adds a dependency to gcc >= 5.x to fix the problem as
suggested by Thomas:
http://lists.busybox.net/pipermail/buildroot/2016-February/152584.html

Fixes
http://autobuild.buildroot.net/results/939/939da0c7771ddd97c05cedc0a7afc0ad34a21312/

[Peter: fix ML link, simplify kconfig, add comment explaining why]
Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gstreamer/gst-ffmpeg/Config.in | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/gstreamer/gst-ffmpeg/Config.in b/package/gstreamer/gst-ffmpeg/Config.in
index 004ec1c..f3d4b3e 100644
--- a/package/gstreamer/gst-ffmpeg/Config.in
+++ b/package/gstreamer/gst-ffmpeg/Config.in
@@ -3,6 +3,8 @@ config BR2_PACKAGE_GST_FFMPEG
 	# Unsupported for MIPS R6. It bundles a version of libav which
 	# doesn't have support for MIPS R6.
 	depends on !BR2_mips_32r6 && !BR2_mips_64r6
+	# triggers https://gcc.gnu.org/bugzilla/show_bug.cgi?id=65151 on sh
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5 || !BR2_sh
 	select BR2_PACKAGE_GST_PLUGINS_BASE
 	help
 	  GStreamer plugin containing one plugin with a set of elements using
@@ -23,3 +25,6 @@ config BR2_PACKAGE_GST_FFMPEG_GPL
 	  be under GPL.
 
 endif
+
+comment "gst-ffmpeg needs a toolchain w/ gcc >= 5"
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_5 && BR2_sh
