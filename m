From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 22 Nov 2013 12:14:33 +0100
Subject: [Buildroot] [git commit] libglib2: needs MMU support
Message-ID: <20131122145921.068149BD8F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2b468f1bd94d824ee32d4351d548955ae1e05435
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes http://autobuild.buildroot.net/results/2e0/2e032c6e44e10f2912935715741c3680a19b9b51/

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/atk/Config.in                   |    2 ++
 package/bluez_utils/Config.in           |    2 +-
 package/bustle/Config.in                |    2 ++
 package/connman/Config.in               |    2 +-
 package/curlftpfs/Config.in             |    2 +-
 package/dbus-glib/Config.in             |    2 ++
 package/docker/Config.in                |    2 ++
 package/enchant/Config.in               |    2 ++
 package/gamin/Config.in                 |    2 ++
 package/gdk-pixbuf/Config.in            |    2 ++
 package/glib-networking/Config.in       |    2 ++
 package/glibmm/Config.in                |    2 ++
 package/gmpc/Config.in                  |    2 ++
 package/gob2/Config.in                  |    3 +--
 package/gstreamer/gstreamer/Config.in   |    2 ++
 package/gstreamer1/gstreamer1/Config.in |    2 ++
 package/gvfs/Config.in                  |    2 +-
 package/json-glib/Config.in             |    2 ++
 package/latencytop/Config.in            |    2 ++
 package/libglade/Config.in              |    2 ++
 package/libglib2/Config.in              |    2 ++
 package/libgtk2/Config.in               |    2 ++
 package/libmms/Config.in                |    2 ++
 package/libmpd/Config.in                |    2 ++
 package/libqmi/Config.in                |    2 ++
 package/librsvg/Config.in               |    2 ++
 package/libsecret/Config.in             |    2 ++
 package/libsoup/Config.in               |    2 ++
 package/lttng-babeltrace/Config.in      |   11 +++++------
 package/mpd/Config.in                   |    2 ++
 package/nbd/Config.in                   |    2 ++
 package/neard/Config.in                 |    2 +-
 package/ofono/Config.in                 |    2 +-
 package/pango/Config.in                 |    2 ++
 package/pkg-config/Config.in            |    2 ++
 package/polkit/Config.in                |    2 ++
 package/shared-mime-info/Config.in      |    2 ++
 package/sshfs/Config.in                 |    2 +-
 package/sysprof/Config.in               |    2 ++
 package/udev/Config.in                  |    2 ++
 package/vala/Config.in                  |    2 ++
 package/wireshark/Config.in             |    2 +-
 42 files changed, 78 insertions(+), 16 deletions(-)

diff --git a/package/atk/Config.in b/package/atk/Config.in
index e2707e5..1120a94 100644
--- a/package/atk/Config.in
+++ b/package/atk/Config.in
@@ -3,8 +3,10 @@ config BR2_PACKAGE_ATK
 	select BR2_PACKAGE_LIBGLIB2
 	depends on BR2_USE_WCHAR # glib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
+	depends on BR2_USE_MMU # glib2
 	help
 	  The ATK accessibility toolkit, needed to build GTK+-2.x.
 
 comment "atk needs a toolchain w/ wchar, threads"
+	depends on BR2_USE_MMU
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/bluez_utils/Config.in b/package/bluez_utils/Config.in
index b6f65b4..e08e9be 100644
--- a/package/bluez_utils/Config.in
+++ b/package/bluez_utils/Config.in
@@ -3,7 +3,7 @@ config BR2_PACKAGE_BLUEZ_UTILS
 	depends on !BR2_avr32
 	depends on BR2_USE_WCHAR # libglib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus, alsa-lib, libglib2
-	depends on BR2_USE_MMU # dbus
+	depends on BR2_USE_MMU # dbus, libglib2
 	select BR2_PACKAGE_DBUS
 	select BR2_PACKAGE_LIBGLIB2
 	help
diff --git a/package/bustle/Config.in b/package/bustle/Config.in
index 7be3222..f213da5 100644
--- a/package/bustle/Config.in
+++ b/package/bustle/Config.in
@@ -4,6 +4,7 @@ config BR2_PACKAGE_BUSTLE
 	select BR2_PACKAGE_LIBGLIB2
 	depends on BR2_USE_WCHAR # libglib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
