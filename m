From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 17 May 2021 23:16:45 +0200
Subject: [Buildroot] [git commit branch/2021.02.x] package/localedef: fix
 host gcc-11.x compile
Message-ID: <20210517210057.9E7CD875F2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b74235234bef1940ead31ed81481978d00775dd7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Add two upstream patches fixing host gcc-11.x compile.

Fixes:

  - https://bugs.busybox.net/show_bug.cgi?id=13806

  In file included from ../include/pthread.h:1,
                   from ../sysdeps/nptl/thread_db.h:25,
                   from ../nptl/descr.h:32,
                   from ../sysdeps/x86_64/nptl/tls.h:130,
                   from ../sysdeps/generic/libc-tsd.h:44,
                   from ./localeinfo.h:224,
                   from programs/ld-ctype.c:37:
  ../sysdeps/nptl/pthread.h:734:47: error: argument 1 of type ???struct __jmp_buf_tag *??? declared as a pointer [-Werror=array-parameter=]
    734 | extern int __sigsetjmp (struct __jmp_buf_tag *__env, int __savemask) __THROWNL;
        |                         ~~~~~~~~~~~~~~~~~~~~~~^~~~~
  In file included from ../include/setjmp.h:2,
                   from ../nptl/descr.h:24,
                   from ../sysdeps/x86_64/nptl/tls.h:130,
                   from ../sysdeps/generic/libc-tsd.h:44,
                   from ./localeinfo.h:224,
                   from programs/ld-ctype.c:37:
  ../setjmp/setjmp.h:54:46: note: previously declared as an array ???struct __jmp_buf_tag[1]???
     54 | extern int __sigsetjmp (struct __jmp_buf_tag __env[1], int __savemask) __THROWNL;
        |                         ~~~~~~~~~~~~~~~~~~~~~^~~~~~~~

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 4174f79a5718459ab7f018bfa8b9865690568280)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...Warray-parameter-warning-for-__sigsetjmp-.patch | 155 +++++++++++++++++++++
 ...ngop-overflow-warning-in-pthread_cleanup_.patch | 125 +++++++++++++++++
 2 files changed, 280 insertions(+)

