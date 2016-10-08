From: Waldemar Brodkorb <wbx@openadk.org>
Date: Sat, 8 Oct 2016 20:22:45 +0200
Subject: [Buildroot] [PATCH] uclibc: fix two more regressions introduced in
	1.0.18
Message-ID: <20161008182245.GA20638@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
  http://autobuild.buildroot.net/results/e4c/e4c65ecf3ec011c39a80fd5d39ea0742c6171b06/
  http://autobuild.buildroot.net/results/1c1/1c1080795c5f65c3e8a6b1bd79ca9dd997409260/

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 package/uclibc/0003-cleanup-libc.a.patch           | 42 ++++++++++++++++++++++
 ...include-copysgnl.c-if-UCLIBC_HAS_LONG_DOU.patch | 31 ++++++++++++++++
 2 files changed, 73 insertions(+)
 create mode 100644 package/uclibc/0003-cleanup-libc.a.patch
 create mode 100644 package/uclibc/0004-ppc-do-not-include-copysgnl.c-if-UCLIBC_HAS_LONG_DOU.patch

diff --git a/package/uclibc/0003-cleanup-libc.a.patch b/package/uclibc/0003-cleanup-libc.a.patch
new file mode 100644
index 0000000..48e09fa
--- /dev/null
+++ b/package/uclibc/0003-cleanup-libc.a.patch
@@ -0,0 +1,42 @@
+From 9b1077dc70e52ee85a718bce3fcfec7ae9af2967 Mon Sep 17 00:00:00 2001
+From: Waldemar Brodkorb <wbx@uclibc-ng.org>
+Date: Sat, 8 Oct 2016 05:43:09 +0200
+Subject: [PATCH] cleanup libc.a
+
+The nested libpthread_nonshared.a and libdl.os shouldn't be included
+in the static libc.a. Fixes compile issues for static builds.
+
+Signed-off-by: Waldemar Brodkorb <wbx@uclibc-ng.org>
+---
+ libc/Makefile.in            | 1 -
+ libpthread/nptl/Makefile.in | 2 --
+ 2 files changed, 3 deletions(-)
+
+diff --git a/libc/Makefile.in b/libc/Makefile.in
+index 55fd3d3..85986a7 100644
+--- a/libc/Makefile.in
++++ b/libc/Makefile.in
+@@ -44,7 +44,6 @@ endif
+ 
+ libc-a-y += $(libnsl-a-y)
+ libc-a-y += $(libresolv-a-y)
+-libc-a-$(HAVE_SHARED) += $(libdl-a-y)
+ libc-a-y += $(libm-a-y)
+ libc-a-$(UCLIBC_HAS_LIBUTIL) += $(libutil-a-y)
+ libc-a-$(UCLIBC_HAS_CRYPT) += $(libcrypt-a-y)
+diff --git a/libpthread/nptl/Makefile.in b/libpthread/nptl/Makefile.in
+index 0fc83e2..068eee4 100644
+--- a/libpthread/nptl/Makefile.in
++++ b/libpthread/nptl/Makefile.in
+@@ -41,8 +41,6 @@ else
+ libpthread-a-y := $(libpthread-static-y)
+ endif
+ 
+-libpthread-a-y += $(top_builddir)lib/libpthread_nonshared.a
+-
+ libc-shared-routines-y := $(filter-out $(notdir $(libpthread_libc_OBJS:.o=.c)), $(libc-shared-routines-y))
+ libc-static-routines-y := $(filter-out $(notdir $(libpthread_libc_OBJS:.o=.c)), $(libc-static-routines-y))
+ libc-shared-routines-y := $(addprefix $(libpthread_OUT)/,$(libc-shared-routines-y:.c=.oS))
+-- 
+2.1.4
+
diff --git a/package/uclibc/0004-ppc-do-not-include-copysgnl.c-if-UCLIBC_HAS_LONG_DOU.patch b/package/uclibc/0004-ppc-do-not-include-copysgnl.c-if-UCLIBC_HAS_LONG_DOU.patch
new file mode 100644
index 0000000..a8fb027
--- /dev/null
+++ b/package/uclibc/0004-ppc-do-not-include-copysgnl.c-if-UCLIBC_HAS_LONG_DOU.patch
@@ -0,0 +1,31 @@
+From 7136bb422a0681d787d07dc2936f08395b8a1007 Mon Sep 17 00:00:00 2001
+From: Waldemar Brodkorb <wbx@uclibc-ng.org>
+Date: Sat, 8 Oct 2016 18:03:27 +0200
+Subject: [PATCH] ppc: do not include copysgnl.c if
+ UCLIBC_HAS_LONG_DOUBLE_MATH enabled
+
+Fixes compilation of uClibc-ng when UCLIBC_HAS_LONG_DOUBLE_MATH is
+used.
+
+Signed-off-by: Waldemar Brodkorb <wbx@uclibc-ng.org>
+---
+ libc/sysdeps/linux/powerpc/Makefile.arch | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/libc/sysdeps/linux/powerpc/Makefile.arch b/libc/sysdeps/linux/powerpc/Makefile.arch
+index 7c09c87..f0144e7 100644
+--- a/libc/sysdeps/linux/powerpc/Makefile.arch
++++ b/libc/sysdeps/linux/powerpc/Makefile.arch
+@@ -5,7 +5,8 @@
+ # Licensed under the LGPL v2.1, see the file COPYING.LIB in this tarball.
+ #
+ 
+-CSRC-y := __syscall_error.c ioctl.c copysignl.c
++CSRC-y := __syscall_error.c ioctl.c
++CSRC-$(if $(UCLIBC_HAS_LONG_DOUBLE_MATH),,y) += copysignl.c
+ 
+ SSRC-y := \
+ 	__longjmp.S setjmp.S bsd-setjmp.S bsd-_setjmp.S brk.S \
+-- 
+2.1.4
+
-- 
2.1.4
