From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 26 Oct 2019 16:53:24 +0200
Subject: [Buildroot] [PATCH 5/5] packages: host gcc >= 4.8 is now guaranteed
In-Reply-To: <cover.1572101547.git.yann.morin.1998@free.fr>
References: <cover.1572101547.git.yann.morin.1998@free.fr>
Message-ID: <10622e30b5a65ef672f2de039d424046e0089bdb.1572101547.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

... so we can drop all config options about it and previous versions.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Peter Korsgaard <peter@korsgaard.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Romain Naour <romain.naour@gmail.com>
---
 Config.in                              | 21 ---------------------
 package/clang/Config.in                |  5 ++---
 package/collectd/Config.in             |  6 ++----
 package/cppcms/Config.in               |  5 ++---
 package/efibootmgr/Config.in           |  6 ++----
 package/efivar/Config.in               |  7 ++-----
 package/efl/Config.in                  |  8 +++-----
 package/gdb/Config.in.host             | 12 ------------
 package/google-breakpad/Config.in      |  3 +--
 package/grpc/Config.in                 |  6 ++----
 package/gtkmm3/Config.in               |  4 +---
 package/icu/Config.in                  |  6 ++----
 package/imagemagick/Config.in.host     |  4 ----
 package/kodi/Config.in                 |  4 +---
 package/kvm-unit-tests/Config.in       |  5 -----
 package/libclc/Config.in               |  1 -
 package/libgtk3/Config.in              |  5 +----
 package/lld/Config.in.host             |  5 -----
 package/llvm/Config.in                 |  5 ++---
 package/mesa3d/Config.in               |  5 ++---
 package/mfgtools/Config.in.host        |  4 ----
 package/midori/Config.in               |  5 ++---
 package/mosh/Config.in                 |  5 ++---
 package/php/Config.ext                 |  6 ++----
 package/protobuf-c/Config.in           |  6 ++----
 package/protobuf/Config.in             |  6 ++----
 package/python-mwscrape2slob/Config.in |  4 +---
 package/python-protobuf/Config.in      |  1 -
 package/python-pyicu/Config.in         |  6 ++----
 package/python-slob/Config.in          |  4 +---
 package/qt-webkit-kiosk/Config.in      |  6 ++----
 package/qt5/Config.in                  |  5 ++---
 package/qt5/qt5base/Config.in          |  6 ++----
 package/qt5/qt5tools/Config.in         |  5 -----
 package/qt5/qt5webengine/Config.in     |  5 ++---
 package/qt5/qt5webkit/Config.in        |  6 ++----
 package/riemann-c-client/Config.in     |  6 ++----
 package/rustc/Config.in.host           |  4 ----
 package/vte/Config.in                  |  4 +---
 package/webkitgtk/Config.in            |  4 +---
 package/wpewebkit/Config.in            |  5 ++---
 41 files changed, 55 insertions(+), 171 deletions(-)

diff --git a/Config.in b/Config.in
index a6e280b885..ebbb6b41f4 100644
--- a/Config.in
+++ b/Config.in
@@ -26,29 +26,9 @@ config BR2_HOST_GCC_VERSION
 	string
 	option env="HOST_GCC_VERSION"
 
-config BR2_HOST_GCC_AT_LEAST_4_5
-	bool
-	default y if BR2_HOST_GCC_VERSION = "4 5"
-
-config BR2_HOST_GCC_AT_LEAST_4_6
-	bool
-	default y if BR2_HOST_GCC_VERSION = "4 6"
-	select BR2_HOST_GCC_AT_LEAST_4_5
-
-config BR2_HOST_GCC_AT_LEAST_4_7
-	bool
-	default y if BR2_HOST_GCC_VERSION = "4 7"
-	select BR2_HOST_GCC_AT_LEAST_4_6
-
-config BR2_HOST_GCC_AT_LEAST_4_8
-	bool
-	default y if BR2_HOST_GCC_VERSION = "4 8"
-	select BR2_HOST_GCC_AT_LEAST_4_7
-
 config BR2_HOST_GCC_AT_LEAST_4_9
 	bool
 	default y if BR2_HOST_GCC_VERSION = "4 9"
-	select BR2_HOST_GCC_AT_LEAST_4_8
 
 config BR2_HOST_GCC_AT_LEAST_5
 	bool
@@ -556,7 +536,6 @@ endchoice
 config BR2_GOOGLE_BREAKPAD_ENABLE
 	bool "Enable google-breakpad support"
 	depends on BR2_INSTALL_LIBSTDCPP
-	depends on BR2_HOST_GCC_AT_LEAST_4_8 # C++11
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # C++11
 	depends on BR2_USE_WCHAR
 	depends on BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/clang/Config.in b/package/clang/Config.in
index 80f03c80b7..a67e7631a8 100644
--- a/package/clang/Config.in
+++ b/package/clang/Config.in
@@ -1,7 +1,6 @@
 config BR2_PACKAGE_CLANG
 	bool "clang"
 	depends on BR2_PACKAGE_LLVM_ARCH_SUPPORTS
-	depends on BR2_HOST_GCC_AT_LEAST_4_8
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_INSTALL_LIBSTDCPP
@@ -15,10 +14,10 @@ config BR2_PACKAGE_CLANG
 
 	  http://clang.llvm.org
 
-comment "clang needs a toolchain w/ wchar, threads, C++, gcc >= 4.8, host gcc >= 4.8, dynamic library"
+comment "clang needs a toolchain w/ wchar, threads, C++, gcc >= 4.8, dynamic library"
 	depends on BR2_PACKAGE_LLVM_ARCH_SUPPORTS
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP || \
-		!BR2_HOST_GCC_AT_LEAST_4_8 || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 \
 		|| BR2_STATIC_LIBS || !BR2_USE_WCHAR
 
 comment "clang needs a toolchain not affected by GCC bug 64735"
diff --git a/package/collectd/Config.in b/package/collectd/Config.in
index 990dd44e6d..3ca33807d7 100644
--- a/package/collectd/Config.in
+++ b/package/collectd/Config.in
@@ -576,7 +576,6 @@ config BR2_PACKAGE_COLLECTD_RIEMANN
 	# riemann-c-client -> protobuf-c
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
-	depends on BR2_HOST_GCC_AT_LEAST_4_8
 	select BR2_PACKAGE_RIEMANN_C_CLIENT
 	select BR2_PACKAGE_LIBTOOL
 	help
@@ -605,15 +604,14 @@ config BR2_PACKAGE_COLLECTD_WRITEPROMETHEUS
 	bool "write_prometheus"
 	depends on BR2_INSTALL_LIBSTDCPP # protobuf-c
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86" # protobuf-c
-	depends on BR2_HOST_GCC_AT_LEAST_4_8 # protobuf-c
 	select BR2_PACKAGE_LIBMICROHTTPD
 	select BR2_PACKAGE_PROTOBUF_C
 	help
 	  Publishes values using an embedded HTTP server, in a format
 	  compatible with Prometheus' collectd_exporter.
 
