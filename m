From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 15 Apr 2018 22:05:30 +0200
Subject: [Buildroot] [git commit] package: remove Blackfin related code
Message-ID: <20180415200629.712A6886C4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7a03caaa1364e661df1f3249379d3ce8bf2f4fac
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/acpitool/Config.in                     | 2 --
 package/alsa-lib/alsa-lib.mk                   | 6 ------
 package/armadillo/Config.in                    | 2 --
 package/atest/Config.in                        | 2 --
 package/avrdude/Config.in                      | 2 --
 package/busybox/Config.in                      | 2 --
 package/clapack/Config.in                      | 4 ----
 package/dvblast/Config.in                      | 2 --
 package/elfutils/Config.in                     | 4 ----
 package/gptfdisk/Config.in                     | 1 -
 package/gstreamer/gst-plugins-bad/Config.in    | 1 -
 package/gstreamer1/gst1-plugins-good/Config.in | 2 --
 package/iprutils/Config.in                     | 1 -
 package/leveldb/Config.in                      | 3 ---
 package/libbsd/Config.in                       | 1 -
 package/libev/Config.in                        | 2 --
 package/libfreeimage/Config.in                 | 3 ---
 package/libmicrohttpd/libmicrohttpd.mk         | 9 ++++-----
 package/libnspr/Config.in                      | 2 +-
 package/libvpx/Config.in                       | 2 --
 package/libxslt/libxslt.mk                     | 6 ------
 package/linux-tools/Config.in                  | 1 -
 package/lua-ev/Config.in                       | 1 -
 package/micropython/Config.in                  | 3 ---
 package/mplayer/Config.in                      | 2 +-
 package/ncurses/Config.in                      | 2 --
 package/pciutils/Config.in                     | 2 --
 package/poco/Config.in                         | 4 ++--
 package/powertop/Config.in                     | 2 --
 package/ptpd2/ptpd2.mk                         | 6 ------
 package/qemu/qemu.mk                           | 1 -
 package/riemann-c-client/riemann-c-client.mk   | 5 -----
 package/ruby/ruby.mk                           | 7 -------
 package/sg3_utils/Config.in                    | 2 --
 package/tvheadend/Config.in                    | 2 +-
 package/xenomai/Config.in                      | 2 +-
 36 files changed, 10 insertions(+), 91 deletions(-)

diff --git a/package/acpitool/Config.in b/package/acpitool/Config.in
index a6f082cc5c..2600a789b0 100644
--- a/package/acpitool/Config.in
+++ b/package/acpitool/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_ACPITOOL
 	bool "acpitool"
-	depends on !BR2_bfin
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_INSTALL_LIBSTDCPP
@@ -11,6 +10,5 @@ config BR2_PACKAGE_ACPITOOL
 	  http://acpitool.sourceforge.net
 
 comment "acpitool needs a toolchain w/ threads, C++, dynamic library"
-	depends on !BR2_bfin
 	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS \
 		|| !BR2_INSTALL_LIBSTDCPP
diff --git a/package/alsa-lib/alsa-lib.mk b/package/alsa-lib/alsa-lib.mk
index 39be1bf005..98fc486e2d 100644
--- a/package/alsa-lib/alsa-lib.mk
+++ b/package/alsa-lib/alsa-lib.mk
@@ -62,12 +62,6 @@ else
 ALSA_LIB_CONF_OPTS += --disable-python
 endif
 
-ifeq ($(BR2_bfin),y)
-# blackfin external toolchains don't have versionsort. Fake it using alphasort
-# instead
-ALSA_LIB_CFLAGS += -Dversionsort=alphasort
-endif
-
 ALSA_LIB_CONF_ENV = \
 	CFLAGS="$(ALSA_LIB_CFLAGS)" \
 	LDFLAGS="$(TARGET_LDFLAGS) -lm"
diff --git a/package/armadillo/Config.in b/package/armadillo/Config.in
index 9483f181cf..47c7cd9ffd 100644
--- a/package/armadillo/Config.in
+++ b/package/armadillo/Config.in
@@ -2,7 +2,6 @@ comment "armadillo needs a toolchain w/ C++"
 	depends on !BR2_INSTALL_LIBSTDCPP
 	depends on !(BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el)
 	depends on !BR2_powerpc
