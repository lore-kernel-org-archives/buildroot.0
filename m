From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 15 Sep 2019 14:13:40 +0200
Subject: [Buildroot] [git commit] package/flatcc: bump to version 0.6.0
Message-ID: <20190915120957.E56128E23E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=af926937421b0a3eab17e7b7c49d893e0b559915
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Remove patch (already in version)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...txt-conditionally-require-C-based-on-FLAT.patch | 56 ----------------------
 package/flatcc/flatcc.hash                         |  2 +-
 package/flatcc/flatcc.mk                           |  2 +-
 3 files changed, 2 insertions(+), 58 deletions(-)

diff --git a/package/flatcc/0001-CMakeLists.txt-conditionally-require-C-based-on-FLAT.patch b/package/flatcc/0001-CMakeLists.txt-conditionally-require-C-based-on-FLAT.patch
deleted file mode 100644
index 7d76d6caf1..0000000000
--- a/package/flatcc/0001-CMakeLists.txt-conditionally-require-C-based-on-FLAT.patch
+++ /dev/null
@@ -1,56 +0,0 @@
-From 878d51187bbc1ad490b4cd15e3741bc0bd11b6b2 Mon Sep 17 00:00:00 2001
-From: Joel Carlson <JoelsonCarl@gmail.com>
-Date: Thu, 6 Sep 2018 14:53:20 -0600
-Subject: [PATCH] CMakeLists.txt: conditionally require C++ based on
- FLATCC_TEST (#94)
-
-C++ is only used when building the tests, so only include it as a
-language via project() when FLATCC_TEST is enabled. This allows
-toolchains that don't have C++ to build flatcc.
-
-Signed-off-by: Joel Carlson <JoelsonCarl@gmail.com>
----
-Upstream commit 878d51187bbc1ad490b4cd15e3741bc0bd11b6b2
----
- CMakeLists.txt | 18 ++++++++++++------
- 1 file changed, 12 insertions(+), 6 deletions(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index b39a3d1..5df5161 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -4,7 +4,18 @@
- #cmake_minimum_required (VERSION 2.8.11)
- cmake_minimum_required (VERSION 2.8)
- 
--project (FlatCC C CXX)
-+# Disable build of tests and samples. Due to custom build step
-+# dependency on flatcc tool, some custom build configurations may
-+# experience issues, and this option can then help.
-+option(FLATCC_TEST "enable tests" ON)
-+
-+# Conditionally set project languages based on FLATCC_TEST, as C++ is
-+# only necessary if building the tests.
-+if (FLATCC_TEST)
-+    project (FlatCC C CXX)
-+else()
-+    project (FlatCC C)
-+endif()
- 
- #
- # NOTE: when changing build options, clean the build using on of:
-@@ -35,11 +46,6 @@ option(FLATCC_RTONLY "enable build of runtime library only" OFF)
- # cmake -DBUILD_SHARED_LIBS=on can override.
- option(FLATCC_INSTALL "enable build of runtime library only" OFF)
- 
--# Disable build of tests and samples. Due to custom build step
--# dependency on flatcc tool, some custom build configurations may
--# experience issues, and this option can then help.
--option(FLATCC_TEST "enable tests" ON)
--
- # Use with debug build with testing enabled only. Enables generation
- # of coverage information during build and run. Adds target "coverage"
- # which collects data and makes HTML report in build directory
--- 
-2.7.4
-
diff --git a/package/flatcc/flatcc.hash b/package/flatcc/flatcc.hash
index b8a50edf01..11d9d9803a 100644
--- a/package/flatcc/flatcc.hash
+++ b/package/flatcc/flatcc.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256	02dac93d3daf8d0a290aa8711a9b8a53f047436ec5331adb1972389061ec6615  flatcc-0.5.2.tar.gz
+sha256	a92da3566d11e19bb807a83554b1a2c644a5bd91c9d9b088514456bb56e1c666  flatcc-0.6.0.tar.gz
 sha256	c8f0d9c1f92c658d87ebd854ee7447a3d3912d2c3a5c78c117787be5d5da8af3  LICENSE
diff --git a/package/flatcc/flatcc.mk b/package/flatcc/flatcc.mk
index 7a7c108af6..c27809b86a 100644
--- a/package/flatcc/flatcc.mk
+++ b/package/flatcc/flatcc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FLATCC_VERSION = 0.5.2
+FLATCC_VERSION = 0.6.0
 FLATCC_SITE = $(call github,dvidelabs,flatcc,v$(FLATCC_VERSION))
 FLATCC_LICENSE = Apache-2.0
 FLATCC_LICENSE_FILES = LICENSE
