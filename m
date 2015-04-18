From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 18 Apr 2015 15:36:10 +0200
Subject: [Buildroot] [git commit] uclibc: unbreak SH & SPARC
Message-ID: <20150418133713.70CFC80489@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e9fb2788bd448c4aa161b8ed285ca68ebfacb64c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The patch from commit 200aad4f3206c9f151f15922dd02b01f474a5503 broke sh
and sparc builds.
Add and adjust a patch from uClibc master that fixes this.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...-honor-NO_LONG_DOUBLE-in-ldouble_wrappers.patch |   89 ++++++++++++++++++++
 1 files changed, 89 insertions(+), 0 deletions(-)

diff --git a/package/uclibc/0.9.33.2/0070-libm-honor-NO_LONG_DOUBLE-in-ldouble_wrappers.patch b/package/uclibc/0.9.33.2/0070-libm-honor-NO_LONG_DOUBLE-in-ldouble_wrappers.patch
new file mode 100644
index 0000000..1b6ea6d
--- /dev/null
+++ b/package/uclibc/0.9.33.2/0070-libm-honor-NO_LONG_DOUBLE-in-ldouble_wrappers.patch
@@ -0,0 +1,89 @@
+From 730db44f0824f505a31822e250b9f04b9f8e7a1b Mon Sep 17 00:00:00 2001
+From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
+Date: Tue, 24 Mar 2015 00:11:47 +0100
+Subject: [PATCH] libm: honor NO_LONG_DOUBLE in ldouble_wrappers
+
+Fixes SH build breakage due to attempts to define hidden defs for
+unavailable long double functions.
+
+Signed-off-by: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
+[Gustavo: adapt to 0.9.33.2]
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+---
+ extra/Configs/Config.in.arch |  2 +-
+ ldso/ldso/sh/dl-syscalls.h   |  2 +-
+ libm/ldouble_wrappers.c      | 15 +++++++++------
+ 3 files changed, 11 insertions(+), 8 deletions(-)
+
+diff --git a/extra/Configs/Config.in.arch b/extra/Configs/Config.in.arch
+index 68e03bf..0dae84b 100644
+--- a/extra/Configs/Config.in.arch
++++ b/extra/Configs/Config.in.arch
+@@ -191,7 +191,7 @@ config UCLIBC_HAS_FENV
+ config UCLIBC_HAS_LONG_DOUBLE_MATH
+ 	bool "Enable long double support"
+ 	depends on DO_C99_MATH
+-	depends on TARGET_i386 || TARGET_m68k || TARGET_sparc || TARGET_x86_64 || TARGET_powerpc || TARGET_sh || TARGET_microblaze
++	depends on TARGET_aarch64 || TARGET_alpha || TARGET_i386 || TARGET_ia64 || TARGET_m68k || TARGET_powerpc || TARGET_s390 || TARGET_sparc || TARGET_tile || TARGET_x86_64
+ 	default y
+ 	help
+ 	  If you want the uClibc math library to contain the full set of C99
+diff --git a/ldso/ldso/sh/dl-syscalls.h b/ldso/ldso/sh/dl-syscalls.h
+index f9f13c7..b99a9b5 100644
+--- a/ldso/ldso/sh/dl-syscalls.h
++++ b/ldso/ldso/sh/dl-syscalls.h
+@@ -1,4 +1,4 @@
+-#if __GNUC_PREREQ (4, 1)
++#if __GNUC_PREREQ (4, 1) && !__GNUC_PREREQ (4, 9)
+ #warning !!! gcc 4.1 and later have problems with __always_inline so redefined as inline
+ # ifdef __always_inline
+ # undef __always_inline
+diff --git a/libm/ldouble_wrappers.c b/libm/ldouble_wrappers.c
+index b4215cb..840293f 100644
+--- a/libm/ldouble_wrappers.c
++++ b/libm/ldouble_wrappers.c
+@@ -16,27 +16,28 @@
+ #include "math.h"
+ #include <complex.h>
+ 
+-#define WRAPPER1(func) \
++#if !defined __NO_LONG_DOUBLE_MATH
++# define WRAPPER1(func) \
+ long double func##l(long double x) \
+ { \
+ 	return (long double) func((double) x); \
+ }
+-#define WRAPPER2(func) \
++# define WRAPPER2(func) \
+ long double func##l(long double x, long double y) \
+ { \
+ 	return (long double) func((double) x, (double) y); \
+ }
+-#define int_WRAPPER1(func) \
++# define int_WRAPPER1(func) \
+ int func##l(long double x) \
+ { \
+ 	return func((double) x); \
+ }
+-#define long_WRAPPER1(func) \
++# define long_WRAPPER1(func) \
+ long func##l(long double x) \
+ { \
+ 	return func((double) x); \
+ }
+-#define long_long_WRAPPER1(func) \
++# define long_long_WRAPPER1(func) \
+ long long func##l(long double x) \
+ { \
+ 	return func((double) x); \
+@@ -447,4 +448,6 @@ int_WRAPPER1(__isinf)
+ libm_hidden_def(__isinfl)
+ # endif
+ 
+-#endif
++#endif /* __DO_C99_MATH__ */
++
++#endif /* __NO_LONG_DOUBLE_MATH */
+-- 
+2.0.5
+
