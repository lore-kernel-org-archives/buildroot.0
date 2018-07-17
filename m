From: Laurent Cans <laurent.cans@gmail.com>
Date: Tue, 17 Jul 2018 17:29:06 +0200
Subject: [Buildroot] [PATCH 1/1] aircrack-ng: bump to version 1.3
Message-ID: <20180717152906.28173-1-laurent.cans@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Remove patches (already in version)
- Add optional dependency to jemalloc

Signed-off-by: Laurent Cans <laurent.cans@gmail.com>
---
 .../0001-Fix-compilation-without-getauxval.patch   | 81 ----------------------
 ...g-without-opt-should-skip-stack-protector.patch | 52 --------------
 ...003-Autoconf-Added-NEON-intrinsic-support.patch | 64 -----------------
 ...compilation-with-gcrypt-on-some-platforms.patch | 53 --------------
 package/aircrack-ng/aircrack-ng.hash               |  4 +-
 package/aircrack-ng/aircrack-ng.mk                 |  9 ++-
 6 files changed, 10 insertions(+), 253 deletions(-)
 delete mode 100644 package/aircrack-ng/0001-Fix-compilation-without-getauxval.patch
 delete mode 100644 package/aircrack-ng/0002-autotools-The-flag-without-opt-should-skip-stack-protector.patch
 delete mode 100644 package/aircrack-ng/0003-Autoconf-Added-NEON-intrinsic-support.patch
 delete mode 100644 package/aircrack-ng/0004-Fixed-compilation-with-gcrypt-on-some-platforms.patch

