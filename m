From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 5 Mar 2016 14:51:33 +0100
Subject: [Buildroot] [git commit] package/gnuradio: bump version to 3.7.9.1
Message-ID: <20160305135201.462A77FAC8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bf56a2e5e8a202fcc5e94100165e439e6f9c0e73
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Rebased patch #0001.
Removed patch #0002, applied upstream:
https://github.com/gnuradio/gnuradio/commit/3e2dc168467304212328abd061bf10f0c511f17f

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../0001-suppress-boost_unitest-detection.patch    | 29 +++++++++++-----------
 .../gnuradio/0002-types_t-is-need-for-mode_t.patch | 19 --------------
 package/gnuradio/gnuradio.hash                     |  7 ++----
 package/gnuradio/gnuradio.mk                       |  4 +--
 4 files changed, 19 insertions(+), 40 deletions(-)

diff --git a/package/gnuradio/0001-suppress-boost_unitest-detection.patch b/package/gnuradio/0001-suppress-boost_unitest-detection.patch
index 7663881..f1713dc 100644
--- a/package/gnuradio/0001-suppress-boost_unitest-detection.patch
+++ b/package/gnuradio/0001-suppress-boost_unitest-detection.patch
@@ -7,8 +7,8 @@ Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
 ---
 Index: gnuradio-3.7.5/volk/cmake/VolkBoost.cmake
 ===================================================================
---- gnuradio-3.7.5.orig/volk/cmake/VolkBoost.cmake
-+++ gnuradio-3.7.5/volk/cmake/VolkBoost.cmake
+--- gnuradio-3.7.5.orig/volk/cmake/Modules/VolkBoost.cmake
++++ gnuradio-3.7.5/volk/cmake/Modules/VolkBoost.cmake
 @@ -29,7 +29,6 @@ set(__INCLUDED_VOLK_BOOST_CMAKE TRUE)
  set(BOOST_REQUIRED_COMPONENTS
      filesystem
@@ -21,20 +21,21 @@ Index: gnuradio-3.7.5/volk/lib/CMakeLists.txt
 ===================================================================
 --- gnuradio-3.7.5.orig/volk/lib/CMakeLists.txt
 +++ gnuradio-3.7.5/volk/lib/CMakeLists.txt
-@@ -540,8 +540,9 @@ endif(ENABLE_STATIC_LIBS)
+@@ -580,7 +580,10 @@
+ ########################################################################
  # Build the QA test application
  ########################################################################
- 
+-if(ENABLE_TESTING)
++
 +find_package(Boost "1.35" COMPONENTS "unit_test_framework")
++
++if(ENABLE_TESTING AND BUILD_TEST)
  
--if(Boost_FOUND)
-+if(Boost_FOUND AND BUILD_TEST)
- 
-     set_source_files_properties(
-         ${CMAKE_CURRENT_SOURCE_DIR}/testqa.cc PROPERTIES
-@@ -558,4 +559,4 @@ if(Boost_FOUND)
-     target_link_libraries(test_all volk ${Boost_LIBRARIES})
-     add_test(qa_volk_test_all test_all)
+     #include Boost headers
+     include_directories(${Boost_INCLUDE_DIRS})
+@@ -597,4 +600,4 @@
+         TARGET_DEPS volk
+     )
  
--endif(Boost_FOUND)
-+endif(Boost_FOUND AND BUILD_TEST)
+-endif(ENABLE_TESTING)
++endif(ENABLE_TESTING AND BUILD_TEST)
diff --git a/package/gnuradio/0002-types_t-is-need-for-mode_t.patch b/package/gnuradio/0002-types_t-is-need-for-mode_t.patch
deleted file mode 100644
index 7730d2d..0000000
--- a/package/gnuradio/0002-types_t-is-need-for-mode_t.patch
+++ /dev/null
@@ -1,19 +0,0 @@
-To avoid :
-error: 'mode_t' has not been declared
-sys/types.h must be included 
-
-Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
----
-Index: gnuradio-3.7.5/gnuradio-runtime/include/gnuradio/logger.h.in
-===================================================================
---- gnuradio-3.7.5.orig/gnuradio-runtime/include/gnuradio/logger.h.in
-+++ gnuradio-3.7.5/gnuradio-runtime/include/gnuradio/logger.h.in
-@@ -44,6 +44,8 @@
- 
- #ifdef _MSC_VER
- typedef unsigned short mode_t;
-+#else
-+#include <sys/types.h>
- #endif
- 
- #include <gnuradio/api.h>
diff --git a/package/gnuradio/gnuradio.hash b/package/gnuradio/gnuradio.hash
index d34dd55..bb934e2 100644
--- a/package/gnuradio/gnuradio.hash
+++ b/package/gnuradio/gnuradio.hash
@@ -1,5 +1,2 @@
-# From http://gnuradio.org/redmine/projects/gnuradio/files
-md5	b4a917a548f41ce25c6c88f9bc864bca	gnuradio-3.7.5.tar.gz
-
-# Locally calculated:
-sha256 467f62190687a34f9faa18be8d650e28d7046b94070b1b6d94355c28beb76243  gnuradio-3.7.5.tar.gz
+# From http://gnuradio.org/releases/gnuradio/sha256sums
+sha256	9c06f0f1ec14113203e0486fd526dd46ecef216dfe42f12d78d9b781b1ef967e	gnuradio-3.7.9.1.tar.gz
diff --git a/package/gnuradio/gnuradio.mk b/package/gnuradio/gnuradio.mk
index b7dbcb9..46d1f4f 100644
--- a/package/gnuradio/gnuradio.mk
+++ b/package/gnuradio/gnuradio.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-GNURADIO_VERSION = 3.7.5
-GNURADIO_SITE = http://gnuradio.org/redmine/attachments/download/792
+GNURADIO_VERSION = 3.7.9.1
+GNURADIO_SITE = http://gnuradio.org/releases/gnuradio
 GNURADIO_LICENSE = GPLv3+
 GNURADIO_LICENSE_FILES = COPYING
 
