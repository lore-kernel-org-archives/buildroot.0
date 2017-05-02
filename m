From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 2 May 2017 14:34:19 +0200
Subject: [Buildroot] [git commit] package/q*/Config.in: fix ordering of
	statements
Message-ID: <20170502123604.39F67801F5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cf1c12bdba037b4e28e2d7fcef0e653a45016408
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The check-package script when ran gives warnings on ordering issues
on all of these Config files.  This patch cleans up all warnings
related to the ordering in the Config files for packages starting with
the letter q in the package directory.

The appropriate ordering is: type, default, depends on, select, help
See http://nightly.buildroot.org/#_config_files for more information.

Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/qemu/Config.in.host               |  4 ++--
 package/qlibc/Config.in                   |  2 +-
 package/qt-webkit-kiosk/Config.in         |  8 ++++----
 package/qt/Config.gfx.in                  |  4 ++--
 package/qt/Config.in                      | 20 ++++++++++----------
 package/qt/Config.mouse.in                |  2 +-
 package/qt/Config.sql.in                  |  4 ++--
 package/qt5/Config.in                     |  4 ++--
 package/qt5/qt53d/Config.in               |  4 ++--
 package/qt5/qt5base/Config.in             | 10 +++++-----
 package/qt5/qt5canvas3d/Config.in         |  4 ++--
 package/qt5/qt5connectivity/Config.in     |  2 +-
 package/qt5/qt5declarative/Config.in      |  4 ++--
 package/qt5/qt5graphicaleffects/Config.in |  4 ++--
 package/qt5/qt5quickcontrols/Config.in    |  4 ++--
 package/qt5/qt5quickcontrols2/Config.in   |  4 ++--
 package/qt5/qt5script/Config.in           |  2 +-
 package/qt5/qt5webkit/Config.in           | 10 +++++-----
 package/qt5/qt5x11extras/Config.in        |  2 +-
 package/qt5cinex/Config.in                | 10 +++++-----
 20 files changed, 54 insertions(+), 54 deletions(-)

diff --git a/package/qemu/Config.in.host b/package/qemu/Config.in.host
index b3eb590..71f38ef 100644
--- a/package/qemu/Config.in.host
+++ b/package/qemu/Config.in.host
@@ -1,13 +1,13 @@
 config BR2_PACKAGE_HOST_QEMU
 	bool "host qemu"
-	select BR2_PACKAGE_HOST_QEMU_LINUX_USER_MODE \
-	       if !BR2_PACKAGE_HOST_QEMU_SYSTEM_MODE
 	depends on BR2_arm       || BR2_armeb       || BR2_aarch64      || \
 		BR2_i386         || BR2_m68k        || BR2_microblazeel || \
 		BR2_microblazebe || BR2_mips        || BR2_mipsel       || \
 		BR2_mips64       || BR2_mips64el    || BR2_powerpc      || \
 		BR2_powerpc64    || BR2_powerpc64le || BR2_sh           || \
 		BR2_sparc        || BR2_x86_64
+	select BR2_PACKAGE_HOST_QEMU_LINUX_USER_MODE \
+		if !BR2_PACKAGE_HOST_QEMU_SYSTEM_MODE
 	help
 	  QEMU is a generic and open source machine emulator and virtualizer.
 
diff --git a/package/qlibc/Config.in b/package/qlibc/Config.in
index 170da49..ad6f1fe 100644
--- a/package/qlibc/Config.in
+++ b/package/qlibc/Config.in
@@ -1,9 +1,9 @@
 config BR2_PACKAGE_QLIBC
 	bool "qlibc"
-	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_WCHAR
 	depends on !BR2_STATIC_LIBS
+	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 	help
 	  qLibc is currently one of the most functionally complete
 	  public licensed C/C++ libraries. The C/C++ library which
diff --git a/package/qt-webkit-kiosk/Config.in b/package/qt-webkit-kiosk/Config.in
index 1b0e0de..703f128 100644
--- a/package/qt-webkit-kiosk/Config.in
+++ b/package/qt-webkit-kiosk/Config.in
@@ -1,15 +1,15 @@
 config BR2_PACKAGE_QT_WEBKIT_KIOSK
 	bool "qt-webkit-kiosk"
 	depends on BR2_PACKAGE_QT5
