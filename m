From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 24 Jun 2018 23:52:38 +0200
Subject: [Buildroot] [git commit] gnuradio: bump to version 3.7.13.3
Message-ID: <20180624215148.E0E4A813E7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=74319f85e6f9e3ff84dc184b2bd740241a52b10d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- This bump to 3.7.13.x fixes build with boost 1.67
- Remove patch (not needed as boost unit_test_framework has been
  removed since
  https://github.com/gnuradio/volk/commit/6dda1a1e9545d24a1c6f0b2a5d4b5d018fdcbff9)
- Add host-python-mako and host-python-six dependencies
- Add hash for license file

Fixes:
 - http://autobuild.buildroot.net/results/ca3b01a13cb0c580266aae5f3673b2c0a19ac6a4

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0001-suppress-boost_unitest-detection.patch    | 41 ----------------------
 package/gnuradio/gnuradio.hash                     |  5 ++-
 package/gnuradio/gnuradio.mk                       |  7 ++--
 3 files changed, 9 insertions(+), 44 deletions(-)

diff --git a/package/gnuradio/0001-suppress-boost_unitest-detection.patch b/package/gnuradio/0001-suppress-boost_unitest-detection.patch
deleted file mode 100644
index f1713dc349..0000000000
--- a/package/gnuradio/0001-suppress-boost_unitest-detection.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-By default, the boost test option is mandatory for build environment
-detection. 
-This patch suppress this dependency and allows the test part only if
-build_test is enabled at the Buildroot level.
-
-Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
----
-Index: gnuradio-3.7.5/volk/cmake/VolkBoost.cmake
-===================================================================
---- gnuradio-3.7.5.orig/volk/cmake/Modules/VolkBoost.cmake
-+++ gnuradio-3.7.5/volk/cmake/Modules/VolkBoost.cmake
-@@ -29,7 +29,6 @@ set(__INCLUDED_VOLK_BOOST_CMAKE TRUE)
- set(BOOST_REQUIRED_COMPONENTS
-     filesystem
-     system
--    unit_test_framework
-     program_options
- )
- 
-Index: gnuradio-3.7.5/volk/lib/CMakeLists.txt
-===================================================================
---- gnuradio-3.7.5.orig/volk/lib/CMakeLists.txt
-+++ gnuradio-3.7.5/volk/lib/CMakeLists.txt
-@@ -580,7 +580,10 @@
- ########################################################################
- # Build the QA test application
- ########################################################################
--if(ENABLE_TESTING)
-+
-+find_package(Boost "1.35" COMPONENTS "unit_test_framework")
-+
-+if(ENABLE_TESTING AND BUILD_TEST)
- 
-     #include Boost headers
-     include_directories(${Boost_INCLUDE_DIRS})
-@@ -597,4 +600,4 @@
-         TARGET_DEPS volk
-     )
- 
--endif(ENABLE_TESTING)
-+endif(ENABLE_TESTING AND BUILD_TEST)
diff --git a/package/gnuradio/gnuradio.hash b/package/gnuradio/gnuradio.hash
index 86944f48c4..884f7ae758 100644
--- a/package/gnuradio/gnuradio.hash
+++ b/package/gnuradio/gnuradio.hash
@@ -1,2 +1,5 @@
 # From http://gnuradio.org/releases/gnuradio/sha256sums
-sha256 87d9ba3183858efdbb237add3f9de40f7d65f25e16904a9bc8d764a7287252d4  gnuradio-3.7.11.tar.gz
+sha256 1e07ce40fa3c3eede1fb54e320dad8a221a3c01de341e9cef2d7b265ed06a6e9  gnuradio-3.7.13.3.tar.gz
+
+# Hash for license file:
+sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/gnuradio/gnuradio.mk b/package/gnuradio/gnuradio.mk
index a55c116118..e79f848388 100644
--- a/package/gnuradio/gnuradio.mk
+++ b/package/gnuradio/gnuradio.mk
@@ -4,16 +4,19 @@
 #
 ################################################################################
 
-GNURADIO_VERSION = 3.7.11
+GNURADIO_VERSION = 3.7.13.3
 GNURADIO_SITE = http://gnuradio.org/releases/gnuradio
 GNURADIO_LICENSE = GPL-3.0+
 GNURADIO_LICENSE_FILES = COPYING
 
 GNURADIO_SUPPORTS_IN_SOURCE_BUILD = NO
 
-# host-python-cheetah is needed for volk to compile
+# host-python-cheetah, host-python-mako and host-python-six are needed for volk
+# to compile
 GNURADIO_DEPENDENCIES = \
 	host-python-cheetah \
+	host-python-mako \
+	host-python-six \
 	host-swig \
 	boost
 
