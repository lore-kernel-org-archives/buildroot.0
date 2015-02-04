From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Wed,  4 Feb 2015 01:34:02 +0100
Subject: [Buildroot] [PATCH 04/21] gst-plugins-base: add missing indirect
	dependency on atomics for pango
In-Reply-To: <1423010059-23446-1-git-send-email-arnout@mind.be>
References: <1423010059-23446-1-git-send-email-arnout@mind.be>
Message-ID: <1423010059-23446-5-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also removed the redundant indirect dependencies on wchar, threads, mmu
(gstreamer depends on libglib2 so this indirect dependency is obvious).

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/gstreamer/gst-plugins-base/Config.in | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/package/gstreamer/gst-plugins-base/Config.in b/package/gstreamer/gst-plugins-base/Config.in
index ccc88f7..02c5bab 100644
--- a/package/gstreamer/gst-plugins-base/Config.in
+++ b/package/gstreamer/gst-plugins-base/Config.in
@@ -84,15 +84,13 @@ config BR2_PACKAGE_GST_PLUGINS_BASE_PLUGIN_OGG
 
 config BR2_PACKAGE_GST_PLUGINS_BASE_PLUGIN_PANGO
 	bool "pango font renderer"
-	depends on BR2_INSTALL_LIBSTDCPP
-	depends on BR2_USE_WCHAR # pango -> libglib2
-	depends on BR2_TOOLCHAIN_HAS_THREADS # pango -> libglib2
-	depends on BR2_USE_MMU # pango -> glib2
+	depends on BR2_INSTALL_LIBSTDCPP # pango -> freetype
+	depends on BR2_ARCH_HAS_ATOMICS # pango -> cairo
 	select BR2_PACKAGE_PANGO
 
 comment "pango plugin needs a toolchain w/ C++, wchar, threads"
-	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
-		!BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_INSTALL_LIBSTDCPP
+	depends on BR2_ARCH_HAS_ATOMICS
 
 config BR2_PACKAGE_GST_PLUGINS_BASE_PLUGIN_THEORA
 	bool "theora (*.ogg video)"
-- 
2.1.4
