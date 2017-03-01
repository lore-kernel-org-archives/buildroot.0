From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 01 Mar 2017 17:04:21 -0000
Subject: [Buildroot] [git commit] gqrx: new package
Message-ID: <20170301170420.A764A800CE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=193d83ebd8e334ff6760ff50e0da8dfd4bc12cab
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Gqrx is an open source software defined radio (SDR) receiver implemented
using GNU Radio and the Qt GUI toolkit. Currently it works on Linux
and Mac with hardware supported by gr-osmosdr, including Funcube Dongle,
RTL-SDR, Airspy, HackRF, BladeRF, RFSpace, USRP and SoapySDR.

Gqrx can operate as an AM/FM/SSB receiver with audio output or as an
FFT-only instrument. There are also various hooks for interacting
with external application using network sockets.

Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
Reviewed-by: Romain Naour <romain.naour@gmail.com>
[Thomas:
 - remove unneeded dependency from Config.in, inherited from Qt5
 - add entry to DEVELOPERS file.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 DEVELOPERS                                       |  1 +
 package/Config.in                                |  1 +
 package/gqrx/0001-fix_compilation_in_gcc-6.patch | 34 +++++++++++++++++++
 package/gqrx/Config.in                           | 43 ++++++++++++++++++++++++
 package/gqrx/gqrx.hash                           |  2 ++
 package/gqrx/gqrx.mk                             | 15 +++++++++
 6 files changed, 96 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 94f6804..ef96145 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -744,6 +744,7 @@ F:	package/zd1211-firmware/
 
 N:	Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
 F:	package/gnuradio/
+F:	package/gqrx/
 F:	package/gr-osmosdr/
 F:	package/libusbgx/
 F:	package/python-cheetah/
diff --git a/package/Config.in b/package/Config.in
index deff0fe..e78fb75 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1451,6 +1451,7 @@ menu "Miscellaneous"
 	source "package/empty/Config.in"
 	source "package/gnuradio/Config.in"
 	source "package/googlefontdirectory/Config.in"
+	source "package/gqrx/Config.in"
 	source "package/gr-osmosdr/Config.in"
 	source "package/gsettings-desktop-schemas/Config.in"
 	source "package/haveged/Config.in"
diff --git a/package/gqrx/0001-fix_compilation_in_gcc-6.patch b/package/gqrx/0001-fix_compilation_in_gcc-6.patch
new file mode 100644
index 0000000..22ec1ef
--- /dev/null
+++ b/package/gqrx/0001-fix_compilation_in_gcc-6.patch
@@ -0,0 +1,34 @@
+From e6baaee4968345a53e977f593362267a91041cff Mon Sep 17 00:00:00 2001
+From: Valentin Ochs <a@0au.de>
+Date: Fri, 21 Oct 2016 20:12:50 +0200
+Subject: [PATCH] Cosmetic & readability changes
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
index 0000000..5f7a561
--- /dev/null
+++ b/package/gqrx/Config.in
@@ -0,0 +1,43 @@
+comment "gqrx needs a toolchain w/ C++, threads, wchar"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || \
+		!BR2_USE_WCHAR
+
+comment "gqrx needs qt5, gnuradio, fftw's single precision, alsa-lib or portaudio"
+	depends on !BR2_PACKAGE_GNURADIO || !BR2_PACKAGE_FFTW_PRECISION_SINGLE || \
+		!(BR2_PACKAGE_ALSA_LIB || BR2_PACKAGE_PORTAUDIO) || !BR2_PACKAGE_QT5
+
+config BR2_PACKAGE_GQRX
+	bool "gqrx"
+	depends on BR2_PACKAGE_ALSA_LIB || BR2_PACKAGE_PORTAUDIO # gr-audio
+	depends on BR2_PACKAGE_FFTW_PRECISION_SINGLE # gnuradio
+	depends on BR2_PACKAGE_GNURADIO
+	depends on BR2_PACKAGE_QT5
+	depends on BR2_INSTALL_LIBSTDCPP # boost
+	depends on BR2_TOOLCHAIN_HAS_THREADS # boost
+	depends on BR2_USE_WCHAR # boost
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
+	select BR2_PACKAGE_QT5BASE_GUI
+	select BR2_PACKAGE_QT5BASE_WIDGETS
+	select BR2_PACKAGE_QT5SVG
+	help
+	  Gqrx is an open source software defined radio (SDR) receiver
+	  implemented using GNU Radio and the Qt GUI
+	  toolkit. Currently it works on Linux and Mac with hardware
+	  supported by gr-osmosdr, including Funcube Dongle, RTL-SDR,
+	  Airspy, HackRF, BladeRF, RFSpace, USRP and SoapySDR.
+
+	  Gqrx can operate as an AM/FM/SSB receiver with audio output
+	  or as an FFT-only instrument. There are also various hooks
+	  for interacting with external application using network
+	  sockets.
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
