From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 25 Jun 2018 23:13:17 +0200
Subject: [Buildroot] [PATCH 1/1] boost: thread depends on NPTL
Message-ID: <20180625211317.12643-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Since boost 1.67, CLOCK_MONOTONIC is used by default, there is no more
  check on pthread_condaddr_setclock availability:
  https://github.com/boostorg/thread/commit/1e84b978b2bb0aae830cc14533dea3b7ddda5cde
- So add NPTL dependency on boost-thread but also on boost-contract,
  boost-locale, boost-type_erasure and boost-wave which use
  boost-thread (and select it even if boost will do it on its own)
- Add also NPTL dependency to pulseview
- Update comment on NPTL in azmq

Fixes:
 - http://autobuild.buildroot.net/results/7db2baeb70b30f7785cbb823e9eaeb8e99ef0d24
 - http://autobuild.buildroot.net/results/6a4c5f8d45b51d32114093fa68195c2df2db5449

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/azmq/Config.in      |  2 +-
 package/boost/Config.in     | 30 ++++++++++++++++++++++++++----
 package/pulseview/Config.in |  7 ++++---
 3 files changed, 31 insertions(+), 8 deletions(-)

diff --git a/package/azmq/Config.in b/package/azmq/Config.in
index eeafa2ad6d..8df4f1c24c 100644
--- a/package/azmq/Config.in
+++ b/package/azmq/Config.in
@@ -2,7 +2,7 @@ config BR2_PACKAGE_AZMQ
 	bool "azmq"
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_ATOMIC
-	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # boost-log
+	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # boost-log, boost-thread
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # C++11
 	depends on BR2_USE_WCHAR # boost
 	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # exception_ptr
diff --git a/package/boost/Config.in b/package/boost/Config.in
index 781bc47c00..abde7ada27 100644
--- a/package/boost/Config.in
+++ b/package/boost/Config.in
@@ -79,8 +79,8 @@ config BR2_PACKAGE_BOOST_CONTEXT
 
 config BR2_PACKAGE_BOOST_CONTRACT
 	bool "boost-contract"
-	# pthread_condattr_setclock
-	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
+	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # boost-thread
+	select BR2_PACKAGE_BOOST_THREAD
 	help
 	  Contract programming for C++.
 
@@ -161,13 +161,19 @@ config BR2_PACKAGE_BOOST_LOCALE
 	# https://svn.boost.org/trac/boost/ticket/9685 for more
 	# details.
 	depends on !(BR2_STATIC_LIBS && BR2_PACKAGE_ICU)
+	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # boost-thread
+	select BR2_PACKAGE_BOOST_THREAD
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 	help
 	  Provide localization and Unicode handling tools for C++.
 
-comment "boost-locale needs a toolchain w/ dynamic library"
+comment "boost-locale needs a toolchain w/ dynamic library, NPTL"
 	depends on BR2_PACKAGE_ICU
-	depends on BR2_STATIC_LIBS
+	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS_NPTL
+
+comment "boost-locale needs a toolchain w/ NPTL"
+	depends on !BR2_PACKAGE_ICU
+	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL
 
 config BR2_PACKAGE_BOOST_LOG
 	bool "boost-log"
@@ -274,9 +280,14 @@ config BR2_PACKAGE_BOOST_TEST
 
 config BR2_PACKAGE_BOOST_THREAD
 	bool "boost-thread"
+	# pthread_condattr_setclock
+	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	help
 	  Portable C++ multi-threading. C++11, C++14.
 
+comment "boost-thread needs a toolchain w/ NPTL"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL
+
 config BR2_PACKAGE_BOOST_TIMER
 	bool "boost-timer"
 	help
@@ -284,18 +295,29 @@ config BR2_PACKAGE_BOOST_TIMER
 
 config BR2_PACKAGE_BOOST_TYPE_ERASURE
 	bool "boost-type_erasure"
+	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # boost-thread
+	select BR2_PACKAGE_BOOST_THREAD
 	help
 	  Runtime polymorphism based on concepts.
 
+comment "boost-type_erasure needs a toolchain w/ NPTL"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL
+
 config BR2_PACKAGE_BOOST_WAVE
 	bool "boost-wave"
 	# limitation of assembler for coldfire
 	# error: Tried to convert PC relative branch to absolute jump
 	depends on !BR2_m68k_cf
+	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # boost-thread
+	select BR2_PACKAGE_BOOST_THREAD
 	help
 	  The Boost.Wave library is a Standards conformant, and highly
 	  configurable implementation of the mandated C99/C++
 	  preprocessor functionality packed behind an easy to use
 	  iterator interface.
 
+comment "boost-wave needs a toolchain w/ NPTL"
+	depends on !BR2_m68k_cf
+	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL
+
 endif
diff --git a/package/pulseview/Config.in b/package/pulseview/Config.in
index 301acf7d90..0f170cbc15 100644
--- a/package/pulseview/Config.in
+++ b/package/pulseview/Config.in
@@ -3,7 +3,7 @@ config BR2_PACKAGE_PULSEVIEW
 	depends on BR2_PACKAGE_QT5
 	# libsigrok->libglib2:
 	depends on BR2_USE_WCHAR
-	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # boost-thread
 	depends on BR2_USE_MMU
 	depends on BR2_INSTALL_LIBSTDCPP
 	# libsigrok->libzip
@@ -26,8 +26,9 @@ config BR2_PACKAGE_PULSEVIEW
 
 	  http://sigrok.org/wiki/PulseView
 
-comment "pulseview needs a toolchain w/ wchar, threads, dynamic library, C++, gcc >= 4.9"
+comment "pulseview needs a toolchain w/ wchar, NPTL, dynamic library, C++, gcc >= 4.9"
 	depends on BR2_USE_MMU
 	depends on BR2_PACKAGE_QT5
 	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || !BR2_USE_WCHAR \
-		|| !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP || BR2_STATIC_LIBS
+		|| !BR2_TOOLCHAIN_HAS_THREADS_NPTL || !BR2_INSTALL_LIBSTDCPP \
+		|| BR2_STATIC_LIBS
-- 
2.14.1
