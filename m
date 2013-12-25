From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 25 Dec 2013 12:21:39 +0100
Subject: [Buildroot] [git commit] Config.in files: use if/endif instead of
	'depends on' for main symbol
Message-ID: <20131225112152.D7BC19C1C4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=35eaed8d07bdc73a83990bc306fcdb08b2e70eaf
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In the Config.in file of package foo, it often happens that there are other
symbols besides BR2_PACKAGE_FOO. Typically, these symbols only make sense
when foo itself is enabled. There are two ways to express this: with
    depends on BR2_PACKAGE_FOO
in each extra symbol, or with
    if BR2_PACKAGE_FOO
        ...
    endif
around the entire set of extra symbols.

The if/endif approach avoids the repetition of 'depends on' statements on
multiple symbols, so this is clearly preferred. But even when there is only
one extra symbol, if/endif is a more logical choice:
- it is future-proof for when extra symbols are added
- it allows to have just one strategy instead of two (less confusion)

This patch modifies the Config.in files accordingly.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 boot/syslinux/Config.in               |    6 ++++--
 package/binutils/Config.in            |    5 ++++-
 package/cppcms/Config.in              |    5 ++++-
 package/cvs/Config.in                 |    5 ++++-
 package/dbus/Config.in                |    5 ++++-
 package/dhcp/Config.in                |    6 +++---
 package/directfb-examples/Config.in   |   30 ++++--------------------------
 package/e2fsprogs/Config.in           |    1 -
 package/efl/libedje/Config.in         |    5 ++++-
 package/evtest/Config.in              |    5 ++++-
 package/gadgetfs-test/Config.in       |    5 ++++-
 package/gettext/Config.in             |    5 ++++-
 package/gnutls/Config.in              |    5 ++++-
 package/googlefontdirectory/Config.in |    5 ++++-
 package/gpsd/Config.in                |    7 ++++---
 package/haserl/Config.in              |    5 +++--
 package/input-tools/Config.in         |    7 ++++---
 package/kexec/Config.in               |    5 ++++-
 package/kismet/Config.in              |    6 +++---
 package/kmod/Config.in                |    5 ++++-
 package/lcdproc/Config.in             |    6 ++++--
 package/libarchive/Config.in          |    9 +++++----
 package/libcurl/Config.in             |    5 ++++-
 package/libdnet/Config.in             |    8 ++++++--
 package/libidn/Config.in              |    5 ++++-
 package/libmicrohttpd/Config.in       |   10 +++++++---
 package/libmpeg2/Config.in            |    5 ++++-
 package/libnfc/Config.in              |    5 ++++-
 package/libnspr/Config.in             |    6 ++++--
 package/lighttpd/Config.in            |    1 -
 package/links/Config.in               |    6 +++++-
 package/live555/Config.in             |    7 ++++---
 package/madplay/Config.in             |    6 +++++-
 package/matchbox/Config.in            |    9 +++++----
 package/nano/Config.in                |    5 ++++-
 package/ncftp/Config.in               |    5 ++++-
 package/netsnmp/Config.in             |    8 ++++----
 package/nfs-utils/Config.in           |   16 ++++++++--------
 package/openssl/Config.in             |    6 ++++--
 package/polarssl/Config.in            |    5 ++++-
 package/pppd/Config.in                |    6 ++++--
 package/proftpd/Config.in             |    5 ++++-
 package/pulseaudio/Config.in          |    5 ++++-
 package/qtuio/Config.in               |    5 ++++-
 package/rsh-redone/Config.in          |    9 ++++-----
 package/schifra/Config.in             |    5 ++++-
 package/sdl_image/Config.in           |    5 ++++-
 package/sdl_sound/Config.in           |    5 ++++-
 package/sg3_utils/Config.in           |    5 ++++-
 package/speex/Config.in               |    8 ++++++--
 package/taglib/Config.in              |    6 ++++--
 package/tcl/Config.in                 |    6 ++++--
 package/tcpdump/Config.in             |    5 ++++-
 package/tiff/Config.in                |    6 ++----
 package/tzdata/Config.in              |    5 ++++-
 package/udpcast/Config.in             |    7 ++++---
 package/usbutils/Config.in            |    5 ++++-
 package/vim/Config.in                 |    5 ++++-
 package/wireless_tools/Config.in      |    5 ++++-
 package/zeromq/Config.in              |    5 ++++-
 60 files changed, 242 insertions(+), 132 deletions(-)

diff --git a/boot/syslinux/Config.in b/boot/syslinux/Config.in
index 1928651..2c39e65 100644
--- a/boot/syslinux/Config.in
+++ b/boot/syslinux/Config.in
@@ -7,12 +7,14 @@ config BR2_TARGET_SYSLINUX
 
 	  http://syslinux.org
 
+if BR2_TARGET_SYSLINUX
+
 config BR2_TARGET_SYSLINUX_ISOLINUX
 	bool "Install isolinux"
-	depends on BR2_TARGET_SYSLINUX
 	default y
 
 config BR2_TARGET_SYSLINUX_PXELINUX
 	bool "Install pxelinux"
-	depends on BR2_TARGET_SYSLINUX
 	default y
+
+endif
diff --git a/package/binutils/Config.in b/package/binutils/Config.in
index 38d519a..e1f77e5 100644
--- a/package/binutils/Config.in
+++ b/package/binutils/Config.in
@@ -5,9 +5,10 @@ config BR2_PACKAGE_BINUTILS
 	help
 	  Install binutils on the target
 
+if BR2_PACKAGE_BINUTILS
+
 config BR2_PACKAGE_BINUTILS_TARGET
 	bool "binutils binaries"
-	depends on BR2_PACKAGE_BINUTILS
 	help
 	  The GNU Binutils are a collection of binary tools:
 
@@ -16,3 +17,5 @@ config BR2_PACKAGE_BINUTILS_TARGET
 	  and others...
 
 	  http://www.gnu.org/software/binutils/
+
+endif
diff --git a/package/cppcms/Config.in b/package/cppcms/Config.in
index c5d64ce..2df83ba 100644
--- a/package/cppcms/Config.in
+++ b/package/cppcms/Config.in
@@ -20,14 +20,17 @@ config BR2_PACKAGE_CPPCMS
 
 	  http://cppcms.com
 
+if BR2_PACKAGE_CPPCMS
+
 config BR2_PACKAGE_CPPCMS_ICU
 	bool "enable icu support"
-	depends on BR2_PACKAGE_CPPCMS
 	depends on !BR2_arc # icu -> atomic builtins
 	select BR2_PACKAGE_ICU
 	help
 	  Using ICU allows advanced localization features into CppCMS,
 	  in another hand ICU is heavier than iconv.
 
+endif
+
 comment "cppcms needs an (e)glibc toolchain w/ C++"
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_USES_GLIBC
diff --git a/package/cvs/Config.in b/package/cvs/Config.in
index 6a8b037..0036961 100644
--- a/package/cvs/Config.in
+++ b/package/cvs/Config.in
@@ -9,12 +9,15 @@ config BR2_PACKAGE_CVS
 
 	  http://www.nongnu.org/cvs/
 
+if BR2_PACKAGE_CVS
+
 config BR2_PACKAGE_CVS_SERVER
 	bool "server support"
-	depends on BR2_PACKAGE_CVS
 	help
 	  Enable cvs server code
 
+endif
+
 comment "cvs needs a toolchain w/ wchar"
 	depends on BR2_USE_MMU
 	depends on !BR2_USE_WCHAR
diff --git a/package/dbus/Config.in b/package/dbus/Config.in
index 9c9e3f8..97c9ee9 100644
--- a/package/dbus/Config.in
+++ b/package/dbus/Config.in
@@ -8,9 +8,10 @@ config BR2_PACKAGE_DBUS
 
 	  http://www.freedesktop.org/wiki/Software/dbus
 
+if BR2_PACKAGE_DBUS
+
 choice
 	prompt "XML library to use"
-	depends on BR2_PACKAGE_DBUS
 	default BR2_DBUS_EXPAT
 	help
 	  Select the XML library to use with D-Bus. Select Expat
@@ -27,6 +28,8 @@ choice
 
 endchoice
 
+endif
+
 comment "dbus needs a toolchain w/ threads"
 	depends on BR2_USE_MMU
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/dhcp/Config.in b/package/dhcp/Config.in
index 7944ede..99b4eec 100644
--- a/package/dhcp/Config.in
+++ b/package/dhcp/Config.in
@@ -7,9 +7,10 @@ config BR2_PACKAGE_DHCP
 
 	  http://www.isc.org/products/DHCP
 
