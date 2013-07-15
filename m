From: Spenser Gilliland <spenser@gillilanding.com>
Date: Mon, 15 Jul 2013 14:47:41 -0500
Subject: [Buildroot] [PATCH 58/67] gst-plugins-bad: libglib2 requires threads
In-Reply-To: <1373917670-30006-1-git-send-email-spenser@gillilanding.com>
References: <1373917670-30006-1-git-send-email-spenser@gillilanding.com>
Message-ID: <1373917670-30006-59-git-send-email-spenser@gillilanding.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
---
 package/multimedia/gst-plugins-bad/Config.in | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/package/multimedia/gst-plugins-bad/Config.in b/package/multimedia/gst-plugins-bad/Config.in
index 2271036..3c5c161 100644
--- a/package/multimedia/gst-plugins-bad/Config.in
+++ b/package/multimedia/gst-plugins-bad/Config.in
@@ -277,8 +277,13 @@ config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_FAAD
 
 config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_LIBMMS
 	bool "libmms"
+	depends on BR2_USE_WCHAR # libmms -> libglib2
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libmms -> libglib2
 	select BR2_PACKAGE_LIBMMS
 
+comment "libmms requires a toolchain with WCHAR and threading support"
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
+
 config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_MUSEPACK
 	bool "musepack"
 	select BR2_PACKAGE_MUSEPACK
@@ -294,10 +299,13 @@ config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_OPUS
 config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_RSVG
 	bool "rsvg"
 	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_USE_WCHAR # librsvg -> libglib2
+	depends on BR2_TOOLCHAIN_HAS_THREADS # librsvg -> libglib2
 	select BR2_PACKAGE_LIBRSVG
 
-comment "rsvg plugin requires a toolchain with C++ support"
-	depends on !BR2_INSTALL_LIBSTDCPP
+comment "rsvg plugin requires a toolchain with C++, WCHAR, and threading support"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
+		!BR2_TOOLCHAIN_HAS_THREADS
 
 config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_SDL
 	bool "sdl"
-- 
1.8.1.2