-comment "write_prometheus needs a toolchain w/ C++, host gcc >= 4.8"
-	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_HOST_GCC_AT_LEAST_4_8
+comment "write_prometheus needs a toolchain w/ C++"
+	depends on !BR2_INSTALL_LIBSTDCPP
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
 
 config BR2_PACKAGE_COLLECTD_WRITEREDIS
diff --git a/package/cppcms/Config.in b/package/cppcms/Config.in
index d7b7fa8933..f02b283482 100644
--- a/package/cppcms/Config.in
+++ b/package/cppcms/Config.in
@@ -27,16 +27,15 @@ if BR2_PACKAGE_CPPCMS
 config BR2_PACKAGE_CPPCMS_ICU
 	bool "enable icu support"
 	depends on !BR2_BINFMT_FLAT # icu
-	depends on BR2_HOST_GCC_AT_LEAST_4_8 # icu
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # icu
 	select BR2_PACKAGE_ICU
 	help
 	  Using ICU allows advanced localization features into CppCMS,
 	  in another hand ICU is heavier than iconv.
 
-comment "icu support needs a toolchain w/ gcc >= 4.8, host gcc >= 4.8"
+comment "icu support needs a toolchain w/ gcc >= 4.8"
 	depends on !BR2_BINFMT_FLAT
-	depends on !BR2_HOST_GCC_AT_LEAST_4_8 || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
 
 endif
 
diff --git a/package/efibootmgr/Config.in b/package/efibootmgr/Config.in
index 6644d26b6c..d31f9b13ee 100644
--- a/package/efibootmgr/Config.in
+++ b/package/efibootmgr/Config.in
@@ -4,7 +4,6 @@ config BR2_PACKAGE_EFIBOOTMGR
 	depends on !BR2_STATIC_LIBS # efivar
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_12 # efivar
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # efivar
-	depends on BR2_HOST_GCC_AT_LEAST_4_8 # efivar
 	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS
 	select BR2_PACKAGE_EFIVAR
 	select BR2_PACKAGE_POPT
@@ -16,10 +15,9 @@ config BR2_PACKAGE_EFIBOOTMGR
 
 	  https://github.com/rhboot/efibootmgr
 
-comment "efibootmgr needs a glibc or uClibc toolchain w/ dynamic library, headers >= 3.12, gcc >= 4.9, host gcc >= 4.8"
+comment "efibootmgr needs a glibc or uClibc toolchain w/ dynamic library, headers >= 3.12, gcc >= 4.9"
 	depends on BR2_PACKAGE_EFIVAR_ARCH_SUPPORTS
 	depends on BR2_STATIC_LIBS || \
 		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_12 || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || \
-		!BR2_HOST_GCC_AT_LEAST_4_8
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
 	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS
diff --git a/package/efivar/Config.in b/package/efivar/Config.in
index 545962ed70..74f2bb5abb 100644
--- a/package/efivar/Config.in
+++ b/package/efivar/Config.in
@@ -17,17 +17,14 @@ config BR2_PACKAGE_EFIVAR
 	# toolchains.
 	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
-	# needs __builtin_bswap16
-	depends on BR2_HOST_GCC_AT_LEAST_4_8
 	help
 	  Tools and libraries to manipulate EFI variables
 
 	  https://github.com/rhboot/efivar
 
-comment "efivar needs a toolchain w/ dynamic library, headers >= 3.12, gcc >= 4.9, host gcc >= 4.8"
+comment "efivar needs a toolchain w/ dynamic library, headers >= 3.12, gcc >= 4.9"
 	depends on BR2_PACKAGE_EFIVAR_ARCH_SUPPORTS
 	depends on BR2_STATIC_LIBS || \
 		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_12 || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || \
-		!BR2_HOST_GCC_AT_LEAST_4_8
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
 	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS
diff --git a/package/efl/Config.in b/package/efl/Config.in
index c9f2b6a8aa..3e7097df74 100644
--- a/package/efl/Config.in
+++ b/package/efl/Config.in
@@ -1,7 +1,6 @@
 config BR2_PACKAGE_EFL
 	bool "efl"
 	 # g++ issue with 4.4.5, tested with g++ 4.7.2
-	depends on BR2_HOST_GCC_AT_LEAST_4_7
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_7
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_PACKAGE_LUAJIT_ARCH_SUPPORTS # luajit
@@ -144,15 +143,14 @@ comment "Warning: one of the recommended option for EFL is not enabled"
 
 config BR2_PACKAGE_EFL_EOLIAN_CPP
 	bool "Enable Eolian C++ bindings"
-	depends on BR2_HOST_GCC_AT_LEAST_4_8 # Eolian (host) needs C++11
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # Eolian needs C++11
 	help
 	  Eolian is an EO object parser and code generator.
 	  With this option enabled Eolian will handle automatic
 	  generation of EFL bindings for the C++11 language.
 
-comment "Eolian needs host and target gcc >= 4.8"
-	depends on !BR2_HOST_GCC_AT_LEAST_4_8 || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
+comment "Eolian needs gcc >= 4.8"
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
 
 comment "libecore video support"
 
@@ -309,7 +307,7 @@ endif # BR2_PACKAGE_EFL
 
 comment "efl needs a toolchain w/ C++, dynamic library, gcc >= 4.7, threads, wchar"
 	depends on !BR2_INSTALL_LIBSTDCPP \
-		|| !BR2_HOST_GCC_AT_LEAST_4_7 || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 \
+		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 \
 		|| BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR
 	depends on BR2_PACKAGE_LUAJIT_ARCH_SUPPORTS
 	depends on BR2_USE_MMU
diff --git a/package/gdb/Config.in.host b/package/gdb/Config.in.host
index 7baa652a60..58b6a3e770 100644
--- a/package/gdb/Config.in.host
+++ b/package/gdb/Config.in.host
@@ -12,14 +12,8 @@ comment "Host GDB Options"
 	depends on !BR2_TOOLCHAIN_EXTERNAL_GDB_SERVER_COPY
 	depends on BR2_PACKAGE_HOST_GDB_ARCH_SUPPORTS
 
-comment "host gdb needs a host gcc >= 4.8"
-	depends on BR2_PACKAGE_HOST_GDB_ARCH_SUPPORTS
-	depends on !BR2_HOST_GCC_AT_LEAST_4_8
-
 config BR2_PACKAGE_HOST_GDB
 	bool "Build cross gdb for the host"
-	# gdb >= 8.x needs C++11
-	depends on BR2_HOST_GCC_AT_LEAST_4_8
 	# When the external toolchain gdbserver is used, we shouldn't
 	# allow to build a cross-gdb, as the one of the external
 	# toolchain should be used.
