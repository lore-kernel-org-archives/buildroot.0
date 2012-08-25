From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 25 Aug 2012 17:06:06 +0200
Subject: [Buildroot] [PATCH] Adjust dependencies so that libffi is not used
	on unsupported systems
In-Reply-To: <1345907166-29628-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1345907166-29628-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1345907166-29628-2-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The libffi library is not supported on SH2A systems and toolchains
without thread support. This library is mandatory for the Python
interpreter and the glib2 library, so both of these packages, and all
their reverse dependencies need to see their dependencies adjusted.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/atk/Config.in                         |    6 ++++--
 package/bluez_utils/Config.in                 |    3 ++-
 package/connman/Config.in                     |    3 ++-
 package/dbus-glib/Config.in                   |    6 ++++--
 package/docker/Config.in                      |    6 ++++--
 package/dstat/Config.in                       |    6 ++++--
 package/efl/libedbus/Config.in                |    1 +
 package/enchant/Config.in                     |    7 +++++--
 package/gamin/Config.in                       |    6 ++++--
 package/gdk-pixbuf/Config.in                  |    5 +++++
 package/glib-networking/Config.in             |    6 ++++--
 package/gmpc/Config.in                        |    6 ++++--
 package/gob2/Config.in                        |    6 ++++--
 package/gvfs/Config.in                        |    6 ++++--
 package/latencytop/Config.in                  |    6 ++++--
 package/libffi/Config.in                      |    2 ++
 package/libglib2/Config.in                    |    6 ++++--
 package/libgtk2/Config.in                     |    7 +++++--
 package/libmms/Config.in                      |    6 ++++--
 package/libmpd/Config.in                      |    6 ++++--
 package/libplayer/Config.in                   |    8 +++++---
 package/libsoup/Config.in                     |    6 ++++--
 package/lttng-babeltrace/Config.in            |    7 +++++--
 package/multimedia/gst-plugins-bad/Config.in  |    3 +++
 package/multimedia/gst-plugins-base/Config.in |   11 ++++++++---
 package/multimedia/gst-plugins-good/Config.in |    3 +++
 package/multimedia/gstreamer/Config.in        |    6 ++++--
 package/multimedia/mpd/Config.in              |    7 +++++--
 package/nbd/Config.in                         |    6 ++++--
 package/network-manager/Config.in             |    3 ++-
 package/ofono/Config.in                       |    3 ++-
 package/opencv/Config.in                      |    6 +++++-
 package/pango/Config.in                       |    7 +++++--
 package/pkg-config/Config.in                  |    6 ++++--
 package/python/Config.in                      |    6 ++++--
 package/shared-mime-info/Config.in            |    6 ++++--
 package/sshfs/Config.in                       |    6 ++++--
 package/sysprof/Config.in                     |    6 ++++--
 package/udev/Config.in                        |    2 ++
 package/vala/Config.in                        |    6 ++++--
 40 files changed, 155 insertions(+), 65 deletions(-)

diff --git a/package/atk/Config.in b/package/atk/Config.in
index 928fae7..cd448d6 100644
--- a/package/atk/Config.in
+++ b/package/atk/Config.in
@@ -2,8 +2,10 @@ config BR2_PACKAGE_ATK
 	bool "atk"
 	select BR2_PACKAGE_LIBGLIB2
 	depends on BR2_USE_WCHAR # glib2
+	depends on !BR2_sh2a # glib2 -> libffi
+	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2 -> libffi
 	help
 	  The ATK accessibility toolkit, needed to build GTK+-2.x.
 
-comment "atk requires a toolchain with WCHAR support"
-	depends on !BR2_USE_WCHAR
+comment "atk requires a toolchain with WCHAR and thread support"
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/bluez_utils/Config.in b/package/bluez_utils/Config.in
index d63284d..dade59c 100644
--- a/package/bluez_utils/Config.in
+++ b/package/bluez_utils/Config.in
@@ -1,7 +1,8 @@
 config BR2_PACKAGE_BLUEZ_UTILS
 	bool "bluez-utils"
 	depends on BR2_USE_WCHAR # libglib2
-	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus
+	depends on !BR2_sh2a # libglib2 -> libffi
+	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus, libglib2 -> libffi
 	select BR2_PACKAGE_DBUS
 	select BR2_PACKAGE_LIBGLIB2
 	help
diff --git a/package/connman/Config.in b/package/connman/Config.in
index 082b0ca..cf168e9 100644
--- a/package/connman/Config.in
+++ b/package/connman/Config.in
@@ -7,7 +7,8 @@ config BR2_PACKAGE_CONNMAN
 	depends on !(BR2_UCLIBC_VERSION_0_9_31 || BR2_UCLIBC_VERSION_0_9_32)
 	depends on BR2_USE_WCHAR # libglib2 and gnutls
 	depends on BR2_INET_IPV6
