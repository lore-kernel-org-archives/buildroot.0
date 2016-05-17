From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 17 May 2016 15:25:18 +0200
Subject: [Buildroot] [git commit branch/next] boost: remove
	BR2_PACKAGE_BOOST_ARCH_SUPPORTS option
Message-ID: <20160517132559.4F98D81E92@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=668ce456448d671f30bf98c4d4819a88b0bf9f4e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

The BR2_PACKAGE_BOOST_ARCH_SUPPORTS option was originally added in
commit feeab03fa68a02733ae9382b7d47d9eb0d785188 to be able to disable
Boost on broken NIOSII CodeSourcery toolchains.

However, since then, the CodeSourcery toolchain has been updated, and
once the fenv problem is fixed, this NIOSII toolchain is capable of
building Boost.

Thanks to this we can completely get rid of the
BR2_PACKAGE_BOOST_ARCH_SUPPORTS symbol, from boost itself and from all
its reverse dependencies.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/boost/Config.in            | 5 -----
 package/cc-tool/Config.in          | 2 --
 package/gnuradio/Config.in         | 2 --
 package/kodi/Config.in             | 1 -
 package/libftdi/Config.in          | 2 --
 package/libftdi1/Config.in         | 2 --
 package/libserial/Config.in        | 2 --
 package/mpd/Config.in              | 2 --
 package/pulseview/Config.in        | 2 --
 package/python-libconfig/Config.in | 2 --
 package/thrift/Config.in           | 2 --
 package/valijson/Config.in         | 2 --
 package/yaml-cpp/Config.in         | 2 --
 package/zmqpp/Config.in            | 2 --
 14 files changed, 30 deletions(-)

diff --git a/package/boost/Config.in b/package/boost/Config.in
index ed67285..4cfd44e 100644
--- a/package/boost/Config.in
+++ b/package/boost/Config.in
@@ -1,14 +1,9 @@
 comment "boost needs a toolchain w/ C++, threads, wchar"
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR
 
-config BR2_PACKAGE_BOOST_ARCH_SUPPORTS
-	bool
-	default y if !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII
-
 config BR2_PACKAGE_BOOST
 	bool "boost"
 	depends on BR2_INSTALL_LIBSTDCPP
-	depends on BR2_PACKAGE_BOOST_ARCH_SUPPORTS
 	# Boost could theorically be built with threading=single, but
 	# that unfortunately doesn't work. Until someone fixes that,
 	# let's depend on threads.
diff --git a/package/cc-tool/Config.in b/package/cc-tool/Config.in
index f8e4531..b2cf979 100644
--- a/package/cc-tool/Config.in
+++ b/package/cc-tool/Config.in
@@ -2,7 +2,6 @@ config BR2_PACKAGE_CC_TOOL
 	bool "cc-tool"
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS
-	depends on BR2_PACKAGE_BOOST_ARCH_SUPPORTS
 	depends on BR2_USE_WCHAR # boost-filesystem
 	select BR2_PACKAGE_LIBUSB
 	select BR2_PACKAGE_BOOST
@@ -19,5 +18,4 @@ config BR2_PACKAGE_CC_TOOL
 	  http://sourceforge.net/projects/cctool/
 
 comment "cc-tool needs a toolchain w/ C++, threads, wchar"
-	depends on BR2_PACKAGE_BOOST_ARCH_SUPPORTS
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR
diff --git a/package/gnuradio/Config.in b/package/gnuradio/Config.in
index 603532c..b72ece5 100644
--- a/package/gnuradio/Config.in
+++ b/package/gnuradio/Config.in
@@ -1,6 +1,5 @@
 comment "gnuradio needs a toolchain w/ C++, NPTL, wchar, dynamic library"
 	depends on BR2_USE_MMU
-	depends on BR2_PACKAGE_BOOST_ARCH_SUPPORTS
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
 		!BR2_TOOLCHAIN_HAS_THREADS_NPTL || BR2_STATIC_LIBS
 
@@ -11,7 +10,6 @@ config BR2_PACKAGE_GNURADIO
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	depends on BR2_USE_MMU # use fork()
 	depends on BR2_USE_WCHAR # boost
-	depends on BR2_PACKAGE_BOOST_ARCH_SUPPORTS
 	select BR2_PACKAGE_BOOST
 	select BR2_PACKAGE_BOOST_DATE_TIME
 	select BR2_PACKAGE_BOOST_FILESYSTEM
diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index ff2e75c..391b4d1 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -1,7 +1,6 @@
 config BR2_PACKAGE_KODI_ARCH_SUPPORTS
 	bool
 	default y if (BR2_arm || (BR2_mipsel && BR2_TOOLCHAIN_USES_GLIBC) || BR2_i386 || BR2_x86_64) \