@@ -59,18 +53,12 @@ choice
 
 config BR2_GDB_VERSION_8_1
 	bool "gdb 8.1.x"
-	# Needs a C++11 compiler
-	depends on BR2_HOST_GCC_AT_LEAST_4_8
 
 config BR2_GDB_VERSION_8_2
 	bool "gdb 8.2.x"
-	# Needs a C++11 compiler
-	depends on BR2_HOST_GCC_AT_LEAST_4_8
 
 config BR2_GDB_VERSION_8_3
 	bool "gdb 8.3.x"
-	# Needs a C++11 compiler
-	depends on BR2_HOST_GCC_AT_LEAST_4_8
 
 endchoice
 
diff --git a/package/google-breakpad/Config.in b/package/google-breakpad/Config.in
index 91ec9ce309..07c49996dd 100644
--- a/package/google-breakpad/Config.in
+++ b/package/google-breakpad/Config.in
@@ -6,7 +6,6 @@ config BR2_PACKAGE_GOOGLE_BREAKPAD_ARCH_SUPPORTS
 config BR2_PACKAGE_GOOGLE_BREAKPAD
 	bool "google-breakpad"
 	depends on BR2_INSTALL_LIBSTDCPP
-	depends on BR2_HOST_GCC_AT_LEAST_4_8 # C++11
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # C++11
 	depends on BR2_USE_WCHAR
 	depends on BR2_TOOLCHAIN_HAS_THREADS
@@ -41,4 +40,4 @@ comment "google-breakpad requires a glibc or uClibc toolchain w/ wchar, thread,
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
 		!BR2_TOOLCHAIN_HAS_THREADS || \
 		!(BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_UCLIBC) || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 || !BR2_HOST_GCC_AT_LEAST_4_8
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
diff --git a/package/grpc/Config.in b/package/grpc/Config.in
index 2765d0fb40..d47d840d65 100644
--- a/package/grpc/Config.in
+++ b/package/grpc/Config.in
@@ -3,7 +3,6 @@ config BR2_PACKAGE_GRPC
 	depends on BR2_INSTALL_LIBSTDCPP # protobuf
 	depends on BR2_TOOLCHAIN_HAS_THREADS # protobuf
 	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS # protobuf
-	depends on BR2_HOST_GCC_AT_LEAST_4_8 # protobuf
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # protobuf
 	depends on !BR2_STATIC_LIBS # protobuf
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 || BR2_TOOLCHAIN_HAS_ATOMIC
@@ -17,9 +16,8 @@ config BR2_PACKAGE_GRPC
 
 	  http://github.com/grpc/grpc
 
-comment "grpc needs a toolchain w/ C++, threads, dynamic library, host and target gcc >= 4.8"
+comment "grpc needs a toolchain w/ C++, threads, dynamic library, gcc >= 4.8"
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 || BR2_TOOLCHAIN_HAS_ATOMIC
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS \
-		|| BR2_STATIC_LIBS || !BR2_HOST_GCC_AT_LEAST_4_8 \
-		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
+		|| BR2_STATIC_LIBS || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
 	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS
diff --git a/package/gtkmm3/Config.in b/package/gtkmm3/Config.in
index fb64a0e697..8762c7208d 100644
--- a/package/gtkmm3/Config.in
+++ b/package/gtkmm3/Config.in
@@ -1,9 +1,8 @@
-comment "gtkmm3 needs libgtk3 and a toolchain w/ C++, wchar, threads, gcc >= 4.9, host gcc >= 4.8"
+comment "gtkmm3 needs libgtk3 and a toolchain w/ C++, wchar, threads, gcc >= 4.9"
 	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || !BR2_USE_WCHAR \
 		|| !BR2_INSTALL_LIBSTDCPP || !BR2_PACKAGE_LIBGTK3 \
-		|| !BR2_HOST_GCC_AT_LEAST_4_8 \
 		|| !BR2_TOOLCHAIN_HAS_THREADS
 
 config BR2_PACKAGE_GTKMM3
@@ -16,7 +15,6 @@ config BR2_PACKAGE_GTKMM3
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # pangomm, libgtk3 -> pango -> harfbuzz
 	depends on BR2_INSTALL_LIBSTDCPP # glibmm, libpangomm -> glibmm/pango
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # C++11
-	depends on BR2_HOST_GCC_AT_LEAST_4_8 # libgtk3 -> pango -> harfbuzz
 	depends on BR2_TOOLCHAIN_HAS_THREADS # *mm/libgtk3 -> libglib2
 	depends on BR2_USE_MMU # *mm/libgtk3 -> libglib2
 	depends on BR2_USE_WCHAR # *mm/libgtk3 -> libglib2
diff --git a/package/icu/Config.in b/package/icu/Config.in
index fde486b600..32f35b9d96 100644
--- a/package/icu/Config.in
+++ b/package/icu/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_ICU
 	bool "icu"
-	depends on BR2_HOST_GCC_AT_LEAST_4_8
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_WCHAR
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
@@ -27,9 +26,8 @@ config BR2_PACKAGE_ICU_CUSTOM_DATA_PATH
 
 endif
 
-comment "icu needs a toolchain w/ C++, wchar, threads, gcc >= 4.8, host gcc >= 4.8"
+comment "icu needs a toolchain w/ C++, wchar, threads, gcc >= 4.8"
 	depends on !BR2_BINFMT_FLAT
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
 		!BR2_TOOLCHAIN_HAS_THREADS || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 || \
-		!BR2_HOST_GCC_AT_LEAST_4_8
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
diff --git a/package/imagemagick/Config.in.host b/package/imagemagick/Config.in.host
index 5a87a130ee..bbe23baa6f 100644
--- a/package/imagemagick/Config.in.host
+++ b/package/imagemagick/Config.in.host
@@ -16,7 +16,6 @@ if BR2_PACKAGE_HOST_IMAGEMAGICK
 
 config BR2_PACKAGE_HOST_IMAGEMAGICK_SVG
 	bool "SVG support"
-	depends on BR2_HOST_GCC_AT_LEAST_4_8 # host-librsvg -> host-pango -> host-harfbuzz
 	help
 	  Say 'y' here is you need ImageMagick tools (like convert)
 	  to support SVG.
@@ -24,7 +23,4 @@ config BR2_PACKAGE_HOST_IMAGEMAGICK_SVG
 	  This is not enabled by default, as it brings quite a few
 	  extra dependencies, and thus extra build time.
 
-comment "SVG support needs host gcc >= 4.8"
-	depends on !BR2_HOST_GCC_AT_LEAST_4_8
-
 endif
diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index e8a504312c..40bee1b898 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -5,11 +5,10 @@ config BR2_PACKAGE_KODI_ARCH_SUPPORTS
 	depends on !(BR2_i386 && !BR2_X86_CPU_HAS_SSE)
 	depends on BR2_USE_MMU # libcdio, and others
 
-comment "kodi needs python w/ .py modules, a uClibc or glibc toolchain w/ C++, threads, wchar, dynamic library, gcc >= 4.8, host gcc >= 4.6"
+comment "kodi needs python w/ .py modules, a uClibc or glibc toolchain w/ C++, threads, wchar, dynamic library, gcc >= 4.8"
 	depends on BR2_PACKAGE_KODI_ARCH_SUPPORTS
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS \
 		|| !BR2_USE_WCHAR || BR2_STATIC_LIBS \
-		|| !BR2_HOST_GCC_AT_LEAST_4_6 \
 		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 \
 		|| BR2_TOOLCHAIN_USES_MUSL \
 		|| !BR2_PACKAGE_PYTHON \
@@ -41,7 +40,6 @@ comment "kodi needs an OpenGL EGL backend with OpenGL support"
 menuconfig BR2_PACKAGE_KODI
 	bool "kodi"
 	depends on BR2_INSTALL_LIBSTDCPP
-	depends on BR2_HOST_GCC_AT_LEAST_4_6
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on !BR2_TOOLCHAIN_USES_MUSL
diff --git a/package/kvm-unit-tests/Config.in b/package/kvm-unit-tests/Config.in
index 8b7908eee9..e470dd6157 100644
--- a/package/kvm-unit-tests/Config.in
+++ b/package/kvm-unit-tests/Config.in
@@ -14,7 +14,6 @@ config BR2_PACKAGE_KVM_UNIT_TESTS
 	# gcc 4.5 at least. on i386, we use the target gcc, while on
 	# x86-64 we use the host gcc (see .mk file for details)
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_5 || !BR2_i386
-	depends on BR2_HOST_GCC_AT_LEAST_4_5 || !BR2_x86_64
 	depends on BR2_HOSTARCH = "x86_64" || !BR2_x86_64
 	select BR2_HOSTARCH_NEEDS_IA32_COMPILER if BR2_x86_64=y
 	help
@@ -38,7 +37,3 @@ config BR2_PACKAGE_KVM_UNIT_TESTS
 comment "kvm-unit-tests needs a toolchain w/ gcc >= 4.5"
 	depends on BR2_i386
 	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_5
-
-comment "kvm-unit-tests needs a host gcc >= 4.5"
-	depends on BR2_x86_64
-	depends on !BR2_HOST_GCC_AT_LEAST_4_5
diff --git a/package/libclc/Config.in b/package/libclc/Config.in
index 4bba6a9175..797f090bfc 100644
--- a/package/libclc/Config.in
+++ b/package/libclc/Config.in
@@ -1,7 +1,6 @@
 config BR2_PACKAGE_LIBCLC
 	bool "libclc"
 	depends on BR2_PACKAGE_LLVM_ARCH_SUPPORTS
-	depends on BR2_HOST_GCC_AT_LEAST_4_8
 	help
 	  libclc is an open source, BSD licensed implementation of
 	  the library requirements of the OpenCL C programming language,
diff --git a/package/libgtk3/Config.in b/package/libgtk3/Config.in
index 72737d6e2f..6b8f5abff6 100644
--- a/package/libgtk3/Config.in
+++ b/package/libgtk3/Config.in
@@ -1,9 +1,8 @@
-comment "libgtk3 needs a toolchain w/ wchar, threads, C++, gcc >= 4.8, host gcc >= 4.8"
+comment "libgtk3 needs a toolchain w/ wchar, threads, C++, gcc >= 4.8"
 	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_USE_WCHAR || !BR2_INSTALL_LIBSTDCPP || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 || \
-		!BR2_HOST_GCC_AT_LEAST_4_8 || \
 		!BR2_TOOLCHAIN_HAS_THREADS
 
 comment "libgtk3 needs an OpenGL or an OpenGL-EGL/wayland backend"
@@ -20,8 +19,6 @@ config BR2_PACKAGE_LIBGTK3
 	depends on BR2_INSTALL_LIBSTDCPP # pango
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # pango -> harfbuzz
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # pango -> harfbuzz
-	# host-libgtk3 -> host-librsvg -> host-pango -> host-harfbuzz
-	depends on BR2_HOST_GCC_AT_LEAST_4_8
 	depends on BR2_PACKAGE_HAS_LIBEGL_WAYLAND || \
 		BR2_PACKAGE_HAS_LIBGL
 	select BR2_PACKAGE_ATK
diff --git a/package/lld/Config.in.host b/package/lld/Config.in.host
index 86ba3ff6ff..f016f3445e 100644
--- a/package/lld/Config.in.host
+++ b/package/lld/Config.in.host
@@ -1,7 +1,6 @@
 config BR2_PACKAGE_HOST_LLD
 	bool "host lld"
 	depends on BR2_PACKAGE_LLVM_ARCH_SUPPORTS # llvm
-	depends on BR2_HOST_GCC_AT_LEAST_4_8 # llvm
 	help
 	  LLD is a linker from the LLVM project that is a drop-in
 	  replacement for system linkers, and runs much faster than
@@ -9,7 +8,3 @@ config BR2_PACKAGE_HOST_LLD
 	  toolchain developers.
 
 	  https://lld.llvm.org/
-
-comment "lld needs a toolchain w/ host gcc >= 4.8"
-	depends on BR2_PACKAGE_LLVM_ARCH_SUPPORTS
-	depends on !BR2_HOST_GCC_AT_LEAST_4_8
diff --git a/package/llvm/Config.in b/package/llvm/Config.in
index e235efed9a..1d21d879da 100644
--- a/package/llvm/Config.in
+++ b/package/llvm/Config.in
@@ -14,7 +14,6 @@ config BR2_PACKAGE_LLVM_TARGET_ARCH
 config BR2_PACKAGE_LLVM
 	bool "llvm"
 	depends on BR2_PACKAGE_LLVM_ARCH_SUPPORTS
-	depends on BR2_HOST_GCC_AT_LEAST_4_8
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_INSTALL_LIBSTDCPP
@@ -50,10 +49,10 @@ config BR2_PACKAGE_LLVM_RTTI
 
 endif
 
-comment "llvm needs a toolchain w/ wchar, threads, C++, gcc >= 4.8, host gcc >= 4.8, dynamic library"
+comment "llvm needs a toolchain w/ wchar, threads, C++, gcc >= 4.8, dynamic library"
 	depends on BR2_PACKAGE_LLVM_ARCH_SUPPORTS
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP || \
-		!BR2_HOST_GCC_AT_LEAST_4_8 || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 \
 		|| BR2_STATIC_LIBS || !BR2_USE_WCHAR
 
 comment "llvm needs a toolchain not affected by GCC bug 64735"
diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index 3b23467a12..d247f57846 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -23,7 +23,6 @@ config BR2_PACKAGE_MESA3D_NEEDS_ELFUTILS
 config BR2_PACKAGE_MESA3D_LLVM
 	bool "llvm support"
 	depends on BR2_PACKAGE_LLVM_ARCH_SUPPORTS
-	depends on BR2_HOST_GCC_AT_LEAST_4_8
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_INSTALL_LIBSTDCPP
@@ -32,10 +31,10 @@ config BR2_PACKAGE_MESA3D_LLVM
 	depends on BR2_USE_WCHAR # std::wstring
 	select BR2_PACKAGE_LLVM
 
-comment "llvm support needs a toolchain w/ wchar, threads, C++, gcc >= 4.8, host gcc >= 4.8, dynamic library"
+comment "llvm support needs a toolchain w/ wchar, threads, C++, gcc >= 4.8, dynamic library"
 	depends on BR2_PACKAGE_LLVM_ARCH_SUPPORTS
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP || \
-		!BR2_HOST_GCC_AT_LEAST_4_8 || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 \
 		|| BR2_STATIC_LIBS || !BR2_USE_WCHAR
 
 comment "llvm support needs a toolchain not affected by GCC bug 64735"
diff --git a/package/mfgtools/Config.in.host b/package/mfgtools/Config.in.host
index 4bbdde38e2..6f2f3a3268 100644
--- a/package/mfgtools/Config.in.host
+++ b/package/mfgtools/Config.in.host
@@ -1,10 +1,6 @@
-comment "mfgtools needs host gcc >= 4.8"
-	depends on !BR2_HOST_GCC_AT_LEAST_4_8
-
 config BR2_PACKAGE_HOST_MFGTOOLS
 	bool "host mfgtools"
 	depends on BR2_arm
-	depends on BR2_HOST_GCC_AT_LEAST_4_8 # needs C++11
 	help
 	  This package contains the Freescale manufacturing tool.
 	  It is designed to program firmware to i.MX boards during
diff --git a/package/midori/Config.in b/package/midori/Config.in
index f0767c85f9..64139ce49e 100644
--- a/package/midori/Config.in
+++ b/package/midori/Config.in
@@ -1,7 +1,7 @@
-comment "midori needs libgtk3 and a glibc toolchain w/ C++, gcc >= 6, host gcc >= 4.8"
+comment "midori needs libgtk3 and a glibc toolchain w/ C++, gcc >= 6"
 	depends on BR2_PACKAGE_WEBKITGTK_ARCH_SUPPORTS
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_PACKAGE_LIBGTK3 || \
-		!BR2_HOST_GCC_AT_LEAST_4_8 || !BR2_TOOLCHAIN_GCC_AT_LEAST_6 || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_6 || \
 		!BR2_TOOLCHAIN_USES_GLIBC
 
 config BR2_PACKAGE_MIDORI
@@ -9,7 +9,6 @@ config BR2_PACKAGE_MIDORI
 	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS # libgcrypt, gcr, gnupg2
 	depends on BR2_PACKAGE_LIBGTK3
 	depends on BR2_INSTALL_LIBSTDCPP # webkitgtk
-	depends on BR2_HOST_GCC_AT_LEAST_4_8 # webkitgtk -> icu
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_6 # webkitgtk
 	depends on BR2_TOOLCHAIN_USES_GLIBC # webkitgtk
 	depends on BR2_PACKAGE_WEBKITGTK_ARCH_SUPPORTS
diff --git a/package/mosh/Config.in b/package/mosh/Config.in
index 00da41c794..5b90358cac 100644
--- a/package/mosh/Config.in
+++ b/package/mosh/Config.in
@@ -1,7 +1,7 @@
-comment "mosh needs a toolchain w/ C++, threads, dynamic library, wchar, host and target gcc >= 4.8"
+comment "mosh needs a toolchain w/ C++, threads, dynamic library, wchar, gcc >= 4.8"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP \
 		|| BR2_STATIC_LIBS || !BR2_USE_WCHAR \
-		|| !BR2_HOST_GCC_AT_LEAST_4_8 || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
+		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
 	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS
 
 config BR2_PACKAGE_MOSH
@@ -9,7 +9,6 @@ config BR2_PACKAGE_MOSH
 	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS
 	depends on BR2_INSTALL_LIBSTDCPP # protobuf
 	depends on BR2_TOOLCHAIN_HAS_THREADS # protobuf
-	depends on BR2_HOST_GCC_AT_LEAST_4_8 # protobuf
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # protobuf
 	depends on !BR2_STATIC_LIBS # protobuf
 	depends on BR2_USE_WCHAR
diff --git a/package/php/Config.ext b/package/php/Config.ext
index d71cfb9986..c7f0332fd8 100644
--- a/package/php/Config.ext
+++ b/package/php/Config.ext
@@ -204,7 +204,6 @@ config BR2_PACKAGE_PHP_EXT_ICONV
 
 config BR2_PACKAGE_PHP_EXT_INTL
 	bool "intl"
-	depends on BR2_HOST_GCC_AT_LEAST_4_8 # icu
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_WCHAR
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # icu
@@ -215,12 +214,11 @@ config BR2_PACKAGE_PHP_EXT_INTL
 	help
 	  Internationalization support
 
-comment "intl support needs a toolchain w/ C++, wchar, threads, dynamic library, gcc >= 4.8, host gcc >= 4.8"
+comment "intl support needs a toolchain w/ C++, wchar, threads, dynamic library, gcc >= 4.8"
 	depends on !BR2_BINFMT_FLAT
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
 		!BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 || \
-		!BR2_HOST_GCC_AT_LEAST_4_8
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
 
 config BR2_PACKAGE_PHP_EXT_MBSTRING
 	bool "mbstring"
diff --git a/package/protobuf-c/Config.in b/package/protobuf-c/Config.in
index 6d7e7e11df..a32e6cd9e8 100644
--- a/package/protobuf-c/Config.in
+++ b/package/protobuf-c/Config.in
@@ -4,14 +4,12 @@ config BR2_PACKAGE_PROTOBUF_C
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	# host-protobuf only builds on certain architectures
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
-	depends on BR2_HOST_GCC_AT_LEAST_4_8 # host-protobuf
 	help
 	  Code generator and runtime libraries to use Protocol Buffers
 	  from pure C (not C++).
 
 	  https://github.com/protobuf-c/protobuf-c
 
