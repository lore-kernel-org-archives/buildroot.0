From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  7 Aug 2016 22:44:36 +0200
Subject: [Buildroot] [PATCH 3/3] pcakage/uclibc: fix build on thumb2-only
	arm cpus
In-Reply-To: <cover.1470602446.git.yann.morin.1998@free.fr>
References: <cover.1470602446.git.yann.morin.1998@free.fr>
Message-ID: <f410a42ac202f8266ff8f4ace32f97e5c68ac0fe.1470602446.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add a patch to revert an upstream commit that broke building for armv7
thumb2-only CPUs.

Commit pointed out by Thomas.

Fixes:
    https://travis-ci.org/buildroot/buildroot-defconfig-testing/jobs/150333657
    https://travis-ci.org/buildroot/buildroot-defconfig-testing/jobs/150333658
    ... and all the other atmel_sama5d* defconfigs
    https://travis-ci.org/buildroot/buildroot-defconfig-testing/jobs/150333643
    https://travis-ci.org/buildroot/buildroot-defconfig-testing/jobs/150333644

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...arm-cleanup-redundant-macros-for-syscalls.patch | 150 +++++++++++++++++++++
 1 file changed, 150 insertions(+)
 create mode 100644 package/uclibc/0001-Revert-arm-cleanup-redundant-macros-for-syscalls.patch

