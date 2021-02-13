From: Peter Seiderer <ps.report@gmx.net>
Date: Sat, 13 Feb 2021 18:40:13 +0100
Subject: [Buildroot] [RFC v1 6/6] package/qt6: new package
In-Reply-To: <20210213174013.32584-1-ps.report@gmx.net>
References: <20210213174013.32584-1-ps.report@gmx.net>
Message-ID: <20210213174013.32584-7-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

---
 package/Config.in                             |   1 +
 package/qt6/Config.in                         |  75 +++
 package/qt6/qt6.mk                            |  12 +
 ...disable-global-minimum-linux-support.patch |  55 ++
 ...-failure-with-multiline-toolchain-fi.patch |  48 ++
 package/qt6/qt6base/Config.in                 | 311 +++++++++++
 package/qt6/qt6base/qt6base.hash              |  10 +
 package/qt6/qt6base/qt6base.mk                | 496 ++++++++++++++++++
 8 files changed, 1008 insertions(+)
 create mode 100644 package/qt6/Config.in
 create mode 100644 package/qt6/qt6.mk
 create mode 100644 package/qt6/qt6base/0001-src-corelib-disable-global-minimum-linux-support.patch
 create mode 100644 package/qt6/qt6base/0002-QtAutoDetect-fix-failure-with-multiline-toolchain-fi.patch
 create mode 100644 package/qt6/qt6base/Config.in
 create mode 100644 package/qt6/qt6base/qt6base.hash
 create mode 100644 package/qt6/qt6base/qt6base.mk

diff --git a/package/Config.in b/package/Config.in
index 1ddd47f50a..9e012bafc4 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -354,6 +354,7 @@ comment "QT libraries and helper libraries"
 	source "package/quazip/Config.in"
 	source "package/qwt/Config.in"
 endif
+	source "package/qt6/Config.in"
 	source "package/tekui/Config.in"
 	source "package/weston/Config.in"
 	source "package/x11r7/Config.in"
