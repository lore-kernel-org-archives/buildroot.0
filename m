From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 16 Jun 2018 10:41:49 +0200
Subject: [Buildroot] [PATCH 1/1] package/{mesa3d,
 mesa3d-headers}: bump version to 18.1.2
Message-ID: <20180616084149.626-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Removed patch 0003, applied upstream:
https://cgit.freedesktop.org/mesa/mesa/commit/?h=18.1&id=f9500edb96b7b50a6ab29ebf694610f0112d741f

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/mesa3d-headers/mesa3d-headers.mk      |   2 +-
 ...03-configure.ac-rework-latomic-check.patch | 124 ------------------
 package/mesa3d/mesa3d.hash                    |  10 +-
 package/mesa3d/mesa3d.mk                      |   2 +-
 4 files changed, 7 insertions(+), 131 deletions(-)
 delete mode 100644 package/mesa3d/0003-configure.ac-rework-latomic-check.patch

diff --git a/package/mesa3d-headers/mesa3d-headers.mk b/package/mesa3d-headers/mesa3d-headers.mk
index 1ce30f7dcf..846091eb57 100644
--- a/package/mesa3d-headers/mesa3d-headers.mk
+++ b/package/mesa3d-headers/mesa3d-headers.mk
@@ -12,7 +12,7 @@ endif
 
 # Not possible to directly refer to mesa3d variables, because of
 # first/second expansion trickery...
-MESA3D_HEADERS_VERSION = 18.1.1
+MESA3D_HEADERS_VERSION = 18.1.2
 MESA3D_HEADERS_SOURCE = mesa-$(MESA3D_HEADERS_VERSION).tar.xz
 MESA3D_HEADERS_SITE = https://mesa.freedesktop.org/archive
 MESA3D_HEADERS_DL_SUBDIR = mesa3d
