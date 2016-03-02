From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed,  2 Mar 2016 18:33:31 -0300
Subject: [Buildroot] [PATCH] x265: depends on BR2_TOOLCHAIN_HAS_SYNC_4
Message-ID: <1456954411-6865-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It uses __sync_fetch_and_add_4() and other 32-bit atomics, fixes:
http://autobuild.buildroot.net/results/6cf/6cf4cdfdcd00f92176fd8a901884a3fd0c784f24/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/gstreamer1/gst1-plugins-bad/Config.in | 1 +
 package/x265/Config.in                        | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/package/gstreamer1/gst1-plugins-bad/Config.in b/package/gstreamer1/gst1-plugins-bad/Config.in
index 6e7d21d..68fed23 100644
--- a/package/gstreamer1/gst1-plugins-bad/Config.in
+++ b/package/gstreamer1/gst1-plugins-bad/Config.in
@@ -671,6 +671,7 @@ config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_X265
 	bool "x265"
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on !BR2_STATIC_LIBS
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # x265
 	select BR2_PACKAGE_X265
 	help
 	  x265 encoding plugin
diff --git a/package/x265/Config.in b/package/x265/Config.in
index f268e65..1d6eda2 100644
--- a/package/x265/Config.in
+++ b/package/x265/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_X265
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on !BR2_STATIC_LIBS # dlfcn
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	help
 	  x265 is an open source free software and library for encoding video
 	  using the High Efficiency Video Coding (HEVC/H.265) standard. x265 is
@@ -24,3 +25,4 @@ endif
 comment "x265 needs a toolchain w/ C++, threads, dynamic library"
 	depends on !BR2_INSTALL_LIBSTDCPP || BR2_STATIC_LIBS || \
 		!BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
-- 
2.4.10
