From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 10 Apr 2020 22:45:24 +0200
Subject: [Buildroot] [git commit] package/assimp: fix musl zlib/zip related
 compile failure
Message-ID: <20200410203127.5841A8E391@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b529a582ba4d7671597e95d7ab54ee652cbbc261
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As assimp fails to use system provided zlib/zip (and is picky
about the provided versions) use assimp contributed one
and backport one part of upstream patch to fix musl compile.

Fixes:

  http://autobuild.buildroot.net/results/4b373ae7d8fd40efe3e2592f94f2d769d6a77669

  In file included from .../assimp-5.0.1/code/3MF/D3MFExporter.cpp:61:
  .../assimp-5.0.1/contrib/zip/src/zip.h:30:15: error: conflicting declaration 'typedef long int ssize_t'
   typedef long  ssize_t;  /* byte count or error */
                 ^~~~~~~

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...-fix-ssize_t-typedef-mismatch-for-musl-co.patch | 50 ++++++++++++++++++++++
 package/assimp/Config.in                           |  1 -
 package/assimp/assimp.mk                           |  3 +-
 3 files changed, 51 insertions(+), 3 deletions(-)

diff --git a/package/assimp/0002-contrib-zip-fix-ssize_t-typedef-mismatch-for-musl-co.patch b/package/assimp/0002-contrib-zip-fix-ssize_t-typedef-mismatch-for-musl-co.patch
new file mode 100644
index 0000000000..a9a30c4834
--- /dev/null
+++ b/package/assimp/0002-contrib-zip-fix-ssize_t-typedef-mismatch-for-musl-co.patch
@@ -0,0 +1,50 @@
+From 3fef857a570d1ef2c96401358fe8e239625b48c9 Mon Sep 17 00:00:00 2001
+From: Peter Seiderer <ps.report@gmx.net>
+Date: Fri, 10 Apr 2020 18:11:50 +0200
+Subject: [PATCH] contrib/zip: fix ssize_t typedef mismatch for musl compile
+
+Musl uses defines __DEFINED_ssize_t to indicate ssize_t
+availability. So backport this part of upstream commit [1]
+to fixl musl compile.
+
+https://github.com/assimp/assimp/commit/f78446b14aff46db2ef27d062a275b6a01fd68b1
+
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+---
+ contrib/zip/src/zip.h | 13 +++++++++++--
+ 1 file changed, 11 insertions(+), 2 deletions(-)
+
+diff --git a/contrib/zip/src/zip.h b/contrib/zip/src/zip.h
+index 5f39df50..4672eb3e 100644
+--- a/contrib/zip/src/zip.h
++++ b/contrib/zip/src/zip.h
+@@ -20,8 +20,9 @@ extern "C" {
+ #endif
+ 
+ #if !defined(_SSIZE_T_DEFINED) && !defined(_SSIZE_T_DEFINED_) &&               \
+-    !defined(_SSIZE_T) && !defined(_SSIZE_T_) && !defined(__ssize_t_defined)
+-#define _SSIZE_T
++    !defined(__DEFINED_ssize_t) && !defined(__ssize_t_defined) &&              \
++    !defined(_SSIZE_T) && !defined(_SSIZE_T_)
++
+ // 64-bit Windows is the only mainstream platform
+ // where sizeof(long) != sizeof(void*)
+ #ifdef _WIN64
+@@ -29,6 +30,14 @@ typedef long long  ssize_t;  /* byte count or error */
+ #else
+ typedef long  ssize_t;  /* byte count or error */
+ #endif
++
++#define _SSIZE_T_DEFINED
++#define _SSIZE_T_DEFINED_
++#define __DEFINED_ssize_t
++#define __ssize_t_defined
++#define _SSIZE_T
++#define _SSIZE_T_
++
+ #endif
+ 
+ #ifndef MAX_PATH
+-- 
+2.26.0
+
diff --git a/package/assimp/Config.in b/package/assimp/Config.in
index 42bfee945d..9bdc054909 100644
--- a/package/assimp/Config.in
+++ b/package/assimp/Config.in
@@ -2,7 +2,6 @@ config BR2_PACKAGE_ASSIMP
 	bool "assimp"
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_WCHAR
-	select BR2_PACKAGE_ZLIB
 	help
 	  Open Asset Import Library (assimp) is a portable Open Source
 	  library to import various well-known 3D model formats in a
diff --git a/package/assimp/assimp.mk b/package/assimp/assimp.mk
index 5e8e825375..4aeb2963a9 100644
--- a/package/assimp/assimp.mk
+++ b/package/assimp/assimp.mk
@@ -8,7 +8,6 @@ ASSIMP_VERSION = 5.0.1
 ASSIMP_SITE = $(call github,assimp,assimp,v$(ASSIMP_VERSION))
 ASSIMP_LICENSE = BSD-3-Clause
 ASSIMP_LICENSE_FILES = LICENSE
-ASSIMP_DEPENDENCIES = zlib
 ASSIMP_INSTALL_STAGING = YES
 
 # relocation truncated to fit: R_68K_GOT16O
@@ -28,7 +27,7 @@ ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_85180),y)
 ASSIMP_CXXFLAGS += -O0
 endif
 
-ASSIMP_CONF_OPTS += -DASSIMP_BUILD_TESTS=OFF \
+ASSIMP_CONF_OPTS += -DASSIMP_BUILD_ZLIB=ON -DASSIMP_BUILD_TESTS=OFF \
 	-DCMAKE_CXX_FLAGS="$(TARGET_CXXFLAGS) $(ASSIMP_CXXFLAGS)"
 
 $(eval $(cmake-package))