diff --git a/package/mesa3d/0003-configure.ac-rework-latomic-check.patch b/package/mesa3d/0003-configure.ac-rework-latomic-check.patch
deleted file mode 100644
index ee8107d2ad..0000000000
--- a/package/mesa3d/0003-configure.ac-rework-latomic-check.patch
+++ /dev/null
@@ -1,124 +0,0 @@
-From 5865c7cb4e4ed1d63699e384ea52984448adfec9 Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
-Date: Mon, 7 May 2018 10:36:10 +0200
-Subject: [PATCH] configure.ac: rework -latomic check
-
-The configure.ac logic added in commit
-2ef7f23820a67e958c2252bd81eb0458903ebf33 ("configure: check if
--latomic is needed for __atomic_*") makes the assumption that if a
-64-bit atomic intrinsic test program fails to link without -latomic,
-it is because we must use -latomic.
-
-Unfortunately, this is not completely correct: libatomic only appeared
-in gcc 4.8, and therefore gcc versions before that will not have
-libatomic, and therefore don't provide atomic intrinsics for all
-architectures. This issue was for example encountered on PowerPC with
-a gcc 4.7 toolchain, where the build fails with:
-
-powerpc-ctng_e500v2-linux-gnuspe/bin/ld: cannot find -latomic
-
-This commit aims at fixing that, by not assuming -latomic is
-available. The commit re-organizes the atomic intrinsics detection as
-follows:
-
- (1) Test if a program using 64-bit atomic intrinsics links properly,
-     without -latomic. If this is the case, we have atomic intrinsics,
-     and we're good to go.
-
- (2) If (1) has failed, then test to link the same program, but this
-     time with -latomic in LDFLAGS. If this is the case, then we have
-     atomic intrinsics, provided we link with -latomic.
-
-This has been tested in three situations:
-
- - On x86-64, where atomic instrinsics are all built-in, with no need
-   for libatomic. In this case, config.log contains:
-
-   GCC_ATOMIC_BUILTINS_SUPPORTED_FALSE='#'
-   GCC_ATOMIC_BUILTINS_SUPPORTED_TRUE=''
-   LIBATOMIC_LIBS=''
-
-   This means: atomic intrinsics are available, and we don't need to
-   link with libatomic.
-
- - On NIOS2, where atomic intrinsics are available, but some of them
-   (64-bit ones) require using libatomic. In this case, config.log
-   contains:
-
-   GCC_ATOMIC_BUILTINS_SUPPORTED_FALSE='#'
-   GCC_ATOMIC_BUILTINS_SUPPORTED_TRUE=''
-   LIBATOMIC_LIBS='-latomic'
-
-   This means: atomic intrinsics are available, and we need to link
-   with libatomic.
-
- - On PowerPC with an old gcc 4.7 toolchain, where 32-bit atomic
-   instrinsics are available, but not 64-bit atomic instrinsics, and
-   there is no libatomic. In this case, config.log contains:
-
-   GCC_ATOMIC_BUILTINS_SUPPORTED_FALSE=''
-   GCC_ATOMIC_BUILTINS_SUPPORTED_TRUE='#'
-
-   With means that atomic intrinsics are not usable.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
-Upstream-status: https://lists.freedesktop.org/archives/mesa-dev/2018-May/194214.html
----
- configure.ac | 37 +++++++++++++++++++++----------------
- 1 file changed, 21 insertions(+), 16 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index f1fbdcc6c7..c94e547874 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -433,26 +433,31 @@ fi
- AM_CONDITIONAL([SSE41_SUPPORTED], [test x$SSE41_SUPPORTED = x1])
- AC_SUBST([SSE41_CFLAGS], $SSE41_CFLAGS)
- 
--dnl Check for new-style atomic builtins
--AC_COMPILE_IFELSE([AC_LANG_SOURCE([[
-+dnl Check for new-style atomic builtins. We first check without linking to
-+dnl -latomic.
-+AC_LINK_IFELSE([AC_LANG_SOURCE([[
-+#include <stdint.h>
- int main() {
--    int n;
--    return __atomic_load_n(&n, __ATOMIC_ACQUIRE);
-+    uint64_t n;
-+    return (int)__atomic_load_n(&n, __ATOMIC_ACQUIRE);
- }]])], GCC_ATOMIC_BUILTINS_SUPPORTED=1)
-+
-+dnl If that didn't work, we try linking with -latomic, which is needed on some
-+dnl platforms.
-+if test "x$GCC_ATOMIC_BUILTINS_SUPPORTED" != x1; then
-+   save_LDFLAGS=$LDFLAGS
-+   LDFLAGS="$LDFLAGS -latomic"
-+   AC_LINK_IFELSE([AC_LANG_SOURCE([[
-+   #include <stdint.h>
-+   int main() {
-+        uint64_t n;
-+        return (int)__atomic_load_n(&n, __ATOMIC_ACQUIRE);
-+   }]])], GCC_ATOMIC_BUILTINS_SUPPORTED=1 LIBATOMIC_LIBS="-latomic")
-+   LDFLAGS=$save_LDFLAGS
-+fi
-+
- if test "x$GCC_ATOMIC_BUILTINS_SUPPORTED" = x1; then
-     DEFINES="$DEFINES -DUSE_GCC_ATOMIC_BUILTINS"
--    dnl On some platforms, new-style atomics need a helper library
--    AC_MSG_CHECKING(whether -latomic is needed)
--    AC_LINK_IFELSE([AC_LANG_SOURCE([[
--    #include <stdint.h>
--    uint64_t v;
--    int main() {
--        return (int)__atomic_load_n(&v, __ATOMIC_ACQUIRE);
--    }]])], GCC_ATOMIC_BUILTINS_NEED_LIBATOMIC=no, GCC_ATOMIC_BUILTINS_NEED_LIBATOMIC=yes)
--    AC_MSG_RESULT($GCC_ATOMIC_BUILTINS_NEED_LIBATOMIC)
--    if test "x$GCC_ATOMIC_BUILTINS_NEED_LIBATOMIC" = xyes; then
--        LIBATOMIC_LIBS="-latomic"
--    fi
- fi
- AC_SUBST([LIBATOMIC_LIBS])
- 
--- 
-2.14.3
-
diff --git a/package/mesa3d/mesa3d.hash b/package/mesa3d/mesa3d.hash
index d8c7105fe7..77b3eb1c67 100644
--- a/package/mesa3d/mesa3d.hash
+++ b/package/mesa3d/mesa3d.hash
@@ -1,8 +1,8 @@
-# From https://lists.freedesktop.org/archives/mesa-dev/2018-June/196523.html
-md5 063468c930ff61d211ece0191874fa95  mesa-18.1.1.tar.xz
-sha1 60d6b58f8f119b3731de587bdad30c1ecbb52678  mesa-18.1.1.tar.xz
-sha256 d3312a2ede5aac14a47476b208b8e3a401367838330197c4588ab8ad420d7781  mesa-18.1.1.tar.xz
-sha512 7783adc1ec7a1c3d092acfcca6b4ba19450c15a7f0d7f41fbf25e482236615d79ce24afe60959066ea7aa851df4f74fa3c569fa6d847ea79e6bfe046b8c65e90  mesa-18.1.1.tar.xz
+# From https://lists.freedesktop.org/archives/mesa-announce/2018-June/000437.html
+md5 a2d4f031eb6bd6111d44d84004476918  mesa-18.1.2.tar.xz
+sha1 938d22b966e9861a5387d31c44cd4753931d3076  mesa-18.1.2.tar.xz
+sha256 070bf0648ba5b242d7303ceed32aed80842f4c0ba16e5acc1a650a46eadfb1f9  mesa-18.1.2.tar.xz
+sha512 1b896ecc42c2f81813d551a2b14d271d274a948fa10bf5b7a567417690316c2ab7e7fdd52fe004732cd1a47661ba91acf7d5b21e3b3f28e21b50aadbfa96a5d5  mesa-18.1.2.tar.xz
 # License
 sha256 630e75b4fdeb75ee2bf9e55db54dd1e3ff7353d52d9314ca8512bfd460f8e24c  docs/license.html
 sha256 3a0cf6c7835f98f86d5579b2cc517f84254da7411f764fb0095a383fb0759771  docs/patents.txt
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index a323747e61..6e1e27f62f 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # When updating the version, please also update mesa3d-headers
-MESA3D_VERSION = 18.1.1
+MESA3D_VERSION = 18.1.2
 MESA3D_SOURCE = mesa-$(MESA3D_VERSION).tar.xz
 MESA3D_SITE = https://mesa.freedesktop.org/archive
 MESA3D_LICENSE = MIT, SGI, Khronos
-- 
2.17.1