+if BR2_PACKAGE_DHCP
+
 config BR2_PACKAGE_DHCP_SERVER
 	bool "dhcp server"
-	depends on BR2_PACKAGE_DHCP
 	help
 	  DHCP server from the ISC DHCP distribution.
 
@@ -21,14 +22,13 @@ config BR2_PACKAGE_DHCP_SERVER_DELAYED_ACK
 
 config BR2_PACKAGE_DHCP_RELAY
 	bool "dhcp relay"
-	depends on BR2_PACKAGE_DHCP
 	help
 	  DHCP relay agent from the ISC DHCP distribution.
 
 
 config BR2_PACKAGE_DHCP_CLIENT
 	bool "dhcp client"
-	depends on BR2_PACKAGE_DHCP
 	help
 	  DHCP client from the ISC DHCP distribution.
 
+endif
diff --git a/package/directfb-examples/Config.in b/package/directfb-examples/Config.in
index afd6d6d..51dd288 100644
--- a/package/directfb-examples/Config.in
+++ b/package/directfb-examples/Config.in
@@ -8,9 +8,10 @@ config BR2_PACKAGE_DIRECTFB_EXAMPLES
 
 	  http://directfb.org/downloads/Extras/README.DirectFB-examples
 
+if BR2_PACKAGE_DIRECTFB_EXAMPLES
+
 config BR2_PACKAGE_DIRECTFB_EXAMPLES_ANDI
 	bool "usr/bin/df_andi"
-	depends on BR2_PACKAGE_DIRECTFB_EXAMPLES
 	help
 	  Penguin demo, press 'space' to form convergence logo,
 	  's'/'d' to spawn/destroy 'a' penguin, 'r' to revive penguin
@@ -18,68 +19,57 @@ config BR2_PACKAGE_DIRECTFB_EXAMPLES_ANDI
 
 config BR2_PACKAGE_DIRECTFB_EXAMPLES_BLTLOAD
 	bool "usr/bin/df_bltload"
-	depends on BR2_PACKAGE_DIRECTFB_EXAMPLES
 	help
 	  Reads information from /proc/bltstat.
 
 config BR2_PACKAGE_DIRECTFB_EXAMPLES_CPULOAD
 	bool "usr/bin/df_cpuload"
-	depends on BR2_PACKAGE_DIRECTFB_EXAMPLES
 	help
 	  CPU Load with data from /proc/stat.
 
 config BR2_PACKAGE_DIRECTFB_EXAMPLES_DATABUFFER
 	bool "usr/bin/df_databuffer"
-	depends on BR2_PACKAGE_DIRECTFB_EXAMPLES
 	help
 	  Simple test application for data buffers.
 
 config BR2_PACKAGE_DIRECTFB_EXAMPLES_DIOLOAD
 	bool "usr/bin/df_dioload"
-	depends on BR2_PACKAGE_DIRECTFB_EXAMPLES
 	help
 	  Disk IO with data from /proc/stat.
 
 config BR2_PACKAGE_DIRECTFB_EXAMPLES_DOK
 	bool "usr/bin/df_dok"
-	depends on BR2_PACKAGE_DIRECTFB_EXAMPLES
 	help
 	  DirectFB benchmark application, runs some tests and
 	  displays benchmark results afterwards.
 
 config BR2_PACKAGE_DIRECTFB_EXAMPLES_DRIVERTEST
 	bool "usr/bin/df_drivertest"
-	depends on BR2_PACKAGE_DIRECTFB_EXAMPLES
 	help
 	  Tool to check drivers for bugs and accuracy.
 
 config BR2_PACKAGE_DIRECTFB_EXAMPLES_FIRE
 	bool "usr/bin/df_fire"
-	depends on BR2_PACKAGE_DIRECTFB_EXAMPLES
 	help
 	  The famous fire effect ported to DirectFB (16 bpp only).
 
 config BR2_PACKAGE_DIRECTFB_EXAMPLES_FLIP
 	bool "usr/bin/df_flip"
-	depends on BR2_PACKAGE_DIRECTFB_EXAMPLES
 	help
 	  Raw Flip() benchmark.
 
 config BR2_PACKAGE_DIRECTFB_EXAMPLES_FONTS
 	bool "usr/bin/df_fonts"
-	depends on BR2_PACKAGE_DIRECTFB_EXAMPLES
 	help
 	  Takes a list of font files and shows character tables.
 
 config BR2_PACKAGE_DIRECTFB_EXAMPLES_INPUT
 	bool "usr/bin/df_input"
-	depends on BR2_PACKAGE_DIRECTFB_EXAMPLES
 	help
 	  Test application for input devices.
 
 config BR2_PACKAGE_DIRECTFB_EXAMPLES_JOYSTICK
 	bool "usr/bin/df_joystick"
-	depends on BR2_PACKAGE_DIRECTFB_EXAMPLES
 	help
 	  A colored version of df_particle, fointain can be moved with
 	  joystick. The particles of different colors can be spawned
@@ -87,7 +77,6 @@ config BR2_PACKAGE_DIRECTFB_EXAMPLES_JOYSTICK
 
 config BR2_PACKAGE_DIRECTFB_EXAMPLES_KNUCKLES
 	bool "usr/bin/df_knuckles"
-	depends on BR2_PACKAGE_DIRECTFB_EXAMPLES
 	help
 	  3D skull drawn using triangles that can be rotated using
 	  the mouse. 'Space' switches to wireframe, 'b' toggles
@@ -95,25 +84,21 @@ config BR2_PACKAGE_DIRECTFB_EXAMPLES_KNUCKLES
 
 config BR2_PACKAGE_DIRECTFB_EXAMPLES_LAYER
 	bool "usr/bin/df_layer"
-	depends on BR2_PACKAGE_DIRECTFB_EXAMPLES
 	help
 	  Simple videoplayer with layers.
 
 config BR2_PACKAGE_DIRECTFB_EXAMPLES_MATRIX
 	bool "usr/bin/df_matrix"
-	depends on BR2_PACKAGE_DIRECTFB_EXAMPLES
 	help
 	  Testing SetMatrix() for free transforms.
 
 config BR2_PACKAGE_DIRECTFB_EXAMPLES_MATRIX_WATER
 	bool "usr/bin/df_matrix_water"
-	depends on BR2_PACKAGE_DIRECTFB_EXAMPLES
 	help
 	  Same as df_matrix, but using new Water API.
 
 config BR2_PACKAGE_DIRECTFB_EXAMPLES_NEO
 	bool "usr/bin/df_neo"
-	depends on BR2_PACKAGE_DIRECTFB_EXAMPLES
 	help
 	  Port from a gdk-pixbuf demo to DirectFB, uses scaling,
 	  alpha blending and color modulation, use cursor keys and
@@ -121,62 +106,55 @@ config BR2_PACKAGE_DIRECTFB_EXAMPLES_NEO
 
 config BR2_PACKAGE_DIRECTFB_EXAMPLES_NETLOAD
 	bool "usr/bin/df_netload"
-	depends on BR2_PACKAGE_DIRECTFB_EXAMPLES
 	help
 	  Network statistica from /proc/net/dev.
 
 config BR2_PACKAGE_DIRECTFB_EXAMPLES_PALETTE
 	bool "usr/bin/df_palette"
-	depends on BR2_PACKAGE_DIRECTFB_EXAMPLES
 	help
 	  A example blitting from a surface with a
 	  rotating/morphing palette.
 
 config BR2_PACKAGE_DIRECTFB_EXAMPLES_PARTICLE
 	bool "usr/bin/df_particle"
-	depends on BR2_PACKAGE_DIRECTFB_EXAMPLES
 	help
 	  A moving fountain consisting of alphablended rectangles,
 	  nice and fast if hardware accelerated.
 
 config BR2_PACKAGE_DIRECTFB_EXAMPLES_PORTER
 	bool "usr/bin/df_porter"
-	depends on BR2_PACKAGE_DIRECTFB_EXAMPLES
 	help
 	  Shows porter/duff blending rules.
 
 config BR2_PACKAGE_DIRECTFB_EXAMPLES_STRESS
 	bool "usr/bin/df_stress"
-	depends on BR2_PACKAGE_DIRECTFB_EXAMPLES
 	help
 	  Stress tests surface manager, for debugging purposes only.
 
 config BR2_PACKAGE_DIRECTFB_EXAMPLES_TEXTURE
 	bool "usr/bin/df_texture"
