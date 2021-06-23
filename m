From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 23 Jun 2021 08:59:09 +0200
Subject: [Buildroot] [git commit] package/exiv2: security bump to version
 0.27.4
Message-ID: <20210623063137.65E528D452@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bcace429426ee91aac56f3dcc33b69e22141d384
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix 12 security issues including CVE-2021-3482, CVE-2021-29457,
CVE-2021-29458, CVE-2021-29463, CVE-2021-29464, CVE-2021-29470,
CVE-2021-29473, CVE-2021-29623 and CVE-2021-32617

- Use official tarball
- Drop patch (already in version)
- Update indentation in hash file (two spaces)

https://github.com/Exiv2/exiv2/releases/tag/v0.27.4

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...lerFlags.cmake-properly-detect-availabili.patch | 58 ----------------------
 package/exiv2/exiv2.hash                           |  4 +-
 package/exiv2/exiv2.mk                             |  5 +-
 3 files changed, 5 insertions(+), 62 deletions(-)

diff --git a/package/exiv2/0001-cmake-compilerFlags.cmake-properly-detect-availabili.patch b/package/exiv2/0001-cmake-compilerFlags.cmake-properly-detect-availabili.patch
deleted file mode 100644
index 7b9fa48815..0000000000
--- a/package/exiv2/0001-cmake-compilerFlags.cmake-properly-detect-availabili.patch
+++ /dev/null
@@ -1,58 +0,0 @@
-From 2f6d2e5795382f0d6e22f5aea52e8104110d24ad Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
-Date: Sun, 19 Jul 2020 16:29:15 +0200
-Subject: [PATCH] cmake/compilerFlags.cmake: properly detect availability of
- flags
-
-Instead of relying on fragile and complex logic to decide if a
-compiler flag is available or not, use the check_c_compiler_flag()
-macro provided by the CMake standard library.
-
-This for example avoids using -fcf-protection on architectures that
-don't support this option.
-
-[Upstream: https://github.com/Exiv2/exiv2/pull/1252. The submitted
-patch is slightly different than this one, due to other changes
-between 0.27.3 and master.]
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
----
- cmake/compilerFlags.cmake | 18 +++++++++++-------
- 1 file changed, 11 insertions(+), 7 deletions(-)
-
-diff --git a/cmake/compilerFlags.cmake b/cmake/compilerFlags.cmake
-index 0418aa61..be430977 100644
---- a/cmake/compilerFlags.cmake
-+++ b/cmake/compilerFlags.cmake
-@@ -1,4 +1,5 @@
- # These flags applies to exiv2lib, the applications, and to the xmp code
-+include(CheckCCompilerFlag)
- 
- if ( MINGW OR UNIX OR MSYS ) # MINGW, Linux, APPLE, CYGWIN
-     if (${CMAKE_CXX_COMPILER_ID} STREQUAL GNU)
-@@ -25,13 +26,16 @@ if ( MINGW OR UNIX OR MSYS ) # MINGW, Linux, APPLE, CYGWIN
- 
-         # This fails under Fedora, MinGW GCC 8.3.0 and CYGWIN/MSYS 9.3.0
-         if (NOT (MINGW OR CMAKE_HOST_SOLARIS OR CYGWIN OR MSYS) )
--            if (COMPILER_IS_GCC AND CMAKE_CXX_COMPILER_VERSION VERSION_GREATER_EQUAL 8.0)
--                add_compile_options(-fstack-clash-protection -fcf-protection)
--            endif()
--
--            if( (COMPILER_IS_GCC   AND CMAKE_CXX_COMPILER_VERSION VERSION_GREATER_EQUAL 5.0) # Not in GCC 4.8
--            OR  (COMPILER_IS_CLANG AND CMAKE_CXX_COMPILER_VERSION VERSION_GREATER_EQUAL 3.7) # Not in Clang 3.4.2
--            )
-+            check_c_compiler_flag(-fstack-clash-protection HAS_FSTACK_CLASH_PROTECTION)
-+            check_c_compiler_flag(-fcf-protection HAS_FCF_PROTECTION)
-+            check_c_compiler_flag(-fstack-protector-strong HAS_FSTACK_PROTECTOR_STRONG)
-+            if(HAS_FSTACK_CLASH_PROTECTION)
-+                add_compile_options(-fstack-clash-protection)
-+            endif()
-+            if(GCC_HAS_FCF_PROTECTION)
-+                add_compile_options(-fcf-protection)
-+            endif()
-+            if(GCC_HAS_FSTACK_PROTECTOR_STRONG)
-                 add_compile_options(-fstack-protector-strong)
-             endif()
-         endif()
---- 
-2.26.2
-
diff --git a/package/exiv2/exiv2.hash b/package/exiv2/exiv2.hash
index 94ab4ac638..c9af674a51 100644
--- a/package/exiv2/exiv2.hash
+++ b/package/exiv2/exiv2.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 6398bc743c32b85b2cb2a604273b8c90aa4eb0fd7c1700bf66cbb2712b4f00c1 exiv2-0.27.3.tar.gz
-sha256 a7ba75cb966aca374711e2af49e5f3aea6a4443a803440f5d93e73a5a1222f66 COPYING
+sha256  84366dba7c162af9a7603bcd6c16f40fe0e9af294ba2fd2f66ffffb9fbec904e  exiv2-0.27.4-Source.tar.gz
+sha256  a7ba75cb966aca374711e2af49e5f3aea6a4443a803440f5d93e73a5a1222f66  COPYING
diff --git a/package/exiv2/exiv2.mk b/package/exiv2/exiv2.mk
index 3d4cf41731..52bf03fc63 100644
--- a/package/exiv2/exiv2.mk
+++ b/package/exiv2/exiv2.mk
@@ -4,8 +4,9 @@
 #
 ################################################################################
 
-EXIV2_VERSION = 0.27.3
-EXIV2_SITE = $(call github,Exiv2,exiv2,v$(EXIV2_VERSION))
+EXIV2_VERSION = 0.27.4
+EXIV2_SOURCE = exiv2-$(EXIV2_VERSION)-Source.tar.gz
+EXIV2_SITE = https://exiv2.org/builds
 EXIV2_INSTALL_STAGING = YES
 EXIV2_LICENSE = GPL-2.0+
 EXIV2_LICENSE_FILES = COPYING