+	depends on !BR2_STATIC_LIBS # qt5webkit
+	depends on BR2_PACKAGE_QT5_JSCORE_AVAILABLE # qt5webkit
+	depends on !BR2_BINFMT_FLAT # qt5webkit
+	depends on !BR2_MIPS_SOFT_FLOAT # qt5webkit
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_QT5BASE_GUI
 	select BR2_PACKAGE_QT5BASE_WIDGETS
 	select BR2_PACKAGE_QT5WEBKIT
 	select BR2_PACKAGE_QT5MULTIMEDIA
-	depends on !BR2_STATIC_LIBS # qt5webkit
-	depends on BR2_PACKAGE_QT5_JSCORE_AVAILABLE # qt5webkit
-	depends on !BR2_BINFMT_FLAT # qt5webkit
-	depends on !BR2_MIPS_SOFT_FLOAT # qt5webkit
 	help
 	  Simple kiosk-mode browser powered by Qt5Webkit
 
diff --git a/package/qt/Config.gfx.in b/package/qt/Config.gfx.in
index 70adeef..5e6619c 100644
--- a/package/qt/Config.gfx.in
+++ b/package/qt/Config.gfx.in
@@ -20,12 +20,12 @@ comment "directfb Qt driver not available (need directfb)"
 	depends on !BR2_PACKAGE_DIRECTFB
 
 config BR2_PACKAGE_QT_GFX_DIRECTFB
-	depends on BR2_PACKAGE_DIRECTFB
 	bool "directFB"
+	depends on BR2_PACKAGE_DIRECTFB
 
 config BR2_PACKAGE_QT_GFX_POWERVR
+	bool "powervr"
 	depends on BR2_PACKAGE_QT_OPENGL_ES
 	depends on BR2_PACKAGE_HAS_POWERVR
-	bool "powervr"
 
 endmenu
diff --git a/package/qt/Config.in b/package/qt/Config.in
index d3a01da..5e9f898 100644
--- a/package/qt/Config.in
+++ b/package/qt/Config.in
@@ -123,9 +123,9 @@ config BR2_PACKAGE_QT_QT3SUPPORT
 
 config BR2_PACKAGE_QT_GUI_MODULE
 	bool "Gui Module"
+	default y
 	depends on !BR2_TOOLCHAIN_HAS_BINUTILS_BUG_19405 # nios2 Binutils 2.25.1 bug
 	select BR2_PACKAGE_QT_NETWORK
-	default y
 	help
 	  Turns on support for Gui applications. If your board doesn't have
 	  video output, or you don't require Qt GUI, say n.
@@ -176,8 +176,8 @@ menu "Fonts"
 
 config BR2_PACKAGE_QT_FONT_TRUETYPE
 	bool "dejavu/vera"
-	depends on BR2_PACKAGE_QT_QTFREETYPE || BR2_PACKAGE_QT_SYSTEMFREETYPE
 	default y
+	depends on BR2_PACKAGE_QT_QTFREETYPE || BR2_PACKAGE_QT_SYSTEMFREETYPE
 
 comment "dejavu/vera fonts need freetype support"
 	depends on !BR2_PACKAGE_QT_QTFREETYPE && !BR2_PACKAGE_QT_SYSTEMFREETYPE
@@ -255,8 +255,8 @@ config BR2_PACKAGE_QT_NOJPEG
 	  Disable JPEG support
 
 config BR2_PACKAGE_QT_SYSTEMJPEG
-	select BR2_PACKAGE_JPEG
 	bool "System libjpeg"
+	select BR2_PACKAGE_JPEG
 	help
 	  Link against system libjpeg
 
@@ -335,9 +335,9 @@ endif
 
 config BR2_PACKAGE_QT_PHONON
 	bool "Phonon Module"
+	default y
 	depends on BR2_PACKAGE_GSTREAMER
 	select BR2_PACKAGE_GST_PLUGINS_BASE
-	default y
 	help
 	  Build the Phonon module. Support for different audio/video
 	  formats can be configured at the GStreamer package.