-	depends on BR2_PACKAGE_DIRECTFB_EXAMPLES
 	help
 	  A simple texture example. The 3d windows can be rotated
 	  with the mouse.
 
 config BR2_PACKAGE_DIRECTFB_EXAMPLES_VIDEO
 	bool "usr/bin/df_video"
-	depends on BR2_PACKAGE_DIRECTFB_EXAMPLES
 	help
 	  Shows window stack with alpha blending and video playback
 	  in a moving window.
 
 config BR2_PACKAGE_DIRECTFB_EXAMPLES_VIDEO_PARTICLE
 	bool "usr/bin/df_video_particle"
-	depends on BR2_PACKAGE_DIRECTFB_EXAMPLES
 	help
 	  Same as df_particle, but the rectangles have been
 	  replaced by a video (via video4linux). Nice color effects.
 
 config BR2_PACKAGE_DIRECTFB_EXAMPLES_WINDOW
 	bool "usr/bin/df_window"
-	depends on BR2_PACKAGE_DIRECTFB_EXAMPLES
 	help
 	  Simple demonstration of the DirectFB window stack, follow
 	  the instructions in the upper left corner. Pass a video
 	  device file or a movie file on the command-line to enable
 	  video playback in one of the windows.
+
+endif
diff --git a/package/e2fsprogs/Config.in b/package/e2fsprogs/Config.in
index 1d1e174..7775e94 100644
--- a/package/e2fsprogs/Config.in
+++ b/package/e2fsprogs/Config.in
@@ -79,7 +79,6 @@ config BR2_PACKAGE_E2FSPROGS_MKE2FS
 config BR2_PACKAGE_E2FSPROGS_MKLOSTFOUND
 	bool "mklost+found"
 	default y
-	depends on BR2_PACKAGE_E2FSPROGS
 
 config BR2_PACKAGE_E2FSPROGS_RESIZE2FS
 	bool "resize2fs"
diff --git a/package/efl/libedje/Config.in b/package/efl/libedje/Config.in
index 4c30274..4a0831a 100644
--- a/package/efl/libedje/Config.in
+++ b/package/efl/libedje/Config.in
@@ -14,9 +14,12 @@ config BR2_PACKAGE_LIBEDJE
 
 	  http://trac.enlightenment.org/e/wiki/Edje
 
+if BR2_PACKAGE_LIBEDJE
+
 config BR2_PACKAGE_LIBEDJE_CC
 	bool "build edje_cc"
-	depends on BR2_PACKAGE_LIBEDJE
 	help
 	  Build and install the Edje compiler for the target. Normally this
 	  is not required.
+
+endif
diff --git a/package/evtest/Config.in b/package/evtest/Config.in
index e8f9e37..77821c4 100644
--- a/package/evtest/Config.in
+++ b/package/evtest/Config.in
@@ -8,11 +8,14 @@ config BR2_PACKAGE_EVTEST
 
 	  http://www.freedesktop.org/wiki/Evtest
 
+if BR2_PACKAGE_EVTEST
+
 config BR2_PACKAGE_EVTEST_CAPTURE
 	bool "evtest-capture"
-	depends on BR2_PACKAGE_EVTEST
 	select BR2_PACKAGE_LIBXML2
 	help
 	  evtest-capture captures the information and events from the
 	  input device specified on the command line and writes it to
 	  the xml file given.
+
+endif
diff --git a/package/gadgetfs-test/Config.in b/package/gadgetfs-test/Config.in
index c4b7739..9afb0a2 100644
--- a/package/gadgetfs-test/Config.in
+++ b/package/gadgetfs-test/Config.in
@@ -4,10 +4,11 @@ config BR2_PACKAGE_GADGETFS_TEST
 	help
 	  Test program for gadgetfs from linux-usb.org
 
+if BR2_PACKAGE_GADGETFS_TEST
+
 config BR2_PACKAGE_GADGETFS_TEST_USE_AIO
 	bool "use asynchronous i/o"
 	select BR2_PACKAGE_LIBAIO
-	depends on BR2_PACKAGE_GADGETFS_TEST
 	# libaio is available only on few architectures
 	depends on \
 		BR2_arm   || BR2_armeb || BR2_avr32  || BR2_i386    || \
@@ -17,5 +18,7 @@ config BR2_PACKAGE_GADGETFS_TEST_USE_AIO
 	  Select this to have gadgetfs-test do asynchronous I/O using
 	  the libaio library.
 
+endif
+
 comment "gadgetfs-test needs a toolchain w/ threads"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/gettext/Config.in b/package/gettext/Config.in
index 305c5a5..d33dd3a 100644
--- a/package/gettext/Config.in
+++ b/package/gettext/Config.in
@@ -13,9 +13,10 @@ config BR2_PACKAGE_GETTEXT
 
 	  http://www.gnu.org/software/gettext/
 
+if BR2_PACKAGE_GETTEXT
+
 config BR2_PACKAGE_GETTEXT_TOOLS
 	bool "Install gettext tools"
-	depends on BR2_PACKAGE_GETTEXT
 	depends on BR2_USE_MMU # fork()
 	depends on BR2_LARGEFILE
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
@@ -24,6 +25,8 @@ config BR2_PACKAGE_GETTEXT_TOOLS
 	  the target filesystem. This is typically not useful for
 	  correct operation of programs.
 
+endif
+
 comment "gettext needs a toolchain w/ wchar"
 	depends on BR2_NEEDS_GETTEXT
 	depends on !BR2_USE_WCHAR
diff --git a/package/gnutls/Config.in b/package/gnutls/Config.in
index d2648d0..ecb6756 100644
--- a/package/gnutls/Config.in
+++ b/package/gnutls/Config.in
@@ -9,11 +9,14 @@ config BR2_PACKAGE_GNUTLS
 
 	  http://www.gnutls.org
 
+if BR2_PACKAGE_GNUTLS
+
 config BR2_PACKAGE_GNUTLS_TOOLS
 	bool "install tools"
-	depends on BR2_PACKAGE_GNUTLS
 	help
 	  Install GnuTLS command line tools for various cryptographic tasks.
 
+endif
+
 comment "gnutls needs a toolchain w/ wchar"
 	depends on !BR2_USE_WCHAR
diff --git a/package/googlefontdirectory/Config.in b/package/googlefontdirectory/Config.in
index 872fe27..762c1b1 100644
--- a/package/googlefontdirectory/Config.in
+++ b/package/googlefontdirectory/Config.in
@@ -5,9 +5,12 @@ config BR2_PACKAGE_GOOGLEFONTDIRECTORY
 
 	  http://code.google.com/p/googlefontdirectory/
 
+if BR2_PACKAGE_GOOGLEFONTDIRECTORY
+
 config BR2_PACKAGE_GOOGLEFONTDIRECTORY_FONTS
 	string "List of fonts to install"
 	default "droid"
-	depends on BR2_PACKAGE_GOOGLEFONTDIRECTORY
 	help
 	  Specify a space-separated list of fonts to install
+
+endif
diff --git a/package/gpsd/Config.in b/package/gpsd/Config.in
index 2fd97d0..5954e77 100644
--- a/package/gpsd/Config.in
+++ b/package/gpsd/Config.in
@@ -17,13 +17,13 @@ config BR2_PACKAGE_GPSD
 
 	  http://gpsd.berlios.de/
 
+if BR2_PACKAGE_GPSD
+
 config BR2_PACKAGE_GPSD_DEVICES
 	string "Where to look for GPSes"
 	default "/dev/ttyS1"
-	depends on BR2_PACKAGE_GPSD
 
 menu "Features"
-	depends on BR2_PACKAGE_GPSD
 
 config BR2_PACKAGE_GPSD_CLIENT_DEBUG
 	bool "client debugging support"
@@ -95,7 +95,6 @@ config BR2_PACKAGE_GPSD_SQUELCH
 endmenu
 
 menu "Protocols"
-	depends on BR2_PACKAGE_GPSD
 
 config BR2_PACKAGE_GPSD_AIVDM
 	bool "Aivdm"
@@ -231,3 +230,5 @@ config BR2_PACKAGE_GPSD_UBX
 	  uBlox UBX binary support
 
 endmenu
+
+endif
diff --git a/package/haserl/Config.in b/package/haserl/Config.in
index 3db859a..ddcf3e0 100644
--- a/package/haserl/Config.in
+++ b/package/haserl/Config.in
@@ -8,9 +8,10 @@ config BR2_PACKAGE_HASERL
 
 	  http://haserl.sourceforge.net/
 
