From: Mark Corbin <mark.corbin@embecosm.com>
Date: Thu,  3 Jan 2019 20:09:11 +0000
Subject: [Buildroot] [PATCH 1/1] package/glibc: bump version for more
 post-2.28 fixes
Message-ID: <20190103200911.8779-1-mark.corbin@embecosm.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This update includes two specific fixes that have been backported
to the glibc 2.28 release branch from the glibc master branch:

1) UAPI header file asm/syscalls.h has been merged into the UAPI
asm/unistd.h header file for the RISC-V architecture in the
4.20 kernel. This causes the glibc 2.28 build to break.

2) sysdeps/ieee754/soft-fp: ignore maybe-uninitialized with -O
[BZ #19444]. The current patch for this issue can now be dropped
from Buildroot.

Signed-off-by: Mark Corbin <mark.corbin@embecosm.com>
---
 ...soft-fp-ignore-maybe-uninitialized-w.patch | 88 -------------------
 .../glibc.hash                                |  2 +-
 package/glibc/glibc.mk                        |  2 +-
 3 files changed, 2 insertions(+), 90 deletions(-)
 delete mode 100644 package/glibc/glibc-2.28-50-gb8dd0f42780a3133c02f064a2c0c5c4e7ab61aaa/0001-sysdeps-ieee754-soft-fp-ignore-maybe-uninitialized-w.patch
 rename package/glibc/{glibc-2.28-50-gb8dd0f42780a3133c02f064a2c0c5c4e7ab61aaa => glibc-2.28-69-g1e5c5303a522764d7e9d2302a60e4a32cdb902f1}/glibc.hash (69%)

diff --git a/package/glibc/glibc-2.28-50-gb8dd0f42780a3133c02f064a2c0c5c4e7ab61aaa/0001-sysdeps-ieee754-soft-fp-ignore-maybe-uninitialized-w.patch b/package/glibc/glibc-2.28-50-gb8dd0f42780a3133c02f064a2c0c5c4e7ab61aaa/0001-sysdeps-ieee754-soft-fp-ignore-maybe-uninitialized-w.patch
deleted file mode 100644
index febcd36f79..0000000000
--- a/package/glibc/glibc-2.28-50-gb8dd0f42780a3133c02f064a2c0c5c4e7ab61aaa/0001-sysdeps-ieee754-soft-fp-ignore-maybe-uninitialized-w.patch
+++ /dev/null
@@ -1,88 +0,0 @@
-From 4a06ceea33ecc220bbfe264d8f1e74de2f04e90d Mon Sep 17 00:00:00 2001
-From: Martin Jansa <Martin.Jansa@gmail.com>
-Date: Tue, 2 Oct 2018 15:38:43 +0000
-Subject: [PATCH] sysdeps/ieee754/soft-fp: ignore maybe-uninitialized with -O
- [BZ #19444]
-
-* with -O, -O1, -Os it fails with:
-
-In file included from ../soft-fp/soft-fp.h:318,
-                 from ../sysdeps/ieee754/soft-fp/s_fdiv.c:28:
-../sysdeps/ieee754/soft-fp/s_fdiv.c: In function '__fdiv':
-../soft-fp/op-2.h:98:25: error: 'R_f1' may be used uninitialized in this function [-Werror=maybe-uninitialized]
-        X##_f0 = (X##_f1 << (_FP_W_TYPE_SIZE - (N)) | X##_f0 >> (N) \
-                         ^~
-../sysdeps/ieee754/soft-fp/s_fdiv.c:38:14: note: 'R_f1' was declared here
-   FP_DECL_D (R);
-              ^
-../soft-fp/op-2.h:37:36: note: in definition of macro '_FP_FRAC_DECL_2'
-   _FP_W_TYPE X##_f0 _FP_ZERO_INIT, X##_f1 _FP_ZERO_INIT
-                                    ^
-../soft-fp/double.h:95:24: note: in expansion of macro '_FP_DECL'
- # define FP_DECL_D(X)  _FP_DECL (2, X)
-                        ^~~~~~~~
-../sysdeps/ieee754/soft-fp/s_fdiv.c:38:3: note: in expansion of macro 'FP_DECL_D'
-   FP_DECL_D (R);
-   ^~~~~~~~~
-../soft-fp/op-2.h:101:17: error: 'R_f0' may be used uninitialized in this function [-Werror=maybe-uninitialized]
-       : (X##_f0 << (_FP_W_TYPE_SIZE - (N))) != 0)); \
-                 ^~
-../sysdeps/ieee754/soft-fp/s_fdiv.c:38:14: note: 'R_f0' was declared here
-   FP_DECL_D (R);
-              ^
-../soft-fp/op-2.h:37:14: note: in definition of macro '_FP_FRAC_DECL_2'
-   _FP_W_TYPE X##_f0 _FP_ZERO_INIT, X##_f1 _FP_ZERO_INIT
-              ^
-../soft-fp/double.h:95:24: note: in expansion of macro '_FP_DECL'
- # define FP_DECL_D(X)  _FP_DECL (2, X)
-                        ^~~~~~~~
-../sysdeps/ieee754/soft-fp/s_fdiv.c:38:3: note: in expansion of macro 'FP_DECL_D'
-   FP_DECL_D (R);
-   ^~~~~~~~~
-
-Build tested with Yocto for ARM, AARCH64, X86, X86_64, PPC, MIPS, MIPS64
-with -O, -O1, -Os.
-For AARCH64 it needs one more fix in locale for -Os.
-
-	[BZ #19444]
-	* sysdeps/ieee754/soft-fp/s_fdiv.c: Include <libc-diag.h> and use
-	DIAG_PUSH_NEEDS_COMMENT, DIAG_IGNORE_NEEDS_COMMENT and
-	DIAG_POP_NEEDS_COMMENT to disable -Wmaybe-uninitialized.
-
-
-Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
----
- sysdeps/ieee754/soft-fp/s_fdiv.c | 12 ++++++++++++
- 1 files changed, 12 insertions(+)
-
-diff --git a/sysdeps/ieee754/soft-fp/s_fdiv.c b/sysdeps/ieee754/soft-fp/s_fdiv.c
-index 341339f5ed..7a15cbeee6 100644
---- a/sysdeps/ieee754/soft-fp/s_fdiv.c
-+++ b/sysdeps/ieee754/soft-fp/s_fdiv.c
-@@ -25,6 +25,16 @@
- #undef fdivl
- 
- #include <math-narrow.h>
-+#include <libc-diag.h>
-+
-+/* R_f[01] are not set in cases where they are not used in packing,
-+   but the compiler does not see that they are set in all cases where
-+   they are used, resulting in warnings that they may be used
-+   uninitialized.  The location of the warning differs in different
-+   versions of GCC, it may be where R is defined using a macro or it
-+   may be where the macro is defined.  This happens only with -O1.  */
-+DIAG_PUSH_NEEDS_COMMENT;
-+DIAG_IGNORE_NEEDS_COMMENT (8, "-Wmaybe-uninitialized");
- #include <soft-fp.h>
- #include <single.h>
- #include <double.h>
-@@ -53,4 +63,6 @@ __fdiv (double x, double y)
-   CHECK_NARROW_DIV (ret, x, y);
-   return ret;
- }
-+DIAG_POP_NEEDS_COMMENT;
-+
- libm_alias_float_double (div)
--- 
-2.17.0
-
diff --git a/package/glibc/glibc-2.28-50-gb8dd0f42780a3133c02f064a2c0c5c4e7ab61aaa/glibc.hash b/package/glibc/glibc-2.28-69-g1e5c5303a522764d7e9d2302a60e4a32cdb902f1/glibc.hash
similarity index 69%
rename from package/glibc/glibc-2.28-50-gb8dd0f42780a3133c02f064a2c0c5c4e7ab61aaa/glibc.hash
rename to package/glibc/glibc-2.28-69-g1e5c5303a522764d7e9d2302a60e4a32cdb902f1/glibc.hash
index 7429ab3809..e83b1caf4c 100644
--- a/package/glibc/glibc-2.28-50-gb8dd0f42780a3133c02f064a2c0c5c4e7ab61aaa/glibc.hash
+++ b/package/glibc/glibc-2.28-69-g1e5c5303a522764d7e9d2302a60e4a32cdb902f1/glibc.hash
@@ -1,5 +1,5 @@
 # Locally calculated (fetched from Github)
-sha256  b070f746f932cfce107bb9be2d59ded5b44b25ddafb480c9110c52b88cc2dec1  glibc-glibc-2.28-50-gb8dd0f42780a3133c02f064a2c0c5c4e7ab61aaa.tar.gz
+sha256  ebf04c7b00153d6df8beceec0666d4b13e1ac613b40d5774d1b8c6f61c1686e6  glibc-glibc-2.28-69-g1e5c5303a522764d7e9d2302a60e4a32cdb902f1.tar.gz
 
 # Hashes for license files
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
index 94c7834754..345d257d03 100644
--- a/package/glibc/glibc.mk
+++ b/package/glibc/glibc.mk
@@ -10,7 +10,7 @@ GLIBC_SITE = $(call github,foss-for-synopsys-dwc-arc-processors,glibc,$(GLIBC_VE
 else
 # Generate version string using:
 #   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master
-GLIBC_VERSION = glibc-2.28-50-gb8dd0f42780a3133c02f064a2c0c5c4e7ab61aaa
+GLIBC_VERSION = glibc-2.28-69-g1e5c5303a522764d7e9d2302a60e4a32cdb902f1
 # Upstream doesn't officially provide an https download link.
 # There is one (https://sourceware.org/git/glibc.git) but it's not reliable,
 # sometimes the connection times out. So use an unofficial github mirror.
-- 
2.19.1