@@ -355,9 +355,9 @@ config BR2_PACKAGE_QT_PHONON_BACKEND
 
 config BR2_PACKAGE_QT_OPENGL
 	bool "OpenGL support"
+	default y
 	depends on (BR2_PACKAGE_HAS_LIBGL && BR2_PACKAGE_QT_X11) || \
 		   (BR2_PACKAGE_HAS_LIBEGL && BR2_PACKAGE_HAS_LIBGLES)
-	default y
 	help
 	  This option enables OpenGL support.
 
@@ -393,9 +393,9 @@ endif
 
 config BR2_PACKAGE_QT_DBUS
 	bool "DBus Module"
-	select BR2_PACKAGE_DBUS
 	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus
 	depends on BR2_USE_MMU # dbus
+	select BR2_PACKAGE_DBUS
 	help
 	  Build the Qt DBus module.
 
@@ -425,8 +425,8 @@ config BR2_PACKAGE_QT_MULTIMEDIA
 config BR2_PACKAGE_QT_AUDIO_BACKEND
 	bool "QtMultimedia Audio backend"
 	depends on BR2_PACKAGE_QT_MULTIMEDIA
-	select BR2_PACKAGE_ALSA_LIB
 	depends on BR2_TOOLCHAIN_HAS_THREADS # alsa-lib
+	select BR2_PACKAGE_ALSA_LIB
 	help
 	  Build the ALSA audio backend into QtMultimedia
 
@@ -446,7 +446,6 @@ config BR2_PACKAGE_QT_NETWORK
 
 config BR2_PACKAGE_QT_ARCH_SUPPORTS_WEBKIT
 	bool
-	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	# see src/3rdparty/webkit/Source/JavaScriptCore/wtf/Platform.h
 	# see http://lists.busybox.net/pipermail/buildroot/2014-November/112605.html
 	default y if BR2_arc || BR2_arm || BR2_armeb || BR2_i386 || BR2_microblazeel || \
@@ -457,6 +456,7 @@ config BR2_PACKAGE_QT_ARCH_SUPPORTS_WEBKIT
 	# with an assertion failure in binutils.
 	default y if (BR2_sh4 || BR2_sh4eb || BR2_sh4a || BR2_sh4aeb) && \
 		!BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 
 config BR2_PACKAGE_QT_WEBKIT
 	bool "WebKit Module"
@@ -502,19 +502,19 @@ config BR2_PACKAGE_QT_OPENSSL
 
 config BR2_PACKAGE_QT_ARCH_SUPPORTS_SCRIPT
 	bool
-	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	# see http://lists.busybox.net/pipermail/buildroot/2014-November/112605.html
 	default y if BR2_arc || BR2_arm || BR2_armeb || BR2_aarch64 || BR2_i386 || \
 		BR2_microblazeel || BR2_microblazebe || BR2_mips || BR2_mipsel || \
 		BR2_mips64 || BR2_mips64el || BR2_nios2 || BR2_powerpc || \
 		BR2_powerpc64 || BR2_powerpc64le || BR2_sh4 || BR2_sh4eb || \
 		BR2_sh4a || BR2_sh4aeb || BR2_x86_64
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 
 config BR2_PACKAGE_QT_SCRIPT
 	bool "Script Module"
+	default y
 	depends on BR2_PACKAGE_QT_ARCH_SUPPORTS_SCRIPT
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # needs pthread_getattr_np()
-	default y
 	help
 	  Build the Qt Script module.
 	  if unsure, say y.
diff --git a/package/qt/Config.mouse.in b/package/qt/Config.mouse.in
index 11da956..07573eb 100644
--- a/package/qt/Config.mouse.in
+++ b/package/qt/Config.mouse.in
@@ -11,8 +11,8 @@ config BR2_PACKAGE_QT_MOUSE_LINUXINPUT
 
 config BR2_PACKAGE_QT_MOUSE_TSLIB
 	bool "tslib"
-	select BR2_PACKAGE_TSLIB
 	depends on !BR2_STATIC_LIBS # tslib
+	select BR2_PACKAGE_TSLIB
 
 comment "tslib support needs a toolchain w/ dynamic library"
 	depends on BR2_STATIC_LIBS