+if BR2_PACKAGE_HASERL
+
 config BR2_PACKAGE_HASERL_WITH_LUA
 	bool "Lua support"
-	depends on BR2_PACKAGE_HASERL
 	depends on BR2_PACKAGE_HASERL_VERSION_0_9_X
 	select BR2_PACKAGE_LUA
 	help
@@ -19,7 +20,6 @@ config BR2_PACKAGE_HASERL_WITH_LUA
 choice
 	prompt "Haserl version"
 	default BR2_PACKAGE_HASERL_VERSION_0_9_X
-	depends on BR2_PACKAGE_HASERL
 	help
 	  Select the older stable version, or the newer developer version
 
@@ -35,6 +35,7 @@ config BR2_PACKAGE_HASERL_VERSION_0_9_X
 
 endchoice
 
+endif
 
 config BR2_PACKAGE_HASERL_VERSION
 	string
diff --git a/package/input-tools/Config.in b/package/input-tools/Config.in
index a2dfe28..85b4fd0 100644
--- a/package/input-tools/Config.in
+++ b/package/input-tools/Config.in
@@ -4,23 +4,24 @@ config BR2_PACKAGE_INPUT_TOOLS
 	  Tools for the Linux kernel input layer.
 	  http://linuxconsole.sourceforge.net/
 
+if BR2_PACKAGE_INPUT_TOOLS
+
 config BR2_PACKAGE_INPUT_TOOLS_INPUTATTACH
 	bool "inputattach"
-	depends on BR2_PACKAGE_INPUT_TOOLS
 	default y
 	help
 	  Inputattach is used for attaching a serial line to the input layer.
 
 config BR2_PACKAGE_INPUT_TOOLS_JSCAL
 	bool "jscal"
-	depends on BR2_PACKAGE_INPUT_TOOLS
 	default y
 	help
 	  Joystick calibration program.
 
 config BR2_PACKAGE_INPUT_TOOLS_JSTEST
 	bool "jstest"
-	depends on BR2_PACKAGE_INPUT_TOOLS
 	default y
 	help
 	  Joystick test program.
+
+endif
diff --git a/package/kexec/Config.in b/package/kexec/Config.in
index 66bc343..955a5f4 100644
--- a/package/kexec/Config.in
+++ b/package/kexec/Config.in
@@ -9,9 +9,12 @@ config BR2_PACKAGE_KEXEC
 
 	  https://www.kernel.org/pub/linux/utils/kernel/kexec/
 
+if BR2_PACKAGE_KEXEC
+
 config BR2_PACKAGE_KEXEC_ZLIB
 	bool "zlib support"
-	depends on BR2_PACKAGE_KEXEC
 	select BR2_PACKAGE_ZLIB
 	help
 	  Support for compressed kernel images
+
+endif
diff --git a/package/kismet/Config.in b/package/kismet/Config.in
index fc9103d..8bbc9a6 100644
--- a/package/kismet/Config.in
+++ b/package/kismet/Config.in
@@ -26,16 +26,16 @@ config BR2_PACKAGE_KISMET
 
 	  http://www.kismetwireless.net
 
+if BR2_PACKAGE_KISMET
+
 config BR2_PACKAGE_KISMET_CLIENT
 	bool "Install client"
-	depends on BR2_PACKAGE_KISMET
 
 config BR2_PACKAGE_KISMET_DRONE
 	bool "Install drone"
-	depends on BR2_PACKAGE_KISMET
 
 config BR2_PACKAGE_KISMET_SERVER
 	bool "Install server"
 	default y
-	depends on BR2_PACKAGE_KISMET
 
+endif
diff --git a/package/kmod/Config.in b/package/kmod/Config.in
index bd44316..2e8b955 100644
--- a/package/kmod/Config.in
+++ b/package/kmod/Config.in
@@ -6,10 +6,13 @@ config BR2_PACKAGE_KMOD
 
 	  http://git.kernel.org/?p=utils/kernel/kmod/kmod.git
 
+if BR2_PACKAGE_KMOD
+
 config BR2_PACKAGE_KMOD_TOOLS
 	bool "kmod utilities"
-	depends on BR2_PACKAGE_KMOD
 	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 	help
 	  Install kmod module utilities (depmod, insmod, lsmod,
 	  modinfo, modprobe, rmmod).
+
+endif
diff --git a/package/lcdproc/Config.in b/package/lcdproc/Config.in
index 5635a02..f5a8501 100644
--- a/package/lcdproc/Config.in
+++ b/package/lcdproc/Config.in
@@ -9,15 +9,17 @@ config BR2_PACKAGE_LCDPROC
 
 	  http://lcdproc.org/
 
+if BR2_PACKAGE_LCDPROC
+
 config BR2_PACKAGE_LCDPROC_DRIVERS
 	string "List of drivers to build"
 	default "all"
-	depends on BR2_PACKAGE_LCDPROC
 	help
 	  Specify a comma-separated list of lcdproc drivers to be built
 
 config BR2_PACKAGE_LCDPROC_MENUS
 	bool "Menu support"
-	depends on BR2_PACKAGE_LCDPROC
 	help
 	  Enable support for lcdproc menus
+
+endif
diff --git a/package/libarchive/Config.in b/package/libarchive/Config.in
index d4fb73f..81b5936 100644
--- a/package/libarchive/Config.in
+++ b/package/libarchive/Config.in
@@ -1,3 +1,6 @@
+comment "libarchive needs a toolchain w/ wchar"
+	depends on !BR2_USE_WCHAR
+
 config BR2_PACKAGE_LIBARCHIVE
 	bool "libarchive"
 	depends on BR2_USE_WCHAR
@@ -7,20 +10,18 @@ config BR2_PACKAGE_LIBARCHIVE
 
 	  http://www.libarchive.org/
 
-comment "libarchive needs a toolchain w/ wchar"
-	depends on !BR2_USE_WCHAR
+if BR2_PACKAGE_LIBARCHIVE
 
 config BR2_PACKAGE_LIBARCHIVE_BSDTAR
 	bool "bsdtar"
-	depends on BR2_PACKAGE_LIBARCHIVE
 	help
 	  The 'bsdtar' program is a full-featured 'tar'
 	  replacement built on libarchive.
 
 config BR2_PACKAGE_LIBARCHIVE_BSDCPIO
 	bool "bsdcpio"
-	depends on BR2_PACKAGE_LIBARCHIVE
 	help
 	  The 'bsdcpio' program is a different interface to
 	  essentially the same functionality as 'bsdtar'.
 
+endif
diff --git a/package/libcurl/Config.in b/package/libcurl/Config.in
index 8e2953e..026ae01 100644
--- a/package/libcurl/Config.in
+++ b/package/libcurl/Config.in
@@ -6,8 +6,11 @@ config BR2_PACKAGE_LIBCURL
 
 	  http://curl.haxx.se/
 
+if BR2_PACKAGE_LIBCURL
+
 config BR2_PACKAGE_CURL
 	bool "curl binary"
-	depends on BR2_PACKAGE_LIBCURL
 	help
 	  Install curl binary as well
+
+endif
diff --git a/package/libdnet/Config.in b/package/libdnet/Config.in
index 589903f..81163f5 100644
--- a/package/libdnet/Config.in
+++ b/package/libdnet/Config.in
@@ -5,12 +5,16 @@ config BR2_PACKAGE_LIBDNET
 
 	  http://libdnet.sourceforge.net/
 
+if BR2_PACKAGE_LIBDNET
+
 config BR2_PACKAGE_LIBDNET_PYTHON
 	bool "libdnet python module"
-	depends on BR2_PACKAGE_LIBDNET && BR2_PACKAGE_PYTHON
+	depends on BR2_PACKAGE_PYTHON
 	help
 	  dnet module for python
 
 comment "dnet module for python requires python package"
-	depends on BR2_PACKAGE_LIBDNET && !BR2_PACKAGE_PYTHON
+	depends on !BR2_PACKAGE_PYTHON
+
+endif
 
diff --git a/package/libidn/Config.in b/package/libidn/Config.in
index dcf9724..7b558c7 100644
--- a/package/libidn/Config.in
+++ b/package/libidn/Config.in
@@ -7,8 +7,11 @@ config BR2_PACKAGE_LIBIDN
 
 	  http://www.gnu.org/software/libidn/
 
+if BR2_PACKAGE_LIBIDN
+
 config BR2_PACKAGE_LIBIDN_BINARY
 	bool "idn binary"
