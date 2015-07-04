From: Samuel Martin <s.martin49@gmail.com>
Date: Sat,  4 Jul 2015 21:06:55 +0200
Subject: [Buildroot] [PATCH v7 1/7] package/opencv: add a choice for
	selecting gstreamer support
In-Reply-To: <1436036821-10073-1-git-send-email-s.martin49@gmail.com>
References: <1436036821-10073-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1436036821-10073-2-git-send-email-s.martin49@gmail.com>
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
changes v6->v7:
- move gstreamer comment inside the choice (Yann)

changes v5->v6:
- new patch
---
 package/opencv/Config.in | 20 +++++++++++++++-----
 1 file changed, 15 insertions(+), 5 deletions(-)

diff --git a/package/opencv/Config.in b/package/opencv/Config.in
index 576f667..c3b7535 100644
--- a/package/opencv/Config.in
+++ b/package/opencv/Config.in
@@ -173,19 +173,29 @@ config BR2_PACKAGE_OPENCV_WITH_FFMPEG
 	help
 	  Use ffmpeg from the target system.
 
+choice
+	prompt "gstreamer support"
+	help
+	  OpenCV prefers gstreamer-1 over gstreamer-0.10.
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
+	depends on BR2_USE_MMU # libglib2
+	depends on BR2_USE_WCHAR # libglib2
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
 	select BR2_PACKAGE_GSTREAMER
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
-- 
2.4.5
