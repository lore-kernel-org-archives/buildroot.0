From: Joel Carlson <joelsoncarl@gmail.com>
Date: Thu,  6 Sep 2018 15:11:29 -0600
Subject: [Buildroot] [PATCH/next v2] flatcc: conditionally require c++ in
 cmake
Message-ID: <1536268289-23275-1-git-send-email-JoelsonCarl@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Patches CMake files in flatcc to conditionally set c++ as a required
language depending on if FLATCC_TEST option is set, as only the tests
include a c++ file.

Fixes
http://autobuild.buildroot.net/results/8fb0447eed1d55b7687f657530e31695cf77ce5c/

Signed-off-by: Joel Carlson <JoelsonCarl@gmail.com>
---
Changes v1 -> v2:
  - patch CMake files to not require C++ when we don't build the tests,
    instead of making flatcc package require C++

Original patch was accidentally to master instead of next, and different subject
https://patchwork.ozlabs.org/patch/967100/
---
 ...txt-conditionally-require-C-based-on-FLAT.patch | 56 ++++++++++++++++++++++
 1 file changed, 56 insertions(+)
 create mode 100644 package/flatcc/0001-CMakeLists.txt-conditionally-require-C-based-on-FLAT.patch

diff --git a/package/flatcc/0001-CMakeLists.txt-conditionally-require-C-based-on-FLAT.patch b/package/flatcc/0001-CMakeLists.txt-conditionally-require-C-based-on-FLAT.patch
new file mode 100644
index 0000000..7d76d6c
--- /dev/null
+++ b/package/flatcc/0001-CMakeLists.txt-conditionally-require-C-based-on-FLAT.patch
@@ -0,0 +1,56 @@
+From 878d51187bbc1ad490b4cd15e3741bc0bd11b6b2 Mon Sep 17 00:00:00 2001
+From: Joel Carlson <JoelsonCarl@gmail.com>
+Date: Thu, 6 Sep 2018 14:53:20 -0600
+Subject: [PATCH] CMakeLists.txt: conditionally require C++ based on
+ FLATCC_TEST (#94)
+
+C++ is only used when building the tests, so only include it as a
+language via project() when FLATCC_TEST is enabled. This allows
+toolchains that don't have C++ to build flatcc.
+
+Signed-off-by: Joel Carlson <JoelsonCarl@gmail.com>
+---
+Upstream commit 878d51187bbc1ad490b4cd15e3741bc0bd11b6b2
+---
+ CMakeLists.txt | 18 ++++++++++++------
+ 1 file changed, 12 insertions(+), 6 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index b39a3d1..5df5161 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -4,7 +4,18 @@
+ #cmake_minimum_required (VERSION 2.8.11)
+ cmake_minimum_required (VERSION 2.8)
+ 
+-project (FlatCC C CXX)
++# Disable build of tests and samples. Due to custom build step
++# dependency on flatcc tool, some custom build configurations may
++# experience issues, and this option can then help.
++option(FLATCC_TEST "enable tests" ON)
++
++# Conditionally set project languages based on FLATCC_TEST, as C++ is
++# only necessary if building the tests.
++if (FLATCC_TEST)
++    project (FlatCC C CXX)
++else()
++    project (FlatCC C)
++endif()
+ 
+ #
+ # NOTE: when changing build options, clean the build using on of:
+@@ -35,11 +46,6 @@ option(FLATCC_RTONLY "enable build of runtime library only" OFF)
+ # cmake -DBUILD_SHARED_LIBS=on can override.
+ option(FLATCC_INSTALL "enable build of runtime library only" OFF)
+ 
+-# Disable build of tests and samples. Due to custom build step
+-# dependency on flatcc tool, some custom build configurations may
+-# experience issues, and this option can then help.
+-option(FLATCC_TEST "enable tests" ON)
+-
+ # Use with debug build with testing enabled only. Enables generation
+ # of coverage information during build and run. Adds target "coverage"
+ # which collects data and makes HTML report in build directory
+-- 
+2.7.4
+
-- 
2.7.4