-	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus
+	depends on !BR2_sh2a # libglib2 -> libffi
+	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus, libglib2 -> libffi
 	help
 	  The Connection Manager (ConnMan) project provides a daemon for
 	  managing internet connections within embedded devices running
diff --git a/package/dbus-glib/Config.in b/package/dbus-glib/Config.in
index f1dab43..2b9bf80 100644
--- a/package/dbus-glib/Config.in
+++ b/package/dbus-glib/Config.in
@@ -2,11 +2,13 @@ config BR2_PACKAGE_DBUS_GLIB
 	bool "dbus-glib"
 	depends on BR2_PACKAGE_DBUS
 	depends on BR2_USE_WCHAR # glib2
+	depends on !BR2_sh2a # glib2 -> libffi
+	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2 -> libffi
 	select BR2_PACKAGE_LIBGLIB2
 	help
 	  GLib bindings for D-Bus.
 
 	  http://www.freedesktop.org/software/dbus
 
-comment "dbus-glib requires a toolchain with WCHAR support"
-	depends on BR2_PACKAGE_DBUS && !BR2_USE_WCHAR
+comment "dbus-glib requires a toolchain with WCHAR and thread support"
+	depends on BR2_PACKAGE_DBUS && (!BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS)
diff --git a/package/docker/Config.in b/package/docker/Config.in
index 75bf5be..81fdc22 100644
--- a/package/docker/Config.in
+++ b/package/docker/Config.in
@@ -2,11 +2,13 @@ config BR2_PACKAGE_DOCKER
 	bool "docker"
 	depends on BR2_PACKAGE_XORG7
 	depends on BR2_USE_WCHAR # glib2
+	depends on !BR2_sh2a # glib2 -> libffi
+	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2 -> libffi
 	select BR2_PACKAGE_LIBGLIB2
 	help
 	  a system tray dock for X
 
 	  http://icculus.org/openbox/2/docker
 
-comment "docker requires a toolchain with WCHAR support"
-	depends on BR2_PACKAGE_XORG7 && !BR2_USE_WCHAR
+comment "docker requires a toolchain with WCHAR and thread support"
+	depends on BR2_PACKAGE_XORG7 && (!BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS)
diff --git a/package/dstat/Config.in b/package/dstat/Config.in
index 1439c8b..4c02fb5 100644
--- a/package/dstat/Config.in
+++ b/package/dstat/Config.in
@@ -1,6 +1,8 @@
 config BR2_PACKAGE_DSTAT
 	bool "dstat"
 	depends on BR2_USE_WCHAR # python
+	depends on !BR2_sh2a # python -> libffi
+	depends on BR2_TOOLCHAIN_HAS_THREADS # python -> libffi
 	select BR2_PACKAGE_PYTHON
 	help
 	  Dstat, written in Python, is a versatile replacement for vmstat,
@@ -19,5 +21,5 @@ config BR2_PACKAGE_DSTAT
 
 	  http://dag.wieers.com/home-made/dstat/
 
-comment "dstat requires a toolchain with WCHAR support"
-	depends on !BR2_USE_WCHAR
+comment "dstat requires a toolchain with WCHAR and thread support"
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/efl/libedbus/Config.in b/package/efl/libedbus/Config.in
index 985939e..fbcf1ab 100644
--- a/package/efl/libedbus/Config.in
+++ b/package/efl/libedbus/Config.in
@@ -16,6 +16,7 @@ if BR2_PACKAGE_LIBEDBUS
 config BR2_PACKAGE_LIBEDBUS_BLUEZ
 	bool "bluez support"
 	select BR2_PACKAGE_BLUEZ_UTILS
+	depends on !BR2_sh2a # bluez -> glib2 -> libffi
 	help
 	  Bluetooth support.
 
diff --git a/package/enchant/Config.in b/package/enchant/Config.in
index 33f36db..b659eeb 100644
--- a/package/enchant/Config.in
+++ b/package/enchant/Config.in
@@ -2,6 +2,8 @@ config BR2_PACKAGE_ENCHANT
 	bool "enchant"
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_WCHAR # glib2
+	depends on !BR2_sh2a # glib2 -> libffi
+	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2 -> libffi
 	select BR2_PACKAGE_LIBGLIB2
 	help
 	  Enchant is a spell-checking library that provides a consistent
@@ -9,5 +11,6 @@ config BR2_PACKAGE_ENCHANT
 
 	  http://www.abisource.com/projects/enchant/
 
-comment "enchant requires a toolchain with C++ and WCHAR support enabled"
-	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR
+comment "enchant requires a toolchain with C++, WCHAR and thread support enabled"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
+		!BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/gamin/Config.in b/package/gamin/Config.in
index 3ede2e4..f3c1377 100644
--- a/package/gamin/Config.in
+++ b/package/gamin/Config.in
@@ -1,11 +1,13 @@
 config BR2_PACKAGE_GAMIN
 	bool "gamin"
 	depends on BR2_USE_WCHAR # glib2
