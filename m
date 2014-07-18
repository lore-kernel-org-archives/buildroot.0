From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 18 Jul 2014 10:07:26 +0200
Subject: [Buildroot] [git commit] opencv: since 2.4.8 bump, requires NPTL
Message-ID: <20140718080841.B92DE9D27D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=26043fdbf0779ada46efa44a009933180c21cf29
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The core module of OpenCV is now using the pthread_spin_*() API, which
is only available in the 'linuxthreads' and 'NPTL' thread
implementations, but not in the 'linuxthreads.old'
implementation. Therefore, this commit adds a dependency on OpenCV to
NPTL threads.

Fixes:

  http://autobuild.buildroot.org/results/75d/75db3827ec4be8a3805508a22b8b6a4d1a3b9ce3/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gstreamer1/gst1-plugins-bad/Config.in |    5 +++--
 package/opencv/Config.in                      |    6 +++---
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/gstreamer1/gst1-plugins-bad/Config.in b/package/gstreamer1/gst1-plugins-bad/Config.in
index 02fa18c..054ed87 100644
--- a/package/gstreamer1/gst1-plugins-bad/Config.in
+++ b/package/gstreamer1/gst1-plugins-bad/Config.in
@@ -425,6 +425,7 @@ config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_NEON
 config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_OPENCV
 	bool "opencv"
 	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	select BR2_PACKAGE_OPENCV
 	# Remove the following opencv modules when gstreamer fixes the
 	# problem of including the old "cv.h" header
@@ -441,8 +442,8 @@ config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_OPENCV
 	help
 	  GStreamer OpenCV Plugins
 
-comment "opencv plugin needs a toolchain w/ C++"
-	depends on !BR2_INSTALL_LIBSTDCPP
+comment "opencv plugin needs a toolchain w/ C++, NPTL"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS_NPTL
 
 config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_OPUS
 	bool "opus"
diff --git a/package/opencv/Config.in b/package/opencv/Config.in
index bec9b9e..6e938d2 100644
--- a/package/opencv/Config.in
+++ b/package/opencv/Config.in
@@ -1,7 +1,7 @@
 menuconfig BR2_PACKAGE_OPENCV
 	bool "opencv"
 	select BR2_PACKAGE_ZLIB
-	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_WCHAR
 	help
@@ -228,5 +228,5 @@ config BR2_PACKAGE_OPENCV_INSTALL_DATA
 
 endif # BR2_PACKAGE_OPENCV
 
-comment "opencv needs a toolchain w/ C++, threads, wchar"
-	depends on !(BR2_INSTALL_LIBSTDCPP  && BR2_USE_WCHAR && BR2_TOOLCHAIN_HAS_THREADS)
+comment "opencv needs a toolchain w/ C++, NPTL, wchar"
+	depends on !(BR2_INSTALL_LIBSTDCPP && BR2_USE_WCHAR && BR2_TOOLCHAIN_HAS_THREADS_NPTL)