-	depends on !BR2_bfin
 	depends on !BR2_m68k_cf
 
 comment "armadillo needs a glibc toolchain w/ C++"
@@ -14,7 +13,6 @@ config BR2_PACKAGE_ARMADILLO
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on !(BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el) # clapack
 	depends on !BR2_powerpc || BR2_TOOLCHAIN_USES_GLIBC # clapack
-	depends on !BR2_bfin # clapack
 	depends on !BR2_m68k_cf # clapack
 	select BR2_PACKAGE_CLAPACK
 	help
diff --git a/package/atest/Config.in b/package/atest/Config.in
index 9a2e342a1e..647b2163ea 100644
--- a/package/atest/Config.in
+++ b/package/atest/Config.in
@@ -1,7 +1,6 @@
 config BR2_PACKAGE_ATEST
 	bool "atest"
 	depends on BR2_TOOLCHAIN_HAS_THREADS # alsa-lib
-	depends on !BR2_bfin # libev
 	select BR2_PACKAGE_ALSA_LIB
 	select BR2_PACKAGE_LIBEV
 	help
@@ -11,5 +10,4 @@ config BR2_PACKAGE_ATEST
 	  https://github.com/amouiche/atest
 
 comment "atest needs a toolchain w/ threads"
-	depends on !BR2_bfin
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/avrdude/Config.in b/package/avrdude/Config.in
index 3757f17a1e..a5680b0028 100644
--- a/package/avrdude/Config.in
+++ b/package/avrdude/Config.in
@@ -3,7 +3,6 @@ config BR2_PACKAGE_AVRDUDE
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_WCHAR # elfutils
 	depends on !BR2_STATIC_LIBS # elfutils
-	depends on !BR2_bfin # elfutils
 	depends on BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_GLIBC # elfutils
 	select BR2_PACKAGE_ELFUTILS
 	select BR2_PACKAGE_LIBUSB
@@ -18,4 +17,3 @@ config BR2_PACKAGE_AVRDUDE
 comment "avrdude needs a uClibc or glibc toolchain w/ threads, wchar, dynamic library"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR || BR2_STATIC_LIBS \
 		|| !(BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_GLIBC)
-	depends on !BR2_bfin
diff --git a/package/busybox/Config.in b/package/busybox/Config.in
index ca8fe68eea..e5c5f89a4d 100644
--- a/package/busybox/Config.in
+++ b/package/busybox/Config.in
@@ -59,7 +59,6 @@ config BR2_PACKAGE_BUSYBOX_SELINUX
 config BR2_PACKAGE_BUSYBOX_INDIVIDUAL_BINARIES
 	bool "Individual binaries"
 	depends on !BR2_STATIC_LIBS
-	depends on !BR2_bfin # libbusybox.so link issue
 	help
 	  By default (i.e with this option disabled), Busybox is
 	  installed as a single binary in /bin/busybox and all applets
@@ -70,7 +69,6 @@ config BR2_PACKAGE_BUSYBOX_INDIVIDUAL_BINARIES
 
 comment "Busybox individual binaries need a toolchain w/ dynamic library"
 	depends on BR2_STATIC_LIBS
-	depends on !BR2_bfin
 
 config BR2_PACKAGE_BUSYBOX_WATCHDOG
 	bool "Install the watchdog daemon startup script"
diff --git a/package/clapack/Config.in b/package/clapack/Config.in
index e5be0b6441..af7834d985 100644
--- a/package/clapack/Config.in
+++ b/package/clapack/Config.in
@@ -8,10 +8,6 @@ config BR2_PACKAGE_CLAPACK
 	# _fpu_control is used on PowerPC, but not available with
 	# uClibc or musl
 	depends on !BR2_powerpc || BR2_TOOLCHAIN_USES_GLIBC
-	# disable clapack on blackfin, it triggers "undefined symbol" failure
-	# because of the "_" symbol prefix:
-	# http://autobuild.buildroot.net/results/a28df0ba10803e6e54c2f8160bbd8190cba4d690/
-	depends on !BR2_bfin
 	# assembler: Error: value out of range
 	depends on !BR2_m68k_cf
 	help
