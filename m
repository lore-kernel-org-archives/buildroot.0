From: Pierre-Jean Texier <pjtexier@koncepto.io>
Date: Sun, 23 Jun 2019 15:10:39 +0200
Subject: [Buildroot] [PATCH 1/1] package/libiio: bump to version 0.18
Message-ID: <1561295439-11676-1-git-send-email-pjtexier@koncepto.io>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

See https://github.com/analogdevicesinc/libiio/releases

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
---
 ...ll-of-binaries-with-a-static-only-library.patch | 44 ++++++++++++++++++++++
 package/libiio/libiio.hash                         |  2 +-
 package/libiio/libiio.mk                           |  2 +-
 3 files changed, 46 insertions(+), 2 deletions(-)
 create mode 100644 package/libiio/0001-fix-install-of-binaries-with-a-static-only-library.patch

diff --git a/package/libiio/0001-fix-install-of-binaries-with-a-static-only-library.patch b/package/libiio/0001-fix-install-of-binaries-with-a-static-only-library.patch
new file mode 100644
index 0000000..a02bb60
--- /dev/null
+++ b/package/libiio/0001-fix-install-of-binaries-with-a-static-only-library.patch
@@ -0,0 +1,44 @@
+From 5090603d01779bb1717fb0c50953330e8770550f Mon Sep 17 00:00:00 2001
+From: Pierre-Jean Texier <pjtexier@koncepto.io>
+Date: Sun, 23 Jun 2019 14:11:37 +0200
+Subject: [PATCH] fix install of binaries with a static only library
+
+Define CMAKE_INSTALL_RPATH only if ENABLE_SHARED is set otherwise the
+following issue occured:
+
+CMake Error at iiod/cmake_install.cmake:45 (file):
+  file RPATH_CHANGE could not write new RPATH:
+
+    /usr/lib
+
+  to the file:
+
+    /home/pjtexier/<path>/usr/sbin/iiod
+
+  No valid ELF RPATH or RUNPATH entry exists in the file; File does not have
+  a valid ELF identification.
+Call Stack (most recent call first):
+  cmake_install.cmake:50 (include)
+
+Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
+[Upstream status: https://github.com/analogdevicesinc/libiio/pull/283]
+---
+ CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index d9b7ea1..634e553 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -15,7 +15,7 @@ endif()
+ 
+ set(CMAKE_INSTALL_DOCDIR "" CACHE PATH "documentation root (DATAROOTDIR/doc/${PROJECT_NAME}${LIBIIO_VERSION_MAJOR}-doc)")
+ include(GNUInstallDirs)
+-if (${CMAKE_SYSTEM_NAME} MATCHES "Linux")
++if(ENABLE_SHARED AND ${CMAKE_SYSTEM_NAME} MATCHES "Linux")
+ 	set(CMAKE_INSTALL_RPATH "${CMAKE_INSTALL_FULL_LIBDIR}")
+ 	set(CMAKE_INSTALL_RPATH_USE_LINK_PATH TRUE)
+ endif()
+-- 
+2.7.4
+
diff --git a/package/libiio/libiio.hash b/package/libiio/libiio.hash
index 800b2ee..34c3144 100644
--- a/package/libiio/libiio.hash
+++ b/package/libiio/libiio.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 a729f8ff48137ad271a3e2951f322b35c1bf2ec075b488d75c8bd071c693fd19  libiio-0.15.tar.gz
+sha256 bc2c5299974b65cfe9aa4a06d8c74d7651594e026bce416db48a2c5aa7ba2554  libiio-0.18.tar.gz
 sha256 102900208eef27b766380135906d431dba87edaa7ec6aa72e6ebd3dd67f3a97b  COPYING.txt
diff --git a/package/libiio/libiio.mk b/package/libiio/libiio.mk
index 2371a71..8c8f79b 100644
--- a/package/libiio/libiio.mk
+++ b/package/libiio/libiio.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBIIO_VERSION = 0.15
+LIBIIO_VERSION = 0.18
 LIBIIO_SITE = $(call github,analogdevicesinc,libiio,v$(LIBIIO_VERSION))
 LIBIIO_INSTALL_STAGING = YES
 LIBIIO_LICENSE = LGPL-2.1+
-- 
2.7.4