diff --git a/package/localedef/2.32-37-g760e1d287825fa91d4d5a0cc921340c740d803e2/0003-Fix-GCC-11-Warray-parameter-warning-for-__sigsetjmp-.patch b/package/localedef/2.32-37-g760e1d287825fa91d4d5a0cc921340c740d803e2/0003-Fix-GCC-11-Warray-parameter-warning-for-__sigsetjmp-.patch
new file mode 100644
index 0000000000..888d27fe4a
--- /dev/null
+++ b/package/localedef/2.32-37-g760e1d287825fa91d4d5a0cc921340c740d803e2/0003-Fix-GCC-11-Warray-parameter-warning-for-__sigsetjmp-.patch
@@ -0,0 +1,155 @@
+From 44f1469daff3a0bfe67fb5839243f114ace3bad8 Mon Sep 17 00:00:00 2001
+From: Joseph Myers <joseph@codesourcery.com>
+Date: Mon, 5 Oct 2020 16:46:46 +0000
+Subject: [PATCH 3/4] Fix GCC 11 -Warray-parameter warning for __sigsetjmp (bug
+ 26647)
+
+This patch fixes part of bug 26647 (-Werror=array-parameter error
+building with GCC 11 because of __sigsetjmp being declared using an
+array parameter in one header and a pointer parameter in another).
+
+The fix is to split the struct __jmp_buf_tag definition out to a
+separate bits/types/ header so it can be included in pthread.h, so
+that pthread.h can declare __sigsetjmp with the type contents visible,
+so can use an array (as in setjmp.h) rather than a pointer in the
+declaration.
+
+Note that several other build failures with GCC 11 remain.  This does
+not fix the jmp_buf-related -Wstringop-overflow errors (also discussed
+in bug 26647), or -Warray-parameter errors for other functions (bug
+26686), or -Warray-bounds errors (bug 26687).
+
+Tested, with older compilers, natively for x86_64 and with
+build-many-glibc.py for aarch64-linux-gnu.  Tested with
+build-many-glibcs.py with GCC mainline for aarch64-linux-gnu that this
+gets past the -Warray-parameter issue for __sigsetjmp (with the next
+build failure being the other one discussed in bug 26647).
+
+[Upstream: https://github.com/bminor/glibc/commit/19302b27bdacfe87e861ff46fc0fbad60dd6602d.patch]
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+---
+ include/bits/types/struct___jmp_buf_tag.h |  1 +
+ setjmp/Makefile                           |  3 +-
+ setjmp/bits/types/struct___jmp_buf_tag.h  | 37 +++++++++++++++++++++++
+ setjmp/setjmp.h                           | 15 +--------
+ sysdeps/nptl/pthread.h                    |  5 +--
+ 5 files changed, 44 insertions(+), 17 deletions(-)
+ create mode 100644 include/bits/types/struct___jmp_buf_tag.h
+ create mode 100644 setjmp/bits/types/struct___jmp_buf_tag.h
+
+diff --git a/include/bits/types/struct___jmp_buf_tag.h b/include/bits/types/struct___jmp_buf_tag.h
+new file mode 100644
+index 00000000..e3250150
+--- /dev/null
++++ b/include/bits/types/struct___jmp_buf_tag.h
+@@ -0,0 +1 @@
++#include <setjmp/bits/types/struct___jmp_buf_tag.h>
+diff --git a/setjmp/Makefile b/setjmp/Makefile
+index dcac5693..603f61d7 100644
+--- a/setjmp/Makefile
++++ b/setjmp/Makefile
+@@ -22,7 +22,8 @@ subdir	:= setjmp
+ 
+ include ../Makeconfig
+ 
+-headers	:= setjmp.h bits/setjmp.h bits/setjmp2.h
++headers	:= setjmp.h bits/setjmp.h bits/setjmp2.h \
++	   bits/types/struct___jmp_buf_tag.h
+ 
+ routines	:= setjmp sigjmp bsd-setjmp bsd-_setjmp \
+ 		   longjmp __longjmp jmp-unwind
+diff --git a/setjmp/bits/types/struct___jmp_buf_tag.h b/setjmp/bits/types/struct___jmp_buf_tag.h
+new file mode 100644
+index 00000000..9d8634f1
+--- /dev/null
++++ b/setjmp/bits/types/struct___jmp_buf_tag.h
+@@ -0,0 +1,37 @@
++/* Define struct __jmp_buf_tag.
++   Copyright (C) 1991-2020 Free Software Foundation, Inc.
++   This file is part of the GNU C Library.
++
++   The GNU C Library is free software; you can redistribute it and/or
++   modify it under the terms of the GNU Lesser General Public
++   License as published by the Free Software Foundation; either
++   version 2.1 of the License, or (at your option) any later version.
++
++   The GNU C Library is distributed in the hope that it will be useful,
++   but WITHOUT ANY WARRANTY; without even the implied warranty of
++   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
++   Lesser General Public License for more details.
++
++   You should have received a copy of the GNU Lesser General Public
++   License along with the GNU C Library; if not, see
++   <https://www.gnu.org/licenses/>.  */
++
++#ifndef	__jmp_buf_tag_defined
++#define	__jmp_buf_tag_defined 1
++
++#include <bits/setjmp.h>		/* Get `__jmp_buf'.  */
++#include <bits/types/__sigset_t.h>
++
++/* Calling environment, plus possibly a saved signal mask.  */
++struct __jmp_buf_tag
++  {
++    /* NOTE: The machine-dependent definitions of `__sigsetjmp'
++       assume that a `jmp_buf' begins with a `__jmp_buf' and that
++       `__mask_was_saved' follows it.  Do not move these members
++       or add others before it.  */
++    __jmp_buf __jmpbuf;		/* Calling environment.  */
++    int __mask_was_saved;	/* Saved the signal mask?  */
++    __sigset_t __saved_mask;	/* Saved signal mask.  */
++  };
++
++#endif
+diff --git a/setjmp/setjmp.h b/setjmp/setjmp.h
+index 4e3443c3..c6c59f40 100644
+--- a/setjmp/setjmp.h
++++ b/setjmp/setjmp.h
+@@ -27,20 +27,7 @@
+ __BEGIN_DECLS
+ 
+ #include <bits/setjmp.h>		/* Get `__jmp_buf'.  */
+-#include <bits/types/__sigset_t.h>
+-
+-/* Calling environment, plus possibly a saved signal mask.  */
+-struct __jmp_buf_tag
+-  {
+-    /* NOTE: The machine-dependent definitions of `__sigsetjmp'
+-       assume that a `jmp_buf' begins with a `__jmp_buf' and that
+-       `__mask_was_saved' follows it.  Do not move these members
+-       or add others before it.  */
+-    __jmp_buf __jmpbuf;		/* Calling environment.  */
+-    int __mask_was_saved;	/* Saved the signal mask?  */
+-    __sigset_t __saved_mask;	/* Saved signal mask.  */
+-  };
+-
++#include <bits/types/struct___jmp_buf_tag.h>
+ 
+ typedef struct __jmp_buf_tag jmp_buf[1];
+ 
+diff --git a/sysdeps/nptl/pthread.h b/sysdeps/nptl/pthread.h
+index 8a403cbf..d4194da7 100644
+--- a/sysdeps/nptl/pthread.h
++++ b/sysdeps/nptl/pthread.h
+@@ -28,6 +28,7 @@
+ #include <bits/wordsize.h>
+ #include <bits/types/struct_timespec.h>
+ #include <bits/types/__sigset_t.h>
++#include <bits/types/struct___jmp_buf_tag.h>
+ 
+ 
+ /* Detach state.  */
+@@ -730,8 +731,8 @@ extern void __pthread_unwind_next (__pthread_unwind_buf_t *__buf)
+ #endif
+ 
+ /* Function used in the macros.  */
+-struct __jmp_buf_tag;
+-extern int __sigsetjmp (struct __jmp_buf_tag *__env, int __savemask) __THROWNL;
++extern int __sigsetjmp (struct __jmp_buf_tag __env[1],
++			int __savemask) __THROWNL;
+ 
+ 
+ /* Mutex handling.  */
+-- 
+2.31.1
+
diff --git a/package/localedef/2.32-37-g760e1d287825fa91d4d5a0cc921340c740d803e2/0004-Avoid-Wstringop-overflow-warning-in-pthread_cleanup_.patch b/package/localedef/2.32-37-g760e1d287825fa91d4d5a0cc921340c740d803e2/0004-Avoid-Wstringop-overflow-warning-in-pthread_cleanup_.patch
new file mode 100644
index 0000000000..83f3f15eb6
--- /dev/null
+++ b/package/localedef/2.32-37-g760e1d287825fa91d4d5a0cc921340c740d803e2/0004-Avoid-Wstringop-overflow-warning-in-pthread_cleanup_.patch
@@ -0,0 +1,125 @@
+From ea50889c35fb73ed9e140d800303aae9148c2888 Mon Sep 17 00:00:00 2001
+From: Joseph Myers <joseph@codesourcery.com>
+Date: Fri, 30 Oct 2020 22:25:42 +0000
+Subject: [PATCH 4/4] Avoid -Wstringop-overflow warning in pthread_cleanup_push
+ macros
+
+GCC 11 introduces a -Wstringop-overflow warning for calls to functions
+with an array argument passed as a pointer to memory not large enough
+for that array.  This includes the __sigsetjmp calls from
+pthread_cleanup_push macros, because those use a structure in
+__pthread_unwind_buf_t, which has a common initial subsequence with
+jmp_buf but does not include the saved signal mask; this is OK in this
+case because the second argument to __sigsetjmp is 0 so the signal
+mask is not accessed.
+
+To avoid this warning, use a function alias __sigsetjmp_cancel with
+first argument an array of exactly the type used in the calls to the
+function, if using GCC 11 or later.  With older compilers, continue to
+use __sigsetjmp with a cast, to avoid any issues with compilers
+predating the returns_twice attribute not applying the same special
+handling to __sigsetjmp_cancel as to __sigsetjmp.
+
+Tested with build-many-glibcs.py for arm-linux-gnueabi that this fixes
+the testsuite build failures.
+
+[Upstream: https://github.com/bminor/glibc/commit/548f467fa14ffe7d955beeb31b30e2aeae4467e0.patch]
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+---
+ misc/sys/cdefs.h       |  8 ++++++++
+ sysdeps/nptl/pthread.h | 37 +++++++++++++++++++++++++++----------
+ 2 files changed, 35 insertions(+), 10 deletions(-)
+
+diff --git a/misc/sys/cdefs.h b/misc/sys/cdefs.h
+index 38221d0b..ce877487 100644
+--- a/misc/sys/cdefs.h
++++ b/misc/sys/cdefs.h
+@@ -556,4 +556,12 @@ _Static_assert (0, "IEEE 128-bits long double requires redirection on this platf
+ #  define __attr_access(x)
+ #endif
+ 
++/* Specify that a function such as setjmp or vfork may return
++   twice.  */
++#if __GNUC_PREREQ (4, 1)
++# define __attribute_returns_twice__ __attribute__ ((__returns_twice__))
++#else
++# define __attribute_returns_twice__ /* Ignore.  */
++#endif
++
+ #endif	 /* sys/cdefs.h */
+diff --git a/sysdeps/nptl/pthread.h b/sysdeps/nptl/pthread.h
+index d4194da7..3a34d823 100644
+--- a/sysdeps/nptl/pthread.h
++++ b/sysdeps/nptl/pthread.h
+@@ -512,13 +512,15 @@ extern void pthread_testcancel (void);
+ 
+ /* Cancellation handling with integration into exception handling.  */
+ 
++struct __cancel_jmp_buf_tag
++{
++  __jmp_buf __cancel_jmp_buf;
++  int __mask_was_saved;
++};
++
+ typedef struct
+ {
+-  struct
+-  {
+-    __jmp_buf __cancel_jmp_buf;
+-    int __mask_was_saved;
+-  } __cancel_jmp_buf[1];
++  struct __cancel_jmp_buf_tag __cancel_jmp_buf[1];
+   void *__pad[4];
+ } __pthread_unwind_buf_t __attribute__ ((__aligned__));
+ 
+@@ -658,8 +660,8 @@ __pthread_cleanup_routine (struct __pthread_cleanup_frame *__frame)
+     __pthread_unwind_buf_t __cancel_buf;				      \
+     void (*__cancel_routine) (void *) = (routine);			      \
+     void *__cancel_arg = (arg);						      \
+-    int __not_first_call = __sigsetjmp ((struct __jmp_buf_tag *) (void *)     \
+-					__cancel_buf.__cancel_jmp_buf, 0);    \
++    int __not_first_call = __sigsetjmp_cancel (__cancel_buf.__cancel_jmp_buf, \
++					       0);			      \
+     if (__glibc_unlikely (__not_first_call))				      \
+       {									      \
+ 	__cancel_routine (__cancel_arg);				      \
+@@ -693,8 +695,8 @@ extern void __pthread_unregister_cancel (__pthread_unwind_buf_t *__buf)
+     __pthread_unwind_buf_t __cancel_buf;				      \
+     void (*__cancel_routine) (void *) = (routine);			      \
+     void *__cancel_arg = (arg);						      \
+-    int __not_first_call = __sigsetjmp ((struct __jmp_buf_tag *) (void *)     \
+-					__cancel_buf.__cancel_jmp_buf, 0);    \
++    int __not_first_call = __sigsetjmp_cancel (__cancel_buf.__cancel_jmp_buf, \
++					       0);			      \
+     if (__glibc_unlikely (__not_first_call))				      \
+       {									      \
+ 	__cancel_routine (__cancel_arg);				      \
+@@ -730,9 +732,24 @@ extern void __pthread_unwind_next (__pthread_unwind_buf_t *__buf)
+      ;
+ #endif
+ 
+-/* Function used in the macros.  */
++/* Function used in the macros.  Calling __sigsetjmp, with its first
++   argument declared as an array, results in a -Wstringop-overflow
++   warning from GCC 11 because struct pthread_unwind_buf is smaller
++   than jmp_buf.  The calls from the macros have __SAVEMASK set to 0,
++   so nothing beyond the common prefix is used and this warning is a
++   false positive.  Use an alias with its first argument declared to
++   use the type in the macros if possible to avoid this warning.  */
++#if __GNUC_PREREQ (11, 0)
++extern int __REDIRECT_NTHNL (__sigsetjmp_cancel,
++			     (struct __cancel_jmp_buf_tag __env[1],
++			      int __savemask),
++			     __sigsetjmp) __attribute_returns_twice__;
++#else
++# define __sigsetjmp_cancel(env, savemask) \
++  __sigsetjmp ((struct __jmp_buf_tag *) (void *) (env), (savemask))
+ extern int __sigsetjmp (struct __jmp_buf_tag __env[1],
+ 			int __savemask) __THROWNL;
++#endif
+ 
+ 
+ /* Mutex handling.  */
+-- 
+2.31.1
+
