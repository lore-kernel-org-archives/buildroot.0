From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 31 Aug 2014 23:44:58 +0200
Subject: [Buildroot] [git commit] package/polarssl: fix static link
Message-ID: <20140831221145.759C79D4F3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ec3417676ec44a1e9799d2669519c11af5643ce6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- disable shared object build when BR2_PREFER_STATIC_LIB is set
- patch the CMake code for handling static/shared object build using
  standard CMake flags, instead of the ucstom ones.

Fixes:
  http://autobuild.buildroot.net/results/754/754947d2a77a4dbe91057d8ce64fc4996e716ece/

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...he-standard-CMake-flag-to-drive-the-share.patch |   39 ++++++++++++++++++++
 package/polarssl/polarssl.mk                       |    2 -
 2 files changed, 39 insertions(+), 2 deletions(-)

diff --git a/package/polarssl/polarssl-0003-cmake-use-the-standard-CMake-flag-to-drive-the-share.patch b/package/polarssl/polarssl-0003-cmake-use-the-standard-CMake-flag-to-drive-the-share.patch
new file mode 100644
index 0000000..d241ae2
--- /dev/null
+++ b/package/polarssl/polarssl-0003-cmake-use-the-standard-CMake-flag-to-drive-the-share.patch
@@ -0,0 +1,39 @@
+From a14028b0878c1ba27f7c7a6d0962874d0f7f3801 Mon Sep 17 00:00:00 2001
+From: Samuel Martin <s.martin49@gmail.com>
+Date: Sun, 31 Aug 2014 11:54:37 +0200
+Subject: [PATCH 3/3] cmake: use the standard CMake flag to drive the shared
+ object build
+
+If BUILD_SHARED_LIBS is set and not USE_SHARED_POLARSSL_LIBRARY, then
+drive USE_SHARED_POLARSSL_LIBRARY with the BUILD_SHARED_LIBS value.
+
+Signed-off-by: Samuel Martin <s.martin49@gmail.com>
+---
+ library/CMakeLists.txt | 14 ++++++++++++--
+ 1 file changed, 12 insertions(+), 2 deletions(-)
+
+diff --git a/library/CMakeLists.txt b/library/CMakeLists.txt
+index 27bd2e0..2ae0aba 100644
+--- a/library/CMakeLists.txt
++++ b/library/CMakeLists.txt
+@@ -1,5 +1,15 @@
+-option(USE_STATIC_POLARSSL_LIBRARY "Build PolarSSL static library." ON)
+-option(USE_SHARED_POLARSSL_LIBRARY "Build PolarSSL shared library." OFF)
++# Use the standard CMake flag to drive the shared object build.
++if(DEFINED BUILD_SHARED_LIBS AND NOT DEFINED USE_STATIC_POLARSSL_LIBRARY AND NOT DEFINED USE_SHARED_POLARSSL_LIBRARY)
++  set(USE_STATIC_POLARSSL_LIBRARY ON)
++  if(BUILD_SHARED_LIBS)
++    set(USE_SHARED_POLARSSL_LIBRARY ON)
++  else()
++    set(USE_SHARED_POLARSSL_LIBRARY OFF)
++  endif()
++else()
++  option(USE_STATIC_POLARSSL_LIBRARY "Build PolarSSL static library." ON)
++  option(USE_SHARED_POLARSSL_LIBRARY "Build PolarSSL shared library." OFF)
++endif()
+ 
+ set(src
+      aes.c
+-- 
+2.1.0
+
diff --git a/package/polarssl/polarssl.mk b/package/polarssl/polarssl.mk
index 24f09ed..a8bcca6 100644
--- a/package/polarssl/polarssl.mk
+++ b/package/polarssl/polarssl.mk
@@ -8,8 +8,6 @@ POLARSSL_SITE = https://polarssl.org/code/releases
 POLARSSL_VERSION = 1.2.11
 POLARSSL_SOURCE = polarssl-$(POLARSSL_VERSION)-gpl.tgz
 POLARSSL_CONF_OPT = \
-	-DUSE_SHARED_POLARSSL_LIBRARY=ON \
-	-DUSE_STATIC_POLARSSL_LIBRARY=ON \
 	-DBUILD_TESTS=OFF \
 	-DENABLE_PROGRAMS=$(if $(BR2_PACKAGE_POLARSSL_PROGRAMS),ON,OFF)
 
