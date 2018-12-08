From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 8 Dec 2018 20:54:47 +0100
Subject: [Buildroot] [git commit] package/gcc: bump to version 6.5.0
Message-ID: <20181208200042.78C9786C48@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7f283452c8ffb9caa0656c1691109801c2d63c26
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Remove upstream patches:

0002-fix-building-on-ppc64.patch
https://github.com/gcc-mirror/gcc/commit/765527ad3725c5f3e82ab2b8e5031120b409983d

0003-libsanitizer-Use-pre-computed-size.patch
https://github.com/gcc-mirror/gcc/commit/61f38c64c01a15560026115a157b7021ec67bd3b

942-Use-ucontext_t-not-struct-ucontext-in-linux-unwind.h.patch
https://github.com/gcc-mirror/gcc/commit/b685411208e0aaa79190d54faf945763514706b8

943-sanitizer-linux.patch
https://github.com/gcc-mirror/gcc/commit/8937b94d1a643fd9760714642296d034a45254a8

870-xtensa-fix-PR-target-82181.patch
https://github.com/gcc-mirror/gcc/commit/dbbb83538168c6648b53f5e164c3a30beda6464f

871-xtensa-fix-PR-target-65416.patch
https://github.com/gcc-mirror/gcc/commit/36f42654cbbc1df0e3d0040ba900c61980a8f8db

872-gcc-xtensa-fix-NAND-code-in-xtensa_expand_atomic.patch using patch
https://github.com/gcc-mirror/gcc/commit/9f149a1a929c0c6c22f572b1cd651c83ac83774c

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gcc/6.4.0/0002-fix-building-on-ppc64.patch |  38 ----
 .../0003-libsanitizer-Use-pre-computed-size.patch  |  72 --------
 .../gcc/6.4.0/870-xtensa-fix-PR-target-82181.patch |  31 ----
 .../gcc/6.4.0/871-xtensa-fix-PR-target-65416.patch | 101 -----------
 ...nsa-fix-NAND-code-in-xtensa_expand_atomic.patch |  39 -----
 ...t_t-not-struct-ucontext-in-linux-unwind.h.patch | 192 ---------------------
 package/gcc/6.4.0/943-sanitizer-linux.patch        |  91 ----------
 .../0001-m68k-coldfire-pr68467.patch               |   0
 ...xtensa-don-t-force-PIC-for-uclinux-target.patch |   0
 package/gcc/{6.4.0 => 6.5.0}/100-uclibc-conf.patch |   0
 .../{6.4.0 => 6.5.0}/301-missing-execinfo_h.patch  |   0
 .../810-arm-softfloat-libgcc.patch                 |   0
 .../{6.4.0 => 6.5.0}/830-arm_unbreak_armv4t.patch  |   0
 ...et-70473-Reduce-size-of-Cortex-A8-automat.patch |   0
 package/gcc/{6.4.0 => 6.5.0}/860-cilk-wchar.patch  |   0
 .../{6.4.0 => 6.5.0}/890-fix-m68k-compile.patch    |   0
 .../{6.4.0 => 6.5.0}/896-microblaze-Revert.patch   |   0
 ...laze-support-DWARF-EH-old-Xilinx-patch-ne.patch |   0
 .../940-uclinux-enable-threads.patch               |   0
 .../941-mips-Add-support-for-mips-r6-musl.patch    |   0
 package/gcc/Config.in.host                         |   2 +-
 package/gcc/gcc.hash                               |   4 +-
 22 files changed, 3 insertions(+), 567 deletions(-)

