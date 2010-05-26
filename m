From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 26 May 2010 14:14:39 +0200
Subject: [Buildroot] [git commit master] package: gettext needs WCHAR support
Message-ID: <20100526122002.40F661EB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=b730010c90a127746bada3d537eb0e204cba5988
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

gettext needs WCHAR support in the toolchain, and as libglib2 depends on
gettext and lots of stuff depends on libglib2, quite a lot of packages
needs to have their dependencies adjusted.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                                |   15 +++++++++------
 package/atk/Config.in                  |    4 ++++
 package/dbus-glib/Config.in            |    4 ++++
 package/dbus-python/Config.in          |    4 ++++
 package/docker/Config.in               |    4 ++++
 package/enchant/Config.in              |    5 +++--
 package/gamin/Config.in                |    4 ++++
 package/gettext/Config.in              |    4 ++++
 package/gmpc/Config.in                 |    4 ++++
 package/gob2/Config.in                 |    4 ++++
 package/gvfs/Config.in                 |    5 +++--
 package/hal/Config.in                  |    4 ++++
 package/libglade/Config.in             |    4 ++++
 package/libglib2/Config.in             |    4 ++++
 package/libgtk2/Config.in              |    4 ++++
 package/libsoup/Config.in              |    8 ++++++--
 package/multimedia/gstreamer/Config.in |    4 ++++
 package/multimedia/libmms/Config.in    |    4 ++++
 package/multimedia/libmpd/Config.in    |    4 ++++
 package/multimedia/swfdec/Config.in    |    3 +++
 package/nbd/Config.in                  |    4 ++++
 package/pango/Config.in                |    4 ++++
 package/pcmanfm/Config.in              |    4 ++++
 package/php/Config.ext                 |    4 ++++
 package/pkg-config/Config.in           |    4 ++++
 package/shared-mime-info/Config.in     |    4 ++++
 package/sshfs/Config.in                |    5 +++--
 package/xstroke/Config.in              |    4 ++++
 28 files changed, 115 insertions(+), 14 deletions(-)

diff --git a/CHANGES b/CHANGES
index 985347a..61ab052 100644
--- a/CHANGES
+++ b/CHANGES
@@ -2,12 +2,15 @@
 
 	Fixes all over the tree.
 
