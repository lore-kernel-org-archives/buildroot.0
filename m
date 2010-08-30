From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 30 Aug 2010 10:09:52 +0200
Subject: [Buildroot] [git commit master 1/1] pango: needs C++ for freetype
	handling
Message-ID: <20100830081025.0023E8366F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=1c4dbb5fa7df89731e5d59f680e9dc34f24f8835
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Pango was recently updated to v1.28 as a dependency of webkit, but its
freetype support has unfortunately been rewritten with parts in C++
(since pango 1.25), so adjust dependencies of pango and users of it to
require C++ support.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                                       |    7 ++++---
 package/libgtk2/Config.in                     |    5 +++--
 package/multimedia/gst-plugins-base/Config.in |    4 ++++
 package/multimedia/swfdec/Config.in           |    5 +++--
 package/pango/Config.in                       |    5 +++--
 5 files changed, 17 insertions(+), 9 deletions(-)

diff --git a/CHANGES b/CHANGES
index 7ab4aa4..b6e58ac 100644
--- a/CHANGES
+++ b/CHANGES
@@ -17,9 +17,10 @@
 
 	fs: old-style squashfs for big endian archs fixed.
 
-	Updated/fixed packages: busybox, imagemagick, libglib2, lua,
-	luafilesystem, lzo, netcat, php, pppd, proftpd, qt, samba,
-	startup-notification, sysvinit, util-linux
+	Updated/fixed packages: busybox, gst-plugins-base,
+	imagemagick, libgail, libglib2, libgtk2, lua, luafilesystem,
+	lzo, netcat, pango, php, pppd, proftpd, qt, samba,
+	startup-notification, swfdec, sysvinit, util-linux
 
 	Removed packages: stunnel
 
diff --git a/package/libgtk2/Config.in b/package/libgtk2/Config.in
index 3d15f4c..bc4ca9d 100644
--- a/package/libgtk2/Config.in
+++ b/package/libgtk2/Config.in
@@ -13,10 +13,11 @@ config BR2_PACKAGE_LIBGTK2
 	# time.
 	depends on BR2_PACKAGE_XORG7||(BR2_PACKAGE_DIRECTFB && BR2_DEPRECATED)
 	depends on BR2_USE_WCHAR # glib2
+	depends on BR2_INSTALL_LIBSTDCPP # pango
 	help
 	  The GTK+ version 2 graphical user interface library
 
 	  http://www.gtk.org/
 
-comment "libgtk2 requires a toolchain with WCHAR support"
-	depends on !BR2_USE_WCHAR
+comment "libgtk2 requires a toolchain with WCHAR and C++ support"
+	depends on !BR2_USE_WCHAR || !BR2_INSTALL_LIBSTDCPP
diff --git a/package/multimedia/gst-plugins-base/Config.in b/package/multimedia/gst-plugins-base/Config.in
index f08be7e..0f552fe 100644
--- a/package/multimedia/gst-plugins-base/Config.in
+++ b/package/multimedia/gst-plugins-base/Config.in
@@ -74,8 +74,12 @@ config BR2_PACKAGE_GST_PLUGINS_BASE_PLUGIN_OGG
 
 config BR2_PACKAGE_GST_PLUGINS_BASE_PLUGIN_PANGO
 	bool "pango font renderer"
+	depends on BR2_INSTALL_LIBSTDCPP
 	select BR2_PACKAGE_PANGO
 
+comment "pango plugin requires a toolchain with C++ support"
+	depends on !BR2_INSTALL_LIBSTDCPP
+
 config BR2_PACKAGE_GST_PLUGINS_BASE_PLUGIN_THEORA
 	bool "theora (*.ogg video)"
 	select BR2_PACKAGE_LIBTHEORA
diff --git a/package/multimedia/swfdec/Config.in b/package/multimedia/swfdec/Config.in
index 2a79756..bc1c73a 100644
--- a/package/multimedia/swfdec/Config.in
+++ b/package/multimedia/swfdec/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_SWFDEC
 	bool "swfdec"
 	depends on BR2_USE_WCHAR # glib2
+	depends on BR2_INSTALL_LIBSTDCPP # pango
 	select BR2_PACKAGE_LIBOIL
 	select BR2_PACKAGE_ALSA_LIB
 	select BR2_PACKAGE_PANGO
@@ -30,5 +31,5 @@ config BR2_PACKAGE_SWFDEC_GSTREAMER
 	help
 	  Enables GStreamer support
 
-comment "swfdec requires a toolchain with WCHAR support"
-	depends on !BR2_USE_WCHAR
+comment "swfdec requires a toolchain with WCHAR and C++ support"
+	depends on !BR2_USE_WCHAR || !BR2_INSTALL_LIBSTDCPP
diff --git a/package/pango/Config.in b/package/pango/Config.in
index e4c084d..923c3d4 100644
--- a/package/pango/Config.in
+++ b/package/pango/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_PANGO
 	bool "pango"
 	depends on BR2_USE_WCHAR # glib2
+	depends on BR2_INSTALL_LIBSTDCPP # freetype support
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_EXPAT
 	select BR2_PACKAGE_CAIRO
@@ -15,5 +16,5 @@ config BR2_PACKAGE_PANGO
 
 	  http://www.pango.org/
 
-comment "pango requires a toolchain with WCHAR support"
-	depends on !BR2_USE_WCHAR
+comment "pango requires a toolchain with WCHAR and C++ support"
+	depends on !BR2_USE_WCHAR || !BR2_INSTALL_LIBSTDCPP
-- 
1.7.1