-	depends on BR2_PACKAGE_LIBIDN
 	help
 	  Install idn command line tool
+
+endif
diff --git a/package/libmicrohttpd/Config.in b/package/libmicrohttpd/Config.in
index 15e3762..7ab3532 100644
--- a/package/libmicrohttpd/Config.in
+++ b/package/libmicrohttpd/Config.in
@@ -7,17 +7,21 @@ config BR2_PACKAGE_LIBMICROHTTPD
 
 	  http://www.gnu.org/software/libmicrohttpd/
 
+if BR2_PACKAGE_LIBMICROHTTPD
+
 config BR2_PACKAGE_LIBMICROHTTPD_SSL
 	bool "https support"
-	depends on BR2_PACKAGE_LIBMICROHTTPD
 	depends on BR2_USE_WCHAR
 	select BR2_PACKAGE_GNUTLS
 	select BR2_PACKAGE_LIBGCRYPT
 	help
 	  Enable HTTPS (SSL) support.
 
+comment "libmicrohttpd https support needs a toolchain w/ wchar"
+	depends on !BR2_USE_WCHAR
+
+endif
+
 comment "libmicrohttpd needs a toolchain w/ threads"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
 
-comment "libmicrohttpd https support needs a toolchain w/ wchar"
-	depends on BR2_PACKAGE_LIBMICROHTTPD && !BR2_USE_WCHAR
diff --git a/package/libmpeg2/Config.in b/package/libmpeg2/Config.in
index 3694689..6d7ff67 100644
--- a/package/libmpeg2/Config.in
+++ b/package/libmpeg2/Config.in
@@ -5,9 +5,12 @@ config BR2_PACKAGE_LIBMPEG2
 
 	  http://libmpeg2.sourceforge.net/
 
+if BR2_PACKAGE_LIBMPEG2
+
 config BR2_PACKAGE_LIBMPEG2_BINS
 	bool "mpeg2 binaries"
-	depends on BR2_PACKAGE_LIBMPEG2
 	help
 	  Install mpeg2dec, corrupt_mpeg2 and extract_mpeg2 programs as
 	  well.
+
+endif
diff --git a/package/libnfc/Config.in b/package/libnfc/Config.in
index db2b521..1707f21 100644
--- a/package/libnfc/Config.in
+++ b/package/libnfc/Config.in
@@ -8,10 +8,13 @@ config BR2_PACKAGE_LIBNFC
 
 	  http://www.libnfc.org/
 
+if BR2_PACKAGE_LIBNFC
+
 config BR2_PACKAGE_LIBNFC_EXAMPLES
 	bool "build libnfc examples"
-	depends on BR2_PACKAGE_LIBNFC
 	select BR2_PACKAGE_READLINE
 
+endif
+
 comment "libnfc needs a toolchain w/ threads"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/libnspr/Config.in b/package/libnspr/Config.in
index 1d73287..416f1c9 100644
--- a/package/libnspr/Config.in
+++ b/package/libnspr/Config.in
@@ -2,11 +2,12 @@ config BR2_PACKAGE_LIBNSPR_ARCH_SUPPORT
 	def_bool y
 	depends on !BR2_arc && !BR2_xtensa && !BR2_bfin
 
+if BR2_PACKAGE_LIBNSPR_ARCH_SUPPORT
+
 config BR2_PACKAGE_LIBNSPR
 	bool "libnspr"
 	depends on BR2_LARGEFILE
 	depends on BR2_TOOLCHAIN_HAS_THREADS
-	depends on BR2_PACKAGE_LIBNSPR_ARCH_SUPPORT
 	help
 	  NSPR is the Netscape Portable Runtime library which provides
 	  a platform-neutral API for system level and libc like
@@ -16,5 +17,6 @@ config BR2_PACKAGE_LIBNSPR
 	  http://www.mozilla.org/projects/nspr/
 
 comment "libnspr needs a toolchain w/ largefile, threads"
-	depends on BR2_PACKAGE_LIBNSPR_ARCH_SUPPORT
 	depends on !BR2_LARGEFILE || !BR2_TOOLCHAIN_HAS_THREADS
+
+endif
diff --git a/package/lighttpd/Config.in b/package/lighttpd/Config.in
index b84e6ea..a5abf7e 100644
--- a/package/lighttpd/Config.in
+++ b/package/lighttpd/Config.in
@@ -47,7 +47,6 @@ config BR2_PACKAGE_LIGHTTPD_WEBDAV
 
 config BR2_PACKAGE_LIGHTTPD_LUA
 	bool "lua support"
-	depends on BR2_PACKAGE_LIGHTTPD
 	select BR2_PACKAGE_LUA
 	help
 	  Enable Lua support. Needed to support mod_magnet
diff --git a/package/links/Config.in b/package/links/Config.in
index 141eaf2..713f53d 100644
--- a/package/links/Config.in
+++ b/package/links/Config.in
@@ -6,11 +6,15 @@ config BR2_PACKAGE_LINKS
 
 	  http://links.twibright.com/
 
+if BR2_PACKAGE_LINKS
+
 config BR2_PACKAGE_LINKS_GRAPHICS
 	bool "use graphics"
-	depends on BR2_PACKAGE_LINKS && (BR2_PACKAGE_DIRECTFB || BR2_PACKAGE_XORG7)
+	depends on BR2_PACKAGE_DIRECTFB || BR2_PACKAGE_XORG7
 	select BR2_PACKAGE_XLIB_LIBXT if BR2_PACKAGE_XORG7
 	select BR2_PACKAGE_LIBPNG
 	help
 	  Enable graphics output for DirectFB or X11.
 	  Otherwise links will be text-mode only.
+
+endif
diff --git a/package/live555/Config.in b/package/live555/Config.in
index 8193091..3823039 100644
--- a/package/live555/Config.in
+++ b/package/live555/Config.in
@@ -7,27 +7,28 @@ config BR2_PACKAGE_LIVE555
 
 	  http://www.live555.com/liveMedia/
 
+if BR2_PACKAGE_LIVE555
+
 config BR2_PACKAGE_LIVE555_OPENRTSP
 	bool "OpenRTSP"
-	depends on BR2_PACKAGE_LIVE555
 	default y
 	help
 	  Live555 RTSP Client.
 
 config BR2_PACKAGE_LIVE555_MEDIASERVER
 	bool "live555MediaServer"
-	depends on BR2_PACKAGE_LIVE555
 	default y
 	help
 	  RTSP Server. Supports numerous media formats such as H.264 and MPEG2.
 
 config BR2_PACKAGE_LIVE555_MPEG2_INDEXER
 	bool "MPEG2TransportStreamIndexer"
-	depends on BR2_PACKAGE_LIVE555
 	default y
 	help
 	  MPEG2 Transport Stream Indexer. Provides indexes allowing 'trick play'
 	  operation in the Live555MediaServer.
 
+endif
+
 comment "live555 needs a toolchain w/ C++"
 	depends on !BR2_INSTALL_LIBSTDCPP
diff --git a/package/madplay/Config.in b/package/madplay/Config.in
index a77cc36..3baeaa0 100644
--- a/package/madplay/Config.in
+++ b/package/madplay/Config.in
@@ -11,7 +11,11 @@ config BR2_PACKAGE_MADPLAY
 
 	  http://www.underbit.com/products/mad/
 
+if BR2_PACKAGE_MADPLAY
+
 config BR2_PACKAGE_MADPLAY_ALSA
 	bool
 	default y
-	depends on BR2_PACKAGE_MADPLAY && BR2_PACKAGE_ALSA_LIB
+	depends on BR2_PACKAGE_ALSA_LIB
+
+endif
diff --git a/package/matchbox/Config.in b/package/matchbox/Config.in
index d89a176..67c9716 100644
--- a/package/matchbox/Config.in
+++ b/package/matchbox/Config.in
@@ -9,23 +9,23 @@ config BR2_PACKAGE_MATCHBOX
 	help
 	  http://projects.o-hand.com/matchbox
 
+if BR2_PACKAGE_MATCHBOX
+
 config BR2_PACKAGE_MATCHBOX_PANEL
 	bool "Matchbox Panel"
-	depends on BR2_PACKAGE_MATCHBOX
 	help
 	  A flexible always present 'window bar' for holding
 	  application launchers.
 
 config BR2_PACKAGE_MATCHBOX_DESKTOP
 	bool "Matchbox Desktop"
