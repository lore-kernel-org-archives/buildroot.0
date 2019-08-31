From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 31 Aug 2019 12:23:00 +0200
Subject: [Buildroot] [PATCH/next 1/1] package/libcgi: bump version to 1.3.0
Message-ID: <20190831102300.15528-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Removed patches applied upstream:
https://github.com/rafaelsteil/libcgi/commit/d7cf836905ab8a46034295023a1a5677dd4c7ce5
https://github.com/rafaelsteil/libcgi/commit/58edd5089011f7d9846e9336670f90d135d1c580

Added upstream-provided md5 hash.

Upstream moved and renamed license file COPYING and added MIT license
file:
https://github.com/rafaelsteil/libcgi/commit/86e88b4b050fa5db1a5062e74429170e49dbde5a

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 .../0001-CMakeLists.txt-libcgi-is-in-C.patch  | 32 --------------
 ...on-t-force-the-build-of-a-shared-lib.patch | 44 -------------------
 package/libcgi/libcgi.hash                    |  9 ++--
 package/libcgi/libcgi.mk                      |  6 +--
 4 files changed, 9 insertions(+), 82 deletions(-)
 delete mode 100644 package/libcgi/0001-CMakeLists.txt-libcgi-is-in-C.patch
 delete mode 100644 package/libcgi/0002-CMakeLists.txt-don-t-force-the-build-of-a-shared-lib.patch

diff --git a/package/libcgi/0001-CMakeLists.txt-libcgi-is-in-C.patch b/package/libcgi/0001-CMakeLists.txt-libcgi-is-in-C.patch
deleted file mode 100644
index 682bfe5d52..0000000000
--- a/package/libcgi/0001-CMakeLists.txt-libcgi-is-in-C.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 043f7a470e32c036f0fe933ec5cd2003087d6b2e Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Sat, 2 Sep 2017 23:50:42 +0200
-Subject: [PATCH] CMakeLists.txt: libcgi is in C
-
-By default, CMake checks that both C and C++ compilers are
-available. However, since libcgi is only C, there's no need for a C++
-compiler check. Therefore, this commit adjusts the project() variable
-definition to only require C language support.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Submitted-upstream: https://github.com/rafaelsteil/libcgi/pull/38
----
- CMakeLists.txt | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index f98a99d..c599ca9 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -3,7 +3,7 @@
- #
- cmake_minimum_required(VERSION 2.8.8)
- 
--project(cgi)
-+project(cgi C)
- string(TOUPPER ${PROJECT_NAME} PROJECT_NAME_UC)
- string(TOLOWER ${PROJECT_NAME} PROJECT_NAME_LC)
- set(LIBPREFIX ${PROJECT_NAME})
--- 
-2.13.5
-
diff --git a/package/libcgi/0002-CMakeLists.txt-don-t-force-the-build-of-a-shared-lib.patch b/package/libcgi/0002-CMakeLists.txt-don-t-force-the-build-of-a-shared-lib.patch
deleted file mode 100644
index ebf91b0a62..0000000000
--- a/package/libcgi/0002-CMakeLists.txt-don-t-force-the-build-of-a-shared-lib.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From 9bb9d67da0e4faf4bb3a47786dee127e66a49ed0 Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Sun, 3 Sep 2017 15:22:30 +0200
-Subject: [PATCH] CMakeLists.txt: don't force the build of a shared library
-
-Building a shared library doesn't work on all platforms, so instead,
-let CMake rely on the standard BUILD_SHARED_LIBS variable to decide
-whether a static or shared library should be built.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Submitted-upstream: https://github.com/rafaelsteil/libcgi/pull/39
----
- src/CMakeLists.txt | 7 ++++---
- 1 file changed, 4 insertions(+), 3 deletions(-)
-
-diff --git a/src/CMakeLists.txt b/src/CMakeLists.txt
-index f32d22e..3bde408 100644
---- a/src/CMakeLists.txt
-+++ b/src/CMakeLists.txt
-@@ -23,17 +23,18 @@ set(CGI_SRC
- )
- 
- # create binary
--add_library(${PROJECT_NAME}-shared SHARED ${CGI_SRC})
--set_target_properties(${PROJECT_NAME}-shared PROPERTIES
-+add_library(${PROJECT_NAME} ${CGI_SRC})
-+set_target_properties(${PROJECT_NAME} PROPERTIES
- 	OUTPUT_NAME	${PROJECT_NAME}
- 	SOVERSION	${PROJECT_VERSION_MAJOR}
- 	VERSION		${PROJECT_VERSION}
- )
- 
- # install binary
--install(TARGETS ${PROJECT_NAME}-shared
-+install(TARGETS ${PROJECT_NAME}
- 	EXPORT ${PROJECT_NAME}-targets
- 	LIBRARY DESTINATION "${CMAKE_INSTALL_LIBDIR}"
-+	ARCHIVE DESTINATION "${CMAKE_INSTALL_LIBDIR}"
- )
- 
- # install cmake targets
--- 
-2.13.5
-
diff --git a/package/libcgi/libcgi.hash b/package/libcgi/libcgi.hash
index f071cc0aea..8760f91cf5 100644
--- a/package/libcgi/libcgi.hash
+++ b/package/libcgi/libcgi.hash
@@ -1,5 +1,8 @@
-# From https://github.com/rafaelsteil/libcgi/releases/download/v1.1/libcgi-1.1.tar.gz.sha256sum
-sha256  128445f2f828e84905d51bd53d11e2e08c489df3a07225ff9f198c1318092fe6  libcgi-1.1.tar.gz
+# From https://github.com/rafaelsteil/libcgi/releases/download/v1.3.0/libcgi-1.3.0.tar.gz.md5
+md5 6efdc968bdf986832b7e220d1b914e57  libcgi-1.3.0.tar.gz
+# From https://github.com/rafaelsteil/libcgi/releases/download/v1.3.0/libcgi-1.3.0.tar.gz.sha256
+sha256  d932f380b1a5dbfbddffaa76fac71bf505a9585d441c9ae86bfbf76033d9d8df  libcgi-1.3.0.tar.gz
 
 # Hash for license file:
-sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
+sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  LICENSES/LGPL-2.1.txt
+sha256  f32c31e26ec840753a8cd47cd2681e48be4cee853212d16a4b1d85ac4d677669  LICENSES/MIT.txt
diff --git a/package/libcgi/libcgi.mk b/package/libcgi/libcgi.mk
index d1e403fdf1..22163310d3 100644
--- a/package/libcgi/libcgi.mk
+++ b/package/libcgi/libcgi.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-LIBCGI_VERSION = 1.1
+LIBCGI_VERSION = 1.3.0
 LIBCGI_SITE = https://github.com/rafaelsteil/libcgi/releases/download/v$(LIBCGI_VERSION)
 
 LIBCGI_INSTALL_STAGING = YES
-LIBCGI_LICENSE = LGPL-2.1+
-LIBCGI_LICENSE_FILES = COPYING
+LIBCGI_LICENSE = LGPL-2.1+, MIT (base64.c)
+LIBCGI_LICENSE_FILES = LICENSES/LGPL-2.1.txt LICENSES/MIT.txt
 
 $(eval $(cmake-package))
-- 
2.20.1
