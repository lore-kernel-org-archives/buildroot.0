From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 13 Nov 2015 16:08:16 +0100
Subject: [Buildroot] [git commit] x265: needs dynamic library
Message-ID: <20151113152122.DA1017FFBC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6375c462e0aa32eb2d1a375110722be18cdd66e9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/60f/60fc8d54ec61c96e9beaa84154fe8d7e61e55d4e/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gstreamer1/gst1-plugins-bad/Config.in |    5 +++--
 package/x265/Config.in                        |    6 ++++--
 2 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/package/gstreamer1/gst1-plugins-bad/Config.in b/package/gstreamer1/gst1-plugins-bad/Config.in
index 26a963e..f771401 100644
--- a/package/gstreamer1/gst1-plugins-bad/Config.in
+++ b/package/gstreamer1/gst1-plugins-bad/Config.in
@@ -636,11 +636,12 @@ config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_HLS
 config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_X265
 	bool "x265"
 	depends on BR2_INSTALL_LIBSTDCPP
+	depends on !BR2_STATIC_LIBS
 	select BR2_PACKAGE_X265
 	help
 	  x265 encoding plugin
 
-comment "x265 needs a toolchain w/ C++"
-	depends on !BR2_INSTALL_LIBSTDCPP
+comment "x265 needs a toolchain w/ C++, dynamic library"
+	depends on !BR2_INSTALL_LIBSTDCPP || BR2_STATIC_LIBS
 
 endif
diff --git a/package/x265/Config.in b/package/x265/Config.in
index 15ae933..f268e65 100644
--- a/package/x265/Config.in
+++ b/package/x265/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_X265
 	bool "x265"
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_STATIC_LIBS # dlfcn
 	help
 	  x265 is an open source free software and library for encoding video
 	  using the High Efficiency Video Coding (HEVC/H.265) standard. x265 is
@@ -20,5 +21,6 @@ config BR2_PACKAGE_X265_CLI
 
 endif
 
-comment "x265 needs a toolchain w/ C++, threads"
-	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
+comment "x265 needs a toolchain w/ C++, threads, dynamic library"
+	depends on !BR2_INSTALL_LIBSTDCPP || BR2_STATIC_LIBS || \
+		!BR2_TOOLCHAIN_HAS_THREADS
