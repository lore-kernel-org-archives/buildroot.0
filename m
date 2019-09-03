From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 03 Sep 2019 13:40:46 -0000
Subject: [Buildroot] [git commit] package/gauche: bump to version 0.9.8
Message-ID: <20190903133621.38E248A5E7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=73e836e1398293abc1ec2b4297e1e680d2b29e32
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Remove second, third and fourth patches (already in version)
- Update first patch and sent it upstream
- Add AUTORECONF=YES to avoid patching configure in first patch
- Add hash for license file

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gauche/0001-fix-so-suffix.patch            | 43 +++++++--------
 ...ac-add-check-for-NO_GETCONTEXT-definition.patch | 62 ----------------------
 ...-libc-version.h-build-error-uClibc-x86-_6.patch | 46 ----------------
 package/gauche/0004-rfc-needs-srfi.patch           | 35 ------------
 package/gauche/gauche.hash                         |  7 +--
 package/gauche/gauche.mk                           |  4 +-
 6 files changed, 29 insertions(+), 168 deletions(-)

diff --git a/package/gauche/0001-fix-so-suffix.patch b/package/gauche/0001-fix-so-suffix.patch
index b65e269981..8a0937681c 100644
--- a/package/gauche/0001-fix-so-suffix.patch
+++ b/package/gauche/0001-fix-so-suffix.patch
@@ -1,31 +1,32 @@
+From cefd57f76f7faec4143bf1e42ed148cad973c1f4 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Mon, 12 Aug 2019 23:17:21 +0200
+Subject: [PATCH] configure.ac: fix so suffix
+
 With uclibc or musl configuration, $host does not match to '*-linux-gnu*'.
-I touch configure directly instead of configure.ac because autoreconf
-failed by version mismatch of autotools.
 
 Signed-off-by: Hiroshi Kawashima <kei-k@ca2.so-net.ne.jp>
