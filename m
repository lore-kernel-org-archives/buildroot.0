From: Samuel Martin <s.martin49@gmail.com>
Date: Thu, 25 Jun 2015 21:59:50 +0200
Subject: [Buildroot] [PATCH v6 09/16] package/opencv: add a choice for
	selecting gstreamer support
In-Reply-To: <1435262397-888-1-git-send-email-s.martin49@gmail.com>
References: <1435262397-888-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1435262397-888-10-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

OpenCV 3.0 support both gstreamer-0.10 and gstreamer-1.x, but only one
is used at the time.

This patch turns the gstreamer support into a choice, in order to prepare
adding the support for gstreamer-1 in a following patch.

Signed-off-by: Samuel Martin <s.martin49@gmail.com>

---
changes v5->v6:
- new patch
---
 package/opencv/Config.in | 23 ++++++++++++++++-------
 1 file changed, 16 insertions(+), 7 deletions(-)

diff --git a/package/opencv/Config.in b/package/opencv/Config.in
index 8ed505e..4b571e0 100644
--- a/package/opencv/Config.in
+++ b/package/opencv/Config.in
@@ -177,18 +177,27 @@ config BR2_PACKAGE_OPENCV_WITH_FFMPEG
 	help
 	  Use ffmpeg from the target system.
 
+comment "gstreamer support needs a toolchain w/ wchar, threads"
+	depends on BR2_USE_MMU
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
+
+choice
+	prompt "gstreamer support"
+	depends on BR2_USE_MMU # libglib2
+	depends on BR2_USE_WCHAR # libglib2
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
+
+config BR2_PACKAGE_OPENCV_WITHOUT_GSTREAMER
+	bool "none"
+
 config BR2_PACKAGE_OPENCV_WITH_GSTREAMER
-	bool "gstreamer support"
-	depends on BR2_USE_MMU # gstreamer -> libglib2
-	depends on BR2_USE_WCHAR # gstreamer -> libglib2
-	depends on BR2_TOOLCHAIN_HAS_THREADS # gstreamer -> libglib2
+	bool "gstreamer-0.10"
 	select BR2_PACKAGE_GSTREAMER
 	select BR2_PACKAGE_GST_PLUGINS_BASE
 	select BR2_PACKAGE_GST_PLUGINS_BASE_PLUGIN_APP
 
-comment "gstreamer support needs a toolchain w/ wchar, threads"
-	depends on BR2_USE_MMU
-	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
+
+endchoice
 
 config BR2_PACKAGE_OPENCV_WITH_GTK
 	bool "gtk support"
-- 
2.4.4