diff --git a/package/dvblast/Config.in b/package/dvblast/Config.in
index c358531edc..5597faea4f 100644
--- a/package/dvblast/Config.in
+++ b/package/dvblast/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_DVBLAST
 	bool "dvblast"
-	depends on !BR2_bfin  # libev
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # clock_nanosleep()
 	select BR2_PACKAGE_BITSTREAM
 	select BR2_PACKAGE_LIBEV
@@ -12,5 +11,4 @@ config BR2_PACKAGE_DVBLAST
 	  http://www.videolan.org/projects/dvblast.html
 
 comment "dvblast needs a toolchain w/ NPTL"
-	depends on !BR2_bfin  # libev
 	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL
diff --git a/package/elfutils/Config.in b/package/elfutils/Config.in
index ad86c313d6..6c8bd0b058 100644
--- a/package/elfutils/Config.in
+++ b/package/elfutils/Config.in
@@ -1,5 +1,4 @@
 comment "elfutils needs a uClibc or glibc toolchain w/ wchar, dynamic library"
-	depends on !BR2_bfin
 	depends on !BR2_USE_WCHAR || BR2_STATIC_LIBS \
 		|| !(BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_GLIBC)
 
@@ -9,9 +8,6 @@ config BR2_PACKAGE_ELFUTILS
 	depends on !BR2_STATIC_LIBS
 	# Only glibc and uClibc implement the myriad of required GNUisms
 	depends on BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_GLIBC
-	# build issue caused by the _ prefix used on blackfin for
-	# assembly symbols
-	depends on !BR2_bfin
 	select BR2_PACKAGE_ZLIB
 	select BR2_PACKAGE_ARGP_STANDALONE if BR2_TOOLCHAIN_USES_UCLIBC
 	help
diff --git a/package/gptfdisk/Config.in b/package/gptfdisk/Config.in
index ede72f3b1d..8d94d2bcf8 100644
--- a/package/gptfdisk/Config.in
+++ b/package/gptfdisk/Config.in
@@ -38,7 +38,6 @@ config BR2_PACKAGE_GPTFDISK_SGDISK
 config BR2_PACKAGE_GPTFDISK_CGDISK
 	bool "ncurses cgdisk"
 	depends on BR2_USE_WCHAR # ncurses wchar
-	depends on !(BR2_bfin && BR2_BINFMT_FLAT) # ncurses wchar support
 	select BR2_PACKAGE_NCURSES
 	select BR2_PACKAGE_NCURSES_WCHAR # needed because of UTF-16
 	help
diff --git a/package/gstreamer/gst-plugins-bad/Config.in b/package/gstreamer/gst-plugins-bad/Config.in
index 939fc7a7fa..7bbd56a602 100644
--- a/package/gstreamer/gst-plugins-bad/Config.in
+++ b/package/gstreamer/gst-plugins-bad/Config.in
@@ -318,7 +318,6 @@ config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_VCD
 
 config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_VP8
 	bool "vp8"
-	depends on !BR2_bfin # libvpx
 	select BR2_PACKAGE_LIBVPX
 
 config BR2_PACKAGE_GST_PLUGINS_BAD_ZBAR
diff --git a/package/gstreamer1/gst1-plugins-good/Config.in b/package/gstreamer1/gst1-plugins-good/Config.in
index 097f32d779..eea3a3eda8 100644
--- a/package/gstreamer1/gst1-plugins-good/Config.in
+++ b/package/gstreamer1/gst1-plugins-good/Config.in
@@ -359,14 +359,12 @@ comment "taglib needs a toolchain w/ C++, wchar"
 
 config BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_VPX
 	bool "vpx (webm)"
-	depends on !BR2_bfin # libvpx
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libvpx
 	select BR2_PACKAGE_LIBVPX
 	help
 	  VP8 plugin
 
 comment "libvpx needs a toolchain w/ threads"
-	depends on !BR2_bfin
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
 
 config BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_WAVPACK
diff --git a/package/iprutils/Config.in b/package/iprutils/Config.in
index 0143b53ae6..2938da0ee0 100644
--- a/package/iprutils/Config.in
+++ b/package/iprutils/Config.in
@@ -1,7 +1,6 @@
 config BR2_PACKAGE_IPRUTILS
 	bool "iprutils"
 	depends on BR2_USE_MMU # fork()
