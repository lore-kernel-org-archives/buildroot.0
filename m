From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Thu, 20 May 2021 21:45:23 +0200
Subject: [Buildroot] [git commit] Revert "package/assimp: fix musl zlib/zip
 related compile failure"
Message-ID: <20210520191635.749068889C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=59cbf375856d9de6981e3d44b172dfa873ffa78b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This reverts commit b529a582ba4d7671597e95d7ab54ee652cbbc261 as it
raises a build failure with hiawatha because assimp installs its own
zlib library in staging directory.

Fixes:
 - http://autobuild.buildroot.org/results/9cac31962d48245a5579da692dbc9488292a397e

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 ...-fix-ssize_t-typedef-mismatch-for-musl-co.patch | 50 ----------------------
 package/assimp/Config.in                           |  1 +
 package/assimp/assimp.mk                           |  3 +-
 3 files changed, 3 insertions(+), 51 deletions(-)

diff --git a/package/assimp/0002-contrib-zip-fix-ssize_t-typedef-mismatch-for-musl-co.patch b/package/assimp/0002-contrib-zip-fix-ssize_t-typedef-mismatch-for-musl-co.patch
deleted file mode 100644
index a9a30c4834..0000000000
--- a/package/assimp/0002-contrib-zip-fix-ssize_t-typedef-mismatch-for-musl-co.patch
+++ /dev/null
@@ -1,50 +0,0 @@
-From 3fef857a570d1ef2c96401358fe8e239625b48c9 Mon Sep 17 00:00:00 2001
-From: Peter Seiderer <ps.report@gmx.net>
-Date: Fri, 10 Apr 2020 18:11:50 +0200
-Subject: [PATCH] contrib/zip: fix ssize_t typedef mismatch for musl compile
-
-Musl uses defines __DEFINED_ssize_t to indicate ssize_t
-availability. So backport this part of upstream commit [1]
-to fixl musl compile.
-
-https://github.com/assimp/assimp/commit/f78446b14aff46db2ef27d062a275b6a01fd68b1
-
-Signed-off-by: Peter Seiderer <ps.report@gmx.net>
----
- contrib/zip/src/zip.h | 13 +++++++++++--
- 1 file changed, 11 insertions(+), 2 deletions(-)
-
-diff --git a/contrib/zip/src/zip.h b/contrib/zip/src/zip.h
-index 5f39df50..4672eb3e 100644
---- a/contrib/zip/src/zip.h
-+++ b/contrib/zip/src/zip.h
-@@ -20,8 +20,9 @@ extern "C" {
- #endif
- 
- #if !defined(_SSIZE_T_DEFINED) && !defined(_SSIZE_T_DEFINED_) &&               \
--    !defined(_SSIZE_T) && !defined(_SSIZE_T_) && !defined(__ssize_t_defined)
--#define _SSIZE_T
-+    !defined(__DEFINED_ssize_t) && !defined(__ssize_t_defined) &&              \
-+    !defined(_SSIZE_T) && !defined(_SSIZE_T_)
-+
- // 64-bit Windows is the only mainstream platform
- // where sizeof(long) != sizeof(void*)
- #ifdef _WIN64
-@@ -29,6 +30,14 @@ typedef long long  ssize_t;  /* byte count or error */
- #else
- typedef long  ssize_t;  /* byte count or error */
- #endif
-+
-+#define _SSIZE_T_DEFINED
-+#define _SSIZE_T_DEFINED_
-+#define __DEFINED_ssize_t
-+#define __ssize_t_defined
-+#define _SSIZE_T
-+#define _SSIZE_T_
-+
- #endif
- 
- #ifndef MAX_PATH
--- 
-2.26.0
-
diff --git a/package/assimp/Config.in b/package/assimp/Config.in
index 9bdc054909..42bfee945d 100644
--- a/package/assimp/Config.in
+++ b/package/assimp/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_ASSIMP
 	bool "assimp"
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_WCHAR
+	select BR2_PACKAGE_ZLIB
 	help
 	  Open Asset Import Library (assimp) is a portable Open Source
 	  library to import various well-known 3D model formats in a
diff --git a/package/assimp/assimp.mk b/package/assimp/assimp.mk
index e1b9a23499..eddfbc48b0 100644
--- a/package/assimp/assimp.mk
+++ b/package/assimp/assimp.mk
@@ -8,6 +8,7 @@ ASSIMP_VERSION = 5.0.1
 ASSIMP_SITE = $(call github,assimp,assimp,v$(ASSIMP_VERSION))
 ASSIMP_LICENSE = BSD-3-Clause
 ASSIMP_LICENSE_FILES = LICENSE
+ASSIMP_DEPENDENCIES = zlib
 ASSIMP_INSTALL_STAGING = YES
 
 # relocation truncated to fit: R_68K_GOT16O. We also need to disable
@@ -36,7 +37,7 @@ ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_85180),y)
 ASSIMP_CXXFLAGS += -O0
 endif
 
-ASSIMP_CONF_OPTS += -DASSIMP_BUILD_ZLIB=ON -DASSIMP_BUILD_TESTS=OFF \
+ASSIMP_CONF_OPTS += -DASSIMP_BUILD_TESTS=OFF \
 	-DCMAKE_CXX_FLAGS="$(TARGET_CXXFLAGS) $(ASSIMP_CXXFLAGS)"
 
 $(eval $(cmake-package))
