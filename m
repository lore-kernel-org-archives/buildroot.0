From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 2 Oct 2019 21:00:27 +0200
Subject: [Buildroot] [git commit] package/libftdi1: drop second patch
Message-ID: <20191002185501.572968811B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1dfed441297f950fdb75a778e8fe13001fa3a8dc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Second patch is not needed anymore as the only, optional, dependency of
libusb is udev which can't be built statically

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...-not-check-for-g-when-FTDIPP-is-disabled.patch} |  0
 .../libftdi1/0002-cmake-fix-FindUSB1.cmake.patch   | 34 ----------------------
 ...-find-swig.patch => 0003-cmake-find-swig.patch} |  0
 3 files changed, 34 deletions(-)

diff --git a/package/libftdi1/0003-cmake-do-not-check-for-g-when-FTDIPP-is-disabled.patch b/package/libftdi1/0002-cmake-do-not-check-for-g-when-FTDIPP-is-disabled.patch
similarity index 100%
rename from package/libftdi1/0003-cmake-do-not-check-for-g-when-FTDIPP-is-disabled.patch
rename to package/libftdi1/0002-cmake-do-not-check-for-g-when-FTDIPP-is-disabled.patch
diff --git a/package/libftdi1/0002-cmake-fix-FindUSB1.cmake.patch b/package/libftdi1/0002-cmake-fix-FindUSB1.cmake.patch
deleted file mode 100644
index 5619a0ceec..0000000000
--- a/package/libftdi1/0002-cmake-fix-FindUSB1.cmake.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 81275d75ae88fe8ab1915d3ba260ea935e63c362 Mon Sep 17 00:00:00 2001
-From: Samuel Martin <s.martin49@gmail.com>
-Date: Sun, 25 Jan 2015 10:01:17 +0100
-Subject: [PATCH 2/2] cmake: fix FindUSB1.cmake
-
-Make sure all ldflags are correctly set, especially for static build.
-
-Signed-off-by: Samuel Martin <s.martin49@gmail.com>
----
- cmake/FindUSB1.cmake | 8 ++++++--
- 1 file changed, 6 insertions(+), 2 deletions(-)
-
-diff --git a/cmake/FindUSB1.cmake b/cmake/FindUSB1.cmake
-index b90e297..e7f1b3c 100644
---- a/cmake/FindUSB1.cmake
-+++ b/cmake/FindUSB1.cmake
-@@ -26,8 +26,12 @@ else (LIBUSB_INCLUDE_DIR AND LIBUSB_LIBRARIES)
-     PATH_SUFFIXES libusb-1.0
-     PATHS ${PC_LIBUSB_INCLUDEDIR} ${PC_LIBUSB_INCLUDE_DIRS})
- 
--  FIND_LIBRARY(LIBUSB_LIBRARIES NAMES usb-1.0
--    PATHS ${PC_LIBUSB_LIBDIR} ${PC_LIBUSB_LIBRARY_DIRS})
-+  set(LIBUSB_LIBRARIES ${PC_LIBUSB_STATIC_LDFLAGS} ${PC_LIBUSB_STATIC_LDFLAGS_OTHER})
-+  foreach(libname ${PC_LIBUSB_STATIC_LIBRARIES})
-+    FIND_LIBRARY(lib NAMES ${libname}
-+      PATHS ${PC_LIBUSB_LIBDIR} ${PC_LIBUSB_LIBRARY_DIRS})
-+    list(APPEND LIBUSB_LIBRARIES ${lib})
-+  endforeach()
- 
-   include(FindPackageHandleStandardArgs)
-   FIND_PACKAGE_HANDLE_STANDARD_ARGS(LIBUSB DEFAULT_MSG LIBUSB_LIBRARIES LIBUSB_INCLUDE_DIR)
--- 
-2.2.2
-
diff --git a/package/libftdi1/0004-cmake-find-swig.patch b/package/libftdi1/0003-cmake-find-swig.patch
similarity index 100%
rename from package/libftdi1/0004-cmake-find-swig.patch
rename to package/libftdi1/0003-cmake-find-swig.patch
