From: Max Filippov <jcmvbkbc@gmail.com>
Date: Tue, 18 Aug 2015 07:40:38 +0300
Subject: [Buildroot] [PATCH] gcc: backport xtensa libgcc stack unwinding
	fixes
Message-ID: <1439872838-10596-1-git-send-email-jcmvbkbc@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

These backported patches fix the following failing uClibc-ng tests:
  nptl/tst-cancelx4,
  nptl/tst-cancelx16,
  nptl/tst-cancelx18,
  nptl/tst-cancelx20,
  nptl/tst-cancelx21,
  nptl/tst-cleanupx1,
  nptl/tst-cleanupx3,
  nptl/tst-oncex3,
  nptl/tst-oncex4.

Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
---
 .../871-xtensa-reimplement-register-spilling.patch | 76 ++++++++++++++++++++++
 ...unwind-dw2-fde-dip-instead-of-unwind-dw2-.patch | 33 ++++++++++
 .../gcc/4.8.5/873-xtensa-fix-_Unwind_GetCFA.patch  | 40 ++++++++++++
 .../871-xtensa-reimplement-register-spilling.patch | 76 ++++++++++++++++++++++
 ...unwind-dw2-fde-dip-instead-of-unwind-dw2-.patch | 33 ++++++++++
 .../gcc/4.9.3/873-xtensa-fix-_Unwind_GetCFA.patch  | 40 ++++++++++++
 .../871-xtensa-reimplement-register-spilling.patch | 76 ++++++++++++++++++++++
 ...unwind-dw2-fde-dip-instead-of-unwind-dw2-.patch | 31 +++++++++
 .../gcc/5.2.0/873-xtensa-fix-_Unwind_GetCFA.patch  | 40 ++++++++++++
 9 files changed, 445 insertions(+)
 create mode 100644 package/gcc/4.8.5/871-xtensa-reimplement-register-spilling.patch
 create mode 100644 package/gcc/4.8.5/872-xtensa-use-unwind-dw2-fde-dip-instead-of-unwind-dw2-.patch
 create mode 100644 package/gcc/4.8.5/873-xtensa-fix-_Unwind_GetCFA.patch
 create mode 100644 package/gcc/4.9.3/871-xtensa-reimplement-register-spilling.patch
 create mode 100644 package/gcc/4.9.3/872-xtensa-use-unwind-dw2-fde-dip-instead-of-unwind-dw2-.patch
 create mode 100644 package/gcc/4.9.3/873-xtensa-fix-_Unwind_GetCFA.patch
 create mode 100644 package/gcc/5.2.0/871-xtensa-reimplement-register-spilling.patch
 create mode 100644 package/gcc/5.2.0/872-xtensa-use-unwind-dw2-fde-dip-instead-of-unwind-dw2-.patch
 create mode 100644 package/gcc/5.2.0/873-xtensa-fix-_Unwind_GetCFA.patch