+	depends on !BR2_sh2a # glib2 -> libffi
+	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2 -> libffi
 	select BR2_PACKAGE_LIBGLIB2
 	help
 	  the File Alteration Monitor
 
 	  http://www.gnome.org/~veillard/gamin/sources
 
-comment "gamin requires a toolchain with WCHAR support"
-	depends on !BR2_USE_WCHAR
+comment "gamin requires a toolchain with WCHAR and thread support"
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/gdk-pixbuf/Config.in b/package/gdk-pixbuf/Config.in
index 28a0f12..76964d4 100644
--- a/package/gdk-pixbuf/Config.in
+++ b/package/gdk-pixbuf/Config.in
@@ -1,6 +1,8 @@
 config BR2_PACKAGE_GDK_PIXBUF
 	bool "gdk-pixbuf"
 	depends on BR2_USE_WCHAR # glib2
+	depends on !BR2_sh2a # glib2 -> libffi
+	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2 -> libffi
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT
 	select BR2_PACKAGE_LIBINTL if BR2_NEEDS_GETTEXT
@@ -10,3 +12,6 @@ config BR2_PACKAGE_GDK_PIXBUF
 	  and the GLib, to integrate well with GNOME applications.
 
 	  http://www.gtk.org/
+
+comment "gdb-pixbuf requires WCHAR and thread support in toolchain"
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/glib-networking/Config.in b/package/glib-networking/Config.in
index 16f0d4a..8a5369c 100644
--- a/package/glib-networking/Config.in
+++ b/package/glib-networking/Config.in
@@ -1,11 +1,13 @@
 config BR2_PACKAGE_GLIB_NETWORKING
 	bool "glib-networking"
 	depends on BR2_USE_WCHAR # glib2
+	depends on !BR2_sh2a # glib2 -> libffi
+	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2 -> libffi
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT
 	select BR2_PACKAGE_LIBINTL if BR2_NEEDS_GETTEXT
 	help
 	  Network-related GIO modules for glib.
 
-comment "glib-networking requires a toolchain with WCHAR support"
-	depends on !BR2_USE_WCHAR
+comment "glib-networking requires a toolchain with WCHAR and thread support"
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/gmpc/Config.in b/package/gmpc/Config.in
index f86945c..a2ae32b 100644
--- a/package/gmpc/Config.in
+++ b/package/gmpc/Config.in
@@ -2,6 +2,8 @@ config BR2_PACKAGE_GMPC
 	bool "gmpc"
 	depends on BR2_PACKAGE_LIBGTK2
 	depends on BR2_USE_WCHAR # glib2
+	depends on !BR2_sh2a # glib2 -> libffi
+	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2 -> libffi
 	depends on BR2_PACKAGE_XORG7
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
@@ -20,5 +22,5 @@ config BR2_PACKAGE_GMPC
 
 	  http://gmpcwiki.sarine.nl/index.php?title=GMPC
 
-comment "gmpc requires a toolchain with WCHAR support"
-	depends on BR2_PACKAGE_LIBGTK2 && !BR2_USE_WCHAR
+comment "gmpc requires a toolchain with WCHAR and thread support"
+	depends on BR2_PACKAGE_LIBGTK2 && (!BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS)
diff --git a/package/gob2/Config.in b/package/gob2/Config.in
index cbe30d6..e10b075 100644
--- a/package/gob2/Config.in
+++ b/package/gob2/Config.in
@@ -1,6 +1,8 @@
 config BR2_PACKAGE_GOB2
 	bool "gob2"
 	depends on BR2_USE_WCHAR # glib2
+	depends on !BR2_sh2a # glib2 -> libffi
+	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2 -> libffi
 	# m4 uses fork(), so does bison then
 	depends on BR2_USE_MMU
 	select BR2_PACKAGE_LIBGLIB2
@@ -13,5 +15,5 @@ config BR2_PACKAGE_GOB2
 
 	  http://www.jirka.org/gob.html
 
-comment "gob2 requires a toolchain with WCHAR support"
-	depends on !BR2_USE_WCHAR
+comment "gob2 requires a toolchain with WCHAR and thread support"
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/gvfs/Config.in b/package/gvfs/Config.in
index 87f9a03..e2d53bc 100644
--- a/package/gvfs/Config.in
+++ b/package/gvfs/Config.in
@@ -2,6 +2,8 @@ config BR2_PACKAGE_GVFS
 	bool "gvfs"
 	depends on BR2_LARGEFILE
 	depends on BR2_USE_WCHAR # glib2
+	depends on !BR2_sh2a # glib2 -> libffi
+	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2 -> libffi
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_DBUS
 	select BR2_PACKAGE_SHARED_MIME_INFO
@@ -14,5 +16,5 @@ config BR2_PACKAGE_GVFS
 
 	  http://en.wikipedia.org/wiki/GVFS
 