+	depends on BR2_USE_MMU # libglib2
 	depends on BR2_PACKAGE_DBUS # runtime
 	help
 	  Bustle is a better dbus-monitor! It records and draws
@@ -20,5 +21,6 @@ config BR2_PACKAGE_BUSTLE
 	  http://www.willthompson.co.uk/bustle/
 
 comment "bustle needs a toolchain w/ wchar, threads"
+	depends on BR2_USE_MMU
 	depends on BR2_PACKAGE_DBUS
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/connman/Config.in b/package/connman/Config.in
index 5345c80..021e211 100644
--- a/package/connman/Config.in
+++ b/package/connman/Config.in
@@ -9,7 +9,7 @@ config BR2_PACKAGE_CONNMAN
 	depends on BR2_USE_WCHAR # libglib2 and gnutls
 	depends on BR2_INET_IPV6
 	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus, libglib2
-	depends on BR2_USE_MMU # dbus
+	depends on BR2_USE_MMU # dbus, libglib2
 	help
 	  The Connection Manager (ConnMan) project provides a daemon for
 	  managing internet connections within embedded devices running
diff --git a/package/curlftpfs/Config.in b/package/curlftpfs/Config.in
index 90763d7..ec40f3d 100644
--- a/package/curlftpfs/Config.in
+++ b/package/curlftpfs/Config.in
@@ -9,7 +9,7 @@ config BR2_PACKAGE_CURLFTPFS
 	depends on BR2_LARGEFILE
 	depends on BR2_USE_WCHAR # glib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libfuse, glib2
-	depends on BR2_USE_MMU # libfuse
+	depends on BR2_USE_MMU # libfuse, glib2
 	depends on !BR2_PREFER_STATIC_LIB # libfuse
 	help
 	  CurlFtpFS is a filesystem for accessing FTP hosts based on FUSE
diff --git a/package/dbus-glib/Config.in b/package/dbus-glib/Config.in
index 4d13f77..7fe0ac6 100644
--- a/package/dbus-glib/Config.in
+++ b/package/dbus-glib/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_DBUS_GLIB
 	depends on BR2_PACKAGE_DBUS
 	depends on BR2_USE_WCHAR # glib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
+	depends on BR2_USE_MMU # glib2
 	select BR2_PACKAGE_LIBGLIB2
 	help
 	  GLib bindings for D-Bus.
@@ -10,5 +11,6 @@ config BR2_PACKAGE_DBUS_GLIB
 	  http://www.freedesktop.org/software/dbus
 
 comment "dbus-glib needs a toolchain w/ wchar, threads"
+	depends on BR2_USE_MMU
 	depends on BR2_PACKAGE_DBUS
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/docker/Config.in b/package/docker/Config.in
index b9feec0..12f8432 100644
--- a/package/docker/Config.in
+++ b/package/docker/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_DOCKER
 	depends on BR2_PACKAGE_XORG7
 	depends on BR2_USE_WCHAR # glib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
+	depends on BR2_USE_MMU # glib2
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_XLIB_LIBX11
 	help
@@ -11,5 +12,6 @@ config BR2_PACKAGE_DOCKER
 	  http://icculus.org/openbox/2/docker
 
 comment "docker needs a toolchain w/ wchar, threads"
+	depends on BR2_USE_MMU
 	depends on BR2_PACKAGE_XORG7
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/enchant/Config.in b/package/enchant/Config.in
index 102fb02..86b2fad 100644
--- a/package/enchant/Config.in
+++ b/package/enchant/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_ENCHANT
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_WCHAR # glib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
+	depends on BR2_USE_MMU # glib2
 	select BR2_PACKAGE_LIBGLIB2
 	help
 	  Enchant is a spell-checking library that provides a consistent
@@ -11,5 +12,6 @@ config BR2_PACKAGE_ENCHANT
 	  http://www.abisource.com/projects/enchant/
 
 comment "enchant needs a toolchain w/ C++, threads, wchar"
