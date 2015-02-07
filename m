From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 7 Feb 2015 21:03:26 +0100
Subject: [Buildroot] [git commit] gst-plugins-base: add missing indirect
	dependency on atomics for pango
Message-ID: <20150207202910.0FB878046C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=040c15c45a36e96883257c56a5469e026055ffbb
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also removed the redundant indirect dependencies on wchar, threads, mmu
(gstreamer depends on libglib2 so this indirect dependency is obvious).

[Peter: drop wchar+threads from comment as suggested by Jerzy Grzegorek]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gstreamer/gst-plugins-base/Config.in |   12 +++++-------
 1 files changed, 5 insertions(+), 7 deletions(-)

diff --git a/package/gstreamer/gst-plugins-base/Config.in b/package/gstreamer/gst-plugins-base/Config.in
index ccc88f7..8ececea 100644
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
 
-comment "pango plugin needs a toolchain w/ C++, wchar, threads"
-	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
-		!BR2_TOOLCHAIN_HAS_THREADS
+comment "pango plugin needs a toolchain w/ C++"
+	depends on !BR2_INSTALL_LIBSTDCPP
+	depends on BR2_ARCH_HAS_ATOMICS
 
 config BR2_PACKAGE_GST_PLUGINS_BASE_PLUGIN_THEORA
 	bool "theora (*.ogg video)"
