From: Samuel Martin <s.martin49@gmail.com>
Date: Sun, 31 Aug 2014 21:55:20 +0200
Subject: [Buildroot] [PATCH v2 7/9] package/musepack: fix static link
In-Reply-To: <1409514922-9509-1-git-send-email-s.martin49@gmail.com>
References: <1409514922-9509-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1409514922-9509-8-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- disable shared object build when BR2_PREFER_STATIC_LIB is set
- patch the CMake code for handling static/shared object build using
  standard CMake flags, instead of the custom ones.

Fixes:
  http://autobuild.buildroot.org/results/e5e/e5eef14d5ed76db824c47a7e679e68397a023526/

Signed-off-by: Samuel Martin <s.martin49@gmail.com>

---
changes v1->v2:
- new patch
---
 ...he-standard-CMake-flag-to-drive-the-share.patch | 43 ++++++++++++++++++++++
 1 file changed, 43 insertions(+)
 create mode 100644 package/musepack/musepack-0002-cmake-use-the-standard-CMake-flag-to-drive-the-share.patch

diff --git a/package/musepack/musepack-0002-cmake-use-the-standard-CMake-flag-to-drive-the-share.patch b/package/musepack/musepack-0002-cmake-use-the-standard-CMake-flag-to-drive-the-share.patch
new file mode 100644
index 0000000..4bfeca0
--- /dev/null
+++ b/package/musepack/musepack-0002-cmake-use-the-standard-CMake-flag-to-drive-the-share.patch
@@ -0,0 +1,43 @@
+From d2f01ba6fa2a065156fad686d1849309c661e527 Mon Sep 17 00:00:00 2001
+From: Samuel Martin <s.martin49@gmail.com>
+Date: Sun, 31 Aug 2014 12:07:31 +0200
+Subject: [PATCH 2/2] cmake: use the standard CMake flag to drive the shared
+ object build
+
+If BUILD_SHARED_LIBS is set and SHARED undefined, then drive SHARED with
+the BUILD_SHARED_LIBS value.
+
+Signed-off-by: Samuel Martin <s.martin49@gmail.com>
+---
+ CMakeLists.txt | 15 ++++++++++-----
+ 1 file changed, 10 insertions(+), 5 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index b13f78c..db75510 100755
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -7,11 +7,16 @@ project(libmpc C)
+ set(CMAKE_VERBOSE_MAKEFILE false)
+ TEST_BIG_ENDIAN(MPC_ENDIANNESS)
+ 
+-if(WIN32)
+-  option(SHARED "Use shared libmpcdec" OFF)
+-else(WIN32)
+-  option(SHARED "Use shared libmpcdec" ON)
+-endif(WIN32)
++# Use the standard CMake flag to drive the shared object build.
++if(DEFINED BUILD_SHARED_LIBS AND NOT DEFINED SHARED)
++  set(SHARED ${BUILD_SHARED_LIBS})
++else()
++  if(WIN32)
++    option(SHARED "Use shared libmpcdec" OFF)
++  else(WIN32)
++    option(SHARED "Use shared libmpcdec" ON)
++  endif(WIN32)
++endif()
+ 
+ add_definitions(-DFAST_MATH -DCVD_FASTLOG)
+ 
+-- 
+2.1.0
+
-- 
2.1.0