+	depends on BR2_USE_MMU
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
 		!BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/gamin/Config.in b/package/gamin/Config.in
index f5fb914..c191be0 100644
--- a/package/gamin/Config.in
+++ b/package/gamin/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_GAMIN
 	bool "gamin"
 	depends on BR2_USE_WCHAR # glib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
+	depends on BR2_USE_MMU # glib2
 	select BR2_PACKAGE_LIBGLIB2
 	help
 	  the File Alteration Monitor
@@ -9,4 +10,5 @@ config BR2_PACKAGE_GAMIN
 	  http://www.gnome.org/~veillard/gamin/sources
 
 comment "gamin needs a toolchain w/ wchar, threads"
+	depends on BR2_USE_MMU
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/gdk-pixbuf/Config.in b/package/gdk-pixbuf/Config.in
index 9a14c3a..44942ac 100644
--- a/package/gdk-pixbuf/Config.in
+++ b/package/gdk-pixbuf/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_GDK_PIXBUF
 	bool "gdk-pixbuf"
 	depends on BR2_USE_WCHAR # glib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
+	depends on BR2_USE_MMU # glib2
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 	help
@@ -11,4 +12,5 @@ config BR2_PACKAGE_GDK_PIXBUF
 	  http://www.gtk.org/
 
 comment "gdk-pixbuf needs a toolchain w/ wchar, threads"
+	depends on BR2_USE_MMU
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/glib-networking/Config.in b/package/glib-networking/Config.in
index 4c73984..01d8552 100644
--- a/package/glib-networking/Config.in
+++ b/package/glib-networking/Config.in
@@ -2,10 +2,12 @@ config BR2_PACKAGE_GLIB_NETWORKING
 	bool "glib-networking"
 	depends on BR2_USE_WCHAR # glib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
+	depends on BR2_USE_MMU # glib2
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT
 	help
 	  Network-related GIO modules for glib.
 
 comment "glib-networking needs a toolchain w/ wchar, threads"
+	depends on BR2_USE_MMU
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/glibmm/Config.in b/package/glibmm/Config.in
index bdfff16..6ac4be5 100644
--- a/package/glibmm/Config.in
+++ b/package/glibmm/Config.in
@@ -5,11 +5,13 @@ config BR2_PACKAGE_GLIBMM
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_WCHAR # libglib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
+	depends on BR2_USE_MMU # libglib2
 	help
 	  The GLibmm package is a set of C++ bindings for GLib.
 
 	  http://www.gtkmm.org/
 
 comment "glibmm needs a toolchain w/ C++, wchar, threads"
+	depends on BR2_USE_MMU
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
 		!BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/gmpc/Config.in b/package/gmpc/Config.in
index 0d5f0dc..43bc642 100644
--- a/package/gmpc/Config.in
+++ b/package/gmpc/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_GMPC
 	depends on BR2_PACKAGE_LIBGTK2
 	depends on BR2_USE_WCHAR # glib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
+	depends on BR2_USE_MMU # glib2
 	depends on BR2_PACKAGE_XORG7
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
@@ -21,5 +22,6 @@ config BR2_PACKAGE_GMPC
 	  http://gmpcwiki.sarine.nl/index.php?title=GMPC
 
 comment "gmpc needs a toolchain w/ wchar, threads"
+	depends on BR2_USE_MMU
 	depends on BR2_PACKAGE_XORG7 && BR2_PACKAGE_LIBGTK2
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/gob2/Config.in b/package/gob2/Config.in
index 8e930fa..092d51b 100644
--- a/package/gob2/Config.in
+++ b/package/gob2/Config.in
@@ -2,8 +2,7 @@ config BR2_PACKAGE_GOB2
 	bool "gob2"
 	depends on BR2_USE_WCHAR # glib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
-	# m4 uses fork(), so does bison then
-	depends on BR2_USE_MMU
+	depends on BR2_USE_MMU # bison, glib2
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_FLEX
 	select BR2_PACKAGE_BISON
