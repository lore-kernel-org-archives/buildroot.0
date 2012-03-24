From: Sagaert Johan <sagaert.johan@skynet.be>
Date: Sat, 24 Mar 2012 21:44:05 +0100
Subject: [Buildroot] [PATCH v1 1/1] uClibc 0.9.33 : forward errno bug
	patches from uClibc 0.9.32
In-Reply-To: <1332621845-10604-1-git-send-email-sagaert.johan@skynet.be>
References: <1332621845-10604-1-git-send-email-sagaert.johan@skynet.be>
Message-ID: <1332621845-10604-2-git-send-email-sagaert.johan@skynet.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Sagaert Johan <sagaert.johan@skynet.be>
---
 ...x-e500-__fe_nomask_env-use-of-__set_errno.patch |   34 ++++++++++
 .../uClibc-0.9.33-linuxthreads-errno-fix.patch     |   68 ++++++++++++++++++++
 2 files changed, 102 insertions(+)
 create mode 100644 toolchain/uClibc/uClibc-0.9.33-Fix-e500-__fe_nomask_env-use-of-__set_errno.patch
 create mode 100644 toolchain/uClibc/uClibc-0.9.33-linuxthreads-errno-fix.patch

diff --git a/toolchain/uClibc/uClibc-0.9.33-Fix-e500-__fe_nomask_env-use-of-__set_errno.patch b/toolchain/uClibc/uClibc-0.9.33-Fix-e500-__fe_nomask_env-use-of-__set_errno.patch
new file mode 100644
index 0000000..1908925
--- /dev/null
+++ b/toolchain/uClibc/uClibc-0.9.33-Fix-e500-__fe_nomask_env-use-of-__set_errno.patch
@@ -0,0 +1,34 @@
+>From 49f58308779cb0b798f5e7bc902bbc515c1ec394 Mon Sep 17 00:00:00 2001
+From: Jason Woodward <jason.woodward@timesys.com>
+Date: Sat, 11 Jun 2011 22:00:59 -0400
+Subject: [PATCH] Fix e500 __fe_nomask_env use of __set_errno w/o CFLAGS-libm
+
+Since the new _LIBC guard in 96c9a8f7d00cdf6bb7968a2390b9d87da8a45e2d we need
+to use CFLAGS-libm (-DNOT_IN_libc -DIS_IN_libm) or we end up with linker
+errors like:
+
+  lib/libm.a(fe_nomask.os): In function `__fe_nomask_env':
+  fe_nomask.c:(.text+0x26): undefined reference to `__libc_errno'
+  collect2: ld returned 1 exit status
+
+Signed-off-by: Jason Woodward <jason.woodward@timesys.com>
+---
+ libm/powerpc/e500/fpu/Makefile.arch |    2 ++
+ 1 files changed, 2 insertions(+), 0 deletions(-)
+
+diff --git a/libm/powerpc/e500/fpu/Makefile.arch b/libm/powerpc/e500/fpu/Makefile.arch
+index 904561e..a64843f 100644
+--- a/libm/powerpc/e500/fpu/Makefile.arch
++++ b/libm/powerpc/e500/fpu/Makefile.arch
+@@ -11,6 +11,8 @@ libm_ARCH_SRC:=$(wildcard $(libm_ARCH_fpu_DIR)/*.c)
+ libm_ARCH_OBJ:=$(patsubst $(libm_ARCH_fpu_DIR)/%.c,$(libm_ARCH_fpu_OUT)/%.o,$(libm_ARCH_SRC))
+ endif
+ 
++CFLAGS-fe_nomask.c := $(CFLAGS-libm)
++
+ libm_ARCH_OBJS:=$(libm_ARCH_OBJ)
+ 
+ ifeq ($(DOPIC),y)
+-- 
+1.7.0.4
+
diff --git a/toolchain/uClibc/uClibc-0.9.33-linuxthreads-errno-fix.patch b/toolchain/uClibc/uClibc-0.9.33-linuxthreads-errno-fix.patch
new file mode 100644
index 0000000..c4d0d00
--- /dev/null
+++ b/toolchain/uClibc/uClibc-0.9.33-linuxthreads-errno-fix.patch
@@ -0,0 +1,68 @@
+From af8b2d71ce37b9d4d24ddbc755cdea68de02949a Mon Sep 17 00:00:00 2001
+From: Peter Korsgaard <jacmet@sunsite.dk>
+Date: Mon, 5 Jul 2010 14:08:17 +0200
+Subject: [PATCH] don't make __errno_location / __h_errno_location hidden
+
+Closes #2089 (https://bugs.busybox.net/show_bug.cgi?id=2089)
+
+__errno_location / __h_errno_location access has to go through the PLT
+like malloc/free, so the linuxthread variants gets used instead when
+compiling with -pthread.
+
+Based on http://github.com/mat-c/uClibc/commit/328d392c54aa5dc2b8e7f398a419087de497de2b
+
+Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
+---
+ include/netdb.h                               |    1 -
+ libc/misc/internals/__errno_location.c        |    3 ---
+ libc/misc/internals/__h_errno_location.c      |    1 -
+ libc/sysdeps/linux/common/bits/errno.h        |    1 -
+ 6 files changed, 0 insertions(+), 11 deletions(-)
+
+diff --git a/include/netdb.h b/include/netdb.h
+index 9d3807d..ac411ab 100644
+--- a/include/netdb.h
++++ b/include/netdb.h
+@@ -59,7 +59,6 @@ __BEGIN_DECLS
+ 
+ /* Function to get address of global `h_errno' variable.  */
+ extern int *__h_errno_location (void) __THROW __attribute__ ((__const__));
+-libc_hidden_proto(__h_errno_location)
+ 
+ /* Macros for accessing h_errno from inside libc.  */
+ #ifdef _LIBC
+diff --git a/libc/misc/internals/__errno_location.c b/libc/misc/internals/__errno_location.c
+index 487a9c2..0620860 100644
+--- a/libc/misc/internals/__errno_location.c
++++ b/libc/misc/internals/__errno_location.c
+@@ -15,6 +15,3 @@ int * weak_const_function __errno_location (void)
+ {
+     return &errno;
+ }
+-#ifdef IS_IN_libc /* not really need, only to keep in sync w/ libc_hidden_proto */
+-libc_hidden_weak(__errno_location)
+-#endif
+diff --git a/libc/misc/internals/__h_errno_location.c b/libc/misc/internals/__h_errno_location.c
+index 213d398..235df4e 100644
+--- a/libc/misc/internals/__h_errno_location.c
++++ b/libc/misc/internals/__h_errno_location.c
+@@ -10,4 +10,3 @@ int * weak_const_function __h_errno_location (void)
+ {
+     return &h_errno;
+ }
+-libc_hidden_weak(__h_errno_location)
+diff --git a/libc/misc/internals/__uClibc_main.c b/libc/misc/internals/__uClibc_main.c
+index 6e520fa..f4a9ebb 100644
+--- a/libc/sysdeps/linux/common/bits/errno.h
++++ b/libc/sysdeps/linux/common/bits/errno.h
+@@ -43,7 +43,6 @@
+ # ifndef __ASSEMBLER__
+ /* Function to get address of global `errno' variable.  */
+ extern int *__errno_location (void) __THROW __attribute__ ((__const__));
+-libc_hidden_proto(__errno_location)
+ 
+ #  ifdef __UCLIBC_HAS_THREADS__
+ /* When using threads, errno is a per-thread value.  */
+-- 
+1.7.1
+
-- 
1.7.9.3