-comment "gvfs requires a toolchain with LARGEFILE and WCHAR support"
-	depends on !BR2_LARGEFILE || !BR2_USE_WCHAR
+comment "gvfs requires a toolchain with LARGEFILE, WCHAR and thread support"
+	depends on !BR2_LARGEFILE || !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/latencytop/Config.in b/package/latencytop/Config.in
index 12176c0..e9c3a65 100644
--- a/package/latencytop/Config.in
+++ b/package/latencytop/Config.in
@@ -1,6 +1,8 @@
 config BR2_PACKAGE_LATENCYTOP
 	bool "latencytop"
 	depends on BR2_USE_WCHAR
+	depends on !BR2_sh2a # glib2 -> libffi
+	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2 -> libffi
 	select BR2_PACKAGE_NCURSES
 	select BR2_PACKAGE_LIBGLIB2
 	help
@@ -19,5 +21,5 @@ config BR2_PACKAGE_LATENCYTOP
 
 	  http://www.latencytop.org
 
-comment "latencytop requires a toolchain with WCHAR support"
-	depends on !BR2_USE_WCHAR
+comment "latencytop requires a toolchain with WCHAR and thread support"
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/libffi/Config.in b/package/libffi/Config.in
index 7211f8f..0c4d328 100644
--- a/package/libffi/Config.in
+++ b/package/libffi/Config.in
@@ -1,5 +1,7 @@
 config BR2_PACKAGE_LIBFFI
 	bool "libffi"
+	depends on !BR2_sh2a
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	help
 	  The libffi library provides a portable, high level
 	  programming interface to various calling conventions. This
diff --git a/package/libglib2/Config.in b/package/libglib2/Config.in
index d1d7231..518d314 100644
--- a/package/libglib2/Config.in
+++ b/package/libglib2/Config.in
@@ -6,10 +6,12 @@ config BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_LIBFFI
 	select BR2_PACKAGE_ZLIB
 	depends on BR2_USE_WCHAR # gettext
+	depends on !BR2_sh2a # libffi
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libffi
 	help
 	  Low-level core library that forms the basis of GTK+ and GNOME.
 
 	  http://www.gtk.org/
 
-comment "libglib2 requires a toolchain with WCHAR support"
-	depends on !BR2_USE_WCHAR
+comment "libglib2 requires a toolchain with WCHAR and thread support"
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/libgtk2/Config.in b/package/libgtk2/Config.in
index efaf12f..5da724e 100644
--- a/package/libgtk2/Config.in
+++ b/package/libgtk2/Config.in
@@ -10,6 +10,8 @@ config BR2_PACKAGE_LIBGTK2
 	select BR2_PACKAGE_GDK_PIXBUF
 	depends on BR2_PACKAGE_XORG7||BR2_PACKAGE_DIRECTFB
 	depends on BR2_USE_WCHAR # glib2
+	depends on !BR2_sh2a # glib2 -> libffi
+	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2 -> libffi
 	depends on BR2_INSTALL_LIBSTDCPP # pango
 	help
 	  The GTK+ version 2 graphical user interface library
@@ -23,5 +25,6 @@ config BR2_PACKAGE_LIBGTK2_DEMO
 	  The GTK+ source base contains a gtk-demo program. This
 	  option allows to install this program to the target.
 
-comment "libgtk2 requires a toolchain with WCHAR and C++ support"
-	depends on !BR2_USE_WCHAR || !BR2_INSTALL_LIBSTDCPP
+comment "libgtk2 requires a toolchain with WCHAR, C++ and thread support"
+	depends on !BR2_USE_WCHAR || !BR2_INSTALL_LIBSTDCPP || \
+		!BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/libmms/Config.in b/package/libmms/Config.in
index 17cb406..be00360 100644
--- a/package/libmms/Config.in
+++ b/package/libmms/Config.in
@@ -1,6 +1,8 @@
 config BR2_PACKAGE_LIBMMS
 	bool "libmms"
 	depends on BR2_USE_WCHAR # glib2
+	depends on !BR2_sh2a # glib2 -> libffi
+	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2 -> libffi
 	select BR2_PACKAGE_LIBGLIB2
 	help
           LibMMS is a common library for parsing mms:// and mmsh://
@@ -11,5 +13,5 @@ config BR2_PACKAGE_LIBMMS
 
 	  http://launchpad.net/libmms
 
-comment "libmms requires a toolchain with WCHAR support"
-	depends on !BR2_USE_WCHAR
+comment "libmms requires a toolchain with WCHAR and thread support"
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/libmpd/Config.in b/package/libmpd/Config.in
index 9259c19..e1ba0e4 100644
--- a/package/libmpd/Config.in
+++ b/package/libmpd/Config.in
@@ -1,6 +1,8 @@
 config BR2_PACKAGE_LIBMPD
 	bool "libmpd"
 	depends on BR2_USE_WCHAR # glib2
+	depends on !BR2_sh2a # glib2 -> libffi
+	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2 -> libffi
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 	help
@@ -10,5 +12,5 @@ config BR2_PACKAGE_LIBMPD
 
 	  http://gmpcwiki.sarine.nl/index.php?title=Libmpd
 