diff --git a/package/gstreamer/gstreamer/Config.in b/package/gstreamer/gstreamer/Config.in
index bd6022e..9a83a96 100644
--- a/package/gstreamer/gstreamer/Config.in
+++ b/package/gstreamer/gstreamer/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_GSTREAMER
 	bool "gstreamer"
 	depends on BR2_USE_WCHAR # glib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
+	depends on BR2_USE_MMU # glib2
 	select BR2_PACKAGE_LIBGLIB2
 	help
 	  GStreamer is an open source multimedia framework.
@@ -29,4 +30,5 @@ config BR2_PACKAGE_GSTREAMER_PLUGIN_REGISTRY
 	  the launch-time for a GStreamer application.
 
 comment "gstreamer needs a toolchain w/ wchar, threads"
+	depends on BR2_USE_MMU
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/gstreamer1/gstreamer1/Config.in b/package/gstreamer1/gstreamer1/Config.in
index ad7079c..8c8f165 100644
--- a/package/gstreamer1/gstreamer1/Config.in
+++ b/package/gstreamer1/gstreamer1/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_GSTREAMER1
 	bool "gstreamer1"
 	depends on BR2_USE_WCHAR # glib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
+	depends on BR2_USE_MMU # glib2
 	select BR2_PACKAGE_LIBGLIB2
 	help
 	  GStreamer is an open source multimedia framework. This 1.x version of
@@ -50,4 +51,5 @@ config BR2_PACKAGE_GSTREAMER1_INSTALL_TOOLS
 endif
 
 comment "gstreamer1 needs a toolchain w/ wchar, threads"
+	depends on BR2_USE_MMU
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/gvfs/Config.in b/package/gvfs/Config.in
index 71e8497..f3a04f5 100644
--- a/package/gvfs/Config.in
+++ b/package/gvfs/Config.in
@@ -2,7 +2,7 @@ config BR2_PACKAGE_GVFS
 	bool "gvfs"
 	depends on BR2_LARGEFILE
 	depends on BR2_USE_WCHAR # glib2
-	depends on BR2_USE_MMU # dbus
+	depends on BR2_USE_MMU # dbus, glib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus, glib2
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_DBUS
diff --git a/package/json-glib/Config.in b/package/json-glib/Config.in
index 09ac4e3..ea15295 100644
--- a/package/json-glib/Config.in
+++ b/package/json-glib/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_JSON_GLIB
 	bool "json-glib"
 	depends on BR2_USE_WCHAR # glib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
+	depends on BR2_USE_MMU # glib2
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT
 	help
@@ -12,4 +13,5 @@ config BR2_PACKAGE_JSON_GLIB
 	  https://live.gnome.org/JsonGlib/
 
 comment "json-glib needs a toolchain w/ wchar, threads"
+	depends on BR2_USE_MMU
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/latencytop/Config.in b/package/latencytop/Config.in
index 29fbcc8..b54ef05 100644
--- a/package/latencytop/Config.in
+++ b/package/latencytop/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_LATENCYTOP
 	bool "latencytop"
 	depends on BR2_USE_WCHAR # libglib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
+	depends on BR2_USE_MMU # libglib2
 	select BR2_PACKAGE_NCURSES
 	select BR2_PACKAGE_LIBGLIB2
 	help
@@ -21,4 +22,5 @@ config BR2_PACKAGE_LATENCYTOP
 	  http://www.latencytop.org
 
 comment "latencytop needs a toolchain w/ wchar, threads"
+	depends on BR2_USE_MMU
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/libglade/Config.in b/package/libglade/Config.in
index 774c765..e269a07 100644
--- a/package/libglade/Config.in
+++ b/package/libglade/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_LIBGLADE
 	depends on BR2_PACKAGE_LIBGTK2
 	depends on BR2_USE_WCHAR # glib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
+	depends on BR2_USE_MMU # glib2
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_ATK
 	select BR2_PACKAGE_LIBXML2
@@ -14,5 +15,6 @@ config BR2_PACKAGE_LIBGLADE
 	  http://ftp.gnome.org/pub/GNOME/sources/libglade/
 
 comment "libglade needs a toolchain w/ wchar, threads"
