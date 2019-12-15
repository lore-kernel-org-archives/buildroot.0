From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 15 Dec 2019 11:04:25 +0100
Subject: [Buildroot] [PATCH 1/1] package/boost: boost-thread needs a
 toolchain without bug 64735
Message-ID: <20191215100425.3339162-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

boost-thread needs std::current_exception since version 1.71.0 and
https://github.com/boostorg/exception/commit/386f5507cb8ec99c03ca535bea4f8bd61e0de910

std::current_exception depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 as a
result, gnuradio fails to build on:

[ 12%] Building CXX object gnuradio-runtime/lib/pmt/CMakeFiles/gnuradio-pmt.dir/pmt_pool.cc.o
In file included from /home/test/autobuild/run/instance-2/output-1/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/boost/exception/detail/exception_ptr.hpp:15:0,
                 from /home/test/autobuild/run/instance-2/output-1/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/boost/exception_ptr.hpp:9,
                 from /home/test/autobuild/run/instance-2/output-1/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/boost/thread/exceptional_ptr.hpp:10,
                 from /home/test/autobuild/run/instance-2/output-1/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/boost/thread/future.hpp:34,
                 from /home/test/autobuild/run/instance-2/output-1/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/boost/thread.hpp:24,
                 from /home/test/autobuild/run/instance-2/output-1/build/gnuradio-3.7.13.5/gnuradio-runtime/include/pmt/pmt_pool.h:27,
                 from /home/test/autobuild/run/instance-2/output-1/build/gnuradio-3.7.13.5/gnuradio-runtime/lib/pmt/pmt.cc:31:
/home/test/autobuild/run/instance-2/output-1/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/boost/exception/diagnostic_information.hpp: In function 'std::string boost::current_exception_diagnostic_information(bool)':
/home/test/autobuild/run/instance-2/output-1/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/boost/exception/diagnostic_information.hpp:49:26: error: 'current_exception' is not a member of 'std'
         else if (auto* p=std::current_exception().__cxa_exception_type())
                          ^
So add this dependency on boost-thread and gnuradio (the only reverse
dependency of boost-thread that does not already depends on
!BR2_TOOLCHAIN_HAS_GCC_BUG_64735)

Finally, add this dependency on gqrx as it is a reverse dependency of
gnuradio

Fixes:
 - http://autobuild.buildroot.org/results/c384205cf50929c320d90b620f2390837721d9f9
 - http://autobuild.buildroot.org/results/47440354b336b943b74b72fa303b079dc962bfd0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/boost/Config.in    | 4 ++++
 package/gnuradio/Config.in | 4 ++++
 package/gqrx/Config.in     | 4 ++++
 3 files changed, 12 insertions(+)

diff --git a/package/boost/Config.in b/package/boost/Config.in
index 392d7424fb..1a48eae807 100644
--- a/package/boost/Config.in
+++ b/package/boost/Config.in
@@ -304,12 +304,16 @@ config BR2_PACKAGE_BOOST_TEST
 
 config BR2_PACKAGE_BOOST_THREAD
 	bool "boost-thread"
+	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # std::current_exception
 	select BR2_PACKAGE_BOOST_ATOMIC if !BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS
 	select BR2_PACKAGE_BOOST_CHRONO
 	select BR2_PACKAGE_BOOST_SYSTEM
 	help
 	  Portable C++ multi-threading. C++11, C++14.
 
+comment "boost-thread needs a toolchain not affected by GCC bug 64735"
+	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_64735
+
 config BR2_PACKAGE_BOOST_TIMER
 	bool "boost-timer"
 	select BR2_PACKAGE_BOOST_CHRONO
diff --git a/package/gnuradio/Config.in b/package/gnuradio/Config.in
index 80f6a1c535..442b86c692 100644
--- a/package/gnuradio/Config.in
+++ b/package/gnuradio/Config.in
@@ -4,6 +4,9 @@ comment "gnuradio needs a toolchain w/ C++, NPTL, wchar, dynamic library"
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
 		!BR2_TOOLCHAIN_HAS_THREADS_NPTL || BR2_STATIC_LIBS
 
+comment "gnuradio needs a toolchain not affected by GCC bug 64735"
+	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_64735
+
 config BR2_PACKAGE_GNURADIO
 	bool "gnuradio"
 	depends on BR2_INSTALL_LIBSTDCPP
@@ -12,6 +15,7 @@ config BR2_PACKAGE_GNURADIO
 	depends on BR2_USE_MMU # use fork()
 	depends on BR2_USE_WCHAR # boost
 	depends on !BR2_PACKAGE_PYTHON3
+	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # boost-thread
 	select BR2_PACKAGE_BOOST
 	select BR2_PACKAGE_BOOST_DATE_TIME
 	select BR2_PACKAGE_BOOST_FILESYSTEM
diff --git a/package/gqrx/Config.in b/package/gqrx/Config.in
index b0d7e7b9f3..990d594c6a 100644
--- a/package/gqrx/Config.in
+++ b/package/gqrx/Config.in
@@ -8,6 +8,9 @@ comment "gqrx needs a toolchain w/ C++, threads, wchar, dynamic library"
 comment "gqrx needs qt5"
 	depends on !BR2_PACKAGE_QT5
 
+comment "gqrx needs a toolchain not affected by GCC bug 64735"
+	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_64735
+
 config BR2_PACKAGE_GQRX
 	bool "gqrx"
 	depends on BR2_USE_MMU # gnuradio
@@ -18,6 +21,7 @@ config BR2_PACKAGE_GQRX
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 || BR2_TOOLCHAIN_HAS_ATOMIC
 	depends on BR2_PACKAGE_QT5
 	depends on !BR2_PACKAGE_PYTHON3
+	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # gnuradio
 	select BR2_PACKAGE_BOOST
 	select BR2_PACKAGE_BOOST_PROGRAM_OPTIONS
 	select BR2_PACKAGE_BOOST_SYSTEM
-- 
2.24.0
