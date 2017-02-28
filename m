From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Tue, 28 Feb 2017 18:39:55 +0100
Subject: [Buildroot] [PATCH 1/7] board: add shared patch to fix linux gcc5
	issues
In-Reply-To: <20170228174001.23830-1-arnout@mind.be>
References: <20170228174001.23830-1-arnout@mind.be>
Message-ID: <20170228174001.23830-2-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We have several defconfigs that suffer from the missing compiler-gcc5.h
issue. The patch is pretty simple and universal, so we can use the same
patch for all defconfigs that require it. To make this easy, create a
separate directory that can be used as BR2_GLOBAL_PATCH_DIR for the
defconfigs that need it.

Instead of simply adding compiler-gcc5.h, we go directly to the patch
that removes compiler-gcc[345].h and puts the gcc version dependencies
directly into compiler-gcc.h. Note that on older kernels this defines
some macros that are not used, but that shouldn't make a difference.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 ...c-integrate-the-various-compiler-gcc-345-.patch | 173 +++++++++++++++++++++
 ...LVMLinux-use-static-inline-in-ARM-ftrace.patch} |  17 +-
 2 files changed, 182 insertions(+), 8 deletions(-)
 create mode 100644 board/linux-gcc-patches/linux/0001-compiler-gcc-integrate-the-various-compiler-gcc-345-.patch
 copy board/{roseapplepi/patches/linux/0003-ARM-8158-1-LLVMLinux-use-static-inline-in-ARM-ftrace.patch => linux-gcc-patches/linux/0002-ARM-8158-1-LLVMLinux-use-static-inline-in-ARM-ftrace.patch} (82%)