+	depends on BR2_USE_MMU
 	depends on BR2_PACKAGE_LIBGTK2
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/libglib2/Config.in b/package/libglib2/Config.in
index 3590d72..db6a950 100644
--- a/package/libglib2/Config.in
+++ b/package/libglib2/Config.in
@@ -6,10 +6,12 @@ config BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_ZLIB
 	depends on BR2_USE_WCHAR # gettext
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_USE_MMU # fork()
 	help
 	  Low-level core library that forms the basis of GTK+ and GNOME.
 
 	  http://www.gtk.org/
 
 comment "libglib2 needs a toolchain w/ wchar, threads"
+	depends on BR2_USE_MMU
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/libgtk2/Config.in b/package/libgtk2/Config.in
index 1dc8f2e..5239c25 100644
--- a/package/libgtk2/Config.in
+++ b/package/libgtk2/Config.in
@@ -15,6 +15,7 @@ config BR2_PACKAGE_LIBGTK2
 	depends on BR2_PACKAGE_XORG7
 	depends on BR2_USE_WCHAR # glib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
+	depends on BR2_USE_MMU # glib2
 	depends on BR2_INSTALL_LIBSTDCPP # pango
 	help
 	  The GTK+ version 2 graphical user interface library
@@ -32,6 +33,7 @@ config BR2_PACKAGE_LIBGTK2_DEMO
 endif
 
 comment "libgtk2 needs a toolchain w/ wchar, threads, C++"
+	depends on BR2_USE_MMU
 	depends on BR2_PACKAGE_XORG7
 	depends on !BR2_USE_WCHAR || !BR2_INSTALL_LIBSTDCPP || \
 		!BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/libmms/Config.in b/package/libmms/Config.in
index 50e98d8..11df6e5 100644
--- a/package/libmms/Config.in
+++ b/package/libmms/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_LIBMMS
 	bool "libmms"
 	depends on BR2_USE_WCHAR # glib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
+	depends on BR2_USE_MMU # glib2
 	select BR2_PACKAGE_LIBGLIB2
 	help
 	  LibMMS is a common library for parsing mms:// and mmsh://
@@ -13,4 +14,5 @@ config BR2_PACKAGE_LIBMMS
 	  http://launchpad.net/libmms
 
 comment "libmms needs a toolchain w/ wchar, threads"
+	depends on BR2_USE_MMU
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/libmpd/Config.in b/package/libmpd/Config.in
index 83bb6cd..1e3b860 100644
--- a/package/libmpd/Config.in
+++ b/package/libmpd/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_LIBMPD
 	bool "libmpd"
 	depends on BR2_USE_WCHAR # glib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
+	depends on BR2_USE_MMU # glib2
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 	help
@@ -12,4 +13,5 @@ config BR2_PACKAGE_LIBMPD
 	  http://gmpcwiki.sarine.nl/index.php?title=Libmpd
 
 comment "libmpd needs a toolchain w/ wchar, threads"
+	depends on BR2_USE_MMU
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/libqmi/Config.in b/package/libqmi/Config.in
index fc6b48d..a0e896c 100644
--- a/package/libqmi/Config.in
+++ b/package/libqmi/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_LIBQMI
 	select BR2_PACKAGE_LIBGLIB2
 	depends on BR2_USE_WCHAR # libglib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
+	depends on BR2_USE_MMU # libglib2
 	help
 	  libqmi is a glib-based library for talking to WWAN modems and devices
 	  which speak the Qualcomm MSM Interface (QMI) protocol.
@@ -10,4 +11,5 @@ config BR2_PACKAGE_LIBQMI
 	  http://www.freedesktop.org/wiki/Software/libqmi/
 
 comment "libqmi needs a toolchain w/ wchar, threads"
+	depends on BR2_USE_MMU
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/librsvg/Config.in b/package/librsvg/Config.in
index 13f6d06..5dd4c58 100644
--- a/package/librsvg/Config.in
+++ b/package/librsvg/Config.in
@@ -8,6 +8,7 @@ config BR2_PACKAGE_LIBRSVG
 	select BR2_PACKAGE_GDK_PIXBUF
 	depends on BR2_USE_WCHAR # glib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
+	depends on BR2_USE_MMU # glib2
 	depends on BR2_INSTALL_LIBSTDCPP # pango
 	help
 	  The rsvg library is an efficient renderer for Scalable