-	Updated/fixed packages: aumix, avahi, busybox, cairo, cdrkit,
-	fltk, gettext, gmpc, grep, hal, iconv, icu, libcgicc, libglib2,
-	libidn, libmpd, libpcap, libsoup, lmbench, ltrace, lvm2, make,
-	metacity, mtd-utils, mutt, netsnmp, ntp, pango, pciutils,
-	pcmanfm, php, psmisc, qt, samba, sshfs, startup-notification,
-	swfdec, sylpheed, uemacs, util-linux, vpnc, webkit
+	Updated/fixed packages: aumix, atk, avahi, busybox, cairo,
+	cdrkit, dbus-glib, dbus-python, docker, enchant, fltk, gamin,
+	gettext, gmpc, gob2, grep, gstreamer, gvfs, hal, iconv, icu,
+	libcgicc, libglade, libglib2, libgtk2, libidn, libmms, libmpd,
+	libpcap, libsoup, lmbench, ltrace, lvm2, make,
+	metacity, mtd-utils, mutt, nbd, netsnmp, ntp, pango, pciutils,
+	pcmanfm, php, pkg-config, psmisc, qt, samba, shared-mime-info,
+	sshfs, startup-notification, swfdec, sylpheed, uemacs,
+	util-linux, vpnc, webkit, xstroke
 
 	Issues resolved (http://bugs.uclibc.org):
 
diff --git a/package/atk/Config.in b/package/atk/Config.in
index e7f75b3..928fae7 100644
--- a/package/atk/Config.in
+++ b/package/atk/Config.in
@@ -1,5 +1,9 @@
 config BR2_PACKAGE_ATK
 	bool "atk"
 	select BR2_PACKAGE_LIBGLIB2
+	depends on BR2_USE_WCHAR # glib2
 	help
 	  The ATK accessibility toolkit, needed to build GTK+-2.x.
+
+comment "atk requires a toolchain with WCHAR support"
+	depends on !BR2_USE_WCHAR
diff --git a/package/dbus-glib/Config.in b/package/dbus-glib/Config.in
index 7c992b0..c019be7 100644
--- a/package/dbus-glib/Config.in
+++ b/package/dbus-glib/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_DBUS_GLIB
 	bool "dbus-glib"
 	depends on BR2_PACKAGE_DBUS
 	depends on BR2_DBUS_EXPAT
+	depends on BR2_USE_WCHAR # glib2
 	select BR2_PACKAGE_LIBGLIB2
 	help
 	  GLib bindings for D-Bus.
@@ -10,3 +11,6 @@ config BR2_PACKAGE_DBUS_GLIB
 
 comment "dbus-glib needs dbus to be compiled with expat support"
 	depends on BR2_PACKAGE_DBUS && !BR2_DBUS_EXPAT
+
+comment "dbus-glib requires a toolchain with WCHAR support"
+	depends on BR2_PACKAGE_DBUS && !BR2_USE_WCHAR
diff --git a/package/dbus-python/Config.in b/package/dbus-python/Config.in
index f5705a5..91c127d 100644
--- a/package/dbus-python/Config.in
+++ b/package/dbus-python/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_DBUS_PYTHON
 	bool "dbus-python"
+	depends on BR2_USE_WCHAR # glib2
 	depends on BR2_PACKAGE_DBUS
 	depends on BR2_PACKAGE_PYTHON
 	select BR2_PACKAGE_DBUS_GLIB
@@ -7,3 +8,6 @@ config BR2_PACKAGE_DBUS_PYTHON
 	  Python bindings for D-Bus
 
 	  http://dbus.freedesktop.org/doc/dbus-python/
+
+comment "dbus-python requires a toolchain with WCHAR support"
+	depends on BR2_PACKAGE_DBUS && BR2_PACKAGE_PYTHON && !BR2_USE_WCHAR
diff --git a/package/docker/Config.in b/package/docker/Config.in
index 02ef83c..75bf5be 100644
--- a/package/docker/Config.in
+++ b/package/docker/Config.in
@@ -1,8 +1,12 @@
 config BR2_PACKAGE_DOCKER
 	bool "docker"
 	depends on BR2_PACKAGE_XORG7
+	depends on BR2_USE_WCHAR # glib2
 	select BR2_PACKAGE_LIBGLIB2
 	help
 	  a system tray dock for X
 
 	  http://icculus.org/openbox/2/docker
+
+comment "docker requires a toolchain with WCHAR support"
+	depends on BR2_PACKAGE_XORG7 && !BR2_USE_WCHAR
diff --git a/package/enchant/Config.in b/package/enchant/Config.in
index 9cd15a1..33f36db 100644
--- a/package/enchant/Config.in
+++ b/package/enchant/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_ENCHANT
 	bool "enchant"
 	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_USE_WCHAR # glib2
 	select BR2_PACKAGE_LIBGLIB2
 	help
 	  Enchant is a spell-checking library that provides a consistent
@@ -8,5 +9,5 @@ config BR2_PACKAGE_ENCHANT
 
 	  http://www.abisource.com/projects/enchant/
 
-comment "enchant requires a toolchain with C++ support enabled"
-	depends on !BR2_INSTALL_LIBSTDCPP
+comment "enchant requires a toolchain with C++ and WCHAR support enabled"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR
diff --git a/package/gamin/Config.in b/package/gamin/Config.in
index d4e9bcc..3ede2e4 100644
--- a/package/gamin/Config.in
+++ b/package/gamin/Config.in
@@ -1,7 +1,11 @@
 config BR2_PACKAGE_GAMIN
 	bool "gamin"
+	depends on BR2_USE_WCHAR # glib2
 	select BR2_PACKAGE_LIBGLIB2
 	help
 	  the File Alteration Monitor
 
 	  http://www.gnome.org/~veillard/gamin/sources
+
+comment "gamin requires a toolchain with WCHAR support"
+	depends on !BR2_USE_WCHAR
diff --git a/package/gettext/Config.in b/package/gettext/Config.in
index c6792ac..c1ae97f 100644
--- a/package/gettext/Config.in
+++ b/package/gettext/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_GETTEXT
 	bool "gettext"
 	depends on BR2_NEEDS_GETTEXT
+	depends on BR2_USE_WCHAR
 	help
 	  The GNU `gettext' utilities are a set of tools that provide a
 	  framework to help other GNU packages produce multi-lingual
@@ -8,6 +9,9 @@ config BR2_PACKAGE_GETTEXT
 
 	  http://www.gnu.org/software/gettext/
 
+comment "gettext requires a toolchain with WCHAR support"
+	depends on BR2_NEEDS_GETTEXT && !BR2_USE_WCHAR
+
 config BR2_PACKAGE_GETTEXT_STATIC
 	bool "Use libgettext.a instead of libgettext.so.*"
 	depends on BR2_PACKAGE_GETTEXT
diff --git a/package/gmpc/Config.in b/package/gmpc/Config.in
index 979df48..7bfe611 100644
--- a/package/gmpc/Config.in
+++ b/package/gmpc/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_GMPC
 	bool "gmpc"
 	depends on BR2_PACKAGE_LIBGTK2
+	depends on BR2_USE_WCHAR # glib2
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
 	select BR2_PACKAGE_LIBINTL if BR2_NEEDS_GETTEXT_IF_LOCALE
@@ -14,3 +15,6 @@ config BR2_PACKAGE_GMPC
 	  Music Player Daemon.
 
 	  http://gmpcwiki.sarine.nl/index.php?title=GMPC
+
+comment "gmpc requires a toolchain with WCHAR support"
+	depends on BR2_PACKAGE_LIBGTK2 && !BR2_USE_WCHAR
diff --git a/package/gob2/Config.in b/package/gob2/Config.in
index 2545baf..562ac31 100644
--- a/package/gob2/Config.in
+++ b/package/gob2/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_GOB2
 	bool "gob2"
+	depends on BR2_USE_WCHAR # glib2
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_FLEX
 	select BR2_PACKAGE_FLEX_LIBFL
@@ -9,3 +10,6 @@ config BR2_PACKAGE_GOB2
 	  the writing of GObjects in C.
 
 	  http://www.jirka.org/gob.html
+
+comment "gob2 requires a toolchain with WCHAR support"
+	depends on !BR2_USE_WCHAR
diff --git a/package/gvfs/Config.in b/package/gvfs/Config.in
index 8a541e7..04fce93 100644
--- a/package/gvfs/Config.in
+++ b/package/gvfs/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_GVFS
 	bool "gvfs"
 	depends on BR2_LARGEFILE
+	depends on BR2_USE_WCHAR # glib2
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_EXPAT # needed by dbus(-glib)
 	select BR2_PACKAGE_DBUS
@@ -15,5 +16,5 @@ config BR2_PACKAGE_GVFS
 
 	  http://en.wikipedia.org/wiki/GVFS
 
-comment "gvfs requires a toolchain with LARGEFILE support"
-	depends on !BR2_LARGEFILE
+comment "gvfs requires a toolchain with LARGEFILE and WCHAR support"
+	depends on !BR2_LARGEFILE || !BR2_USE_WCHAR
diff --git a/package/hal/Config.in b/package/hal/Config.in
index 0420568..f8dc9dd 100644
--- a/package/hal/Config.in
+++ b/package/hal/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_HAL
 	bool "hal"
+	depends on BR2_USE_WCHAR # glib2
 	select BR2_PACKAGE_EXPAT
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
@@ -13,3 +14,6 @@ config BR2_PACKAGE_HAL
 	select BR2_PACKAGE_UDEV_VOLUME_ID
 	help
 	  The Hardware Abstraction Layer (HAL) suite.
+
+comment "hal requires a toolchain with WCHAR support"
+	depends on !BR2_USE_WCHAR
diff --git a/package/libglade/Config.in b/package/libglade/Config.in
index 2fb6eb6..f7a9a1c 100644
--- a/package/libglade/Config.in
+++ b/package/libglade/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_LIBGLADE
 	bool "libglade"
 	depends on BR2_PACKAGE_LIBGTK2
+	depends on BR2_USE_WCHAR # glib2
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_ATK
 	select BR2_PACKAGE_LIBXML2
@@ -10,3 +11,6 @@ config BR2_PACKAGE_LIBGLADE
 	  by far the easiest way to create the interface files.
 
 	  http://ftp.gnome.org/pub/GNOME/sources/libglade/
+
+comment "libglade requires a toolchain with WCHAR support"
+	depends on BR2_PACKAGE_LIBGTK2 && !BR2_USE_WCHAR
diff --git a/package/libglib2/Config.in b/package/libglib2/Config.in
index cc1d6e2..43ca7c0 100644
--- a/package/libglib2/Config.in
+++ b/package/libglib2/Config.in
@@ -3,7 +3,11 @@ config BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT
 	select BR2_PACKAGE_LIBINTL if BR2_NEEDS_GETTEXT
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
+	depends on BR2_USE_WCHAR # gettext
 	help
 	  Low-level core library that forms the basis of GTK+ and GNOME.
 
 	  http://www.gtk.org/
+
+comment "libglib2 requires a toolchain with WCHAR support"
+	depends on !BR2_USE_WCHAR
diff --git a/package/libgtk2/Config.in b/package/libgtk2/Config.in
index 5c0482d..5eec77a 100644
--- a/package/libgtk2/Config.in
+++ b/package/libgtk2/Config.in
@@ -7,7 +7,11 @@ config BR2_PACKAGE_LIBGTK2
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_PANGO
 	depends on BR2_PACKAGE_XORG7||BR2_PACKAGE_DIRECTFB
+	depends on BR2_USE_WCHAR # glib2
 	help
 	  The GTK+ version 2 graphical user interface library
 
 	  http://www.gtk.org/
+
+comment "libgtk2 requires a toolchain with WCHAR support"
+	depends on !BR2_USE_WCHAR
diff --git a/package/libsoup/Config.in b/package/libsoup/Config.in
index b3d4b5f..2264b63 100644
--- a/package/libsoup/Config.in
+++ b/package/libsoup/Config.in
@@ -1,12 +1,16 @@
 config BR2_PACKAGE_LIBSOUP
 	bool "libsoup"
+	depends on BR2_USE_WCHAR # glib2
 	select BR2_PACKAGE_LIBXML2
 	select BR2_PACKAGE_LIBGLIB2
-	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
-	select BR2_PACKAGE_LIBINTL if BR2_NEEDS_GETTEXT_IF_LOCALE
+	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT
+	select BR2_PACKAGE_LIBINTL if BR2_NEEDS_GETTEXT
 	help
 	  libsoup is an HTTP client/server library. It uses GObject
 	  and the GLib main loop, to integrate well with GNOME
 	  applications.
 
 	  http://live.gnome.org/LibSoup
+
+comment "libsoup requires a toolchain with WCHAR support"
+	depends on !BR2_USE_WCHAR
diff --git a/package/multimedia/gstreamer/Config.in b/package/multimedia/gstreamer/Config.in
index 8c80801..a3ce859 100644
--- a/package/multimedia/gstreamer/Config.in
+++ b/package/multimedia/gstreamer/Config.in
@@ -1,11 +1,15 @@
 config BR2_PACKAGE_GSTREAMER
 	bool "gstreamer"
+	depends on BR2_USE_WCHAR # glib2
 	select BR2_PACKAGE_LIBGLIB2
 	help
 	  GStreamer is an open source multimedia framework.
 
 	  http://gstreamer.freedesktop.org/
 
+comment "gstreamer requires a toolchain with WCHAR support"
+	depends on !BR2_USE_WCHAR
+
 config BR2_PACKAGE_GSTREAMER_LIBXML2
 	bool "require libxml2 for registry and load/save"
 	default y
diff --git a/package/multimedia/libmms/Config.in b/package/multimedia/libmms/Config.in
index 02055c4..17cb406 100644
--- a/package/multimedia/libmms/Config.in
+++ b/package/multimedia/libmms/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_LIBMMS
 	bool "libmms"
+	depends on BR2_USE_WCHAR # glib2
 	select BR2_PACKAGE_LIBGLIB2
 	help
           LibMMS is a common library for parsing mms:// and mmsh://
@@ -9,3 +10,6 @@ config BR2_PACKAGE_LIBMMS
           all.
 
 	  http://launchpad.net/libmms
+
+comment "libmms requires a toolchain with WCHAR support"
+	depends on !BR2_USE_WCHAR
diff --git a/package/multimedia/libmpd/Config.in b/package/multimedia/libmpd/Config.in
index 4f3a714..9259c19 100644
--- a/package/multimedia/libmpd/Config.in
+++ b/package/multimedia/libmpd/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_LIBMPD
 	bool "libmpd"
+	depends on BR2_USE_WCHAR # glib2
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 	help
@@ -8,3 +9,6 @@ config BR2_PACKAGE_LIBMPD
 	  access to Music Player Daemon (mpd).
 
 	  http://gmpcwiki.sarine.nl/index.php?title=Libmpd
+
+comment "libmpd requires a toolchain with WCHAR support"
+	depends on !BR2_USE_WCHAR
diff --git a/package/multimedia/swfdec/Config.in b/package/multimedia/swfdec/Config.in
index 0f2dea5..2a79756 100644
--- a/package/multimedia/swfdec/Config.in
+++ b/package/multimedia/swfdec/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_SWFDEC
 	bool "swfdec"
+	depends on BR2_USE_WCHAR # glib2
 	select BR2_PACKAGE_LIBOIL
 	select BR2_PACKAGE_ALSA_LIB
 	select BR2_PACKAGE_PANGO
@@ -29,3 +30,5 @@ config BR2_PACKAGE_SWFDEC_GSTREAMER
 	help
 	  Enables GStreamer support
 
+comment "swfdec requires a toolchain with WCHAR support"
+	depends on !BR2_USE_WCHAR
diff --git a/package/nbd/Config.in b/package/nbd/Config.in
index 66c24af..6e92f93 100644
--- a/package/nbd/Config.in
+++ b/package/nbd/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_NBD
 	bool "nbd"
+	depends on BR2_USE_WCHAR # glib2
 	select BR2_PACKAGE_LIBGLIB2
 	help
 	  NBD is a set of utilities to configure network block devices,
@@ -9,6 +10,9 @@ config BR2_PACKAGE_NBD
 
 	  http://nbd.sf.net/
 
+comment "nbd requires a toolchain with WCHAR support"
+	depends on !BR2_USE_WCHAR
+
 if BR2_PACKAGE_NBD
 
 config BR2_NBD_CLIENT
diff --git a/package/pango/Config.in b/package/pango/Config.in
index 2c02219..e4c084d 100644
--- a/package/pango/Config.in
+++ b/package/pango/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PANGO
 	bool "pango"
+	depends on BR2_USE_WCHAR # glib2
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_EXPAT
 	select BR2_PACKAGE_CAIRO
@@ -13,3 +14,6 @@ config BR2_PACKAGE_PANGO
 	  core of text and font handling for GTK+-2.x.
 
 	  http://www.pango.org/
+
+comment "pango requires a toolchain with WCHAR support"
+	depends on !BR2_USE_WCHAR
diff --git a/package/pcmanfm/Config.in b/package/pcmanfm/Config.in
index e87e517..c8b4deb 100644
--- a/package/pcmanfm/Config.in
+++ b/package/pcmanfm/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_PCMANFM
 	bool "pcmanfm"
 	depends on BR2_PACKAGE_XORG7
+	depends on BR2_USE_WCHAR # glib2
 	select BR2_PACKAGE_GAMIN
 	select BR2_PACKAGE_STARTUP_NOTIFICATION
 	depends on BR2_PACKAGE_LIBGTK2
@@ -9,3 +10,6 @@ config BR2_PACKAGE_PCMANFM
 	  tabbed browsing and user-friendly interface.
 
 	  http://internap.dl.sourceforge.net/sourceforge/pcmanfm
+
+comment "pcmanfm requires a toolchain with WCHAR support"
+	depends on BR2_PACKAGE_XORG7 && !BR2_USE_WCHAR
diff --git a/package/php/Config.ext b/package/php/Config.ext
index 2fbd05e..0f5b982 100644
--- a/package/php/Config.ext
+++ b/package/php/Config.ext
@@ -68,9 +68,13 @@ config BR2_PACKAGE_PHP_EXT_FTP
 config BR2_PACKAGE_PHP_EXT_GETTEXT
 	bool "gettext"
 	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT
+	depends on BR2_USE_WCHAR
 	help
 	  gettext support
 
+comment "gettext support requires a toolchain with WCHAR support"
+	depends on !BR2_USE_WCHAR
+
 config BR2_PACKAGE_PHP_EXT_GMP
 	bool "gmp"
 	select BR2_PACKAGE_LIBGMP
diff --git a/package/pkg-config/Config.in b/package/pkg-config/Config.in
index 8ec8055..eae0a21 100644
--- a/package/pkg-config/Config.in
+++ b/package/pkg-config/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PKG_CONFIG
 	bool "pkg-config"
+	depends on BR2_USE_WCHAR # glib2
 	select BR2_PACKAGE_LIBGLIB2
 	help
 	  pkg-config is a system for managing library compile/link
@@ -8,3 +9,6 @@ config BR2_PACKAGE_PKG_CONFIG
 	  single tool.
 
 	  http://www.freedesktop.org/software/pkgconfig/
+
+comment "pkg-config requires a toolchain with WCHAR support"
+	depends on !BR2_USE_WCHAR
diff --git a/package/shared-mime-info/Config.in b/package/shared-mime-info/Config.in
index adc835a..b08c1fd 100644
--- a/package/shared-mime-info/Config.in
+++ b/package/shared-mime-info/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_SHARED_MIME_INFO
 	bool "shared-mime-info"
+	depends on BR2_USE_WCHAR # glib2
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_LIBXML2
 	help
@@ -8,3 +9,6 @@ config BR2_PACKAGE_SHARED_MIME_INFO
 	  command used to extend it.
 
 	  http://freedesktop.org/wiki/Software/shared-mime-info
+
+comment "shared-mime-info requires a toolchain with WCHAR support"
+	depends on !BR2_USE_WCHAR
diff --git a/package/sshfs/Config.in b/package/sshfs/Config.in
index 8d7a2a2..61d9bf3 100644
--- a/package/sshfs/Config.in
+++ b/package/sshfs/Config.in
@@ -7,6 +7,7 @@ config BR2_PACKAGE_SSHFS
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 	depends on BR2_PACKAGE_OPENSSH
 	depends on BR2_LARGEFILE
+	depends on BR2_USE_WCHAR # glib2
 	help
 	  FUSE makes it possible to implement a filesystem in a userspace
 	  program. Features include: simple yet comprehensive API, secure
@@ -15,5 +16,5 @@ config BR2_PACKAGE_SSHFS
 
 	  http://fuse.sourceforge.net/sshfs.html
 
-comment "sshfs requires a toolchain with LARGEFILE support"
-	depends on !BR2_LARGEFILE
+comment "sshfs requires a toolchain with LARGEFILE and WCHAR support"
+	depends on !BR2_LARGEFILE || !BR2_USE_WCHAR
diff --git a/package/xstroke/Config.in b/package/xstroke/Config.in
index dc904cb..3d68b3e 100644
--- a/package/xstroke/Config.in
+++ b/package/xstroke/Config.in
@@ -1,8 +1,12 @@
 config BR2_PACKAGE_XSTROKE
 	bool "xstroke"
 	depends on BR2_PACKAGE_XORG7
+	depends on BR2_USE_WCHAR # glib2
 	select BR2_PACKAGE_DOCKER
 	help
 	  Handwriting recognition for X
 
 	  http://avr32linux.org/twiki/pub/Main/XStroke
+
+comment "xstroke requires a toolchain with WCHAR support"
+	depends on BR2_PACKAGE_XORG7 && !BR2_USE_WCHAR
-- 
1.6.3.3
