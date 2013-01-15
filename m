From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 15 Jan 2013 11:50:26 +0100
Subject: [Buildroot] [git commit] boost: fix build problem by always
	building a threaded version
Message-ID: <20130115105135.DB5F99A18F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=87dfeb10ad8aa0c52b20cd1baa05f7403656ca98
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Boost normally allows to build a non-threaded variant by passing
threading=single or a multi-threaded variant by passing
threading=multi.

Unfortunately, the build of threading=single doesn't seem to work any
more, due to bizarre things in the build system. We get "duplicate
target" errors, that according to
http://lists.boost.org/boost-build/2012/11/26582.php should appear if
we ask for both threading=single,multi. But it seems to happen even in
the threading=single case.

Since Boost is such a big C++ beast, it probably doesn't make much
sense to try to support it on toolchains that don't have thread
support. So, we make the boost package depend on thread support. If
someone cares enough in getting Boost to work in a non-threaded
environment, then we can always revert back.

Note that the boost package has no reverse dependencies in Buildroot,
so we don't need to propagate this new dependency anywhere.

Fixes:

  http://autobuild.buildroot.org/results/439e72ac74c8058f30977e6abc39acd6379a17d3/build-end.log

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/boost/Config.in |   15 ++++++---------
 package/boost/boost.mk  |    4 ++--
 2 files changed, 8 insertions(+), 11 deletions(-)

diff --git a/package/boost/Config.in b/package/boost/Config.in
index fb5360e..19dcc60 100644
--- a/package/boost/Config.in
+++ b/package/boost/Config.in
@@ -1,10 +1,14 @@
-comment "boost requires a toolchain with C++ and large file support enabled"
-	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_LARGEFILE
+comment "boost requires a toolchain with C++, large file and thread support enabled"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_LARGEFILE || !BR2_TOOLCHAIN_HAS_THREADS
 
 config BR2_PACKAGE_BOOST
 	bool "boost"
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_LARGEFILE
+	# Boost could theorically be built with threading=single, but
+	# that unfortunately doesn't work. Until someone fixes that,
+	# let's depend on threads.
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_PACKAGE_BZIP2
 	select BR2_PACKAGE_ZLIB
 	help
@@ -14,12 +18,6 @@ config BR2_PACKAGE_BOOST
 
 if BR2_PACKAGE_BOOST
 
-config BR2_PACKAGE_BOOST_MULTITHREADED
-	depends on BR2_TOOLCHAIN_HAS_THREADS
-	bool "boost-multithreaded"
-	help
-	  Build the boost libraries as multithreaded
-
 config BR2_PACKAGE_BOOST_CHRONO
 	bool "boost-chrono"
 
@@ -76,7 +74,6 @@ config BR2_PACKAGE_BOOST_TEST
 	bool "boost-test"
 
 config BR2_PACKAGE_BOOST_THREAD
-	depends on BR2_TOOLCHAIN_HAS_THREADS
 	bool "boost-thread"
 
 config BR2_PACKAGE_BOOST_TIMER
diff --git a/package/boost/boost.mk b/package/boost/boost.mk
index 005c7ca..62226ba 100644
--- a/package/boost/boost.mk
+++ b/package/boost/boost.mk
@@ -46,10 +46,10 @@ BOOST_FLAGS += --without-icu
 endif
 
 BOOST_OPT += toolset=gcc \
+	     threading=multi \
 	     variant=$(if $(BR2_ENABLE_DEBUG),debug,release) \
 	     link=$(if $(BR2_PREFER_STATIC_LIB),static,shared) \
-	     runtime-link=$(if $(BR2_PREFER_STATIC_LIB),static,shared) \
-	     threading=$(if $(BR2_PACKAGE_BOOST_MULTITHREADED),multi,single)
+	     runtime-link=$(if $(BR2_PREFER_STATIC_LIB),static,shared)
 
 ifeq ($(BR2_PACKAGE_BOOST_LOCALE),y)
 ifeq ($(BR2_TOOLCHAIN_BUILDROOT)$(BR2_TOOLCHAIN_EXTERNAL_UCLIBC)$(BR2_TOOLCHAIN_CTNG_uClibc),y)