@@ -16,4 +17,5 @@ config BR2_PACKAGE_LIBRSVG
 	  http://librsvg.sourceforge.net/
 
 comment "librsvg needs a toolchain w/ wchar, threads, C++"
+	depends on BR2_USE_MMU
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP
diff --git a/package/libsecret/Config.in b/package/libsecret/Config.in
index b455782..70f1fe7 100644
--- a/package/libsecret/Config.in
+++ b/package/libsecret/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_LIBSECRET
 	select BR2_PACKAGE_LIBGLIB2
 	depends on BR2_USE_WCHAR # gettext dep in libglib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
+	depends on BR2_USE_MMU # libglib2
 	help
 	  libsecret is a library for storing and retrieving passwords and other
 	  secrets. It communicates with the "Secret Service" using DBus.
@@ -12,4 +13,5 @@ config BR2_PACKAGE_LIBSECRET
 	  https://wiki.gnome.org/Libsecret
 
 comment "libsecret needs a toolchain w/ wchar, threads"
+	depends on BR2_USE_MMU
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/libsoup/Config.in b/package/libsoup/Config.in
index 1eec135..874f50c 100644
--- a/package/libsoup/Config.in
+++ b/package/libsoup/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_LIBSOUP
 	bool "libsoup"
 	depends on BR2_USE_WCHAR # glib2 and gnutls
 	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
+	depends on BR2_USE_MMU # glib2
 	select BR2_PACKAGE_LIBXML2
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_SQLITE
@@ -24,4 +25,5 @@ config BR2_PACKAGE_LIBSOUP_SSL
 endif
 
 comment "libsoup needs a toolchain w/ wchar, threads"
+	depends on BR2_USE_MMU
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/lttng-babeltrace/Config.in b/package/lttng-babeltrace/Config.in
index 3429e11..cb857c8 100644
--- a/package/lttng-babeltrace/Config.in
+++ b/package/lttng-babeltrace/Config.in
@@ -4,12 +4,10 @@ config BR2_PACKAGE_LTTNG_BABELTRACE
 	select BR2_PACKAGE_UTIL_LINUX
 	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
 	select BR2_PACKAGE_LIBGLIB2
-	# libglib2 needs thread support and gettext which needs wchar support, and
-	# we also depends on util-linux which needs wchar
-	depends on BR2_USE_WCHAR
-	depends on BR2_TOOLCHAIN_HAS_THREADS
-	# util-linux depends on largefile support
-	depends on BR2_LARGEFILE
+	depends on BR2_USE_WCHAR # libglib2, util-linux
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
+	depends on BR2_USE_MMU # libglib2
+	depends on BR2_LARGEFILE # util-linux
 	help
 	  Babeltrace is part of the LTTng 2.x project.
 
@@ -29,4 +27,5 @@ config BR2_PACKAGE_LTTNG_BABELTRACE
 
 comment "lttng-babeltrace needs a toolchain w/ wchar, threads, largefile"
 	depends on BR2_PACKAGE_LTTNG_TOOLS
+	depends on BR2_USE_MMU
 	depends on !BR2_USE_WCHAR || !BR2_LARGEFILE || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/mpd/Config.in b/package/mpd/Config.in
index 9314984..62bdfa7 100644
--- a/package/mpd/Config.in
+++ b/package/mpd/Config.in
@@ -3,6 +3,7 @@ menuconfig BR2_PACKAGE_MPD
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_WCHAR # libglib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
+	depends on BR2_USE_MMU # libglib2
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 	select BR2_PACKAGE_MPD_TREMOR if !(BR2_PACKAGE_MPD_MAD || BR2_PACKAGE_MPD_MPG123 || BR2_PACKAGE_MPD_VORBIS || BR2_PACKAGE_MPD_WAVPACK || BR2_PACKAGE_MPD_FLAC || BR2_PACKAGE_MPD_MUSEPACK || BR2_PACKAGE_MPD_FFMPEG)
@@ -183,5 +184,6 @@ config BR2_PACKAGE_MPD_WAVPACK
 endif
 
 comment "mpd needs a toolchain w/ C++, threads, wchar"