-	depends on !BR2_bfin # pciutils
 	select BR2_PACKAGE_NCURSES
 	select BR2_PACKAGE_LIBSYSFS
 	select BR2_PACKAGE_PCIUTILS
diff --git a/package/leveldb/Config.in b/package/leveldb/Config.in
index c44ef13ca7..163a75e8f2 100644
--- a/package/leveldb/Config.in
+++ b/package/leveldb/Config.in
@@ -1,7 +1,5 @@
 config BR2_PACKAGE_LEVELDB
 	bool "leveldb"
-	# Missing/broken atomic pointer support
-	depends on !BR2_bfin
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_PACKAGE_SNAPPY
@@ -13,5 +11,4 @@ config BR2_PACKAGE_LEVELDB
 	  https://github.com/google/leveldb
 
 comment "leveldb needs a toolchain w/ C++, threads"
-	depends on !BR2_bfin
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/libbsd/Config.in b/package/libbsd/Config.in
index 47fce04fef..a163ce9b6f 100644
--- a/package/libbsd/Config.in
+++ b/package/libbsd/Config.in
@@ -5,7 +5,6 @@ config BR2_PACKAGE_LIBBSD_ARCH_SUPPORTS
 	depends on !BR2_microblaze
 	depends on !BR2_arc
 	depends on !BR2_xtensa
-	depends on !BR2_bfin
 
 config BR2_PACKAGE_LIBBSD
 	bool "libbsd"
diff --git a/package/libev/Config.in b/package/libev/Config.in
index db8d263df0..71abe7737d 100644
--- a/package/libev/Config.in
+++ b/package/libev/Config.in
@@ -1,7 +1,5 @@
 config BR2_PACKAGE_LIBEV
 	bool "libev"
-	# needs memory fences
-	depends on !BR2_bfin
 	help
 	  Userspace library for handling asynchronous notifications
 
diff --git a/package/libfreeimage/Config.in b/package/libfreeimage/Config.in
index 4b462cb633..9bffd035b7 100644
--- a/package/libfreeimage/Config.in
+++ b/package/libfreeimage/Config.in
@@ -5,8 +5,6 @@ config BR2_PACKAGE_LIBFREEIMAGE
 	depends on BR2_USE_WCHAR
 	# compiler issue: "Error: invalid register number `63'"
 	depends on !BR2_arc
-	# Numerous build issues
-	depends on !BR2_bfin
 	help
 	  FreeImage is an Open Source library project for developers who
 	  would like to support popular graphics image formats like PNG,
@@ -17,5 +15,4 @@ config BR2_PACKAGE_LIBFREEIMAGE
 
 comment "libfreeimage needs a toolchain w/ C++, dynamic library, wchar"
 	depends on !BR2_arc
-	depends on !BR2_bfin
 	depends on BR2_STATIC_LIBS || !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR
diff --git a/package/libmicrohttpd/libmicrohttpd.mk b/package/libmicrohttpd/libmicrohttpd.mk
index 81785b91bc..1cda434819 100644
--- a/package/libmicrohttpd/libmicrohttpd.mk
+++ b/package/libmicrohttpd/libmicrohttpd.mk
@@ -11,11 +11,10 @@ LIBMICROHTTPD_INSTALL_STAGING = YES
 LIBMICROHTTPD_CONF_OPTS = --disable-curl --disable-examples
 LIBMICROHTTPD_CFLAGS = $(TARGET_CFLAGS) -std=c99
 
-# gcc on arc and bfin doesn't define _REENTRANT when -pthread is
-# passed while it should. Compensate this deficiency here otherwise
-# libmicrohttpd configure script doesn't find that thread support is
-# enabled.
-ifeq ($(BR2_arc)$(BR2_bfin),y)
+# gcc on arc doesn't define _REENTRANT when -pthread is passed while
+# it should. Compensate this deficiency here otherwise libmicrohttpd
+# configure script doesn't find that thread support is enabled.
+ifeq ($(BR2_arc),y)
 LIBMICROHTTPD_CFLAGS += -D_REENTRANT
 endif
 