diff --git a/package/gcc/6.4.0/0002-fix-building-on-ppc64.patch b/package/gcc/6.4.0/0002-fix-building-on-ppc64.patch
deleted file mode 100644
index ee096cfcf1..0000000000
--- a/package/gcc/6.4.0/0002-fix-building-on-ppc64.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From 765527ad3725c5f3e82ab2b8e5031120b409983d Mon Sep 17 00:00:00 2001
-From: marxin <marxin@138bc75d-0d04-0410-961f-82ee72b054a4>
-Date: Fri, 15 Jun 2018 08:51:28 +0000
-Subject: [PATCH] Partial backport r256656
-
-2018-06-15  Martin Liska  <mliska@suse.cz>
-
-	Backport from mainline
-	2018-01-10  Kelvin Nilsen  <kelvin@gcc.gnu.org>
-
-	* lex.c (search_line_fast): Remove illegal coercion of an
-	unaligned pointer value to vector pointer type and replace with
-	use of __builtin_vec_vsx_ld () built-in function, which operates
-	on unaligned pointer values.
-
-
-git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/branches/gcc-6-branch at 261621 138bc75d-0d04-0410-961f-82ee72b054a4
-Signed-off-by: Joel Stanley <joel@jms.id.au>
----
- libcpp/lex.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/libcpp/lex.c b/libcpp/lex.c
-index e5a0397f3099..b789686f1c49 100644
---- a/libcpp/lex.c
-+++ b/libcpp/lex.c
-@@ -568,7 +568,7 @@ search_line_fast (const uchar *s, const uchar *end ATTRIBUTE_UNUSED)
-     {
-       vc m_nl, m_cr, m_bs, m_qm;
- 
--      data = *((const vc *)s);
-+      data = __builtin_vec_vsx_ld (0, s);
-       s += 16;
- 
-       m_nl = (vc) __builtin_vec_cmpeq(data, repl_nl);
--- 
-2.17.1
-
diff --git a/package/gcc/6.4.0/0003-libsanitizer-Use-pre-computed-size.patch b/package/gcc/6.4.0/0003-libsanitizer-Use-pre-computed-size.patch
deleted file mode 100644
index 6e73331eae..0000000000
--- a/package/gcc/6.4.0/0003-libsanitizer-Use-pre-computed-size.patch
+++ /dev/null
@@ -1,72 +0,0 @@
-From 61f38c64c01a15560026115a157b7021ec67bd3b Mon Sep 17 00:00:00 2001
-From: hjl <hjl@138bc75d-0d04-0410-961f-82ee72b054a4>
-Date: Thu, 24 May 2018 20:21:54 +0000
-Subject: [PATCH] libsanitizer: Use pre-computed size of struct ustat for Linux
-
-Cherry-pick compiler-rt revision 333213:
-
-<sys/ustat.h> has been removed from glibc 2.28 by:
-
-commit cf2478d53ad7071e84c724a986b56fe17f4f4ca7
-Author: Adhemerval Zanella <adhemerval.zanella@linaro.org>
-Date:   Sun Mar 18 11:28:59 2018 +0800
-
-    Deprecate ustat syscall interface
-
-This patch uses pre-computed size of struct ustat for Linux.
-
-	PR sanitizer/85835
-	* sanitizer_common/sanitizer_platform_limits_posix.cc: Don't
-	include <sys/ustat.h> for Linux.
-	(SIZEOF_STRUCT_USTAT): New.
-	(struct_ustat_sz): Use SIZEOF_STRUCT_USTAT for Linux.
-
-
-
-git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/branches/gcc-7-branch at 260688 138bc75d-0d04-0410-961f-82ee72b054a4
-
-Downloaded from upstream commit
-https://gcc.gnu.org/git/?p=gcc.git;a=commit;h=61f38c64c01a15560026115a157b7021ec67bd3b
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
----
- libsanitizer/ChangeLog                                    |  8 ++++++++
- .../sanitizer_common/sanitizer_platform_limits_posix.cc   | 15 +++++++++++++--
- 2 files changed, 21 insertions(+), 2 deletions(-)
-
-diff --git a/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.cc b/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.cc
-index 31a5e69..8017afd 100644
---- a/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.cc
-+++ b/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.cc
-@@ -154,7 +154,6 @@ typedef struct user_fpregs elf_fpregset_t;
- # include <sys/procfs.h>
- #endif
- #include <sys/user.h>
--#include <sys/ustat.h>
- #include <linux/cyclades.h>
- #include <linux/if_eql.h>
- #include <linux/if_plip.h>
-@@ -247,7 +246,19 @@ namespace __sanitizer {
- #endif // SANITIZER_LINUX || SANITIZER_FREEBSD
- 
- #if SANITIZER_LINUX && !SANITIZER_ANDROID
--  unsigned struct_ustat_sz = sizeof(struct ustat);
-+  // Use pre-computed size of struct ustat to avoid <sys/ustat.h> which
-+  // has been removed from glibc 2.28.
-+#if defined(__aarch64__) || defined(__s390x__) || defined (__mips64) \
-+  || defined(__powerpc64__) || defined(__arch64__) || defined(__sparcv9) \
-+  || defined(__x86_64__)
-+#define SIZEOF_STRUCT_USTAT 32
-+#elif defined(__arm__) || defined(__i386__) || defined(__mips__) \
-+  || defined(__powerpc__) || defined(__s390__)
-+#define SIZEOF_STRUCT_USTAT 20
-+#else
-+#error Unknown size of struct ustat
-+#endif
-+  unsigned struct_ustat_sz = SIZEOF_STRUCT_USTAT;
-   unsigned struct_rlimit64_sz = sizeof(struct rlimit64);
-   unsigned struct_statvfs64_sz = sizeof(struct statvfs64);
- #endif // SANITIZER_LINUX && !SANITIZER_ANDROID
--- 
-2.9.3
-
diff --git a/package/gcc/6.4.0/870-xtensa-fix-PR-target-82181.patch b/package/gcc/6.4.0/870-xtensa-fix-PR-target-82181.patch
deleted file mode 100644
index 5fe384148b..0000000000
--- a/package/gcc/6.4.0/870-xtensa-fix-PR-target-82181.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 3bc2ee6886f1619bc6a2257a0775142526b1a57a Mon Sep 17 00:00:00 2001
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
-index 2bdf5ccef979..92fdeb08046d 100644
---- a/gcc/config/xtensa/xtensa.c
-+++ b/gcc/config/xtensa/xtensa.c
-@@ -601,6 +601,7 @@ xtensa_mem_offset (unsigned v, machine_mode mode)
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
diff --git a/package/gcc/6.4.0/871-xtensa-fix-PR-target-65416.patch b/package/gcc/6.4.0/871-xtensa-fix-PR-target-65416.patch
deleted file mode 100644
index 7ead575439..0000000000
--- a/package/gcc/6.4.0/871-xtensa-fix-PR-target-65416.patch
+++ /dev/null
@@ -1,101 +0,0 @@
-From 87fda0741d210727672cba5e54a37a189e8ac04e Mon Sep 17 00:00:00 2001
-From: Max Filippov <jcmvbkbc@gmail.com>
-Date: Sun, 17 Jun 2018 21:18:39 -0700
-Subject: [PATCH] xtensa: fix PR target/65416
-
-The issue is caused by reordering of stack pointer update after stack
-space allocation with instructions that write to the allocated stack
-space. In windowed ABI register spill area for the previous call frame
-is located just below the stack pointer and may be reloaded back into
-the register file on movsp.
-Implement allocate_stack pattern for windowed ABI configuration and
-insert an instruction that prevents reordering of frame memory access
-and stack pointer update.
-
-gcc/
-2018-06-19  Max Filippov  <jcmvbkbc@gmail.com>
-
-	* config/xtensa/xtensa.md (UNSPEC_FRAME_BLOCKAGE): New unspec
-	constant.
-	(allocate_stack, frame_blockage, *frame_blockage): New patterns.
-
-Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
-Backported from: r261755
----
- gcc/config/xtensa/xtensa.md | 46 +++++++++++++++++++++++++++++++++++++++++++++
- 1 file changed, 46 insertions(+)
-
-diff --git a/gcc/config/xtensa/xtensa.md b/gcc/config/xtensa/xtensa.md
-index 84967dbedc08..209f839cfb0f 100644
---- a/gcc/config/xtensa/xtensa.md
-+++ b/gcc/config/xtensa/xtensa.md
-@@ -38,6 +38,7 @@
-   (UNSPEC_MEMW		11)
-   (UNSPEC_LSETUP_START  12)
-   (UNSPEC_LSETUP_END    13)
-+  (UNSPEC_FRAME_BLOCKAGE 14)
- 
-   (UNSPECV_SET_FP	1)
-   (UNSPECV_ENTRY	2)
-@@ -1676,6 +1677,32 @@
- 
- ;; Miscellaneous instructions.
- 
-+;; In windowed ABI stack pointer adjustment must happen before any access
-+;; to the space allocated on stack is allowed, otherwise register spill
-+;; area may be clobbered.  That's what frame blockage is supposed to enforce.
-+
-+(define_expand "allocate_stack"
-+  [(set (match_operand 0 "nonimmed_operand")
-+        (minus (reg A1_REG) (match_operand 1 "add_operand")))
-+   (set (reg A1_REG)
-+        (minus (reg A1_REG) (match_dup 1)))]
-+  "TARGET_WINDOWED_ABI"
-+{
-+  if (CONST_INT_P (operands[1]))
-+    {
-+      rtx neg_op0 = GEN_INT (-INTVAL (operands[1]));
-+      emit_insn (gen_addsi3 (stack_pointer_rtx, stack_pointer_rtx, neg_op0));
-+    }
-+  else
-+    {
-+      emit_insn (gen_subsi3 (stack_pointer_rtx, stack_pointer_rtx,
-+			     operands[1]));
-+    }
-+  emit_move_insn (operands[0], virtual_stack_dynamic_rtx);
-+  emit_insn (gen_frame_blockage ());
-+  DONE;
-+})
-+
- (define_expand "prologue"
-   [(const_int 0)]
-   ""
-@@ -1767,6 +1794,25 @@
-   [(set_attr "length" "0")
-    (set_attr "type" "nop")])
- 
-+;; Do not schedule instructions accessing memory before this point.
-+
-+(define_expand "frame_blockage"
-+  [(set (match_dup 0)
-+        (unspec:BLK [(match_dup 1)] UNSPEC_FRAME_BLOCKAGE))]
-+  ""
-+{
-+  operands[0] = gen_rtx_MEM (BLKmode, gen_rtx_SCRATCH (Pmode));
-+  MEM_VOLATILE_P (operands[0]) = 1;
-+  operands[1] = stack_pointer_rtx;
-+})
-+
-+(define_insn "*frame_blockage"
-+  [(set (match_operand:BLK 0 "" "")
-+        (unspec:BLK [(match_operand:SI 1 "" "")] UNSPEC_FRAME_BLOCKAGE))]
-+  ""
-+  ""
-+  [(set_attr "length" "0")])
-+
- (define_insn "trap"
-   [(trap_if (const_int 1) (const_int 0))]
-   ""
--- 
-2.11.0
-
diff --git a/package/gcc/6.4.0/872-gcc-xtensa-fix-NAND-code-in-xtensa_expand_atomic.patch b/package/gcc/6.4.0/872-gcc-xtensa-fix-NAND-code-in-xtensa_expand_atomic.patch
deleted file mode 100644
index d62d7c1566..0000000000
--- a/package/gcc/6.4.0/872-gcc-xtensa-fix-NAND-code-in-xtensa_expand_atomic.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From 6765eecde2ed8d4be0fc217408b9e9b92a840aff Mon Sep 17 00:00:00 2001
-From: Max Filippov <jcmvbkbc@gmail.com>
-Date: Tue, 4 Sep 2018 00:39:32 -0700
-Subject: [PATCH] gcc: xtensa: fix NAND code in xtensa_expand_atomic
-
-NAND is ~(a1 & a2), but xtensa_expand_atomic does ~a1 & a2.
-That fixes libatomic tests atomic-op-{1,2}.
-
-gcc/
-2018-09-04  Max Filippov  <jcmvbkbc@gmail.com>
-
-	* config/xtensa/xtensa.c (xtensa_expand_atomic): Reorder AND and
-	XOR operations in NAND case.
-
-Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
-Backported from: r264087
----
- gcc/config/xtensa/xtensa.c | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/gcc/config/xtensa/xtensa.c b/gcc/config/xtensa/xtensa.c
-index 7cfe64d42895..080bb4ad765d 100644
---- a/gcc/config/xtensa/xtensa.c
-+++ b/gcc/config/xtensa/xtensa.c
-@@ -1614,9 +1614,9 @@ xtensa_expand_atomic (enum rtx_code code, rtx target, rtx mem, rtx val,
-       break;
- 
-     case MULT: /* NAND */
--      tmp = expand_simple_binop (SImode, XOR, old, ac.modemask,
-+      tmp = expand_simple_binop (SImode, AND, old, val,
- 				 NULL_RTX, 1, OPTAB_DIRECT);
--      tmp = expand_simple_binop (SImode, AND, tmp, val,
-+      tmp = expand_simple_binop (SImode, XOR, tmp, ac.modemask,
- 				 new_rtx, 1, OPTAB_DIRECT);
-       break;
- 
--- 
-2.11.0
-
diff --git a/package/gcc/6.4.0/942-Use-ucontext_t-not-struct-ucontext-in-linux-unwind.h.patch b/package/gcc/6.4.0/942-Use-ucontext_t-not-struct-ucontext-in-linux-unwind.h.patch
deleted file mode 100644
index a2a2ea0f2f..0000000000
--- a/package/gcc/6.4.0/942-Use-ucontext_t-not-struct-ucontext-in-linux-unwind.h.patch
+++ /dev/null
@@ -1,192 +0,0 @@
-From 35d8ca22047f101a700abb29cffbf03b81278a2b Mon Sep 17 00:00:00 2001
-From: jsm28 <jsm28@138bc75d-0d04-0410-961f-82ee72b054a4>
-Date: Tue, 4 Jul 2017 10:23:57 +0000
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
-git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/branches/gcc-6-branch at 249957 138bc75d-0d04-0410-961f-82ee72b054a4
-
-(cherry picked from commit b685411208e0aaa79190d54faf945763514706b8)
-[Romain rebase on gcc 6.4]
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
-index 4512efb..06de45a 100644
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
-index bdbba4a..e84812e 100644
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
-index 77b7c23..8bf5e82 100644
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
-index 540a0a2..29efbe3 100644
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
-index 75b7cf7..f964e24 100644
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
-index 2304142..30f25ea 100644
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
-index 9a2657f..e47493d 100644
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
-index e389cac..0bf43ba 100644
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
-index 796e976..75f8890 100644
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
-index 9872492..586a9d4 100644
---- a/libgcc/config/xtensa/linux-unwind.h
-+++ b/libgcc/config/xtensa/linux-unwind.h
-@@ -67,7 +67,7 @@ xtensa_fallback_frame_state (struct _Unwind_Context *context,
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
diff --git a/package/gcc/6.4.0/943-sanitizer-linux.patch b/package/gcc/6.4.0/943-sanitizer-linux.patch
deleted file mode 100644
index 640d68c853..0000000000
--- a/package/gcc/6.4.0/943-sanitizer-linux.patch
+++ /dev/null
@@ -1,91 +0,0 @@
-From a3e3d1b5f73380a99126c4937a95225ba3bd214b Mon Sep 17 00:00:00 2001
-From: doko <doko@138bc75d-0d04-0410-961f-82ee72b054a4>
-Date: Thu, 7 Sep 2017 07:15:24 +0000
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
-git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/branches/gcc-6-branch at 251828 138bc75d-0d04-0410-961f-82ee72b054a4
-
-(cherry picked from commit 8937b94d1a643fd9760714642296d034a45254a8)
-[Romain rebase on gcc 6.4]
-Signed-off-by: Romain Naour <romain.naour@gmail.com>
----
- libsanitizer/sanitizer_common/sanitizer_linux.cc                      | 3 +--
- libsanitizer/sanitizer_common/sanitizer_linux.h                       | 4 +---
- libsanitizer/sanitizer_common/sanitizer_stoptheworld_linux_libcdep.cc | 2 +-
- libsanitizer/tsan/tsan_platform_linux.cc                              | 2 +-
- 4 files changed, 4 insertions(+), 7 deletions(-)
-
-diff --git a/libsanitizer/sanitizer_common/sanitizer_linux.cc b/libsanitizer/sanitizer_common/sanitizer_linux.cc
-index 2cefa20..223d9c6 100644
---- a/libsanitizer/sanitizer_common/sanitizer_linux.cc
-+++ b/libsanitizer/sanitizer_common/sanitizer_linux.cc
-@@ -546,8 +546,7 @@ uptr internal_prctl(int option, uptr arg2, uptr arg3, uptr arg4, uptr arg5) {
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
-index 4497702..1594058 100644
---- a/libsanitizer/sanitizer_common/sanitizer_linux.h
-+++ b/libsanitizer/sanitizer_common/sanitizer_linux.h
-@@ -19,7 +19,6 @@
- #include "sanitizer_platform_limits_posix.h"
- 
- struct link_map;  // Opaque type returned by dlopen().
--struct sigaltstack;
- 
- namespace __sanitizer {
- // Dirent structure for getdents(). Note that this structure is different from
-@@ -28,8 +27,7 @@ struct linux_dirent;
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
-index c919e4f..014162af 100644
---- a/libsanitizer/sanitizer_common/sanitizer_stoptheworld_linux_libcdep.cc
-+++ b/libsanitizer/sanitizer_common/sanitizer_stoptheworld_linux_libcdep.cc
-@@ -267,7 +267,7 @@ static int TracerThread(void* argument) {
- 
-   // Alternate stack for signal handling.
-   InternalScopedBuffer<char> handler_stack_memory(kHandlerStackSize);
--  struct sigaltstack handler_stack;
-+  stack_t handler_stack;
-   internal_memset(&handler_stack, 0, sizeof(handler_stack));
-   handler_stack.ss_sp = handler_stack_memory.data();
-   handler_stack.ss_size = kHandlerStackSize;
-diff --git a/libsanitizer/tsan/tsan_platform_linux.cc b/libsanitizer/tsan/tsan_platform_linux.cc
-index 09cec5f..908f4fe 100644
---- a/libsanitizer/tsan/tsan_platform_linux.cc
-+++ b/libsanitizer/tsan/tsan_platform_linux.cc
-@@ -291,7 +291,7 @@ bool IsGlobalVar(uptr addr) {
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
diff --git a/package/gcc/6.4.0/0001-m68k-coldfire-pr68467.patch b/package/gcc/6.5.0/0001-m68k-coldfire-pr68467.patch
similarity index 100%
rename from package/gcc/6.4.0/0001-m68k-coldfire-pr68467.patch
rename to package/gcc/6.5.0/0001-m68k-coldfire-pr68467.patch
diff --git a/package/gcc/6.4.0/0004-gcc-xtensa-don-t-force-PIC-for-uclinux-target.patch b/package/gcc/6.5.0/0004-gcc-xtensa-don-t-force-PIC-for-uclinux-target.patch
similarity index 100%
rename from package/gcc/6.4.0/0004-gcc-xtensa-don-t-force-PIC-for-uclinux-target.patch
rename to package/gcc/6.5.0/0004-gcc-xtensa-don-t-force-PIC-for-uclinux-target.patch
diff --git a/package/gcc/6.4.0/100-uclibc-conf.patch b/package/gcc/6.5.0/100-uclibc-conf.patch
similarity index 100%
rename from package/gcc/6.4.0/100-uclibc-conf.patch
rename to package/gcc/6.5.0/100-uclibc-conf.patch
diff --git a/package/gcc/6.4.0/301-missing-execinfo_h.patch b/package/gcc/6.5.0/301-missing-execinfo_h.patch
similarity index 100%
rename from package/gcc/6.4.0/301-missing-execinfo_h.patch
rename to package/gcc/6.5.0/301-missing-execinfo_h.patch
diff --git a/package/gcc/6.4.0/810-arm-softfloat-libgcc.patch b/package/gcc/6.5.0/810-arm-softfloat-libgcc.patch
similarity index 100%
rename from package/gcc/6.4.0/810-arm-softfloat-libgcc.patch
rename to package/gcc/6.5.0/810-arm-softfloat-libgcc.patch
diff --git a/package/gcc/6.4.0/830-arm_unbreak_armv4t.patch b/package/gcc/6.5.0/830-arm_unbreak_armv4t.patch
similarity index 100%
rename from package/gcc/6.4.0/830-arm_unbreak_armv4t.patch
rename to package/gcc/6.5.0/830-arm_unbreak_armv4t.patch
diff --git a/package/gcc/6.4.0/831-ARM-PR-target-70473-Reduce-size-of-Cortex-A8-automat.patch b/package/gcc/6.5.0/831-ARM-PR-target-70473-Reduce-size-of-Cortex-A8-automat.patch
similarity index 100%
rename from package/gcc/6.4.0/831-ARM-PR-target-70473-Reduce-size-of-Cortex-A8-automat.patch
rename to package/gcc/6.5.0/831-ARM-PR-target-70473-Reduce-size-of-Cortex-A8-automat.patch
diff --git a/package/gcc/6.4.0/860-cilk-wchar.patch b/package/gcc/6.5.0/860-cilk-wchar.patch
similarity index 100%
rename from package/gcc/6.4.0/860-cilk-wchar.patch
rename to package/gcc/6.5.0/860-cilk-wchar.patch
diff --git a/package/gcc/6.4.0/890-fix-m68k-compile.patch b/package/gcc/6.5.0/890-fix-m68k-compile.patch
similarity index 100%
rename from package/gcc/6.4.0/890-fix-m68k-compile.patch
rename to package/gcc/6.5.0/890-fix-m68k-compile.patch
diff --git a/package/gcc/6.4.0/896-microblaze-Revert.patch b/package/gcc/6.5.0/896-microblaze-Revert.patch
similarity index 100%
rename from package/gcc/6.4.0/896-microblaze-Revert.patch
rename to package/gcc/6.5.0/896-microblaze-Revert.patch
diff --git a/package/gcc/6.4.0/897-Make-MicroBlaze-support-DWARF-EH-old-Xilinx-patch-ne.patch b/package/gcc/6.5.0/897-Make-MicroBlaze-support-DWARF-EH-old-Xilinx-patch-ne.patch
similarity index 100%
rename from package/gcc/6.4.0/897-Make-MicroBlaze-support-DWARF-EH-old-Xilinx-patch-ne.patch
rename to package/gcc/6.5.0/897-Make-MicroBlaze-support-DWARF-EH-old-Xilinx-patch-ne.patch
diff --git a/package/gcc/6.4.0/940-uclinux-enable-threads.patch b/package/gcc/6.5.0/940-uclinux-enable-threads.patch
similarity index 100%
rename from package/gcc/6.4.0/940-uclinux-enable-threads.patch
rename to package/gcc/6.5.0/940-uclinux-enable-threads.patch
diff --git a/package/gcc/6.4.0/941-mips-Add-support-for-mips-r6-musl.patch b/package/gcc/6.5.0/941-mips-Add-support-for-mips-r6-musl.patch
similarity index 100%
rename from package/gcc/6.4.0/941-mips-Add-support-for-mips-r6-musl.patch
rename to package/gcc/6.5.0/941-mips-Add-support-for-mips-r6-musl.patch
diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index c2925cc6dc..036a5b9790 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -82,7 +82,7 @@ config BR2_GCC_VERSION
 	string
 	default "4.9.4"     if BR2_GCC_VERSION_4_9_X
 	default "5.5.0"     if BR2_GCC_VERSION_5_X
-	default "6.4.0"     if BR2_GCC_VERSION_6_X
+	default "6.5.0"     if BR2_GCC_VERSION_6_X
 	default "7.4.0"     if BR2_GCC_VERSION_7_X
 	default "8.2.0"     if BR2_GCC_VERSION_8_X
 	default "arc-2018.09-release" if BR2_GCC_VERSION_ARC
diff --git a/package/gcc/gcc.hash b/package/gcc/gcc.hash
index 9ae7e58f6b..abdcd9ac54 100644
--- a/package/gcc/gcc.hash
+++ b/package/gcc/gcc.hash
@@ -2,8 +2,8 @@
 sha512  93abb78e16277454f41a8e9810f41f66c0fdffdc539a762ff6b67d3037f78db971378683fd2ebf707d1d51c059fad2161fe42d110c330027f40214b7db0f3efe  gcc-4.9.4.tar.bz2
 # From ftp://gcc.gnu.org/pub/gcc/releases/gcc-5.5.0/sha512.sum
 sha512  670ff52c2ae12c7852c12987e91798c5aa8bd6daf21f0d6e0cd57a4aa59cc4f06a837fe76426eaa1424cfddca937bed377680700eadc04d76b9180d462364fa1  gcc-5.5.0.tar.xz
-# From ftp://gcc.gnu.org/pub/gcc/releases/gcc-6.4.0/sha512.sum
-sha512  02c60e54527c7adf584798d5251f8a0b80c93d5deafce82501b2c28e6692e0bd783927bbfc4bc527a863c0cccc025150a34740a9e29badb02d4b48e56a8aba90  gcc-6.4.0.tar.xz
+# From ftp://gcc.gnu.org/pub/gcc/releases/gcc-6.5.0/sha512.sum
+sha512  ce046f9a50050fd54b870aab764f7db187fe7ea92eb4aaffb7c3689ca623755604e231f2af97ef795f41c406bb80c797dd69957cfdd51dfa2ba60813f72b7eac  gcc-6.5.0.tar.xz
 # From ftp://gcc.gnu.org/pub/gcc/releases/gcc-7.4.0/sha512.sum
 sha512  8864d8e4b97c2e1a4f17422f6e68120172ebefeab97b1757734f7185ca68a6b9a89011c6833c03fa454c17b0ac35b15e1d284881e6971035948ac6100f3aa45e  gcc-7.4.0.tar.xz
 # From ftp://gcc.gnu.org/pub/gcc/releases/gcc-8.2.0/sha512.sum
