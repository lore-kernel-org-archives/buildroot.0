From: Andreas Ziegler <br015@umbiko.net>
Date: Thu, 17 Jun 2021 14:19:43 +0200
Subject: [Buildroot] [PATCH 1/1] package/gcc: undefine NDEBUG directive
Message-ID: <20210617121943.800180-1-br015@umbiko.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

GCC performs internal consistency checks that can be controlled with --enable-checking, but not completely removed for all stages of the build. One of these checks uses the assert macro from <assert.h>  Defining NDEBUG removes the assertion code, which is not anticipated in the gcc code. 

Undefine the NDEBUG flag for package/gcc to preserve assertions. 

This fixes the following error during build of GCC 10:

../../../libgomp/target.c: In function ?gomp_unmap_vars_internal?:
../../../libgomp/target.c:1474:9: error: unused variable ?is_tgt_unmapped? [-Werror=unused-variable]
 1474 |    bool is_tgt_unmapped = gomp_remove_var (devicep, k);
      |         ^~~~~~~~~~~~~~~
../../../libgomp/target.c:1473:28: error: unused variable ?k_tgt? [-Werror=unused-variable]
 1473 |    struct target_mem_desc *k_tgt = k->tgt;
      |                            ^~~~~

Signed-off-by: Andreas Ziegler <br015@umbiko.net>
---
 package/gcc/gcc.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
index ed9b93e50f..4ee32c03a7 100644
--- a/package/gcc/gcc.mk
+++ b/package/gcc/gcc.mk
@@ -90,7 +90,8 @@ HOST_GCC_COMMON_CONF_OPTS = \
 HOST_GCC_COMMON_CONF_ENV = \
 	MAKEINFO=missing
 
-GCC_COMMON_TARGET_CFLAGS = $(TARGET_CFLAGS)
+# gcc should not be built with NDEBUG enabled
+GCC_COMMON_TARGET_CFLAGS = $(TARGET_CFLAGS) -UNDEBUG
 GCC_COMMON_TARGET_CXXFLAGS = $(TARGET_CXXFLAGS)
 
 # used to fix ../../../../libsanitizer/libbacktrace/../../libbacktrace/elf.c:772:21: error: 'st.st_mode' may be used uninitialized in this function [-Werror=maybe-uninitialized]
-- 
2.25.1
