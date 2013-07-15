From: Spenser Gilliland <spenser@gillilanding.com>
Date: Mon, 15 Jul 2013 14:47:23 -0500
Subject: [Buildroot] [PATCH 40/67] opencv: libglib2 requires threads
In-Reply-To: <1373917670-30006-1-git-send-email-spenser@gillilanding.com>
References: <1373917670-30006-1-git-send-email-spenser@gillilanding.com>
Message-ID: <1373917670-30006-41-git-send-email-spenser@gillilanding.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
---
 package/opencv/Config.in | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/package/opencv/Config.in b/package/opencv/Config.in
index 26bf5e7..c6ec3fe 100644
--- a/package/opencv/Config.in
+++ b/package/opencv/Config.in
@@ -139,16 +139,20 @@ comment "ffmpeg support requires a toolchain with LARGEFILE and IPV6 support"
 
 config BR2_PACKAGE_OPENCV_WITH_GSTREAMER
 	bool "gstreamer support"
-	depends on BR2_USE_WCHAR
-	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_USE_WCHAR # gstreamer -> libglib2
+	depends on BR2_TOOLCHAIN_HAS_THREADS # gstreamer -> libglib2
 	select BR2_PACKAGE_GSTREAMER
 	select BR2_PACKAGE_GST_PLUGINS_BASE
 	select BR2_PACKAGE_GST_PLUGINS_BASE_PLUGIN_APP
 
+comment "gstreamer support requires a toolchain with WCHAR and threading support"
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
+
 config BR2_PACKAGE_OPENCV_WITH_GTK
 	bool "gtk support"
 	depends on BR2_PACKAGE_XORG7||BR2_PACKAGE_DIRECTFB
-	depends on BR2_USE_WCHAR
+	depends on BR2_USE_WCHAR # libgtk2 -> libglib2
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libgtk2 -> libglib2
 	depends on BR2_INSTALL_LIBSTDCPP
 	select BR2_PACKAGE_LIBGTK2
 
-- 
1.8.1.2
