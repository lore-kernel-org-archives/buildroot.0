From: Adam Duskett <aduskett@gmail.com>
Date: Sat, 22 Apr 2017 13:17:54 -0400
Subject: [Buildroot] [PATCH v2 08/25] fix ordering on configs starting with
	'g'
In-Reply-To: <20170422171811.1346-1-Adamduskett@outlook.com>
References: <20170422171811.1346-1-Adamduskett@outlook.com>
Message-ID: <20170422171811.1346-8-Adamduskett@outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The check-package script when ran gives warnings on ordering issues
on all of these Config files.  This patch cleans up all warnings
related to the ordering in the Config files for packages starting with
the letter g in the package directory.

The appropriate ordering is: type, default, depends on, select, help
See http://nightly.buildroot.org/#_config_files for more information.

Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
---
v1 -> v2:
  - Broke package up into just packages starting with the letter g.
  - Updated to work with new gdb/Config.in.host
  
 package/gdb/Config.in                          |  6 +++---
 package/gdb/Config.in.host                     |  4 ++--
 package/gesftpserver/Config.in                 |  2 +-
 package/glibmm/Config.in                       |  4 ++--
 package/gnupg/Config.in                        |  2 +-
 package/gnupg2/Config.in                       |  8 ++++----
 package/gnutls/Config.in                       |  2 +-
 package/gptfdisk/Config.in                     |  4 ++--
 package/gstreamer/gst-fsl-plugins/Config.in    | 16 ++++++++--------
 package/gstreamer/gst-plugins-bad/Config.in    |  4 ++--
 package/gstreamer/gst-plugins-good/Config.in   |  2 +-
 package/gstreamer1/gst1-plugins-bad/Config.in  | 10 +++++-----
 package/gstreamer1/gst1-plugins-base/Config.in |  2 +-
 package/gstreamer1/gst1-plugins-good/Config.in |  6 +++---
 package/gstreamer1/gst1-vaapi/Config.in        |  6 +++---
 package/gupnp-tools/Config.in                  |  2 +-
 16 files changed, 40 insertions(+), 40 deletions(-)

diff --git a/package/gdb/Config.in b/package/gdb/Config.in
index 809e02d..026cdea 100644
--- a/package/gdb/Config.in
+++ b/package/gdb/Config.in
@@ -4,13 +4,13 @@ comment "gdb/gdbserver needs a toolchain w/ threads, threads debug"
 
 config BR2_PACKAGE_GDB
 	bool "gdb"
+	depends on BR2_TOOLCHAIN_HAS_THREADS && BR2_TOOLCHAIN_HAS_THREADS_DEBUG
+	depends on !BR2_nios2 && !BR2_bfin
 	# When the external toolchain gdbserver is copied to the
 	# target, we don't allow building a separate gdbserver. The
 	# one from the external toolchain should be used.
 	select BR2_PACKAGE_GDB_SERVER if \
 		(!BR2_PACKAGE_GDB_DEBUGGER && !BR2_TOOLCHAIN_EXTERNAL_GDB_SERVER_COPY)