diff --git a/package/libnspr/Config.in b/package/libnspr/Config.in
index ba1ea55933..1d95155248 100644
--- a/package/libnspr/Config.in
+++ b/package/libnspr/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_LIBNSPR_ARCH_SUPPORT
 	def_bool y
-	depends on !BR2_arc && !BR2_xtensa && !BR2_bfin
+	depends on !BR2_arc && !BR2_xtensa
 
 if BR2_PACKAGE_LIBNSPR_ARCH_SUPPORT
 
diff --git a/package/libvpx/Config.in b/package/libvpx/Config.in
index 67a4c578f4..6b0400c0a2 100644
--- a/package/libvpx/Config.in
+++ b/package/libvpx/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_LIBVPX
 	bool "libvpx"
-	depends on !BR2_bfin
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	help
 	  A high-quality, open video format that's freely available to
@@ -9,5 +8,4 @@ config BR2_PACKAGE_LIBVPX
 	  http://webmproject.org
 
 comment "libvpx needs a toolchain w/ threads"
-	depends on !BR2_bfin
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/libxslt/libxslt.mk b/package/libxslt/libxslt.mk
index d89dde8d00..868ba6a10f 100644
--- a/package/libxslt/libxslt.mk
+++ b/package/libxslt/libxslt.mk
@@ -19,12 +19,6 @@ LIBXSLT_CONF_OPTS = \
 LIBXSLT_CONFIG_SCRIPTS = xslt-config
 LIBXSLT_DEPENDENCIES = libxml2
 
-# GCC bug with Os/O2/O3, PR77311
-# error: unable to find a register to spill in class 'CCREGS'
-ifeq ($(BR2_bfin),y)
-LIBXSLT_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -O1"
-endif
-
 # If we have enabled libgcrypt then use it, else disable crypto support.
 ifeq ($(BR2_PACKAGE_LIBGCRYPT),y)
 LIBXSLT_DEPENDENCIES += libgcrypt
diff --git a/package/linux-tools/Config.in b/package/linux-tools/Config.in
index e3ccd850f9..5c5148af17 100644
--- a/package/linux-tools/Config.in
+++ b/package/linux-tools/Config.in
@@ -7,7 +7,6 @@ config BR2_PACKAGE_LINUX_TOOLS
 
 config BR2_PACKAGE_LINUX_TOOLS_CPUPOWER
 	bool "cpupower"
-	depends on !BR2_bfin # pciutils
 	select BR2_PACKAGE_LINUX_TOOLS
 	select BR2_PACKAGE_PCIUTILS
 	help
diff --git a/package/lua-ev/Config.in b/package/lua-ev/Config.in
index 0cb4c22a92..52f82e1128 100644
--- a/package/lua-ev/Config.in
+++ b/package/lua-ev/Config.in
@@ -1,7 +1,6 @@
 config BR2_PACKAGE_LUA_EV
 	bool "lua-ev"
 	depends on BR2_PACKAGE_HAS_LUAINTERPRETER
-	depends on !BR2_bfin # libev
 	select BR2_PACKAGE_LIBEV
 	help
 	  Get access to the libev library from Lua.
diff --git a/package/micropython/Config.in b/package/micropython/Config.in
index 00649d4fb6..b5dc47279d 100644
--- a/package/micropython/Config.in
+++ b/package/micropython/Config.in
@@ -2,8 +2,6 @@ config BR2_PACKAGE_MICROPYTHON
 	bool "micropython"
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on !BR2_STATIC_LIBS
-	# libffi doesn't provide the closure implementation on Blackfin
-	depends on !BR2_bfin
 	select BR2_PACKAGE_LIBFFI
 	help
 	  Micro Python is a lean and fast implementation of the Python
@@ -14,4 +12,3 @@ config BR2_PACKAGE_MICROPYTHON
 
 comment "micropython needs a toolchain w/ threads, dynamic library"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
-	depends on !BR2_bfin
diff --git a/package/mplayer/Config.in b/package/mplayer/Config.in
index 15c903ae7b..4db1551ed4 100644
--- a/package/mplayer/Config.in
+++ b/package/mplayer/Config.in
@@ -2,7 +2,7 @@ config BR2_PACKAGE_MPLAYER_ARCH_SUPPORTS
 	bool
 	default y
 	# Those architectures are not supported by MPlayer