diff --git a/package/aircrack-ng/0001-Fix-compilation-without-getauxval.patch b/package/aircrack-ng/0001-Fix-compilation-without-getauxval.patch
deleted file mode 100644
index 8a291356ca..0000000000
--- a/package/aircrack-ng/0001-Fix-compilation-without-getauxval.patch
+++ /dev/null
@@ -1,81 +0,0 @@
-From 0017bae95dbcf336495e36ac83c868ca1d7f2846 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sat, 26 May 2018 22:52:30 +0200
-Subject: [PATCH] Fix compilation without getauxval
-
-Protect getauxval call and sys/auxv.h include by #ifdef HAS_AUXV in
-trampoline_arm.c and trampoline_ppc.c.
-Indeed, auxv is not available on some toolchains such as uclibc
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: merged (https://github.com/aircrack-ng/aircrack-ng/pull/1896)]
----
- src/trampoline_arm.c | 4 ++++
- src/trampoline_ppc.c | 4 ++++
- 2 files changed, 8 insertions(+)
-
-diff --git a/src/trampoline_arm.c b/src/trampoline_arm.c
-index 45db82db..e653109a 100644
---- a/src/trampoline_arm.c
-+++ b/src/trampoline_arm.c
-@@ -17,8 +17,10 @@
-  */
- 
- #if defined(__arm__) || defined(__aarch64__)
-+#ifdef HAS_AUXV
- #include <sys/auxv.h>
- #include <asm/hwcap.h>
-+#endif
- #else
- #error "The wrong CPU architecture file has been included."
- #endif
-@@ -39,6 +41,7 @@ int
- simd_get_supported_features (void)
- {
-   int result = 0;
-+#ifdef HAS_AUXV
-   long hwcaps = getauxval (AT_HWCAP);
- 
- #if defined(HWCAP_ASIMD)
-@@ -53,6 +56,7 @@ simd_get_supported_features (void)
-   {
-     result |= SIMD_SUPPORTS_NEON;
-   }
-+#endif
- #endif
- 
-   return (result);
-diff --git a/src/trampoline_ppc.c b/src/trampoline_ppc.c
-index 0d439776..b5c0cb2b 100644
---- a/src/trampoline_ppc.c
-+++ b/src/trampoline_ppc.c
-@@ -17,8 +17,10 @@
-  */
- 
- #if defined(__ppc__) || defined(__PPC__)
-+#ifdef HAS_AUXV
- #include <sys/auxv.h>
- #include <bits/hwcap.h>
-+#endif
- #else
- #error "The wrong CPU architecture file has been included."
- #endif
-@@ -39,6 +41,7 @@ int
- simd_get_supported_features (void)
- {
-   int result = 0;
-+#ifdef HAS_AUXV
-   long hwcaps = getauxval (AT_HWCAP2);
- 
- #if defined(PPC_FEATURE2_ARCH_2_07)
-@@ -46,6 +49,7 @@ simd_get_supported_features (void)
-   {
-     result |= SIMD_SUPPORTS_POWER8;
-   }
-+#endif
- #endif
- 
-   return (result);
--- 
-2.14.1
-
diff --git a/package/aircrack-ng/0002-autotools-The-flag-without-opt-should-skip-stack-protector.patch b/package/aircrack-ng/0002-autotools-The-flag-without-opt-should-skip-stack-protector.patch
deleted file mode 100644
index 8563c78d33..0000000000
--- a/package/aircrack-ng/0002-autotools-The-flag-without-opt-should-skip-stack-protector.patch
+++ /dev/null
@@ -1,52 +0,0 @@
-From 58fe40daf3e082d9e63d689d795a3bbecf72fedb Mon Sep 17 00:00:00 2001
-From: Joseph Benden <joe@benden.us>
-Date: Mon, 16 Apr 2018 11:26:23 -0700
-Subject: [PATCH] autotools: The flag --without-opt should skip stack protector
- flags. (#1864)
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Retrieved from upstream: https://github.com/aircrack-ng/aircrack-ng/commit/58fe40daf3e082d9e63d689d795a3bbecf72fedb]
----
- build/m4/aircrack_ng_compiler.m4 | 28 ++++++++++++++++------------
- 1 file changed, 16 insertions(+), 12 deletions(-)
-
-diff --git a/build/m4/aircrack_ng_compiler.m4 b/build/m4/aircrack_ng_compiler.m4
-index 0fb19726..8a973dbf 100644
---- a/build/m4/aircrack_ng_compiler.m4
-+++ b/build/m4/aircrack_ng_compiler.m4
-@@ -108,19 +108,23 @@ case "$ax_cv_[]_AC_LANG_ABBREV[]_compiler_vendor" in
-             CYGWIN*|MSYS*|cygwin*|msys*)
-                 ;;
-             *)
--                AS_IF([test "x$gcc_over49" = "xno"], [
--                    AS_IF([test "x$gcc_over41" = "xyes"], [
--                        AX_CHECK_COMPILE_FLAG([-fstack-protector], [
--                            AX_APPEND_FLAG(-fstack-protector, [opt_[]_AC_LANG_ABBREV[]flags])
--                        ])
--                    ], [])
--                ], [])
-+                case $with_opt in
-+                    yes | "")
-+                        AS_IF([test "x$gcc_over49" = "xno"], [
-+                            AS_IF([test "x$gcc_over41" = "xyes"], [
-+                                AX_CHECK_COMPILE_FLAG([-fstack-protector], [
-+                                    AX_APPEND_FLAG(-fstack-protector, [opt_[]_AC_LANG_ABBREV[]flags])
-+                                ])
-+                            ], [])
-+                        ], [])
- 
--                AS_IF([test "x$gcc_over49" = "xyes"], [
--                    AX_CHECK_COMPILE_FLAG([-fstack-protector-strong], [
--                        AX_APPEND_FLAG(-fstack-protector-strong, [opt_[]_AC_LANG_ABBREV[]flags])
--                    ])
--                ], [])
-+                        AS_IF([test "x$gcc_over49" = "xyes"], [
-+                            AX_CHECK_COMPILE_FLAG([-fstack-protector-strong], [
-+                                AX_APPEND_FLAG(-fstack-protector-strong, [opt_[]_AC_LANG_ABBREV[]flags])
-+                            ])
-+                        ], [])
-+                        ;;
-+                esac
-                 ;;
-         esac
-         ;;
diff --git a/package/aircrack-ng/0003-Autoconf-Added-NEON-intrinsic-support.patch b/package/aircrack-ng/0003-Autoconf-Added-NEON-intrinsic-support.patch
deleted file mode 100644
index 59c7ade4e9..0000000000
--- a/package/aircrack-ng/0003-Autoconf-Added-NEON-intrinsic-support.patch
+++ /dev/null
@@ -1,64 +0,0 @@
-From 149929109eab1f79c4b90aa423f6d6eb4ee0e882 Mon Sep 17 00:00:00 2001
-From: Joseph Benden <joe@benden.us>
-Date: Tue, 8 May 2018 11:49:22 -0700
-Subject: [PATCH] Autoconf: Added NEON intrinsic support. (#1879, #1872)
-
-Perform NEON intrinsic support using Autoconf, instead of failing to build on older ARM processors without NEON features.
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Retrieved from upstream: https://github.com/aircrack-ng/aircrack-ng/commit/149929109eab1f79c4b90aa423f6d6eb4ee0e882]
----
- build/m4/aircrack_ng_simd.m4 | 16 ++++++++++++++++
- src/Makefile.am              |  2 ++
- 2 files changed, 18 insertions(+)
-
-diff --git a/build/m4/aircrack_ng_simd.m4 b/build/m4/aircrack_ng_simd.m4
-index 9d13031e..74135f32 100644
---- a/build/m4/aircrack_ng_simd.m4
-+++ b/build/m4/aircrack_ng_simd.m4
-@@ -95,6 +95,21 @@ then
-         AX_APPEND_FLAG(-mfpu=neon, [arm_neon_[]_AC_LANG_ABBREV[]flags])
-         AC_SUBST(arm_neon_[]_AC_LANG_ABBREV[]flags)
-     ])
-+
-+    AS_VAR_PUSHDEF([CACHEVAR], [ax_cv_neon_[]_AC_LANG_ABBREV[]flags])
-+    AC_CACHE_CHECK([whether _AC_LANG compiler supports NEON instructions], CACHEVAR, [
-+        ax_check_save_flags=$[]_AC_LANG_PREFIX[]FLAGS
-+        _AC_LANG_PREFIX[]FLAGS="$[]_AC_LANG_PREFIX[]FLAGS $arm_neon_[]_AC_LANG_ABBREV[]flags"
-+        AC_COMPILE_IFELSE([AC_LANG_SOURCE([[
-+#if !defined(__ARM_NEON) && !defined(__ARM_NEON__) && !defined(__aarch64) && !defined(__aarch64__)
-+#error macro not defined
-+#endif
-+        ]])], [AS_VAR_SET(CACHEVAR,[yes])], [AS_VAR_SET(CACHEVAR,[no])])
-+        _AC_LANG_PREFIX[]FLAGS=$ax_check_save_flags
-+    ])
-+    AS_IF([test x"AS_VAR_GET(CACHEVAR)" = xyes],
-+        [NEON_FOUND=1], [NEON_FOUND=0])
-+    AS_VAR_POPDEF([CACHEVAR])
- fi
- 
- if test $IS_PPC -eq 1
-@@ -185,6 +200,7 @@ fi
- AM_CONDITIONAL([X86], [test "$IS_X86" = 1])
- AM_CONDITIONAL([ARM], [test "$IS_ARM" = 1])
- AM_CONDITIONAL([PPC], [test "$IS_PPC" = 1])
-+AM_CONDITIONAL([NEON], [test "$NEON_FOUND" = 1])
- ])
- 
- AC_DEFUN([AIRCRACK_NG_SIMD_C], [
-diff --git a/src/Makefile.am b/src/Makefile.am
-index 3cc8ebdc..beac9dce 100644
---- a/src/Makefile.am
-+++ b/src/Makefile.am
-@@ -116,9 +116,11 @@ endif
- pkglibexec_PROGRAMS = aircrack-ng--generic
- 
- if ARM
-+if NEON
- pkglibexec_PROGRAMS += aircrack-ng--neon \
-                        aircrack-ng--asimd
- endif
-+endif
- 
- if PPC
- pkglibexec_PROGRAMS += aircrack-ng--altivec \
diff --git a/package/aircrack-ng/0004-Fixed-compilation-with-gcrypt-on-some-platforms.patch b/package/aircrack-ng/0004-Fixed-compilation-with-gcrypt-on-some-platforms.patch
deleted file mode 100644
index b32f29f800..0000000000
--- a/package/aircrack-ng/0004-Fixed-compilation-with-gcrypt-on-some-platforms.patch
+++ /dev/null
@@ -1,53 +0,0 @@
-From 208c0d4810f24e03b4def637ebe130f8777ef3e1 Mon Sep 17 00:00:00 2001
-From: Mister X <3520734+Mister-X-@users.noreply.github.com>
-Date: Sat, 5 May 2018 00:28:30 +0000
-Subject: [PATCH] Fixed compilation with gcrypt on some platforms.
-
-Retrieved from upstream: https://github.com/aircrack-ng/aircrack-ng/commit/208c0d4810f24e03b4def637ebe130f8777ef3e1
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- src/gcrypt-openssl-wrapper.h | 13 +++++++++++++
- src/md5.h                    |  6 +++++-
- 2 files changed, 18 insertions(+), 1 deletion(-)
-
-diff --git a/src/gcrypt-openssl-wrapper.h b/src/gcrypt-openssl-wrapper.h
-index 79a0376e..db3e0462 100644
---- a/src/gcrypt-openssl-wrapper.h
-+++ b/src/gcrypt-openssl-wrapper.h
-@@ -82,5 +82,18 @@
-                                                                 gcry_md_get_algo_dlen (algo));  \
-                                                             gcry_md_close(mdh); \
-                                                         } while (0)
-+// MD5
-+#define MD5_CTX                                         gcry_md_hd_t
-+#define MD5_Init(ctx)                                   gcry_md_open(ctx, GCRY_MD_MD5, 0)
-+#define MD5_Update(ctx, data, len)                      gcry_md_write(*ctx, data, len)
-+    // HMAC_Update(ctx, data, len)
-+#define MD5_Final(ctx, md)                              do  { \
-+                                                            memcpy(   md,  \
-+                                                                gcry_md_read(*(gcry_md_hd_t*)ctx, GCRY_MD_MD5), \
-+                                                                gcry_md_get_algo_dlen(gcry_md_get_algo(*(gcry_md_hd_t*)ctx)) \
-+                                                            ); \
-+                                                            gcry_md_close(*(gcry_md_hd_t*)ctx); \
-+                                                        } while (0)
-+
- // http://tumblr.spantz.org/post/214737529/the-use-of-do-while-0-in-c-macros
- #endif // _GCRYPT_OPENSSL_WRAPPER_H
-diff --git a/src/md5.h b/src/md5.h
-index e9edeb81..d8d3d6b3 100644
---- a/src/md5.h
-+++ b/src/md5.h
-@@ -61,7 +61,11 @@ typedef unsigned int MD5_u32plus;
- 
- #include "arch.h"
- #ifdef SIMD_PARA_MD5
--#include <openssl/md5.h>
-+    #ifndef USE_GCRYPT
-+        #include <openssl/md5.h>
-+    #else
-+        #include "gcrypt-openssl-wrapper.h"
-+    #endif
- #endif
- 
- #endif /* _MD5_H */
diff --git a/package/aircrack-ng/aircrack-ng.hash b/package/aircrack-ng/aircrack-ng.hash
index a5fbbcfd31..7c5fe9f0de 100644
--- a/package/aircrack-ng/aircrack-ng.hash
+++ b/package/aircrack-ng/aircrack-ng.hash
@@ -1,6 +1,6 @@
 # From http://www.aircrack-ng.org/downloads.html