diff --git a/package/qt/Config.sql.in b/package/qt/Config.sql.in
index 5bd63d2..6d39bb9 100644
--- a/package/qt/Config.sql.in
+++ b/package/qt/Config.sql.in
@@ -6,10 +6,10 @@ menuconfig BR2_PACKAGE_QT_SQL_MODULE
 if BR2_PACKAGE_QT_SQL_MODULE
 config BR2_PACKAGE_QT_MYSQL
 	bool "MySQL Driver"
+	depends on BR2_USE_MMU # mysql
 	select BR2_PACKAGE_MYSQL
 	select BR2_PACKAGE_NCURSES
 	select BR2_PACKAGE_READLINE
-	depends on BR2_USE_MMU # mysql
 	help
 	  Build MySQL driver
 	  If unsure, say n.
@@ -23,8 +23,8 @@ config BR2_PACKAGE_QT_ODBC
 
 config BR2_PACKAGE_QT_PSQL
 	bool "PostgreSQL Driver"
-	select BR2_PACKAGE_POSTGRESQL
 	depends on !BR2_STATIC_LIBS
+	select BR2_PACKAGE_POSTGRESQL
 	help
 	  Build PostgreSQL driver
 	  If unsure, say n.
diff --git a/package/qt5/Config.in b/package/qt5/Config.in
index 626e9b2..04dccea 100644
--- a/package/qt5/Config.in
+++ b/package/qt5/Config.in
@@ -1,15 +1,15 @@
 config BR2_PACKAGE_QT5_GL_AVAILABLE
 	bool
-	depends on BR2_PACKAGE_HAS_LIBGL || BR2_PACKAGE_HAS_LIBGLES
 	default y
+	depends on BR2_PACKAGE_HAS_LIBGL || BR2_PACKAGE_HAS_LIBGLES
 
 config BR2_PACKAGE_QT5_JSCORE_AVAILABLE
 	bool
+	default y
 	# Javascript engine is only available on certain architectures
 	depends on BR2_arm || BR2_i386 || BR2_x86_64 || BR2_mipsel
 	# ARM needs BLX, so v5t+
 	depends on !BR2_ARM_CPU_ARMV4
-	default y
 
 comment "Qt5 needs a toolchain w/ wchar, NPTL, C++, dynamic library"
 	depends on !BR2_PACKAGE_QT
diff --git a/package/qt5/qt53d/Config.in b/package/qt5/qt53d/Config.in
index 27f27a8..f776da2 100644
--- a/package/qt5/qt53d/Config.in
+++ b/package/qt5/qt53d/Config.in
@@ -1,11 +1,11 @@
 config BR2_PACKAGE_QT53D
 	bool "qt53d"
+	depends on BR2_PACKAGE_QT5_JSCORE_AVAILABLE # qt5declarative
+	depends on BR2_PACKAGE_QT5_GL_AVAILABLE # qt5declarative_quick
 	select BR2_PACKAGE_QT5BASE
 	select BR2_PACKAGE_QT5BASE_GUI
 	select BR2_PACKAGE_QT5DECLARATIVE
 	select BR2_PACKAGE_QT5DECLARATIVE_QUICK
-	depends on BR2_PACKAGE_QT5_JSCORE_AVAILABLE # qt5declarative
-	depends on BR2_PACKAGE_QT5_GL_AVAILABLE # qt5declarative_quick
 	help
 	  Qt is a cross-platform application and UI framework for
 	  developers using C++.
diff --git a/package/qt5/qt5base/Config.in b/package/qt5/qt5base/Config.in
index 4796fdb..5d1ff13 100644
--- a/package/qt5/qt5base/Config.in
+++ b/package/qt5/qt5base/Config.in
@@ -61,19 +61,19 @@ config BR2_PACKAGE_QT5BASE_SQL
 if BR2_PACKAGE_QT5BASE_SQL
 config BR2_PACKAGE_QT5BASE_MYSQL
 	bool "MySQL Plugin"
+	depends on BR2_USE_MMU # mysql
 	select BR2_PACKAGE_MYSQL
 	select BR2_PACKAGE_NCURSES
 	select BR2_PACKAGE_READLINE
