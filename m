From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue,  6 Nov 2018 20:27:34 +0100
Subject: [Buildroot] [PATCH 1/1] bdwgc: update bdw-gc.pc to fix link with
 guile
Message-ID: <20181106192735.16800-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When bdw-gc is linked with libatomic_ops, bdw-gc.pc must contain the
needed libraries (such as -latomic_ops) otherwise build of applications
such as guile will fail on link stage:

.libs/libguile_2.0_la-posix.o: In function `scm_tmpnam':
posix.c:(.text+0x2080): warning: the use of `tmpnam' is dangerous, better use `mkstemp'
  CCLD     guile
/home/buildroot/autobuild/run/instance-2/output/host/arm-buildroot-linux-gnueabi/sysroot/usr/lib/libgc.so: undefined reference to `AO_fetch_compare_and_swap_emulation'
/home/buildroot/autobuild/run/instance-2/output/host/arm-buildroot-linux-gnueabi/sysroot/usr/lib/libgc.so: undefined reference to `AO_store_full_emulation'

So set ATOMIC_OPS_LIBS to -latomic_ops when a system atomic_ops library
is used and use ATOMIC_OPS_LIBS in bdw-gc.pc.in

Fixes:
 - http://autobuild.buildroot.org/results/2b23d445e57a5e0f417f5cb9417b0a668bb7bf1c

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...h-of-bdw-gc-with-a-system-atomic_ops.patch | 57 +++++++++++++++++++
 package/bdwgc/bdwgc.mk                        |  2 +
 2 files changed, 59 insertions(+)
 create mode 100644 package/bdwgc/0001-fix-link-with-of-bdw-gc-with-a-system-atomic_ops.patch

diff --git a/package/bdwgc/0001-fix-link-with-of-bdw-gc-with-a-system-atomic_ops.patch b/package/bdwgc/0001-fix-link-with-of-bdw-gc-with-a-system-atomic_ops.patch
new file mode 100644
index 0000000000..0d5e6b0905
--- /dev/null
+++ b/package/bdwgc/0001-fix-link-with-of-bdw-gc-with-a-system-atomic_ops.patch
@@ -0,0 +1,57 @@
+From b549c7faa9903340b09ef2592a2c7c213a110220 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Mon, 5 Nov 2018 22:50:40 +0100
+Subject: [PATCH] fix link with of bdw-gc with a system atomic_ops
+
+When bdw-gc is linked with libatomic_ops, bdw-gc.pc must contain the
+needed libraries (such as -latomic_ops) otherwise build of applications
+such as guile will fail on link stage:
+
+.libs/libguile_2.0_la-posix.o: In function `scm_tmpnam':
+posix.c:(.text+0x2080): warning: the use of `tmpnam' is dangerous, better use `mkstemp'
+  CCLD     guile
+/home/buildroot/autobuild/run/instance-2/output/host/arm-buildroot-linux-gnueabi/sysroot/usr/lib/libgc.so: undefined reference to `AO_fetch_compare_and_swap_emulation'
+/home/buildroot/autobuild/run/instance-2/output/host/arm-buildroot-linux-gnueabi/sysroot/usr/lib/libgc.so: undefined reference to `AO_store_full_emulation'
+
+So set ATOMIC_OPS_LIBS to -latomic_ops when a system atomic_ops library
+is used and use ATOMIC_OPS_LIBS in bdw-gc.pc.in
+
+Fixes:
+ - http://autobuild.buildroot.org/results/2b23d445e57a5e0f417f5cb9417b0a668bb7bf1c
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/ivmai/bdwgc/pull/247]
+---
+ bdw-gc.pc.in | 2 +-
+ configure.ac | 4 +++-
+ 2 files changed, 4 insertions(+), 2 deletions(-)
+
+diff --git a/bdw-gc.pc.in b/bdw-gc.pc.in
+index ef4c2341..9fc42465 100644
+--- a/bdw-gc.pc.in
++++ b/bdw-gc.pc.in
+@@ -6,5 +6,5 @@ includedir=@includedir@
+ Name: Boehm-Demers-Weiser Conservative Garbage Collector
+ Description: A garbage collector for C and C++
+ Version: @PACKAGE_VERSION@
+-Libs: -L${libdir} -lgc
++Libs: -L${libdir} -lgc @ATOMIC_OPS_LIBS@
+ Cflags: -I${includedir}
+diff --git a/configure.ac b/configure.ac
+index 21abe8fa..9ffe81de 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -1081,7 +1081,9 @@ AS_IF([test x"$with_libatomic_ops" = xno \
+ AC_MSG_CHECKING([which libatomic_ops to use])
+ AS_IF([test x"$with_libatomic_ops" != xno],
+   [ AS_IF([test x"$with_libatomic_ops" != xnone -a x"$THREADS" != xnone],
+-          [ AC_MSG_RESULT([external]) ],
++          [ AC_MSG_RESULT([external])
++            ATOMIC_OPS_LIBS="-latomic_ops"
++            AC_SUBST([ATOMIC_OPS_LIBS]) ],
+           [ AC_MSG_RESULT([none])
+             AS_IF([test x"$THREADS" != xnone],
+                   [ AC_DEFINE([GC_BUILTIN_ATOMIC], [1],
+-- 
+2.17.1
+
diff --git a/package/bdwgc/bdwgc.mk b/package/bdwgc/bdwgc.mk
index 8ffac476f3..3979cd88c8 100644
--- a/package/bdwgc/bdwgc.mk
+++ b/package/bdwgc/bdwgc.mk
@@ -12,6 +12,8 @@ BDWGC_LICENSE = bdwgc license
 BDWGC_LICENSE_FILES = README.QUICK
 BDWGC_DEPENDENCIES = libatomic_ops host-pkgconf
 HOST_BDWGC_DEPENDENCIES = host-libatomic_ops host-pkgconf
+# We're patching configure.ac
+BDWGC_AUTORECONF = YES
 
 BDWGC_CONF_OPTS = CFLAGS_EXTRA="$(BDWGC_CFLAGS_EXTRA)"
 ifeq ($(BR2_sparc),y)
-- 
2.17.1