diff --git a/board/linux-gcc-patches/linux/0001-compiler-gcc-integrate-the-various-compiler-gcc-345-.patch b/board/linux-gcc-patches/linux/0001-compiler-gcc-integrate-the-various-compiler-gcc-345-.patch
new file mode 100644
index 0000000000..2435d21be0
--- /dev/null
+++ b/board/linux-gcc-patches/linux/0001-compiler-gcc-integrate-the-various-compiler-gcc-345-.patch
@@ -0,0 +1,173 @@
+From cb984d101b30eb7478d32df56a0023e4603cba7f Mon Sep 17 00:00:00 2001
+From: Joe Perches <joe@perches.com>
+Date: Thu, 25 Jun 2015 15:01:02 -0700
+Subject: [PATCH] compiler-gcc: integrate the various compiler-gcc[345].h files
+
+As gcc major version numbers are going to advance rather rapidly in the
+future, there's no real value in separate files for each compiler
+version.
+
+Deduplicate some of the macros #defined in each file too.
+
+Neaten comments using normal kernel commenting style.
+
+[Arnout: don't remove compiler-gcc[345].h to make the patch more universal.
+         These headers are not used anymore, but it doesn't hurt if the files
+         still exist.
+         Also, add GCC_VERSION definition (introduced in v3.9) so the same
+         patch can be applied to pre- and post-v3.9 kernels.]
+
+Signed-off-by: Joe Perches <joe@perches.com>
+Cc: Andi Kleen <andi@firstfloor.org>
+Cc: Michal Marek <mmarek@suse.cz>
+Cc: Segher Boessenkool <segher@kernel.crashing.org>
+Cc: Sasha Levin <levinsasha928@gmail.com>
+Cc: Anton Blanchard <anton@samba.org>
+Cc: Alan Modra <amodra@gmail.com>
+Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
+Signed-off-by: Linus Torvalds <torvalds@linux-foundation.org>
+Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
+---
+ include/linux/compiler-gcc.h  | 120 ++++++++++++++++++++++++++++++++++++++++--
+ 4 files changed, 116 insertions(+), 185 deletions(-)
+
+diff --git a/include/linux/compiler-gcc.h b/include/linux/compiler-gcc.h
+index 5c2c14e3c647..dfaa7b3e9ae9 100644
+--- a/include/linux/compiler-gcc.h
++++ b/include/linux/compiler-gcc.h
+@@ -122,10 +122,128 @@
+ #define __maybe_unused		__attribute__((unused))
+ #define __always_unused		__attribute__((unused))
+ 
+-#define __gcc_header(x) #x
+-#define _gcc_header(x) __gcc_header(linux/compiler-gcc##x.h)
+-#define gcc_header(x) _gcc_header(x)
+-#include gcc_header(__GNUC__)
++/* gcc version specific checks */
++
++#ifndef GCC_VERSION
++#define GCC_VERSION (__GNUC__ * 10000		\
++		    + __GNUC_MINOR__ * 100	\
++		    + __GNUC_PATCHLEVEL__)
++#endif
++
++#if GCC_VERSION < 30200
++# error Sorry, your compiler is too old - please upgrade it.
++#endif
++
++#if GCC_VERSION < 30300
++# define __used			__attribute__((__unused__))
++#else
++# define __used			__attribute__((__used__))
++#endif
++
++#ifdef CONFIG_GCOV_KERNEL
++# if GCC_VERSION < 30400
++#   error "GCOV profiling support for gcc versions below 3.4 not included"
++# endif /* __GNUC_MINOR__ */
++#endif /* CONFIG_GCOV_KERNEL */
++
++#if GCC_VERSION >= 30400
++#define __must_check		__attribute__((warn_unused_result))
++#endif
++
++#if GCC_VERSION >= 40000
++
++/* GCC 4.1.[01] miscompiles __weak */
++#ifdef __KERNEL__
++# if GCC_VERSION >= 40100 &&  GCC_VERSION <= 40101
++#  error Your version of gcc miscompiles the __weak directive
++# endif
++#endif
++
++#define __used			__attribute__((__used__))
++#define __compiler_offsetof(a, b)					\
++	__builtin_offsetof(a, b)
++
++#if GCC_VERSION >= 40100 && GCC_VERSION < 40600
++# define __compiletime_object_size(obj) __builtin_object_size(obj, 0)
++#endif
++
++#if GCC_VERSION >= 40300
++/* Mark functions as cold. gcc will assume any path leading to a call
++ * to them will be unlikely.  This means a lot of manual unlikely()s
++ * are unnecessary now for any paths leading to the usual suspects
++ * like BUG(), printk(), panic() etc. [but let's keep them for now for
++ * older compilers]
++ *
++ * Early snapshots of gcc 4.3 don't support this and we can't detect this
++ * in the preprocessor, but we can live with this because they're unreleased.
++ * Maketime probing would be overkill here.
++ *
++ * gcc also has a __attribute__((__hot__)) to move hot functions into
++ * a special section, but I don't see any sense in this right now in
++ * the kernel context
++ */
++#define __cold			__attribute__((__cold__))
++
++#define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
++
++#ifndef __CHECKER__
++# define __compiletime_warning(message) __attribute__((warning(message)))
++# define __compiletime_error(message) __attribute__((error(message)))
++#endif /* __CHECKER__ */
++#endif /* GCC_VERSION >= 40300 */
++
++#if GCC_VERSION >= 40500
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
++#endif /* GCC_VERSION >= 40500 */
++
++#if GCC_VERSION >= 40600
++/*
++ * Tell the optimizer that something else uses this function or variable.
++ */
++#define __visible	__attribute__((externally_visible))
++#endif
++
++/*
++ * GCC 'asm goto' miscompiles certain code sequences:
++ *
++ *   http://gcc.gnu.org/bugzilla/show_bug.cgi?id=58670
++ *
++ * Work it around via a compiler barrier quirk suggested by Jakub Jelinek.
++ *
++ * (asm goto is automatically volatile - the naming reflects this.)
++ */
++#define asm_volatile_goto(x...)	do { asm goto(x); asm (""); } while (0)
++
++#ifdef CONFIG_ARCH_USE_BUILTIN_BSWAP
++#if GCC_VERSION >= 40400
++#define __HAVE_BUILTIN_BSWAP32__
++#define __HAVE_BUILTIN_BSWAP64__
++#endif
++#if GCC_VERSION >= 40800 || (defined(__powerpc__) && GCC_VERSION >= 40600)
++#define __HAVE_BUILTIN_BSWAP16__
++#endif
++#endif /* CONFIG_ARCH_USE_BUILTIN_BSWAP */
++
++#if GCC_VERSION >= 50000
++#define KASAN_ABI_VERSION 4
++#elif GCC_VERSION >= 40902
++#define KASAN_ABI_VERSION 3
++#endif
++
++#endif	/* gcc version >= 40000 specific checks */
+ 
+ #if !defined(__noclone)
+ #define __noclone	/* not needed */
+-- 
+2.11.0
+
diff --git a/board/roseapplepi/patches/linux/0003-ARM-8158-1-LLVMLinux-use-static-inline-in-ARM-ftrace.patch b/board/linux-gcc-patches/linux/0002-ARM-8158-1-LLVMLinux-use-static-inline-in-ARM-ftrace.patch
similarity index 82%
copy from board/roseapplepi/patches/linux/0003-ARM-8158-1-LLVMLinux-use-static-inline-in-ARM-ftrace.patch
copy to board/linux-gcc-patches/linux/0002-ARM-8158-1-LLVMLinux-use-static-inline-in-ARM-ftrace.patch
index da38f26679..fd2c8666a5 100644
--- a/board/roseapplepi/patches/linux/0003-ARM-8158-1-LLVMLinux-use-static-inline-in-ARM-ftrace.patch
+++ b/board/linux-gcc-patches/linux/0002-ARM-8158-1-LLVMLinux-use-static-inline-in-ARM-ftrace.patch
@@ -1,4 +1,4 @@
-From 8ac9a3f6dbf00d861134bea3f2c930defed6311a Mon Sep 17 00:00:00 2001
+From aeea3592a13bf12861943e44fc48f1f270941f8d Mon Sep 17 00:00:00 2001
 From: Behan Webster <behanw@converseincode.com>
 Date: Wed, 24 Sep 2014 01:06:46 +0100
 Subject: [PATCH] ARM: 8158/1: LLVMLinux: use static inline in ARM ftrace.h
