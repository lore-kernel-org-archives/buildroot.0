From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 19 Jul 2020 18:17:36 +0200
Subject: [Buildroot] [git commit] package/exiv2: fix compiler flags detection
Message-ID: <20200719161337.6C377844E1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d0053cdb19dbc9123208b3e7ddf2599fa04ff0a3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add a patch, which has been submitted upstream, to properly detect the
availability of compiler flags before using them.

This will fix the build of exiv2 on CPU architectures for which gcc
doesn't implement -fcf-protection.

Fixes:

  http://autobuild.buildroot.net/results/ef6a6fa2309e66a7a36fface626ae0da1a7ec633/
  (and many similar build failures on other architectures)

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
[yann.morin.1998 at free.fr:
  - fix indentation s/TAB/spaces/
  - fix CRLF dropped by patchwork
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 ...lerFlags.cmake-properly-detect-availabili.patch | 58 ++++++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/package/exiv2/0001-cmake-compilerFlags.cmake-properly-detect-availabili.patch b/package/exiv2/0001-cmake-compilerFlags.cmake-properly-detect-availabili.patch
new file mode 100644
index 0000000000..7b9fa48815
--- /dev/null
+++ b/package/exiv2/0001-cmake-compilerFlags.cmake-properly-detect-availabili.patch
@@ -0,0 +1,58 @@
+From 2f6d2e5795382f0d6e22f5aea52e8104110d24ad Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+Date: Sun, 19 Jul 2020 16:29:15 +0200
+Subject: [PATCH] cmake/compilerFlags.cmake: properly detect availability of
+ flags
+
+Instead of relying on fragile and complex logic to decide if a
+compiler flag is available or not, use the check_c_compiler_flag()
+macro provided by the CMake standard library.
+
+This for example avoids using -fcf-protection on architectures that
+don't support this option.
+
+[Upstream: https://github.com/Exiv2/exiv2/pull/1252. The submitted
+patch is slightly different than this one, due to other changes
+between 0.27.3 and master.]
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ cmake/compilerFlags.cmake | 18 +++++++++++-------
+ 1 file changed, 11 insertions(+), 7 deletions(-)
+
+diff --git a/cmake/compilerFlags.cmake b/cmake/compilerFlags.cmake
+index 0418aa61..be430977 100644
+--- a/cmake/compilerFlags.cmake
++++ b/cmake/compilerFlags.cmake
+@@ -1,4 +1,5 @@
+ # These flags applies to exiv2lib, the applications, and to the xmp code
++include(CheckCCompilerFlag)
+ 
+ if ( MINGW OR UNIX OR MSYS ) # MINGW, Linux, APPLE, CYGWIN
+     if (${CMAKE_CXX_COMPILER_ID} STREQUAL GNU)
+@@ -25,13 +26,16 @@ if ( MINGW OR UNIX OR MSYS ) # MINGW, Linux, APPLE, CYGWIN
+ 
+         # This fails under Fedora, MinGW GCC 8.3.0 and CYGWIN/MSYS 9.3.0
+         if (NOT (MINGW OR CMAKE_HOST_SOLARIS OR CYGWIN OR MSYS) )
+-            if (COMPILER_IS_GCC AND CMAKE_CXX_COMPILER_VERSION VERSION_GREATER_EQUAL 8.0)
+-                add_compile_options(-fstack-clash-protection -fcf-protection)
+-            endif()
+-
+-            if( (COMPILER_IS_GCC   AND CMAKE_CXX_COMPILER_VERSION VERSION_GREATER_EQUAL 5.0) # Not in GCC 4.8
+-            OR  (COMPILER_IS_CLANG AND CMAKE_CXX_COMPILER_VERSION VERSION_GREATER_EQUAL 3.7) # Not in Clang 3.4.2
+-            )
++            check_c_compiler_flag(-fstack-clash-protection HAS_FSTACK_CLASH_PROTECTION)
++            check_c_compiler_flag(-fcf-protection HAS_FCF_PROTECTION)
++            check_c_compiler_flag(-fstack-protector-strong HAS_FSTACK_PROTECTOR_STRONG)
++            if(HAS_FSTACK_CLASH_PROTECTION)
++                add_compile_options(-fstack-clash-protection)
++            endif()
++            if(GCC_HAS_FCF_PROTECTION)
++                add_compile_options(-fcf-protection)
++            endif()
++            if(GCC_HAS_FSTACK_PROTECTOR_STRONG)
+                 add_compile_options(-fstack-protector-strong)
+             endif()
+         endif()
+--- 
+2.26.2
+