-	depends on BR2_USE_MMU # mysql
 	help
 	  Build MySQL plugin
 	  If unsure, say n.
 
 config BR2_PACKAGE_QT5BASE_PSQL
 	bool "PostgreSQL Plugin"
-	select BR2_PACKAGE_POSTGRESQL
 	depends on BR2_USE_MMU # postgresql
 	depends on !BR2_STATIC_LIBS
+	select BR2_PACKAGE_POSTGRESQL
 	help
 	  Build PostgreSQL plugin
 	  If unsure, say n.
@@ -198,9 +198,9 @@ comment "X.org XCB backend available if X.org is enabled"
 
 config BR2_PACKAGE_QT5BASE_EGLFS
 	bool "eglfs support"
-	select BR2_PACKAGE_QT5BASE_OPENGL
 	depends on BR2_PACKAGE_HAS_LIBEGL
 	depends on BR2_PACKAGE_QT5_GL_AVAILABLE
+	select BR2_PACKAGE_QT5BASE_OPENGL
 
 comment "eglfs backend available if OpenGL and EGL are enabled"
 	depends on !BR2_PACKAGE_HAS_LIBEGL || !BR2_PACKAGE_QT5_GL_AVAILABLE
@@ -250,16 +250,16 @@ endif
 
 config BR2_PACKAGE_QT5BASE_DBUS
 	bool "DBus module"
-	select BR2_PACKAGE_DBUS
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_MMU
+	select BR2_PACKAGE_DBUS
 	help
 	  This option enables the D-Bus module.
 
 config BR2_PACKAGE_QT5BASE_ICU
 	bool "Enable ICU support"
-	select BR2_PACKAGE_ICU
 	depends on !BR2_BINFMT_FLAT # icu
+	select BR2_PACKAGE_ICU
 	help
 	  This option enables ICU support in Qt5. This is for example
 	  needed for Qt5Webkit.
diff --git a/package/qt5/qt5canvas3d/Config.in b/package/qt5/qt5canvas3d/Config.in
index 8058a2e..04c0473 100644
--- a/package/qt5/qt5canvas3d/Config.in
+++ b/package/qt5/qt5canvas3d/Config.in
@@ -1,9 +1,9 @@
 config BR2_PACKAGE_QT5CANVAS3D
 	bool "qt5canvas3d"
-	select BR2_PACKAGE_QT5DECLARATIVE
-	select BR2_PACKAGE_QT5DECLARATIVE_QUICK
 	depends on BR2_PACKAGE_QT5_GL_AVAILABLE
 	depends on BR2_PACKAGE_QT5_JSCORE_AVAILABLE
+	select BR2_PACKAGE_QT5DECLARATIVE
+	select BR2_PACKAGE_QT5DECLARATIVE_QUICK
 	help
 	  Qt is a cross-platform application and UI framework for
 	  developers using C++.
diff --git a/package/qt5/qt5connectivity/Config.in b/package/qt5/qt5connectivity/Config.in
index 8903fc9..8bda8de 100644
--- a/package/qt5/qt5connectivity/Config.in
+++ b/package/qt5/qt5connectivity/Config.in
@@ -1,9 +1,9 @@
 config BR2_PACKAGE_QT5CONNECTIVITY
 	bool "qt5connectivity"
+	depends on BR2_PACKAGE_NEARD || BR2_PACKAGE_BLUEZ_UTILS || BR2_PACKAGE_BLUEZ5_UTILS
 	select BR2_PACKAGE_QT5BASE
 	select BR2_PACKAGE_QT5BASE_CONCURRENT
 	select BR2_PACKAGE_QT5BASE_DBUS
-	depends on BR2_PACKAGE_NEARD || BR2_PACKAGE_BLUEZ_UTILS || BR2_PACKAGE_BLUEZ5_UTILS
 	help
 	  Qt is a cross-platform application and UI framework for
 	  developers using C++.
diff --git a/package/qt5/qt5declarative/Config.in b/package/qt5/qt5declarative/Config.in
index 853322c..5384b5f 100644
--- a/package/qt5/qt5declarative/Config.in
+++ b/package/qt5/qt5declarative/Config.in
@@ -1,9 +1,9 @@
 config BR2_PACKAGE_QT5DECLARATIVE
 	bool "qt5declarative"