+	depends on BR2_USE_MMU
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
 		!BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/nbd/Config.in b/package/nbd/Config.in
index 569218a..a5ded29 100644
--- a/package/nbd/Config.in
+++ b/package/nbd/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_NBD
 	bool "nbd"
 	depends on BR2_USE_WCHAR # glib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
+	depends on BR2_USE_MMU # glib2
 	select BR2_PACKAGE_LIBGLIB2
 	help
 	  NBD is a set of utilities to configure network block devices,
@@ -25,4 +26,5 @@ config BR2_NBD_SERVER
 endif
 
 comment "nbd needs a toolchain w/ wchar, threads"
+	depends on BR2_USE_MMU
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/neard/Config.in b/package/neard/Config.in
index 81bb61e..ed20e06 100644
--- a/package/neard/Config.in
+++ b/package/neard/Config.in
@@ -2,7 +2,7 @@ config BR2_PACKAGE_NEARD
 	bool "neard"
 	depends on BR2_USE_WCHAR # libglib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libnl, dbus, libglib2
-	depends on BR2_USE_MMU # dbus
+	depends on BR2_USE_MMU # dbus, libglib2
 	select BR2_PACKAGE_DBUS
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_LIBNL
diff --git a/package/ofono/Config.in b/package/ofono/Config.in
index c431e08..b26b5e7 100644
--- a/package/ofono/Config.in
+++ b/package/ofono/Config.in
@@ -2,7 +2,7 @@ config BR2_PACKAGE_OFONO
 	bool "ofono"
 	depends on BR2_USE_WCHAR # gettext, libglib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus, libglib2
-	depends on BR2_USE_MMU # dbus
+	depends on BR2_USE_MMU # dbus, libglib2
 	select BR2_PACKAGE_LIBCAP_NG
 	select BR2_PACKAGE_DBUS
 	select BR2_PACKAGE_LIBGLIB2
diff --git a/package/pango/Config.in b/package/pango/Config.in
index 71d5b74..774682d 100644
--- a/package/pango/Config.in
+++ b/package/pango/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_PANGO
 	bool "pango"
 	depends on BR2_USE_WCHAR # glib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
+	depends on BR2_USE_MMU # glib2
 	depends on BR2_INSTALL_LIBSTDCPP # freetype support
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_EXPAT
@@ -20,5 +21,6 @@ config BR2_PACKAGE_PANGO
 	  http://www.pango.org/
 
 comment "pango needs a toolchain w/ wchar, threads, C++"
+	depends on BR2_USE_MMU
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
 		!BR2_INSTALL_LIBSTDCPP
diff --git a/package/pkg-config/Config.in b/package/pkg-config/Config.in
index 4a03e75..52c0c32 100644
--- a/package/pkg-config/Config.in
+++ b/package/pkg-config/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_PKG_CONFIG
 	bool "pkg-config"
 	depends on BR2_USE_WCHAR # glib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
+	depends on BR2_USE_MMU # glib2
 	depends on BR2_DEPRECATED
 	select BR2_PACKAGE_LIBGLIB2
 	help
@@ -14,4 +15,5 @@ config BR2_PACKAGE_PKG_CONFIG
 
 comment "pkg-config needs a toolchain w/ wchar, threads"
 	depends on BR2_DEPRECATED
+	depends on BR2_USE_MMU
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/polkit/Config.in b/package/polkit/Config.in
index 26d65ab..d685e5c 100644
--- a/package/polkit/Config.in
+++ b/package/polkit/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_POLKIT
 	bool "polkit"
 	depends on BR2_USE_WCHAR # libglib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
+	depends on BR2_USE_MMU # libglib2
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_EXPAT
 	help
@@ -12,4 +13,5 @@ config BR2_PACKAGE_POLKIT
 	  http://www.freedesktop.org/wiki/Software/polkit
 
 comment "polkit needs a toolchain w/ wchar, threads"
