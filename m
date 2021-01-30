From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 30 Jan 2021 13:27:59 +0100
Subject: [Buildroot] [git commit] package/libgeos: disable benchmarks
Message-ID: <20210130121305.3522185445@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=eebf13ab965bfa63a3391803f2650bf1a5762a36
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
 - http://autobuild.buildroot.org/results/790450f7541d690cdef3917d7056759cb9b403c5

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0001-CMakeLists.txt-add-BUILD_BENCHMARKS.patch | 37 ++++++++++++++++++++++
 package/libgeos/libgeos.mk                         |  1 +
 2 files changed, 38 insertions(+)

diff --git a/package/libgeos/0001-CMakeLists.txt-add-BUILD_BENCHMARKS.patch b/package/libgeos/0001-CMakeLists.txt-add-BUILD_BENCHMARKS.patch
new file mode 100644
index 0000000000..94748dcdbd
--- /dev/null
+++ b/package/libgeos/0001-CMakeLists.txt-add-BUILD_BENCHMARKS.patch
@@ -0,0 +1,37 @@
+From 16848d6da27140caf922f71a233f96a508fb061e Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sun, 24 Jan 2021 12:38:37 +0100
+Subject: [PATCH] CMakeLists.txt: add BUILD_BENCHMARKS
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/libgeos/geos/pull/395]
+---
+ CMakeLists.txt | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index c8b39bac..8ca6b829 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -48,6 +48,7 @@ option(BUILD_SHARED_LIBS "Build GEOS with shared libraries" ON)
+ set(CMAKE_CXX_STANDARD 11 CACHE STRING "C++ standard version to use (default is 11)")
+ 
+ ## GEOS custom variables
++option(BUILD_BENCHMARKS "Build GEOS benchmarks" ON)
+ cmake_dependent_option(GEOS_BUILD_DEVELOPER
+   "Build with compilation flags useful for development" ON
+   "GEOS_BUILD_FROM_GIT" OFF)
+@@ -292,7 +293,9 @@ endif()
+ #-----------------------------------------------------------------------------
+ # Benchmarks
+ #-----------------------------------------------------------------------------
+-add_subdirectory(benchmarks)
++if(BUILD_BENCHMARKS)
++  add_subdirectory(benchmarks)
++endif()
+ 
+ #-----------------------------------------------------------------------------
+ # Utils
+-- 
+2.29.2
+
diff --git a/package/libgeos/libgeos.mk b/package/libgeos/libgeos.mk
index d7905cbb21..50c3832c01 100644
--- a/package/libgeos/libgeos.mk
+++ b/package/libgeos/libgeos.mk
@@ -11,6 +11,7 @@ LIBGEOS_LICENSE = LGPL-2.1
 LIBGEOS_LICENSE_FILES = COPYING
 LIBGEOS_INSTALL_STAGING = YES
 LIBGEOS_CONFIG_SCRIPTS = geos-config
+LIBGEOS_CONF_OPTS = -DBUILD_BENCHMARKS=OFF
 
 ifeq ($(BR2_arm)$(BR2_armeb),y)
 LIBGEOS_CONF_OPTS += -DDISABLE_GEOS_INLINE=ON