+	depends on BR2_PACKAGE_QT5_JSCORE_AVAILABLE
 	select BR2_PACKAGE_QT5XMLPATTERNS
 	select BR2_PACKAGE_QT5BASE
 	select BR2_PACKAGE_QT5BASE_GUI
-	depends on BR2_PACKAGE_QT5_JSCORE_AVAILABLE
 	help
 	  Qt is a cross-platform application and UI framework for
 	  developers using C++.
@@ -21,7 +21,7 @@ comment "quick module needs an OpenGL-capable backend"
 
 config BR2_PACKAGE_QT5DECLARATIVE_QUICK
 	bool "quick module"
-	select BR2_PACKAGE_QT5BASE_OPENGL
 	depends on BR2_PACKAGE_QT5_GL_AVAILABLE
+	select BR2_PACKAGE_QT5BASE_OPENGL
 
 endif
diff --git a/package/qt5/qt5graphicaleffects/Config.in b/package/qt5/qt5graphicaleffects/Config.in
index df23425..69b7fca 100644
--- a/package/qt5/qt5graphicaleffects/Config.in
+++ b/package/qt5/qt5graphicaleffects/Config.in
@@ -1,9 +1,9 @@
 config BR2_PACKAGE_QT5GRAPHICALEFFECTS
 	bool "qt5graphicaleffects"
-	select BR2_PACKAGE_QT5DECLARATIVE
-	select BR2_PACKAGE_QT5DECLARATIVE_QUICK
 	depends on BR2_PACKAGE_QT5_GL_AVAILABLE
 	depends on BR2_PACKAGE_QT5_JSCORE_AVAILABLE
+	select BR2_PACKAGE_QT5DECLARATIVE
+	select BR2_PACKAGE_QT5DECLARATIVE_QUICK
 	help
 	  Qt is a cross-platform application and UI framework for
 	  developers using C++.
diff --git a/package/qt5/qt5quickcontrols/Config.in b/package/qt5/qt5quickcontrols/Config.in
index 3ab6ded..3cc5821 100644
--- a/package/qt5/qt5quickcontrols/Config.in
+++ b/package/qt5/qt5quickcontrols/Config.in
@@ -1,9 +1,9 @@
 config BR2_PACKAGE_QT5QUICKCONTROLS
 	bool "qt5quickcontrols"
-	select BR2_PACKAGE_QT5DECLARATIVE
-	select BR2_PACKAGE_QT5DECLARATIVE_QUICK
 	depends on BR2_PACKAGE_QT5_GL_AVAILABLE
 	depends on BR2_PACKAGE_QT5_JSCORE_AVAILABLE
+	select BR2_PACKAGE_QT5DECLARATIVE
+	select BR2_PACKAGE_QT5DECLARATIVE_QUICK
 	help
 	  Qt is a cross-platform application and UI framework for
 	  developers using C++.
diff --git a/package/qt5/qt5quickcontrols2/Config.in b/package/qt5/qt5quickcontrols2/Config.in
index adf89d0..1066b17 100644
--- a/package/qt5/qt5quickcontrols2/Config.in
+++ b/package/qt5/qt5quickcontrols2/Config.in
@@ -1,9 +1,9 @@
 config BR2_PACKAGE_QT5QUICKCONTROLS2
 	bool "qt5quickcontrols2"
-	select BR2_PACKAGE_QT5DECLARATIVE
-	select BR2_PACKAGE_QT5DECLARATIVE_QUICK
 	depends on BR2_PACKAGE_QT5_GL_AVAILABLE # qt5declarative/quick
 	depends on BR2_PACKAGE_QT5_JSCORE_AVAILABLE # qt5declarative/quick
+	select BR2_PACKAGE_QT5DECLARATIVE
+	select BR2_PACKAGE_QT5DECLARATIVE_QUICK
 	help
 	  Qt is a cross-platform application and UI framework for
 	  developers using C++.
diff --git a/package/qt5/qt5script/Config.in b/package/qt5/qt5script/Config.in
index ad19727..034b7d2 100644
--- a/package/qt5/qt5script/Config.in
+++ b/package/qt5/qt5script/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_QT5SCRIPT
 	bool "qt5script"