-comment "libmpd requires a toolchain with WCHAR support"
-	depends on !BR2_USE_WCHAR
+comment "libmpd requires a toolchain with WCHAR and thread support"
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/libplayer/Config.in b/package/libplayer/Config.in
index fe851ac..0f587df 100644
--- a/package/libplayer/Config.in
+++ b/package/libplayer/Config.in
@@ -15,11 +15,13 @@ config BR2_PACKAGE_LIBPLAYER_MPLAYER
 
 config BR2_PACKAGE_LIBPLAYER_GSTREAMER
 	bool "gstreamer backend"
-	depends on BR2_USE_WCHAR # glib2
+	depends on BR2_USE_WCHAR # gstreamer -> glib2
+	depends on !BR2_sh2a # gstreamer -> glib2 -> libffi
+	depends on BR2_TOOLCHAIN_HAS_THREADS # gstreamer -> glib2 -> libffi
 	select BR2_PACKAGE_GSTREAMER
 
-comment "gstreamer backend requires a toolchain with WCHAR support"
-	depends on !BR2_USE_WCHAR
+comment "gstreamer backend requires a toolchain with WCHAR and thread support"
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
 
 config BR2_PACKAGE_LIBPLAYER_PYTHON
 	depends on BR2_PACKAGE_PYTHON
diff --git a/package/libsoup/Config.in b/package/libsoup/Config.in
index f40625d..da03819 100644
--- a/package/libsoup/Config.in
+++ b/package/libsoup/Config.in
@@ -1,6 +1,8 @@
 config BR2_PACKAGE_LIBSOUP
 	bool "libsoup"
 	depends on BR2_USE_WCHAR # glib2 and gnutls
+	depends on !BR2_sh2a # glib2 -> libffi
+	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2 -> libffi
 	select BR2_PACKAGE_LIBXML2
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT
@@ -20,5 +22,5 @@ config BR2_PACKAGE_LIBSOUP_SSL
 	help
 	  Enable HTTPS (SSL) support.
 
-comment "libsoup requires a toolchain with WCHAR support"
-	depends on !BR2_USE_WCHAR
+comment "libsoup requires a toolchain with WCHAR and thread support"
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/lttng-babeltrace/Config.in b/package/lttng-babeltrace/Config.in
index 6f47304..7610669 100644
--- a/package/lttng-babeltrace/Config.in
+++ b/package/lttng-babeltrace/Config.in
@@ -9,6 +9,8 @@ config BR2_PACKAGE_LTTNG_BABELTRACE
 	depends on BR2_USE_WCHAR
 	# util-linux depends on largefile support
 	depends on BR2_LARGEFILE
+	depends on !BR2_sh2a # glib2 -> libffi
+	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2 -> libffi
 	help
 	  Babeltrace is part of the LTTng 2.x project.
 
@@ -26,5 +28,6 @@ config BR2_PACKAGE_LTTNG_BABELTRACE
 
 	  http://lttng.org
 
-comment "lttng-babeltrace needs WCHAR and LARGEFILE support"
-	depends on BR2_PACKAGE_LTTNG_TOOLS && !(BR2_USE_WCHAR || BR2_LARGEFILE)
+comment "lttng-babeltrace needs WCHAR, LARGEFILE and thread support"
+	depends on BR2_PACKAGE_LTTNG_TOOLS && \
+		!(BR2_USE_WCHAR || BR2_LARGEFILE || BR2_TOOLCHAIN_HAS_THREADS)
diff --git a/package/multimedia/gst-plugins-bad/Config.in b/package/multimedia/gst-plugins-bad/Config.in
index cb50fbd..b02e2da 100644
--- a/package/multimedia/gst-plugins-bad/Config.in
+++ b/package/multimedia/gst-plugins-bad/Config.in
@@ -271,6 +271,9 @@ config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_FBDEV
 
 config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_LIBMMS
 	bool "libmms"
+	depends on BR2_USE_WCHAR # libmms -> glib2
+	depends on !BR2_sh2a # libmms -> glib2 -> libffi
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libmms -> glib2 -> libffi
 	select BR2_PACKAGE_LIBMMS
 
 config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_NEON
diff --git a/package/multimedia/gst-plugins-base/Config.in b/package/multimedia/gst-plugins-base/Config.in
index 5d82533..a6ba9ae 100644
--- a/package/multimedia/gst-plugins-base/Config.in
+++ b/package/multimedia/gst-plugins-base/Config.in
@@ -79,11 +79,16 @@ config BR2_PACKAGE_GST_PLUGINS_BASE_PLUGIN_OGG
 
 config BR2_PACKAGE_GST_PLUGINS_BASE_PLUGIN_PANGO
 	bool "pango font renderer"
-	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_USE_WCHAR # pango -> glib2
+	depends on BR2_INSTALL_LIBSTDCPP # pango -> freetype support
+	depends on !BR2_sh2a # pango -> glib2 -> libffi
+	depends on BR2_TOOLCHAIN_HAS_THREADS # pango -> glib2 -> libffi
 	select BR2_PACKAGE_PANGO
 