-	depends on BR2_TOOLCHAIN_HAS_THREADS && BR2_TOOLCHAIN_HAS_THREADS_DEBUG
-	depends on !BR2_nios2 && !BR2_bfin
 	help
 	  GDB, the GNU Project debugger, allows you to see what is
 	  going on `inside' another program while it executes -- or
@@ -38,9 +38,9 @@ config BR2_PACKAGE_GDB_SERVER
 
 config BR2_PACKAGE_GDB_DEBUGGER
 	bool "full debugger"
-	select BR2_PACKAGE_NCURSES
 	depends on BR2_USE_WCHAR
 	depends on !BR2_sh && !BR2_microblaze
+	select BR2_PACKAGE_NCURSES
 
 comment "full gdb on target needs a toolchain w/ wchar"
 	depends on !BR2_sh && !BR2_microblaze
diff --git a/package/gdb/Config.in.host b/package/gdb/Config.in.host
index a059fdc..62b5b1a 100644
--- a/package/gdb/Config.in.host
+++ b/package/gdb/Config.in.host
@@ -33,9 +33,9 @@ config BR2_PACKAGE_HOST_GDB_SIM
 
 choice
 	prompt "GDB debugger Version"
+	default BR2_GDB_VERSION_7_11
 	depends on !BR2_arc
 	depends on !BR2_microblaze
-	default BR2_GDB_VERSION_7_11
 	help
 	  Select the version of gdb you wish to use.
 
@@ -55,9 +55,9 @@ endif
 # If cross-gdb is not enabled, the latest working version is chosen.
 config BR2_GDB_VERSION
 	string
-	depends on BR2_PACKAGE_GDB || BR2_PACKAGE_HOST_GDB
 	default "arc-2017.03-rc1-gdb" if BR2_arc
 	default "6be65fb56ea6694a9260733a536a023a1e2d4d57" if BR2_microblaze
 	default "7.10.1"   if BR2_GDB_VERSION_7_10
 	default "7.11.1"   if BR2_GDB_VERSION_7_11 || !BR2_PACKAGE_HOST_GDB
 	default "7.12.1"   if BR2_GDB_VERSION_7_12
+	depends on BR2_PACKAGE_GDB || BR2_PACKAGE_HOST_GDB
diff --git a/package/gesftpserver/Config.in b/package/gesftpserver/Config.in
index 81cbce9..bce4770 100644
--- a/package/gesftpserver/Config.in
+++ b/package/gesftpserver/Config.in
@@ -1,9 +1,9 @@
 config BR2_PACKAGE_GESFTPSERVER
 	bool "gesftpserver"
-	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 	depends on BR2_USE_WCHAR
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_MMU # fork()
+	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 	help
 	  Green End SFTP Server
 
diff --git a/package/glibmm/Config.in b/package/glibmm/Config.in
index fdbb438..7218db2 100644
--- a/package/glibmm/Config.in
+++ b/package/glibmm/Config.in
@@ -1,12 +1,12 @@
 config BR2_PACKAGE_GLIBMM
 	bool "glibmm"
-	select BR2_PACKAGE_LIBGLIB2
-	select BR2_PACKAGE_LIBSIGC
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # C++11
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_WCHAR # libglib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
 	depends on BR2_USE_MMU # libglib2
+	select BR2_PACKAGE_LIBGLIB2
+	select BR2_PACKAGE_LIBSIGC
 	help
 	  The GLibmm package is a set of C++ bindings for GLib.
 
diff --git a/package/gnupg/Config.in b/package/gnupg/Config.in
index 30f215f..7c31612 100644
--- a/package/gnupg/Config.in
+++ b/package/gnupg/Config.in
@@ -1,8 +1,8 @@
 config BR2_PACKAGE_GNUPG
 	bool "gnupg"
+	depends on !BR2_PACKAGE_GNUPG2
 	select BR2_PACKAGE_ZLIB
 	select BR2_PACKAGE_NCURSES
-	depends on !BR2_PACKAGE_GNUPG2
 	help
 	  GnuPG is the GNU project's complete and free implementation
 	  of the OpenPGP standard as defined by RFC4880. GnuPG allows
diff --git a/package/gnupg2/Config.in b/package/gnupg2/Config.in
index 85a9805..c287089 100644
--- a/package/gnupg2/Config.in
+++ b/package/gnupg2/Config.in
@@ -4,6 +4,10 @@ comment "gnupg2 needs a toolchain w/ threads and dynamic library support"
 
 config BR2_PACKAGE_GNUPG2
 	bool "gnupg2"
+	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS # libgpg-error
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libnpth
+	depends on BR2_USE_MMU # libassuan, libnpth
+	depends on !BR2_STATIC_LIBS
 	select BR2_PACKAGE_ZLIB
 	select BR2_PACKAGE_LIBGPG_ERROR
 	select BR2_PACKAGE_LIBGCRYPT
@@ -11,10 +15,6 @@ config BR2_PACKAGE_GNUPG2
 	select BR2_PACKAGE_LIBKSBA
 	select BR2_PACKAGE_LIBNPTH
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
-	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS # libgpg-error
-	depends on BR2_TOOLCHAIN_HAS_THREADS # libnpth
-	depends on BR2_USE_MMU # libassuan, libnpth
-	depends on !BR2_STATIC_LIBS
 	help
 	  GnuPG is the GNU project's complete and free implementation
 	  of the OpenPGP standard as defined by RFC4880. GnuPG allows
diff --git a/package/gnutls/Config.in b/package/gnutls/Config.in
index cfb7cb3..1af00cd 100644
--- a/package/gnutls/Config.in
+++ b/package/gnutls/Config.in
@@ -1,10 +1,10 @@
 config BR2_PACKAGE_GNUTLS
 	bool "gnutls"
+	depends on BR2_USE_WCHAR
 	select BR2_PACKAGE_LIBTASN1
 	select BR2_PACKAGE_LIBUNISTRING
 	select BR2_PACKAGE_NETTLE
 	select BR2_PACKAGE_PCRE
-	depends on BR2_USE_WCHAR
 	help
 	  GnuTLS is a secure communications library implementing the SSL
 	  and TLS protocols and technologies around them.
diff --git a/package/gptfdisk/Config.in b/package/gptfdisk/Config.in
index 22dc401..d243b90 100644
--- a/package/gptfdisk/Config.in
+++ b/package/gptfdisk/Config.in
@@ -35,10 +35,10 @@ config BR2_PACKAGE_GPTFDISK_SGDISK
 
 config BR2_PACKAGE_GPTFDISK_CGDISK
 	bool "ncurses cgdisk"
-	select BR2_PACKAGE_NCURSES
-	select BR2_PACKAGE_NCURSES_WCHAR # needed because of UTF-16
 	depends on BR2_USE_WCHAR # ncurses wchar
 	depends on !(BR2_bfin && BR2_BINFMT_FLAT) # ncurses wchar support
+	select BR2_PACKAGE_NCURSES
+	select BR2_PACKAGE_NCURSES_WCHAR # needed because of UTF-16
 	help
 	  Install the ncurses-based GUID partition table (GPT)
 	  manipulator /usr/sbin/cgdisk.
diff --git a/package/gstreamer/gst-fsl-plugins/Config.in b/package/gstreamer/gst-fsl-plugins/Config.in
index 8921aa3..85476b1 100644
--- a/package/gstreamer/gst-fsl-plugins/Config.in
+++ b/package/gstreamer/gst-fsl-plugins/Config.in
@@ -45,12 +45,12 @@ config BR2_PACKAGE_GST_FSL_PLUGINS_PLATFORM_MX233
 	bool "imx233"
 
 config BR2_PACKAGE_GST_FSL_PLUGINS_PLATFORM_MX25
-	select BR2_PACKAGE_IMX_LIB_PLATFORM_IMX25_3STACK
 	bool "imx25"
+	select BR2_PACKAGE_IMX_LIB_PLATFORM_IMX25_3STACK
 
 config BR2_PACKAGE_GST_FSL_PLUGINS_PLATFORM_MX27
-	select BR2_PACKAGE_IMX_LIB_PLATFORM_IMX27ADS
 	bool "imx27"
+	select BR2_PACKAGE_IMX_LIB_PLATFORM_IMX27ADS
 
 config BR2_PACKAGE_GST_FSL_PLUGINS_PLATFORM_MX28
 	bool "imx28"
@@ -62,28 +62,28 @@ config BR2_PACKAGE_GST_FSL_PLUGINS_PLATFORM_MX35
 	bool "imx35"
 
 config BR2_PACKAGE_GST_FSL_PLUGINS_PLATFORM_MX37
-	select BR2_PACKAGE_IMX_LIB_PLATFORM_IMX37_3STACK
 	bool "imx37"
+	select BR2_PACKAGE_IMX_LIB_PLATFORM_IMX37_3STACK
 
 config BR2_PACKAGE_GST_FSL_PLUGINS_PLATFORM_MX50
-	select BR2_PACKAGE_IMX_LIB_PLATFORM_IMX50
 	bool "imx50"
+	select BR2_PACKAGE_IMX_LIB_PLATFORM_IMX50
 
 config BR2_PACKAGE_GST_FSL_PLUGINS_PLATFORM_MX51
-	select BR2_PACKAGE_IMX_LIB_PLATFORM_IMX51
 	bool "imx51"
+	select BR2_PACKAGE_IMX_LIB_PLATFORM_IMX51
 
 config BR2_PACKAGE_GST_FSL_PLUGINS_PLATFORM_MX53
-	select BR2_PACKAGE_IMX_LIB_PLATFORM_IMX53
 	bool "imx53"
+	select BR2_PACKAGE_IMX_LIB_PLATFORM_IMX53
 
 config BR2_PACKAGE_GST_FSL_PLUGINS_PLATFORM_MX5X
-	select BR2_PACKAGE_IMX_LIB_PLATFORM_IMX5X
 	bool "imx5X"
+	select BR2_PACKAGE_IMX_LIB_PLATFORM_IMX5X
 
 config BR2_PACKAGE_GST_FSL_PLUGINS_PLATFORM_MX6
-	select BR2_PACKAGE_IMX_LIB_PLATFORM_IMX6Q
 	bool "imx6"
+	select BR2_PACKAGE_IMX_LIB_PLATFORM_IMX6Q
 
 endchoice
 
diff --git a/package/gstreamer/gst-plugins-bad/Config.in b/package/gstreamer/gst-plugins-bad/Config.in
index d54415a..939fc7a 100644
--- a/package/gstreamer/gst-plugins-bad/Config.in
+++ b/package/gstreamer/gst-plugins-bad/Config.in
@@ -57,8 +57,8 @@ config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_DEBUGUTILS
 	bool "debugutils"
 
 config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_DECKLINK
-	depends on BR2_INSTALL_LIBSTDCPP
 	bool "decklink"
+	depends on BR2_INSTALL_LIBSTDCPP
 
 comment "decklink needs a toolchain w/ C++"
 	depends on !BR2_INSTALL_LIBSTDCPP
@@ -261,8 +261,8 @@ config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_CURL
 
 config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_DIRECTFB
 	bool "directfb"
-	depends on BR2_PACKAGE_DIRECTFB
 	default y
+	depends on BR2_PACKAGE_DIRECTFB
 
 config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_DVB
 	bool "dvb"
diff --git a/package/gstreamer/gst-plugins-good/Config.in b/package/gstreamer/gst-plugins-good/Config.in
index 65f74e8..a36481a 100644
--- a/package/gstreamer/gst-plugins-good/Config.in
+++ b/package/gstreamer/gst-plugins-good/Config.in
@@ -201,12 +201,12 @@ config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_OSS4
 	bool "oss4 (Open Sound System 4)"
 
 config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_PULSE
+	bool "pulseaudio"
 	depends on BR2_TOOLCHAIN_HAS_THREADS # pulseaudio
 	depends on BR2_USE_MMU # pulseaudio
 	depends on !BR2_STATIC_LIBS # pulseaudio
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # pulseaudio -> json-c
 	select BR2_PACKAGE_PULSEAUDIO
-	bool "pulseaudio"
 
 comment "pulseaudio support needs a toolchain w/ threads, dynamic library"
 	depends on BR2_USE_MMU
diff --git a/package/gstreamer1/gst1-plugins-bad/Config.in b/package/gstreamer1/gst1-plugins-bad/Config.in
index 1db5187..17cc22b 100644
--- a/package/gstreamer1/gst1-plugins-bad/Config.in
+++ b/package/gstreamer1/gst1-plugins-bad/Config.in
@@ -489,8 +489,8 @@ config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_DASH
 	  DASH demuxer plugin
 
 config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_DECKLINK
-	depends on BR2_INSTALL_LIBSTDCPP
 	bool "decklink"
+	depends on BR2_INSTALL_LIBSTDCPP
 	help
 	  Blackmagic Decklink plugin
 
@@ -499,14 +499,14 @@ comment "decklink needs a toolchain w/ C++"
 
 config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_DIRECTFB
 	bool "directfb"
-	depends on BR2_PACKAGE_DIRECTFB
 	default y
+	depends on BR2_PACKAGE_DIRECTFB
 
 config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_DVB
 	bool "dvb"
-	select BR2_PACKAGE_DTV_SCAN_TABLES
 	# FEC_2_5 / QAM_4_NR definitions
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_7
+	select BR2_PACKAGE_DTV_SCAN_TABLES
 	help
 	  DVB elements
 
@@ -526,9 +526,9 @@ config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_FBDEV
 
 config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_FDK_AAC
 	bool "fdk-aac"
-	select BR2_PACKAGE_FDK_AAC
 	depends on BR2_PACKAGE_FDK_AAC_ARCH_SUPPORTS
 	depends on BR2_INSTALL_LIBSTDCPP
+	select BR2_PACKAGE_FDK_AAC
 	help
 	  MPEG AAC encoder/decoder
 
@@ -686,9 +686,9 @@ config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_VOAACENC
 
 config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_WAYLAND
 	bool "wayland"
+	default y
 	depends on BR2_PACKAGE_WAYLAND
 	select BR2_PACKAGE_WAYLAND_PROTOCOLS
-	default y
 	help
 	  Wayland Video Sink
 
diff --git a/package/gstreamer1/gst1-plugins-base/Config.in b/package/gstreamer1/gst1-plugins-base/Config.in
index 897c1d1..a17f2ad 100644
--- a/package/gstreamer1/gst1-plugins-base/Config.in
+++ b/package/gstreamer1/gst1-plugins-base/Config.in
@@ -54,9 +54,9 @@ config BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_GIO
 	  GIO elements
 
 config BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_PLAYBACK
-	select BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_TYPEFIND
 	bool "playback"
 	default y
+	select BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_TYPEFIND
 	help
 	  various playback elements
 
diff --git a/package/gstreamer1/gst1-plugins-good/Config.in b/package/gstreamer1/gst1-plugins-good/Config.in
index 27f24f5..9d23e9f 100644
--- a/package/gstreamer1/gst1-plugins-good/Config.in
+++ b/package/gstreamer1/gst1-plugins-good/Config.in
@@ -306,9 +306,9 @@ comment "flac needs a toolchain w/ wchar"
 
 config BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_GDKPIXBUF
 	bool "gdkpixbuf"
-	select BR2_PACKAGE_GDK_PIXBUF
 	depends on BR2_USE_WCHAR # gdk-pixbuf -> libglib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # gdk-pixbuf -> libglib2
+	select BR2_PACKAGE_GDK_PIXBUF
 	help
 	  GdkPixbuf-based image decoder, overlay and sink
 
@@ -316,12 +316,12 @@ comment "gdkpixbuf needs a toolchain w/ wchar, threads"
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
 
 config BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_PULSE
+	bool "pulseaudio"
 	depends on BR2_TOOLCHAIN_HAS_THREADS # pulseaudio
 	depends on BR2_USE_MMU # pulseaudio
 	depends on !BR2_STATIC_LIBS # pulseaudio
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # pulseaudio -> json-c
 	select BR2_PACKAGE_PULSEAUDIO
-	bool "pulseaudio"
 	help
 	  PulseAudio plugin library
 
@@ -360,9 +360,9 @@ comment "taglib needs a toolchain w/ C++, wchar"
 
 config BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_VPX
 	bool "vpx (webm)"
-	select BR2_PACKAGE_LIBVPX
 	depends on !BR2_bfin # libvpx
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libvpx
+	select BR2_PACKAGE_LIBVPX
 	help
 	  VP8 plugin
 
diff --git a/package/gstreamer1/gst1-vaapi/Config.in b/package/gstreamer1/gst1-vaapi/Config.in
index 0b8ae39..91bd4f8 100644
--- a/package/gstreamer1/gst1-vaapi/Config.in
+++ b/package/gstreamer1/gst1-vaapi/Config.in
@@ -1,12 +1,12 @@
 config BR2_PACKAGE_GST1_VAAPI
 	bool "gst1-vaapi"
+	depends on !BR2_STATIC_LIBS # dlopen(), libva
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libva, libdrm
+	depends on BR2_PACKAGE_HAS_UDEV
 	select BR2_PACKAGE_LIBVA
 	select BR2_PACKAGE_LIBDRM
 	select BR2_PACKAGE_GST1_PLUGINS_BASE
 	select BR2_PACKAGE_GST1_PLUGINS_BAD # gstreamer-codecparsers
-	depends on !BR2_STATIC_LIBS # dlopen(), libva
-	depends on BR2_TOOLCHAIN_HAS_THREADS # libva, libdrm
-	depends on BR2_PACKAGE_HAS_UDEV
 	help
 	  gstreamer-vaapi consists in a collection of VA-API based
 	  plugins for GStreamer and helper libraries.
diff --git a/package/gupnp-tools/Config.in b/package/gupnp-tools/Config.in
index f9e645a..af66241 100644
--- a/package/gupnp-tools/Config.in
+++ b/package/gupnp-tools/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_GUPNP_TOOLS
 	bool "gupnp-tools"
+	depends on BR2_PACKAGE_LIBGTK3
 	# gssdp, gupnp, libsoup all select on libglib2, so they have
 	# the same dependencies as libgtk3, which we depend on. So for
 	# the same of simplicity, we don't replicate all those
@@ -8,7 +9,6 @@ config BR2_PACKAGE_GUPNP_TOOLS
 	select BR2_PACKAGE_GUPNP
 	select BR2_PACKAGE_LIBSOUP
 	select BR2_PACKAGE_LIBXML2
-	depends on BR2_PACKAGE_LIBGTK3
 	help
 	  GUPnP Tools are free replacements of Intel UPnP tools that
 	  use GUPnP. They provides client and server side tools which
-- 
2.9.3
