From: Samuel Martin <s.martin49@gmail.com>
Date: Tue, 30 Dec 2014 10:36:27 +0100
Subject: [Buildroot] [PATCH 2/2] package/libiio: fix static build
In-Reply-To: <1419932187-2319-1-git-send-email-s.martin49@gmail.com>
References: <1419932187-2319-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1419932187-2319-2-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Use the CMake module provided by libxml2 instead of the one from CMake to
correctly set the cflags and ldflags.

Fixes:
  http://autobuild.buildroot.net/results/964f98fafdcd7e994ea25cf0993915d81537c31c/

Note that this patch needs the following one to be merged in libxml2:
  https://mail.gnome.org/archives/xml/2014-December/msg00015.html

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
---
 ...l2-detection-try-first-the-CMake-module-f.patch | 42 ++++++++++++++++++++++
 1 file changed, 42 insertions(+)
 create mode 100644 package/libiio/0002-cmake-libxml2-detection-try-first-the-CMake-module-f.patch

diff --git a/package/libiio/0002-cmake-libxml2-detection-try-first-the-CMake-module-f.patch b/package/libiio/0002-cmake-libxml2-detection-try-first-the-CMake-module-f.patch
new file mode 100644
index 0000000..9f44169
--- /dev/null
+++ b/package/libiio/0002-cmake-libxml2-detection-try-first-the-CMake-module-f.patch
@@ -0,0 +1,42 @@
+From 4f849e1d2287206cfb7ff0fdeca96c22383b0d53 Mon Sep 17 00:00:00 2001
+From: Samuel Martin <s.martin49@gmail.com>
+Date: Mon, 29 Dec 2014 19:05:13 +0100
+Subject: [PATCH] cmake: libxml2 detection: try first the CMake module from
+ libxml2
+
+Libxml2 >=2.9.2 provides its own CMake module, so check for it before
+falling back on the CMake's module FindLibXml2.cmake.
+
+Signed-off-by: Samuel Martin <s.martin49@gmail.com>
+---
+ CMakeLists.txt | 14 +++++++++++++-
+ 1 file changed, 13 insertions(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 393fee3..b4f1d26 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -38,7 +38,19 @@ endif()
+ find_library(AVAHI_CLIENT_LIBRARIES avahi-client)
+ find_library(AVAHI_COMMON_LIBRARIES avahi-common)
+ find_library(PTHREAD_LIBRARIES pthread)
+-include(FindLibXml2)
++
++# Since libxml2-2.9.2, libxml2 provides its own LibXml2-config.cmake, with all
++# variables correctly set.
++# So, try first to find the CMake module provided by libxml2 package, then fallback
++# on the CMake's FindLibXml2.cmake module (which can lack some definition, especially
++# in static build case).
++find_package(LibXml2 QUIET NO_MODULE)
++if(DEFINED LIBXML2_VERSION_STRING)
++  set(LIBXML2_FOUND ON)
++  set(LIBXML2_INCLUDE_DIR ${LIBXML2_INCLUDE_DIRS})
++else()
++  include(FindLibXml2)
++endif()
+ 
+ set(LIBIIO_CFILES channel.c device.c context.c buffer.c utilities.c)
+ set(LIBIIO_HEADERS iio.h)
+-- 
+2.2.1
+
-- 
2.2.1
