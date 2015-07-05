From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 5 Jul 2015 14:50:42 +0200
Subject: [Buildroot] [git commit] package/opencv: add a choice for selecting
	gstreamer support
Message-ID: <20150705125130.6D71680DAE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=97daf3a08a746f8889c88a0c5baf02d6b9a86bad
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

OpenCV 3.0 support both gstreamer-0.10 and gstreamer-1.x, but only one
is used at the time.

This patch turns the gstreamer support into a choice, in order to prepare
adding the support for gstreamer-1 in a following patch.

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/opencv/Config.in |   12 ++++++++++--
 1 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/package/opencv/Config.in b/package/opencv/Config.in
index 576f667..4838a0c 100644
--- a/package/opencv/Config.in
+++ b/package/opencv/Config.in
@@ -173,8 +173,14 @@ config BR2_PACKAGE_OPENCV_WITH_FFMPEG
 	help
 	  Use ffmpeg from the target system.
 
+choice
+	prompt "gstreamer support"
+
+config BR2_PACKAGE_OPENCV_WITHOUT_GSTREAMER
+	bool "none"
+
 config BR2_PACKAGE_OPENCV_WITH_GSTREAMER
-	bool "gstreamer support"
+	bool "gstreamer-0.10"
 	depends on BR2_USE_MMU # gstreamer -> libglib2
 	depends on BR2_USE_WCHAR # gstreamer -> libglib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # gstreamer -> libglib2
@@ -182,10 +188,12 @@ config BR2_PACKAGE_OPENCV_WITH_GSTREAMER
 	select BR2_PACKAGE_GST_PLUGINS_BASE
 	select BR2_PACKAGE_GST_PLUGINS_BASE_PLUGIN_APP
 
-comment "gstreamer support needs a toolchain w/ wchar, threads"
+comment "gstreamer-0.10 support needs a toolchain w/ wchar, threads"
 	depends on BR2_USE_MMU
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
 
+endchoice
+
 config BR2_PACKAGE_OPENCV_WITH_GTK
 	bool "gtk support"
 	depends on BR2_PACKAGE_XORG7
