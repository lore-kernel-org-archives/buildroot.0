From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 20 Sep 2019 23:06:13 +0200
Subject: [Buildroot] [git commit] package/bdwgc: bump to version 8.0.4
Message-ID: <20190920210309.2DB888ED11@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=19e0d1140581dce9252860a03537ca11ebae6b73
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Remove patch (already in version)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...k-with-of-bdw-gc-with-a-system-atomic_ops.patch | 57 ----------------------
 package/bdwgc/bdwgc.hash                           |  2 +-
 package/bdwgc/bdwgc.mk                             |  4 +-
 3 files changed, 2 insertions(+), 61 deletions(-)

diff --git a/package/bdwgc/0001-fix-link-with-of-bdw-gc-with-a-system-atomic_ops.patch b/package/bdwgc/0001-fix-link-with-of-bdw-gc-with-a-system-atomic_ops.patch
deleted file mode 100644
index 0d5e6b0905..0000000000
--- a/package/bdwgc/0001-fix-link-with-of-bdw-gc-with-a-system-atomic_ops.patch
+++ /dev/null
@@ -1,57 +0,0 @@
-From b549c7faa9903340b09ef2592a2c7c213a110220 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Mon, 5 Nov 2018 22:50:40 +0100
-Subject: [PATCH] fix link with of bdw-gc with a system atomic_ops
-
-When bdw-gc is linked with libatomic_ops, bdw-gc.pc must contain the
-needed libraries (such as -latomic_ops) otherwise build of applications
-such as guile will fail on link stage:
-
-.libs/libguile_2.0_la-posix.o: In function `scm_tmpnam':
-posix.c:(.text+0x2080): warning: the use of `tmpnam' is dangerous, better use `mkstemp'
-  CCLD     guile
-/home/buildroot/autobuild/run/instance-2/output/host/arm-buildroot-linux-gnueabi/sysroot/usr/lib/libgc.so: undefined reference to `AO_fetch_compare_and_swap_emulation'
-/home/buildroot/autobuild/run/instance-2/output/host/arm-buildroot-linux-gnueabi/sysroot/usr/lib/libgc.so: undefined reference to `AO_store_full_emulation'
-
-So set ATOMIC_OPS_LIBS to -latomic_ops when a system atomic_ops library
-is used and use ATOMIC_OPS_LIBS in bdw-gc.pc.in
-
-Fixes:
- - http://autobuild.buildroot.org/results/2b23d445e57a5e0f417f5cb9417b0a668bb7bf1c
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/ivmai/bdwgc/pull/247]
----
- bdw-gc.pc.in | 2 +-
- configure.ac | 4 +++-
- 2 files changed, 4 insertions(+), 2 deletions(-)
-
-diff --git a/bdw-gc.pc.in b/bdw-gc.pc.in
-index ef4c2341..9fc42465 100644
---- a/bdw-gc.pc.in
-+++ b/bdw-gc.pc.in
-@@ -6,5 +6,5 @@ includedir=@includedir@
- Name: Boehm-Demers-Weiser Conservative Garbage Collector
- Description: A garbage collector for C and C++
- Version: @PACKAGE_VERSION@
--Libs: -L${libdir} -lgc
-+Libs: -L${libdir} -lgc @ATOMIC_OPS_LIBS@
- Cflags: -I${includedir}
-diff --git a/configure.ac b/configure.ac
-index 21abe8fa..9ffe81de 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -1081,7 +1081,9 @@ AS_IF([test x"$with_libatomic_ops" = xno \
- AC_MSG_CHECKING([which libatomic_ops to use])
- AS_IF([test x"$with_libatomic_ops" != xno],
-   [ AS_IF([test x"$with_libatomic_ops" != xnone -a x"$THREADS" != xnone],
--          [ AC_MSG_RESULT([external]) ],
-+          [ AC_MSG_RESULT([external])
-+            ATOMIC_OPS_LIBS="-latomic_ops"
-+            AC_SUBST([ATOMIC_OPS_LIBS]) ],
-           [ AC_MSG_RESULT([none])
-             AS_IF([test x"$THREADS" != xnone],
-                   [ AC_DEFINE([GC_BUILTIN_ATOMIC], [1],
--- 
-2.17.1
-
diff --git a/package/bdwgc/bdwgc.hash b/package/bdwgc/bdwgc.hash
index 6cc4674e62..4d22131964 100644
--- a/package/bdwgc/bdwgc.hash
+++ b/package/bdwgc/bdwgc.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 8f23f9a20883d00af2bff122249807e645bdf386de0de8cbd6cce3e0c6968f04  gc-8.0.0.tar.gz
+sha256 436a0ddc67b1ac0b0405b61a9675bca9e075c8156f4debd1d06f3a56c7cd289d  gc-8.0.4.tar.gz
 sha256 aeeaabbf44e67d413e18719f0c6ac9c23387ab0b33e7a15ee46cf59ddef12cc7  README.QUICK
diff --git a/package/bdwgc/bdwgc.mk b/package/bdwgc/bdwgc.mk
index 3979cd88c8..6ae9627a60 100644
--- a/package/bdwgc/bdwgc.mk
+++ b/package/bdwgc/bdwgc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BDWGC_VERSION = 8.0.0
+BDWGC_VERSION = 8.0.4
 BDWGC_SOURCE = gc-$(BDWGC_VERSION).tar.gz
 BDWGC_SITE = http://www.hboehm.info/gc/gc_source
 BDWGC_INSTALL_STAGING = YES
@@ -12,8 +12,6 @@ BDWGC_LICENSE = bdwgc license
 BDWGC_LICENSE_FILES = README.QUICK
 BDWGC_DEPENDENCIES = libatomic_ops host-pkgconf
 HOST_BDWGC_DEPENDENCIES = host-libatomic_ops host-pkgconf
-# We're patching configure.ac
-BDWGC_AUTORECONF = YES
 
 BDWGC_CONF_OPTS = CFLAGS_EXTRA="$(BDWGC_CFLAGS_EXTRA)"
 ifeq ($(BR2_sparc),y)