-	depends on BR2_PACKAGE_MATCHBOX
 	select BR2_PACKAGE_ZLIB
 	help
 	  A PDA style application launcher or 'item browser'.
 
 config BR2_PACKAGE_MATCHBOX_COMMON
 	bool "Matchbox session common files"
-	depends on BR2_PACKAGE_MATCHBOX && BR2_PACKAGE_MATCHBOX_PANEL && BR2_PACKAGE_MATCHBOX_DESKTOP
+	depends on BR2_PACKAGE_MATCHBOX_PANEL && BR2_PACKAGE_MATCHBOX_DESKTOP
 	help
 	  Common desktop folders and matchbox-session script.
 
@@ -35,7 +35,8 @@ config BR2_PACKAGE_MATCHBOX_COMMON_PDA
 
 config BR2_PACKAGE_MATCHBOX_KEYBOARD
 	bool "Matchbox Virtual Keyboard"
-	depends on BR2_PACKAGE_MATCHBOX
 	select BR2_PACKAGE_XLIB_LIBXTST
 	help
 	  Virtual Keyboard
+
+endif
diff --git a/package/nano/Config.in b/package/nano/Config.in
index 395af9d..4b340ff 100644
--- a/package/nano/Config.in
+++ b/package/nano/Config.in
@@ -10,12 +10,15 @@ config BR2_PACKAGE_NANO
 
 	  http://www.nano-editor.org/
 
+if BR2_PACKAGE_NANO
+
 config BR2_PACKAGE_NANO_TINY
 	bool "optimize for size"
 	default y
-	depends on BR2_PACKAGE_NANO
 	help
 	  Disable all features for the sake of size.
 
+endif
+
 comment "nano needs a toolchain w/ wchar"
 	depends on !BR2_USE_WCHAR
diff --git a/package/ncftp/Config.in b/package/ncftp/Config.in
index 4aaa62d..57586e7 100644
--- a/package/ncftp/Config.in
+++ b/package/ncftp/Config.in
@@ -8,8 +8,9 @@ config BR2_PACKAGE_NCFTP
 
 	  http://www.ncftp.com/ncftp/
 
+if BR2_PACKAGE_NCFTP
+
 menu "ncFTP tools selection"
-	depends on BR2_PACKAGE_NCFTP
 
 config BR2_PACKAGE_NCFTP_GET
 	bool "NcFTPGet - command-line utility program"
@@ -32,3 +33,5 @@ config BR2_PACKAGE_NCFTP_BOOKMARKS
 	select BR2_PACKAGE_NCURSES
 
 endmenu
+
+endif
diff --git a/package/netsnmp/Config.in b/package/netsnmp/Config.in
index 3d08936..8edbd39 100644
--- a/package/netsnmp/Config.in
+++ b/package/netsnmp/Config.in
@@ -7,10 +7,11 @@ config BR2_PACKAGE_NETSNMP
 
 	  http://net-snmp.sourceforge.net/
 
+if BR2_PACKAGE_NETSNMP
+
 config BR2_PACKAGE_NETSNMP_ENABLE_MIBS
 	bool "Install MIB files on target and enable MIB loading code"
 	default y
-	depends on BR2_PACKAGE_NETSNMP
 	help
 	  The net-snmp package contains a selection of MIB files.
 	  Say yes if you want those MIB files installed on the target
@@ -19,22 +20,21 @@ config BR2_PACKAGE_NETSNMP_ENABLE_MIBS
 config BR2_PACKAGE_NETSNMP_WITH_MIB_MODULES
 	string "Build with these MIB modules"
 	default "host ucd-snmp/dlmod agentx"
-	depends on BR2_PACKAGE_NETSNMP
 	help
 	  Specify which MIB modules to include.
 
 config BR2_PACKAGE_NETSNMP_WITHOUT_MIB_MODULES
 	string "Build without these MIB modules"
 	default "disman/event disman/schedule utilities"
-	depends on BR2_PACKAGE_NETSNMP
 	help
 	  Specify which MIB modules to exclude.
 
 config BR2_PACKAGE_NETSNMP_ENABLE_DEBUGGING
 	bool "Enable debugging code"
-	depends on BR2_PACKAGE_NETSNMP
 	help
 	  By default net-snmp is compiled without debugging support
 	  (--disable-debugging). Enable this options if you need debugging
 	  support, including the ability to log with DEBUGMSG(),
 	  DEBUGMSGTL() and companion macros.
+
+endif
diff --git a/package/nfs-utils/Config.in b/package/nfs-utils/Config.in
index 3602a74..dff5150 100644
--- a/package/nfs-utils/Config.in
+++ b/package/nfs-utils/Config.in
@@ -1,3 +1,8 @@
+comment "nfs-utils needs a toolchain w/ largefile, threads"
+	depends on BR2_USE_MMU
+	depends on !BR2_LARGEFILE || \
+		!(BR2_TOOLCHAIN_HAS_THREADS || BR2_TOOLCHAIN_HAS_NATIVE_RPC)
+
 config BR2_PACKAGE_NFS_UTILS
 	bool "nfs-utils"
 	depends on BR2_TOOLCHAIN_HAS_NATIVE_RPC || BR2_TOOLCHAIN_HAS_THREADS # libtirpc
@@ -11,30 +16,25 @@ config BR2_PACKAGE_NFS_UTILS
 
 	  http://sourceforge.net/projects/nfs
 
-comment "nfs-utils needs a toolchain w/ largefile, threads"
-	depends on BR2_USE_MMU
-	depends on !BR2_LARGEFILE || \
-		!(BR2_TOOLCHAIN_HAS_THREADS || BR2_TOOLCHAIN_HAS_NATIVE_RPC)
+if BR2_PACKAGE_NFS_UTILS
 
 menu "NFS utilities selection"
-	depends on BR2_PACKAGE_NFS_UTILS
 
 config BR2_PACKAGE_NFS_UTILS_RPCDEBUG
 	bool "rpcdebug"
-	depends on BR2_PACKAGE_NFS_UTILS
 	help
 	  The RPC debugging utility
 
 config BR2_PACKAGE_NFS_UTILS_RPC_LOCKD
 	bool "rpc.lockd"
-	depends on BR2_PACKAGE_NFS_UTILS
 	help
 	  NFS lock manager for Linux kernels older than 2.4
 
 config BR2_PACKAGE_NFS_UTILS_RPC_RQUOTAD
 	bool "rpc.rquotad"
-	depends on BR2_PACKAGE_NFS_UTILS
 	help
 	  NFS remote quota server
 
 endmenu
+
+endif
diff --git a/package/openssl/Config.in b/package/openssl/Config.in
index d1ed520..a9990e8 100644
--- a/package/openssl/Config.in
+++ b/package/openssl/Config.in
@@ -9,9 +9,10 @@ config BR2_PACKAGE_OPENSSL
 
 	  http://www.openssl.org/
 
+if BR2_PACKAGE_OPENSSL
+
 config BR2_PACKAGE_OPENSSL_BIN
 	bool "openssl binary"
-	depends on BR2_PACKAGE_OPENSSL
 	# uses fork()
 	depends on BR2_USE_MMU
 	help
@@ -20,6 +21,7 @@ config BR2_PACKAGE_OPENSSL_BIN
 
 config BR2_PACKAGE_OPENSSL_ENGINES
 	bool "openssl additional engines"
-	depends on BR2_PACKAGE_OPENSSL
 	help
 	  Install additional encryption engine libraries.
+
+endif
diff --git a/package/polarssl/Config.in b/package/polarssl/Config.in
index 3414a7f..70cde57 100644
--- a/package/polarssl/Config.in
+++ b/package/polarssl/Config.in
@@ -13,9 +13,10 @@ config BR2_PACKAGE_POLARSSL
 
 	  http://polarssl.org/
 
+if BR2_PACKAGE_POLARSSL
+
 config BR2_PACKAGE_POLARSSL_PROGRAMS
 	bool "polarssl programs"
-	depends on BR2_PACKAGE_POLARSSL
 	help
 	  This option enables the installation and the build of
 	  PolarSSL companion programs: aescrypt2, benchmark, cert_app,
@@ -26,3 +27,5 @@ config BR2_PACKAGE_POLARSSL_PROGRAMS
 	  selftest, sha1sum, sha2sum, ssi-cgi, ssl_cert_test,
 	  ssl_client1, ssl_client2, ssl_fork_server, ssl_mail_client,
 	  ssl_server, ssl_test