diff --git a/package/qt6/Config.in b/package/qt6/Config.in
new file mode 100644
index 0000000000..5e3891dfcd
--- /dev/null
+++ b/package/qt6/Config.in
@@ -0,0 +1,75 @@
+#config BR2_PACKAGE_QT6_GL_AVAILABLE
+#	bool
+#	default y
+#	depends on BR2_PACKAGE_HAS_LIBGL || BR2_PACKAGE_HAS_LIBGLES
+
+#config BR2_PACKAGE_QT6_JSCORE_AVAILABLE
+#	bool
+#	default y
+#	# Javascript engine is only available on certain architectures
+#	depends on BR2_arm || BR2_aarch64 || BR2_i386 || BR2_x86_64 || BR2_mipsel
+#	# ARM needs BLX, so v5t+
+#	depends on !BR2_ARM_CPU_ARMV4
+
+comment "Qt6 needs host g++ >= 5.0, and a toolchain w/ gcc >= 5.0, wchar, NPTL, C++, dynamic library"
+	depends on !BR2_ARM_CPU_ARMV4
+	depends on !BR2_arc
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
+		!BR2_TOOLCHAIN_HAS_THREADS_NPTL || BR2_STATIC_LIBS || \
+		!BR2_HOST_GCC_AT_LEAST_5 || !BR2_TOOLCHAIN_GCC_AT_LEAST_5
+
+menuconfig BR2_PACKAGE_QT6
+	bool "Qt6"
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_USE_WCHAR
+	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
+	depends on BR2_HOST_GCC_AT_LEAST_5 # Full C++11
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5 # C++11, GCC_BUG_57694
+	depends on !BR2_ARM_CPU_ARMV4 # needs ARMv5+
+	# no built-in double-conversion support
+	depends on !BR2_arc
+	depends on !BR2_STATIC_LIBS
+	select BR2_PACKAGE_QT6BASE
+	help
+	  This option enables the Qt6 framework. Sub-options allow to
+	  select which modules should be built.
+
+	  http://qt.io
+
+if BR2_PACKAGE_QT6
+#source "package/qt6/qt63d/Config.in"
+source "package/qt6/qt6base/Config.in"
+#source "package/qt6/qt6charts/Config.in"
+#source "package/qt6/qt6coap/Config.in"
+#source "package/qt6/qt6connectivity/Config.in"
+#source "package/qt6/qt6declarative/Config.in"
+#source "package/qt6/qt6enginio/Config.in"
+#source "package/qt6/qt6graphicaleffects/Config.in"
+#source "package/qt6/qt6imageformats/Config.in"
+#source "package/qt6/qt6knx/Config.in"
+#source "package/qt6/qt6location/Config.in"
+#source "package/qt6/qt6lottie/Config.in"
+#source "package/qt6/qt6mqtt/Config.in"
+#source "package/qt6/qt6multimedia/Config.in"
+#source "package/qt6/qt6quickcontrols/Config.in"
+#source "package/qt6/qt6quickcontrols2/Config.in"
+#source "package/qt6/qt6quicktimeline/Config.in"
+#source "package/qt6/qt6remoteobjects/Config.in"
+#source "package/qt6/qt6script/Config.in"
+#source "package/qt6/qt6scxml/Config.in"
+#source "package/qt6/qt6sensors/Config.in"
+#source "package/qt6/qt6serialbus/Config.in"
+#source "package/qt6/qt6serialport/Config.in"
+#source "package/qt6/qt6svg/Config.in"
+#source "package/qt6/qt6tools/Config.in"
+#source "package/qt6/qt6virtualkeyboard/Config.in"
+#source "package/qt6/qt6wayland/Config.in"
+#source "package/qt6/qt6webchannel/Config.in"
+#source "package/qt6/qt6webkit/Config.in"
+#source "package/qt6/qt6webkit-examples/Config.in"
+#source "package/qt6/qt6webengine/Config.in"
+#source "package/qt6/qt6websockets/Config.in"
+#source "package/qt6/qt6webview/Config.in"
+#source "package/qt6/qt6x11extras/Config.in"
+#source "package/qt6/qt6xmlpatterns/Config.in"
+endif
diff --git a/package/qt6/qt6.mk b/package/qt6/qt6.mk
new file mode 100644
index 0000000000..b586e65c7b
--- /dev/null
+++ b/package/qt6/qt6.mk
@@ -0,0 +1,12 @@
+################################################################################
+#
+# qt6
+#
+################################################################################
+
+QT6_VERSION_MAJOR = 6.0
+QT6_VERSION = $(QT6_VERSION_MAJOR).1
+QT6_SOURCE_TARBALL_PREFIX = everywhere-src
+QT6_SITE = https://download.qt.io/archive/qt/$(QT6_VERSION_MAJOR)/$(QT6_VERSION)/submodules
+
+include $(sort $(wildcard package/qt6/*/*.mk))
diff --git a/package/qt6/qt6base/0001-src-corelib-disable-global-minimum-linux-support.patch b/package/qt6/qt6base/0001-src-corelib-disable-global-minimum-linux-support.patch
new file mode 100644
index 0000000000..18192096dc
--- /dev/null
+++ b/package/qt6/qt6base/0001-src-corelib-disable-global-minimum-linux-support.patch
@@ -0,0 +1,55 @@
+From 7ded1e6fe89b6593ea0e6fb5dfeffef5385bd3ac Mon Sep 17 00:00:00 2001
+From: Peter Seiderer <ps.report@gmx.net>
+Date: Fri, 11 Dec 2020 22:26:16 +0100
+Subject: [PATCH] src/corelib: disable global/minimum-linux support
+
+Fixes:
+
+  [433/575] Building ASM object src/corelib/CMakeFiles/Core.dir/global/minimum-linux.S.o
+  FAILED: src/corelib/CMakeFiles/Core.dir/global/minimum-linux.S.o
+  /usr/bin/as --defsym Core_EXPORTS --defsym ELF_INTERPRETER=\"/lib64/ld-linux-x86-64.so.2\" --defsym PCRE2_CODE_UNIT_WIDTH=16 --defsym QT_ASCII_CAST_WARNINGS --defsym QT_BUILDING_QT --defsym QT_BUILD_CORE_LIB --defsym QT_CORE_QOBJECT_LIB --defsym QT_DEPRECATED_WARNINGS --defsym QT_DEPRECATED_WARNINGS_SINCE=0x060000 --defsym QT_DISABLE_DEPRECATED_BEFORE=0x050000 --defsym QT_MOC_COMPAT --defsym QT_NO_CAST_TO_ASCII --defsym QT_NO_DEBUG --defsym QT_NO_FOREACH --defsym QT_NO_USING_NAMESPACE --defsym QT_USE_QSTRINGBUILDER --defsym _LARGEFILE64_SOURCE --defsym _LARGEFILE_SOURCE -Isrc/corelib/Core_autogen/include -Iinclude -Iinclude/QtCore -Isrc/corelib -Isrc/corelib/global -Isrc/corelib/../3rdparty/tinycbor/src -Iinclude/QtCore/6.0.0 -Iinclude/QtCore/6.0.0/QtCore -Isrc/corelib/../3rdparty/double-conversion/.. -Isrc/corelib/../3rdparty/double-conversion/include -Isrc/corelib/../3rdparty/forkfd -Isrc/corelib/.rcc -Imkspecs/linux-g++ -Isrc/3rdparty/pcre2/src -isystem .../host/usr/include -O3 -DNDEBUG -fPIC -Wall -Wextra -fPIC --MD src/corelib/CMakeFiles/Core.dir/global/minimum-linux.S.o.d -o src/corelib/CMakeFiles/Core.dir/global/minimum-linux.S.o -c src/corelib/global/minimum-linux.S
+  Assembler messages:
+  Fatal error: bad defsym; format is --defsym name=value
+
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+---
+ src/corelib/CMakeLists.txt | 16 ++++++++--------
+ 1 file changed, 8 insertions(+), 8 deletions(-)
+
+diff --git a/src/corelib/CMakeLists.txt b/src/corelib/CMakeLists.txt
+index c4461da6..64a00343 100644
+--- a/src/corelib/CMakeLists.txt
++++ b/src/corelib/CMakeLists.txt
+@@ -566,10 +566,10 @@ qt_internal_extend_target(Core CONDITION INTEGRITY
+ #)
+ # special case end
+ 
+-qt_internal_extend_target(Core CONDITION LINUX AND NOT static
+-    SOURCES
+-        global/minimum-linux_p.h
+-)
++#qt_internal_extend_target(Core CONDITION LINUX AND NOT static
++#    SOURCES
++#        global/minimum-linux_p.h
++#)
+ 
+ #### Keys ignored in scope 34:.:global:global/global.pri:precompile_header:
+ # NO_PCH_ASM = "global/minimum-linux.S"
+@@ -583,10 +583,10 @@ qt_internal_extend_target(Core CONDITION LINUX AND NOT static
+ #### Keys ignored in scope 35:.:global:global/global.pri:silent:
+ # no_pch_assembler.commands = "@echo" "compiling[no_pch]" "${QMAKE_FILE_IN}" "&&"
+ 
+-qt_internal_extend_target(Core CONDITION LINUX AND NOT precompile_header AND NOT static
+-    SOURCES
+-        global/minimum-linux.S
+-)
++#qt_internal_extend_target(Core CONDITION LINUX AND NOT precompile_header AND NOT static
++#    SOURCES
++#        global/minimum-linux.S
++#)
+ 
+ qt_internal_extend_target(Core CONDITION QT_FEATURE_slog2
+     LIBRARIES
+-- 
+2.30.0
+
diff --git a/package/qt6/qt6base/0002-QtAutoDetect-fix-failure-with-multiline-toolchain-fi.patch b/package/qt6/qt6base/0002-QtAutoDetect-fix-failure-with-multiline-toolchain-fi.patch
new file mode 100644
index 0000000000..a93ecea6f7
--- /dev/null
+++ b/package/qt6/qt6base/0002-QtAutoDetect-fix-failure-with-multiline-toolchain-fi.patch
@@ -0,0 +1,48 @@
+From 44a440164c5bbc5168c6034f1bf5d396b20cd076 Mon Sep 17 00:00:00 2001
+From: Peter Seiderer <ps.report@gmx.net>
+Date: Sat, 6 Feb 2021 13:12:09 +0100
+Subject: [PATCH] QtAutoDetect: fix failure with multiline toolchain file
+
+The unquoted 'string(FIND ${toolchain_file_content} ...)' call fails for
+multiline content of the variable toolchain_file_content, so add
+quates arround, fixes:
+
+  [...]
+  CMake Error at cmake/QtAutoDetect.cmake:42 (string):
+    string sub-command FIND requires 3 or 4 parameters.
+  Call Stack (most recent call first):
+    cmake/QtAutoDetect.cmake:311 (qt_auto_detect_android)
+    CMakeLists.txt:19 (include)
+  [...]
+  -- Configuring incomplete, errors occurred!
+
+in case the given toolchain file starts with multiple lines
+in the first 80 characters, e.g. in the case of buildroot:
+
+  #
+  # Automatically generated file; DO NOT EDIT.
+  # CMake toolchain file for Buildroot
+  #
+  [...]
+
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+---
+ cmake/QtAutoDetect.cmake | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/cmake/QtAutoDetect.cmake b/cmake/QtAutoDetect.cmake
+index 4518078d..36761dba 100644
+--- a/cmake/QtAutoDetect.cmake
++++ b/cmake/QtAutoDetect.cmake
+@@ -39,7 +39,7 @@ function(qt_auto_detect_android)
+     if(DEFINED CMAKE_TOOLCHAIN_FILE AND NOT DEFINED QT_AUTODETECT_ANDROID)
+ 
+         file(READ ${CMAKE_TOOLCHAIN_FILE} toolchain_file_content OFFSET 0 LIMIT 80)
+-        string(FIND ${toolchain_file_content} "The Android Open Source Project" find_result REVERSE)
++        string(FIND "${toolchain_file_content}" "The Android Open Source Project" find_result REVERSE)
+         if (NOT ${find_result} EQUAL -1)
+             set(android_detected TRUE)
+         else()
+-- 
+2.30.0
+
diff --git a/package/qt6/qt6base/Config.in b/package/qt6/qt6base/Config.in
new file mode 100644
index 0000000000..9429ebd8f7
--- /dev/null
+++ b/package/qt6/qt6base/Config.in
@@ -0,0 +1,311 @@
+config BR2_PACKAGE_QT6BASE
+	bool "qt6base"
+	select BR2_PACKAGE_DOUBLE_CONVERSION
+	select BR2_PACKAGE_LIBB2
+	select BR2_PACKAGE_ZLIB
+	select BR2_PACKAGE_PCRE2
+	select BR2_PACKAGE_PCRE2_16
+	help
+	  Qt is a cross-platform application and UI framework for
+	  developers using C++.
+
+	  This package corresponds to the qt6base module, which
+	  contains the base Qt libraries: QtCore, QtNetwork, QtGui,
+	  QtWidgets, etc.
+
+	  http://qt.io
+
+if BR2_PACKAGE_QT6BASE
+
+config BR2_PACKAGE_QT6BASE_CUSTOM_CONF_OPTS
+	string "Custom configuration options"
+	help
+	  Define custom qt6 configuration options which can be used to
+	  enable or disable options not managed by buildroot. These
+	  options are appended to the ones generated by buildroot and
+	  passed to qt6base during configuration.
+
+	  Use cmake style '-Dsome_option_name=ON' or -Dsome_option_name=OFF'.
+
+
+#config BR2_PACKAGE_QT6BASE_CONFIG_FILE
+#	string "Config file"
+#	help
+#	  Configure options allow to set which modules are being
+#	  compiled or not in Qt, but Qt also provide a more
+#	  fine-grained mechanism to configure which features should be
+#	  enabled or disabled, through a header file. Examples of such
+#	  header files can be found in src/corelib/global/qconfig-*.h
+#	  in the Qt sources.
+#
+#	  This option allows to set the path of such a configuration
+#	  file, which Buildroot will give to Qt at compile time.
+#
+config BR2_PACKAGE_QT6BASE_EXAMPLES
+	bool "Compile and install examples (with code)"
+#	select BR2_PACKAGE_QT6BASE_NETWORK
+#	select BR2_PACKAGE_QT6BASE_XML
+	help
+	  If unsure, say N.
+
+config BR2_PACKAGE_QT6BASE_NETWORK
+	bool "network module"
+	help
+	  This options enables the Qt6Network library.
+
+config BR2_PACKAGE_QT6BASE_CONCURRENT
+	bool "concurrent module"
+	help
+	  This options enables the Qt6Concurrent library.
+
+config BR2_PACKAGE_QT6BASE_SQL
+	bool "sql module"
+	help
+	  This options enables the Qt6Sql library.
+
+if BR2_PACKAGE_QT6BASE_SQL
+config BR2_PACKAGE_QT6BASE_MYSQL
+	bool "MySQL Plugin"
+	depends on BR2_USE_MMU # mysql
+	select BR2_PACKAGE_MYSQL
+#	select BR2_PACKAGE_NCURSES
+#	select BR2_PACKAGE_READLINE
+	help
+	  Build MySQL plugin
+	  If unsure, say n.
+
+config BR2_PACKAGE_QT6BASE_PSQL
+	bool "PostgreSQL Plugin"
+	depends on BR2_USE_MMU # postgresql
+	depends on !BR2_STATIC_LIBS
+	depends on BR2_USE_WCHAR # postgresql
+	select BR2_PACKAGE_POSTGRESQL
+	help
+	  Build PostgreSQL plugin
+	  If unsure, say n.
+
+comment "PostgreSQL plugin needs a toolchain w/ wchar, dynamic library"
+	depends on BR2_USE_MMU
+	depends on BR2_STATIC_LIBS || !BR2_USE_WCHAR
+
+choice
+	prompt "SQLite 3 support"
+	default BR2_PACKAGE_QT6BASE_SQLITE_NONE
+	help
+	  Select SQLite support.
+
+config BR2_PACKAGE_QT6BASE_SQLITE_NONE
+	bool "No sqlite support"
+	help
+	  Do not compile any kind of SQLite support.
+
+config BR2_PACKAGE_QT6BASE_SQLITE_QT
+	bool "Qt SQLite"
+	help
+	  Use Qt bundled SQLite support.
+
+config BR2_PACKAGE_QT6BASE_SQLITE_SYSTEM
+	bool "System SQLite"
+	select BR2_PACKAGE_SQLITE
+	select BR2_PACKAGE_SQLITE_ENABLE_COLUMN_METADATA
+	help
+	  Use system SQLite.
+
+endchoice
+
+endif # BR2_PACKAGE_QT6BASE_SQL
+
+config BR2_PACKAGE_QT6BASE_TEST
+	bool "test module"
+	help
+	  This options enables the Qt5Test library.
+
+config BR2_PACKAGE_QT6BASE_XML
+	bool "XML module"
+	help
+	  This options enables the Qt5Xml library.
+
+config BR2_PACKAGE_QT6BASE_GUI
+	bool "gui module"
+	select BR2_PACKAGE_FREETYPE
+	# At least one graphic backend must be enabled, so enable
+	# linuxfb if nothing is enabled.
+	select BR2_PACKAGE_QT6BASE_LINUXFB if \
+	       !BR2_PACKAGE_QT6BASE_DIRECTFB && \
+	       !BR2_PACKAGE_QT6BASE_XCB && \
+	       !BR2_PACKAGE_QT6BASE_EGLFS
+	help
+	  This option enables the Qt6Gui library.
+
+if BR2_PACKAGE_QT6BASE_GUI
+
+config BR2_PACKAGE_QT6BASE_WIDGETS
+	bool "widgets module"
+	select BR2_PACKAGE_XLIB_LIBXEXT if BR2_PACKAGE_QT6BASE_XCB
+	help
+	  This option enables the Qt6Widgets library.
+
+comment "OpenGL support needs an OpenGL-capable backend"
+	depends on !BR2_PACKAGE_QT6_GL_AVAILABLE
+
+config BR2_PACKAGE_QT6BASE_OPENGL
+	bool "OpenGL support"
+	depends on BR2_PACKAGE_QT6_GL_AVAILABLE
+	help
+	  This option enables OpenGL support.
+
+if BR2_PACKAGE_QT6BASE_OPENGL
+
+choice
+	prompt "OpenGL API"
+	help
+	  Select OpenGL API.
+
+config BR2_PACKAGE_QT6BASE_OPENGL_DESKTOP
+	bool "Desktop OpenGL"
+	depends on BR2_PACKAGE_HAS_LIBGL
+	help
+	  Use desktop OpenGL.
+
+config BR2_PACKAGE_QT6BASE_OPENGL_ES2
+	bool "OpenGL ES 2.0+"
+	depends on BR2_PACKAGE_HAS_LIBGLES
+	help
+	  Use OpenGL ES 2.0 and later versions.
+
+endchoice
+
+config BR2_PACKAGE_QT6BASE_OPENGL_LIB
+	bool "opengl module"
+	select BR2_PACKAGE_QT6BASE_WIDGETS
+	help
+	  This option enables the Qt6OpenGL library. This library
+	  includes OpenGL support classes provided to ease porting
+	  from Qt 4.x.
+
+endif
+
+config BR2_PACKAGE_QT6BASE_LINUXFB
+	bool "linuxfb support"
+
+config BR2_PACKAGE_QT6BASE_DIRECTFB
+	bool "directfb support"
+	depends on BR2_PACKAGE_DIRECTFB
+
+comment "directfb backend available if directfb is enabled"
+	depends on !BR2_PACKAGE_DIRECTFB
+
+config BR2_PACKAGE_QT6BASE_XCB
+	bool "X.org XCB support"
+	depends on BR2_PACKAGE_XORG7
+	select BR2_PACKAGE_XLIB_LIBX11
+	select BR2_PACKAGE_LIBXCB
+	select BR2_PACKAGE_XCB_UTIL_IMAGE
+	select BR2_PACKAGE_XCB_UTIL_KEYSYMS
+	select BR2_PACKAGE_XCB_UTIL_RENDERUTIL
+	select BR2_PACKAGE_XCB_UTIL_WM
+	select BR2_PACKAGE_LIBXKBCOMMON
+
+comment "X.org XCB backend available if X.org is enabled"
+	depends on !BR2_PACKAGE_XORG7
+
+config BR2_PACKAGE_QT6BASE_EGLFS
+	bool "eglfs support"
+	depends on BR2_PACKAGE_HAS_LIBEGL
+	depends on BR2_PACKAGE_QT6_GL_AVAILABLE
+	select BR2_PACKAGE_QT6BASE_OPENGL
+
+comment "eglfs backend available if OpenGL and EGL are enabled"
+	depends on !BR2_PACKAGE_HAS_LIBEGL || !BR2_PACKAGE_QT6_GL_AVAILABLE
+
+config BR2_PACKAGE_QT6BASE_DEFAULT_QPA
+	string "Default graphical platform"
+	help
+	  Choose the default platform abstraction to use for graphical
+	  applications (e.g xcb, linuxfb, eglfs, ...). If this is
+	  empty, the default for your architecture will be used
+	  (usually this is eglfs).
+
+	  You can get a list of supported platforms by running a Qt
+	  application with the option "-platform help" on your
+	  target. You can choose a different platform at runtime with
+	  the -platform option.
+
+# ToDo:  Qt::PrintSupport/FEATURE_cubs only available if FEATURE_gui/FEATURE_widgets enabled???
+#config BR2_PACKAGE_QT6BASE_PRINTSUPPORT
+#	depends on BR2_PACKAGE_QT6BASE_WIDGETS
+#	def_bool y
+
+config BR2_PACKAGE_QT6BASE_FONTCONFIG
+	bool "fontconfig support"
+	select BR2_PACKAGE_FONTCONFIG
+	help
+	  This option enables Fontconfig and Freetype support using
+	  the system fontconfig and freetype2 libraries.
+
+config BR2_PACKAGE_QT6BASE_HARFBUZZ
+	bool "harfbuzz support"
+	select BR2_PACKAGE_HARFBUZZ if \
+		BR2_TOOLCHAIN_HAS_SYNC_4 && \
+		BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
+	help
+	  This option enables HarfBuzz support (either system harfbuzz
+	  if the toolchain supports __sync for 4 bytes, or the qt
+	  provided one which avoids this dependency by using QAtomic).
+
+config BR2_PACKAGE_QT6BASE_GIF
+	bool "GIF support"
+	help
+	  This compiles and installs the plugin for GIF reading support.
+
+config BR2_PACKAGE_QT6BASE_JPEG
+	bool "JPEG support"
+	select BR2_PACKAGE_JPEG
+	help
+	  This option enables JPEG support using the system libjpeg
+	  library.
+
+config BR2_PACKAGE_QT6BASE_PNG
+	bool "PNG support"
+	select BR2_PACKAGE_LIBPNG
+	help
+	  This option enables PNG support using the system libpng
+	  library.
+
+endif
+
+config BR2_PACKAGE_QT6BASE_SYSLOG
+	bool "syslog support"
+	help
+	  Logs to the standard UNIX logging mechanism.
+
+config BR2_PACKAGE_QT6BASE_DBUS
+	bool "DBus module"
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_USE_MMU
+	select BR2_PACKAGE_DBUS
+	help
+	  This option enables the D-Bus module.
+
+config BR2_PACKAGE_QT6BASE_ICU
+	bool "Enable ICU support"
+	depends on !BR2_BINFMT_FLAT # icu
+	depends on BR2_HOST_GCC_AT_LEAST_4_9 # icu
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # icu
+	select BR2_PACKAGE_ICU
+	help
+	  This option enables ICU support in Qt6. This is for example
+	  needed for Qt6Webkit.
+
+comment "icu support needs a toolchain w/ gcc >= 4.9, host gcc >= 4.9"
+	depends on !BR2_BINFMT_FLAT
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || \
+		!BR2_HOST_GCC_AT_LEAST_4_9
+
+config BR2_PACKAGE_QT6BASE_TSLIB
+	bool "Enable Tslib support"
+	select BR2_PACKAGE_TSLIB
+	help
+	  This options enables the Tslib plugin
+
+endif
diff --git a/package/qt6/qt6base/qt6base.hash b/package/qt6/qt6base/qt6base.hash
new file mode 100644
index 0000000000..bf919abf99
--- /dev/null
+++ b/package/qt6/qt6base/qt6base.hash
@@ -0,0 +1,10 @@
+# Hash from: https://download.qt.io/official_releases/qt/6.0/6.0.0/submodules/qtbase-everywhere-src-6.0.0.tar.xz.sha256
+sha256  8d2bc1829c1479e539f66c2f51a7e11c38a595c9e8b8e45a3b45f3cb41c6d6aa  qtbase-everywhere-src-6.0.1.tar.xz
+
+# Hashes for license files:
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE.GPL2
+sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSE.GPL3
+sha256  0dbe024961f6ab5c52689cbd036c977975d0d0f6a67ff97762d96cb819dd5652  LICENSE.GPL3-EXCEPT
+sha256  88ec689407cf2df9b2eb5c45952564d51ce73c129a3bdffb15c0d2d161ad7558  LICENSE.LGPLv3
+sha256  ed8742a95cb9db653a09b050e27ccff5e67ba69c14aa2c3137f2a4e1892f6c0d  LICENSE.FDL
+sha256  2a886915de4f296cdae5ed67064f86dba01d0c55286d86e8487f2a5caaf40216  src/3rdparty/harfbuzz-ng/COPYING
diff --git a/package/qt6/qt6base/qt6base.mk b/package/qt6/qt6base/qt6base.mk
new file mode 100644
index 0000000000..144f91dbec
--- /dev/null
+++ b/package/qt6/qt6base/qt6base.mk
@@ -0,0 +1,496 @@
+################################################################################
+#
+# qt6base
+#
+################################################################################
+
+QT6BASE_VERSION = $(QT6_VERSION)
+QT6BASE_SITE = $(QT6_SITE)
+QT6BASE_SOURCE = qtbase-$(QT6_SOURCE_TARBALL_PREFIX)-$(QT6BASE_VERSION).tar.xz
+
+QT6BASE_DEPENDENCIES = \
+	host-pkgconf \
+	host-ninja \
+	host-qt6base \
+	double-conversion \
+	libb2 \
+	pcre2 \
+	zlib
+QT6BASE_INSTALL_STAGING = YES
+QT6BASE_SUPPORTS_IN_SOURCE_BUILD = NO
+
+QT6BASE_MAKE = ninja
+QT6BASE_INSTALL_STAGING_OPTS = install
+QT6BASE_INSTALL_STAGING_ENV = DESTDIR=$(STAGING_DIR)
+QT6BASE_INSTALL_TARGET_OPTS = install
+QT6BASE_INSTALL_TARGET_ENV = DESTDIR=$(TARGET_DIR)
+QT6BASE_CONF_OPTS += \
+	-GNinja \
+	-DQT_HOST_PATH=$(HOST_DIR) \
+	-DBUILD_SHARED_LIBS=ON \
+	-DBUILD_WITH_PCH=OFF \
+	-DFEATURE_animation=OFF \
+	-DFEATURE_concurrent=OFF \
+	-DFEATURE_doubleconversion=ON \
+	-DFEATURE_easingcurve=OFF \
+	-DFEATURE_hijricalendar=OFF \
+	-DFEATURE_islamiccivilcalendar=OFF \
+	-DFEATURE_jalalicalendar=OFF \
+	-DFEATURE_libudev=ON \
+	-DFEATURE_network=OFF \
+	-DFEATURE_mimetype=ON \
+	-DFEATURE_mimetype_database=ON \
+	-DFEATURE_precompile_header=OFF \
+	-DFEATURE_sql=OFF \
+	-DFEATURE_system_doubleconversion=ON \
+	-DFEATURE_system_libb2=ON \
+	-DFEATURE_system_pcre2=ON \
+	-DFEATURE_system_zlib=ON \
+	-DFEATURE_testlib=OFF \
+	-DFEATURE_translation=OFF \
+	-DINSTALL_DESCRIPTIONSDIR=/usr/lib/qt6/modules \
+	-DINSTALL_DOCDIR=/usr/lib/qt6/doc \
+	-DINSTALL_EXAMPLESDIR=/usr/lib/qt6/examples \
+	-DINSTALL_MKSPECSDIR=/usr/lib/qt6/mkspecs \
+	-DINSTALL_PLUGINSDIR=/usr/lib/qt6/plugins \
+	-DINSTALL_QMLDIR=/usr/lib/qt6/qml \
+	-DQT_BUILD_EXAMPLES_BY_DEFAULT=OFF \
+	-DQT_BUILD_TESTS_BY_DEFAULT=OFF \
+	-DQT_BUILD_TOOLS_BY_DEFAULT=OFF \
+	-DQT_BUILD_TOOLS_WHEN_CROSSCOMPILING=OFF \
+	-DQT_QMAKE_TARGET_MKSPEC=linux-g++ \
+	-DQT_USE_BUNDLED_BundledFreetype=OFF \
+	-DQT_USE_BUNDLED_BundledLibpng=OFF \
+	-DQT_USE_BUNDLED_BundledPcre2=OFF \
+	-DECM_ENABLE_SANITIZERS=OFF
+
+
+#	-DFEATURE_glib=ON
+#	-DFEATURE_glibc=OFF
+
+#ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_90620),y)
+#QT6BASE_CFLAGS += -O0
+#QT6BASE_CXXFLAGS += -O0
+#endif
+#
+QT6BASE_CONF_OPTS += -DFEATURE_sse2=$(if $(BR2_X86_CPU_HAS_SSE2),ON,OFF)
+QT6BASE_CONF_OPTS += -DFEATURE_sse3=$(if $(BR2_X86_CPU_HAS_SSE3),ON,OFF)
+QT6BASE_CONF_OPTS += -DFEATURE_sse4_1=$(if $(BR2_X86_CPU_HAS_SSE4),ON,OFF)
+QT6BASE_CONF_OPTS += -DFEATURE_sse4_2=$(if $(BR2_X86_CPU_HAS_SSE42),ON,OFF)
+QT6BASE_CONF_OPTS += -DFEATURE_ssse3=$(if $(BR2_X86_CPU_HAS_SSSE3),ON,OFF)
+QT6BASE_CONF_OPTS += -DFEATURE_avx=$(if $(BR2_X86_CPU_HAS_AVX),ON,OFF)
+QT6BASE_CONF_OPTS += -DFEATURE_avx2=$(if $(BR2_X86_CPU_HAS_AVX2),ON,OFF)
+# no buildroot BR2_X86_CPU_HAS_AVX512 option yet
+QT6BASE_CONF_OPTS += \
+	-DFEATURE_avx512bw=OFF \
+	-DFEATURE_avx512cd=OFF \
+	-DFEATURE_avx512dq=OFF \
+	-DFEATURE_avx512er=OFF \
+	-DFEATURE_avx512f=OFF \
+	-DFEATURE_avx512ifma=OFF \
+	-DFEATURE_avx512pf=OFF \
+	-DFEATURE_avx512vbmi=OFF \
+	-DFEATURE_avx512vl=OFF
+
+# ToDo: FEATURE_kms only available if FEATURE_gui enabled???
+ifeq ($(BR2_PACKAGE_LIBDRM),y)
+QT6BASE_CONF_OPTS += -DFEATURE_kms=ON
+QT6BASE_DEPENDENCIES += libdrm
+else
+QT6BASE_CONF_OPTS += -DFEATURE_kms=OFF
+endif
+
+# ToDo: FEATURE_kms only available if FEATURE_gui enabled???
+# Uses libgbm from mesa3d
+ifeq ($(BR2_PACKAGE_MESA3D_OPENGL_EGL),y)
+QT6BASE_CONF_OPTS += -DFEATURE_gbm=ON
+QT6BASE_DEPENDENCIES += mesa3d
+else ifeq ($(BR2_PACKAGE_GCNANO_BINARIES),y)
+QT6BASE_CONF_OPTS += -DFEATURE_gbm=ON
+QT6BASE_DEPENDENCIES += gcnano-binaries
+else ifeq ($(BR2_PACKAGE_TI_SGX_LIBGBM),y)
+QT6BASE_CONF_OPTS += -DFEATURE_gbm=ON
+QT6BASE_DEPENDENCIES += ti-sgx-libgbm
+else ifeq ($(BR2_PACKAGE_IMX_GPU_VIV_OUTPUT_WL),y)
+QT6BASE_CONF_OPTS += -DFEATURE_gbm=ON
+QT6BASE_DEPENDENCIES += imx-gpu-viv
+else
+QT6BASE_CONF_OPTS += -DFEATURE_gbm=OFF
+endif
+
+#ifeq ($(BR2_ENABLE_DEBUG),y)
+#QT6BASE_CONFIGURE_OPTS += -debug
+#else
+#QT6BASE_CONFIGURE_OPTS += -release
+#endif
+#
+#QT6BASE_CONFIGURE_OPTS += -opensource -confirm-license
+#QT6BASE_LICENSE = GPL-2.0+ or LGPL-3.0, GPL-3.0 with exception(tools), GFDL-1.3 (docs)
+#QT6BASE_LICENSE_FILES = LICENSE.GPL2 LICENSE.GPL3 LICENSE.GPL3-EXCEPT LICENSE.LGPLv3 LICENSE.FDL
+#ifeq ($(BR2_PACKAGE_QT6BASE_EXAMPLES),y)
+#QT6BASE_LICENSE += , BSD-3-Clause (examples)
+#endif
+#
+#QT6BASE_CONFIG_FILE = $(call qstrip,$(BR2_PACKAGE_QT6BASE_CONFIG_FILE))
+#
+#ifneq ($(QT6BASE_CONFIG_FILE),)
+#QT6BASE_CONFIGURE_OPTS += -qconfig buildroot
+#endif
+#
+ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
+QT6BASE_CONF_OPTS += -DFEATURE_libudev=ON
+QT6BASE_DEPENDENCIES += udev
+else
+QT6BASE_CONF_OPTS += -DFEATURE_libudev=OFF
+endif
+
+# ToDo: FEATURE_cubs only available if FEATURE_gui/FEATURE_widgets enabled???
+ifeq ($(BR2_PACKAGE_CUPS), y)
+QT6BASE_CONF_OPTS += -DFEATURE_cups=ON
+QT6BASE_DEPENDENCIES += cups
+else
+QT6BASE_CONF_OPTS += -DFEATURE_cups=OFF
+endif
+
+# Qt5 SQL Plugins
+ifeq ($(BR2_PACKAGE_QT6BASE_SQL),y)
+QT6BASE_CONF_OPTS += -DFEATURE_sql=ON
+QT6BASE_CONF_OPTS += -DFEATURE_sql_db2=OFF -DFEATURE_sql_ibase=OFF -DFEATURE_sql_oci=OFF -DFEATURE_sql_odbc=OFF
+ifeq ($(BR2_PACKAGE_QT6BASE_MYSQL),y)
+QT6BASE_CONF_OPTS += -DFEATURE_sql_mysql=ON
+QT6BASE_DEPENDENCIES += mysql
+else
+QT6BASE_CONF_OPTS += -DFEATURE_sql_mysql=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_QT6BASE_PSQL),y)
+QT6BASE_CONF_OPTS += -DFEATURE_sql_psql=ON
+QT6BASE_DEPENDENCIES += postgresql
+else
+QT6BASE_CONF_OPTS += -DFEATURE_sql_psql=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_QT6BASE_SQLITE_SYSTEM),y)
+QT6BASE_CONF_OPTS += -DFEATURE_sql_sqlite=ON -DFEATURE_system_sqlite=ON
+QT6BASE_DEPENDENCIES += sqlite
+else ifeq ($(BR2_PACKAGE_QT6BASE_SQLITE_QT),y)
+QT6BASE_CONF_OPTS += -DFEATURE_sql_sqlite=ON -DFEATURE_system_sqlite=OFF
+else
+QT6BASE_CONF_OPTS += -DFEATURE_sql_sqlite=OFF
+endif
+
+else # BR2_PACKAGE_QT6BASE_SQL
+QT6BASE_CONF_OPTS += -DFEATURE_sql=OFF
+endif # BR2_PACKAGE_QT6BASE_SQL
+
+ifeq ($(BR2_PACKAGE_QT6BASE_GUI),y)
+QT6BASE_CONF_OPTS += -DFEATURE_gui=ON -DFEATURE_freetype=ON
+#QT6BASE_CONF_OPTS += -DFEATURE_opengles2=OFF -DFEATURE_opengles3=OFF -DFEATURE_opengles31=OFF -DFEATURE_opengles32=OFF -DFEATURE_gbm=OFF -DFEATURE_vnc=OFF -DFEATURE_sessionmanager=OFF
+QT6BASE_DEPENDENCIES += freetype
+QT6BASE_CONF_OPTS += -DFEATURE_vulkan=OFF
+else
+QT6BASE_CONF_OPTS += -DFEATURE_gui=OFF
+endif
+
+# ToDo: FEATURE_kms only available if FEATURE_gui enabled???
+ifeq ($(BR2_PACKAGE_QT6BASE_HARFBUZZ),y)
+QT6BASE_CONF_OPTS += -DFEATURE_harfbuzz=ON
+ifeq ($(BR2_TOOLCHAIN_HAS_SYNC_4),y)
+# system harfbuzz in case __sync for 4 bytes is supported
+QT6BASE_CONF_OPTS += -DQT_USE_BUNDLED_BundledHarfbuzz=OFF
+QT6BASE_DEPENDENCIES += harfbuzz
+else
+# qt harfbuzz otherwise (using QAtomic instead)
+QT6BASE_CONF_OPTS += -DQT_USE_BUNDLED_BundledHarfbuzz=ON
+QT6BASE_LICENSE += , MIT (harfbuzz)
+QT6BASE_LICENSE_FILES += src/3rdparty/harfbuzz-ng/COPYING
+endif
+else
+QT6BASE_CONFIGURE_OPTS += -DFEATURE_harfbuzz=OFF
+endif
+
+# ToDo: FEATURE_kms only available if FEATURE_gui enabled???
+ifeq ($(BR2_PACKAGE_QT6BASE_WIDGETS),y)
+QT6BASE_CONF_OPTS += -DFEATURE_widgets=ON
+ifeq ($(BR2_PACKAGE_QT6BASE_LINUXFB),y)
+QT6BASE_CONF_OPTS += -DFEATURE_linuxfb=ON
+else
+QT6BASE_CONF_OPTS += -DFEATURE_linuxfb=OFF
+endif
+ifeq ($(BR2_PACKAGE_QT6BASE_DIRECTFB),y)
+QT6BASE_CONF_OPTS += -DFEATURE_directfb=ON
+QT6BASE_DEPENDENCIES += directfb
+else
+QT6BASE_CONF_OPTS += -DFEATURE_directfb=OFF
+endif
+ifeq ($(BR2_PACKAGE_QT6BASE_XCB),y)
+QT6BASE_CONF_OPTS += \
+	-DFEATURE_xcb=ON \
+	-DFEATURE_xcb_xlib=ON \
+	-DFEATURE_xkbcommon=ON \
+	-DFEATURE_xkbcommon_x11=ON
+QT6BASE_DEPENDENCIES += \
+	libxcb \
+	xcb-util-wm \
+	xcb-util-image \
+	xcb-util-keysyms \
+	xcb-util-renderutil \
+	xlib_libX11 \
+	libxkbcommon
+ifeq ($(BR2_PACKAGE_QT6BASE_WIDGETS),y)
+QT6BASE_DEPENDENCIES += xlib_libXext
+endif
+else
+QT6BASE_CONF_OPTS += -DFEATURE_xcb=OFF
+endif
+else
+QT6BASE_CONF_OPTS += -DFEATURE_widgets=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_QT6BASE_OPENGL_DESKTOP),y)
+QT6BASE_CONF_OPTS += -DFEATURE_opengl=ON -DFEATURE_opengl_desktop=ON
+QT6BASE_DEPENDENCIES += libgl
+else ifeq ($(BR2_PACKAGE_QT6BASE_OPENGL_ES2),y)
+QT6BASE_CONF_OPTS += -DFEATURE_opengl=ON -DFEATURE_opengles2=ON
+QT6BASE_DEPENDENCIES += libgles
+else
+QT6BASE_CONF_OPTS += -DFEATURE_opengl=OFF
+endif
+
+#QT6BASE_DEFAULT_QPA = $(call qstrip,$(BR2_PACKAGE_QT6BASE_DEFAULT_QPA))
+#QT6BASE_CONFIGURE_OPTS += $(if $(QT6BASE_DEFAULT_QPA),-qpa $(QT6BASE_DEFAULT_QPA))
+
+ifeq ($(BR2_PACKAGE_QT6BASE_EGLFS),y)
+QT6BASE_CONFIGURE_OPTS += -DFEATURE_eglfs=ON
+QT6BASE_DEPENDENCIES += libegl
+else
+QT6BASE_CONFIGURE_OPTS += -DFEATURE_eglfs=OFF
+endif
+
+# ToDo: depend on NETWOK, set FEATURE_openssl_linked, FEATURE_openssl_runtime,
+# FEATURE_opensslv11???
+ifeq ($(BR2_PACKAGE_OPENSSL),y)
+QT6BASE_CONFIGURE_OPTS += -DFEATURE_openssl=ON
+QT6BASE_DEPENDENCIES += ,openssl
+else
+QT6BASE_CONFIGURE_OPTS += -DFEATURE_openssl=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_QT6BASE_FONTCONFIG),y)
+QT6BASE_CONF_OPTS += -DFEATURE_fontconfig=ON
+QT6BASE_DEPENDENCIES += fontconfig
+else
+QT6BASE_CONF_OPTS += -DFEATURE_fontconfig=OFF
+endif
+
+# ToDo: FEATURE_kms only available if FEATURE_gui enabled???
+ifeq ($(BR2_PACKAGE_QT6BASE_GIF),y)
+QT6BASE_CONF_OPTS += -DFEATURE_gif=ON
+else
+QT6BASE_CONF_OPTS += -DFEATURE_gif=OFF
+endif
+
+# ToDo: FEATURE_kms only available if FEATURE_gui enabled???
+ifeq ($(BR2_PACKAGE_QT6BASE_JPEG),y)
+QT6BASE_CONF_OPTS += -DFEATURE_jpeg=ON
+QT6BASE_DEPENDENCIES += jpeg
+else
+QT6BASE_CONF_OPTS += -DFEATURE_jpeg=OFF
+endif
+
+# ToDo: FEATURE_kms only available if FEATURE_gui enabled???
+ifeq ($(BR2_PACKAGE_QT6BASE_PNG),y)
+QT6BASE_CONF_OPTS += -DFEATURE_png=ON -DFEATURE_system_png=ON
+QT6BASE_DEPENDENCIES += libpng
+else
+QT6BASE_CONF_OPTS += -DFEATURE_png=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_QT6BASE_DBUS),y)
+QT6BASE_CONF_OPTS += -DFEATURE_dbus=ON
+QT6BASE_DEPENDENCIES += dbus
+HOST_QT6BASE_CONF_OPTS += -DFEATURE_dbus=ON
+#HOST_QT6BASE_DEPENDENCIES += host-dbus
+else
+QT6BASE_CONF_OPTS += -DFEATURE_dbus=OFF
+HOST_QT6BASE_CONF_OPTS += -DFEATURE_dbus=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_QT6BASE_TSLIB),y)
+QT6BASE_CONF_OPTS += -DFEATURE_tslib=ON
+QT6BASE_DEPENDENCIES += tslib
+else
+QT6BASE_CONF_OPTS += -DFEATURE_tslib=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_LIBGLIB2),y)
+QT6BASE_CONF_OPTS += -DFEATURE_glib=ON
+QT6BASE_DEPENDENCIES += libglib2
+else
+QT6BASE_CONF_OPTS += -DFEATURE_glib=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_QT6BASE_ICU),y)
+QT6BASE_CONF_OPTS += -DFEATURE_icu=ON
+QT6BASE_DEPENDENCIES += icu
+else
+QT6BASE_CONF_OPTS += -DFEATURE_icu=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_QT6BASE_EXAMPLES),y)
+QT6BASE_CONF_OPTS += -DQT_BUILD_EXAMPLES=ON -DQT_BUILD_EXAMPLES_BY_DEFAULT=ON
+else
+QT6BASE_CONF_OPTS += -DQT_BUILD_EXAMPLES=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_QT6BASE_NETWORK),y)
+QT6BASE_CONF_OPTS += -DFEATURE_network=ON
+else
+QT6BASE_CONF_OPTS += -DFEATURE_network=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_QT6BASE_CONCURRENT),y)
+QT6BASE_CONF_OPTS += -DFEATURE_concurrent=ON
+else
+QT6BASE_CONF_OPTS += -DFEATURE_concurrent=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_QT6BASE_TEST),y)
+QT6BASE_CONF_OPTS += -DFEATURE_testlib=ON
+else
+QT6BASE_CONF_OPTS += -DFEATURE_testlib=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_QT6BASE_XML),y)
+QT6BASE_CONF_OPTS += -DFEATURE_xml=ON
+else
+QT6BASE_CONF_OPTS += -DFEATURE_xml=OFF
+endif
+
+# ToDo: FEATURE_kms only available if FEATURE_gui enabled???
+ifeq ($(BR2_PACKAGE_LIBINPUT),y)
+QT6BASE_CONF_OPTS += -DFEATURE_libinput=ON
+QT6BASE_DEPENDENCIES += libinput
+else
+QT6BASE_CONF_OPTS += -D FEATURE_libinput=OFF
+endif
+
+# only enable gtk support if libgtk3 X11 backend is enabled
+ifeq ($(BR2_PACKAGE_LIBGTK3)$(BR2_PACKAGE_LIBGTK3_X11),yy)
+QT6BASE_CONF_OPTS += -DFEATURE_gtk3=ON
+QT6BASE_DEPENDENCIES += libgtk3
+else
+QT6BASE_CONF_OPTS += -DFEATURE_gtk3=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_SYSTEMD),y)
+QT6BASE_CONF_OPTS += -DFEATURE_journald=ON
+QT6BASE_DEPENDENCIES += systemd
+else
+QT6BASE_CONF_OPTS += -DFEATURE_journald=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_ZSTD),y)
+QT6BASE_CONF_OPTS += -DFEATURE_zstd=ON
+QT6BASE_DEPENDENCIES += zstd
+else
+QT6BASE_CONF_OPTS += -DFEATURE_zstd=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_QT6BASE_SYSLOG),y)
+QT6BASE_CONF_OPTS += -DFEATURE_syslog=ON
+else
+QT6BASE_CONF_OPTS += -DFEATURE_syslog=OFF
+endif
+#
+#ifeq ($(BR2_PACKAGE_IMX_GPU_VIV),y)
+## use vivante backend
+#QT6BASE_EGLFS_DEVICE = EGLFS_DEVICE_INTEGRATION = eglfs_viv
+#else ifeq ($(BR2_PACKAGE_SUNXI_MALI_MAINLINE),y)
+## use mali backend
+#QT6BASE_EGLFS_DEVICE = EGLFS_DEVICE_INTEGRATION = eglfs_mali
+#endif
+#
+#ifneq ($(QT6BASE_CONFIG_FILE),)
+#define QT6BASE_CONFIGURE_CONFIG_FILE
+#	cp $(QT6BASE_CONFIG_FILE) $(@D)/src/corelib/global/qconfig-buildroot.h
+#endef
+#endif
+#
+#QT6BASE_ARCH_CONFIG_FILE = $(@D)/mkspecs/devices/linux-buildroot-g++/arch.conf
+#ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
+## Qt 5.8 needs atomics, which on various architectures are in -latomic
+#define QT6BASE_CONFIGURE_ARCH_CONFIG
+#	printf 'LIBS += -latomic\n' >$(QT6BASE_ARCH_CONFIG_FILE)
+#endef
+#endif
+#
+## This allows to use ccache when available
+#define QT6BASE_CONFIGURE_HOSTCC
+#	$(SED) 's,^QMAKE_CC\s*=.*,QMAKE_CC = $(HOSTCC),' $(@D)/mkspecs/common/g++-base.conf
+#	$(SED) 's,^QMAKE_CXX\s*=.*,QMAKE_CXX = $(HOSTCXX),' $(@D)/mkspecs/common/g++-base.conf
+#endef
+
+# Must be last so can override all options set by Buildroot
+QT6BASE_CONF_OPTS += $(call qstrip,$(BR2_PACKAGE_QT6BASE_CUSTOM_CONF_OPTS))
+
+#define QT6BASE_CONFIGURE_CMDS
+#	mkdir -p $(@D)/mkspecs/devices/linux-buildroot-g++/
+#	sed 's/@EGLFS_DEVICE@/$(QT6BASE_EGLFS_DEVICE)/g' \
+#		$(QT6BASE_PKGDIR)/qmake.conf.in > \
+#		$(@D)/mkspecs/devices/linux-buildroot-g++/qmake.conf
+#	$(INSTALL) -m 0644 -D $(QT6BASE_PKGDIR)/qplatformdefs.h \
+#		$(@D)/mkspecs/devices/linux-buildroot-g++/qplatformdefs.h
+#	$(QT6BASE_CONFIGURE_CONFIG_FILE)
+#	touch $(QT6BASE_ARCH_CONFIG_FILE)
+#	$(QT6BASE_CONFIGURE_ARCH_CONFIG)
+#	$(QT6BASE_CONFIGURE_HOSTCC)
+#	(cd $(@D); \
+#		$(TARGET_MAKE_ENV) \
+#		PKG_CONFIG="$(PKG_CONFIG_HOST_BINARY)" \
+#		MAKEFLAGS="-j$(PARALLEL_JOBS) $(MAKEFLAGS)" \
+#		./configure \
+#		-v \
+#		-prefix /usr \
+#		-hostprefix $(HOST_DIR) \
+#		-headerdir /usr/include/qt6 \
+#		-sysroot $(STAGING_DIR) \
+#		-plugindir /usr/lib/qt/plugins \
+#		-examplesdir /usr/lib/qt/examples \
+#		-no-rpath \
+#		-nomake tests \
+#		-device buildroot \
+#		-device-option CROSS_COMPILE="$(TARGET_CROSS)" \
+#		-device-option BR_COMPILER_CFLAGS="$(QT6BASE_CFLAGS)" \
+#		-device-option BR_COMPILER_CXXFLAGS="$(QT6BASE_CXXFLAGS)" \
+#		$(QT6BASE_CONFIGURE_OPTS) \
+#	)
+#endef
+#
+#QT6BASE_POST_INSTALL_STAGING_HOOKS += QT6_INSTALL_QT_CONF
+#
+
+HOST_QT6BASE_DEPENDENCIES = host-pkgconf host-ninja host-zlib
+HOST_QT6BASE_MAKE = ninja
+HOST_QT6BASE_CONF_OPTS += \
+	-GNinja \
+	-DCMAKE_INSTALL_PREFIX=$(HOST_DIR) \
+	-DCMAKE_INSTALL_RPATH=$(HOST_DIR)/lib \
+	-DBUILD_SHARED_LIBS=ON \
+	-DBUILD_WITH_PCH=OFF \
+	-DFEATURE_concurrent=OFF \
+	-DFEATURE_glib=OFF \
+	-DFEATURE_gui=OFF \
+	-DFEATURE_icu=OFF \
+	-DFEATURE_network=OFF \
+	-DFEATURE_precompile_header=OFF \
+	-DFEATURE_sql=OFF \
+	-DFEATURE_system_zlib=ON \
+	-DFEATURE_testlib=OFF \
+	-DQT_BUILD_BENCHMARKS=OFF \
+	-DQT_BUILD_EXAMPLES=OFF \
+	-DQT_BUILD_TESTS=OFF \
+	-DQT_BUILD_TOOLS_BY_DEFAULT=OFF
+
+$(eval $(cmake-package))
+$(eval $(host-cmake-package))
-- 
2.30.0