-sha1 ccc7a44ad2243c66b9a45fe133514485a72d674f aircrack-ng-1.2.tar.gz
-md5 bb11ec14e1fe505d8d0d51cee0c54df9 aircrack-ng-1.2.tar.gz
+sha1 245464585dfd24622807a8f868d62d9d00f6a22c aircrack-ng-1.3.tar.gz
+md5 c7c5b076dee0c25ee580b0f56f455623 aircrack-ng-1.3.tar.gz
 
 # Hash for license file:
 sha256 e6d6a009505e345fe949e1310334fcb0747f28dae2856759de102ab66b722cb4 LICENSE
diff --git a/package/aircrack-ng/aircrack-ng.mk b/package/aircrack-ng/aircrack-ng.mk
index fe0f504ed1..f338121a48 100644
--- a/package/aircrack-ng/aircrack-ng.mk
+++ b/package/aircrack-ng/aircrack-ng.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-AIRCRACK_NG_VERSION = 1.2
+AIRCRACK_NG_VERSION = 1.3
 AIRCRACK_NG_SITE = http://download.aircrack-ng.org
 AIRCRACK_NG_LICENSE = GPL-2.0+
 AIRCRACK_NG_LICENSE_FILES = LICENSE
@@ -31,6 +31,13 @@ else
 AIRCRACK_NG_CONF_OPTS += --without-duma
 endif
 
+ifeq ($(BR2_PACKAGE_JEMALLOC),y)
+AIRCRACK_NG_DEPENDENCIES += jemalloc
+AIRCRACK_NG_CONF_OPTS += --with-jemalloc
+else
+AIRCRACK_NG_CONF_OPTS += --without-jemalloc
+endif
+
 ifeq ($(BR2_PACKAGE_LIBGCRYPT),y)
 AIRCRACK_NG_DEPENDENCIES += libgcrypt
 AIRCRACK_NG_CONF_OPTS += \
-- 
2.11.0