+[Retrieved (and slightly updated) from:
+https://git.buildroot.net/buildroot/tree/package/gauche/0001-fix-so-suffix.patch]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/shirok/Gauche/pull/508]
+---
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
 
-diff -ur a/configure b/configure
---- a/configure	2014-07-20 15:15:05.000000000 +0900
-+++ b/configure	2015-10-20 21:52:32.791442291 +0900
-@@ -6843,7 +6843,7 @@
+diff --git a/configure.ac b/configure.ac
+index 15092a2d6..b82b762a9 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -641,7 +641,7 @@ AS_CASE([$host],
      SHLIB_MAIN_LDFLAGS=""
      SHLIB_OK=ok
-     ;;
--  *-linux-gnu*|*-*-gnu*|*freebsd*|*dragonfly*)
-+  *-linux-*|*-*-gnu*|*freebsd*|*dragonfly*)
+     ],
+-  [*-linux-gnu*|*-*-gnu*|*freebsd*|*dragonfly*], [
++  [*-linux-*|*-*-gnu*|*freebsd*|*dragonfly*], [
      SHLIB_SO_CFLAGS="-fPIC"
      SHLIB_SO_LDFLAGS="$rpath -shared -o"
      SHLIB_SO_SUFFIX="so"
+-- 
+2.20.1
 
-diff -ur a/configure.ac b/configure.ac
---- a/configure.ac	2015-10-21 21:33:17.370000200 +0900
-+++ b/configure.ac	2015-10-21 21:33:39.784110527 +0900
-@@ -572,7 +572,7 @@
-     SHLIB_MAIN_LDFLAGS=""
-     SHLIB_OK=ok
-     ;;
--  *-linux-gnu*|*-*-gnu*|*freebsd*|*dragonfly*)
-+  *-linux-*|*-*-gnu*|*freebsd*|*dragonfly*)
-     SHLIB_SO_CFLAGS="-fPIC"
-     SHLIB_SO_LDFLAGS="$rpath -shared -o"
-     SHLIB_SO_SUFFIX="so"
diff --git a/package/gauche/0002-gc-configure.ac-add-check-for-NO_GETCONTEXT-definition.patch b/package/gauche/0002-gc-configure.ac-add-check-for-NO_GETCONTEXT-definition.patch
deleted file mode 100644
index 6cc065693f..0000000000
--- a/package/gauche/0002-gc-configure.ac-add-check-for-NO_GETCONTEXT-definition.patch
+++ /dev/null
@@ -1,62 +0,0 @@
-gc/configure.ac: add check for NO_GETCONTEXT definition
-
-This patch is ported from bdwgc package. Since Gauche uses an internal
-copy of the boehm gc code, it is affected by the same problem.
-
-Both configure and configure.ac are modified because autoreconf fails
-due to an incompatibility with the version of the autotools used by
-Buildroot.
-
-Signed-off-by: Hiroshi Kawashima <kei-k@ca2.so-net.ne.jp>
-
-Original credits of patch in bdwgc package:
-Signed-off-by: Samuel Martin <s.martin49@gmail.com>
-[yann.morin.1998 at free.fr: add a comment, change variable name, use
- AS_IF, remove debug traces, use AC_CHECK_FUNCS (as suggested by
- Thomas)]
-Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
-Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-
-diff -ur a/gc/configure b/gc/configure
---- a/gc/configure	2015-11-12 21:41:02.394822056 +0900
-+++ b/gc/configure	2015-11-12 22:04:14.655157423 +0900
-@@ -16153,6 +16153,23 @@
- $as_echo "$ac_cv_fno_strict_aliasing" >&6; }
- fi
- 
-+# Check for getcontext (uClibc can be configured without it, for example)
-+for ac_func in getcontext
-+do :
-+  ac_fn_c_check_func "$LINENO" "getcontext" "ac_cv_func_getcontext"
-+if test "x$ac_cv_func_getcontext" = xyes; then :
-+  cat >>confdefs.h <<_ACEOF
-+#define HAVE_GETCONTEXT 1
-+_ACEOF
-+
-+fi
-+done
-+
-+if test "$ac_cv_func_getcontext" = "no"; then :
-+  CFLAGS="$CFLAGS -DNO_GETCONTEXT"
-+   CPPFLAGS="$CPPFLAGS -DNO_GETCONTEXT"
-+fi
-+
- case "$host" in
- # While IRIX 6 has libdl for the O32 and N32 ABIs, it's missing for N64
- # and unnecessary everywhere.
-diff -ur a/gc/configure.ac b/gc/configure.ac
---- a/gc/configure.ac	2015-11-12 22:31:44.851510997 +0900
-+++ b/gc/configure.ac	2015-11-12 22:33:39.292191227 +0900
-@@ -459,6 +459,12 @@
-   AC_MSG_RESULT($ac_cv_fno_strict_aliasing)
- fi
- 
-+# Check for getcontext (uClibc can be configured without it, for example)
-+AC_CHECK_FUNCS([getcontext])
-+AS_IF([test "$ac_cv_func_getcontext" = "no"],
-+  [CFLAGS="$CFLAGS -DNO_GETCONTEXT"
-+   CPPFLAGS="$CPPFLAGS -DNO_GETCONTEXT"])
-+
- case "$host" in
- # While IRIX 6 has libdl for the O32 and N32 ABIs, it's missing for N64
- # and unnecessary everywhere.
diff --git a/package/gauche/0003-Fix-missing-libc-version.h-build-error-uClibc-x86-_6.patch b/package/gauche/0003-Fix-missing-libc-version.h-build-error-uClibc-x86-_6.patch
deleted file mode 100644
index 61a3f1aadb..0000000000
--- a/package/gauche/0003-Fix-missing-libc-version.h-build-error-uClibc-x86-_6.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From 4b9692c93d658015087f19016b2bd0c9dfbccee6 Mon Sep 17 00:00:00 2001
-From: Bernd Kuhls <bernd.kuhls@t-online.de>
-Date: Sun, 28 May 2017 20:21:09 +0200
-Subject: [PATCH] Fix 'missing libc-version.h' build error (uClibc/x86[_64])
- (fix commit 3d34255)
-
-uClibc defines __GLIBC__ but does not contain libc-version.h file.
-
-* include/private/gcconfig.h [(I386 || X86_64) && LINUX && __GLIBC__]
-(GLIBC_2_19_TSX_BUG): Do not define (and do not include
-gnu/libc-version.h) if __UCLIBC__.
-
-[baruch: cherry pick from upstream bdwgc commit 047230b71d42140]
-Signed-off-by: Baruch Siach <baruch@tkos.co.il>
----
-Upstream status: patch applied to bdwgc; will propagate to gauche on the next
-synch of its bundled bdwgc
-
- gc/include/private/gcconfig.h | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/gc/include/private/gcconfig.h b/gc/include/private/gcconfig.h
-index 80920e5af570..f063664c3f52 100644
---- a/gc/include/private/gcconfig.h
-+++ b/gc/include/private/gcconfig.h
-@@ -1420,7 +1420,7 @@
- #         define GC_PREFETCH_FOR_WRITE(x) \
-             __asm__ __volatile__ ("prefetchw %0" : : "m"(*(char *)(x)))
- #       endif
--#       if defined(__GLIBC__)
-+#       if defined(__GLIBC__) && !defined(__UCLIBC__)
-           /* Workaround lock elision implementation for some glibc.     */
- #         define GLIBC_2_19_TSX_BUG
- #         include <gnu/libc-version.h> /* for gnu_get_libc_version() */
-@@ -2431,7 +2431,7 @@
-           /* FIXME: This seems to be fixed in GLibc v2.14.              */
- #         define GETCONTEXT_FPU_EXCMASK_BUG
- #       endif
--#       if defined(__GLIBC__)
-+#       if defined(__GLIBC__) && !defined(__UCLIBC__)
-           /* Workaround lock elision implementation for some glibc.     */
- #         define GLIBC_2_19_TSX_BUG
- #         include <gnu/libc-version.h> /* for gnu_get_libc_version() */
--- 
-2.11.0
-
diff --git a/package/gauche/0004-rfc-needs-srfi.patch b/package/gauche/0004-rfc-needs-srfi.patch
deleted file mode 100644
index 8b83b7872b..0000000000
--- a/package/gauche/0004-rfc-needs-srfi.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 33ba5e73ec09f1308f897128334e955debd9ea43 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Wed, 21 Nov 2018 08:58:25 +0100
-Subject: [PATCH] rfc: needs srfi
-
-ext/rfc needs srfi-19 since version 0.9.5 and
-https://github.com/shirok/Gauche/commit/bd22bc82361c5eeb5d3b58c3836236566746bb96
-
-So add a dependency on srfi for rfc target in Makefile.in
-
-Fixes:
- - http://autobuild.buildroot.org/results/f4935e29ce6aaebdaa47d46c56120b7e97145d1b
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/shirok/Gauche/pull/397]
----
- ext/Makefile.in | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/ext/Makefile.in b/ext/Makefile.in
-index 57ddf457e..de8d59a4d 100644
---- a/ext/Makefile.in
-+++ b/ext/Makefile.in
-@@ -54,7 +54,7 @@ bcrypt: mt-random
- 
- dbm : threads
- 
--rfc: gauche util
-+rfc: gauche srfi util
- 
- test : check
- 
--- 
-2.14.1
-
diff --git a/package/gauche/gauche.hash b/package/gauche/gauche.hash
index 8f45ef997b..600c46fbdc 100644
--- a/package/gauche/gauche.hash
+++ b/package/gauche/gauche.hash
@@ -1,5 +1,6 @@
 # From https://sourceforge.net/projects/gauche/files/Gauche/
