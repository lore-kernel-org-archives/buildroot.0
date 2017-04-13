From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Thu, 13 Apr 2017 17:07:36 +0200
Subject: [Buildroot] [PATCH 1/2] configs/telit_evk_pro3: add support for gcc
	5
Message-ID: <20170413150737.18203-1-fabio.porcedda@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Use two official kernel patches to add support for gcc 5:

commit 71458cfc782eafe4b27656e078d379a34e472adf
kernel: add support for gcc 5

commit aeea3592a13bf12861943e44fc48f1f270941f8d
ARM: 8158/1: LLVMLinux: use static inline in ARM ftrace.h

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
---
 .../linux/0001-kernel-add-support-for-gcc-5.patch  | 97 ++++++++++++++++++++++
 ...LLVMLinux-use-static-inline-in-ARM-ftrace.patch | 52 ++++++++++++
 2 files changed, 149 insertions(+)
 create mode 100644 board/telit/evk-pro3/patches/linux/0001-kernel-add-support-for-gcc-5.patch
 create mode 100644 board/telit/evk-pro3/patches/linux/0002-ARM-8158-1-LLVMLinux-use-static-inline-in-ARM-ftrace.patch

diff --git a/board/telit/evk-pro3/patches/linux/0001-kernel-add-support-for-gcc-5.patch b/board/telit/evk-pro3/patches/linux/0001-kernel-add-support-for-gcc-5.patch
new file mode 100644
index 000000000..3aba910f8
--- /dev/null
+++ b/board/telit/evk-pro3/patches/linux/0001-kernel-add-support-for-gcc-5.patch
@@ -0,0 +1,97 @@
+From 71458cfc782eafe4b27656e078d379a34e472adf Mon Sep 17 00:00:00 2001
+From: Sasha Levin <sasha.levin@oracle.com>
+Date: Mon, 13 Oct 2014 15:51:05 -0700
+Subject: [PATCH] kernel: add support for gcc 5
+
+We're missing include/linux/compiler-gcc5.h which is required now
+because gcc branched off to v5 in trunk.
+
+Just copy the relevant bits out of include/linux/compiler-gcc4.h,
+no new code is added as of now.
+
+This fixes a build error when using gcc 5.
+
+Signed-off-by: Sasha Levin <sasha.levin@oracle.com>
+Cc: <stable@vger.kernel.org>
+Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
+Signed-off-by: Linus Torvalds <torvalds@linux-foundation.org>
+---
+ include/linux/compiler-gcc5.h | 66 +++++++++++++++++++++++++++++++++++++++++++
+ 1 file changed, 66 insertions(+)
+ create mode 100644 include/linux/compiler-gcc5.h
+
+diff --git a/include/linux/compiler-gcc5.h b/include/linux/compiler-gcc5.h
+new file mode 100644
+index 000000000000..cdd1cc202d51
+--- /dev/null
++++ b/include/linux/compiler-gcc5.h
+@@ -0,0 +1,66 @@
++#ifndef __LINUX_COMPILER_H
++#error "Please don't include <linux/compiler-gcc5.h> directly, include <linux/compiler.h> instead."
++#endif
++
++#define __used				__attribute__((__used__))
++#define __must_check			__attribute__((warn_unused_result))
++#define __compiler_offsetof(a, b)	__builtin_offsetof(a, b)
++
++/* Mark functions as cold. gcc will assume any path leading to a call
++   to them will be unlikely.  This means a lot of manual unlikely()s
++   are unnecessary now for any paths leading to the usual suspects
++   like BUG(), printk(), panic() etc. [but let's keep them for now for
++   older compilers]
++
++   Early snapshots of gcc 4.3 don't support this and we can't detect this
++   in the preprocessor, but we can live with this because they're unreleased.
++   Maketime probing would be overkill here.
++
++   gcc also has a __attribute__((__hot__)) to move hot functions into
++   a special section, but I don't see any sense in this right now in
++   the kernel context */
++#define __cold			__attribute__((__cold__))
++
++#define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
++
++#ifndef __CHECKER__
++# define __compiletime_warning(message) __attribute__((warning(message)))
++# define __compiletime_error(message) __attribute__((error(message)))
++#endif /* __CHECKER__ */
++
++/*
++ * Mark a position in code as unreachable.  This can be used to
++ * suppress control flow warnings after asm blocks that transfer
++ * control elsewhere.
++ *
++ * Early snapshots of gcc 4.5 don't support this and we can't detect
++ * this in the preprocessor, but we can live with this because they're
++ * unreleased.  Really, we need to have autoconf for the kernel.
++ */
++#define unreachable() __builtin_unreachable()
++
++/* Mark a function definition as prohibited from being cloned. */
++#define __noclone	__attribute__((__noclone__))
++
++/*
++ * Tell the optimizer that something else uses this function or variable.
++ */
++#define __visible __attribute__((externally_visible))
++
++/*
++ * GCC 'asm goto' miscompiles certain code sequences:
++ *
++ *   http://gcc.gnu.org/bugzilla/show_bug.cgi?id=58670
++ *
++ * Work it around via a compiler barrier quirk suggested by Jakub Jelinek.
++ * Fixed in GCC 4.8.2 and later versions.
++ *
++ * (asm goto is automatically volatile - the naming reflects this.)
++ */
++#define asm_volatile_goto(x...)	do { asm goto(x); asm (""); } while (0)
++
++#ifdef CONFIG_ARCH_USE_BUILTIN_BSWAP
++#define __HAVE_BUILTIN_BSWAP32__
++#define __HAVE_BUILTIN_BSWAP64__
++#define __HAVE_BUILTIN_BSWAP16__
++#endif /* CONFIG_ARCH_USE_BUILTIN_BSWAP */
+-- 
+2.12.2
+
diff --git a/board/telit/evk-pro3/patches/linux/0002-ARM-8158-1-LLVMLinux-use-static-inline-in-ARM-ftrace.patch b/board/telit/evk-pro3/patches/linux/0002-ARM-8158-1-LLVMLinux-use-static-inline-in-ARM-ftrace.patch
new file mode 100644
index 000000000..00de10988
--- /dev/null
+++ b/board/telit/evk-pro3/patches/linux/0002-ARM-8158-1-LLVMLinux-use-static-inline-in-ARM-ftrace.patch
@@ -0,0 +1,52 @@
+From aeea3592a13bf12861943e44fc48f1f270941f8d Mon Sep 17 00:00:00 2001
+From: Behan Webster <behanw@converseincode.com>
+Date: Wed, 24 Sep 2014 01:06:46 +0100
+Subject: [PATCH] ARM: 8158/1: LLVMLinux: use static inline in ARM ftrace.h
+
+With compilers which follow the C99 standard (like modern versions of gcc and
+clang), "extern inline" does the wrong thing (emits code for an externally
+linkable version of the inline function). In this case using static inline
+and removing the NULL version of return_address in return_address.c does
+the right thing.
+
+Signed-off-by: Behan Webster <behanw@converseincode.com>
+Reviewed-by: Mark Charlebois <charlebm@gmail.com>
+Acked-by: Steven Rostedt <rostedt@goodmis.org>
+Signed-off-by: Russell King <rmk+kernel@arm.linux.org.uk>
+---
+ arch/arm/include/asm/ftrace.h    | 2 +-
+ arch/arm/kernel/return_address.c | 5 -----
+ 2 files changed, 1 insertion(+), 6 deletions(-)
+
+diff --git a/arch/arm/include/asm/ftrace.h b/arch/arm/include/asm/ftrace.h
+index 39eb16b0066f..bfe2a2f5a644 100644
+--- a/arch/arm/include/asm/ftrace.h
++++ b/arch/arm/include/asm/ftrace.h
+@@ -45,7 +45,7 @@ void *return_address(unsigned int);
+ 
+ #else
+ 
+-extern inline void *return_address(unsigned int level)
++static inline void *return_address(unsigned int level)
+ {
+ 	return NULL;
+ }
+diff --git a/arch/arm/kernel/return_address.c b/arch/arm/kernel/return_address.c
+index fafedd86885d..f6aa84d5b93c 100644
+--- a/arch/arm/kernel/return_address.c
++++ b/arch/arm/kernel/return_address.c
+@@ -63,11 +63,6 @@ void *return_address(unsigned int level)
+ #warning "TODO: return_address should use unwind tables"
+ #endif
+ 
+-void *return_address(unsigned int level)
+-{
+-	return NULL;
+-}
+-
+ #endif /* if defined(CONFIG_FRAME_POINTER) && !defined(CONFIG_ARM_UNWIND) / else */
+ 
+ EXPORT_SYMBOL_GPL(return_address);
+-- 
+2.12.2
+
-- 
2.12.2