-		&& BR2_PACKAGE_BOOST_ARCH_SUPPORTS \
 		&& BR2_TOOLCHAIN_HAS_SYNC_8
 
 comment "kodi needs a uClibc or (e)glibc toolchain w/ C++, threads, wchar, dynamic library, gcc >= 4.7, host gcc >= 4.6"
diff --git a/package/libftdi/Config.in b/package/libftdi/Config.in
index 8e02cb9..beb42d3 100644
--- a/package/libftdi/Config.in
+++ b/package/libftdi/Config.in
@@ -13,14 +13,12 @@ if BR2_PACKAGE_LIBFTDI
 config BR2_PACKAGE_LIBTFDI_CPP
 	bool "C++ bindings"
 	depends on BR2_INSTALL_LIBSTDCPP
-	depends on BR2_PACKAGE_BOOST_ARCH_SUPPORTS
 	depends on BR2_USE_WCHAR
 	select BR2_PACKAGE_BOOST
 	help
 	  C++ bindings for libftdi
 
 comment "libftdi C++ bindings need a toolchain w/ wchar, C++"
-	depends on BR2_PACKAGE_BOOST_ARCH_SUPPORTS
 	depends on !BR2_USE_WCHAR || !BR2_INSTALL_LIBSTDCPP
 
 endif # BR2_PACKAGE_LIBFTDI
diff --git a/package/libftdi1/Config.in b/package/libftdi1/Config.in
index 61d4c1c..aca797b 100644
--- a/package/libftdi1/Config.in
+++ b/package/libftdi1/Config.in
@@ -14,14 +14,12 @@ config BR2_PACKAGE_LIBFTDI1_LIBFTDIPP1
 	select BR2_PACKAGE_BOOST
 	depends on BR2_INSTALL_LIBSTDCPP # boost
 	depends on BR2_TOOLCHAIN_HAS_THREADS # boost
-	depends on BR2_PACKAGE_BOOST_ARCH_SUPPORTS
 	depends on BR2_USE_WCHAR # boost
 	help
 	  C++ bindings for libftdi
 
 comment "libftdipp1 needs a toolchain w/ C++, wchar"
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR
-	depends on BR2_PACKAGE_BOOST_ARCH_SUPPORTS
 
 config BR2_PACKAGE_LIBFTDI1_PYTHON_BINDINGS
 	bool "python bindings"
diff --git a/package/libserial/Config.in b/package/libserial/Config.in
index df5d1b5..bd936b9 100644
--- a/package/libserial/Config.in
+++ b/package/libserial/Config.in
@@ -1,7 +1,6 @@
 config BR2_PACKAGE_LIBSERIAL
 	bool "libserial"
 	depends on BR2_INSTALL_LIBSTDCPP
-	depends on BR2_PACKAGE_BOOST_ARCH_SUPPORTS # boost
 	depends on BR2_TOOLCHAIN_HAS_THREADS # boost
 	depends on BR2_USE_WCHAR # boost
 	select BR2_PACKAGE_BOOST
@@ -12,5 +11,4 @@ config BR2_PACKAGE_LIBSERIAL
 	  http://libserial.sourceforge.net/
 
 comment "libserial needs a toolchain w/ C++, threads, wchar"
-	depends on BR2_PACKAGE_BOOST_ARCH_SUPPORTS
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR
diff --git a/package/mpd/Config.in b/package/mpd/Config.in
index 3ac806f..4525a21 100644
--- a/package/mpd/Config.in
+++ b/package/mpd/Config.in
@@ -5,7 +5,6 @@ menuconfig BR2_PACKAGE_MPD
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
 	depends on BR2_USE_MMU # libglib2
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_6
-	depends on BR2_PACKAGE_BOOST_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_HAS_ATOMIC
 	select BR2_PACKAGE_BOOST
 	select BR2_PACKAGE_LIBGLIB2
@@ -312,7 +311,6 @@ endif
 
 comment "mpd needs a toolchain w/ C++, threads, wchar, gcc >= 4.6"
 	depends on BR2_USE_MMU
-	depends on BR2_PACKAGE_BOOST_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_HAS_ATOMIC
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
 		!BR2_TOOLCHAIN_HAS_THREADS || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_6
diff --git a/package/pulseview/Config.in b/package/pulseview/Config.in
index bbbfd76..46abe78 100644
--- a/package/pulseview/Config.in
+++ b/package/pulseview/Config.in
@@ -15,7 +15,6 @@ config BR2_PACKAGE_PULSEVIEW
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_MMU
 	depends on BR2_INSTALL_LIBSTDCPP
-	depends on BR2_PACKAGE_BOOST_ARCH_SUPPORTS
 	# libsigrok
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
 	help
@@ -27,6 +26,5 @@ config BR2_PACKAGE_PULSEVIEW
 comment "pulseview needs a toolchain w/ wchar, threads, C++, gcc >= 4.8"
 	depends on BR2_USE_MMU
 	depends on BR2_PACKAGE_QT5
