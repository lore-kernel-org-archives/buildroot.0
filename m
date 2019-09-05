From: Gwenhael Goavec-Merou <gwenj@trabucayre.com>
Date: Thu,  5 Sep 2019 15:40:41 +0200
Subject: [Buildroot] [PATCH] package:gnuradio: bump to 3.8.0.0
In-Reply-To: <1567690842-33954-1-git-send-email-gwenj@trabucayre.com>
References: <1567690842-33954-1-git-send-email-gwenj@trabucayre.com>
Message-ID: <1567690842-33954-2-git-send-email-gwenj@trabucayre.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>

Since 2019/08/09 a new version of gnuradio is available.
This patch bump to this version with some modifications:
- suppress the applied patch 0001-socket_pdu_impl.cc-fix-build-with-boost-1.70.0.patch
- add a patch to have boost unit_test_framework optional instead of mandatory
- add boost atomic (used by pmt), log4cpp (now mandatory) and gmp as
  dependencies
- suppress BR2_PACKAGE_GNURADIO_LOG no more available since log4cpp is mandatory
- add -mfpu=neon if the compiler support this to avoid volk test failure

Since 2019/08/09 a new version of gnuradio is available.
This patch bump to this version with some modifications:
- suppress the applied patch 0001-socket_pdu_impl.cc-fix-build-with-boost-1.70.0.patch
- add a patch to have boost unit_test_framework optional instead of mandatory
- add boost atomic (used by pmt), log4cpp (now mandatory) and gmp as dependencies
- suppress the no more available BR2_PACKAGE_GNURADIO_LOG, since log4cpp is mandatory
- add -mfpu=neon if the compiler support this to avoid volk test failure

Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
---
 ..._impl.cc-fix-build-with-boost-1.70.0.patch | 42 -------------------
 ...nitest-detection-when-ENABLE_TESTING.patch | 38 +++++++++++++++++
 package/gnuradio/Config.in                    |  9 ++--
 package/gnuradio/gnuradio.hash                |  2 +-
 package/gnuradio/gnuradio.mk                  | 15 +++----
 5 files changed, 47 insertions(+), 59 deletions(-)
 delete mode 100644 package/gnuradio/0001-socket_pdu_impl.cc-fix-build-with-boost-1.70.0.patch
 create mode 100644 package/gnuradio/0001-suppress-boost_unitest-detection-when-ENABLE_TESTING.patch