-	depends on !(BR2_bfin || BR2_sh2a || BR2_sh4a || BR2_sh4aeb \
+	depends on !(BR2_sh2a || BR2_sh4a || BR2_sh4aeb \
 		|| BR2_m68k || BR2_microblaze || BR2_nios2 || BR2_or1k)
 	# Broken support for <ARMv5
 	depends on !BR2_ARM_CPU_ARMV4
diff --git a/package/ncurses/Config.in b/package/ncurses/Config.in
index 297b2ee415..9f7753b06a 100644
--- a/package/ncurses/Config.in
+++ b/package/ncurses/Config.in
@@ -13,8 +13,6 @@ if BR2_PACKAGE_NCURSES
 config BR2_PACKAGE_NCURSES_WCHAR
 	bool "enable wide char support"
 	depends on BR2_USE_WCHAR
-	# Build broken @ curses.priv.h with bad declarations
-	depends on !(BR2_bfin && BR2_BINFMT_FLAT)
 	help
 	  Enable wide char & UTF-8 support in ncurses libraries
 
diff --git a/package/pciutils/Config.in b/package/pciutils/Config.in
index d46df6c0d6..a082f23997 100644
--- a/package/pciutils/Config.in
+++ b/package/pciutils/Config.in
@@ -1,7 +1,5 @@
 config BR2_PACKAGE_PCIUTILS
 	bool "pciutils"
-	# PCI not supported on Blackfin
-	depends on !BR2_bfin
 	help
 	  Various utilities dealing with the PCI bus.
 	  Provides things like setpci and lspci.
diff --git a/package/poco/Config.in b/package/poco/Config.in
index b908ea220c..75e31b7e1e 100644
--- a/package/poco/Config.in
+++ b/package/poco/Config.in
@@ -5,7 +5,7 @@ config BR2_PACKAGE_POCO
 	# pthread_condattr_setclock
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	depends on !BR2_STATIC_LIBS # dlopen()
-	depends on !(BR2_arc || BR2_bfin || BR2_microblaze || BR2_mipsel \
+	depends on !(BR2_arc || BR2_microblaze || BR2_mipsel \
 		|| BR2_or1k || BR2_xtensa)
 	select BR2_PACKAGE_ZLIB
 	select BR2_PACKAGE_PCRE
@@ -82,5 +82,5 @@ endif # BR2_PACKAGE_POCO
 comment "poco needs a toolchain w/ wchar, NPTL, C++, dynamic library"
 	depends on !BR2_USE_WCHAR || !BR2_INSTALL_LIBSTDCPP \
 		|| !BR2_TOOLCHAIN_HAS_THREADS_NPTL || BR2_STATIC_LIBS
-	depends on !(BR2_arc || BR2_bfin || BR2_microblaze || BR2_mipsel \
+	depends on !(BR2_arc || BR2_microblaze || BR2_mipsel \
 		|| BR2_or1k || BR2_xtensa)
diff --git a/package/powertop/Config.in b/package/powertop/Config.in
index 714b16295a..0f323a7bfb 100644
--- a/package/powertop/Config.in
+++ b/package/powertop/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_POWERTOP
 	bool "powertop"
-	depends on !BR2_bfin # pciutils
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libnl
 	depends on BR2_USE_WCHAR
@@ -14,6 +13,5 @@ config BR2_PACKAGE_POWERTOP
 	  https://01.org/powertop/
 
 comment "powertop needs a toolchain w/ C++, threads, wchar"
-	depends on !BR2_bfin
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || \
 		!BR2_USE_WCHAR
diff --git a/package/ptpd2/ptpd2.mk b/package/ptpd2/ptpd2.mk
index d95d415bba..c0c414ae83 100644
--- a/package/ptpd2/ptpd2.mk
+++ b/package/ptpd2/ptpd2.mk
@@ -24,12 +24,6 @@ else
 PTPD2_CONF_OPTS += --disable-snmp
 endif
 
-# GCC bug with Os/O1/O2/O3
-# internal compiler error: in gen_add2_insn,@optabs.c:4454
-ifeq ($(BR2_bfin),y)
-PTPD2_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -O0"
-endif
-
 define PTPD2_INSTALL_INIT_SYSV
 	$(INSTALL) -m 755 -D package/ptpd2/S65ptpd2 \
 		$(TARGET_DIR)/etc/init.d/S65ptpd2
diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index c3a7e7738e..f6f4a2b870 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -22,7 +22,6 @@ HOST_QEMU_DEPENDENCIES = host-pkgconf host-python host-zlib host-libglib2 host-p
 #       -------         ----
 #       arm             arm
 #       armeb           armeb
-#       bfin            not supported
 #       i486            i386
 #       i586            i386
 #       i686            i386
diff --git a/package/riemann-c-client/riemann-c-client.mk b/package/riemann-c-client/riemann-c-client.mk
index 09f79009ed..b051145f45 100644
--- a/package/riemann-c-client/riemann-c-client.mk
+++ b/package/riemann-c-client/riemann-c-client.mk
@@ -16,9 +16,4 @@ RIEMANN_C_CLIENT_DEPENDENCIES = \
 	$(if $(BR2_PACKAGE_GNUTLS),gnutls) \
 	$(if $(BR2_PACKAGE_JSON_C),json-c)
 
-ifeq ($(BR2_bfin),y)
-# ld symbol versioning not working on bfin
-RIEMANN_C_CLIENT_CONF_ENV += ac_cv_prog_ld_version_script=no
-endif
-
 $(eval $(autotools-package))
diff --git a/package/ruby/ruby.mk b/package/ruby/ruby.mk
index 4bf1a14cee..365b8cead2 100644
--- a/package/ruby/ruby.mk
+++ b/package/ruby/ruby.mk
@@ -40,13 +40,6 @@ RUBY_CONF_ENV += \
 	ac_cv_func_isnan=yes
 endif
 
-ifeq ($(BR2_bfin),y)
-RUBY_CONF_ENV += ac_cv_func_dl_iterate_phdr=no
-# Blackfin doesn't have FFI closure support, needed by the fiddle
-# extension.
-RUBY_CONF_OPTS += --with-out-ext=fiddle
-endif
-
 ifeq ($(BR2_TOOLCHAIN_HAS_SSP),)
 RUBY_CONF_ENV += stack_protector=no
 endif
diff --git a/package/sg3_utils/Config.in b/package/sg3_utils/Config.in
index 4b74eda641..f4db4b9b99 100644
--- a/package/sg3_utils/Config.in
+++ b/package/sg3_utils/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_SG3_UTILS
 	bool "sg3-utils"
-	depends on !BR2_bfin # symbol prefixing problems
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	help
 	  Low level utilities for devices that use a SCSI command set.
@@ -16,5 +15,4 @@ config BR2_PACKAGE_SG3_UTILS_PROGS
 endif
 
 comment "sg3-utils needs a toolchain w/ threads"
-	depends on !BR2_bfin
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/tvheadend/Config.in b/package/tvheadend/Config.in
index de37b61483..5db644400c 100644
--- a/package/tvheadend/Config.in
+++ b/package/tvheadend/Config.in
@@ -37,7 +37,7 @@ config BR2_PACKAGE_TVHEADEND_TRANSCODING
 	select BR2_PACKAGE_FFMPEG_AVRESAMPLE
 	select BR2_PACKAGE_FFMPEG_GPL # needed for x264 support
 	select BR2_PACKAGE_FFMPEG_SWSCALE
-	select BR2_PACKAGE_LIBVPX if !BR2_bfin # libvpx
+	select BR2_PACKAGE_LIBVPX
 	select BR2_PACKAGE_X264
 	help
 	  Enable transcoding support.
diff --git a/package/xenomai/Config.in b/package/xenomai/Config.in
index e0118c1112..f3d8ea4baf 100644
--- a/package/xenomai/Config.in
+++ b/package/xenomai/Config.in
@@ -2,7 +2,7 @@ config BR2_PACKAGE_XENOMAI_ARCH_SUPPORTS
 	bool
 	default y
 	depends on BR2_i386 || BR2_x86_64 || (BR2_arm && !BR2_ARM_CPU_ARMV7M) || \
-		BR2_bfin || BR2_powerpc
+		BR2_powerpc
 
 comment "xenomai needs an glibc or uClibc toolchain w/ threads"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_TOOLCHAIN_USES_MUSL