diff --git a/package/uclibc/0001-Revert-arm-cleanup-redundant-macros-for-syscalls.patch b/package/uclibc/0001-Revert-arm-cleanup-redundant-macros-for-syscalls.patch
new file mode 100644
index 0000000..184dc62
--- /dev/null
+++ b/package/uclibc/0001-Revert-arm-cleanup-redundant-macros-for-syscalls.patch
@@ -0,0 +1,150 @@
+From cdac8bef6b8e94518f78f2e9182cb3fa0f78a57b Mon Sep 17 00:00:00 2001
+From: "Yann E. MORIN" <yann.morin.1998@free.fr>
+Date: Sun, 7 Aug 2016 21:52:46 +0200
+Subject: [PATCH] Revert "arm: cleanup redundant macros for syscalls"
+
+This reverts commit 0550ecce0e6580c5ad34e9a9a39ff18ccf8774f9.
+---
+ libc/sysdeps/linux/arm/bits/syscalls.h |   4 --
+ libc/sysdeps/linux/arm/sysdep.h        | 111 +++++++++++++++++++++++++++++++++
+ 2 files changed, 111 insertions(+), 4 deletions(-)
+
+diff --git a/libc/sysdeps/linux/arm/bits/syscalls.h b/libc/sysdeps/linux/arm/bits/syscalls.h
+index 5b30564..e447a7b 100644
+--- a/libc/sysdeps/linux/arm/bits/syscalls.h
++++ b/libc/sysdeps/linux/arm/bits/syscalls.h
+@@ -83,10 +83,6 @@
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
+diff --git a/libc/sysdeps/linux/arm/sysdep.h b/libc/sysdeps/linux/arm/sysdep.h
+index 80bf9ec..65d9c2b 100644
+--- a/libc/sysdeps/linux/arm/sysdep.h
++++ b/libc/sysdeps/linux/arm/sysdep.h
+@@ -254,5 +254,116 @@ __local_syscall_error:						\
+ #define UNDOARGS_6 ldmfd sp!, {r4, r5};
+ #define UNDOARGS_7 ldmfd sp!, {r4, r5, r6};
+ 
++#else /* not __ASSEMBLER__ */
++/* Define a macro which expands into the inline wrapper code for a system
++   call.  */
++#undef INLINE_SYSCALL
++#define INLINE_SYSCALL(name, nr, args...)					\
++  ({ unsigned int _inline_sys_result = INTERNAL_SYSCALL (name, , nr, args);	\
++     if (unlikely (INTERNAL_SYSCALL_ERROR_P (_inline_sys_result, )))	\
++       {									\
++	 __set_errno (INTERNAL_SYSCALL_ERRNO (_inline_sys_result, ));		\
++	 _inline_sys_result = (unsigned int) -1;				\
++       }									\
++     (int) _inline_sys_result; })
++
++#undef INTERNAL_SYSCALL_DECL
++#define INTERNAL_SYSCALL_DECL(err) do { } while (0)
++
++#undef INTERNAL_SYSCALL_RAW
++#if defined(__thumb__)
++/* Hide the use of r7 from the compiler, this would be a lot
++ * easier but for the fact that the syscalls can exceed 255.
++ * For the moment the LOAD_ARG_7 is sacrificed.
++ * We can't use push/pop inside the asm because that breaks
++ * unwinding (ie. thread cancellation).
++ */
++#define INTERNAL_SYSCALL_RAW(name, err, nr, args...)		\
++  ({ unsigned int _internal_sys_result;				\
++    {								\
++      int _sys_buf[2];						\
++      register int __a1 __asm__ ("a1");				\
++      register int *_v3 __asm__ ("v3") = _sys_buf;		\
++      LOAD_ARGS_##nr (args)					\
++      *_v3 = (int) (name);					\
++      __asm__ __volatile__ ("str	r7, [v3, #4]\n"		\
++                    "\tldr      r7, [v3]\n"			\
++                    "\tswi      0       @ syscall " #name "\n"	\
++                    "\tldr      r7, [v3, #4]"			\
++                   : "=r" (__a1)				\
++                    : "r" (_v3) ASM_ARGS_##nr			\
++                    : "memory");				\
++      _internal_sys_result = __a1;				\
++    }								\
++    (int) _internal_sys_result; })
++#elif defined(__ARM_EABI__)
++#define INTERNAL_SYSCALL_RAW(name, err, nr, args...)		\
++  ({unsigned int _internal_sys_result;				\
++     {								\
++       register int __a1 __asm__ ("r0"), _nr __asm__ ("r7");	\
++       LOAD_ARGS_##nr (args)					\
++       _nr = name;						\
++       __asm__ __volatile__ ("swi	0x0 @ syscall " #name	\
++		     : "=r" (__a1)				\
++		     : "r" (_nr) ASM_ARGS_##nr			\
++		     : "memory");				\
++       _internal_sys_result = __a1;				\
++     }								\
++     (int) _internal_sys_result; })
++#else /* !defined(__ARM_EABI__) */
++#define INTERNAL_SYSCALL_RAW(name, err, nr, args...)		\
++  ({ unsigned int _internal_sys_result;				\
++     {								\
++       register int __a1 __asm__ ("a1");			\
++       LOAD_ARGS_##nr (args)					\
++       __asm__ __volatile__ ("swi	%1 @ syscall " #name	\
++		     : "=r" (__a1)				\
++		     : "i" (name) ASM_ARGS_##nr			\
++		     : "memory");				\
++       _internal_sys_result = __a1;				\
++     }								\
++     (int) _internal_sys_result; })
++#endif
++
++#undef INTERNAL_SYSCALL
++#define INTERNAL_SYSCALL(name, err, nr, args...)		\
++	INTERNAL_SYSCALL_RAW(SYS_ify(name), err, nr, args)
++
++#undef INTERNAL_SYSCALL_ARM
++#define INTERNAL_SYSCALL_ARM(name, err, nr, args...)		\
++	INTERNAL_SYSCALL_RAW(__ARM_NR_##name, err, nr, args)
++
++#undef INTERNAL_SYSCALL_ERROR_P
++#define INTERNAL_SYSCALL_ERROR_P(val, err) \
++  ((unsigned int) (val) >= 0xfffff001u)
++
++#undef INTERNAL_SYSCALL_ERRNO
++#define INTERNAL_SYSCALL_ERRNO(val, err)	(-(val))
++
++#if defined(__ARM_EABI__)
++#undef INTERNAL_SYSCALL_NCS
++#define INTERNAL_SYSCALL_NCS(number, err, nr, args...)		\
++	INTERNAL_SYSCALL_RAW(number, err, nr, args)
++#else
++/* We can't implement non-constant syscalls directly since the syscall
++   number is normally encoded in the instruction.  So use SYS_syscall.  */
++#undef INTERNAL_SYSCALL_NCS
++#define INTERNAL_SYSCALL_NCS(number, err, nr, args...)		\
++	INTERNAL_SYSCALL_NCS_##nr (number, err, args)
++
++#define INTERNAL_SYSCALL_NCS_0(number, err, args...)		\
++	INTERNAL_SYSCALL (syscall, err, 1, number, args)
++#define INTERNAL_SYSCALL_NCS_1(number, err, args...)		\
++	INTERNAL_SYSCALL (syscall, err, 2, number, args)
++#define INTERNAL_SYSCALL_NCS_2(number, err, args...)		\
++	INTERNAL_SYSCALL (syscall, err, 3, number, args)
++#define INTERNAL_SYSCALL_NCS_3(number, err, args...)		\
++	INTERNAL_SYSCALL (syscall, err, 4, number, args)
++#define INTERNAL_SYSCALL_NCS_4(number, err, args...)		\
++	INTERNAL_SYSCALL (syscall, err, 5, number, args)
++#define INTERNAL_SYSCALL_NCS_5(number, err, args...)		\
++	INTERNAL_SYSCALL (syscall, err, 6, number, args)
++#endif
++
+ #endif	/* __ASSEMBLER__ */
+ #endif /* linux/arm/sysdep.h */
+-- 
+2.7.4
+
-- 
2.7.4
