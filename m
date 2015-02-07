From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 7 Feb 2015 20:48:54 +0100
Subject: [Buildroot] [git commit] gst1-plugins-bad: add missing indirect
	dependency on atomics for rsvg
Message-ID: <20150207202910.05EBC8046C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d890524aab24fc17c618830e31739a81e9dbb6f1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also removed the redundant indirect dependencies on wchar, threads
(gstreamer depends on libglib2 so this indirect dependency is obvious).

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gstreamer1/gst1-plugins-bad/Config.in |   11 +++++------
 1 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/package/gstreamer1/gst1-plugins-bad/Config.in b/package/gstreamer1/gst1-plugins-bad/Config.in
index 9ccce94..75a0ca1 100644
--- a/package/gstreamer1/gst1-plugins-bad/Config.in
+++ b/package/gstreamer1/gst1-plugins-bad/Config.in
@@ -460,16 +460,15 @@ config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_OPUS
 
 config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_RSVG
 	bool "rsvg"
-	depends on BR2_INSTALL_LIBSTDCPP
-	depends on BR2_USE_WCHAR # librsvg -> glib2
-	depends on BR2_TOOLCHAIN_HAS_THREADS # librsvg -> glib2
+	depends on BR2_INSTALL_LIBSTDCPP # librsvg -> pango
+	depends on BR2_ARCH_HAS_ATOMICS # librsvg -> cairo
 	select BR2_PACKAGE_LIBRSVG
 	help
 	  RSVG plugin library
 
-comment "rsvg plugin needs a toolchain w/ C++, wchar, threads"
-	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
-		!BR2_TOOLCHAIN_HAS_THREADS
+comment "rsvg plugin needs a toolchain w/ C++"
+	depends on !BR2_INSTALL_LIBSTDCPP
+	depends on BR2_ARCH_HAS_ATOMICS
 
 config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_SDL
 	bool "sdl"