+
+endif
diff --git a/package/pppd/Config.in b/package/pppd/Config.in
index dc16b22..a110513 100644
--- a/package/pppd/Config.in
+++ b/package/pppd/Config.in
@@ -7,8 +7,9 @@ config BR2_PACKAGE_PPPD
 
 	  http://www.samba.org/ppp/
 
+if BR2_PACKAGE_PPPD
+
 config BR2_PACKAGE_PPPD_FILTER
-	depends on BR2_PACKAGE_PPPD
 	select BR2_PACKAGE_LIBPCAP
 	bool "filtering"
 	help
@@ -17,11 +18,12 @@ config BR2_PACKAGE_PPPD_FILTER
 	  are available.
 
 config BR2_PACKAGE_PPPD_RADIUS
-	depends on BR2_PACKAGE_PPPD
 	bool "radius"
 	help
 	  Install RADIUS support for pppd
 
+endif
+
 comment "pppd needs a toolchain w/ dynamic library"
 	depends on BR2_PREFER_STATIC_LIB
 	depends on BR2_USE_MMU
diff --git a/package/proftpd/Config.in b/package/proftpd/Config.in
index 18407d1..dd87eb4 100644
--- a/package/proftpd/Config.in
+++ b/package/proftpd/Config.in
@@ -6,8 +6,11 @@ config BR2_PACKAGE_PROFTPD
 
 	  http://www.proftpd.org/
 
+if BR2_PACKAGE_PROFTPD
+
 config BR2_PACKAGE_PROFTPD_MOD_REWRITE
 	bool "mod_rewrite support"
-	depends on BR2_PACKAGE_PROFTPD
 	help
 	  Compile ProFTPD with mod_rewrite support
+
+endif
diff --git a/package/pulseaudio/Config.in b/package/pulseaudio/Config.in
index 010eeab..e5b9d8a 100644
--- a/package/pulseaudio/Config.in
+++ b/package/pulseaudio/Config.in
@@ -18,13 +18,16 @@ config BR2_PACKAGE_PULSEAUDIO
 
 	  http://pulseaudio.org
 
+if BR2_PACKAGE_PULSEAUDIO
+
 config BR2_PACKAGE_PULSEAUDIO_DAEMON
 	bool "start as a system daemon"
-	depends on BR2_PACKAGE_PULSEAUDIO
 	help
 	  PulseAudio can be started as a system daemon. This is not the
 	  recommended way of using PulseAudio unless you are building a
 	  headless system.
 
+endif
+
 comment "pulseaudio needs a toolchain w/ wchar, largefile, threads"
 	depends on !BR2_USE_WCHAR || !BR2_LARGEFILE || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/qtuio/Config.in b/package/qtuio/Config.in
index 19499fd..a4be1f6 100644
--- a/package/qtuio/Config.in
+++ b/package/qtuio/Config.in
@@ -7,12 +7,15 @@ config BR2_PACKAGE_QTUIO
 
 	  https://github.com/x29a/qTUIO
 
+if BR2_PACKAGE_QTUIO
+
 config BR2_QTUIO_EXAMPLES
 	bool "qtuio examples"
-	depends on BR2_PACKAGE_QTUIO
 	help
 	  Build and install qtuio examples
 
+endif
+
 comment "qtuio depends on QT gui module"
 	depends on !BR2_PACKAGE_QT_GUI_MODULE
 
diff --git a/package/rsh-redone/Config.in b/package/rsh-redone/Config.in
index 454bf30..5a90362 100644
--- a/package/rsh-redone/Config.in
+++ b/package/rsh-redone/Config.in
@@ -7,25 +7,24 @@ config BR2_PACKAGE_RSH_REDONE
 
 	  http://packages.debian.org/source/sid/rsh-redone
 
+if BR2_PACKAGE_RSH_REDONE
+
 # this is incomplete in the source
 #config BR2_PACKAGE_RSH_REDONE_RCP
 #	bool "rcp"
-#	depends on BR2_PACKAGE_RSH_REDONE
 
 config BR2_PACKAGE_RSH_REDONE_RLOGIN
 	bool "rlogin"
-	depends on BR2_PACKAGE_RSH_REDONE
 
 # requires PAM
 #config BR2_PACKAGE_RSH_REDONE_RLOGIND
 #	bool "rlogind"
-#	depends on BR2_PACKAGE_RSH_REDONE
 
 config BR2_PACKAGE_RSH_REDONE_RSH
 	bool "rsh"
-	depends on BR2_PACKAGE_RSH_REDONE
 
 # requires PAM
 #config BR2_PACKAGE_RSH_REDONE_RSHD
 #	bool "rshd"
-#	depends on BR2_PACKAGE_RSH_REDONE
+
+endif
diff --git a/package/schifra/Config.in b/package/schifra/Config.in
index 5a656ea..486f92d 100644
--- a/package/schifra/Config.in
+++ b/package/schifra/Config.in
@@ -8,11 +8,14 @@ config BR2_PACKAGE_SCHIFRA
 
 	  http://www.schifra.com/
 
+if BR2_PACKAGE_SCHIFRA
+
 config BR2_PACKAGE_SCHIFRA_EXAMPLES
 	bool "schifra examples"
-	depends on BR2_PACKAGE_SCHIFRA
 	help
 	  Build and install the schifra example applications.
 
+endif
+
 comment "schifra needs a toolchain w/ C++"
 	depends on !BR2_INSTALL_LIBSTDCPP
diff --git a/package/sdl_image/Config.in b/package/sdl_image/Config.in
index be0321a..1b98066 100644
--- a/package/sdl_image/Config.in
+++ b/package/sdl_image/Config.in
@@ -8,8 +8,9 @@ config BR2_PACKAGE_SDL_IMAGE
 
 	  http://www.libsdl.org/projects/SDL_image/
 
+if BR2_PACKAGE_SDL_IMAGE
+
 menu "SDL_image file format support"
-	depends on BR2_PACKAGE_SDL_IMAGE
 
 config BR2_PACKAGE_SDL_IMAGE_BMP
 	bool "enable BMP file format support"
@@ -56,3 +57,5 @@ config BR2_PACKAGE_SDL_IMAGE_XV
 	bool "enable XV file format support"
 
 endmenu
+
+endif
diff --git a/package/sdl_sound/Config.in b/package/sdl_sound/Config.in
index 542c996..6da1985 100644
--- a/package/sdl_sound/Config.in
+++ b/package/sdl_sound/Config.in
@@ -12,9 +12,12 @@ config BR2_PACKAGE_SDL_SOUND
 
 	  http://icculus.org/SDL_sound/
 
+if BR2_PACKAGE_SDL_SOUND
+
 config BR2_PACKAGE_SDL_SOUND_PLAYSOUND
 	bool "install playsound tool"
-	depends on BR2_PACKAGE_SDL_SOUND
 	help
 	  Enable this option to install the playsound/playsound_simple
 	  tools to target.
+
+endif
diff --git a/package/sg3_utils/Config.in b/package/sg3_utils/Config.in
index 9d2dbea..a8099f5 100644
--- a/package/sg3_utils/Config.in
+++ b/package/sg3_utils/Config.in
@@ -8,9 +8,12 @@ config BR2_PACKAGE_SG3_UTILS
 
 	  http://sg.danny.cz/sg/sg3_utils.html
 
+if BR2_PACKAGE_SG3_UTILS
+
 config BR2_PACKAGE_SG3_UTILS_PROGS
 	bool "install programs"
-	depends on BR2_PACKAGE_SG3_UTILS
+
+endif
 
 comment "sg3-utils needs a toolchain w/ largefile, threads"
 	depends on !BR2_LARGEFILE || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/speex/Config.in b/package/speex/Config.in
index a4f0a9e..e1f7c68 100644
--- a/package/speex/Config.in
+++ b/package/speex/Config.in
@@ -8,13 +8,17 @@ config BR2_PACKAGE_SPEEX
 
 	  http://www.speex.org/
 
+if BR2_PACKAGE_SPEEX
+
 config BR2_PACKAGE_SPEEX_ARM4
 	bool
 	default y
-	depends on BR2_PACKAGE_SPEEX && (BR2_arm7tdmi || BR2_arm720t || BR2_arm920t || BR2_arm922t || BR2_strongarm || BR2_fa526)
+	depends on BR2_arm7tdmi || BR2_arm720t || BR2_arm920t || BR2_arm922t || BR2_strongarm || BR2_fa526
 
 config BR2_PACKAGE_SPEEX_ARM5E
 	default y
 	bool