-comment "pango plugin requires a toolchain with C++ support"
-	depends on !BR2_INSTALL_LIBSTDCPP
+comment "pango plugin requires a toolchain with C++, wchar and thread support"
+	depends on !BR2_INSTALL_LIBSTDCPP || \
+		!BR2_USE_WCHAR || \
+		!BR2_TOOLCHAIN_HAS_THREADS
 
 config BR2_PACKAGE_GST_PLUGINS_BASE_PLUGIN_THEORA
 	bool "theora (*.ogg video)"
diff --git a/package/multimedia/gst-plugins-good/Config.in b/package/multimedia/gst-plugins-good/Config.in
index 33ecb5c..998e2c5 100644
--- a/package/multimedia/gst-plugins-good/Config.in
+++ b/package/multimedia/gst-plugins-good/Config.in
@@ -198,6 +198,9 @@ config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_PULSE
 
 config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_SOUPHTTPSRC
 	bool "souphttpsrc (http client)"
+	depends on BR2_USE_WCHAR # libsoup -> glib2 and gnutls
+	depends on !BR2_sh2a # libsoup -> glib2 -> libffi
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libsoup -> glib2 -> libffi
 	select BR2_PACKAGE_LIBSOUP
 
 config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_SPEEX
diff --git a/package/multimedia/gstreamer/Config.in b/package/multimedia/gstreamer/Config.in
index 4d279b8..4370902 100644
--- a/package/multimedia/gstreamer/Config.in
+++ b/package/multimedia/gstreamer/Config.in
@@ -1,6 +1,8 @@
 config BR2_PACKAGE_GSTREAMER
 	bool "gstreamer"
 	depends on BR2_USE_WCHAR # glib2
+	depends on !BR2_sh2a # glib2 -> libffi
+	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2 -> libffi
 	select BR2_PACKAGE_LIBGLIB2
 	help
 	  GStreamer is an open source multimedia framework.
@@ -16,5 +18,5 @@ config BR2_PACKAGE_GSTREAMER_GST_DEBUG
 	  in gstreamer. This has limited CPU overhead, but does
 	  increase the rootfs size somewhat.
 
-comment "gstreamer requires a toolchain with WCHAR support"
-	depends on !BR2_USE_WCHAR
+comment "gstreamer requires a toolchain with WCHAR and thread support"
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/multimedia/mpd/Config.in b/package/multimedia/mpd/Config.in
index c7c0cd7..f0adaac 100644
--- a/package/multimedia/mpd/Config.in
+++ b/package/multimedia/mpd/Config.in
@@ -2,6 +2,8 @@ menuconfig BR2_PACKAGE_MPD
 	bool "mpd"
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_WCHAR
+	depends on !BR2_sh2a # glib2 -> libffi
+	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2 -> libffi
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 	select BR2_PACKAGE_MPD_TREMOR if !(BR2_PACKAGE_MPD_MAD || BR2_PACKAGE_MPD_MPG123 || BR2_PACKAGE_MPD_VORBIS || BR2_PACKAGE_MPD_WAVPACK || BR2_PACKAGE_MPD_FLAC || BR2_PACKAGE_MPD_MUSEPACK || BR2_PACKAGE_MPD_FFMPEG)
@@ -174,5 +176,6 @@ config BR2_PACKAGE_MPD_WAVPACK
 
 endif
 
-comment "mpd requires a toolchain with C++ and WCHAR support"
-	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR
+comment "mpd requires a toolchain with C++, WCHAR and thread support"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
+		!BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/nbd/Config.in b/package/nbd/Config.in
index 6e92f93..7604a19 100644
--- a/package/nbd/Config.in
+++ b/package/nbd/Config.in
@@ -1,6 +1,8 @@
 config BR2_PACKAGE_NBD
 	bool "nbd"
 	depends on BR2_USE_WCHAR # glib2
+	depends on !BR2_sh2a # glib2 -> libffi
+	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2 -> libffi
 	select BR2_PACKAGE_LIBGLIB2
 	help
 	  NBD is a set of utilities to configure network block devices,
@@ -10,8 +12,8 @@ config BR2_PACKAGE_NBD
 
 	  http://nbd.sf.net/
 
-comment "nbd requires a toolchain with WCHAR support"
-	depends on !BR2_USE_WCHAR
+comment "nbd requires a toolchain with WCHAR and thread support"
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
 
 if BR2_PACKAGE_NBD
 
diff --git a/package/network-manager/Config.in b/package/network-manager/Config.in
index 3f01fef..24c9431 100644
--- a/package/network-manager/Config.in
+++ b/package/network-manager/Config.in
@@ -5,7 +5,8 @@ config BR2_PACKAGE_NETWORK_MANAGER
 	depends on BR2_INET_IPV6
 	depends on BR2_LARGEFILE # acl
 	depends on BR2_USE_WCHAR # libglib2 and gnutls