diff --git a/package/gnuradio/0001-socket_pdu_impl.cc-fix-build-with-boost-1.70.0.patch b/package/gnuradio/0001-socket_pdu_impl.cc-fix-build-with-boost-1.70.0.patch
deleted file mode 100644
index 2047cdd036..0000000000
--- a/package/gnuradio/0001-socket_pdu_impl.cc-fix-build-with-boost-1.70.0.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From 6b450f36c14dd16d476f10f3e4eb1c5c26a78daa Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Thu, 18 Apr 2019 09:40:15 +0200
-Subject: [PATCH] socket_pdu_impl.cc: fix build with boost 1.70.0
-
-Fix #2446
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/gnuradio/gnuradio/pull/2451]
----
- gr-blocks/lib/socket_pdu_impl.cc | 8 +++++++-
- 1 file changed, 7 insertions(+), 1 deletion(-)
-
-diff --git a/gr-blocks/lib/socket_pdu_impl.cc b/gr-blocks/lib/socket_pdu_impl.cc
-index e20f1478f..d9dd1edd6 100644
---- a/gr-blocks/lib/socket_pdu_impl.cc
-+++ b/gr-blocks/lib/socket_pdu_impl.cc
-@@ -29,6 +29,12 @@
- #include <gnuradio/io_signature.h>
- #include <gnuradio/blocks/pdu.h>
- 
-+#if BOOST_VERSION >= 107000
-+#define GET_IO_SERVICE(s) ((boost::asio::io_context&)(s)->get_executor().context())
-+#else
-+#define GET_IO_SERVICE(s) ((s)->get_io_service())
-+#endif
-+
- namespace gr {
-   namespace blocks {
- 
-@@ -165,7 +171,7 @@ namespace gr {
-     void
-     socket_pdu_impl::start_tcp_accept()
-     {
--      tcp_connection::sptr new_connection = tcp_connection::make(d_acceptor_tcp->get_io_service(), d_rxbuf.size(), d_tcp_no_delay);
-+      tcp_connection::sptr new_connection = tcp_connection::make(GET_IO_SERVICE(d_acceptor_tcp), d_rxbuf.size(), d_tcp_no_delay);
- 
-       d_acceptor_tcp->async_accept(new_connection->socket(),
-         boost::bind(&socket_pdu_impl::handle_tcp_accept, this,
--- 
-2.20.1
-
diff --git a/package/gnuradio/0001-suppress-boost_unitest-detection-when-ENABLE_TESTING.patch b/package/gnuradio/0001-suppress-boost_unitest-detection-when-ENABLE_TESTING.patch
new file mode 100644
index 0000000000..c4beda1ebb
--- /dev/null
+++ b/package/gnuradio/0001-suppress-boost_unitest-detection-when-ENABLE_TESTING.patch
@@ -0,0 +1,38 @@
+From 1dc15300b9a38cf2217768375e67922f7268cad9 Mon Sep 17 00:00:00 2001
+From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
+Date: Wed, 4 Sep 2019 11:34:51 +0200
+Subject: [PATCH] suppress boost_unitest detection when ENABLE_TESTING is not
+ set
+
+boost unit_test_framework is only used when ENABLE_TESTING is set. So instead of
+adding this module as default, append to the list of required module only when
+it is mandatory.
+
+Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
+---
+ cmake/Modules/GrBoost.cmake | 7 ++++++-
+ 1 file changed, 6 insertions(+), 1 deletion(-)
+
+diff --git a/cmake/Modules/GrBoost.cmake b/cmake/Modules/GrBoost.cmake
+index cd4b120f7..5c227db7e 100644
+--- a/cmake/Modules/GrBoost.cmake
++++ b/cmake/Modules/GrBoost.cmake
+@@ -33,9 +33,14 @@ set(BOOST_REQUIRED_COMPONENTS
+     system
+     regex
+     thread
+-    unit_test_framework
+ )
+ 
++if(ENABLE_TESTING)
++	list(APPEND BOOST_REQUIRED_COMPONENTS
++		unit_test_framework
++	)
++endif(ENABLE_TESTING)
++
+ if(UNIX AND NOT BOOST_ROOT AND EXISTS "/usr/lib64")
+     list(APPEND BOOST_LIBRARYDIR "/usr/lib64") #fedora 64-bit fix
+ endif(UNIX AND NOT BOOST_ROOT AND EXISTS "/usr/lib64")
+-- 
+2.21.0
+
diff --git a/package/gnuradio/Config.in b/package/gnuradio/Config.in
index 80f6a1c535..f07bd3d976 100644
--- a/package/gnuradio/Config.in
+++ b/package/gnuradio/Config.in
@@ -13,12 +13,15 @@ config BR2_PACKAGE_GNURADIO
 	depends on BR2_USE_WCHAR # boost
 	depends on !BR2_PACKAGE_PYTHON3
 	select BR2_PACKAGE_BOOST
+	select BR2_PACKAGE_BOOST_ATOMIC
 	select BR2_PACKAGE_BOOST_DATE_TIME
 	select BR2_PACKAGE_BOOST_FILESYSTEM
 	select BR2_PACKAGE_BOOST_PROGRAM_OPTIONS
 	select BR2_PACKAGE_BOOST_REGEX
 	select BR2_PACKAGE_BOOST_SYSTEM
 	select BR2_PACKAGE_BOOST_THREAD
+	select BR2_PACKAGE_LOG4CPP
+	select BR2_PACKAGE_GMP
 	help
 	  GNU Radio is a free & open-source software development
 	  toolkit that provides signal processing blocks to implement
@@ -56,12 +59,6 @@ config BR2_PACKAGE_GNURADIO_FEC
 	help
 	  FEC signal processing blocks
 
-config BR2_PACKAGE_GNURADIO_LOG
-	bool "gr-log support"
-	select BR2_PACKAGE_LOG4CPP
-	help
-	  Enable logger component
-
 config BR2_PACKAGE_GNURADIO_PYTHON
 	bool "python support"
 	depends on BR2_PACKAGE_PYTHON
diff --git a/package/gnuradio/gnuradio.hash b/package/gnuradio/gnuradio.hash
index 884f7ae758..8f9b9774fe 100644
--- a/package/gnuradio/gnuradio.hash
+++ b/package/gnuradio/gnuradio.hash
@@ -1,5 +1,5 @@
 # From http://gnuradio.org/releases/gnuradio/sha256sums
-sha256 1e07ce40fa3c3eede1fb54e320dad8a221a3c01de341e9cef2d7b265ed06a6e9  gnuradio-3.7.13.3.tar.gz
+sha256 3a9c90111f22f2f6f30450731dc671ad28ce824fc1a7bc8ea0783da9b95a7092  gnuradio-3.8.0.0.tar.gz
 
 # Hash for license file:
 sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/gnuradio/gnuradio.mk b/package/gnuradio/gnuradio.mk
index ef9723cb01..162d0c0311 100644
--- a/package/gnuradio/gnuradio.mk
+++ b/package/gnuradio/gnuradio.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GNURADIO_VERSION = 3.7.13.3
+GNURADIO_VERSION = 3.8.0.0
 GNURADIO_SITE = http://gnuradio.org/releases/gnuradio
 GNURADIO_LICENSE = GPL-3.0+
 GNURADIO_LICENSE_FILES = COPYING
@@ -16,7 +16,9 @@ GNURADIO_DEPENDENCIES = \
 	host-python-mako \
 	host-python-six \
 	host-swig \
-	boost
+	boost \
+	log4cpp \
+	gmp
 
 ifeq ($(BR2_PACKAGE_ORC),y)
 GNURADIO_DEPENDENCIES += orc
@@ -43,7 +45,7 @@ endif
 # CFLAGS to decide whether to build the NEON functions or not, and
 # wants to see the string 'armv7' in the CFLAGS.
 ifeq ($(BR2_ARM_CPU_ARMV7A)$(BR2_ARM_CPU_HAS_NEON),yy)
-GNURADIO_CONF_OPTS += -DCMAKE_C_FLAGS="$(TARGET_CFLAGS) -march=armv7-a"
+GNURADIO_CONF_OPTS += -DCMAKE_C_FLAGS="$(TARGET_CFLAGS) -march=armv7-a -mfpu=neon"
 endif
 
 # As soon as -mfpu=neon is supported by the compiler, gnuradio will try
@@ -115,13 +117,6 @@ else
 GNURADIO_CONF_OPTS += -DENABLE_GR_FILTER=OFF
 endif
 
-ifeq ($(BR2_PACKAGE_GNURADIO_LOG),y)
-GNURADIO_DEPENDENCIES += log4cpp
-GNURADIO_CONF_OPTS += -DENABLE_GR_LOG=ON
-else
-GNURADIO_CONF_OPTS += -DENABLE_GR_LOG=OFF
-endif
-
 ifeq ($(BR2_PACKAGE_GNURADIO_PYTHON),y)
 GNURADIO_DEPENDENCIES += python
 GNURADIO_CONF_OPTS += -DENABLE_PYTHON=ON
-- 
2.21.0