-	depends on BR2_PACKAGE_SPEEX && BR2_arm && !BR2_PACKAGE_SPEEX_ARM4
+	depends on BR2_arm && !BR2_PACKAGE_SPEEX_ARM4
+
+endif
 
diff --git a/package/taglib/Config.in b/package/taglib/Config.in
index b96a9bf..8f832a6 100644
--- a/package/taglib/Config.in
+++ b/package/taglib/Config.in
@@ -10,13 +10,15 @@ config BR2_PACKAGE_TAGLIB
 
 	  http://taglib.github.com
 
+if BR2_PACKAGE_TAGLIB
+
 config BR2_PACKAGE_TAGLIB_MP4
-	depends on BR2_PACKAGE_TAGLIB
 	bool "taglib mp4 support"
 
 config BR2_PACKAGE_TAGLIB_ASF
-	depends on BR2_PACKAGE_TAGLIB
 	bool "taglib wma support"
 
+endif
+
 comment "taglib needs a toolchain w/ C++"
 	depends on !BR2_INSTALL_LIBSTDCPP
diff --git a/package/tcl/Config.in b/package/tcl/Config.in
index 7a4d887..5dcf63d 100644
--- a/package/tcl/Config.in
+++ b/package/tcl/Config.in
@@ -5,10 +5,11 @@ config BR2_PACKAGE_TCL
 
 	  http://www.tcl.tk
 
+if BR2_PACKAGE_TCL
+
 config BR2_PACKAGE_TCL_DEL_ENCODINGS
 	bool "delete encodings (saves 1.4Mb)"
 	default y
-	depends on BR2_PACKAGE_TCL
 	help
 	  Delete encoding files for TCL. If your programs do not use
 	  various tcl character recoding functions, you may safely
@@ -19,9 +20,10 @@ config BR2_PACKAGE_TCL_DEL_ENCODINGS
 config BR2_PACKAGE_TCL_SHLIB_ONLY
 	bool "install only shared library"
 	default y
-	depends on BR2_PACKAGE_TCL
 	help
 	  Install only TCL shared library and not binary tcl
 	  interpreter(tclsh8.4).
 
 	  Saves ~14kb.
+
+endif
diff --git a/package/tcpdump/Config.in b/package/tcpdump/Config.in
index c284398..8b54c60 100644
--- a/package/tcpdump/Config.in
+++ b/package/tcpdump/Config.in
@@ -6,8 +6,11 @@ config BR2_PACKAGE_TCPDUMP
 
 	  http://www.tcpdump.org/
 
+if BR2_PACKAGE_TCPDUMP
+
 config BR2_PACKAGE_TCPDUMP_SMB
 	bool "smb dump support"
-	depends on BR2_PACKAGE_TCPDUMP
 	help
 	  enable possibly-buggy SMB printer
+
+endif
diff --git a/package/tiff/Config.in b/package/tiff/Config.in
index 7850965..3a929f7 100644
--- a/package/tiff/Config.in
+++ b/package/tiff/Config.in
@@ -60,16 +60,14 @@ config BR2_PACKAGE_TIFF_JBIG
 	default y
 endmenu
 
-endif
-
 config BR2_PACKAGE_TIFF_TIFF2PDF
 	bool "tiff2pdf"
-	depends on BR2_PACKAGE_TIFF
 	help
 	  tiff2pdf utility
 
 config BR2_PACKAGE_TIFF_TIFFCP
 	bool "tiffcp"
-	depends on BR2_PACKAGE_TIFF
 	help
 	  tiffcp utility
+
+endif
diff --git a/package/tzdata/Config.in b/package/tzdata/Config.in
index 72615d3..1be6814 100644
--- a/package/tzdata/Config.in
+++ b/package/tzdata/Config.in
@@ -9,9 +9,10 @@ config BR2_PACKAGE_TZDATA
 
 	  http://www.iana.org/time-zones/repository/tz-link.html
 
+if BR2_PACKAGE_TZDATA
+
 config BR2_PACKAGE_TZDATA_ZONELIST
 	string "Time zone list"
-	depends on BR2_PACKAGE_TZDATA
 	default "default"
 	help
 	  Space-separated list of time zones to compile.
@@ -21,3 +22,5 @@ config BR2_PACKAGE_TZDATA_ZONELIST
 
 	  The full list is the list of files in the time zone database source,
 	  not including the build and .tab files.
+
+endif
diff --git a/package/udpcast/Config.in b/package/udpcast/Config.in
index 0543b4b..e9425da 100644
--- a/package/udpcast/Config.in
+++ b/package/udpcast/Config.in
@@ -13,19 +13,20 @@ comment "udpcast needs a toolchain w/ largefile, threads"
 	depends on BR2_USE_MMU
 	depends on !BR2_LARGEFILE || !BR2_TOOLCHAIN_HAS_THREADS
 
+if BR2_PACKAGE_UDPCAST
+
 menu "udpcast tools selection"
-depends on BR2_PACKAGE_UDPCAST
 
 config BR2_PACKAGE_UDPCAST_SENDER
 	bool "sender"
-	depends on BR2_PACKAGE_UDPCAST
 	help
 	  The udpcast transmitter.
 
 config BR2_PACKAGE_UDPCAST_RECEIVER
 	bool "receiver"
-	depends on BR2_PACKAGE_UDPCAST
 	help
 	  The udpcast receiver.
 
 endmenu
+
+endif
diff --git a/package/usbutils/Config.in b/package/usbutils/Config.in
index 8f0b8f5..a64e674 100644
--- a/package/usbutils/Config.in
+++ b/package/usbutils/Config.in
@@ -7,9 +7,10 @@ config BR2_PACKAGE_USBUTILS
 
 	  http://linux-usb.sourceforge.net/
 
+if BR2_PACKAGE_USBUTILS
+
 config BR2_PACKAGE_USBUTILS_ZLIB
 	bool "compressed data support"
-	depends on BR2_PACKAGE_USBUTILS
 	select BR2_PACKAGE_ZLIB
 	help
 	  Enable use of zlib for a compressed usb.ids.gz
@@ -17,5 +18,7 @@ config BR2_PACKAGE_USBUTILS_ZLIB
 	  filesystem, but it also makes lsusb slower since it has
 	  to decompress the file every time it's run.
 
+endif
+
 comment "usbutils needs a toolchain w/ threads"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/vim/Config.in b/package/vim/Config.in
index 0b2f4b5..6f24da9 100644
--- a/package/vim/Config.in
+++ b/package/vim/Config.in
@@ -8,10 +8,13 @@ config BR2_PACKAGE_VIM
 
 	  http://www.vim.org/
 
+if BR2_PACKAGE_VIM
+
 config BR2_PACKAGE_VIM_RUNTIME
 	bool "install runtime"
 	default y
-	depends on BR2_PACKAGE_VIM
 	help
 	  Install VIM runtime (syntax highlighing + macros).
 	  This option adds about 15MB of data to /usr/share/
+
+endif
diff --git a/package/wireless_tools/Config.in b/package/wireless_tools/Config.in
index c51ee9b..0840187 100644
--- a/package/wireless_tools/Config.in
+++ b/package/wireless_tools/Config.in
@@ -5,8 +5,11 @@ config BR2_PACKAGE_WIRELESS_TOOLS
 
 	  http://www.hpl.hp.com/personal/Jean_Tourrilhes/Linux/Tools.html
 
+if BR2_PACKAGE_WIRELESS_TOOLS
+
 config BR2_PACKAGE_WIRELESS_TOOLS_LIB
 	bool "Install shared library"
-	depends on BR2_PACKAGE_WIRELESS_TOOLS
 	help
 	  The shared library of wireless tools
+
+endif
diff --git a/package/zeromq/Config.in b/package/zeromq/Config.in
index a74ce88..1c53f7e 100644
--- a/package/zeromq/Config.in
+++ b/package/zeromq/Config.in
@@ -27,12 +27,15 @@ config BR2_PACKAGE_ZEROMQ
 
 	  http://www.zeromq.org/
 
+if BR2_PACKAGE_ZEROMQ
+
 config BR2_PACKAGE_ZEROMQ_PGM
 	bool "PGM/EPGM support"
-	depends on BR2_PACKAGE_ZEROMQ
 	depends on !BR2_avr32 # openpgm
 	select BR2_PACKAGE_OPENPGM
 	help
 	  Add support for Pragmatic General Multicast protocol (RFC 3208)
 	  implemented either over raw IP packets or UDP datagrams
 	  (encapsulated PGM). This requires OpenPGM library.
+
+endif