-sha1 c3e1ea21f3acc66fd26eced117caab3f86531db4  Gauche-0.9.5.tgz
-md5 8bac7cbd99a91f6f2c037ac6988db14d  Gauche-0.9.5.tgz
+sha1 ff7878ab19c56b49b4b6d77009300a3592cc903c  Gauche-0.9.8.tgz
+md5 efd1b12cd5708d9e1e4358ab2d2e1e32  Gauche-0.9.8.tgz
 # Locally calculated
-sha256 4c8a53213de112708bbda5fa9648c21497d43ebf809ed5b32b15f21266b4e73c  Gauche-0.9.5.tgz
+sha256 3eb30d1051d8b48999fe46511c9f6983057735312c9832b7db13f9db140db74b  Gauche-0.9.8.tgz
+sha256 d537f80c0bb3cc203bc2675b766b9de9573243026fa3e8ad78368abd4b14aac8  COPYING
diff --git a/package/gauche/gauche.mk b/package/gauche/gauche.mk
index 0b4185f5bf..1f66e28de7 100644
--- a/package/gauche/gauche.mk
+++ b/package/gauche/gauche.mk
@@ -4,12 +4,14 @@
 #
 ################################################################################
 
-GAUCHE_VERSION = 0.9.5
+GAUCHE_VERSION = 0.9.8
 GAUCHE_SOURCE = Gauche-$(GAUCHE_VERSION).tgz
 GAUCHE_SITE = http://downloads.sourceforge.net/project/gauche/Gauche
 GAUCHE_LICENSE = BSD-3-Clause, Boehm-gc, SRFI (srfi-11.scm), reload (reload.scm)
 GAUCHE_LICENSE_FILES = COPYING
 GAUCHE_DEPENDENCIES = host-gauche
+# We're patching configure.ac
+GAUCHE_AUTORECONF = YES
 
 HOST_GAUCHE_CONF_OPTS = --without-zlib
 GAUCHE_CONF_OPTS = --without-libatomic-ops