-	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus
+	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus, dbus-glib -> glib2, libffi
+	depends on !BR2_sh2a # dbus-glib -> glib2 -> libffi
 	select BR2_PACKAGE_DBUS_GLIB
 	select BR2_PACKAGE_UDEV
 	select BR2_PACKAGE_UDEV_ALL_EXTRAS
diff --git a/package/ofono/Config.in b/package/ofono/Config.in
index 74c8b53..379c5c4 100644
--- a/package/ofono/Config.in
+++ b/package/ofono/Config.in
@@ -1,7 +1,8 @@
 config BR2_PACKAGE_OFONO
 	bool "ofono"
 	depends on BR2_USE_WCHAR # gettext/libglib2
-	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus
+	depends on !BR2_sh2a # glib2 -> libffi
+	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus, glib2 -> libffi
 	select BR2_PACKAGE_LIBCAP_NG
 	select BR2_PACKAGE_DBUS
 	select BR2_PACKAGE_LIBGLIB2
diff --git a/package/opencv/Config.in b/package/opencv/Config.in
index 3e9ead6..6e5083d 100644
--- a/package/opencv/Config.in
+++ b/package/opencv/Config.in
@@ -139,7 +139,9 @@ comment "ffmpeg support requires a toolchain with LARGEFILE and IPV6 support"
 
 config BR2_PACKAGE_OPENCV_WITH_GSTREAMER
 	bool "gstreamer support"
-	depends on BR2_USE_WCHAR
+	depends on BR2_USE_WCHAR # gstreamer -> glib2
+	depends on !BR2_sh2a # gstreamer -> glib2 -> libffi
+	depends on BR2_TOOLCHAIN_HAS_THREADS # gstreamer -> glib2 -> libffi
 	select BR2_PACKAGE_GSTREAMER
 	select BR2_PACKAGE_GST_PLUGINS_BASE
 	select BR2_PACKAGE_GST_PLUGINS_BASE_PLUGIN_APP
@@ -149,6 +151,8 @@ config BR2_PACKAGE_OPENCV_WITH_GTK
 	depends on BR2_PACKAGE_XORG7||BR2_PACKAGE_DIRECTFB
 	depends on BR2_USE_WCHAR
 	depends on BR2_INSTALL_LIBSTDCPP
+	depends on !BR2_sh2a # gtk2 -> glib2 -> libffi
+	depends on BR2_TOOLCHAIN_HAS_THREADS # gtk2 -> glib2 -> libffi
 	select BR2_PACKAGE_LIBGTK2
 
 config BR2_PACKAGE_OPENCV_WITH_JPEG
diff --git a/package/pango/Config.in b/package/pango/Config.in
index 923c3d4..06e4d43 100644
--- a/package/pango/Config.in
+++ b/package/pango/Config.in
@@ -2,6 +2,8 @@ config BR2_PACKAGE_PANGO
 	bool "pango"
 	depends on BR2_USE_WCHAR # glib2
 	depends on BR2_INSTALL_LIBSTDCPP # freetype support
+	depends on !BR2_sh2a # glib2 -> libffi
+	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2 -> libffi
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_EXPAT
 	select BR2_PACKAGE_CAIRO
@@ -16,5 +18,6 @@ config BR2_PACKAGE_PANGO
 
 	  http://www.pango.org/
 
-comment "pango requires a toolchain with WCHAR and C++ support"
-	depends on !BR2_USE_WCHAR || !BR2_INSTALL_LIBSTDCPP
+comment "pango requires a toolchain with WCHAR, C++ and thread support"
+	depends on !BR2_USE_WCHAR || !BR2_INSTALL_LIBSTDCPP || \
+		!BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/pkg-config/Config.in b/package/pkg-config/Config.in
index eae0a21..3879f2a 100644
--- a/package/pkg-config/Config.in
+++ b/package/pkg-config/Config.in
@@ -1,6 +1,8 @@
 config BR2_PACKAGE_PKG_CONFIG
 	bool "pkg-config"
 	depends on BR2_USE_WCHAR # glib2
+	depends on !BR2_sh2a # glib2 -> libffi
+	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2 -> libffi
 	select BR2_PACKAGE_LIBGLIB2
 	help
 	  pkg-config is a system for managing library compile/link
@@ -10,5 +12,5 @@ config BR2_PACKAGE_PKG_CONFIG
 
 	  http://www.freedesktop.org/software/pkgconfig/
 
-comment "pkg-config requires a toolchain with WCHAR support"
-	depends on !BR2_USE_WCHAR
+comment "pkg-config requires a toolchain with WCHAR and thread support"
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/python/Config.in b/package/python/Config.in
index 11aa267..e16287c 100644
--- a/package/python/Config.in
+++ b/package/python/Config.in
@@ -2,13 +2,15 @@ config BR2_PACKAGE_PYTHON
 	bool "python"
 	depends on BR2_USE_WCHAR
 	select BR2_PACKAGE_LIBFFI
