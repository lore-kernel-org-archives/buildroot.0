From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 8 Aug 2016 23:46:00 +0200
Subject: [Buildroot] [git commit] package/uclibc: add upstream patch to fix
	Thumb2 builds
Message-ID: <20160808214823.823E57FCDD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=72b75c428dfaa7e8de77d776e677fb0a009df486
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When uClibc-ng 1.0.17 was released, there was a regression when building
Thumb2-only for a CPU that is capable of running in arm mode (e.g. an
armv7a cpu).

We hastily added a patch to revert the upstream commit, as a stop-gap
measure, waiting for the actual fix.

That actual fix is there, now. :-)

Drop our revert-patch, and add the upstream patch.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...arm-cleanup-redundant-macros-for-syscalls.patch | 152 ---------------------
 .../0001-arm-fix-compile-in-thumb-mode.patch       |  48 +++++++
 2 files changed, 48 insertions(+), 152 deletions(-)

diff --git a/package/uclibc/0001-Revert-arm-cleanup-redundant-macros-for-syscalls.patch b/package/uclibc/0001-Revert-arm-cleanup-redundant-macros-for-syscalls.patch
deleted file mode 100644
index e4810f3..0000000
--- a/package/uclibc/0001-Revert-arm-cleanup-redundant-macros-for-syscalls.patch
+++ /dev/null
@@ -1,152 +0,0 @@
-From cdac8bef6b8e94518f78f2e9182cb3fa0f78a57b Mon Sep 17 00:00:00 2001
-From: "Yann E. MORIN" <yann.morin.1998@free.fr>
-Date: Sun, 7 Aug 2016 21:52:46 +0200
-Subject: [PATCH] Revert "arm: cleanup redundant macros for syscalls"
-
-This reverts commit 0550ecce0e6580c5ad34e9a9a39ff18ccf8774f9.
-
-Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
----
- libc/sysdeps/linux/arm/bits/syscalls.h |   4 --
- libc/sysdeps/linux/arm/sysdep.h        | 111 +++++++++++++++++++++++++++++++++
- 2 files changed, 111 insertions(+), 4 deletions(-)
-
-diff --git a/libc/sysdeps/linux/arm/bits/syscalls.h b/libc/sysdeps/linux/arm/bits/syscalls.h
-index 5b30564..e447a7b 100644
---- a/libc/sysdeps/linux/arm/bits/syscalls.h
-+++ b/libc/sysdeps/linux/arm/bits/syscalls.h
-@@ -83,10 +83,6 @@
-      }									\
-      (int) __internal_sys_result; }) \
- )
--
--#undef INTERNAL_SYSCALL_ARM
--#define INTERNAL_SYSCALL_ARM(name, err, nr, args...)           \
--	INTERNAL_SYSCALL_NCS(__ARM_NR_##name, err, nr, args)
- #endif
- 
- #define INTERNAL_SYSCALL_ERROR_P(val, err) \
-diff --git a/libc/sysdeps/linux/arm/sysdep.h b/libc/sysdeps/linux/arm/sysdep.h
-index 80bf9ec..65d9c2b 100644
---- a/libc/sysdeps/linux/arm/sysdep.h
-+++ b/libc/sysdeps/linux/arm/sysdep.h
-@@ -254,5 +254,116 @@ __local_syscall_error:						\
- #define UNDOARGS_6 ldmfd sp!, {r4, r5};
- #define UNDOARGS_7 ldmfd sp!, {r4, r5, r6};
- 
-+#else /* not __ASSEMBLER__ */
-+/* Define a macro which expands into the inline wrapper code for a system
-+   call.  */
-+#undef INLINE_SYSCALL
-+#define INLINE_SYSCALL(name, nr, args...)					\
-+  ({ unsigned int _inline_sys_result = INTERNAL_SYSCALL (name, , nr, args);	\
-+     if (unlikely (INTERNAL_SYSCALL_ERROR_P (_inline_sys_result, )))	\
-+       {									\
-+	 __set_errno (INTERNAL_SYSCALL_ERRNO (_inline_sys_result, ));		\
-+	 _inline_sys_result = (unsigned int) -1;				\
-+       }									\
-+     (int) _inline_sys_result; })
-+
-+#undef INTERNAL_SYSCALL_DECL
-+#define INTERNAL_SYSCALL_DECL(err) do { } while (0)
-+
-+#undef INTERNAL_SYSCALL_RAW
-+#if defined(__thumb__)
-+/* Hide the use of r7 from the compiler, this would be a lot
-+ * easier but for the fact that the syscalls can exceed 255.
-+ * For the moment the LOAD_ARG_7 is sacrificed.
-+ * We can't use push/pop inside the asm because that breaks
-+ * unwinding (ie. thread cancellation).
-+ */
-+#define INTERNAL_SYSCALL_RAW(name, err, nr, args...)		\
-+  ({ unsigned int _internal_sys_result;				\
-+    {								\
-+      int _sys_buf[2];						\
-+      register int __a1 __asm__ ("a1");				\
-+      register int *_v3 __asm__ ("v3") = _sys_buf;		\
-+      LOAD_ARGS_##nr (args)					\
-+      *_v3 = (int) (name);					\
-+      __asm__ __volatile__ ("str	r7, [v3, #4]\n"		\
-+                    "\tldr      r7, [v3]\n"			\
-+                    "\tswi      0       @ syscall " #name "\n"	\
-+                    "\tldr      r7, [v3, #4]"			\
-+                   : "=r" (__a1)				\
-+                    : "r" (_v3) ASM_ARGS_##nr			\
-+                    : "memory");				\
-+      _internal_sys_result = __a1;				\
-+    }								\
-+    (int) _internal_sys_result; })
-+#elif defined(__ARM_EABI__)
-+#define INTERNAL_SYSCALL_RAW(name, err, nr, args...)		\
-+  ({unsigned int _internal_sys_result;				\
-+     {								\
-+       register int __a1 __asm__ ("r0"), _nr __asm__ ("r7");	\
-+       LOAD_ARGS_##nr (args)					\
-+       _nr = name;						\
-+       __asm__ __volatile__ ("swi	0x0 @ syscall " #name	\
-+		     : "=r" (__a1)				\
-+		     : "r" (_nr) ASM_ARGS_##nr			\
-+		     : "memory");				\
-+       _internal_sys_result = __a1;				\
-+     }								\
-+     (int) _internal_sys_result; })
-+#else /* !defined(__ARM_EABI__) */
-+#define INTERNAL_SYSCALL_RAW(name, err, nr, args...)		\
-+  ({ unsigned int _internal_sys_result;				\
-+     {								\
-+       register int __a1 __asm__ ("a1");			\
-+       LOAD_ARGS_##nr (args)					\
-+       __asm__ __volatile__ ("swi	%1 @ syscall " #name	\
-+		     : "=r" (__a1)				\
-+		     : "i" (name) ASM_ARGS_##nr			\
-+		     : "memory");				\
-+       _internal_sys_result = __a1;				\
-+     }								\
-+     (int) _internal_sys_result; })
-+#endif
-+
-+#undef INTERNAL_SYSCALL
-+#define INTERNAL_SYSCALL(name, err, nr, args...)		\
-+	INTERNAL_SYSCALL_RAW(SYS_ify(name), err, nr, args)
-+
-+#undef INTERNAL_SYSCALL_ARM
-+#define INTERNAL_SYSCALL_ARM(name, err, nr, args...)		\
-+	INTERNAL_SYSCALL_RAW(__ARM_NR_##name, err, nr, args)
-+
-+#undef INTERNAL_SYSCALL_ERROR_P
-+#define INTERNAL_SYSCALL_ERROR_P(val, err) \
-+  ((unsigned int) (val) >= 0xfffff001u)
-+
-+#undef INTERNAL_SYSCALL_ERRNO
-+#define INTERNAL_SYSCALL_ERRNO(val, err)	(-(val))
-+
-+#if defined(__ARM_EABI__)
-+#undef INTERNAL_SYSCALL_NCS
-+#define INTERNAL_SYSCALL_NCS(number, err, nr, args...)		\
-+	INTERNAL_SYSCALL_RAW(number, err, nr, args)
-+#else
-+/* We can't implement non-constant syscalls directly since the syscall
-+   number is normally encoded in the instruction.  So use SYS_syscall.  */
-+#undef INTERNAL_SYSCALL_NCS
-+#define INTERNAL_SYSCALL_NCS(number, err, nr, args...)		\
-+	INTERNAL_SYSCALL_NCS_##nr (number, err, args)
-+
-+#define INTERNAL_SYSCALL_NCS_0(number, err, args...)		\
-+	INTERNAL_SYSCALL (syscall, err, 1, number, args)
-+#define INTERNAL_SYSCALL_NCS_1(number, err, args...)		\
-+	INTERNAL_SYSCALL (syscall, err, 2, number, args)
-+#define INTERNAL_SYSCALL_NCS_2(number, err, args...)		\
-+	INTERNAL_SYSCALL (syscall, err, 3, number, args)
-+#define INTERNAL_SYSCALL_NCS_3(number, err, args...)		\
-+	INTERNAL_SYSCALL (syscall, err, 4, number, args)
-+#define INTERNAL_SYSCALL_NCS_4(number, err, args...)		\
-+	INTERNAL_SYSCALL (syscall, err, 5, number, args)
-+#define INTERNAL_SYSCALL_NCS_5(number, err, args...)		\
-+	INTERNAL_SYSCALL (syscall, err, 6, number, args)
-+#endif
-+
- #endif	/* __ASSEMBLER__ */
- #endif /* linux/arm/sysdep.h */
--- 
-2.7.4
-
diff --git a/package/uclibc/0001-arm-fix-compile-in-thumb-mode.patch b/package/uclibc/0001-arm-fix-compile-in-thumb-mode.patch
new file mode 100644
index 0000000..43fcb6f
--- /dev/null
+++ b/package/uclibc/0001-arm-fix-compile-in-thumb-mode.patch
@@ -0,0 +1,48 @@
+From bbd7151f7980c7d075fe652331f01d3aadc73e42 Mon Sep 17 00:00:00 2001
+From: Waldemar Brodkorb <wbx@uclibc-ng.org>
+Date: Mon, 8 Aug 2016 06:41:03 +0200
+Subject: [PATCH] arm: fix compile in thumb mode
+
+Fix a regression introduced by commit
+0550ecce0e6580c5ad34e9a9a39ff18ccf8774f9
+
+Reported by Buildroot developers.
+
+Embedded test must be extented to ARMv7 thumb2 builds to
+find such regressions next time. It wasn't triggered by a
+cortex-m4 ARM noMMU build.
+
+[yann.morin.1998 at free.fr: backport from upstream]
+Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
+---
+ libc/sysdeps/linux/arm/bits/syscalls.h | 7 +++----
+ 1 file changed, 3 insertions(+), 4 deletions(-)
+
+diff --git a/libc/sysdeps/linux/arm/bits/syscalls.h b/libc/sysdeps/linux/arm/bits/syscalls.h
+index 5b30564..6c62a9e 100644
+--- a/libc/sysdeps/linux/arm/bits/syscalls.h
++++ b/libc/sysdeps/linux/arm/bits/syscalls.h
+@@ -43,6 +43,9 @@
+    })									\
+ )
+ 
++#define INTERNAL_SYSCALL_ARM(name, err, nr, args...)           \
++	INTERNAL_SYSCALL_NCS(__ARM_NR_##name, err, nr, args)
++
+ #if defined(__thumb__)
+ /* We can't use push/pop inside the asm because that breaks
+    unwinding (ie. thread cancellation).
+@@ -83,10 +86,6 @@
+      }									\
+      (int) __internal_sys_result; }) \
+ )
+-
+-#undef INTERNAL_SYSCALL_ARM
+-#define INTERNAL_SYSCALL_ARM(name, err, nr, args...)           \
+-	INTERNAL_SYSCALL_NCS(__ARM_NR_##name, err, nr, args)
+ #endif
+ 
+ #define INTERNAL_SYSCALL_ERROR_P(val, err) \
+-- 
+2.7.4
+