+	depends on BR2_USE_MMU
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/shared-mime-info/Config.in b/package/shared-mime-info/Config.in
index 7be199d..91a5a15 100644
--- a/package/shared-mime-info/Config.in
+++ b/package/shared-mime-info/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_SHARED_MIME_INFO
 	bool "shared-mime-info"
 	depends on BR2_USE_WCHAR # glib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
+	depends on BR2_USE_MMU # glib2
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_LIBXML2
 	help
@@ -12,4 +13,5 @@ config BR2_PACKAGE_SHARED_MIME_INFO
 	  http://freedesktop.org/wiki/Software/shared-mime-info
 
 comment "shared-mime-info needs a toolchain w/ wchar, threads"
+	depends on BR2_USE_MMU
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/sshfs/Config.in b/package/sshfs/Config.in
index 2ce627f..aa7628d 100644
--- a/package/sshfs/Config.in
+++ b/package/sshfs/Config.in
@@ -8,7 +8,7 @@ config BR2_PACKAGE_SSHFS
 	depends on BR2_LARGEFILE
 	depends on BR2_USE_WCHAR # glib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libfuse, glib2
-	depends on BR2_USE_MMU # libfuse
+	depends on BR2_USE_MMU # libfuse, glib2
 	depends on !BR2_PREFER_STATIC_LIB # libfuse
 	help
 	  FUSE filesystem client based on the SSH File Transfer Protocol.
diff --git a/package/sysprof/Config.in b/package/sysprof/Config.in
index 0bb0791..e1b0488 100644
--- a/package/sysprof/Config.in
+++ b/package/sysprof/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_SYSPROF
 	select BR2_PACKAGE_LIBGLIB2
 	depends on BR2_USE_WCHAR # glib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
+	depends on BR2_USE_MMU # glib2
 	# In its util.h file, sysprof contains architecture-specific
 	# code
 	depends on BR2_i386 || BR2_x86_64 || BR2_powerpc || BR2_sh4a || BR2_sh4aeb
@@ -25,5 +26,6 @@ config BR2_PACKAGE_SYSPROF_GUI
 endif
 
 comment "sysprof needs a toolchain w/ wchar, threads"
+	depends on BR2_USE_MMU
 	depends on BR2_i386 || BR2_x86_64 || BR2_powerpc || BR2_sh4a || BR2_sh4aeb
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/udev/Config.in b/package/udev/Config.in
index 2bcd685..c8aedd0 100644
--- a/package/udev/Config.in
+++ b/package/udev/Config.in
@@ -28,11 +28,13 @@ config BR2_PACKAGE_UDEV_ALL_EXTRAS
 	select BR2_PACKAGE_LIBGLIB2
 	depends on BR2_USE_WCHAR # libglib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
+	depends on BR2_USE_MMU # libglib2
 	help
 	  Enable all extras with external dependencies like
 	  libacl, hwdata and libglib2
 
 comment "enabling all extras needs a toolchain w/ wchar, threads"
+	depends on BR2_USE_MMU
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
 
 endif
diff --git a/package/vala/Config.in b/package/vala/Config.in
index d947c4a..b9477bf 100644
--- a/package/vala/Config.in
+++ b/package/vala/Config.in
@@ -4,6 +4,7 @@ config BR2_PACKAGE_VALA
 	depends on BR2_DEPRECATED
 	depends on BR2_USE_WCHAR # glib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
+	depends on BR2_USE_MMU # glib2
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
@@ -14,4 +15,5 @@ config BR2_PACKAGE_VALA
 
 comment "vala needs a toolchain w/ wchar, threads"
 	depends on BR2_DEPRECATED
+	depends on BR2_USE_MMU
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/wireshark/Config.in b/package/wireshark/Config.in
index 6b756a6..f559c22 100644
--- a/package/wireshark/Config.in
+++ b/package/wireshark/Config.in
@@ -3,7 +3,7 @@ config BR2_PACKAGE_WIRESHARK
 	select BR2_PACKAGE_LIBPCAP
 	select BR2_PACKAGE_LIBGCRYPT
 	select BR2_PACKAGE_LIBGLIB2
-	depends on BR2_USE_MMU # fork()
+	depends on BR2_USE_MMU # fork(), glib2
 	depends on BR2_USE_WCHAR # glib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
 	help