+	depends on !BR2_sh2a # libffi
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libffi
 	help
 	  The python language interpreter.
 
 	  http://www.python.org/
 
-comment "python requires a toolchain with WCHAR support"
-	depends on !BR2_USE_WCHAR
+comment "python requires a toolchain with WCHAR and thread support"
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
 
 if BR2_PACKAGE_PYTHON
 
diff --git a/package/shared-mime-info/Config.in b/package/shared-mime-info/Config.in
index b08c1fd..8802755 100644
--- a/package/shared-mime-info/Config.in
+++ b/package/shared-mime-info/Config.in
@@ -1,6 +1,8 @@
 config BR2_PACKAGE_SHARED_MIME_INFO
 	bool "shared-mime-info"
 	depends on BR2_USE_WCHAR # glib2
+	depends on !BR2_sh2a # glib2 -> libffi
+	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2 -> libffi
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_LIBXML2
 	help
@@ -10,5 +12,5 @@ config BR2_PACKAGE_SHARED_MIME_INFO
 
 	  http://freedesktop.org/wiki/Software/shared-mime-info
 
-comment "shared-mime-info requires a toolchain with WCHAR support"
-	depends on !BR2_USE_WCHAR
+comment "shared-mime-info requires a toolchain with WCHAR and thread support"
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/sshfs/Config.in b/package/sshfs/Config.in
index 73d552f..ce91866 100644
--- a/package/sshfs/Config.in
+++ b/package/sshfs/Config.in
@@ -8,10 +8,12 @@ config BR2_PACKAGE_SSHFS
 	select BR2_PACKAGE_OPENSSH
 	depends on BR2_LARGEFILE
 	depends on BR2_USE_WCHAR # glib2
+	depends on !BR2_sh2a # glib2 -> libffi
+	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2 -> libffi
 	help
 	  FUSE filesystem client based on the SSH File Transfer Protocol.
 
 	  http://fuse.sourceforge.net/sshfs.html
 
-comment "sshfs requires a toolchain with LARGEFILE and WCHAR support"
-	depends on !BR2_LARGEFILE || !BR2_USE_WCHAR
+comment "sshfs requires a toolchain with LARGEFILE, WCHAR and thread support"
+	depends on !BR2_LARGEFILE || !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/sysprof/Config.in b/package/sysprof/Config.in
index 513a32c..8c29084 100644
--- a/package/sysprof/Config.in
+++ b/package/sysprof/Config.in
@@ -2,6 +2,8 @@ config BR2_PACKAGE_SYSPROF
 	bool "sysprof"
 	select BR2_PACKAGE_LIBGLIB2
 	depends on BR2_USE_WCHAR # glib2
+	depends on !BR2_sh2a # glib2 -> libffi
+	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2 -> libffi
 	# In its util.h file, sysprof contains architecture-specific
 	# code
 	depends on BR2_i386 || BR2_x86_64 || BR2_powerpc || BR2_sh4a || BR2_sh4aeb
@@ -20,5 +22,5 @@ config BR2_PACKAGE_SYSPROF_GUI
 	help
 	  GUI for the sysprof system-wide statistical profiler.
 
-comment "sysprof requires a toolchain with WCHAR support"
-        depends on !BR2_USE_WCHAR
+comment "sysprof requires a toolchain with WCHAR and thread support"
+        depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/udev/Config.in b/package/udev/Config.in
index d3244d1..b07b0f4 100644
--- a/package/udev/Config.in
+++ b/package/udev/Config.in
@@ -3,6 +3,8 @@ config BR2_PACKAGE_UDEV
 	depends on BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV
 	depends on BR2_LARGEFILE # util-linux
 	depends on BR2_USE_WCHAR # util-linux
+	depends on !BR2_sh2a # glib2 -> libffi
+	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2 -> libffi
 	select BR2_PACKAGE_UTIL_LINUX
 	select BR2_PACKAGE_UTIL_LINUX_LIBBLKID
 	select BR2_PACKAGE_KMOD
diff --git a/package/vala/Config.in b/package/vala/Config.in
index 89b4459..0c97958 100644
--- a/package/vala/Config.in
+++ b/package/vala/Config.in
@@ -1,6 +1,8 @@
 config BR2_PACKAGE_VALA
 	bool "vala"
 	depends on BR2_USE_WCHAR # glib2
+	depends on !BR2_sh2a # glib2 -> libffi
+	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2 -> libffi
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
 	select BR2_PACKAGE_LIBINTL if BR2_NEEDS_GETTEXT_IF_LOCALE
@@ -10,5 +12,5 @@ config BR2_PACKAGE_VALA
 
 	  http://live.gnome.org/Vala
 
-comment "vala requires a toolchain with WCHAR support"
-	depends on !BR2_USE_WCHAR
+comment "vala requires a toolchain with WCHAR and thread support"
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
-- 
1.7.9.5