diff --git a/package/gcc/4.8.5/871-xtensa-reimplement-register-spilling.patch b/package/gcc/4.8.5/871-xtensa-reimplement-register-spilling.patch
new file mode 100644
index 0000000..abc7a08
--- /dev/null
+++ b/package/gcc/4.8.5/871-xtensa-reimplement-register-spilling.patch
@@ -0,0 +1,76 @@
+From 05154174b369505238b759cf80d595d8cfc8c731 Mon Sep 17 00:00:00 2001
+From: Max Filippov <jcmvbkbc@gmail.com>
+Date: Mon, 10 Aug 2015 21:35:20 +0300
+Subject: [PATCH 1/3] xtensa: reimplement register spilling
+
+Spilling windowed registers in userspace is much easier, more portable,
+less error-prone and equally effective as in kernel. Now that register
+spilling syscall is considered obsolete in the xtensa linux kernel
+replace it with CALL12 followed by series of ENTRY in libgcc.
+
+2015-08-18  Max Filippov  <jcmvbkbc@gmail.com>
+libgcc/
+	* config/xtensa/lib2funcs.S (__xtensa_libgcc_window_spill): Use
+	CALL12 followed by series of ENTRY to spill windowed registers.
+	(__xtensa_nonlocal_goto): Call __xtensa_libgcc_window_spill
+	instead of making linux spill syscall.
+
+Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
+---
+Backported from: r226962
+
+ libgcc/config/xtensa/lib2funcs.S | 30 +++++++++++++++++++++++-------
+ 1 file changed, 23 insertions(+), 7 deletions(-)
+
+diff --git a/libgcc/config/xtensa/lib2funcs.S b/libgcc/config/xtensa/lib2funcs.S
+index 3ac8c1d..2e678af 100644
+--- a/libgcc/config/xtensa/lib2funcs.S
++++ b/libgcc/config/xtensa/lib2funcs.S
+@@ -33,10 +33,29 @@ see the files COPYING3 and COPYING.RUNTIME respectively.  If not, see
+ 	.global	__xtensa_libgcc_window_spill
+ 	.type	__xtensa_libgcc_window_spill, at function
+ __xtensa_libgcc_window_spill:
+-	entry	sp, 32
+-	movi	a2, 0
+-	syscall
++	entry	sp, 48
++#if XCHAL_NUM_AREGS > 16
++	call12	1f
++	retw
++	.align	4
++1:
++	.rept	(XCHAL_NUM_AREGS - 24) / 12
++	_entry	sp, 48
++	mov	a12, a0
++	.endr
++	_entry	sp, 16
++#if XCHAL_NUM_AREGS % 12 == 0
++	mov	a4, a4
++#elif XCHAL_NUM_AREGS % 12 == 4
++	mov	a8, a8
++#elif XCHAL_NUM_AREGS % 12 == 8
++	mov	a12, a12
++#endif
++	retw
++#else
++	mov	a8, a8
+ 	retw
++#endif
+ 	.size	__xtensa_libgcc_window_spill, .-__xtensa_libgcc_window_spill
+ 
+ 
+@@ -58,10 +77,7 @@ __xtensa_nonlocal_goto:
+ 	entry	sp, 32
+ 
+ 	/* Flush registers.  */
+-	mov	a5, a2
+-	movi	a2, 0
+-	syscall
+-	mov	a2, a5
++	call8	__xtensa_libgcc_window_spill
+ 
+ 	/* Because the save area for a0-a3 is stored one frame below
+ 	   the one identified by a2, the only way to restore those
+-- 
+1.8.1.4
+
diff --git a/package/gcc/4.8.5/872-xtensa-use-unwind-dw2-fde-dip-instead-of-unwind-dw2-.patch b/package/gcc/4.8.5/872-xtensa-use-unwind-dw2-fde-dip-instead-of-unwind-dw2-.patch
new file mode 100644
index 0000000..f23a5c0
--- /dev/null
+++ b/package/gcc/4.8.5/872-xtensa-use-unwind-dw2-fde-dip-instead-of-unwind-dw2-.patch
@@ -0,0 +1,33 @@
+From f66206679a0ad604f13673559f230160cd3d1189 Mon Sep 17 00:00:00 2001
+From: Max Filippov <jcmvbkbc@gmail.com>
+Date: Fri, 14 Aug 2015 02:45:02 +0300
+Subject: [PATCH 2/3] xtensa: use unwind-dw2-fde-dip instead of unwind-dw2-fde
+
+This allows having exception cleanup code in binaries that don't
+register their unwind tables.
+
+2015-08-18  Max Filippov  <jcmvbkbc@gmail.com>
+libgcc/
+	* config/xtensa/t-xtensa (LIB2ADDEH): Replace unwind-dw2-fde
+	with unwind-dw2-fde-dip.
+
+Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
+---
+Backported from: r226963
+
+ libgcc/config/xtensa/t-xtensa | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/libgcc/config/xtensa/t-xtensa b/libgcc/config/xtensa/t-xtensa
+index 27399e6..66d0eb3 100644
+--- a/libgcc/config/xtensa/t-xtensa
++++ b/libgcc/config/xtensa/t-xtensa
+@@ -13,4 +13,4 @@ LIB1ASMFUNCS = _mulsi3 _divsi3 _modsi3 _udivsi3 _umodsi3 \
+ LIB2ADD = $(srcdir)/config/xtensa/lib2funcs.S
+ 
+ LIB2ADDEH = $(srcdir)/config/xtensa/unwind-dw2-xtensa.c \
+-   $(srcdir)/unwind-dw2-fde.c $(srcdir)/unwind-sjlj.c $(srcdir)/unwind-c.c
++   $(srcdir)/unwind-dw2-fde-dip.c $(srcdir)/unwind-sjlj.c $(srcdir)/unwind-c.c
+-- 
+1.8.1.4
+
diff --git a/package/gcc/4.8.5/873-xtensa-fix-_Unwind_GetCFA.patch b/package/gcc/4.8.5/873-xtensa-fix-_Unwind_GetCFA.patch
new file mode 100644
index 0000000..dc40513
--- /dev/null
+++ b/package/gcc/4.8.5/873-xtensa-fix-_Unwind_GetCFA.patch
@@ -0,0 +1,40 @@
+From 15c7c4d39b317f0d902ef28fd43eca5c3369f891 Mon Sep 17 00:00:00 2001
+From: Max Filippov <jcmvbkbc@gmail.com>
+Date: Sat, 15 Aug 2015 05:12:11 +0300
+Subject: [PATCH 3/3] xtensa: fix _Unwind_GetCFA
+
+Returning context->cfa in _Unwind_GetCFA makes CFA point one stack frame
+higher than what was actually used by code at context->ra. This results
+in invalid CFA value in signal frames and premature unwinding completion
+in forced unwinding used by uClibc NPTL thread cancellation.
+Returning context->sp from _Unwind_GetCFA makes all CFA values valid and
+matching code that used them.
+
+2015-08-18  Max Filippov  <jcmvbkbc@gmail.com>
+libgcc/
+	* config/xtensa/unwind-dw2-xtensa.c (_Unwind_GetCFA): Return
+	context->sp instead of context->cfa.
+
+Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
+---
+Backported from: r226964
+
+ libgcc/config/xtensa/unwind-dw2-xtensa.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/libgcc/config/xtensa/unwind-dw2-xtensa.c b/libgcc/config/xtensa/unwind-dw2-xtensa.c
+index 35f7797..ef6b900 100644
+--- a/libgcc/config/xtensa/unwind-dw2-xtensa.c
++++ b/libgcc/config/xtensa/unwind-dw2-xtensa.c
+@@ -130,7 +130,7 @@ _Unwind_GetGR (struct _Unwind_Context *context, int index)
+ _Unwind_Word
+ _Unwind_GetCFA (struct _Unwind_Context *context)
+ {
+-  return (_Unwind_Ptr) context->cfa;
++  return (_Unwind_Ptr) context->sp;
+ }
+ 
+ /* Overwrite the saved value for register INDEX in CONTEXT with VAL.  */
+-- 
+1.8.1.4
+
diff --git a/package/gcc/4.9.3/871-xtensa-reimplement-register-spilling.patch b/package/gcc/4.9.3/871-xtensa-reimplement-register-spilling.patch
new file mode 100644
index 0000000..abc7a08
--- /dev/null
+++ b/package/gcc/4.9.3/871-xtensa-reimplement-register-spilling.patch
@@ -0,0 +1,76 @@
+From 05154174b369505238b759cf80d595d8cfc8c731 Mon Sep 17 00:00:00 2001
+From: Max Filippov <jcmvbkbc@gmail.com>
+Date: Mon, 10 Aug 2015 21:35:20 +0300
+Subject: [PATCH 1/3] xtensa: reimplement register spilling
+
+Spilling windowed registers in userspace is much easier, more portable,
+less error-prone and equally effective as in kernel. Now that register
+spilling syscall is considered obsolete in the xtensa linux kernel
+replace it with CALL12 followed by series of ENTRY in libgcc.
+
+2015-08-18  Max Filippov  <jcmvbkbc@gmail.com>
+libgcc/
+	* config/xtensa/lib2funcs.S (__xtensa_libgcc_window_spill): Use
+	CALL12 followed by series of ENTRY to spill windowed registers.
+	(__xtensa_nonlocal_goto): Call __xtensa_libgcc_window_spill
+	instead of making linux spill syscall.
+
+Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
+---
+Backported from: r226962
+
+ libgcc/config/xtensa/lib2funcs.S | 30 +++++++++++++++++++++++-------
+ 1 file changed, 23 insertions(+), 7 deletions(-)
+
+diff --git a/libgcc/config/xtensa/lib2funcs.S b/libgcc/config/xtensa/lib2funcs.S
+index 3ac8c1d..2e678af 100644
+--- a/libgcc/config/xtensa/lib2funcs.S
++++ b/libgcc/config/xtensa/lib2funcs.S
+@@ -33,10 +33,29 @@ see the files COPYING3 and COPYING.RUNTIME respectively.  If not, see
+ 	.global	__xtensa_libgcc_window_spill
+ 	.type	__xtensa_libgcc_window_spill, at function
+ __xtensa_libgcc_window_spill:
+-	entry	sp, 32
+-	movi	a2, 0
+-	syscall
++	entry	sp, 48
++#if XCHAL_NUM_AREGS > 16
++	call12	1f
++	retw
++	.align	4
++1:
++	.rept	(XCHAL_NUM_AREGS - 24) / 12
++	_entry	sp, 48
++	mov	a12, a0
++	.endr
++	_entry	sp, 16
++#if XCHAL_NUM_AREGS % 12 == 0
++	mov	a4, a4
++#elif XCHAL_NUM_AREGS % 12 == 4
++	mov	a8, a8
++#elif XCHAL_NUM_AREGS % 12 == 8
++	mov	a12, a12
++#endif
++	retw
++#else
++	mov	a8, a8
+ 	retw
++#endif
+ 	.size	__xtensa_libgcc_window_spill, .-__xtensa_libgcc_window_spill
+ 
+ 
+@@ -58,10 +77,7 @@ __xtensa_nonlocal_goto:
+ 	entry	sp, 32
+ 
+ 	/* Flush registers.  */
+-	mov	a5, a2
+-	movi	a2, 0
+-	syscall
+-	mov	a2, a5
++	call8	__xtensa_libgcc_window_spill
+ 
+ 	/* Because the save area for a0-a3 is stored one frame below
+ 	   the one identified by a2, the only way to restore those
+-- 
+1.8.1.4
+
diff --git a/package/gcc/4.9.3/872-xtensa-use-unwind-dw2-fde-dip-instead-of-unwind-dw2-.patch b/package/gcc/4.9.3/872-xtensa-use-unwind-dw2-fde-dip-instead-of-unwind-dw2-.patch
new file mode 100644
index 0000000..f23a5c0
--- /dev/null
+++ b/package/gcc/4.9.3/872-xtensa-use-unwind-dw2-fde-dip-instead-of-unwind-dw2-.patch
@@ -0,0 +1,33 @@
+From f66206679a0ad604f13673559f230160cd3d1189 Mon Sep 17 00:00:00 2001
+From: Max Filippov <jcmvbkbc@gmail.com>
+Date: Fri, 14 Aug 2015 02:45:02 +0300
+Subject: [PATCH 2/3] xtensa: use unwind-dw2-fde-dip instead of unwind-dw2-fde
+
+This allows having exception cleanup code in binaries that don't
+register their unwind tables.
+
+2015-08-18  Max Filippov  <jcmvbkbc@gmail.com>
+libgcc/
+	* config/xtensa/t-xtensa (LIB2ADDEH): Replace unwind-dw2-fde
+	with unwind-dw2-fde-dip.
+
+Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
+---
+Backported from: r226963
+
+ libgcc/config/xtensa/t-xtensa | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/libgcc/config/xtensa/t-xtensa b/libgcc/config/xtensa/t-xtensa
+index 27399e6..66d0eb3 100644
+--- a/libgcc/config/xtensa/t-xtensa
++++ b/libgcc/config/xtensa/t-xtensa
+@@ -13,4 +13,4 @@ LIB1ASMFUNCS = _mulsi3 _divsi3 _modsi3 _udivsi3 _umodsi3 \
+ LIB2ADD = $(srcdir)/config/xtensa/lib2funcs.S
+ 
+ LIB2ADDEH = $(srcdir)/config/xtensa/unwind-dw2-xtensa.c \
+-   $(srcdir)/unwind-dw2-fde.c $(srcdir)/unwind-sjlj.c $(srcdir)/unwind-c.c
++   $(srcdir)/unwind-dw2-fde-dip.c $(srcdir)/unwind-sjlj.c $(srcdir)/unwind-c.c
+-- 
+1.8.1.4
+
diff --git a/package/gcc/4.9.3/873-xtensa-fix-_Unwind_GetCFA.patch b/package/gcc/4.9.3/873-xtensa-fix-_Unwind_GetCFA.patch
new file mode 100644
index 0000000..dc40513
--- /dev/null
+++ b/package/gcc/4.9.3/873-xtensa-fix-_Unwind_GetCFA.patch
@@ -0,0 +1,40 @@
+From 15c7c4d39b317f0d902ef28fd43eca5c3369f891 Mon Sep 17 00:00:00 2001
+From: Max Filippov <jcmvbkbc@gmail.com>
+Date: Sat, 15 Aug 2015 05:12:11 +0300
+Subject: [PATCH 3/3] xtensa: fix _Unwind_GetCFA
+
+Returning context->cfa in _Unwind_GetCFA makes CFA point one stack frame
+higher than what was actually used by code at context->ra. This results
+in invalid CFA value in signal frames and premature unwinding completion
+in forced unwinding used by uClibc NPTL thread cancellation.
+Returning context->sp from _Unwind_GetCFA makes all CFA values valid and
+matching code that used them.
+
+2015-08-18  Max Filippov  <jcmvbkbc@gmail.com>
+libgcc/
+	* config/xtensa/unwind-dw2-xtensa.c (_Unwind_GetCFA): Return
+	context->sp instead of context->cfa.
+
+Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
+---
+Backported from: r226964
+
+ libgcc/config/xtensa/unwind-dw2-xtensa.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/libgcc/config/xtensa/unwind-dw2-xtensa.c b/libgcc/config/xtensa/unwind-dw2-xtensa.c
+index 35f7797..ef6b900 100644
+--- a/libgcc/config/xtensa/unwind-dw2-xtensa.c
++++ b/libgcc/config/xtensa/unwind-dw2-xtensa.c
+@@ -130,7 +130,7 @@ _Unwind_GetGR (struct _Unwind_Context *context, int index)
+ _Unwind_Word
+ _Unwind_GetCFA (struct _Unwind_Context *context)
+ {
+-  return (_Unwind_Ptr) context->cfa;
++  return (_Unwind_Ptr) context->sp;
+ }
+ 
+ /* Overwrite the saved value for register INDEX in CONTEXT with VAL.  */
+-- 
+1.8.1.4
+
diff --git a/package/gcc/5.2.0/871-xtensa-reimplement-register-spilling.patch b/package/gcc/5.2.0/871-xtensa-reimplement-register-spilling.patch
new file mode 100644
index 0000000..4056f8b
--- /dev/null
+++ b/package/gcc/5.2.0/871-xtensa-reimplement-register-spilling.patch
@@ -0,0 +1,76 @@
+From 40507bf199440082ed69b777986d50c31efe2520 Mon Sep 17 00:00:00 2001
+From: Max Filippov <jcmvbkbc@gmail.com>
+Date: Mon, 10 Aug 2015 21:35:20 +0300
+Subject: [PATCH 1/3] xtensa: reimplement register spilling
+
+Spilling windowed registers in userspace is much easier, more portable,
+less error-prone and equally effective as in kernel. Now that register
+spilling syscall is considered obsolete in the xtensa linux kernel
+replace it with CALL12 followed by series of ENTRY in libgcc.
+
+2015-08-18  Max Filippov  <jcmvbkbc@gmail.com>
+libgcc/
+	* config/xtensa/lib2funcs.S (__xtensa_libgcc_window_spill): Use
+	CALL12 followed by series of ENTRY to spill windowed registers.
+	(__xtensa_nonlocal_goto): Call __xtensa_libgcc_window_spill
+	instead of making linux spill syscall.
+
+Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
+---
+Backported from: r226962
+
+ libgcc/config/xtensa/lib2funcs.S | 30 +++++++++++++++++++++++-------
+ 1 file changed, 23 insertions(+), 7 deletions(-)
+
+diff --git a/libgcc/config/xtensa/lib2funcs.S b/libgcc/config/xtensa/lib2funcs.S
+index 4d451c8..ef0703f 100644
+--- a/libgcc/config/xtensa/lib2funcs.S
++++ b/libgcc/config/xtensa/lib2funcs.S
+@@ -34,10 +34,29 @@ see the files COPYING3 and COPYING.RUNTIME respectively.  If not, see
+ 	.global	__xtensa_libgcc_window_spill
+ 	.type	__xtensa_libgcc_window_spill, at function
+ __xtensa_libgcc_window_spill:
+-	entry	sp, 32
+-	movi	a2, 0
+-	syscall
++	entry	sp, 48
++#if XCHAL_NUM_AREGS > 16
++	call12	1f
++	retw
++	.align	4
++1:
++	.rept	(XCHAL_NUM_AREGS - 24) / 12
++	_entry	sp, 48
++	mov	a12, a0
++	.endr
++	_entry	sp, 16
++#if XCHAL_NUM_AREGS % 12 == 0
++	mov	a4, a4
++#elif XCHAL_NUM_AREGS % 12 == 4
++	mov	a8, a8
++#elif XCHAL_NUM_AREGS % 12 == 8
++	mov	a12, a12
++#endif
+ 	retw
++#else
++	mov	a8, a8
++	retw
++#endif
+ 	.size	__xtensa_libgcc_window_spill, .-__xtensa_libgcc_window_spill
+ #endif
+ 
+@@ -61,10 +80,7 @@ __xtensa_nonlocal_goto:
+ 	entry	sp, 32
+ 
+ 	/* Flush registers.  */
+-	mov	a5, a2
+-	movi	a2, 0
+-	syscall
+-	mov	a2, a5
++	call8	__xtensa_libgcc_window_spill
+ 
+ 	/* Because the save area for a0-a3 is stored one frame below
+ 	   the one identified by a2, the only way to restore those
+-- 
+1.8.1.4
+
diff --git a/package/gcc/5.2.0/872-xtensa-use-unwind-dw2-fde-dip-instead-of-unwind-dw2-.patch b/package/gcc/5.2.0/872-xtensa-use-unwind-dw2-fde-dip-instead-of-unwind-dw2-.patch
new file mode 100644
index 0000000..9707f68
--- /dev/null
+++ b/package/gcc/5.2.0/872-xtensa-use-unwind-dw2-fde-dip-instead-of-unwind-dw2-.patch
@@ -0,0 +1,31 @@
+From 7d7a85f75ba218df4a4226e95865fc8fa561cb86 Mon Sep 17 00:00:00 2001
+From: Max Filippov <jcmvbkbc@gmail.com>
+Date: Fri, 14 Aug 2015 02:45:02 +0300
+Subject: [PATCH 2/3] xtensa: use unwind-dw2-fde-dip instead of unwind-dw2-fde
+
+This allows having exception cleanup code in binaries that don't
+register their unwind tables.
+
+2015-08-18  Max Filippov  <jcmvbkbc@gmail.com>
+libgcc/
+	* config/xtensa/t-windowed (LIB2ADDEH): Replace unwind-dw2-fde
+	with unwind-dw2-fde-dip.
+
+Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
+---
+Backported from: r226963
+
+ libgcc/config/xtensa/t-windowed | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/libgcc/config/xtensa/t-windowed b/libgcc/config/xtensa/t-windowed
+index 7d9e9db..a99156c 100644
+--- a/libgcc/config/xtensa/t-windowed
++++ b/libgcc/config/xtensa/t-windowed
+@@ -1,2 +1,2 @@
+ LIB2ADDEH = $(srcdir)/config/xtensa/unwind-dw2-xtensa.c \
+-   $(srcdir)/unwind-dw2-fde.c $(srcdir)/unwind-sjlj.c $(srcdir)/unwind-c.c
++   $(srcdir)/unwind-dw2-fde-dip.c $(srcdir)/unwind-sjlj.c $(srcdir)/unwind-c.c
+-- 
+1.8.1.4
+
diff --git a/package/gcc/5.2.0/873-xtensa-fix-_Unwind_GetCFA.patch b/package/gcc/5.2.0/873-xtensa-fix-_Unwind_GetCFA.patch
new file mode 100644
index 0000000..2d8eb7c
--- /dev/null
+++ b/package/gcc/5.2.0/873-xtensa-fix-_Unwind_GetCFA.patch
@@ -0,0 +1,40 @@
+From b33905dc310f475ddbde4c9fb7230724b2068a2b Mon Sep 17 00:00:00 2001
+From: Max Filippov <jcmvbkbc@gmail.com>
+Date: Sat, 15 Aug 2015 05:12:11 +0300
+Subject: [PATCH 3/3] xtensa: fix _Unwind_GetCFA
+
+Returning context->cfa in _Unwind_GetCFA makes CFA point one stack frame
+higher than what was actually used by code at context->ra. This results
+in invalid CFA value in signal frames and premature unwinding completion
+in forced unwinding used by uClibc NPTL thread cancellation.
+Returning context->sp from _Unwind_GetCFA makes all CFA values valid and
+matching code that used them.
+
+2015-08-18  Max Filippov  <jcmvbkbc@gmail.com>
+libgcc/
+	* config/xtensa/unwind-dw2-xtensa.c (_Unwind_GetCFA): Return
+	context->sp instead of context->cfa.
+
+Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
+---
+Backported from: r226964
+
+ libgcc/config/xtensa/unwind-dw2-xtensa.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/libgcc/config/xtensa/unwind-dw2-xtensa.c b/libgcc/config/xtensa/unwind-dw2-xtensa.c
+index 82b0e63..8e579c7 100644
+--- a/libgcc/config/xtensa/unwind-dw2-xtensa.c
++++ b/libgcc/config/xtensa/unwind-dw2-xtensa.c
+@@ -130,7 +130,7 @@ _Unwind_GetGR (struct _Unwind_Context *context, int index)
+ _Unwind_Word
+ _Unwind_GetCFA (struct _Unwind_Context *context)
+ {
+-  return (_Unwind_Ptr) context->cfa;
++  return (_Unwind_Ptr) context->sp;
+ }
+ 
+ /* Overwrite the saved value for register INDEX in CONTEXT with VAL.  */
+-- 
+1.8.1.4
+
-- 
1.8.1.4