-comment "protobuf-c needs a toolchain w/ C++, threads, host gcc >= 4.8"
-	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS \
-		|| !BR2_HOST_GCC_AT_LEAST_4_8
+comment "protobuf-c needs a toolchain w/ C++, threads"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
diff --git a/package/protobuf/Config.in b/package/protobuf/Config.in
index 2829b2a5a7..46c820b9cf 100644
--- a/package/protobuf/Config.in
+++ b/package/protobuf/Config.in
@@ -30,7 +30,6 @@ config BR2_PACKAGE_PROTOBUF
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS
-	depends on BR2_HOST_GCC_AT_LEAST_4_8 # C++11
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # C++11
 	depends on !BR2_STATIC_LIBS
 	help
@@ -40,8 +39,7 @@ config BR2_PACKAGE_PROTOBUF
 
 	  https://developers.google.com/protocol-buffers
 
-comment "protobuf needs a toolchain w/ C++, threads, dynamic library, host and target gcc >= 4.8"
+comment "protobuf needs a toolchain w/ C++, threads, dynamic library, gcc >= 4.8"
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS \
-		|| BR2_STATIC_LIBS || !BR2_HOST_GCC_AT_LEAST_4_8 \
-		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
+		|| BR2_STATIC_LIBS || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
 	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS
diff --git a/package/python-mwscrape2slob/Config.in b/package/python-mwscrape2slob/Config.in
index 7856a2c009..dc2b2ae3bd 100644
--- a/package/python-mwscrape2slob/Config.in
+++ b/package/python-mwscrape2slob/Config.in
@@ -2,7 +2,6 @@ config BR2_PACKAGE_PYTHON_MWSCRAPE2SLOB
 	bool "python-mwscrape2slob"
 	depends on !BR2_BINFMT_FLAT # python-slob -> python-pyicu -> icu
 	depends on BR2_INSTALL_LIBSTDCPP # python-slob -> python-pyicu -> icu
-	depends on BR2_HOST_GCC_AT_LEAST_4_8 # python-slob -> python-pyicu -> icu
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # python-slob -> python-pyicu -> icu
 	depends on BR2_PACKAGE_PYTHON3
 	select BR2_PACKAGE_PYTHON_COUCHDB # runtime
@@ -16,8 +15,7 @@ config BR2_PACKAGE_PYTHON_MWSCRAPE2SLOB
 
 	  https://github.com/itkach/mwscrape2slob
 
-comment "python-mwscrape2slob needs a toolchain w/ C++, gcc >= 4.8, host gcc >= 4.8"
+comment "python-mwscrape2slob needs a toolchain w/ C++, gcc >= 4.8"
 	depends on BR2_PACKAGE_PYTHON3 && !BR2_BINFMT_FLAT
 	depends on !BR2_INSTALL_LIBSTDCPP || \
-		!BR2_HOST_GCC_AT_LEAST_4_8 || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
diff --git a/package/python-protobuf/Config.in b/package/python-protobuf/Config.in
index 8a70e80ad7..c53ef7f822 100644
--- a/package/python-protobuf/Config.in
+++ b/package/python-protobuf/Config.in
@@ -2,7 +2,6 @@ config BR2_PACKAGE_PYTHON_PROTOBUF
 	bool "python-protobuf"
 	# host-protobuf only builds on certain architectures
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
-	depends on BR2_HOST_GCC_AT_LEAST_4_8 # host-protobuf
 	select BR2_PACKAGE_PYTHON_SIX # runtime
 	help
 	  Python implementation of the Google Protocol Buffers.
diff --git a/package/python-pyicu/Config.in b/package/python-pyicu/Config.in
index 2d9624c116..efab0853e4 100644
--- a/package/python-pyicu/Config.in
+++ b/package/python-pyicu/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_PYTHON_PYICU
 	bool "python-pyicu"
-	depends on BR2_HOST_GCC_AT_LEAST_4_8 # icu
 	depends on !BR2_BINFMT_FLAT # icu
 	depends on BR2_INSTALL_LIBSTDCPP # icu
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # icu
@@ -10,8 +9,7 @@ config BR2_PACKAGE_PYTHON_PYICU
 
 	  https://github.com/ovalhub/pyicu
 
-comment "python-pyicu needs a toolchain w/ C++, gcc >= 4.8, host gcc >= 4.8"
+comment "python-pyicu needs a toolchain w/ C++, gcc >= 4.8"
 	depends on !BR2_BINFMT_FLAT
 	depends on !BR2_INSTALL_LIBSTDCPP || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 || \
-		!BR2_HOST_GCC_AT_LEAST_4_8
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
diff --git a/package/python-slob/Config.in b/package/python-slob/Config.in
index 6f83808abf..a8b6e45da4 100644
--- a/package/python-slob/Config.in
+++ b/package/python-slob/Config.in
@@ -2,7 +2,6 @@ config BR2_PACKAGE_PYTHON_SLOB
 	bool "python-slob"
 	depends on !BR2_BINFMT_FLAT # python-pyicu -> icu
 	depends on BR2_INSTALL_LIBSTDCPP # python-pyicu -> icu
-	depends on BR2_HOST_GCC_AT_LEAST_4_8 # python-pyicu -> icu
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # python-pyicu -> icu
 	depends on BR2_PACKAGE_PYTHON3
 	select BR2_PACKAGE_PYTHON_PYICU # runtime
@@ -14,8 +13,7 @@ config BR2_PACKAGE_PYTHON_SLOB
 
 	  https://github.com/itkach/slob
 
-comment "python-slob needs a toolchain w/ C++, gcc >= 4.8, host gcc >= 4.8"
+comment "python-slob needs a toolchain w/ C++, gcc >= 4.8"
 	depends on BR2_PACKAGE_PYTHON3 && !BR2_BINFMT_FLAT
 	depends on !BR2_INSTALL_LIBSTDCPP || \
-		!BR2_HOST_GCC_AT_LEAST_4_8 || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
diff --git a/package/qt-webkit-kiosk/Config.in b/package/qt-webkit-kiosk/Config.in
index 71b4f8346a..71f7daaa26 100644
--- a/package/qt-webkit-kiosk/Config.in
+++ b/package/qt-webkit-kiosk/Config.in
@@ -3,7 +3,6 @@ config BR2_PACKAGE_QT_WEBKIT_KIOSK
 	depends on BR2_PACKAGE_QT5
 	depends on !BR2_STATIC_LIBS # qt5webkit
 	depends on BR2_PACKAGE_QT5_JSCORE_AVAILABLE # qt5webkit
-	depends on BR2_HOST_GCC_AT_LEAST_4_8 # qt5webkit -> icu
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # qt5webkit -> icu
 	depends on !BR2_BINFMT_FLAT # qt5webkit -> icu
 	depends on !BR2_MIPS_SOFT_FLOAT # qt5webkit
@@ -24,9 +23,8 @@ config BR2_PACKAGE_QT_WEBKIT_KIOSK_SOUNDS
 
 endif
 
