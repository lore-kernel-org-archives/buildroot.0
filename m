From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 16 May 2015 09:26:29 +0200
Subject: [Buildroot] [git commit] boost: disable on NIOS 2 with broken
	toolchains
Message-ID: <20150516073216.B56D780460@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=feeab03fa68a02733ae9382b7d47d9eb0d785188
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The current NIOS 2 toolchains are not capable of building Boost, so
let's disable it and its reverse dependencies. Even though it's not
strictly an architecture dependency, we use the <pkg>_ARCH_SUPPORTS
paradigm for this dependency, since it simplifies a lot handling all
boost reverse dependencies, and is anyway quite similar to an
architecture dependency since we don't display a comment about this
dependency.

Fixes:

  http://autobuild.buildroot.net/results/e119b1ef55c546e0d0598b85c46ceefa5c43d5a6/

[Peter: also update mpd comment]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/boost/Config.in            |    6 ++++++
 package/cc-tool/Config.in          |    2 ++
 package/gnuradio/Config.in         |    2 ++
 package/kodi/Config.in             |    3 ++-
 package/libftdi1/Config.in         |    2 ++
 package/mpd/Config.in              |    2 ++
 package/pulseview/Config.in        |    2 ++
 package/python-libconfig/Config.in |    2 ++
 package/thrift/Config.in           |    2 ++
 package/yaml-cpp/Config.in         |    2 ++
 package/zmqpp/Config.in            |    2 ++
 11 files changed, 26 insertions(+), 1 deletions(-)

diff --git a/package/boost/Config.in b/package/boost/Config.in
index add7069..0ed8dd2 100644
--- a/package/boost/Config.in
+++ b/package/boost/Config.in
@@ -1,9 +1,15 @@
 comment "boost needs a toolchain w/ C++, threads"
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
 
+config BR2_PACKAGE_BOOST_ARCH_SUPPORTS
+	bool
+	default y if !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII201405 && \
+		!BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII201305
+
 config BR2_PACKAGE_BOOST
 	bool "boost"
 	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_PACKAGE_BOOST_ARCH_SUPPORTS
 	# Boost could theorically be built with threading=single, but
 	# that unfortunately doesn't work. Until someone fixes that,
 	# let's depend on threads.
diff --git a/package/cc-tool/Config.in b/package/cc-tool/Config.in
index 5087f4a..be11599 100644
--- a/package/cc-tool/Config.in
+++ b/package/cc-tool/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_CC_TOOL
 	bool "cc-tool"
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_PACKAGE_BOOST_ARCH_SUPPORTS
 	select BR2_PACKAGE_LIBUSB
 	select BR2_PACKAGE_BOOST
 	select BR2_PACKAGE_BOOST_PROGRAM_OPTIONS
@@ -17,4 +18,5 @@ config BR2_PACKAGE_CC_TOOL
 	  http://sourceforge.net/projects/cctool/
 
 comment "cc-tool needs a toolchain w/ C++, threads"
+	depends on BR2_PACKAGE_BOOST_ARCH_SUPPORTS
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/gnuradio/Config.in b/package/gnuradio/Config.in
index 752a50b..574eab4 100644
--- a/package/gnuradio/Config.in
+++ b/package/gnuradio/Config.in
@@ -1,5 +1,6 @@
 comment "gnuradio needs a toolchain w/ C++, NPTL, wchar, dynamic library"
 	depends on BR2_USE_MMU
+	depends on BR2_PACKAGE_BOOST_ARCH_SUPPORTS
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
 		!BR2_TOOLCHAIN_HAS_THREADS_NPTL || BR2_STATIC_LIBS
 
@@ -10,6 +11,7 @@ config BR2_PACKAGE_GNURADIO
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	depends on BR2_USE_MMU # use fork()
 	depends on BR2_USE_WCHAR # boost
+	depends on BR2_PACKAGE_BOOST_ARCH_SUPPORTS
 	select BR2_PACKAGE_BOOST
 	select BR2_PACKAGE_BOOST_DATE_TIME
 	select BR2_PACKAGE_BOOST_FILESYSTEM
diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index 254a1df..a4d1aab 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_KODI_ARCH_SUPPORTS
 	bool
-	default y if BR2_arm || BR2_i386 || BR2_x86_64
+	default y if (BR2_arm || BR2_i386 || BR2_x86_64) && BR2_PACKAGE_BOOST_ARCH_SUPPORTS
+
 
 comment "kodi needs a toolchain w/ C++, threads, wchar"
 	depends on BR2_PACKAGE_KODI_ARCH_SUPPORTS
diff --git a/package/libftdi1/Config.in b/package/libftdi1/Config.in
index 9fb80ae..e41dd91 100644
--- a/package/libftdi1/Config.in
+++ b/package/libftdi1/Config.in
@@ -14,11 +14,13 @@ config BR2_PACKAGE_LIBTFDI1_LIBFTDIPP1
 	select BR2_PACKAGE_BOOST
 	depends on BR2_INSTALL_LIBSTDCPP # boost
 	depends on BR2_TOOLCHAIN_HAS_THREADS # boost
+	depends on BR2_PACKAGE_BOOST_ARCH_SUPPORTS
 	help
 	  C++ bindings for libftdi
 
 comment "libfdtipp1 needs a toolchain w/ C++"
 	depends on !BR2_INSTALL_LIBSTDCPP
