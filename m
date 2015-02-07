From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 7 Feb 2015 21:04:06 +0100
Subject: [Buildroot] [git commit] gst1-plugins-base: add missing indirect
	dependency on atomics for pango
Message-ID: <20150207202910.19E4B8046C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=08c763b539dfb4bc19bfce102c38761cbe0a5d03
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also removed the redundant indirect dependencies on wchar, threads, mmu
(gstreamer depends on libglib2 so this indirect dependency is obvious).

[Peter: drop wchar+threads from comment as suggested by Jerzy Grzegorek]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gstreamer1/gst1-plugins-base/Config.in |   12 +++++-------
 1 files changed, 5 insertions(+), 7 deletions(-)

diff --git a/package/gstreamer1/gst1-plugins-base/Config.in b/package/gstreamer1/gst1-plugins-base/Config.in
index 3b487c5..44367eb 100644
--- a/package/gstreamer1/gst1-plugins-base/Config.in
+++ b/package/gstreamer1/gst1-plugins-base/Config.in
@@ -128,17 +128,15 @@ config BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_OGG
 
 config BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_PANGO
 	bool "pango font renderer"
-	depends on BR2_INSTALL_LIBSTDCPP
-	depends on BR2_USE_WCHAR # pango -> libglib2
-	depends on BR2_TOOLCHAIN_HAS_THREADS # pango -> libglib2
-	depends on BR2_USE_MMU # pango -> libglib2
+	depends on BR2_INSTALL_LIBSTDCPP # pango -> freetype
+	depends on BR2_ARCH_HAS_ATOMICS # pango -> cairo
 	select BR2_PACKAGE_PANGO
 	help
 	  Pango-based text rendering and overlay
 
-comment "pango plugin needs a toolchain w/ C++, wchar, threads"
-	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
-		!BR2_TOOLCHAIN_HAS_THREADS
+comment "pango plugin needs a toolchain w/ C++"
+	depends on !BR2_INSTALL_LIBSTDCPP
+	depends on BR2_ARCH_HAS_ATOMICS
 
 config BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_THEORA
 	bool "theora (*.ogg video)"
