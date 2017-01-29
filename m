From: Gwenhael Goavec-Merou <gwenj@trabucayre.com>
Date: Sun, 29 Jan 2017 12:27:59 +0100
Subject: [Buildroot] [PATCH v3] gqrx: new package
Message-ID: <20170129112759.1690-1-gwenj@trabucayre.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>

Gqrx is an open source software defined radio (SDR) receiver implemented
using GNU Radio and the Qt GUI toolkit. Currently it works on Linux
and Mac with hardware supported by gr-osmosdr, including Funcube Dongle,
RTL-SDR, Airspy, HackRF, BladeRF, RFSpace, USRP and SoapySDR.

Gqrx can operate as an AM/FM/SSB receiver with audio output or as an
FFT-only instrument. There are also various hooks for interacting
with external application using network sockets.

Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
---
Changes v2 -> v3:
 * backport patch to fix Wmisleading-indentation with gcc6;
 * inherits alsa-lib or portaudio dependencies from gr-audio;
 * reduce help text size;
 * add upstream url.
Changes v1 -> v2:
 * typo
---
 package/Config.in                                |  1 +
 package/gqrx/0001-fix_compilation_in_gcc-6.patch | 34 ++++++++++++++++++++++
 package/gqrx/Config.in                           | 36 ++++++++++++++++++++++++
 package/gqrx/gqrx.hash                           |  2 ++
 package/gqrx/gqrx.mk                             | 15 ++++++++++
 5 files changed, 88 insertions(+)
 create mode 100644 package/gqrx/0001-fix_compilation_in_gcc-6.patch
 create mode 100644 package/gqrx/Config.in
 create mode 100644 package/gqrx/gqrx.hash
 create mode 100644 package/gqrx/gqrx.mk

diff --git a/package/Config.in b/package/Config.in
index 8c8c33e..a4341e5 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1429,6 +1429,7 @@ menu "Miscellaneous"
 	source "package/empty/Config.in"
 	source "package/gnuradio/Config.in"
 	source "package/googlefontdirectory/Config.in"
+	source "package/gqrx/Config.in"
 	source "package/gr-osmosdr/Config.in"
 	source "package/gsettings-desktop-schemas/Config.in"
 	source "package/haveged/Config.in"