+	depends on BR2_PACKAGE_BOOST_ARCH_SUPPORTS
 
 config BR2_PACKAGE_LIBTFDI1_PYTHON_BINDINGS
 	bool "python bindings"
diff --git a/package/mpd/Config.in b/package/mpd/Config.in
index 41a4d54..b57aa55 100644
--- a/package/mpd/Config.in
+++ b/package/mpd/Config.in
@@ -7,6 +7,7 @@ menuconfig BR2_PACKAGE_MPD
 	# sparc & CS powerpc gcc are too old
 	depends on !BR2_sparc
 	depends on !(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC201103 || BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC201009)
+	depends on BR2_PACKAGE_BOOST_ARCH_SUPPORTS
 	select BR2_PACKAGE_BOOST
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
@@ -290,6 +291,7 @@ endif
 
 comment "mpd needs a toolchain w/ C++, threads, wchar"
 	depends on BR2_USE_MMU
+	depends on BR2_PACKAGE_BOOST_ARCH_SUPPORTS
 	depends on !BR2_sparc
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
 		!BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/pulseview/Config.in b/package/pulseview/Config.in
index de899af..df27cde 100644
--- a/package/pulseview/Config.in
+++ b/package/pulseview/Config.in
@@ -15,6 +15,7 @@ config BR2_PACKAGE_PULSEVIEW
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_MMU
 	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_PACKAGE_BOOST_ARCH_SUPPORTS
 	help
 	  PulseView is a Qt based logic analyzer, oscilloscope
 	  and MSO GUI for sigrok.
@@ -24,4 +25,5 @@ config BR2_PACKAGE_PULSEVIEW
 comment "pulseview needs a toolchain w/ wchar, threads, C++"
 	depends on BR2_USE_MMU
 	depends on BR2_PACKAGE_QT5
+	depends on BR2_PACKAGE_BOOST_ARCH_SUPPORTS
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP
diff --git a/package/python-libconfig/Config.in b/package/python-libconfig/Config.in
index 7cc5f8a..b49aa26 100644
--- a/package/python-libconfig/Config.in
+++ b/package/python-libconfig/Config.in
@@ -1,4 +1,5 @@
 comment "python-libconfig needs a toolchain w/ C++, threads"
+	depends on BR2_PACKAGE_BOOST_ARCH_SUPPORTS
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
 
 config BR2_PACKAGE_PYTHON_LIBCONFIG
@@ -8,6 +9,7 @@ config BR2_PACKAGE_PYTHON_LIBCONFIG
 	select BR2_PACKAGE_LIBCONFIG
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_PACKAGE_BOOST_ARCH_SUPPORTS
 	help
 	  Python bindings to the C++ library libconfig
 
diff --git a/package/thrift/Config.in b/package/thrift/Config.in
index c5c7c16..b9960f8 100644
--- a/package/thrift/Config.in
+++ b/package/thrift/Config.in
@@ -4,6 +4,7 @@ config BR2_PACKAGE_THRIFT
 	depends on BR2_USE_WCHAR
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_ARCH_HAS_ATOMICS
+	depends on BR2_PACKAGE_BOOST_ARCH_SUPPORTS
 	select BR2_PACKAGE_BOOST
 	select BR2_PACKAGE_LIBEVENT
 	select BR2_PACKAGE_OPENSSL
@@ -20,5 +21,6 @@ config BR2_PACKAGE_THRIFT
 
 comment "thrift needs a toolchain w/ C++, wchar, threads"
 	depends on BR2_ARCH_HAS_ATOMICS
+	depends on BR2_PACKAGE_BOOST_ARCH_SUPPORTS
 	depends on !BR2_USE_WCHAR || \
 		!BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP
diff --git a/package/yaml-cpp/Config.in b/package/yaml-cpp/Config.in
index 954a944..9e00b3d 100644
--- a/package/yaml-cpp/Config.in
+++ b/package/yaml-cpp/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_YAML_CPP
 	bool "yaml-cpp"
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS # boost
+	depends on BR2_PACKAGE_BOOST_ARCH_SUPPORTS
 	select BR2_PACKAGE_BOOST
 	help
 	  yaml-cpp is a YAML parser and emitter in C++ matching
@@ -10,4 +11,5 @@ config BR2_PACKAGE_YAML_CPP
 	  https://code.google.com/p/yaml-cpp/
 
 comment "yaml-cpp needs a toolchain w/ C++, threads"
+	depends on BR2_PACKAGE_BOOST_ARCH_SUPPORTS
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/zmqpp/Config.in b/package/zmqpp/Config.in
index f3d10c9..0aaeda3 100644
--- a/package/zmqpp/Config.in
+++ b/package/zmqpp/Config.in
@@ -26,6 +26,7 @@ if BR2_PACKAGE_ZMQPP
 config BR2_PACKAGE_ZMQPP_CLIENT
 	bool "zmqpp client"
 	depends on BR2_TOOLCHAIN_HAS_THREADS # boost
+	depends on BR2_PACKAGE_BOOST_ARCH_SUPPORTS
 	select BR2_PACKAGE_BOOST
 	select BR2_PACKAGE_BOOST_PROGRAM_OPTIONS
 	help
@@ -33,6 +34,7 @@ config BR2_PACKAGE_ZMQPP_CLIENT
 	  used to listen or send to zeromq sockets.
 
 comment "zmqpp client needs a toolchain w/ threads"
+	depends on BR2_PACKAGE_BOOST_ARCH_SUPPORTS
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
 
 endif