-comment "qt-webkit-kiosk needs a toolchain w/ dynamic library, gcc >= 4.8, host gcc >= 4.8"
-	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 || \
-		!BR2_HOST_GCC_AT_LEAST_4_8
+comment "qt-webkit-kiosk needs a toolchain w/ dynamic library, gcc >= 4.8"
+	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
 	depends on BR2_PACKAGE_QT5_JSCORE_AVAILABLE
 	depends on !BR2_BINFMT_FLAT
 	depends on !BR2_MIPS_SOFT_FLOAT
diff --git a/package/qt5/Config.in b/package/qt5/Config.in
index 6476745a8d..def79fa680 100644
--- a/package/qt5/Config.in
+++ b/package/qt5/Config.in
@@ -35,7 +35,6 @@ choice
 config BR2_PACKAGE_QT5_VERSION_LATEST
 	bool "Latest (5.12)"
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # C++11
-	depends on BR2_HOST_GCC_AT_LEAST_4_8 # C++11
 	depends on !BR2_ARM_CPU_ARMV4 # needs ARMv5+
 	# no built-in double-conversion support
 	depends on !BR2_arc && !BR2_nios2 && !BR2_xtensa
@@ -43,8 +42,8 @@ config BR2_PACKAGE_QT5_VERSION_LATEST
 	  This option builds Qt 5.12, which is licensed under
 	  (L)GPL-3.0+.
 
-comment "Latest Qt version needs host/toolchain w/ gcc >= 4.8"
-	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 || !BR2_HOST_GCC_AT_LEAST_4_8
+comment "Latest Qt version needs a toolchain w/ gcc >= 4.8"
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
 	depends on !BR2_ARM_CPU_ARMV4
 	depends on !BR2_arc && !BR2_nios2 && !BR2_xtensa
 
diff --git a/package/qt5/qt5base/Config.in b/package/qt5/qt5base/Config.in
index c2f1736d95..2b4ed13876 100644
--- a/package/qt5/qt5base/Config.in
+++ b/package/qt5/qt5base/Config.in
@@ -275,7 +275,6 @@ config BR2_PACKAGE_QT5BASE_DBUS
 
 config BR2_PACKAGE_QT5BASE_ICU
 	bool "Enable ICU support"
-	depends on BR2_HOST_GCC_AT_LEAST_4_8 # icu
 	depends on !BR2_BINFMT_FLAT # icu
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # icu
 	select BR2_PACKAGE_ICU
@@ -283,10 +282,9 @@ config BR2_PACKAGE_QT5BASE_ICU
 	  This option enables ICU support in Qt5. This is for example
 	  needed for Qt5Webkit.
 
-comment "icu support needs a toolchain w/ gcc >= 4.8, host gcc >= 4.8"
+comment "icu support needs a toolchain w/ gcc >= 4.8"
 	depends on !BR2_BINFMT_FLAT
-	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 || \
-		!BR2_HOST_GCC_AT_LEAST_4_8
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
 
 config BR2_PACKAGE_QT5BASE_OPENSSL
 	bool
diff --git a/package/qt5/qt5tools/Config.in b/package/qt5/qt5tools/Config.in
index 7e79a679b3..14178abc29 100644
--- a/package/qt5/qt5tools/Config.in
+++ b/package/qt5/qt5tools/Config.in
@@ -19,14 +19,9 @@ config BR2_PACKAGE_QT5TOOLS_LINGUIST_TOOLS
 
 config BR2_PACKAGE_QT5TOOLS_QDOC_TOOL
 	bool "qdoc host tool"
-	depends on !BR2_PACKAGE_QT5_VERSION_LATEST \
-		|| BR2_HOST_GCC_AT_LEAST_4_8 # host-clang
 	help
 	  This option enables the qdoc host tool.
 
-comment "qdoc host tool needs host gcc >= 4.8"
-	depends on BR2_PACKAGE_QT5_VERSION_LATEST && !BR2_HOST_GCC_AT_LEAST_4_8
-
 config BR2_PACKAGE_QT5TOOLS_PIXELTOOL
 	bool "pixeltool"
 	select BR2_PACKAGE_QT5BASE_GUI
diff --git a/package/qt5/qt5webengine/Config.in b/package/qt5/qt5webengine/Config.in
index 969582712e..0e776ecb61 100644
--- a/package/qt5/qt5webengine/Config.in
+++ b/package/qt5/qt5webengine/Config.in
@@ -10,10 +10,10 @@ config BR2_PACKAGE_QT5WEBENGINE_ARCH_SUPPORTS
 	depends on !BR2_BINFMT_FLAT # qt5base-icu
 	depends on BR2_USE_MMU # libglib2, qt5base-dbus
 
-comment "qt5webengine needs udev /dev management and a glibc toolchain w/ gcc >= 4.8, host gcc >= 4.8, threads, wchar"
+comment "qt5webengine needs udev /dev management and a glibc toolchain w/ gcc >= 4.8, threads, wchar"
 	depends on BR2_PACKAGE_QT5WEBENGINE_ARCH_SUPPORTS
 	depends on !BR2_PACKAGE_HAS_UDEV || !BR2_TOOLCHAIN_USES_GLIBC || \
-		!BR2_HOST_GCC_AT_LEAST_4_8 || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 || \
 		!BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR
 
 comment "qt5webengine needs an OpenGL and EGL-capable backend"
@@ -24,7 +24,6 @@ config BR2_PACKAGE_QT5WEBENGINE
 	bool "qt5webengine"
 	depends on BR2_PACKAGE_QT5WEBENGINE_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_USES_GLIBC # execinfo.h, mallinfo
-	depends on BR2_HOST_GCC_AT_LEAST_4_8 # qt5base-icu
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # qt5base-icu
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2, libvpx, qt5base-dbus
 	depends on BR2_USE_WCHAR # libglib2
diff --git a/package/qt5/qt5webkit/Config.in b/package/qt5/qt5webkit/Config.in
index e8008f7bab..e071dff208 100644
--- a/package/qt5/qt5webkit/Config.in
+++ b/package/qt5/qt5webkit/Config.in
@@ -2,7 +2,6 @@ config BR2_PACKAGE_QT5WEBKIT
 	bool "qt5webkit"
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_PACKAGE_QT5_JSCORE_AVAILABLE
-	depends on BR2_HOST_GCC_AT_LEAST_4_8 # icu
 	depends on BR2_INSTALL_LIBSTDCPP # leveldb
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # icu
 	depends on BR2_TOOLCHAIN_HAS_THREADS # leveldb
@@ -32,9 +31,8 @@ config BR2_PACKAGE_QT5WEBKIT
 
 	  http://doc.qt.io/archives/qt-5.5/qtwebkit-index.html
 
