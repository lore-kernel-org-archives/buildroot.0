From: Spenser Gilliland <spenser@gillilanding.com>
Date: Mon, 15 Jul 2013 14:47:44 -0500
Subject: [Buildroot] [PATCH 61/67] gst1-plugins-good: libglib2 requires
	threads
In-Reply-To: <1373917670-30006-1-git-send-email-spenser@gillilanding.com>
References: <1373917670-30006-1-git-send-email-spenser@gillilanding.com>
Message-ID: <1373917670-30006-62-git-send-email-spenser@gillilanding.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
---
 package/multimedia/gst1-plugins-good/Config.in | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/package/multimedia/gst1-plugins-good/Config.in b/package/multimedia/gst1-plugins-good/Config.in
index e579539..8031a63 100644
--- a/package/multimedia/gst1-plugins-good/Config.in
+++ b/package/multimedia/gst1-plugins-good/Config.in
@@ -288,9 +288,14 @@ config BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_FLAC
 config BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_GDKPIXBUF
 	bool "gdkpixbuf"
 	select BR2_PACKAGE_GDK_PIXBUF
+	depends on BR2_USE_WCHAR # gdk-pixbuf -> libglib2
+	depends on BR2_TOOLCHAIN_HAS_THREADS # gdk-pixbuf -> libglib2
 	help
 	  GdkPixbuf-based image decoder, overlay and sink
 
+comment "gdkpixbuf requires a toolchain with WCHAR and threading support"
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
+
 config BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_PULSE
 	depends on BR2_TOOLCHAIN_HAS_THREADS # pulseaudio
 	depends on BR2_LARGEFILE # pulseaudio -> libsndfile
@@ -301,10 +306,15 @@ config BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_PULSE
 
 config BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_SOUPHTTPSRC
 	bool "souphttpsrc (http client)"
+	depends on BR2_USE_WCHAR # libsoup -> glib2
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libsoup -> glib2
 	select BR2_PACKAGE_LIBSOUP
 	help
 	  libsoup HTTP client src/sink
 
+comment "souphttpsrc requires a toolchain with WCHAR and threading support"
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
+
 config BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_SPEEX
 	bool "speex"
 	select BR2_PACKAGE_SPEEX
-- 
1.8.1.2
