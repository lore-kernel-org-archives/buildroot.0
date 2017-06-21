From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 21 Jun 2017 18:42:51 +0200
Subject: [Buildroot] [git commit] kmsxx: update version
Message-ID: <20170621190012.96F9F80395@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7fd18fa02604d8333367fd0c6a1c062b17fc632f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Updating version to latest as on 26 June 2017 to include kmstest utility

Signed-off-by: Venkateswara Rao Mandela <venkat.mandela@ti.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...001-Fix-LTO-support-for-cross-compilation.patch | 45 ----------------------
 package/kmsxx/kmsxx.hash                           |  2 +-
 package/kmsxx/kmsxx.mk                             |  6 +--
 3 files changed, 4 insertions(+), 49 deletions(-)

diff --git a/package/kmsxx/0001-Fix-LTO-support-for-cross-compilation.patch b/package/kmsxx/0001-Fix-LTO-support-for-cross-compilation.patch
deleted file mode 100644
index 280583a..0000000
--- a/package/kmsxx/0001-Fix-LTO-support-for-cross-compilation.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-From 5da1f631bc753655ac94b08a6233eecd0d451327 Mon Sep 17 00:00:00 2001
-From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>
-Date: Fri, 26 Aug 2016 21:55:06 +0200
-Subject: [PATCH] Fix LTO support for cross-compilation.
-
-When cross-compiling, the ar and ranlib to be used for LTO are prefixed
-by the cross-tuple. gcc-ar and gcc-ranlib may not exist. Cfr.
-http://autobuild.buildroot.net/results/f3c/f3c48da3a9706cd366c0e0a96c3cd0ff959f2a78/
-
-Therefore, search for an appropriate lto-ar and lto-ranlib before
-enabling LTO.
-
-Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
----
-Submitted upstream: https://github.com/tomba/kmsxx/pull/14
----
- CMakeLists.txt | 12 +++++++++---
- 1 file changed, 9 insertions(+), 3 deletions(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index e5b5ea5..c61c81d 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -39,9 +39,15 @@ if (NOT ${U_CMAKE_BUILD_TYPE} MATCHES DEBUG)
-     CHECK_CXX_COMPILER_FLAG("-flto" HAS_LTO_FLAG)
- 
-     if (HAS_LTO_FLAG)
--        set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -flto")
--        set(CMAKE_AR gcc-ar)
--        set(CMAKE_RANLIB gcc-ranlib)
-+        find_program(LTO_AR NAMES "${CMAKE_C_COMPILER}-ar" gcc-ar)
-+        find_program(LTO_RANLIB NAMES "${CMAKE_C_COMPILER}-ranlib" gcc-ranlib)
-+        if (LTO_AR AND LTO_RANLIB)
-+            set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -flto")
-+            set(CMAKE_AR "${LTO_AR}")
-+            set(CMAKE_RANLIB "${LTO_RANLIB}")
-+        else()
-+            message(STATUS "gcc-ar or gcc-ranlib not found, disabling LTO")
-+        endif()
-     endif()
- endif()
- 
--- 
-2.9.3
-
diff --git a/package/kmsxx/kmsxx.hash b/package/kmsxx/kmsxx.hash
index 9e75bb9..94a9ea1 100644
--- a/package/kmsxx/kmsxx.hash
+++ b/package/kmsxx/kmsxx.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  ff8bdb84a738477a8740c835e23c5bb59aac750e9e72a4afcad4ec8820ec7da2  kmsxx-bd5f6471e619a6ba2987bc7f66ef78a531f94d6c.tar.gz
+sha256  28892e50c1d1c83fddff9ec683e3bdbd465f5032d0014ceeab43563b813807e1  kmsxx-cb0786049f960f2bd383617151b01318e02e9ff9.tar.gz
diff --git a/package/kmsxx/kmsxx.mk b/package/kmsxx/kmsxx.mk
index fd7b1a0..5c4a0c1 100644
--- a/package/kmsxx/kmsxx.mk
+++ b/package/kmsxx/kmsxx.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KMSXX_VERSION = bd5f6471e619a6ba2987bc7f66ef78a531f94d6c
+KMSXX_VERSION = cb0786049f960f2bd383617151b01318e02e9ff9
 KMSXX_SITE = $(call github,tomba,kmsxx,$(KMSXX_VERSION))
 KMSXX_LICENSE = MPL-2.0
 KMSXX_LICENSE_FILES = LICENSE
@@ -20,8 +20,8 @@ endif
 
 ifeq ($(BR2_PACKAGE_KMSXX_INSTALL_TESTS),y)
 KMSXX_TESTS = \
-	fbtestpat kmsblank kmscapture \
-	kmsprint kmsview testpat wbcap \
+	fbtest kmsblank kmscapture \
+	kmsprint kmstest kmsview wbcap \
 	wbm2m
 
 define KMSXX_INSTALL_TARGET_TESTS
