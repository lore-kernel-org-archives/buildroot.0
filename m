From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 14 Jan 2021 22:12:34 +0100
Subject: [Buildroot] [git commit] package/boost: bump version to 1.75.0
Message-ID: <20210114210640.F11828781E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fe80e8ac8d769ae206ad621d31ca771f6a152487
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

* add option for new library Boost.JSON
* drop patch 0001 as it's applied upstream
* host: disable options that were added over time but never disabled for the host-build

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/boost/{0002-fenv.patch => 0001-fenv.patch} |  0
 package/boost/0001-fix-uclibc-eventfd.patch        | 38 ----------------------
 package/boost/Config.in                            | 10 ++++++
 package/boost/boost.hash                           |  2 +-
 package/boost/boost.mk                             | 10 +++---
 5 files changed, 17 insertions(+), 43 deletions(-)

diff --git a/package/boost/0002-fenv.patch b/package/boost/0001-fenv.patch
similarity index 100%
rename from package/boost/0002-fenv.patch
rename to package/boost/0001-fenv.patch
diff --git a/package/boost/0001-fix-uclibc-eventfd.patch b/package/boost/0001-fix-uclibc-eventfd.patch
deleted file mode 100644
index 1b7eb8723c..0000000000
--- a/package/boost/0001-fix-uclibc-eventfd.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-Use eventfd() function with uClibc
-
-The Boost eventfd code either directly makes the eventfd system call
-using __NR_eventfd (when __GLIBC_MINOR is less than 8), or otherwise
-uses the eventfd() function provided by the C library.
-
-However, since uClibc pretends to be glibc 2.2, the Boost eventfd code
-directly uses the system call. While it works fine on most
-architectures, it doesn't on ARC since __NR_eventfd is not defined on
-this architecture. However, eventfd() is properly implemented.
-
-So, this patch adjusts the logic used by Boost to consider uClibc as a
-C library providing the eventfd() function.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-
-Index: b/boost/asio/detail/impl/eventfd_select_interrupter.ipp
-===================================================================
---- a/boost/asio/detail/impl/eventfd_select_interrupter.ipp
-+++ b/boost/asio/detail/impl/eventfd_select_interrupter.ipp
-@@ -23,7 +23,7 @@
- #include <sys/stat.h>
- #include <sys/types.h>
- #include <fcntl.h>
--#if __GLIBC__ == 2 && __GLIBC_MINOR__ < 8
-+#if __GLIBC__ == 2 && __GLIBC_MINOR__ < 8 && !defined(__UCLIBC__)
- # include <asm/unistd.h>
- #else // __GLIBC__ == 2 && __GLIBC_MINOR__ < 8
- # include <sys/eventfd.h>
-@@ -46,7 +46,7 @@
- 
- void eventfd_select_interrupter::open_descriptors()
- {
--#if __GLIBC__ == 2 && __GLIBC_MINOR__ < 8
-+#if __GLIBC__ == 2 && __GLIBC_MINOR__ < 8 && !defined(__UCLIBC__)
-   write_descriptor_ = read_descriptor_ = syscall(__NR_eventfd, 0);
-   if (read_descriptor_ != -1)
-   {
diff --git a/package/boost/Config.in b/package/boost/Config.in
index 09f8c7eb93..9248c574f4 100644
--- a/package/boost/Config.in
+++ b/package/boost/Config.in
@@ -189,6 +189,16 @@ config BR2_PACKAGE_BOOST_IOSTREAMS
 	  Boost.IOStreams provides a framework for defining streams,
 	  stream buffers and i/o filters.
 
+config BR2_PACKAGE_BOOST_JSON
+	bool "boost-json"
+	select BR2_PACKAGE_BOOST_CONTAINER
+	help
+	  Boost.JSON is a portable C++ library which provides containers
+	  and algorithms that implement JavaScript Object Notation, or
+	  simply "JSON", a lightweight data-interchange format.
+
+	  To use the library "header-only" this option is not needed.
+
 config BR2_PACKAGE_BOOST_LOCALE
 	bool "boost-locale"
 	# When boost-locale is enabled with icu support, Boost no
diff --git a/package/boost/boost.hash b/package/boost/boost.hash
index d11232f5a9..e6d44a76b6 100644
--- a/package/boost/boost.hash
+++ b/package/boost/boost.hash
@@ -1,5 +1,5 @@
 # From https://www.boost.org/users/history/version_1_74_0.html
-sha256  83bfc1507731a0906e387fc28b7ef5417d591429e51e788417fe9ff025e116b1  boost_1_74_0.tar.bz2
+sha256  953db31e016db7bb207f11432bef7df100516eeb746843fa0486a222e3fd49cb  boost_1_75_0.tar.bz2
 
 # Locally computed
 sha256  c9bff75738922193e67fa726fa225535870d2aa1059f91452c411736284ad566  LICENSE_1_0.txt
diff --git a/package/boost/boost.mk b/package/boost/boost.mk
index b61f6ea838..cb488c86a7 100644
--- a/package/boost/boost.mk
+++ b/package/boost/boost.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BOOST_VERSION = 1.74.0
+BOOST_VERSION = 1.75.0
 BOOST_SOURCE = boost_$(subst .,_,$(BOOST_VERSION)).tar.bz2
 BOOST_SITE = https://dl.bintray.com/boostorg/release/$(BOOST_VERSION)/source
 BOOST_INSTALL_STAGING = YES
@@ -15,9 +15,10 @@ BOOST_CPE_ID_VENDOR = $(BOOST_NAME)
 # keep host variant as minimal as possible
 HOST_BOOST_FLAGS = --without-icu --with-toolset=gcc \
 	--without-libraries=$(subst $(space),$(comma),atomic chrono context \
-	contract coroutine date_time exception filesystem graph graph_parallel \
-	iostreams locale log math mpi nowide program_options python random \
-	regex serialization system test thread timer type_erasure wave)
+	contract container coroutine date_time exception fiber filesystem graph \
+	graph_parallel iostreams json locale log math mpi nowide program_options \
+	python random regex serialization stacktrace system test thread timer \
+	type_erasure wave)
 
 BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_ATOMIC),,atomic)
 BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_CHRONO),,chrono)
@@ -32,6 +33,7 @@ BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_FILESYSTEM),,filesystem)
 BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_GRAPH),,graph)
 BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_GRAPH_PARALLEL),,graph_parallel)
 BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_IOSTREAMS),,iostreams)
+BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_JSON),,json)
 BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_LOCALE),,locale)
 BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_LOG),,log)
 BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_MATH),,math)