-	select BR2_PACKAGE_QT5BASE
 	depends on BR2_PACKAGE_QT5_JSCORE_AVAILABLE
+	select BR2_PACKAGE_QT5BASE
 	help
 	  Qt is a cross-platform application and UI framework for
 	  developers using C++.
diff --git a/package/qt5/qt5webkit/Config.in b/package/qt5/qt5webkit/Config.in
index 2534360..637996a 100644
--- a/package/qt5/qt5webkit/Config.in
+++ b/package/qt5/qt5webkit/Config.in
@@ -1,16 +1,16 @@
 config BR2_PACKAGE_QT5WEBKIT
 	bool "qt5webkit"
+	depends on !BR2_STATIC_LIBS
+	depends on BR2_PACKAGE_QT5_JSCORE_AVAILABLE
+	depends on !BR2_BINFMT_FLAT # icu
+	# assumes a FPU is available on MIPS
+	depends on !BR2_MIPS_SOFT_FLOAT
 	select BR2_PACKAGE_QT5BASE
 	select BR2_PACKAGE_QT5BASE_ICU
 	select BR2_PACKAGE_QT5BASE_GUI
 	select BR2_PACKAGE_SQLITE
 	select BR2_PACKAGE_XLIB_LIBXEXT if BR2_PACKAGE_QT5BASE_XCB
 	select BR2_PACKAGE_XLIB_LIBXRENDER if BR2_PACKAGE_QT5BASE_XCB
-	depends on !BR2_STATIC_LIBS
-	depends on BR2_PACKAGE_QT5_JSCORE_AVAILABLE
-	depends on !BR2_BINFMT_FLAT # icu
-	# assumes a FPU is available on MIPS
-	depends on !BR2_MIPS_SOFT_FLOAT
 	help
 	  Qt is a cross-platform application and UI framework for
 	  developers using C++.
diff --git a/package/qt5/qt5x11extras/Config.in b/package/qt5/qt5x11extras/Config.in
index 9c514cd..ff4cc11 100644
--- a/package/qt5/qt5x11extras/Config.in
+++ b/package/qt5/qt5x11extras/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_QT5X11EXTRAS
 	bool "qt5x11extras"
-	select BR2_PACKAGE_QT5BASE_WIDGETS
 	depends on BR2_PACKAGE_QT5BASE_XCB
+	select BR2_PACKAGE_QT5BASE_WIDGETS
 	help
 	  Qt is a cross-platform application and UI framework for
 	  developers using C++.
diff --git a/package/qt5cinex/Config.in b/package/qt5cinex/Config.in
index b273231..5adf6c3 100644
--- a/package/qt5cinex/Config.in
+++ b/package/qt5cinex/Config.in
@@ -6,16 +6,16 @@ comment "qt5cinex needs an Open(E)GL-capable backend"
 config BR2_PACKAGE_QT5CINEX
 	bool "qt5cinex"
 	depends on BR2_PACKAGE_QT5
-	select BR2_PACKAGE_QT5BASE_NETWORK
-	select BR2_PACKAGE_QT5BASE_PNG
-	select BR2_PACKAGE_QT5BASE_WIDGETS
-	select BR2_PACKAGE_QT5BASE_EGLFS
-	select BR2_PACKAGE_QT5GRAPHICALEFFECTS
 	depends on BR2_PACKAGE_HAS_LIBEGL # qt5base-eglfs
 	depends on BR2_PACKAGE_QT5_GL_AVAILABLE
 	# No comment needed for this option, it's an architecture
 	# dependency.
 	depends on BR2_PACKAGE_QT5_JSCORE_AVAILABLE
+	select BR2_PACKAGE_QT5BASE_NETWORK
+	select BR2_PACKAGE_QT5BASE_PNG
+	select BR2_PACKAGE_QT5BASE_WIDGETS
+	select BR2_PACKAGE_QT5BASE_EGLFS
+	select BR2_PACKAGE_QT5GRAPHICALEFFECTS
 	help
 	  This application demonstrates the power of Qt5 and few of the new
 	  additions available in QtQuick 2.0.
