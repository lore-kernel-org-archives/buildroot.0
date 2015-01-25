From: Samuel Martin <s.martin49@gmail.com>
Date: Sun, 25 Jan 2015 22:13:49 +0100
Subject: [Buildroot] [PATCH 2/8] package/libiio: update cmake code for
	libxml2 detection
In-Reply-To: <1422220435-18689-1-git-send-email-s.martin49@gmail.com>
References: <1422220435-18689-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1422220435-18689-3-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Only check for libxml2 when it is needed.

This prevents CMake from falling back on the libxml2-config.cmake
installed on the host system (i.e. when libxml2 >=2.9.2 is part of the
host system), but not enabled as a target package (i.e. not existing in
the staging tree).

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
---
 ...l2-detection-try-first-the-CMake-module-f.patch | 40 +++++++++++++---------
 1 file changed, 23 insertions(+), 17 deletions(-)

diff --git a/package/libiio/0002-cmake-libxml2-detection-try-first-the-CMake-module-f.patch b/package/libiio/0002-cmake-libxml2-detection-try-first-the-CMake-module-f.patch
index 9f44169..43dcf62 100644
--- a/package/libiio/0002-cmake-libxml2-detection-try-first-the-CMake-module-f.patch
+++ b/package/libiio/0002-cmake-libxml2-detection-try-first-the-CMake-module-f.patch
@@ -1,4 +1,4 @@
-From 4f849e1d2287206cfb7ff0fdeca96c22383b0d53 Mon Sep 17 00:00:00 2001
+From 238ce46fec88f5cba092ed4d8b52104eb2e31af2 Mon Sep 17 00:00:00 2001
 From: Samuel Martin <s.martin49@gmail.com>
 Date: Mon, 29 Dec 2014 19:05:13 +0100
 Subject: [PATCH] cmake: libxml2 detection: try first the CMake module from
@@ -7,36 +7,42 @@ Subject: [PATCH] cmake: libxml2 detection: try first the CMake module from
 Libxml2 >=2.9.2 provides its own CMake module, so check for it before
 falling back on the CMake's module FindLibXml2.cmake.
 
+Also, only check for libxml2 when needed (i.e. network backend is
+enabled). This prevents CMake from finding the libxml2-config.cmake
+when is installed on the host system, but not in the staging tree.
+
 Signed-off-by: Samuel Martin <s.martin49@gmail.com>
 ---
- CMakeLists.txt | 14 +++++++++++++-
- 1 file changed, 13 insertions(+), 1 deletion(-)
+ CMakeLists.txt | 16 +++++++++++++++-
+ 1 file changed, 15 insertions(+), 1 deletion(-)
 
 diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 393fee3..b4f1d26 100644
+index dcc6617..810b329 100644
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
-@@ -38,7 +38,19 @@ endif()
+@@ -53,7 +53,21 @@ endif()
  find_library(AVAHI_CLIENT_LIBRARIES avahi-client)
  find_library(AVAHI_COMMON_LIBRARIES avahi-common)
  find_library(PTHREAD_LIBRARIES pthread)
 -include(FindLibXml2)
 +
-+# Since libxml2-2.9.2, libxml2 provides its own LibXml2-config.cmake, with all
-+# variables correctly set.
-+# So, try first to find the CMake module provided by libxml2 package, then fallback
-+# on the CMake's FindLibXml2.cmake module (which can lack some definition, especially
-+# in static build case).
-+find_package(LibXml2 QUIET NO_MODULE)
-+if(DEFINED LIBXML2_VERSION_STRING)
-+  set(LIBXML2_FOUND ON)
-+  set(LIBXML2_INCLUDE_DIR ${LIBXML2_INCLUDE_DIRS})
-+else()
-+  include(FindLibXml2)
++if(WITH_NETWORK_BACKEND)
++    # Since libxml2-2.9.2, libxml2 provides its own LibXml2-config.cmake, with all
++    # variables correctly set.
++    # So, try first to find the CMake module provided by libxml2 package, then fallback
++    # on the CMake's FindLibXml2.cmake module (which can lack some definition, especially
++    # in static build case).
++    find_package(LibXml2 QUIET NO_MODULE)
++    if(DEFINED LIBXML2_VERSION_STRING)
++      set(LIBXML2_FOUND ON)
++      set(LIBXML2_INCLUDE_DIR ${LIBXML2_INCLUDE_DIRS})
++    else()
++      include(FindLibXml2)
++    endif()
 +endif()
  
  set(LIBIIO_CFILES channel.c device.c context.c buffer.c utilities.c)
  set(LIBIIO_HEADERS iio.h)
 -- 
-2.2.1
+2.2.2
 
-- 
2.2.2
