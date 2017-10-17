From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 17 Oct 2017 22:40:42 +0200
Subject: [Buildroot] [git commit] package/gcc: bump to 5.5.0
Message-ID: <20171017203434.16D367FA5F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1960ad837b10fcad2fe2e08d9d6537859b02d1f1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Remove xtensa patches included in this release:
872-xtensa-use-unwind-dw2-fde-dip-instead-of-unwind-dw2-.patch
873-xtensa-fix-_Unwind_GetCFA.patch
876-xtensa-Fix-PR-target-78603.patch
877-xtensa-fix-PR-target-82181.patch

Remove upstream patch:
942-asan-fix-missing-include-signal-h.patch

Remove backported patches for glibc >= 2.26
943-Use-ucontext_t-not-struct-ucontext-in-linux-unwind.h.patch
944-sanitizer-linux.patch

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...unwind-dw2-fde-dip-instead-of-unwind-dw2-.patch |  31 ----
 .../gcc/5.4.0/873-xtensa-fix-_Unwind_GetCFA.patch  |  40 -----
 .../gcc/5.4.0/876-xtensa-Fix-PR-target-78603.patch |  37 ----
 .../gcc/5.4.0/877-xtensa-fix-PR-target-82181.patch |  31 ----
 .../942-asan-fix-missing-include-signal-h.patch    |  36 ----
 ...t_t-not-struct-ucontext-in-linux-unwind.h.patch | 192 ---------------------
 package/gcc/5.4.0/944-sanitizer-linux.patch        |  91 ----------
 package/gcc/{5.4.0 => 5.5.0}/100-uclibc-conf.patch |   0
 ...gcc-fix-typo-for-powerpc-e6500-cpu_is_64b.patch |   0
 .../{5.4.0 => 5.5.0}/301-missing-execinfo_h.patch  |   0
 .../810-arm-softfloat-libgcc.patch                 |   0
 .../{5.4.0 => 5.5.0}/830-arm_unbreak_armv4t.patch  |   0
 ...et-70473-Reduce-size-of-Cortex-A8-automat.patch |   0
 .../840-microblaze-enable-dwarf-eh-support.patch   |   0
 .../850-libstdcxx-uclibc-c99.patch                 |   0
 package/gcc/{5.4.0 => 5.5.0}/860-cilk-wchar.patch  |   0
 .../870-xtensa-add-mauto-litpools-option.patch     |   0
 .../871-xtensa-reimplement-register-spilling.patch |   0
 .../874-xtensa-add-uclinux-support.patch           |   0
 .../875-xtensa-implement-trap-pattern.patch        |   0
 .../880-gcc-nios2-Add-IJMP_REGS-enum.patch         |   0
 .../{5.4.0 => 5.5.0}/890-fix-m68k-compile.patch    |   0
 .../{5.4.0 => 5.5.0}/891-fix-m68k-uclinux.patch    |   0
 .../900-libitm-fixes-for-musl-support.patch        |   0
 .../901-fixincludes-update-for-musl-support.patch  |   0
 .../{5.4.0 => 5.5.0}/902-unwind-fix-for-musl.patch |   0
 ...dc++-libgfortran-gthr-workaround-for-musl.patch |   0
 .../{5.4.0 => 5.5.0}/904-musl-libc-config.patch    |   0
 .../905-add-musl-support-to-gcc.patch              |   0
 .../{5.4.0 => 5.5.0}/906-mips-musl-support.patch   |   0
 .../{5.4.0 => 5.5.0}/907-x86-musl-support.patch    |   0
 .../{5.4.0 => 5.5.0}/908-arm-musl-support.patch    |   0
 .../909-aarch64-musl-support.patch                 |   0
 .../910-microblaze-musl-and-uclibc.patch           |   0
 .../{5.4.0 => 5.5.0}/911-ppc-musl-support.patch    |   0
 .../gcc/{5.4.0 => 5.5.0}/912-sh-musl-support.patch |   0
 .../930-libgcc-disable-split-stack-nothreads.patch |   0
 .../940-uclinux-enable-threads.patch               |   0
 .../941-mips-Add-support-for-mips-r6-musl.patch    |   0
 package/gcc/Config.in.host                         |   2 +-
 package/gcc/gcc.hash                               |   4 +-
 package/gcc/gcc.mk                                 |   6 +-
 42 files changed, 6 insertions(+), 464 deletions(-)

