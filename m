From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 27 Jul 2013 17:13:37 +0200
Subject: [Buildroot] [git commit] libglib2: needs threads
Message-ID: <20130727213153.EA9609A970@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=51788521b7467942a550cb1d077e6550a7472498
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit adds a dependency of the libglib2 package on thread
support in the toolchain, since upstream libglib2 doesn't build
without thread support. The commit is rather large as it involves
propagating the dependency on thread support to all reverse
dependencies of the libglib2 package.

[Thomas: squash all patches into one, make a few minor fixes, the most
important one being to not add comments about MMU requirement when a
package doesn't work on !MMU platforms.]

Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
---
 package/atk/Config.in                              |    5 ++-
 package/bluez_utils/Config.in                      |    4 +-
 package/bustle/Config.in                           |    5 ++-
 package/connman/Config.in                          |    4 +-
 package/curlftpfs/Config.in                        |    4 +-
 package/dbus-glib/Config.in                        |    6 ++-
 package/dbus-python/Config.in                      |    6 ++-
 package/docker/Config.in                           |    6 ++-
 package/efl/libedbus/Config.in                     |    5 +++
 package/efl/libevas-generic-loaders/Config.in      |    5 ++-
 package/enchant/Config.in                          |    6 ++-
 package/enlightenment/Config.in                    |    1 +
 package/gamin/Config.in                            |    5 ++-
 package/gdk-pixbuf/Config.in                       |    4 ++
 package/glib-networking/Config.in                  |    5 ++-
 package/glibmm/Config.in                           |    8 +++--
 package/gmpc/Config.in                             |    6 ++-
 package/gob2/Config.in                             |    3 +-
 package/gvfs/Config.in                             |    6 ++--
 package/json-glib/Config.in                        |    5 ++-
 package/latencytop/Config.in                       |    7 ++--
 package/libgail/Config.in                          |    6 ++++
 package/libglade/Config.in                         |    6 ++-
 package/libglib2/Config.in                         |    5 ++-
 ...ib2-0002-fix-build-when-no-thread-support.patch |   30 --------------------
 package/libgtk2/Config.in                          |   11 +++++--
 package/libmms/Config.in                           |    5 ++-
 package/libmpd/Config.in                           |    5 ++-
 package/libplayer/Config.in                        |    5 ++-
 package/libqmi/Config.in                           |    4 ++
 package/librsvg/Config.in                          |    5 ++-
 package/libsoup/Config.in                          |   10 ++++--
 package/libxmlpp/Config.in                         |    8 +++--
 package/lttng-babeltrace/Config.in                 |   10 ++++--
 package/midori/Config.in                           |    6 ++-
 package/multimedia/gst-plugin-x170/Config.in       |    4 ++
 package/multimedia/gst-plugins-bad/Config.in       |   12 ++++++-
 package/multimedia/gst-plugins-base/Config.in      |    7 +++-
 package/multimedia/gst-plugins-good/Config.in      |   10 ++++++
 package/multimedia/gst1-plugins-bad/Config.in      |   12 ++++++-
 package/multimedia/gst1-plugins-base/Config.in     |    7 +++-
 package/multimedia/gst1-plugins-good/Config.in     |   10 ++++++
 package/multimedia/gstreamer/Config.in             |    2 +-
 package/multimedia/gstreamer1/Config.in            |    4 +-
 package/multimedia/mpd/Config.in                   |    8 +++--
 package/nbd/Config.in                              |    7 ++--
 package/neard/Config.in                            |    7 +++-
 package/neardal/Config.in                          |    9 ++++--
 package/network-manager/Config.in                  |    2 +-
 package/ofono/Config.in                            |    7 ++--
 package/opencv/Config.in                           |   10 ++++--
 package/openobex/Config.in                         |   18 ++++++------
 package/pango/Config.in                            |    6 ++-
 package/pcmanfm/Config.in                          |    6 ++-
 package/pkg-config/Config.in                       |    5 ++-
 package/polkit/Config.in                           |    5 ++-
 package/sconeserver/Config.in                      |    2 +-
 package/shared-mime-info/Config.in                 |    5 ++-
 package/snowball-init/Config.in                    |    5 ++-
 package/sshfs/Config.in                            |    2 +-
 package/sysprof/Config.in                          |   10 ++++--
 package/udev/Config.in                             |    5 +++
 package/udisks/Config.in                           |   13 ++++++--
 package/ussp-push/Config.in                        |    2 +-
 package/vala/Config.in                             |    5 ++-
 package/webkit/Config.in                           |    8 +++--
 package/wireshark/Config.in                        |    5 ++-
 67 files changed, 280 insertions(+), 162 deletions(-)

diff --git a/package/atk/Config.in b/package/atk/Config.in
index 928fae7..7dec8b8 100644
--- a/package/atk/Config.in
+++ b/package/atk/Config.in
@@ -2,8 +2,9 @@ config BR2_PACKAGE_ATK
 	bool "atk"
 	select BR2_PACKAGE_LIBGLIB2
 	depends on BR2_USE_WCHAR # glib2
+	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
 	help
 	  The ATK accessibility toolkit, needed to build GTK+-2.x.
 
-comment "atk requires a toolchain with WCHAR support"
-	depends on !BR2_USE_WCHAR
+comment "atk requires a toolchain with WCHAR and threading support"
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/bluez_utils/Config.in b/package/bluez_utils/Config.in
index 72b900c..570ba75 100644
--- a/package/bluez_utils/Config.in
+++ b/package/bluez_utils/Config.in
@@ -2,7 +2,7 @@ config BR2_PACKAGE_BLUEZ_UTILS
 	bool "bluez-utils"
 	depends on !BR2_avr32
 	depends on BR2_USE_WCHAR # libglib2
-	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus, alsa-lib
+	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus, alsa-lib, libglib2
 	depends on BR2_USE_MMU # dbus
 	select BR2_PACKAGE_DBUS
 	select BR2_PACKAGE_LIBGLIB2
@@ -38,5 +38,5 @@ config BR2_PACKAGE_BLUEZ_UTILS_USB
 
 endif
 
-comment "bluez-utils require a toolchain with WCHAR and thread support"
+comment "bluez-utils require a toolchain with WCHAR and threading support"
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/bustle/Config.in b/package/bustle/Config.in
index 2a2a2c1..704165d 100644
--- a/package/bustle/Config.in
+++ b/package/bustle/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_BUSTLE
 	select BR2_PACKAGE_LIBPCAP
 	select BR2_PACKAGE_LIBGLIB2
 	depends on BR2_USE_WCHAR # libglib2
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
 	depends on BR2_PACKAGE_DBUS # runtime
 	help
 	  Bustle is a better dbus-monitor! It records and draws
@@ -18,5 +19,5 @@ config BR2_PACKAGE_BUSTLE
 
 	  http://www.willthompson.co.uk/bustle/
 
-comment "bustle requires a toolchain with WCHAR support"
-	depends on !BR2_USE_WCHAR
+comment "bustle requires a toolchain with WCHAR support and threading support"
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/connman/Config.in b/package/connman/Config.in
index e0505b3..0853941 100644
--- a/package/connman/Config.in
+++ b/package/connman/Config.in
@@ -7,7 +7,7 @@ config BR2_PACKAGE_CONNMAN
 	depends on !BR2_UCLIBC_VERSION_0_9_32
 	depends on BR2_USE_WCHAR # libglib2 and gnutls
 	depends on BR2_INET_IPV6
-	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus
+	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus, libglib2
 	depends on BR2_USE_MMU # dbus
 	help
 	  The Connection Manager (ConnMan) project provides a daemon for
@@ -49,6 +49,6 @@ config BR2_PACKAGE_CONNMAN_CLIENT
 
 endif # BR2_PACKAGE_CONNMAN
 
-comment "connman needs a toolchain with IPv6, WCHAR, thread and resolver support"
+comment "connman needs a toolchain with IPv6, WCHAR, threading and resolver support"
 	depends on BR2_UCLIBC_VERSION_0_9_32 || \
 		!BR2_USE_WCHAR || !BR2_INET_IPV6 || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/curlftpfs/Config.in b/package/curlftpfs/Config.in
index 0d8e715..ac527da 100644
--- a/package/curlftpfs/Config.in
+++ b/package/curlftpfs/Config.in
@@ -8,7 +8,7 @@ config BR2_PACKAGE_CURLFTPFS
 	select BR2_PACKAGE_LIBCURL
 	depends on BR2_LARGEFILE
 	depends on BR2_USE_WCHAR # glib2
-	depends on BR2_TOOLCHAIN_HAS_THREADS # libfuse
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libfuse, glib2
 	depends on BR2_USE_MMU # libfuse
 	depends on !BR2_PREFER_STATIC_LIB # libfuse
 	help
@@ -17,5 +17,5 @@ config BR2_PACKAGE_CURLFTPFS
 
 	  http://curlftpfs.sourceforge.net/
 
-comment "curlftpfs requires a toolchain with LARGEFILE, WCHAR, threads and dynamic library support"
+comment "curlftpfs requires a toolchain with LARGEFILE, WCHAR, threading and dynamic library support"
 	depends on !BR2_LARGEFILE || !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || BR2_PREFER_STATIC_LIB
diff --git a/package/dbus-glib/Config.in b/package/dbus-glib/Config.in
index f1dab43..b019b34 100644
--- a/package/dbus-glib/Config.in
+++ b/package/dbus-glib/Config.in
@@ -2,11 +2,13 @@ config BR2_PACKAGE_DBUS_GLIB
 	bool "dbus-glib"
 	depends on BR2_PACKAGE_DBUS
 	depends on BR2_USE_WCHAR # glib2
+	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
 	select BR2_PACKAGE_LIBGLIB2
 	help
 	  GLib bindings for D-Bus.
 
 	  http://www.freedesktop.org/software/dbus
 
-comment "dbus-glib requires a toolchain with WCHAR support"
-	depends on BR2_PACKAGE_DBUS && !BR2_USE_WCHAR
+comment "dbus-glib requires a toolchain with WCHAR and threading support"
+	depends on BR2_PACKAGE_DBUS && \
+		(!BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS)
diff --git a/package/dbus-python/Config.in b/package/dbus-python/Config.in
index 91c127d..61e81e7 100644
--- a/package/dbus-python/Config.in
+++ b/package/dbus-python/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_DBUS_PYTHON
 	bool "dbus-python"
 	depends on BR2_USE_WCHAR # glib2
+	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
 	depends on BR2_PACKAGE_DBUS
 	depends on BR2_PACKAGE_PYTHON
 	select BR2_PACKAGE_DBUS_GLIB
@@ -9,5 +10,6 @@ config BR2_PACKAGE_DBUS_PYTHON
 
 	  http://dbus.freedesktop.org/doc/dbus-python/
 
-comment "dbus-python requires a toolchain with WCHAR support"
-	depends on BR2_PACKAGE_DBUS && BR2_PACKAGE_PYTHON && !BR2_USE_WCHAR
+comment "dbus-python requires a toolchain with WCHAR and threading support"
+	depends on BR2_PACKAGE_DBUS && BR2_PACKAGE_PYTHON && \
+		(!BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS)
diff --git a/package/docker/Config.in b/package/docker/Config.in
index f07739a..866ffcf 100644
--- a/package/docker/Config.in
+++ b/package/docker/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_DOCKER
 	bool "docker"
 	depends on BR2_PACKAGE_XORG7
 	depends on BR2_USE_WCHAR # glib2
+	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_XLIB_LIBX11
 	help
@@ -9,5 +10,6 @@ config BR2_PACKAGE_DOCKER
 
 	  http://icculus.org/openbox/2/docker
 
-comment "docker requires a toolchain with WCHAR support"
-	depends on BR2_PACKAGE_XORG7 && !BR2_USE_WCHAR
+comment "docker requires a toolchain with WCHAR and threading support"
+	depends on BR2_PACKAGE_XORG7 && \
+		(!BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS)
diff --git a/package/efl/libedbus/Config.in b/package/efl/libedbus/Config.in
index 64b001e..31a3b03 100644
--- a/package/efl/libedbus/Config.in
+++ b/package/efl/libedbus/Config.in
@@ -17,10 +17,15 @@ if BR2_PACKAGE_LIBEDBUS
 config BR2_PACKAGE_LIBEDBUS_BLUEZ
 	bool "bluez support"
 	depends on !BR2_avr32 # bluez_utils
+	depends on BR2_USE_WCHAR # bluez_utils -> glib2
+	depends on BR2_TOOLCHAIN_HAS_THREADS # bluez_utils -> glib2
 	select BR2_PACKAGE_BLUEZ_UTILS
 	help
 	  Bluetooth support.
 
+comment "bluez support requires a toolchain with WCHAR and threading support"
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
+
 config BR2_PACKAGE_LIBEDBUS_CONNMAN
 	bool "connman support"
 	depends on BR2_PACKAGE_CONNMAN
diff --git a/package/efl/libevas-generic-loaders/Config.in b/package/efl/libevas-generic-loaders/Config.in
index bfa6097..5363794 100644
--- a/package/efl/libevas-generic-loaders/Config.in
+++ b/package/efl/libevas-generic-loaders/Config.in
@@ -15,11 +15,12 @@ config BR2_PACKAGE_LIBEVAS_GENERIC_LOADERS_SVG
 	select BR2_PACKAGE_LIBRSVG
 	select BR2_PACKAGE_CAIRO
 	depends on BR2_USE_WCHAR # librsvg -> glib2
+	depends on BR2_TOOLCHAIN_HAS_THREADS # librsvg -> glib2
 	depends on BR2_INSTALL_LIBSTDCPP # librsvg -> pango
 	help
 	  This option enables the Evas generic SVG loader
 
-comment "SVG loader requires a toolchain with WCHAR and C++ support"
-	depends on !BR2_USE_WCHAR && !BR2_INSTALL_LIBSTDCPP
+comment "SVG loader requires a toolchain with WCHAR, threading and C++ support"
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP
 
 endif
diff --git a/package/enchant/Config.in b/package/enchant/Config.in
index 33f36db..783c73e 100644
--- a/package/enchant/Config.in
+++ b/package/enchant/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_ENCHANT
 	bool "enchant"
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_WCHAR # glib2
+	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
 	select BR2_PACKAGE_LIBGLIB2
 	help
 	  Enchant is a spell-checking library that provides a consistent
@@ -9,5 +10,6 @@ config BR2_PACKAGE_ENCHANT
 
 	  http://www.abisource.com/projects/enchant/
 
-comment "enchant requires a toolchain with C++ and WCHAR support enabled"
-	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR
+comment "enchant requires a toolchain with C++, threading and WCHAR support enabled"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
+		!BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/enlightenment/Config.in b/package/enlightenment/Config.in
index 357c72b..f86f271 100644
--- a/package/enlightenment/Config.in
+++ b/package/enlightenment/Config.in
@@ -21,6 +21,7 @@ config BR2_PACKAGE_ENLIGHTENMENT
 	depends on BR2_USE_WCHAR
 	depends on BR2_INSTALL_LIBSTDCPP
 	# libedbus -> dbus
+	# libedbus -> glib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	# libedbus -> dbus
 	depends on BR2_USE_MMU
diff --git a/package/gamin/Config.in b/package/gamin/Config.in
index 3ede2e4..369c10e 100644
--- a/package/gamin/Config.in
+++ b/package/gamin/Config.in
@@ -1,11 +1,12 @@
 config BR2_PACKAGE_GAMIN
 	bool "gamin"
 	depends on BR2_USE_WCHAR # glib2
+	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
 	select BR2_PACKAGE_LIBGLIB2
 	help
 	  the File Alteration Monitor
 
 	  http://www.gnome.org/~veillard/gamin/sources
 
-comment "gamin requires a toolchain with WCHAR support"
-	depends on !BR2_USE_WCHAR
+comment "gamin requires a toolchain with WCHAR and threading support"
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/gdk-pixbuf/Config.in b/package/gdk-pixbuf/Config.in
index 33b5f7c..05de934 100644
--- a/package/gdk-pixbuf/Config.in
+++ b/package/gdk-pixbuf/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_GDK_PIXBUF
 	bool "gdk-pixbuf"
 	depends on BR2_USE_WCHAR # glib2
+	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
@@ -9,3 +10,6 @@ config BR2_PACKAGE_GDK_PIXBUF
 	  and the GLib, to integrate well with GNOME applications.
 
 	  http://www.gtk.org/
+
+comment "gdk-pixbuf depends on toolchain with WCHAR and threading support"
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/glib-networking/Config.in b/package/glib-networking/Config.in
index dab35ea..8d106f5 100644
--- a/package/glib-networking/Config.in
+++ b/package/glib-networking/Config.in
@@ -1,10 +1,11 @@
 config BR2_PACKAGE_GLIB_NETWORKING
 	bool "glib-networking"
 	depends on BR2_USE_WCHAR # glib2
+	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT
 	help
 	  Network-related GIO modules for glib.
 
-comment "glib-networking requires a toolchain with WCHAR support"
-	depends on !BR2_USE_WCHAR
+comment "glib-networking requires a toolchain with WCHAR and threading support"
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/glibmm/Config.in b/package/glibmm/Config.in
index cd4ac01..fddd5e4 100644
--- a/package/glibmm/Config.in
+++ b/package/glibmm/Config.in
@@ -3,11 +3,13 @@ config BR2_PACKAGE_GLIBMM
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_LIBSIGC
 	depends on BR2_INSTALL_LIBSTDCPP
-	depends on BR2_USE_WCHAR
+	depends on BR2_USE_WCHAR # libglib2
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
 	help
 	  The GLibmm package is a set of C++ bindings for GLib.
 
 	  http://www.gtkmm.org/
 
-comment "glibmm requires a toolchain with C++ & WCHAR support enabled"
-	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR
+comment "glibmm requires a toolchain with C++, WCHAR, and threading support"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
+		!BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/gmpc/Config.in b/package/gmpc/Config.in
index 9b38d1a..96dc58f 100644
--- a/package/gmpc/Config.in
+++ b/package/gmpc/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_GMPC
 	bool "gmpc"
 	depends on BR2_PACKAGE_LIBGTK2
 	depends on BR2_USE_WCHAR # glib2
+	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
 	depends on BR2_PACKAGE_XORG7
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
@@ -19,5 +20,6 @@ config BR2_PACKAGE_GMPC
 
 	  http://gmpcwiki.sarine.nl/index.php?title=GMPC
 
-comment "gmpc requires a toolchain with WCHAR support"
-	depends on BR2_PACKAGE_LIBGTK2 && !BR2_USE_WCHAR
+comment "gmpc requires a toolchain with WCHAR and threading support"
+	depends on BR2_PACKAGE_LIBGTK2 && !BR2_USE_WCHAR || \
+		!BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/gob2/Config.in b/package/gob2/Config.in
index 4a09c41..d795335 100644
--- a/package/gob2/Config.in
+++ b/package/gob2/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_GOB2
 	bool "gob2"
 	depends on BR2_USE_WCHAR # glib2
+	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
 	# m4 uses fork(), so does bison then
 	depends on BR2_USE_MMU
 	select BR2_PACKAGE_LIBGLIB2
@@ -13,4 +14,4 @@ config BR2_PACKAGE_GOB2
 	  http://www.jirka.org/gob.html
 
 comment "gob2 requires a toolchain with WCHAR support"
-	depends on !BR2_USE_WCHAR
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/gvfs/Config.in b/package/gvfs/Config.in
index e0a945e..63c4996 100644
--- a/package/gvfs/Config.in
+++ b/package/gvfs/Config.in
@@ -3,7 +3,7 @@ config BR2_PACKAGE_GVFS
 	depends on BR2_LARGEFILE
 	depends on BR2_USE_WCHAR # glib2
 	depends on BR2_USE_MMU # dbus
-	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus
+	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus, glib2
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_DBUS
 	select BR2_PACKAGE_SHARED_MIME_INFO
@@ -16,5 +16,5 @@ config BR2_PACKAGE_GVFS
 
 	  http://en.wikipedia.org/wiki/GVFS
 
-comment "gvfs requires a toolchain with LARGEFILE and WCHAR support"
-	depends on !BR2_LARGEFILE || !BR2_USE_WCHAR
+comment "gvfs requires a toolchain with LARGEFILE, WCHAR and threading support"
+	depends on !BR2_LARGEFILE || !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/json-glib/Config.in b/package/json-glib/Config.in
index 3ebc76d..db25386 100644
--- a/package/json-glib/Config.in
+++ b/package/json-glib/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_JSON_GLIB
 	bool "json-glib"
 	depends on BR2_USE_WCHAR # glib2
+	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT
 	help
@@ -10,5 +11,5 @@ config BR2_PACKAGE_JSON_GLIB
 
 	  https://live.gnome.org/JsonGlib/
 
-comment "json-glib requires a toolchain with WCHAR support"
-	depends on !BR2_USE_WCHAR
+comment "json-glib requires a toolchain with WCHAR and threading support"
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/latencytop/Config.in b/package/latencytop/Config.in
index 12176c0..23e4c63 100644
--- a/package/latencytop/Config.in
+++ b/package/latencytop/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_LATENCYTOP
 	bool "latencytop"
-	depends on BR2_USE_WCHAR
+	depends on BR2_USE_WCHAR # libglib2
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
 	select BR2_PACKAGE_NCURSES
 	select BR2_PACKAGE_LIBGLIB2
 	help
@@ -19,5 +20,5 @@ config BR2_PACKAGE_LATENCYTOP
 
 	  http://www.latencytop.org
 
-comment "latencytop requires a toolchain with WCHAR support"
-	depends on !BR2_USE_WCHAR
+comment "latencytop requires a toolchain with WCHAR and threading support"
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/libgail/Config.in b/package/libgail/Config.in
index ba74795..3e1af62 100644
--- a/package/libgail/Config.in
+++ b/package/libgail/Config.in
@@ -1,5 +1,7 @@
 config BR2_PACKAGE_LIBGAIL
 	bool "libgail"
+	depends on BR2_USE_WCHAR # pango -> libglib2
+	depends on BR2_TOOLCHAIN_HAS_THREADS # pango -> libglib2
 	depends on BR2_PACKAGE_LIBGTK2
 	select BR2_PACKAGE_PANGO
 	help
@@ -16,3 +18,7 @@ config BR2_PACKAGE_LIBGAIL
 	  program.
 
 	  http://developer.gnome.org/projects/gap
+
+comment "libgail requires a toolchain with WCHAR and threading support"
+	depends on BR2_PACKAGE_LIBGTK2 && \
+		(!BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS)
diff --git a/package/libglade/Config.in b/package/libglade/Config.in
index f7a9a1c..d042517 100644
--- a/package/libglade/Config.in
+++ b/package/libglade/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_LIBGLADE
 	bool "libglade"
 	depends on BR2_PACKAGE_LIBGTK2
 	depends on BR2_USE_WCHAR # glib2
+	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_ATK
 	select BR2_PACKAGE_LIBXML2
@@ -12,5 +13,6 @@ config BR2_PACKAGE_LIBGLADE
 
 	  http://ftp.gnome.org/pub/GNOME/sources/libglade/
 
-comment "libglade requires a toolchain with WCHAR support"
-	depends on BR2_PACKAGE_LIBGTK2 && !BR2_USE_WCHAR
+comment "libglade requires a toolchain with WCHAR and threading support"
+	depends on BR2_PACKAGE_LIBGTK2 && \
+		(!BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS)
diff --git a/package/libglib2/Config.in b/package/libglib2/Config.in
index 5282885..806dbbe 100644
--- a/package/libglib2/Config.in
+++ b/package/libglib2/Config.in
@@ -5,10 +5,11 @@ config BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_LIBFFI
 	select BR2_PACKAGE_ZLIB
 	depends on BR2_USE_WCHAR # gettext
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	help
 	  Low-level core library that forms the basis of GTK+ and GNOME.
 
 	  http://www.gtk.org/
 
-comment "libglib2 requires a toolchain with WCHAR support"
-	depends on !BR2_USE_WCHAR
+comment "libglib2 requires a toolchain with WCHAR support and threading support"
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/libglib2/libglib2-0002-fix-build-when-no-thread-support.patch b/package/libglib2/libglib2-0002-fix-build-when-no-thread-support.patch
deleted file mode 100644
index 43c7e16..0000000
--- a/package/libglib2/libglib2-0002-fix-build-when-no-thread-support.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-Fix gio/gcancellable.c build when thread support is disabled
-
-Changes:
-	Updated for 2.36.1
-
-Signed-off-by: "Samuel Martin" <s.martin49@gmail.com>
-Signed-off-by: "Spenser Gilliland" <spenser@gillilanding.com>
----
---- libglib2-2.36.1.orig/gio/gcancellable.c	2013-03-13 08:39:09.000000000 -0500
-+++ libglib2-2.36.1/gio/gcancellable.c	2013-05-26 10:49:32.366019891 -0500
-@@ -267,7 +267,9 @@
-   while (priv->cancelled_running)
-     {
-       priv->cancelled_running_waiting = TRUE;
-+#if defined(G_THREADS_ENABLED)
-       g_cond_wait (&cancellable_cond, &cancellable_mutex);
-+#endif
-     }
- 
-   if (priv->cancelled)
-@@ -620,7 +622,9 @@
-   while (priv->cancelled_running)
-     {
-       priv->cancelled_running_waiting = TRUE;
-+#if defined(G_THREADS_ENABLED)
-       g_cond_wait (&cancellable_cond, &cancellable_mutex);
-+#endif
-     }
- 
-   g_signal_handler_disconnect (cancellable, handler_id);
diff --git a/package/libgtk2/Config.in b/package/libgtk2/Config.in
index 462b0b6..c280c6a 100644
--- a/package/libgtk2/Config.in
+++ b/package/libgtk2/Config.in
@@ -14,18 +14,23 @@ config BR2_PACKAGE_LIBGTK2
 	select BR2_PACKAGE_XLIB_LIBXRENDER
 	depends on BR2_PACKAGE_XORG7
 	depends on BR2_USE_WCHAR # glib2
+	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
 	depends on BR2_INSTALL_LIBSTDCPP # pango
 	help
 	  The GTK+ version 2 graphical user interface library
 
 	  http://www.gtk.org/
 
+if BR2_PACKAGE_LIBGTK2
+
 config BR2_PACKAGE_LIBGTK2_DEMO
 	bool "Install libgtk2 demo program"
-	depends on BR2_PACKAGE_LIBGTK2
 	help
 	  The GTK+ source base contains a gtk-demo program. This
 	  option allows to install this program to the target.
 
-comment "libgtk2 requires a toolchain with WCHAR and C++ support"
-	depends on !BR2_USE_WCHAR || !BR2_INSTALL_LIBSTDCPP
+endif
+
+comment "libgtk2 requires a toolchain with WCHAR, threading and C++ support"
+	depends on !BR2_USE_WCHAR || !BR2_INSTALL_LIBSTDCPP || \
+		!BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/libmms/Config.in b/package/libmms/Config.in
index 17cb406..3cabbc7 100644
--- a/package/libmms/Config.in
+++ b/package/libmms/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_LIBMMS
 	bool "libmms"
 	depends on BR2_USE_WCHAR # glib2
+	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
 	select BR2_PACKAGE_LIBGLIB2
 	help
           LibMMS is a common library for parsing mms:// and mmsh://
@@ -11,5 +12,5 @@ config BR2_PACKAGE_LIBMMS
 
 	  http://launchpad.net/libmms
 
-comment "libmms requires a toolchain with WCHAR support"
-	depends on !BR2_USE_WCHAR
+comment "libmms requires a toolchain with WCHAR and threading support"
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/libmpd/Config.in b/package/libmpd/Config.in
index 9259c19..7617e88 100644
--- a/package/libmpd/Config.in
+++ b/package/libmpd/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_LIBMPD
 	bool "libmpd"
 	depends on BR2_USE_WCHAR # glib2
+	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 	help
@@ -10,5 +11,5 @@ config BR2_PACKAGE_LIBMPD
 
 	  http://gmpcwiki.sarine.nl/index.php?title=Libmpd
 
-comment "libmpd requires a toolchain with WCHAR support"
-	depends on !BR2_USE_WCHAR
+comment "libmpd requires a toolchain with WCHAR and threading support"
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/libplayer/Config.in b/package/libplayer/Config.in
index df32901..c7de7ba 100644
--- a/package/libplayer/Config.in
+++ b/package/libplayer/Config.in
@@ -21,10 +21,11 @@ config BR2_PACKAGE_LIBPLAYER_MPLAYER
 config BR2_PACKAGE_LIBPLAYER_GSTREAMER
 	bool "gstreamer backend"
 	depends on BR2_USE_WCHAR # glib2
+	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
 	select BR2_PACKAGE_GSTREAMER
 
-comment "gstreamer backend requires a toolchain with WCHAR support"
-	depends on !BR2_USE_WCHAR
+comment "gstreamer backend requires a toolchain with WCHAR and threading support"
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
 
 config BR2_PACKAGE_LIBPLAYER_PYTHON
 	depends on BR2_PACKAGE_PYTHON
diff --git a/package/libqmi/Config.in b/package/libqmi/Config.in
index c5e8a5c..8484250 100644
--- a/package/libqmi/Config.in
+++ b/package/libqmi/Config.in
@@ -2,8 +2,12 @@ config BR2_PACKAGE_LIBQMI
 	bool "libqmi"
 	select BR2_PACKAGE_LIBGLIB2
 	depends on BR2_USE_WCHAR # libglib2
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
 	help
 	  libqmi is a glib-based library for talking to WWAN modems and devices
 	  which speak the Qualcomm MSM Interface (QMI) protocol.
 
 	  http://www.freedesktop.org/wiki/Software/libqmi/
+
+comment "libqmi requires a toolchain with WCHAR and threading support"
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/librsvg/Config.in b/package/librsvg/Config.in
index b2ef6ad..ce711f7 100644
--- a/package/librsvg/Config.in
+++ b/package/librsvg/Config.in
@@ -7,6 +7,7 @@ config BR2_PACKAGE_LIBRSVG
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_GDK_PIXBUF
 	depends on BR2_USE_WCHAR # glib2
+	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
 	depends on BR2_INSTALL_LIBSTDCPP # pango
 	help
 	  The rsvg library is an efficient renderer for Scalable
@@ -14,5 +15,5 @@ config BR2_PACKAGE_LIBRSVG
 
 	  http://librsvg.sourceforge.net/
 
-comment "librsvg requires a toolchain with WCHAR and C++ support"
-	depends on !BR2_USE_WCHAR || !BR2_INSTALL_LIBSTDCPP
+comment "librsvg requires a toolchain with WCHAR, threading and C++ support"
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP
diff --git a/package/libsoup/Config.in b/package/libsoup/Config.in
index 2ed08d9..b80cb63 100644
--- a/package/libsoup/Config.in
+++ b/package/libsoup/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_LIBSOUP
 	bool "libsoup"
 	depends on BR2_USE_WCHAR # glib2 and gnutls
+	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
 	select BR2_PACKAGE_LIBXML2
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT
@@ -12,13 +13,16 @@ config BR2_PACKAGE_LIBSOUP
 
 	  http://live.gnome.org/LibSoup
 
+if BR2_PACKAGE_LIBSOUP
+
 config BR2_PACKAGE_LIBSOUP_SSL
 	bool "https support"
 	select BR2_PACKAGE_GLIB_NETWORKING
 	select BR2_PACKAGE_GNUTLS
-	depends on BR2_PACKAGE_LIBSOUP
 	help
 	  Enable HTTPS (SSL) support.
 
-comment "libsoup requires a toolchain with WCHAR support"
-	depends on !BR2_USE_WCHAR
+endif
+
+comment "libsoup requires a toolchain with WCHAR and threading support"
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/libxmlpp/Config.in b/package/libxmlpp/Config.in
index cf29c2c..2448bfd 100644
--- a/package/libxmlpp/Config.in
+++ b/package/libxmlpp/Config.in
@@ -3,11 +3,13 @@ config BR2_PACKAGE_LIBXMLPP
 	select BR2_PACKAGE_LIBXML2
 	select BR2_PACKAGE_GLIBMM
 	depends on BR2_INSTALL_LIBSTDCPP
-	depends on BR2_USE_WCHAR
+	depends on BR2_USE_WCHAR # glibmm -> libglib2
+	depends on BR2_TOOLCHAIN_HAS_THREADS # glibmm -> libglib2
 	help
 	  libxml++ is a C++ wrapper for the libxml XML parser library.
 
 	  http://libxmlplusplus.sourceforge.net/
 
-comment "libxml++ requires a toolchain with C++ & WCHAR support enabled"
-	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR
+comment "libxml++ requires a toolchain with C++, WCHAR and threading support"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
+	!BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/lttng-babeltrace/Config.in b/package/lttng-babeltrace/Config.in
index 6f47304..4f14477 100644
--- a/package/lttng-babeltrace/Config.in
+++ b/package/lttng-babeltrace/Config.in
@@ -4,9 +4,10 @@ config BR2_PACKAGE_LTTNG_BABELTRACE
 	select BR2_PACKAGE_UTIL_LINUX
 	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
 	select BR2_PACKAGE_LIBGLIB2
-	# libglib2 needs gettext which needs wchar support, and we
-	# also depends on util-linux which needs wchar
+	# libglib2 needs thread support and gettext which needs wchar support, and 
+	# we also depends on util-linux which needs wchar
 	depends on BR2_USE_WCHAR
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	# util-linux depends on largefile support
 	depends on BR2_LARGEFILE
 	help
@@ -26,5 +27,6 @@ config BR2_PACKAGE_LTTNG_BABELTRACE
 
 	  http://lttng.org
 
-comment "lttng-babeltrace needs WCHAR and LARGEFILE support"
-	depends on BR2_PACKAGE_LTTNG_TOOLS && !(BR2_USE_WCHAR || BR2_LARGEFILE)
+comment "lttng-babeltrace needs WCHAR, threading and LARGEFILE support"
+	depends on BR2_PACKAGE_LTTNG_TOOLS && \
+		(!BR2_USE_WCHAR || !BR2_LARGEFILE || !BR2_TOOLCHAIN_HAS_THREADS)
diff --git a/package/midori/Config.in b/package/midori/Config.in
index 41f4515..d358740 100644
--- a/package/midori/Config.in
+++ b/package/midori/Config.in
@@ -6,11 +6,13 @@ config BR2_PACKAGE_MIDORI
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 	depends on BR2_PACKAGE_LIBGTK2
 	depends on BR2_INSTALL_LIBSTDCPP # webkit
+	depends on BR2_TOOLCHAIN_HAS_THREADS # webkit -> enchant -> libglib2
 	depends on BR2_USE_WCHAR	 # webkit
 	help
 	  Midori is a lightweight web browser based on WebKit
 
 	  http://software.twotoasts.de/?page=midori
 
-comment "midori requires C++, WCHAR in toolchain and libgtk2"
-        depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || !BR2_PACKAGE_LIBGTK2
+comment "midori requires C++, WCHAR, threading in toolchain and libgtk2"
+        depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
+		!BR2_TOOLCHAIN_HAS_THREADS || !BR2_PACKAGE_LIBGTK2
diff --git a/package/multimedia/gst-plugin-x170/Config.in b/package/multimedia/gst-plugin-x170/Config.in
index 9a1ae63..142367b 100644
--- a/package/multimedia/gst-plugin-x170/Config.in
+++ b/package/multimedia/gst-plugin-x170/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_GST_PLUGIN_X170
 	bool "gst-plugin-x170"
 	depends on BR2_PACKAGE_GSTREAMER
 	depends on BR2_arm926t
+	# glibc toolchain includes WCHAR and threading for libglib2
 	depends on BR2_TOOLCHAIN_USES_GLIBC # on2-8170-libs
 	select BR2_PACKAGE_ON2_8170_LIBS
 	help
@@ -9,3 +10,6 @@ config BR2_PACKAGE_GST_PLUGIN_X170
 	  ATMEL AT91SAM9M10 SoC.
 
 	  http://www.at91.com/linux4sam/bin/view/Linux4SAM/SAM9M10Gstreamer
+
+comment "gst-plugin-x170 requires a toolchain which uses eglibc/glibc"
+	depends on BR2_PACKAGE_GSTREAMER && BR2_arm926t && !BR2_TOOLCHAIN_USES_GLIBC
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
diff --git a/package/multimedia/gst-plugins-base/Config.in b/package/multimedia/gst-plugins-base/Config.in
index af4fe8c..7370bd6 100644
--- a/package/multimedia/gst-plugins-base/Config.in
+++ b/package/multimedia/gst-plugins-base/Config.in
@@ -86,10 +86,13 @@ config BR2_PACKAGE_GST_PLUGINS_BASE_PLUGIN_OGG
 config BR2_PACKAGE_GST_PLUGINS_BASE_PLUGIN_PANGO
 	bool "pango font renderer"
 	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_USE_WCHAR # pango -> libglib2
+	depends on BR2_TOOLCHAIN_HAS_THREADS # pango -> libglib2
 	select BR2_PACKAGE_PANGO
 
-comment "pango plugin requires a toolchain with C++ support"
-	depends on !BR2_INSTALL_LIBSTDCPP
+comment "pango plugin requires a toolchain with C++, WCHAR and threading support "
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
+		!BR2_TOOLCHAIN_HAS_THREADS
 
 config BR2_PACKAGE_GST_PLUGINS_BASE_PLUGIN_THEORA
 	bool "theora (*.ogg video)"
diff --git a/package/multimedia/gst-plugins-good/Config.in b/package/multimedia/gst-plugins-good/Config.in
index 978aa0b..c604a41 100644
--- a/package/multimedia/gst-plugins-good/Config.in
+++ b/package/multimedia/gst-plugins-good/Config.in
@@ -188,8 +188,13 @@ config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_FLAC
 
 config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_GDKPIXBUF
 	bool "gdkpixbuf"
+	depends on BR2_USE_WCHAR # gdk-pixbuf -> libglib2
+	depends on BR2_TOOLCHAIN_HAS_THREADS # gdk-pixbuf -> libglib2
 	select BR2_PACKAGE_GDK_PIXBUF
 
+comment "gdkpixbuf requires a toolchain with WCHAR and threading support"
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
+
 config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_OSS
 	bool "ossaudio (OSS audio)"
 
@@ -204,8 +209,13 @@ config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_PULSE
 
 config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_SOUPHTTPSRC
 	bool "souphttpsrc (http client)"
+	depends on BR2_USE_WCHAR # libsoup -> glib2
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libsoup -> glib2
 	select BR2_PACKAGE_LIBSOUP
 
+comment "souphttpsrc requires a toolchain with WCHAR and threading support"
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREAD
+
 config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_SPEEX
 	bool "speex"
 	select BR2_PACKAGE_SPEEX
diff --git a/package/multimedia/gst1-plugins-bad/Config.in b/package/multimedia/gst1-plugins-bad/Config.in
index 98550e0..878bf53 100644
--- a/package/multimedia/gst1-plugins-bad/Config.in
+++ b/package/multimedia/gst1-plugins-bad/Config.in
@@ -372,10 +372,15 @@ config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_FBDEV
 
 config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_LIBMMS
 	bool "libmms"
+	depends on BR2_USE_WCHAR # libmms -> libglib2
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libmms -> libglib2
 	select BR2_PACKAGE_LIBMMS
 	help
 	  Microsoft Multi Media Server streaming protocol support
 
+comment "libmms requires a toolchain with WCHAR and threading support"
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREAD
+
 config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_MPEG2ENC
 	bool "mpeg2enc"
 	select BR2_PACKAGE_LIBMPEG2
@@ -417,12 +422,15 @@ config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_OPUS
 config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_RSVG
 	bool "rsvg"
 	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_USE_WCHAR # librsvg -> glib2
+	depends on BR2_TOOLCHAIN_HAS_THREADS # librsvg -> glib2
 	select BR2_PACKAGE_LIBRSVG
 	help
 	  RSVG plugin library
 
-comment "rsvg plugin requires a toolchain with C++ support"
-	depends on !BR2_INSTALL_LIBSTDCPP
+comment "rsvg plugin requires a toolchain with C++, WCHAR and threading support"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
+		!BR2_TOOLCHAIN_HAS_THREADS
 
 config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_EGLGLES
 	bool "eglgles"
diff --git a/package/multimedia/gst1-plugins-base/Config.in b/package/multimedia/gst1-plugins-base/Config.in
index 10561c1..e02d23a 100644
--- a/package/multimedia/gst1-plugins-base/Config.in
+++ b/package/multimedia/gst1-plugins-base/Config.in
@@ -130,12 +130,15 @@ config BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_OGG
 config BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_PANGO
 	bool "pango font renderer"
 	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_USE_WCHAR # pango -> libglib2
+	depends on BR2_TOOLCHAIN_HAS_THREADS # pango -> libglib2
 	select BR2_PACKAGE_PANGO
 	help
 	  Pango-based text rendering and overlay
 
-comment "pango plugin requires a toolchain with C++ support"
-	depends on !BR2_INSTALL_LIBSTDCPP
+comment "pango plugin requires a toolchain with C++, WCHAR and threading support"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
+		!BR2_TOOLCHAIN_HAS_THREADS
 
 config BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_THEORA
 	bool "theora (*.ogg video)"
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
diff --git a/package/multimedia/gstreamer/Config.in b/package/multimedia/gstreamer/Config.in
index d2f99da..5188b8f 100644
--- a/package/multimedia/gstreamer/Config.in
+++ b/package/multimedia/gstreamer/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_GSTREAMER
 	bool "gstreamer"
 	depends on BR2_USE_WCHAR # glib2
-	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
 	select BR2_PACKAGE_LIBGLIB2
 	help
 	  GStreamer is an open source multimedia framework.
diff --git a/package/multimedia/gstreamer1/Config.in b/package/multimedia/gstreamer1/Config.in
index 627814c..69a87f3 100644
--- a/package/multimedia/gstreamer1/Config.in
+++ b/package/multimedia/gstreamer1/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_GSTREAMER1
 	bool "gstreamer1"
 	depends on BR2_USE_WCHAR # glib2
-	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
 	select BR2_PACKAGE_LIBGLIB2
 	help
 	  GStreamer is an open source multimedia framework. This 1.x version of
@@ -49,5 +49,5 @@ config BR2_PACKAGE_GSTREAMER1_INSTALL_TOOLS
 
 endif
 
-comment "gstreamer1 requires a toolchain with WCHAR and threads support"
+comment "gstreamer1 requires a toolchain with WCHAR and threading support"
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/multimedia/mpd/Config.in b/package/multimedia/mpd/Config.in
index 6e5c690..2ca55cc 100644
--- a/package/multimedia/mpd/Config.in
+++ b/package/multimedia/mpd/Config.in
@@ -1,7 +1,8 @@
 menuconfig BR2_PACKAGE_MPD
 	bool "mpd"
 	depends on BR2_INSTALL_LIBSTDCPP
-	depends on BR2_USE_WCHAR
+	depends on BR2_USE_WCHAR # libglib2
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 	select BR2_PACKAGE_MPD_TREMOR if !(BR2_PACKAGE_MPD_MAD || BR2_PACKAGE_MPD_MPG123 || BR2_PACKAGE_MPD_VORBIS || BR2_PACKAGE_MPD_WAVPACK || BR2_PACKAGE_MPD_FLAC || BR2_PACKAGE_MPD_MUSEPACK || BR2_PACKAGE_MPD_FFMPEG)
@@ -181,5 +182,6 @@ config BR2_PACKAGE_MPD_WAVPACK
 
 endif
 
-comment "mpd requires a toolchain with C++ and WCHAR support"
-	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR
+comment "mpd requires a toolchain with C++, threading and WCHAR support"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
+		!BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/nbd/Config.in b/package/nbd/Config.in
index 79b34de..0a0c7bd 100644
--- a/package/nbd/Config.in
+++ b/package/nbd/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_NBD
 	bool "nbd"
 	depends on BR2_USE_WCHAR # glib2
+	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
 	select BR2_PACKAGE_LIBGLIB2
 	help
 	  NBD is a set of utilities to configure network block devices,
@@ -8,9 +9,6 @@ config BR2_PACKAGE_NBD
 
 	  http://nbd.sf.net/
 
-comment "nbd requires a toolchain with WCHAR support"
-	depends on !BR2_USE_WCHAR
-
 if BR2_PACKAGE_NBD
 
 config BR2_NBD_CLIENT
@@ -25,3 +23,6 @@ config BR2_NBD_SERVER
 	  the server part of NBD.
 
 endif
+
+comment "nbd requires a toolchain with WCHAR and threading support"
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/neard/Config.in b/package/neard/Config.in
index ec1fcb3..97966da 100644
--- a/package/neard/Config.in
+++ b/package/neard/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_NEARD
 	bool "neard"
 	depends on BR2_USE_WCHAR # libglib2
-	depends on BR2_TOOLCHAIN_HAS_THREADS # libnl / dbus
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libnl, dbus, libglib2
 	depends on BR2_USE_MMU # dbus
 	select BR2_PACKAGE_DBUS
 	select BR2_PACKAGE_LIBGLIB2
@@ -14,11 +14,14 @@ config BR2_PACKAGE_NEARD
 
 	  https://01.org/linux-nfc/documentation/how-start-linux-nfc-code...
 
+if BR2_PACKAGE_NEARD
+
 config BR2_PACKAGE_NEARD_TOOLS
 	bool "neard tools"
-	depends on BR2_PACKAGE_NEARD
 	help
 	  Build and install neard tools.
 
+endif
+
 comment "neard requires a toolchain with WCHAR and threads support"
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/neardal/Config.in b/package/neardal/Config.in
index 76b5ffa..3841cac 100644
--- a/package/neardal/Config.in
+++ b/package/neardal/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_NEARDAL
 	bool "neardal"
 	depends on BR2_USE_WCHAR # glib2
-	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus
+	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus, glib2
 	depends on BR2_USE_MMU # dbus
 	select BR2_PACKAGE_DBUS
 	select BR2_PACKAGE_DBUS_GLIB
@@ -11,11 +11,14 @@ config BR2_PACKAGE_NEARDAL
 
 	  https://github.com/connectivity/neardal
 
+if BR2_PACKAGE_NEARDAL
+
 config BR2_PACKAGE_NEARDAL_NCL
 	bool "ncl tool"
-	depends on BR2_PACKAGE_NEARDAL
 	help
 	  Build and install neardal ncl command line interpreter tool.
 
-comment "neardal requires a toolchain with WCHAR and threads support"
+endif
+
+comment "neardal requires a toolchain with WCHAR and threading support"
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/network-manager/Config.in b/package/network-manager/Config.in
index cc33a1d..50a3e74 100644
--- a/package/network-manager/Config.in
+++ b/package/network-manager/Config.in
@@ -5,7 +5,7 @@ config BR2_PACKAGE_NETWORK_MANAGER
 	depends on BR2_INET_IPV6
 	depends on BR2_LARGEFILE # acl
 	depends on BR2_USE_WCHAR # libglib2 and gnutls
-	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus
+	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus, libglib2
 	depends on BR2_USE_MMU # dbus
 	select BR2_PACKAGE_DBUS_GLIB
 	select BR2_PACKAGE_UDEV
diff --git a/package/ofono/Config.in b/package/ofono/Config.in
index 6248544..5d82170 100644
--- a/package/ofono/Config.in
+++ b/package/ofono/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_OFONO
 	bool "ofono"
-	depends on BR2_USE_WCHAR # gettext/libglib2
-	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus
+	depends on BR2_USE_WCHAR # gettext, libglib2
+	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus, libglib2
 	depends on BR2_USE_MMU # dbus
 	select BR2_PACKAGE_LIBCAP_NG
 	select BR2_PACKAGE_DBUS
@@ -15,5 +15,4 @@ config BR2_PACKAGE_OFONO
 	  http://ofono.org/
 
 comment "ofono requires a toolchain with WCHAR and thread support"
-	depends on !BR2_USE_WCHAR || \
-		!BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/opencv/Config.in b/package/opencv/Config.in
index 26bf5e7..c6ec3fe 100644
--- a/package/opencv/Config.in
+++ b/package/opencv/Config.in
@@ -139,16 +139,20 @@ comment "ffmpeg support requires a toolchain with LARGEFILE and IPV6 support"
 
 config BR2_PACKAGE_OPENCV_WITH_GSTREAMER
 	bool "gstreamer support"
-	depends on BR2_USE_WCHAR
-	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_USE_WCHAR # gstreamer -> libglib2
+	depends on BR2_TOOLCHAIN_HAS_THREADS # gstreamer -> libglib2
 	select BR2_PACKAGE_GSTREAMER
 	select BR2_PACKAGE_GST_PLUGINS_BASE
 	select BR2_PACKAGE_GST_PLUGINS_BASE_PLUGIN_APP
 
+comment "gstreamer support requires a toolchain with WCHAR and threading support"
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
+
 config BR2_PACKAGE_OPENCV_WITH_GTK
 	bool "gtk support"
 	depends on BR2_PACKAGE_XORG7||BR2_PACKAGE_DIRECTFB
-	depends on BR2_USE_WCHAR
+	depends on BR2_USE_WCHAR # libgtk2 -> libglib2
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libgtk2 -> libglib2
 	depends on BR2_INSTALL_LIBSTDCPP
 	select BR2_PACKAGE_LIBGTK2
 
diff --git a/package/openobex/Config.in b/package/openobex/Config.in
index 6494b29..c8e1f65 100644
--- a/package/openobex/Config.in
+++ b/package/openobex/Config.in
@@ -1,6 +1,3 @@
-comment "openobex requires a toolchain with IPV6 support"
-	depends on !BR2_INET_IPV6
-
 config BR2_PACKAGE_OPENOBEX
 	bool "openobex"
 	depends on BR2_INET_IPV6
@@ -12,25 +9,25 @@ config BR2_PACKAGE_OPENOBEX
 
 if BR2_PACKAGE_OPENOBEX
 
-comment "bluez support require a toolchain with WCHAR and thread support"
-	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
-
 config BR2_PACKAGE_OPENOBEX_BLUEZ
 	bool "enable bluez support"
 	depends on !BR2_avr32
 	depends on BR2_USE_WCHAR # libglib2
-	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus, alsa-lib
+	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus, alsa-lib, libglib2
 	depends on BR2_USE_MMU # dbus
 	select BR2_PACKAGE_BLUEZ_UTILS
 
-comment "libusb support require a toolchain with thread support"
-	depends on !BR2_TOOLCHAIN_HAS_THREADS
+comment "bluez support require a toolchain with WCHAR and thread support"
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
 
 config BR2_PACKAGE_OPENOBEX_LIBUSB
 	bool "enable libusb support"
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_PACKAGE_LIBUSB
 
+comment "libusb support require a toolchain with thread support"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
+
 config BR2_PACKAGE_OPENOBEX_APPS
 	bool "install test applications"
 	help
@@ -43,3 +40,6 @@ config BR2_PACKAGE_OPENOBEX_DUMP
 	bool "enable protocol dumping for debugging"
 
 endif
+
+comment "openobex requires a toolchain with IPV6 support"
+	depends on !BR2_INET_IPV6
diff --git a/package/pango/Config.in b/package/pango/Config.in
index 6c8a160..845ea98 100644
--- a/package/pango/Config.in
+++ b/package/pango/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_PANGO
 	bool "pango"
 	depends on BR2_USE_WCHAR # glib2
+	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
 	depends on BR2_INSTALL_LIBSTDCPP # freetype support
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_EXPAT
@@ -18,5 +19,6 @@ config BR2_PACKAGE_PANGO
 
 	  http://www.pango.org/
 
-comment "pango requires a toolchain with WCHAR and C++ support"
-	depends on !BR2_USE_WCHAR || !BR2_INSTALL_LIBSTDCPP
+comment "pango requires a toolchain with WCHAR, threading and C++ support"
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
+		!BR2_INSTALL_LIBSTDCPP
diff --git a/package/pcmanfm/Config.in b/package/pcmanfm/Config.in
index 484192b..5c80c10 100644
--- a/package/pcmanfm/Config.in
+++ b/package/pcmanfm/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_PCMANFM
 	bool "pcmanfm"
 	depends on BR2_PACKAGE_XORG7
 	depends on BR2_USE_WCHAR # glib2
+	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
 	select BR2_PACKAGE_GAMIN
 	select BR2_PACKAGE_STARTUP_NOTIFICATION
 	select BR2_PACKAGE_XLIB_LIBX11
@@ -12,5 +13,6 @@ config BR2_PACKAGE_PCMANFM
 
 	  http://internap.dl.sourceforge.net/sourceforge/pcmanfm
 
-comment "pcmanfm requires a toolchain with WCHAR support"
-	depends on BR2_PACKAGE_XORG7 && !BR2_USE_WCHAR
+comment "pcmanfm requires a toolchain with WCHAR and threading support"
+	depends on BR2_PACKAGE_XORG7 && \
+	(!BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS)
diff --git a/package/pkg-config/Config.in b/package/pkg-config/Config.in
index 7f96d9b..bf702d0 100644
--- a/package/pkg-config/Config.in
+++ b/package/pkg-config/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_PKG_CONFIG
 	bool "pkg-config"
 	depends on BR2_USE_WCHAR # glib2
+	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
 	depends on BR2_DEPRECATED
 	select BR2_PACKAGE_LIBGLIB2
 	help
@@ -11,5 +12,5 @@ config BR2_PACKAGE_PKG_CONFIG
 
 	  http://www.freedesktop.org/software/pkgconfig/
 
-comment "pkg-config requires a toolchain with WCHAR support"
-	depends on BR2_DEPRECATED && !BR2_USE_WCHAR
+comment "pkg-config requires a toolchain with WCHAR and threading support"
+	depends on BR2_DEPRECATED && (!BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS)
diff --git a/package/polkit/Config.in b/package/polkit/Config.in
index b47022a..df6c767 100644
--- a/package/polkit/Config.in
+++ b/package/polkit/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_POLKIT
 	bool "polkit"
 	depends on BR2_USE_WCHAR # libglib2
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_EXPAT
 	help
@@ -10,5 +11,5 @@ config BR2_PACKAGE_POLKIT
 
 	  http://www.freedesktop.org/wiki/Software/polkit
 
-comment "polkit requires a toolchain with WCHAR support"
-	depends on !BR2_USE_WCHAR
+comment "polkit requires a toolchain with WCHAR and threading support"
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/sconeserver/Config.in b/package/sconeserver/Config.in
index 60ae2ae..e9b51c0 100644
--- a/package/sconeserver/Config.in
+++ b/package/sconeserver/Config.in
@@ -42,7 +42,7 @@ config BR2_PACKAGE_SCONESERVER_BLUETOOTH
 	bool "bluetooth"
 	depends on BR2_USE_WCHAR # bluez->libglib2
 	depends on BR2_USE_MMU # bluez->dbus
-	depends on BR2_TOOLCHAIN_HAS_THREADS # bluez->dbus
+	depends on BR2_TOOLCHAIN_HAS_THREADS # bluez->dbus, bluez->libglib2
 	depends on !BR2_avr32 # bluez_utils
 	select BR2_PACKAGE_BLUEZ_UTILS
 	help
diff --git a/package/shared-mime-info/Config.in b/package/shared-mime-info/Config.in
index b08c1fd..ee635ac 100644
--- a/package/shared-mime-info/Config.in
+++ b/package/shared-mime-info/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_SHARED_MIME_INFO
 	bool "shared-mime-info"
 	depends on BR2_USE_WCHAR # glib2
+	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_LIBXML2
 	help
@@ -10,5 +11,5 @@ config BR2_PACKAGE_SHARED_MIME_INFO
 
 	  http://freedesktop.org/wiki/Software/shared-mime-info
 
-comment "shared-mime-info requires a toolchain with WCHAR support"
-	depends on !BR2_USE_WCHAR
+comment "shared-mime-info requires a toolchain with WCHAR and threading support"
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/snowball-init/Config.in b/package/snowball-init/Config.in
index 99abb35..71b60e6 100644
--- a/package/snowball-init/Config.in
+++ b/package/snowball-init/Config.in
@@ -4,7 +4,7 @@ config BR2_PACKAGE_SNOWBALL_INIT
 	select BR2_PACKAGE_BLUEZ_UTILS
 	depends on !BR2_avr32
 	depends on BR2_USE_WCHAR # libglib2
-	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus, alsa-lib
+	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus, alsa-lib, libglib2
 	depends on BR2_USE_MMU # dbus
 	select BR2_PACKAGE_UX500_FIRMWARE
 	help
@@ -12,3 +12,6 @@ config BR2_PACKAGE_SNOWBALL_INIT
 
 	  http://www.igloocommunity.org
 
+comment "snowball-init requires a toolchain with WCHAR and threading support"
+	depends on !BR2_avr32 && \
+		(!BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS)
diff --git a/package/sshfs/Config.in b/package/sshfs/Config.in
index b6d5aa6..3e7ed15 100644
--- a/package/sshfs/Config.in
+++ b/package/sshfs/Config.in
@@ -7,7 +7,7 @@ config BR2_PACKAGE_SSHFS
 	select BR2_PACKAGE_OPENSSH
 	depends on BR2_LARGEFILE
 	depends on BR2_USE_WCHAR # glib2
-	depends on BR2_TOOLCHAIN_HAS_THREADS # libfuse
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libfuse, glib2
 	depends on BR2_USE_MMU # libfuse
 	depends on !BR2_PREFER_STATIC_LIB # libfuse
 	help
diff --git a/package/sysprof/Config.in b/package/sysprof/Config.in
index 513a32c..d78062a 100644
--- a/package/sysprof/Config.in
+++ b/package/sysprof/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_SYSPROF
 	bool "sysprof"
 	select BR2_PACKAGE_LIBGLIB2
 	depends on BR2_USE_WCHAR # glib2
+	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
 	# In its util.h file, sysprof contains architecture-specific
 	# code
 	depends on BR2_i386 || BR2_x86_64 || BR2_powerpc || BR2_sh4a || BR2_sh4aeb
@@ -11,14 +12,17 @@ config BR2_PACKAGE_SYSPROF
 
 	  http://sysprof.com
 
+if BR2_PACKAGE_SYSPROF
+
 config BR2_PACKAGE_SYSPROF_GUI
 	bool "sysprof GUI"
-	depends on BR2_PACKAGE_SYSPROF
 	depends on BR2_PACKAGE_LIBGTK2
 	select BR2_PACKAGE_LIBGLADE
 	select BR2_PACKAGE_GDK_PIXBUF
 	help
 	  GUI for the sysprof system-wide statistical profiler.
 
-comment "sysprof requires a toolchain with WCHAR support"
-        depends on !BR2_USE_WCHAR
+endif
+
+comment "sysprof requires a toolchain with WCHAR and threading support"
+        depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/udev/Config.in b/package/udev/Config.in
index d3244d1..ed32c89 100644
--- a/package/udev/Config.in
+++ b/package/udev/Config.in
@@ -25,10 +25,15 @@ config BR2_PACKAGE_UDEV_ALL_EXTRAS
 	select BR2_PACKAGE_ACL
 	select BR2_PACKAGE_HWDATA
 	select BR2_PACKAGE_LIBGLIB2
+	depends on BR2_USE_WCHAR # libglib2
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
 	help
 	  Enable all extras with external dependencies like
 	  libacl, hwdata and libglib2
 
+comment "enabling all extras requires a toolchain with WCHAR and threading support"
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_USE_THREADS
+
 endif
 
 comment "udev requires /dev mgmnt set to udev under System configuration"
diff --git a/package/udisks/Config.in b/package/udisks/Config.in
index a50b3ea..dca23ea 100644
--- a/package/udisks/Config.in
+++ b/package/udisks/Config.in
@@ -1,12 +1,13 @@
 config BR2_PACKAGE_UDISKS
 	bool "udisks"
 	depends on BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV
-	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus-glib -> glib2
 	depends on BR2_USE_MMU # lvm2
 	select BR2_PACKAGE_UDEV
 	select BR2_PACKAGE_UDEV_ALL_EXTRAS
 	select BR2_PACKAGE_DBUS
 	select BR2_PACKAGE_DBUS_GLIB
+	depends on BR2_USE_WCHAR # dbus-glib -> glib2
 	select BR2_PACKAGE_SG3_UTILS
 	select BR2_PACKAGE_POLKIT
 	select BR2_PACKAGE_PARTED
@@ -24,12 +25,16 @@ config BR2_PACKAGE_UDISKS
 
 	  http://www.freedesktop.org/wiki/Software/udisks
 
+if BR2_PACKAGE_UDISKS
+
 config BR2_PACKAGE_UDISKS_LVM2
 	bool "lvm2 support"
-	depends on BR2_PACKAGE_UDISKS
 	select BR2_PACKAGE_LVM2_APP_LIBRARY
 	help
 	  Enable LVM2 support
 
-comment "udisks requires /dev mgmnt set to udev under System configuration"
-	depends on !BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV
+endif
+
+comment "udisks requires /dev mgmnt set to udev under System configuration and a toolchain with WCHAR and threading support"
+	depends on !BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV || \
+		!BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/ussp-push/Config.in b/package/ussp-push/Config.in
index 716ce34..27c5a43 100644
--- a/package/ussp-push/Config.in
+++ b/package/ussp-push/Config.in
@@ -3,7 +3,7 @@ config BR2_PACKAGE_USSP_PUSH
 	depends on BR2_INET_IPV6
 	depends on !BR2_avr32
 	depends on BR2_USE_WCHAR # libglib2
-	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus, alsa-lib
+	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus, alsa-lib, libglib2
 	depends on BR2_USE_MMU # dbus
 	select BR2_PACKAGE_OPENOBEX
 	select BR2_PACKAGE_OPENOBEX_BLUEZ
diff --git a/package/vala/Config.in b/package/vala/Config.in
index 805c770..35c0257 100644
--- a/package/vala/Config.in
+++ b/package/vala/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_VALA
 	# We no longer support a toolchain on the target
 	depends on BR2_DEPRECATED
 	depends on BR2_USE_WCHAR # glib2
+	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
@@ -11,5 +12,5 @@ config BR2_PACKAGE_VALA
 
 	  http://live.gnome.org/Vala
 
-comment "vala requires a toolchain with WCHAR support"
-	depends on !BR2_USE_WCHAR
+comment "vala requires a toolchain with WCHAR and threading support"
+	depends on BR2_DEPRECATED && (!BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS)
diff --git a/package/webkit/Config.in b/package/webkit/Config.in
index c6711b8..92cbc62 100644
--- a/package/webkit/Config.in
+++ b/package/webkit/Config.in
@@ -1,7 +1,8 @@
 config BR2_PACKAGE_WEBKIT
 	bool "webkit"
 	depends on BR2_INSTALL_LIBSTDCPP
-	depends on BR2_USE_WCHAR
+	depends on BR2_USE_WCHAR # enchant -> libglib2
+	depends on BR2_TOOLCHAIN_HAS_THREADS # enchant -> libglib2
 	depends on BR2_PACKAGE_LIBGTK2
 	select BR2_PACKAGE_ICU
 	select BR2_PACKAGE_LIBCURL
@@ -22,5 +23,6 @@ config BR2_PACKAGE_WEBKIT
 
 	  http://webkit.org/
 
-comment "webkit requires C++, WCHAR in toolchain and libgtk2"
-	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || !BR2_PACKAGE_LIBGTK2
+comment "webkit requires libgtk2 and a toolchain with C++, WCHAR, threading support"
+	depends on BR2_PACKAGE_LIBGTK2 || !BR2_INSTALL_LIBSTDCPP || \
+		!BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/wireshark/Config.in b/package/wireshark/Config.in
index d4c8b43..111dd48 100644
--- a/package/wireshark/Config.in
+++ b/package/wireshark/Config.in
@@ -5,11 +5,12 @@ config BR2_PACKAGE_WIRESHARK
 	select BR2_PACKAGE_LIBGLIB2
 	depends on BR2_USE_MMU # fork()
 	depends on BR2_USE_WCHAR # glib2
+	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
 	help
 	  Network traffic sniffer and protocol decoder. Currently only tshark,
 	  the console interface, is enabled.
 
 	  http://www.wireshark.org
 
-comment "wireshark requires a toolchain with WCHAR support"
-	depends on !BR2_USE_WCHAR
+comment "wireshark requires a toolchain with WCHAR and threading support"
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