diff --git a/package/gqrx/0001-fix_compilation_in_gcc-6.patch b/package/gqrx/0001-fix_compilation_in_gcc-6.patch
new file mode 100644
index 0000000..e1824c3
--- /dev/null
+++ b/package/gqrx/0001-fix_compilation_in_gcc-6.patch
@@ -0,0 +1,34 @@
+From e6baaee4968345a53e977f593362267a91041cff Mon Sep 17 00:00:00 2001
+From: Valentin Ochs <a@0au.de>
+Date: Fri, 21 Oct 2016 20:12:50 +0200
+Subject: [PATCH 05/34] Cosmetic & readability changes
+
+Backport patch from
+https://github.com/csete/gqrx/commit/e6baaee4968345a53e977f593362267a91041cff
+
+Fix compilation in gcc-6
+
+Signed-off-by: Valentin Ochs <a@0au.de>
+Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
+---
+diff --git a/src/qtgui/plotter.cpp b/src/qtgui/plotter.cpp
+index e491632..b877546 100644
+--- a/src/qtgui/plotter.cpp
++++ b/src/qtgui/plotter.cpp
+@@ -1336,8 +1336,11 @@ void CPlotter::drawOverlay()
+ #endif
+ 
+             int level = 0;
+-            for (; level < nLevels && tagEnd[level] > x; level++);
+-                level %= nLevels;
++            while(level < nLevels && tagEnd[level] > x)
++                level++;
++            
++            if(level == nLevels)
++                level = 0;
+ 
+             tagEnd[level] = x + nameWidth + slant - 1;
+             m_BookmarkTags.append(qMakePair<QRect, qint64>(QRect(x, level * levelHeight, nameWidth + slant, fontHeight), bookmarks[i].frequency));
+-- 
+2.10.2
+
diff --git a/package/gqrx/Config.in b/package/gqrx/Config.in
new file mode 100644
index 0000000..fadd5a2
--- /dev/null
+++ b/package/gqrx/Config.in
@@ -0,0 +1,36 @@
+comment "gqrx needs a toolchain w/ C++, threads, wchar, dynamic library"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || \
+		!BR2_USE_WCHAR || BR2_STATIC_LIBS
+
+comment "gqrx needs gnuradio, fftw's single precision, alsa-lib or portaudio"
+	depends on !BR2_PACKAGE_GNURADIO || !BR2_PACKAGE_FFTW_PRECISION_SINGLE || \
+		!(BR2_PACKAGE_ALSA_LIB || BR2_PACKAGE_PORTAUDIO)
+
+config BR2_PACKAGE_GQRX
+	bool "gqrx"
+	depends on BR2_PACKAGE_FFTW_PRECISION_SINGLE # gnuradio
+	depends on BR2_PACKAGE_GNURADIO
+	depends on BR2_PACKAGE_ALSA_LIB || BR2_PACKAGE_PORTAUDIO # gr-audio
+	depends on BR2_INSTALL_LIBSTDCPP # boost, qt5
+	depends on !BR2_STATIC_LIBS # qt5
+	depends on BR2_TOOLCHAIN_HAS_THREADS # boost, qt5
+	depends on BR2_USE_WCHAR # boost, qt5
+	select BR2_PACKAGE_BOOST
+	select BR2_PACKAGE_BOOST_PROGRAM_OPTIONS
+	select BR2_PACKAGE_BOOST_SYSTEM
+	select BR2_PACKAGE_GNURADIO_ANALOG
+	select BR2_PACKAGE_GNURADIO_AUDIO
+	select BR2_PACKAGE_GNURADIO_BLOCKS
+	select BR2_PACKAGE_GNURADIO_DIGITAL
+	select BR2_PACKAGE_GNURADIO_FFT
+	select BR2_PACKAGE_GNURADIO_FILTER
+	select BR2_PACKAGE_GR_OSMOSDR
+	select BR2_PACKAGE_QT5
+	select BR2_PACKAGE_QT5BASE_GUI
+	select BR2_PACKAGE_QT5BASE_WIDGETS
+	select BR2_PACKAGE_QT5SVG
+	help
+	  Gqrx is an open source software defined radio receiver (SDR) powered by
+	  the GNU Radio and the Qt graphical toolkit.
+
+	  http://gqrx.dk/
diff --git a/package/gqrx/gqrx.hash b/package/gqrx/gqrx.hash
new file mode 100644
index 0000000..2d126aa
--- /dev/null
+++ b/package/gqrx/gqrx.hash
@@ -0,0 +1,2 @@
+# Locally calculated:
+sha256 53d25db8d987a41ccccaf6fd85262bd7770cdfab5539b5901c4558756483c9db  gqrx-v2.6.tar.gz
diff --git a/package/gqrx/gqrx.mk b/package/gqrx/gqrx.mk
new file mode 100644
index 0000000..b591e60
--- /dev/null
+++ b/package/gqrx/gqrx.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# gqrx
+#
+################################################################################
+
+GQRX_VERSION = v2.6
+GQRX_SITE = $(call github,csete,gqrx,$(GQRX_VERSION))
+GQRX_LICENSE = GPLv3+, Apache-2.0
+GQRX_LICENSE_FILES = COPYING LICENSE-CTK
+GQRX_DEPENDENCIES = boost gnuradio gr-osmosdr qt5base qt5svg
+
+GQRX_CONF_OPTS = -DLINUX_AUDIO_BACKEND=Gr-audio
+
+$(eval $(cmake-package))
-- 
2.10.2