diff --git a/package/gcc/5.4.0/872-xtensa-use-unwind-dw2-fde-dip-instead-of-unwind-dw2-.patch b/package/gcc/5.4.0/872-xtensa-use-unwind-dw2-fde-dip-instead-of-unwind-dw2-.patch
deleted file mode 100644
index 9707f68..0000000
--- a/package/gcc/5.4.0/872-xtensa-use-unwind-dw2-fde-dip-instead-of-unwind-dw2-.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 7d7a85f75ba218df4a4226e95865fc8fa561cb86 Mon Sep 17 00:00:00 2001
-From: Max Filippov <jcmvbkbc@gmail.com>
-Date: Fri, 14 Aug 2015 02:45:02 +0300
-Subject: [PATCH 2/3] xtensa: use unwind-dw2-fde-dip instead of unwind-dw2-fde
-
-This allows having exception cleanup code in binaries that don't
-register their unwind tables.
-
-2015-08-18  Max Filippov  <jcmvbkbc@gmail.com>
-libgcc/
-	* config/xtensa/t-windowed (LIB2ADDEH): Replace unwind-dw2-fde
-	with unwind-dw2-fde-dip.
-
-Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
----
-Backported from: r226963
-
- libgcc/config/xtensa/t-windowed | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/libgcc/config/xtensa/t-windowed b/libgcc/config/xtensa/t-windowed
-index 7d9e9db..a99156c 100644
---- a/libgcc/config/xtensa/t-windowed
-+++ b/libgcc/config/xtensa/t-windowed
-@@ -1,2 +1,2 @@
- LIB2ADDEH = $(srcdir)/config/xtensa/unwind-dw2-xtensa.c \
--   $(srcdir)/unwind-dw2-fde.c $(srcdir)/unwind-sjlj.c $(srcdir)/unwind-c.c
-+   $(srcdir)/unwind-dw2-fde-dip.c $(srcdir)/unwind-sjlj.c $(srcdir)/unwind-c.c
--- 
-1.8.1.4
-
diff --git a/package/gcc/5.4.0/873-xtensa-fix-_Unwind_GetCFA.patch b/package/gcc/5.4.0/873-xtensa-fix-_Unwind_GetCFA.patch
deleted file mode 100644
index 2d8eb7c..0000000
--- a/package/gcc/5.4.0/873-xtensa-fix-_Unwind_GetCFA.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From b33905dc310f475ddbde4c9fb7230724b2068a2b Mon Sep 17 00:00:00 2001
-From: Max Filippov <jcmvbkbc@gmail.com>
-Date: Sat, 15 Aug 2015 05:12:11 +0300
-Subject: [PATCH 3/3] xtensa: fix _Unwind_GetCFA
-
-Returning context->cfa in _Unwind_GetCFA makes CFA point one stack frame
-higher than what was actually used by code at context->ra. This results
-in invalid CFA value in signal frames and premature unwinding completion
-in forced unwinding used by uClibc NPTL thread cancellation.
-Returning context->sp from _Unwind_GetCFA makes all CFA values valid and
-matching code that used them.
-
-2015-08-18  Max Filippov  <jcmvbkbc@gmail.com>
-libgcc/
-	* config/xtensa/unwind-dw2-xtensa.c (_Unwind_GetCFA): Return
-	context->sp instead of context->cfa.
-
-Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
----
-Backported from: r226964
-
- libgcc/config/xtensa/unwind-dw2-xtensa.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/libgcc/config/xtensa/unwind-dw2-xtensa.c b/libgcc/config/xtensa/unwind-dw2-xtensa.c
-index 82b0e63..8e579c7 100644
---- a/libgcc/config/xtensa/unwind-dw2-xtensa.c
-+++ b/libgcc/config/xtensa/unwind-dw2-xtensa.c
-@@ -130,7 +130,7 @@ _Unwind_GetGR (struct _Unwind_Context *context, int index)
- _Unwind_Word
- _Unwind_GetCFA (struct _Unwind_Context *context)
- {
--  return (_Unwind_Ptr) context->cfa;
-+  return (_Unwind_Ptr) context->sp;
- }
- 
- /* Overwrite the saved value for register INDEX in CONTEXT with VAL.  */
--- 
-1.8.1.4
-
diff --git a/package/gcc/5.4.0/876-xtensa-Fix-PR-target-78603.patch b/package/gcc/5.4.0/876-xtensa-Fix-PR-target-78603.patch
deleted file mode 100644
index 628268a..0000000
--- a/package/gcc/5.4.0/876-xtensa-Fix-PR-target-78603.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From e178289a12a829ec47dc5038d91401f65381e71d Mon Sep 17 00:00:00 2001
-From: Max Filippov <jcmvbkbc@gmail.com>
-Date: Tue, 29 Nov 2016 13:09:17 -0800
-Subject: [PATCH 8/8] xtensa: Fix PR target/78603
-
-2016-11-29  Max Filippov  <jcmvbkbc@gmail.com>
-gcc/
-	* config/xtensa/xtensa.c (hwloop_optimize): Don't emit zero
-	overhead loop start between a call and its CALL_ARG_LOCATION
-	note.
-
-Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
----
-Backported from: r242979
-
- gcc/config/xtensa/xtensa.c | 5 ++++-
- 1 file changed, 4 insertions(+), 1 deletion(-)
-
-diff --git a/gcc/config/xtensa/xtensa.c b/gcc/config/xtensa/xtensa.c
-index 206ff80..36ab1e3 100644
---- a/gcc/config/xtensa/xtensa.c
-+++ b/gcc/config/xtensa/xtensa.c
-@@ -4182,7 +4182,10 @@ hwloop_optimize (hwloop_info loop)
-       entry_after = BB_END (entry_bb);
-       while (DEBUG_INSN_P (entry_after)
-              || (NOTE_P (entry_after)
--                 && NOTE_KIND (entry_after) != NOTE_INSN_BASIC_BLOCK))
-+                 && NOTE_KIND (entry_after) != NOTE_INSN_BASIC_BLOCK
-+		 /* Make sure we don't split a call and its corresponding
-+		    CALL_ARG_LOCATION note.  */
-+                 && NOTE_KIND (entry_after) != NOTE_INSN_CALL_ARG_LOCATION))
-         entry_after = PREV_INSN (entry_after);
- 
-       emit_insn_after (seq, entry_after);
--- 
-2.1.4
-
diff --git a/package/gcc/5.4.0/877-xtensa-fix-PR-target-82181.patch b/package/gcc/5.4.0/877-xtensa-fix-PR-target-82181.patch
deleted file mode 100644
index cbcca00..0000000
--- a/package/gcc/5.4.0/877-xtensa-fix-PR-target-82181.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 136e0f6b0c0acbe547894c6f8c855e3246c558b4 Mon Sep 17 00:00:00 2001
-From: jcmvbkbc <jcmvbkbc@138bc75d-0d04-0410-961f-82ee72b054a4>
-Date: Mon, 11 Sep 2017 21:53:38 +0000
-Subject: [PATCH] xtensa: fix PR target/82181
-
-2017-09-11  Max Filippov  <jcmvbkbc@gmail.com>
-gcc/
-	Backport from mainline
-	* config/xtensa/xtensa.c (xtensa_mem_offset): Check that both
-	words of DImode object are reachable by xtensa_uimm8x4 access.
-
-Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
----
- gcc/config/xtensa/xtensa.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/gcc/config/xtensa/xtensa.c b/gcc/config/xtensa/xtensa.c
-index 8e62d631bce0..a30aa1bcfc33 100644
---- a/gcc/config/xtensa/xtensa.c
-+++ b/gcc/config/xtensa/xtensa.c
-@@ -637,6 +637,7 @@ xtensa_mem_offset (unsigned v, machine_mode mode)
-     case HImode:
-       return xtensa_uimm8x2 (v);
- 
-+    case DImode:
-     case DFmode:
-       return (xtensa_uimm8x4 (v) && xtensa_uimm8x4 (v + 4));
- 
--- 
-2.1.4
-
diff --git a/package/gcc/5.4.0/942-asan-fix-missing-include-signal-h.patch b/package/gcc/5.4.0/942-asan-fix-missing-include-signal-h.patch
deleted file mode 100644
index 5f00c04..0000000
--- a/package/gcc/5.4.0/942-asan-fix-missing-include-signal-h.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 205aa8e97bab553e5e6fe45896325e97962de704 Mon Sep 17 00:00:00 2001
-From: Rolf Eike Beer <eb@emlix.com>
-Date: Wed, 8 Feb 2017 11:42:52 +0100
-Subject: [PATCH] asan: fix missing include of signal.h
-
-This breaks when building gcc 4.9.4 / 5.4.0 with
-target_platform=powerpc-unknown-linux-gnu with glibc 2.25:
-
-../../../../gcc-host/libsanitizer/asan/asan_linux.cc: In function 'bool __asan::AsanInterceptsSignal(int)':
-../../../../gcc-host/libsanitizer/asan/asan_linux.cc:222:20: error: 'SIGSEGV' was not declared in this scope
-   return signum == SIGSEGV && common_flags()->handle_segv;
-
-This has been verified to apply to at least 4.9.4 and up to 5.4,
-the code has been reworked for gcc 6.
-
-Resolves (Buildroot) Bug: https://bugs.busybox.net/show_bug.cgi?id=10061
-
-Upstream: https://patchwork.ozlabs.org/patch/725596/
-
-Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
----
- libsanitizer/asan/asan_linux.cc | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/libsanitizer/asan/asan_linux.cc b/libsanitizer/asan/asan_linux.cc
-index c504168..59087b9 100644
---- a/libsanitizer/asan/asan_linux.cc
-+++ b/libsanitizer/asan/asan_linux.cc
-@@ -29,6 +29,7 @@
- #include <dlfcn.h>
- #include <fcntl.h>
- #include <pthread.h>
-+#include <signal.h>
- #include <stdio.h>
- #include <unistd.h>
- #include <unwind.h>
diff --git a/package/gcc/5.4.0/943-Use-ucontext_t-not-struct-ucontext-in-linux-unwind.h.patch b/package/gcc/5.4.0/943-Use-ucontext_t-not-struct-ucontext-in-linux-unwind.h.patch
deleted file mode 100644
index 4c3385d..0000000
--- a/package/gcc/5.4.0/943-Use-ucontext_t-not-struct-ucontext-in-linux-unwind.h.patch
+++ /dev/null
@@ -1,192 +0,0 @@
-From c287e88cc3743bfa7e5719bc4dee327aa3950051 Mon Sep 17 00:00:00 2001
-From: jsm28 <jsm28@138bc75d-0d04-0410-961f-82ee72b054a4>
-Date: Tue, 4 Jul 2017 10:25:10 +0000
-Subject: [PATCH] Use ucontext_t not struct ucontext in linux-unwind.h files.
-
-Current glibc no longer gives the ucontext_t type the tag struct
-ucontext, to conform with POSIX namespace rules.  This requires
-various linux-unwind.h files in libgcc, that were previously using
-struct ucontext, to be fixed to use ucontext_t instead.  This is
-similar to the removal of the struct siginfo tag from siginfo_t some
-years ago.
-
-This patch changes those files to use ucontext_t instead.  As the
-standard name that should be unconditionally safe, so this is not
-restricted to architectures supported by glibc, or conditioned on the
-glibc version.
-
-Tested compilation together with current glibc with glibc's
-build-many-glibcs.py.
-
-	* config/aarch64/linux-unwind.h (aarch64_fallback_frame_state),
-	config/alpha/linux-unwind.h (alpha_fallback_frame_state),
-	config/bfin/linux-unwind.h (bfin_fallback_frame_state),
-	config/i386/linux-unwind.h (x86_64_fallback_frame_state,
-	x86_fallback_frame_state), config/m68k/linux-unwind.h (struct
-	uw_ucontext), config/nios2/linux-unwind.h (struct nios2_ucontext),
-	config/pa/linux-unwind.h (pa32_fallback_frame_state),
-	config/sh/linux-unwind.h (sh_fallback_frame_state),
-	config/tilepro/linux-unwind.h (tile_fallback_frame_state),
-	config/xtensa/linux-unwind.h (xtensa_fallback_frame_state): Use
-	ucontext_t instead of struct ucontext.
-
-git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/branches/gcc-5-branch at 249958 138bc75d-0d04-0410-961f-82ee72b054a4
-
-(cherry picked from commit ecf0d1a107133c715763940c2b197aa814710e1b)
-[Romain rebase on 5.4]
-Signed-off-by: Romain Naour <romain.naour@gmail.com>
----
- libgcc/config/aarch64/linux-unwind.h | 2 +-
- libgcc/config/alpha/linux-unwind.h   | 2 +-
- libgcc/config/bfin/linux-unwind.h    | 2 +-
- libgcc/config/i386/linux-unwind.h    | 4 ++--
- libgcc/config/m68k/linux-unwind.h    | 2 +-
- libgcc/config/nios2/linux-unwind.h   | 2 +-
- libgcc/config/pa/linux-unwind.h      | 2 +-
- libgcc/config/sh/linux-unwind.h      | 2 +-
- libgcc/config/tilepro/linux-unwind.h | 2 +-
- libgcc/config/xtensa/linux-unwind.h  | 2 +-
- 10 files changed, 11 insertions(+), 11 deletions(-)
-
-diff --git a/libgcc/config/aarch64/linux-unwind.h b/libgcc/config/aarch64/linux-unwind.h
-index 86d17b1..909f68f 100644
---- a/libgcc/config/aarch64/linux-unwind.h
-+++ b/libgcc/config/aarch64/linux-unwind.h
-@@ -52,7 +52,7 @@ aarch64_fallback_frame_state (struct _Unwind_Context *context,
-   struct rt_sigframe
-   {
-     siginfo_t info;
--    struct ucontext uc;
-+    ucontext_t uc;
-   };
- 
-   struct rt_sigframe *rt_;
-diff --git a/libgcc/config/alpha/linux-unwind.h b/libgcc/config/alpha/linux-unwind.h
-index d65474f..9a226b1 100644
---- a/libgcc/config/alpha/linux-unwind.h
-+++ b/libgcc/config/alpha/linux-unwind.h
-@@ -51,7 +51,7 @@ alpha_fallback_frame_state (struct _Unwind_Context *context,
-     {
-       struct rt_sigframe {
- 	siginfo_t info;
--	struct ucontext uc;
-+	ucontext_t uc;
-       } *rt_ = context->cfa;
-       sc = &rt_->uc.uc_mcontext;
-     }
-diff --git a/libgcc/config/bfin/linux-unwind.h b/libgcc/config/bfin/linux-unwind.h
-index 0c270e4..7fa95d2 100644
---- a/libgcc/config/bfin/linux-unwind.h
-+++ b/libgcc/config/bfin/linux-unwind.h
-@@ -52,7 +52,7 @@ bfin_fallback_frame_state (struct _Unwind_Context *context,
- 	void *puc;
- 	char retcode[8];
- 	siginfo_t info;
--	struct ucontext uc;
-+	ucontext_t uc;
-       } *rt_ = context->cfa;
- 
-       /* The void * cast is necessary to avoid an aliasing warning.
-diff --git a/libgcc/config/i386/linux-unwind.h b/libgcc/config/i386/linux-unwind.h
-index e54bf73..d35fc45 100644
---- a/libgcc/config/i386/linux-unwind.h
-+++ b/libgcc/config/i386/linux-unwind.h
-@@ -58,7 +58,7 @@ x86_64_fallback_frame_state (struct _Unwind_Context *context,
-   if (*(unsigned char *)(pc+0) == 0x48
-       && *(unsigned long long *)(pc+1) == RT_SIGRETURN_SYSCALL)
-     {
--      struct ucontext *uc_ = context->cfa;
-+      ucontext_t *uc_ = context->cfa;
-       /* The void * cast is necessary to avoid an aliasing warning.
-          The aliasing warning is correct, but should not be a problem
-          because it does not alias anything.  */
-@@ -138,7 +138,7 @@ x86_fallback_frame_state (struct _Unwind_Context *context,
- 	siginfo_t *pinfo;
- 	void *puc;
- 	siginfo_t info;
--	struct ucontext uc;
-+	ucontext_t uc;
-       } *rt_ = context->cfa;
-       /* The void * cast is necessary to avoid an aliasing warning.
-          The aliasing warning is correct, but should not be a problem
-diff --git a/libgcc/config/m68k/linux-unwind.h b/libgcc/config/m68k/linux-unwind.h
-index fb79a4d..b2f5ea4 100644
---- a/libgcc/config/m68k/linux-unwind.h
-+++ b/libgcc/config/m68k/linux-unwind.h
-@@ -33,7 +33,7 @@ see the files COPYING3 and COPYING.RUNTIME respectively.  If not, see
- /* <sys/ucontext.h> is unfortunately broken right now.  */
- struct uw_ucontext {
- 	unsigned long	  uc_flags;
--	struct ucontext  *uc_link;
-+	ucontext_t	 *uc_link;
- 	stack_t		  uc_stack;
- 	mcontext_t	  uc_mcontext;
- 	unsigned long	  uc_filler[80];
-diff --git a/libgcc/config/nios2/linux-unwind.h b/libgcc/config/nios2/linux-unwind.h
-index dff1c20..1d88afe 100644
---- a/libgcc/config/nios2/linux-unwind.h
-+++ b/libgcc/config/nios2/linux-unwind.h
-@@ -38,7 +38,7 @@ struct nios2_mcontext {
- 
- struct nios2_ucontext {
-   unsigned long uc_flags;
--  struct ucontext *uc_link;
-+  ucontext_t *uc_link;
-   stack_t uc_stack;
-   struct nios2_mcontext uc_mcontext;
-   sigset_t uc_sigmask;	/* mask last for extensibility */
-diff --git a/libgcc/config/pa/linux-unwind.h b/libgcc/config/pa/linux-unwind.h
-index 0149468..9157535 100644
---- a/libgcc/config/pa/linux-unwind.h
-+++ b/libgcc/config/pa/linux-unwind.h
-@@ -80,7 +80,7 @@ pa32_fallback_frame_state (struct _Unwind_Context *context,
-   struct sigcontext *sc;
-   struct rt_sigframe {
-     siginfo_t info;
--    struct ucontext uc;
-+    ucontext_t uc;
-   } *frame;
- 
-   /* rt_sigreturn trampoline:
-diff --git a/libgcc/config/sh/linux-unwind.h b/libgcc/config/sh/linux-unwind.h
-index e63091f..67033f0 100644
---- a/libgcc/config/sh/linux-unwind.h
-+++ b/libgcc/config/sh/linux-unwind.h
-@@ -180,7 +180,7 @@ sh_fallback_frame_state (struct _Unwind_Context *context,
-     {
-       struct rt_sigframe {
- 	siginfo_t info;
--	struct ucontext uc;
-+	ucontext_t uc;
-       } *rt_ = context->cfa;
-       /* The void * cast is necessary to avoid an aliasing warning.
-          The aliasing warning is correct, but should not be a problem
-diff --git a/libgcc/config/tilepro/linux-unwind.h b/libgcc/config/tilepro/linux-unwind.h
-index fd83ba7..e3c9ef0 100644
---- a/libgcc/config/tilepro/linux-unwind.h
-+++ b/libgcc/config/tilepro/linux-unwind.h
-@@ -61,7 +61,7 @@ tile_fallback_frame_state (struct _Unwind_Context *context,
-   struct rt_sigframe {
-     unsigned char save_area[C_ABI_SAVE_AREA_SIZE];
-     siginfo_t info;
--    struct ucontext uc;
-+    ucontext_t uc;
-   } *rt_;
- 
-   /* Return if this is not a signal handler.  */
-diff --git a/libgcc/config/xtensa/linux-unwind.h b/libgcc/config/xtensa/linux-unwind.h
-index 9daf738..ff6b663 100644
---- a/libgcc/config/xtensa/linux-unwind.h
-+++ b/libgcc/config/xtensa/linux-unwind.h
-@@ -64,7 +64,7 @@ xtensa_fallback_frame_state (struct _Unwind_Context *context,
- 
-   struct rt_sigframe {
-     siginfo_t info;
--    struct ucontext uc;
-+    ucontext_t uc;
-   } *rt_;
- 
-   /* movi a2, __NR_rt_sigreturn; syscall */
--- 
-2.9.5
-
diff --git a/package/gcc/5.4.0/944-sanitizer-linux.patch b/package/gcc/5.4.0/944-sanitizer-linux.patch
deleted file mode 100644
index a2602b7..0000000
--- a/package/gcc/5.4.0/944-sanitizer-linux.patch
+++ /dev/null
@@ -1,91 +0,0 @@
-From cf796eadff0f2ff0f6e4565373d54d10dff276e1 Mon Sep 17 00:00:00 2001
-From: doko <doko@138bc75d-0d04-0410-961f-82ee72b054a4>
-Date: Thu, 7 Sep 2017 07:17:17 +0000
-Subject: [PATCH] 2017-09-07  Matthias Klose  <doko@ubuntu.com>
-
-        Backported from mainline
-        2017-07-14  Jakub Jelinek  <jakub@redhat.com>
-
-        PR sanitizer/81066
-        * sanitizer_common/sanitizer_linux.h: Cherry-pick upstream r307969.
-        * sanitizer_common/sanitizer_linux.cc: Likewise.
-        * sanitizer_common/sanitizer_stoptheworld_linux_libcdep.cc: Likewise.
-        * tsan/tsan_platform_linux.cc: Likewise.
-
-git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/branches/gcc-5-branch at 251829 138bc75d-0d04-0410-961f-82ee72b054a4
-
-(cherry picked from commit 833e00c01e96f61e24cd7ec97b93fad212dc914b)
-[Romain rebase on gcc 5.4]
-Signed-off-by: Romain Naour <romain.naour@gmail.com>
----
- libsanitizer/sanitizer_common/sanitizer_linux.cc                      | 3 +--
- libsanitizer/sanitizer_common/sanitizer_linux.h                       | 4 +---
- libsanitizer/sanitizer_common/sanitizer_stoptheworld_linux_libcdep.cc | 2 +-
- libsanitizer/tsan/tsan_platform_linux.cc                              | 2 +-
- 4 files changed, 4 insertions(+), 7 deletions(-)
-
-diff --git a/libsanitizer/sanitizer_common/sanitizer_linux.cc b/libsanitizer/sanitizer_common/sanitizer_linux.cc
-index 9feb307..821b26d 100644
---- a/libsanitizer/sanitizer_common/sanitizer_linux.cc
-+++ b/libsanitizer/sanitizer_common/sanitizer_linux.cc
-@@ -514,8 +514,7 @@ uptr internal_prctl(int option, uptr arg2, uptr arg3, uptr arg4, uptr arg5) {
- }
- #endif
- 
--uptr internal_sigaltstack(const struct sigaltstack *ss,
--                         struct sigaltstack *oss) {
-+uptr internal_sigaltstack(const void *ss, void *oss) {
-   return internal_syscall(SYSCALL(sigaltstack), (uptr)ss, (uptr)oss);
- }
- 
-diff --git a/libsanitizer/sanitizer_common/sanitizer_linux.h b/libsanitizer/sanitizer_common/sanitizer_linux.h
-index 086834c..3a6f4cd 100644
---- a/libsanitizer/sanitizer_common/sanitizer_linux.h
-+++ b/libsanitizer/sanitizer_common/sanitizer_linux.h
-@@ -18,7 +18,6 @@
- #include "sanitizer_platform_limits_posix.h"
- 
- struct link_map;  // Opaque type returned by dlopen().
--struct sigaltstack;
- 
- namespace __sanitizer {
- // Dirent structure for getdents(). Note that this structure is different from
-@@ -27,8 +26,7 @@ struct linux_dirent;
- 
- // Syscall wrappers.
- uptr internal_getdents(fd_t fd, struct linux_dirent *dirp, unsigned int count);
--uptr internal_sigaltstack(const struct sigaltstack* ss,
--                          struct sigaltstack* oss);
-+uptr internal_sigaltstack(const void* ss, void* oss);
- uptr internal_sigprocmask(int how, __sanitizer_sigset_t *set,
-     __sanitizer_sigset_t *oldset);
- void internal_sigfillset(__sanitizer_sigset_t *set);
-diff --git a/libsanitizer/sanitizer_common/sanitizer_stoptheworld_linux_libcdep.cc b/libsanitizer/sanitizer_common/sanitizer_stoptheworld_linux_libcdep.cc
-index 5881202..c54894d 100644
---- a/libsanitizer/sanitizer_common/sanitizer_stoptheworld_linux_libcdep.cc
-+++ b/libsanitizer/sanitizer_common/sanitizer_stoptheworld_linux_libcdep.cc
-@@ -234,7 +234,7 @@ static int TracerThread(void* argument) {
- 
-   // Alternate stack for signal handling.
-   InternalScopedBuffer<char> handler_stack_memory(kHandlerStackSize);
--  struct sigaltstack handler_stack;
-+  stack_t handler_stack;
-   internal_memset(&handler_stack, 0, sizeof(handler_stack));
-   handler_stack.ss_sp = handler_stack_memory.data();
-   handler_stack.ss_size = kHandlerStackSize;
-diff --git a/libsanitizer/tsan/tsan_platform_linux.cc b/libsanitizer/tsan/tsan_platform_linux.cc
-index 3259131..b8e9078 100644
---- a/libsanitizer/tsan/tsan_platform_linux.cc
-+++ b/libsanitizer/tsan/tsan_platform_linux.cc
-@@ -377,7 +377,7 @@ bool IsGlobalVar(uptr addr) {
- int ExtractResolvFDs(void *state, int *fds, int nfd) {
- #if SANITIZER_LINUX
-   int cnt = 0;
--  __res_state *statp = (__res_state*)state;
-+  struct __res_state *statp = (struct __res_state*)state;
-   for (int i = 0; i < MAXNS && cnt < nfd; i++) {
-     if (statp->_u._ext.nsaddrs[i] && statp->_u._ext.nssocks[i] != -1)
-       fds[cnt++] = statp->_u._ext.nssocks[i];
--- 
-2.9.5
-
diff --git a/package/gcc/5.4.0/100-uclibc-conf.patch b/package/gcc/5.5.0/100-uclibc-conf.patch
similarity index 100%
rename from package/gcc/5.4.0/100-uclibc-conf.patch
rename to package/gcc/5.5.0/100-uclibc-conf.patch
diff --git a/package/gcc/5.4.0/120-gcc-config.gcc-fix-typo-for-powerpc-e6500-cpu_is_64b.patch b/package/gcc/5.5.0/120-gcc-config.gcc-fix-typo-for-powerpc-e6500-cpu_is_64b.patch
similarity index 100%
rename from package/gcc/5.4.0/120-gcc-config.gcc-fix-typo-for-powerpc-e6500-cpu_is_64b.patch
rename to package/gcc/5.5.0/120-gcc-config.gcc-fix-typo-for-powerpc-e6500-cpu_is_64b.patch
diff --git a/package/gcc/5.4.0/301-missing-execinfo_h.patch b/package/gcc/5.5.0/301-missing-execinfo_h.patch
similarity index 100%
rename from package/gcc/5.4.0/301-missing-execinfo_h.patch
rename to package/gcc/5.5.0/301-missing-execinfo_h.patch
diff --git a/package/gcc/5.4.0/810-arm-softfloat-libgcc.patch b/package/gcc/5.5.0/810-arm-softfloat-libgcc.patch
similarity index 100%
rename from package/gcc/5.4.0/810-arm-softfloat-libgcc.patch
rename to package/gcc/5.5.0/810-arm-softfloat-libgcc.patch
diff --git a/package/gcc/5.4.0/830-arm_unbreak_armv4t.patch b/package/gcc/5.5.0/830-arm_unbreak_armv4t.patch
similarity index 100%
rename from package/gcc/5.4.0/830-arm_unbreak_armv4t.patch
rename to package/gcc/5.5.0/830-arm_unbreak_armv4t.patch
diff --git a/package/gcc/5.4.0/831-ARM-PR-target-70473-Reduce-size-of-Cortex-A8-automat.patch b/package/gcc/5.5.0/831-ARM-PR-target-70473-Reduce-size-of-Cortex-A8-automat.patch
similarity index 100%
rename from package/gcc/5.4.0/831-ARM-PR-target-70473-Reduce-size-of-Cortex-A8-automat.patch
rename to package/gcc/5.5.0/831-ARM-PR-target-70473-Reduce-size-of-Cortex-A8-automat.patch
diff --git a/package/gcc/5.4.0/840-microblaze-enable-dwarf-eh-support.patch b/package/gcc/5.5.0/840-microblaze-enable-dwarf-eh-support.patch
similarity index 100%
rename from package/gcc/5.4.0/840-microblaze-enable-dwarf-eh-support.patch
rename to package/gcc/5.5.0/840-microblaze-enable-dwarf-eh-support.patch
diff --git a/package/gcc/5.4.0/850-libstdcxx-uclibc-c99.patch b/package/gcc/5.5.0/850-libstdcxx-uclibc-c99.patch
similarity index 100%
rename from package/gcc/5.4.0/850-libstdcxx-uclibc-c99.patch
rename to package/gcc/5.5.0/850-libstdcxx-uclibc-c99.patch
diff --git a/package/gcc/5.4.0/860-cilk-wchar.patch b/package/gcc/5.5.0/860-cilk-wchar.patch
similarity index 100%
rename from package/gcc/5.4.0/860-cilk-wchar.patch
rename to package/gcc/5.5.0/860-cilk-wchar.patch
diff --git a/package/gcc/5.4.0/870-xtensa-add-mauto-litpools-option.patch b/package/gcc/5.5.0/870-xtensa-add-mauto-litpools-option.patch
similarity index 100%
rename from package/gcc/5.4.0/870-xtensa-add-mauto-litpools-option.patch
rename to package/gcc/5.5.0/870-xtensa-add-mauto-litpools-option.patch
diff --git a/package/gcc/5.4.0/871-xtensa-reimplement-register-spilling.patch b/package/gcc/5.5.0/871-xtensa-reimplement-register-spilling.patch
similarity index 100%
rename from package/gcc/5.4.0/871-xtensa-reimplement-register-spilling.patch
rename to package/gcc/5.5.0/871-xtensa-reimplement-register-spilling.patch
diff --git a/package/gcc/5.4.0/874-xtensa-add-uclinux-support.patch b/package/gcc/5.5.0/874-xtensa-add-uclinux-support.patch
similarity index 100%
rename from package/gcc/5.4.0/874-xtensa-add-uclinux-support.patch
rename to package/gcc/5.5.0/874-xtensa-add-uclinux-support.patch
diff --git a/package/gcc/5.4.0/875-xtensa-implement-trap-pattern.patch b/package/gcc/5.5.0/875-xtensa-implement-trap-pattern.patch
similarity index 100%
rename from package/gcc/5.4.0/875-xtensa-implement-trap-pattern.patch
rename to package/gcc/5.5.0/875-xtensa-implement-trap-pattern.patch
diff --git a/package/gcc/5.4.0/880-gcc-nios2-Add-IJMP_REGS-enum.patch b/package/gcc/5.5.0/880-gcc-nios2-Add-IJMP_REGS-enum.patch
similarity index 100%
rename from package/gcc/5.4.0/880-gcc-nios2-Add-IJMP_REGS-enum.patch
rename to package/gcc/5.5.0/880-gcc-nios2-Add-IJMP_REGS-enum.patch
diff --git a/package/gcc/5.4.0/890-fix-m68k-compile.patch b/package/gcc/5.5.0/890-fix-m68k-compile.patch
similarity index 100%
rename from package/gcc/5.4.0/890-fix-m68k-compile.patch
rename to package/gcc/5.5.0/890-fix-m68k-compile.patch
diff --git a/package/gcc/5.4.0/891-fix-m68k-uclinux.patch b/package/gcc/5.5.0/891-fix-m68k-uclinux.patch
similarity index 100%
rename from package/gcc/5.4.0/891-fix-m68k-uclinux.patch
rename to package/gcc/5.5.0/891-fix-m68k-uclinux.patch
diff --git a/package/gcc/5.4.0/900-libitm-fixes-for-musl-support.patch b/package/gcc/5.5.0/900-libitm-fixes-for-musl-support.patch
similarity index 100%
rename from package/gcc/5.4.0/900-libitm-fixes-for-musl-support.patch
rename to package/gcc/5.5.0/900-libitm-fixes-for-musl-support.patch
diff --git a/package/gcc/5.4.0/901-fixincludes-update-for-musl-support.patch b/package/gcc/5.5.0/901-fixincludes-update-for-musl-support.patch
similarity index 100%
rename from package/gcc/5.4.0/901-fixincludes-update-for-musl-support.patch
rename to package/gcc/5.5.0/901-fixincludes-update-for-musl-support.patch
diff --git a/package/gcc/5.4.0/902-unwind-fix-for-musl.patch b/package/gcc/5.5.0/902-unwind-fix-for-musl.patch
similarity index 100%
rename from package/gcc/5.4.0/902-unwind-fix-for-musl.patch
rename to package/gcc/5.5.0/902-unwind-fix-for-musl.patch
diff --git a/package/gcc/5.4.0/903-libstdc++-libgfortran-gthr-workaround-for-musl.patch b/package/gcc/5.5.0/903-libstdc++-libgfortran-gthr-workaround-for-musl.patch
similarity index 100%
rename from package/gcc/5.4.0/903-libstdc++-libgfortran-gthr-workaround-for-musl.patch
rename to package/gcc/5.5.0/903-libstdc++-libgfortran-gthr-workaround-for-musl.patch
diff --git a/package/gcc/5.4.0/904-musl-libc-config.patch b/package/gcc/5.5.0/904-musl-libc-config.patch
similarity index 100%
rename from package/gcc/5.4.0/904-musl-libc-config.patch
rename to package/gcc/5.5.0/904-musl-libc-config.patch
diff --git a/package/gcc/5.4.0/905-add-musl-support-to-gcc.patch b/package/gcc/5.5.0/905-add-musl-support-to-gcc.patch
similarity index 100%
rename from package/gcc/5.4.0/905-add-musl-support-to-gcc.patch
rename to package/gcc/5.5.0/905-add-musl-support-to-gcc.patch
diff --git a/package/gcc/5.4.0/906-mips-musl-support.patch b/package/gcc/5.5.0/906-mips-musl-support.patch
similarity index 100%
rename from package/gcc/5.4.0/906-mips-musl-support.patch
rename to package/gcc/5.5.0/906-mips-musl-support.patch
diff --git a/package/gcc/5.4.0/907-x86-musl-support.patch b/package/gcc/5.5.0/907-x86-musl-support.patch
similarity index 100%
rename from package/gcc/5.4.0/907-x86-musl-support.patch
rename to package/gcc/5.5.0/907-x86-musl-support.patch
diff --git a/package/gcc/5.4.0/908-arm-musl-support.patch b/package/gcc/5.5.0/908-arm-musl-support.patch
similarity index 100%
rename from package/gcc/5.4.0/908-arm-musl-support.patch
rename to package/gcc/5.5.0/908-arm-musl-support.patch
diff --git a/package/gcc/5.4.0/909-aarch64-musl-support.patch b/package/gcc/5.5.0/909-aarch64-musl-support.patch
similarity index 100%
rename from package/gcc/5.4.0/909-aarch64-musl-support.patch
rename to package/gcc/5.5.0/909-aarch64-musl-support.patch
diff --git a/package/gcc/5.4.0/910-microblaze-musl-and-uclibc.patch b/package/gcc/5.5.0/910-microblaze-musl-and-uclibc.patch
similarity index 100%
rename from package/gcc/5.4.0/910-microblaze-musl-and-uclibc.patch
rename to package/gcc/5.5.0/910-microblaze-musl-and-uclibc.patch
diff --git a/package/gcc/5.4.0/911-ppc-musl-support.patch b/package/gcc/5.5.0/911-ppc-musl-support.patch
similarity index 100%
rename from package/gcc/5.4.0/911-ppc-musl-support.patch
rename to package/gcc/5.5.0/911-ppc-musl-support.patch
diff --git a/package/gcc/5.4.0/912-sh-musl-support.patch b/package/gcc/5.5.0/912-sh-musl-support.patch
similarity index 100%
rename from package/gcc/5.4.0/912-sh-musl-support.patch
rename to package/gcc/5.5.0/912-sh-musl-support.patch
diff --git a/package/gcc/5.4.0/930-libgcc-disable-split-stack-nothreads.patch b/package/gcc/5.5.0/930-libgcc-disable-split-stack-nothreads.patch
similarity index 100%
rename from package/gcc/5.4.0/930-libgcc-disable-split-stack-nothreads.patch
rename to package/gcc/5.5.0/930-libgcc-disable-split-stack-nothreads.patch
diff --git a/package/gcc/5.4.0/940-uclinux-enable-threads.patch b/package/gcc/5.5.0/940-uclinux-enable-threads.patch
similarity index 100%
rename from package/gcc/5.4.0/940-uclinux-enable-threads.patch
rename to package/gcc/5.5.0/940-uclinux-enable-threads.patch
diff --git a/package/gcc/5.4.0/941-mips-Add-support-for-mips-r6-musl.patch b/package/gcc/5.5.0/941-mips-Add-support-for-mips-r6-musl.patch
similarity index 100%
rename from package/gcc/5.4.0/941-mips-Add-support-for-mips-r6-musl.patch
rename to package/gcc/5.5.0/941-mips-Add-support-for-mips-r6-musl.patch
diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index 1115554..89f1ee2 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -89,7 +89,7 @@ config BR2_GCC_SUPPORTS_FINEGRAINEDMTUNE
 config BR2_GCC_VERSION
 	string
 	default "4.9.4"     if BR2_GCC_VERSION_4_9_X
-	default "5.4.0"     if BR2_GCC_VERSION_5_X
+	default "5.5.0"     if BR2_GCC_VERSION_5_X
 	default "6.4.0"     if BR2_GCC_VERSION_6_X
 	default "7.2.0"     if BR2_GCC_VERSION_7_X
 	default "arc-2017.09-rc1" if BR2_GCC_VERSION_ARC
diff --git a/package/gcc/gcc.hash b/package/gcc/gcc.hash
index 7d4d435..cd6fdef 100644
--- a/package/gcc/gcc.hash
+++ b/package/gcc/gcc.hash
@@ -1,7 +1,7 @@
 # From ftp://gcc.gnu.org/pub/gcc/releases/gcc-4.9.4/sha512.sum
 sha512  93abb78e16277454f41a8e9810f41f66c0fdffdc539a762ff6b67d3037f78db971378683fd2ebf707d1d51c059fad2161fe42d110c330027f40214b7db0f3efe  gcc-4.9.4.tar.bz2
-# From ftp://gcc.gnu.org/pub/gcc/releases/gcc-5.4.0/sha512.sum
-sha512  2941cc950c8f2409a314df497631f9b0266211aa74746c1839c46e04f1c7c299afe2528d1ef16ea39def408a644ba48f97519ec7a7dd37d260c3e9423514265b  gcc-5.4.0.tar.bz2
+# From ftp://gcc.gnu.org/pub/gcc/releases/gcc-5.5.0/sha512.sum
+sha512  670ff52c2ae12c7852c12987e91798c5aa8bd6daf21f0d6e0cd57a4aa59cc4f06a837fe76426eaa1424cfddca937bed377680700eadc04d76b9180d462364fa1  gcc-5.5.0.tar.xz
 # From ftp://gcc.gnu.org/pub/gcc/releases/gcc-6.4.0/sha512.sum
 sha512  02c60e54527c7adf584798d5251f8a0b80c93d5deafce82501b2c28e6692e0bd783927bbfc4bc527a863c0cccc025150a34740a9e29badb02d4b48e56a8aba90  gcc-6.4.0.tar.xz
 # From ftp://gcc.gnu.org/pub/gcc/releases/gcc-7.2.0/sha512.sum
diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
index 54ef70c..6bdd6c8 100644
--- a/package/gcc/gcc.mk
+++ b/package/gcc/gcc.mk
@@ -18,9 +18,9 @@ GCC_SITE = $(call github,openrisc,or1k-gcc,$(GCC_VERSION))
 GCC_SOURCE = gcc-$(GCC_VERSION).tar.gz
 else
 GCC_SITE = $(BR2_GNU_MIRROR:/=)/gcc/gcc-$(GCC_VERSION)
-# From version 6.4.0 and 7.2.0 a bz2 release tarball is not provided
-# anymore. Use the xz tarball instead.
-ifeq ($(BR2_GCC_VERSION_6_X)$(BR2_GCC_VERSION_7_X),y)
+# From version 5.5.0, 6.4.0 and 7.2.0 a bz2 release tarball is not
+# provided anymore. Use the xz tarball instead.
+ifeq ($(BR2_GCC_VERSION_5_X)$(BR2_GCC_VERSION_6_X)$(BR2_GCC_VERSION_7_X),y)
 GCC_SOURCE = gcc-$(GCC_VERSION).tar.xz
 else
 GCC_SOURCE = gcc-$(GCC_VERSION).tar.bz2