-comment "qt5webkit needs a toolchain w/ dynamic library, gcc >= 4.8, host gcc >= 4.8"
-	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 || \
-		!BR2_HOST_GCC_AT_LEAST_4_8
+comment "qt5webkit needs a toolchain w/ dynamic library, gcc >= 4.8"
+	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
 	depends on BR2_PACKAGE_QT5_JSCORE_AVAILABLE
 	depends on !BR2_BINFMT_FLAT
 	depends on !BR2_MIPS_SOFT_FLOAT
diff --git a/package/riemann-c-client/Config.in b/package/riemann-c-client/Config.in
index c241487c7f..e9982b2fb0 100644
--- a/package/riemann-c-client/Config.in
+++ b/package/riemann-c-client/Config.in
@@ -3,7 +3,6 @@ config BR2_PACKAGE_RIEMANN_C_CLIENT
 	depends on BR2_INSTALL_LIBSTDCPP # protobuf-c
 	depends on BR2_TOOLCHAIN_HAS_THREADS # protobuf-c
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86" # protobuf-c
-	depends on BR2_HOST_GCC_AT_LEAST_4_8 # protobuf-c
 	select BR2_PACKAGE_PROTOBUF_C
 	help
 	  Riemann-c-client is a C client library for the Riemann
@@ -13,7 +12,6 @@ config BR2_PACKAGE_RIEMANN_C_CLIENT
 
 	  https://github.com/algernon/riemann-c-client
 
-comment "riemann-c-client needs a toolchain w/ C++, threads, host gcc >= 4.8"
-	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS \
-		|| !BR2_HOST_GCC_AT_LEAST_4_8
+comment "riemann-c-client needs a toolchain w/ C++, threads"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
diff --git a/package/rustc/Config.in.host b/package/rustc/Config.in.host
index c58ffdf352..d595efbc6f 100644
--- a/package/rustc/Config.in.host
+++ b/package/rustc/Config.in.host
@@ -49,7 +49,6 @@ choice
 
 config BR2_PACKAGE_HOST_RUST
 	bool "host rust"
-	depends on BR2_HOST_GCC_AT_LEAST_4_7 # required by LLVM
 	# triggers ICE on trunc_int_for_mode, at explow.c:56
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5 || !BR2_aarch64
 	help
@@ -61,9 +60,6 @@ comment "host-rust needs a toolchain w/ gcc >= 5"
 	depends on BR2_aarch64
 	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_5
 
-comment "host-rust needs host gcc >= 4.7"
-	depends on !BR2_HOST_GCC_AT_LEAST_4_7
-
 config BR2_PACKAGE_HOST_RUST_BIN
 	bool "host rust (pre-built)"
 	help
diff --git a/package/vte/Config.in b/package/vte/Config.in
index 5710ee9e0f..fa29de8c71 100644
--- a/package/vte/Config.in
+++ b/package/vte/Config.in
@@ -5,7 +5,6 @@ config BR2_PACKAGE_VTE
 	depends on BR2_USE_MMU
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # C++11
-	depends on BR2_HOST_GCC_AT_LEAST_4_8 # libgtk3 -> pango -> harfbuzz
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on BR2_PACKAGE_HAS_LIBEGL_WAYLAND || \
 		BR2_PACKAGE_HAS_LIBGL
@@ -22,12 +21,11 @@ config BR2_PACKAGE_VTE
 
 	  http://github.com/GNOME/vte
 
-comment "vte needs a toolchain w/ wchar, threads, C++, gcc >= 4.8, host gcc >= 4.8"
+comment "vte needs a toolchain w/ wchar, threads, C++, gcc >= 4.8"
 	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_USE_WCHAR || !BR2_INSTALL_LIBSTDCPP || \
 		!BR2_TOOLCHAIN_HAS_THREADS || \
-		!BR2_HOST_GCC_AT_LEAST_4_8 || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
 
 comment "vte needs an OpenGL or an OpenGL-EGL/wayland backend"
diff --git a/package/webkitgtk/Config.in b/package/webkitgtk/Config.in
index db67c89042..4fbf5a190a 100644
--- a/package/webkitgtk/Config.in
+++ b/package/webkitgtk/Config.in
@@ -12,18 +12,16 @@ config BR2_PACKAGE_WEBKITGTK_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS # libgcrypt
 
-comment "webkitgtk needs libgtk3 and a glibc toolchain w/ C++, gcc >= 6, host gcc >= 4.8"
+comment "webkitgtk needs libgtk3 and a glibc toolchain w/ C++, gcc >= 6"
 	depends on BR2_PACKAGE_WEBKITGTK_ARCH_SUPPORTS
 	depends on !BR2_PACKAGE_LIBGTK3 || !BR2_INSTALL_LIBSTDCPP || \
 		!BR2_TOOLCHAIN_USES_GLIBC || \
-		!BR2_HOST_GCC_AT_LEAST_4_8 || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_6
 	depends on BR2_USE_MMU
 
 config BR2_PACKAGE_WEBKITGTK
 	bool "webkitgtk"
 	depends on BR2_INSTALL_LIBSTDCPP
-	depends on BR2_HOST_GCC_AT_LEAST_4_8 # icu
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_6
 	depends on BR2_TOOLCHAIN_USES_GLIBC
 	depends on BR2_PACKAGE_LIBGTK3
diff --git a/package/wpewebkit/Config.in b/package/wpewebkit/Config.in
index 5f3e237c53..f1460db20e 100644
--- a/package/wpewebkit/Config.in
+++ b/package/wpewebkit/Config.in
@@ -12,12 +12,12 @@ config BR2_PACKAGE_WPEWEBKIT_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS # libgcrypt
 
-comment "wpewebkit needs a toolchain w/ C++, wchar, threads, dynamic library, gcc >= 6, host gcc >= 4.8"
+comment "wpewebkit needs a toolchain w/ C++, wchar, threads, dynamic library, gcc >= 6"
 	depends on BR2_PACKAGE_WPEWEBKIT_ARCH_SUPPORTS
 	depends on !BR2_BINFMT_FLAT
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR \
 		|| !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS \
-		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_6 || !BR2_HOST_GCC_AT_LEAST_4_8
+		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_6
 
 comment "wpewebkit needs an OpenGL ES w/ EGL-capable Wayland backend"
 	depends on BR2_PACKAGE_WPEWEBKIT_ARCH_SUPPORTS
@@ -32,7 +32,6 @@ config BR2_PACKAGE_WPEWEBKIT
 	depends on BR2_INSTALL_LIBSTDCPP # harfbuzz, icu
 	depends on BR2_TOOLCHAIN_HAS_THREADS # wayland, icu, libsoup
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_6
-	depends on BR2_HOST_GCC_AT_LEAST_4_8 # icu
 	depends on BR2_USE_WCHAR # icu, libsoup
 	depends on BR2_PACKAGE_HAS_LIBGLES # libepoxy
 	depends on BR2_PACKAGE_HAS_LIBEGL # libepoxy
-- 
2.20.1