@@ -9,19 +9,20 @@ linkable version of the inline function). In this case using static inline
 and removing the NULL version of return_address in return_address.c does
 the right thing.
 
+[Arnout: this patch is needed to fix the build with gcc5]
+
 Signed-off-by: Behan Webster <behanw@converseincode.com>
 Reviewed-by: Mark Charlebois <charlebm@gmail.com>
 Acked-by: Steven Rostedt <rostedt@goodmis.org>
 Signed-off-by: Russell King <rmk+kernel@arm.linux.org.uk>
-(cherry picked from commit aeea3592a13bf12861943e44fc48f1f270941f8d)
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
 ---
  arch/arm/include/asm/ftrace.h    | 2 +-
  arch/arm/kernel/return_address.c | 5 -----
  2 files changed, 1 insertion(+), 6 deletions(-)
 
 diff --git a/arch/arm/include/asm/ftrace.h b/arch/arm/include/asm/ftrace.h
-index f89515a..2bb8cac 100644
+index 39eb16b0066f..bfe2a2f5a644 100644
 --- a/arch/arm/include/asm/ftrace.h
 +++ b/arch/arm/include/asm/ftrace.h
 @@ -45,7 +45,7 @@ void *return_address(unsigned int);
@@ -34,12 +35,12 @@ index f89515a..2bb8cac 100644
  	return NULL;
  }
 diff --git a/arch/arm/kernel/return_address.c b/arch/arm/kernel/return_address.c
-index 2f8f523..a3b587f 100755
+index fafedd86885d..f6aa84d5b93c 100644
 --- a/arch/arm/kernel/return_address.c
 +++ b/arch/arm/kernel/return_address.c
 @@ -63,11 +63,6 @@ void *return_address(unsigned int level)
- //#warning "TODO: return_address should use unwind tables"
- //#endif
+ #warning "TODO: return_address should use unwind tables"
+ #endif
  
 -void *return_address(unsigned int level)
 -{
@@ -50,5 +51,5 @@ index 2f8f523..a3b587f 100755
  
  EXPORT_SYMBOL_GPL(return_address);
 -- 
-2.10.2
+2.11.0
 
-- 
2.11.0