-	depends on BR2_PACKAGE_BOOST_ARCH_SUPPORTS
 	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 || !BR2_USE_WCHAR \
 		|| !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP
diff --git a/package/python-libconfig/Config.in b/package/python-libconfig/Config.in
index b49aa26..7cc5f8a 100644
--- a/package/python-libconfig/Config.in
+++ b/package/python-libconfig/Config.in
@@ -1,5 +1,4 @@
 comment "python-libconfig needs a toolchain w/ C++, threads"
-	depends on BR2_PACKAGE_BOOST_ARCH_SUPPORTS
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
 
 config BR2_PACKAGE_PYTHON_LIBCONFIG
@@ -9,7 +8,6 @@ config BR2_PACKAGE_PYTHON_LIBCONFIG
 	select BR2_PACKAGE_LIBCONFIG
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS
-	depends on BR2_PACKAGE_BOOST_ARCH_SUPPORTS
 	help
 	  Python bindings to the C++ library libconfig
 
diff --git a/package/thrift/Config.in b/package/thrift/Config.in
index 54ca9b8..0ee3f00 100644
--- a/package/thrift/Config.in
+++ b/package/thrift/Config.in
@@ -3,7 +3,6 @@ config BR2_PACKAGE_THRIFT
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_WCHAR
 	depends on BR2_TOOLCHAIN_HAS_THREADS
-	depends on BR2_PACKAGE_BOOST_ARCH_SUPPORTS
 	select BR2_PACKAGE_BOOST
 	select BR2_PACKAGE_LIBEVENT
 	select BR2_PACKAGE_OPENSSL
@@ -19,6 +18,5 @@ config BR2_PACKAGE_THRIFT
 	  http://thrift.apache.org/
 
 comment "thrift needs a toolchain w/ C++, wchar, threads"
-	depends on BR2_PACKAGE_BOOST_ARCH_SUPPORTS
 	depends on !BR2_USE_WCHAR || \
 		!BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP
diff --git a/package/valijson/Config.in b/package/valijson/Config.in
index 57dad66..4699378 100644
--- a/package/valijson/Config.in
+++ b/package/valijson/Config.in
@@ -3,7 +3,6 @@ config BR2_PACKAGE_VALIJSON
 	depends on BR2_USE_WCHAR
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS
-	depends on BR2_PACKAGE_BOOST_ARCH_SUPPORTS
 	select BR2_PACKAGE_BOOST
 	select BR2_PACKAGE_BOOST_REGEX
 	help
@@ -16,5 +15,4 @@ config BR2_PACKAGE_VALIJSON
 	 https://github.com/tristanpenman/valijson
 
 comment "valijson needs a toolchain w/ C++, threads, wchar  support"
-	depends on BR2_PACKAGE_BOOST_ARCH_SUPPORTS
 	depends on !BR2_INSTALL_LIBSTDCPP  || !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR
diff --git a/package/yaml-cpp/Config.in b/package/yaml-cpp/Config.in
index 3cfb955..c1ba410 100644
--- a/package/yaml-cpp/Config.in
+++ b/package/yaml-cpp/Config.in
@@ -2,7 +2,6 @@ config BR2_PACKAGE_YAML_CPP
 	bool "yaml-cpp"
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS # boost
-	depends on BR2_PACKAGE_BOOST_ARCH_SUPPORTS
 	depends on BR2_USE_WCHAR # boost
 	select BR2_PACKAGE_BOOST
 	help
@@ -12,5 +11,4 @@ config BR2_PACKAGE_YAML_CPP
 	  https://code.google.com/p/yaml-cpp/
 
 comment "yaml-cpp needs a toolchain w/ C++, threads, wchar"
-	depends on BR2_PACKAGE_BOOST_ARCH_SUPPORTS
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR
diff --git a/package/zmqpp/Config.in b/package/zmqpp/Config.in
index 602425f..67e89b3 100644
--- a/package/zmqpp/Config.in
+++ b/package/zmqpp/Config.in
@@ -24,7 +24,6 @@ config BR2_PACKAGE_ZMQPP_CLIENT
 	bool "zmqpp client"
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_TOOLCHAIN_HAS_THREADS # boost
-	depends on BR2_PACKAGE_BOOST_ARCH_SUPPORTS
 	select BR2_PACKAGE_BOOST
 	select BR2_PACKAGE_BOOST_PROGRAM_OPTIONS
 	help
@@ -32,7 +31,6 @@ config BR2_PACKAGE_ZMQPP_CLIENT
 	  used to listen or send to zeromq sockets.
 
 comment "zmqpp client needs a toolchain w/ dynamic library, threads"
-	depends on BR2_PACKAGE_BOOST_ARCH_SUPPORTS
 	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS
 
 endif
