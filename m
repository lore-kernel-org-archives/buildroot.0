From: Romain Naour <romain.naour@gmail.com>
Date: Sat,  8 Dec 2018 16:37:34 +0100
Subject: [Buildroot] [PATCH 1/2] package/gcc: bump to version 7.4.0
Message-ID: <20181208153735.12898-1-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Remove upstream patches:

0002-fix-building-on-ppc64.patch
https://github.com/gcc-mirror/gcc/commit/aa65a43516da1d48011ef621ed5988289711d99b

0003-gcc-xtensa-fix-NAND-code-in-xtensa_expand_atomic.patch
https://github.com/gcc-mirror/gcc/commit/8709905244d50b9d81f85d534b21c29eb640078c

0003-xtensa-fix-PR-target-65416.patch
https://github.com/gcc-mirror/gcc/commit/5dcbd70ec0a97505d6153fcbc7ef899b5a2ec7fc

0004-libsanitizer-Use-pre-computed-size.patch
https://github.com/gcc-mirror/gcc/commit/61f38c64c01a15560026115a157b7021ec67bd3b

0005-gcc-xtensa-don-t-force-PIC-for-uclinux-target.patch
https://github.com/gcc-mirror/gcc/commit/6ef0a00dea2564f46a568b8681d8efccb4834cda

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 .../7.3.0/0002-fix-building-on-ppc64.patch    |  40 -------
 ...ix-NAND-code-in-xtensa_expand_atomic.patch |  39 -------
 .../0003-xtensa-fix-PR-target-65416.patch     | 101 ------------------
 ...4-libsanitizer-Use-pre-computed-size.patch |  72 -------------
 ...a-don-t-force-PIC-for-uclinux-target.patch |  41 -------
 .../0001-m68k-coldfire-pr68467.patch          |   2 +-
 .../{7.3.0 => 7.4.0}/0100-uclibc-conf.patch   |   0
 .../0810-arm-softfloat-libgcc.patch           |   0
 .../0860-cilk-fix-build-without-wchar.patch   |   0
 .../0892-microblaze-Revert.patch              |   1 +
 ...PR-target-81497-Fix-arm_acle.h-for-C.patch |  10 +-
 ...TRANT-for-RISC-V-when-pthread-is-pas.patch |   1 +
 package/gcc/Config.in.host                    |   2 +-
 package/gcc/gcc.hash                          |   4 +-
 14 files changed, 11 insertions(+), 302 deletions(-)
 delete mode 100644 package/gcc/7.3.0/0002-fix-building-on-ppc64.patch
 delete mode 100644 package/gcc/7.3.0/0003-gcc-xtensa-fix-NAND-code-in-xtensa_expand_atomic.patch
 delete mode 100644 package/gcc/7.3.0/0003-xtensa-fix-PR-target-65416.patch
 delete mode 100644 package/gcc/7.3.0/0004-libsanitizer-Use-pre-computed-size.patch
 delete mode 100644 package/gcc/7.3.0/0005-gcc-xtensa-don-t-force-PIC-for-uclinux-target.patch
 rename package/gcc/{7.3.0 => 7.4.0}/0001-m68k-coldfire-pr68467.patch (97%)
 rename package/gcc/{7.3.0 => 7.4.0}/0100-uclibc-conf.patch (100%)
 rename package/gcc/{7.3.0 => 7.4.0}/0810-arm-softfloat-libgcc.patch (100%)
 rename package/gcc/{7.3.0 => 7.4.0}/0860-cilk-fix-build-without-wchar.patch (100%)
 rename package/gcc/{7.3.0 => 7.4.0}/0892-microblaze-Revert.patch (96%)
 rename package/gcc/{7.3.0 => 7.4.0}/1000-arm-PR-target-81497-Fix-arm_acle.h-for-C.patch (97%)
 rename package/gcc/{7.3.0 => 7.4.0}/1001-gcc-define-_REENTRANT-for-RISC-V-when-pthread-is-pas.patch (94%)

diff --git a/package/gcc/7.3.0/0002-fix-building-on-ppc64.patch b/package/gcc/7.3.0/0002-fix-building-on-ppc64.patch
deleted file mode 100644
index 78a028c29a..0000000000
--- a/package/gcc/7.3.0/0002-fix-building-on-ppc64.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From aa65a43516da1d48011ef621ed5988289711d99b Mon Sep 17 00:00:00 2001
-From: marxin <marxin@138bc75d-0d04-0410-961f-82ee72b054a4>
-Date: Fri, 29 Jun 2018 09:31:30 +0000
-Subject: [PATCH] Partial backport r256656
-
-2018-06-29  Martin Liska  <mliska@suse.cz>
-
-	Backport from mainline
-	2018-01-10  Kelvin Nilsen  <kelvin@gcc.gnu.org>
-
-	* lex.c (search_line_fast): Remove illegal coercion of an
-	unaligned pointer value to vector pointer type and replace with
-	use of __builtin_vec_vsx_ld () built-in function, which operates
-	on unaligned pointer values.
-
-git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/branches/gcc-6-branch at 261621 138bc75d-0d04-0410-961f-82ee72b054a4
-
-
-git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/branches/gcc-7-branch at 262243 138bc75d-0d04-0410-961f-82ee72b054a4
-Signed-off-by: Joel Stanley <joel@jms.id.au>
----
- libcpp/lex.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/libcpp/lex.c b/libcpp/lex.c
-index 097c78002cbb..e0fb9e822c44 100644
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
diff --git a/package/gcc/7.3.0/0003-gcc-xtensa-fix-NAND-code-in-xtensa_expand_atomic.patch b/package/gcc/7.3.0/0003-gcc-xtensa-fix-NAND-code-in-xtensa_expand_atomic.patch
deleted file mode 100644
index d62d7c1566..0000000000
--- a/package/gcc/7.3.0/0003-gcc-xtensa-fix-NAND-code-in-xtensa_expand_atomic.patch
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
diff --git a/package/gcc/7.3.0/0003-xtensa-fix-PR-target-65416.patch b/package/gcc/7.3.0/0003-xtensa-fix-PR-target-65416.patch
deleted file mode 100644
index 7ead575439..0000000000
--- a/package/gcc/7.3.0/0003-xtensa-fix-PR-target-65416.patch
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
diff --git a/package/gcc/7.3.0/0004-libsanitizer-Use-pre-computed-size.patch b/package/gcc/7.3.0/0004-libsanitizer-Use-pre-computed-size.patch
deleted file mode 100644
index 6e73331eae..0000000000
--- a/package/gcc/7.3.0/0004-libsanitizer-Use-pre-computed-size.patch
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
diff --git a/package/gcc/7.3.0/0005-gcc-xtensa-don-t-force-PIC-for-uclinux-target.patch b/package/gcc/7.3.0/0005-gcc-xtensa-don-t-force-PIC-for-uclinux-target.patch
deleted file mode 100644
index 360947cbb1..0000000000
--- a/package/gcc/7.3.0/0005-gcc-xtensa-don-t-force-PIC-for-uclinux-target.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From 960a2552f7b418134cdf7a31e96023a3811b98dd Mon Sep 17 00:00:00 2001
-From: Max Filippov <jcmvbkbc@gmail.com>
-Date: Sun, 4 Nov 2018 23:55:59 -0800
-Subject: [PATCH] gcc: xtensa: don't force PIC for uclinux target
-
-xtensa-uclinux uses bFLT executable file format that cannot relocate
-fields representing offsets from data to code. C++ objects built as PIC
-use offsets to encode FDE structures. As a result C++ exception handling
-doesn't work correctly on xtensa-uclinux. Don't use PIC by default on
-xtensa-uclinux.
-
-gcc/
-2018-11-05  Max Filippov  <jcmvbkbc@gmail.com>
-
-	* config/xtensa/uclinux.h (XTENSA_ALWAYS_PIC): Change to 0.
-
-Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
----
-Backported from: r265823
-
- gcc/config/xtensa/uclinux.h | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/gcc/config/xtensa/uclinux.h b/gcc/config/xtensa/uclinux.h
-index ba26187c8f7a..c7743df9d97c 100644
---- a/gcc/config/xtensa/uclinux.h
-+++ b/gcc/config/xtensa/uclinux.h
-@@ -59,8 +59,8 @@ along with GCC; see the file COPYING3.  If not see
- #undef LOCAL_LABEL_PREFIX
- #define LOCAL_LABEL_PREFIX	"."
- 
--/* Always enable "-fpic" for Xtensa Linux.  */
--#define XTENSA_ALWAYS_PIC 1
-+/* Don't enable "-fpic" for Xtensa uclinux.  */
-+#define XTENSA_ALWAYS_PIC 0
- 
- #undef TARGET_LIBC_HAS_FUNCTION
- #define TARGET_LIBC_HAS_FUNCTION no_c99_libc_has_function
--- 
-2.11.0
-
diff --git a/package/gcc/7.3.0/0001-m68k-coldfire-pr68467.patch b/package/gcc/7.4.0/0001-m68k-coldfire-pr68467.patch
similarity index 97%
rename from package/gcc/7.3.0/0001-m68k-coldfire-pr68467.patch
rename to package/gcc/7.4.0/0001-m68k-coldfire-pr68467.patch
index 629c6496e5..0069b57134 100644
--- a/package/gcc/7.3.0/0001-m68k-coldfire-pr68467.patch
+++ b/package/gcc/7.4.0/0001-m68k-coldfire-pr68467.patch
@@ -2,7 +2,7 @@ Backport from upstream, see
 https://gcc.gnu.org/bugzilla/show_bug.cgi?id=68467
 
 Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
-
+Signed-off-by: Romain Naour <romain.naour@gmail.com>
 diff -Nur gcc-7.2.0.orig/gcc/config/m68k/m68k.c gcc-7.2.0/gcc/config/m68k/m68k.c
 --- gcc-7.2.0.orig/gcc/config/m68k/m68k.c	2017-04-03 22:30:56.274463000 +0000
 +++ gcc-7.2.0/gcc/config/m68k/m68k.c	2018-01-27 02:16:53.779367849 +0000
diff --git a/package/gcc/7.3.0/0100-uclibc-conf.patch b/package/gcc/7.4.0/0100-uclibc-conf.patch
similarity index 100%
rename from package/gcc/7.3.0/0100-uclibc-conf.patch
rename to package/gcc/7.4.0/0100-uclibc-conf.patch
diff --git a/package/gcc/7.3.0/0810-arm-softfloat-libgcc.patch b/package/gcc/7.4.0/0810-arm-softfloat-libgcc.patch
similarity index 100%
rename from package/gcc/7.3.0/0810-arm-softfloat-libgcc.patch
rename to package/gcc/7.4.0/0810-arm-softfloat-libgcc.patch
diff --git a/package/gcc/7.3.0/0860-cilk-fix-build-without-wchar.patch b/package/gcc/7.4.0/0860-cilk-fix-build-without-wchar.patch
similarity index 100%
rename from package/gcc/7.3.0/0860-cilk-fix-build-without-wchar.patch
rename to package/gcc/7.4.0/0860-cilk-fix-build-without-wchar.patch
diff --git a/package/gcc/7.3.0/0892-microblaze-Revert.patch b/package/gcc/7.4.0/0892-microblaze-Revert.patch
similarity index 96%
rename from package/gcc/7.3.0/0892-microblaze-Revert.patch
rename to package/gcc/7.4.0/0892-microblaze-Revert.patch
index 7026d0efe1..f7ea1e8382 100644
--- a/package/gcc/7.3.0/0892-microblaze-Revert.patch
+++ b/package/gcc/7.4.0/0892-microblaze-Revert.patch
@@ -14,6 +14,7 @@ Subject: [PATCH] 	Revert: 	2016-01-21  Ajit Agarwal
 
 git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/trunk at 248540 138bc75d-0d04-0410-961f-82ee72b054a4
 Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
+Signed-off-by: Romain Naour <romain.naour@gmail.com>
 diff --git a/gcc/config/microblaze/microblaze.h b/gcc/config/microblaze/microblaze.h
 index 66e4ef5..2c9ece1 100644
 --- a/gcc/config/microblaze/microblaze.h
diff --git a/package/gcc/7.3.0/1000-arm-PR-target-81497-Fix-arm_acle.h-for-C.patch b/package/gcc/7.4.0/1000-arm-PR-target-81497-Fix-arm_acle.h-for-C.patch
similarity index 97%
rename from package/gcc/7.3.0/1000-arm-PR-target-81497-Fix-arm_acle.h-for-C.patch
rename to package/gcc/7.4.0/1000-arm-PR-target-81497-Fix-arm_acle.h-for-C.patch
index 37acc8b651..fb8509fae7 100644
--- a/package/gcc/7.3.0/1000-arm-PR-target-81497-Fix-arm_acle.h-for-C.patch
+++ b/package/gcc/7.4.0/1000-arm-PR-target-81497-Fix-arm_acle.h-for-C.patch
@@ -38,11 +38,11 @@ with the first arm-specific C++ tests (in that directory).
 	* g++.target/arm/arm.exp: New file.
 	* g++.target/arm/pr81497.C: Likewise.
 
-
 git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/trunk at 261191 138bc75d-0d04-0410-961f-82ee72b054a4
 Upstream-Status: Merged (gcc-8-branch)
 Signed-off-by: Ga?l PORTAY <gael.portay@savoirfairelinux.com>
 [gportay: drop gcc/{,testsuite/}ChangeLog changes]
+Signed-off-by: Romain Naour <romain.naour@gmail.com>
 ---
  gcc/config/arm/arm-builtins.c          | 42 +++++++++++++---------
  gcc/config/arm/arm_acle.h              | 28 +++++++--------
@@ -56,7 +56,7 @@ diff --git a/gcc/config/arm/arm-builtins.c b/gcc/config/arm/arm-builtins.c
 index 7fde7a04672..183a7b907f6 100644
 --- a/gcc/config/arm/arm-builtins.c
 +++ b/gcc/config/arm/arm-builtins.c
-@@ -78,7 +78,11 @@ enum arm_type_qualifiers
+@@ -75,7 +75,11 @@ enum arm_type_qualifiers
    /* Lane indices - must be within range of previous argument = a vector.  */
    qualifier_lane_index = 0x200,
    /* Lane indices for single lane structure loads and stores.  */
@@ -69,7 +69,7 @@ index 7fde7a04672..183a7b907f6 100644
  };
  
  /*  The qualifier_internal allows generation of a unary builtin from
-@@ -202,7 +206,7 @@ arm_cdp_qualifiers[SIMD_MAX_BUILTIN_ARGS]
+@@ -185,7 +189,7 @@ arm_cdp_qualifiers[SIMD_MAX_BUILTIN_ARGS]
  static enum arm_type_qualifiers
  arm_ldc_qualifiers[SIMD_MAX_BUILTIN_ARGS]
    = { qualifier_void, qualifier_unsigned_immediate,
@@ -78,7 +78,7 @@ index 7fde7a04672..183a7b907f6 100644
  #define LDC_QUALIFIERS \
    (arm_ldc_qualifiers)
  
-@@ -210,7 +214,7 @@ arm_ldc_qualifiers[SIMD_MAX_BUILTIN_ARGS]
+@@ -193,7 +197,7 @@ arm_ldc_qualifiers[SIMD_MAX_BUILTIN_ARGS]
  static enum arm_type_qualifiers
  arm_stc_qualifiers[SIMD_MAX_BUILTIN_ARGS]
    = { qualifier_void, qualifier_unsigned_immediate,
@@ -87,7 +87,7 @@ index 7fde7a04672..183a7b907f6 100644
  #define STC_QUALIFIERS \
    (arm_stc_qualifiers)
  
-@@ -1095,19 +1099,25 @@ arm_init_builtin (unsigned int fcode, arm_builtin_datum *d,
+@@ -1079,19 +1083,25 @@ arm_init_builtin (unsigned int fcode, arm_builtin_datum *d,
        if (qualifiers & qualifier_pointer && VECTOR_MODE_P (op_mode))
  	op_mode = GET_MODE_INNER (op_mode);
  
diff --git a/package/gcc/7.3.0/1001-gcc-define-_REENTRANT-for-RISC-V-when-pthread-is-pas.patch b/package/gcc/7.4.0/1001-gcc-define-_REENTRANT-for-RISC-V-when-pthread-is-pas.patch
similarity index 94%
rename from package/gcc/7.3.0/1001-gcc-define-_REENTRANT-for-RISC-V-when-pthread-is-pas.patch
rename to package/gcc/7.4.0/1001-gcc-define-_REENTRANT-for-RISC-V-when-pthread-is-pas.patch
index 1d4f8c015f..accaf0214d 100644
--- a/package/gcc/7.3.0/1001-gcc-define-_REENTRANT-for-RISC-V-when-pthread-is-pas.patch
+++ b/package/gcc/7.4.0/1001-gcc-define-_REENTRANT-for-RISC-V-when-pthread-is-pas.patch
@@ -8,6 +8,7 @@ is defined. Added the CPP_SPEC definition from gcc 8.1.0 to correct
 this.
 
 Signed-off-by: Mark Corbin <mark.corbin@embecosm.com>
+Signed-off-by: Romain Naour <romain.naour@gmail.com>
 ---
  gcc/config/riscv/linux.h | 2 ++
  1 file changed, 2 insertions(+)
diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index 55a9c8b69f..c2925cc6dc 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -83,7 +83,7 @@ config BR2_GCC_VERSION
 	default "4.9.4"     if BR2_GCC_VERSION_4_9_X
 	default "5.5.0"     if BR2_GCC_VERSION_5_X
 	default "6.4.0"     if BR2_GCC_VERSION_6_X
-	default "7.3.0"     if BR2_GCC_VERSION_7_X
+	default "7.4.0"     if BR2_GCC_VERSION_7_X
 	default "8.2.0"     if BR2_GCC_VERSION_8_X
 	default "arc-2018.09-release" if BR2_GCC_VERSION_ARC
 	default "or1k-musl-5.4.0-20170218" if BR2_GCC_VERSION_OR1K
diff --git a/package/gcc/gcc.hash b/package/gcc/gcc.hash
index 9f671b657a..9ae7e58f6b 100644
--- a/package/gcc/gcc.hash
+++ b/package/gcc/gcc.hash
@@ -4,8 +4,8 @@ sha512  93abb78e16277454f41a8e9810f41f66c0fdffdc539a762ff6b67d3037f78db971378683
 sha512  670ff52c2ae12c7852c12987e91798c5aa8bd6daf21f0d6e0cd57a4aa59cc4f06a837fe76426eaa1424cfddca937bed377680700eadc04d76b9180d462364fa1  gcc-5.5.0.tar.xz
 # From ftp://gcc.gnu.org/pub/gcc/releases/gcc-6.4.0/sha512.sum
 sha512  02c60e54527c7adf584798d5251f8a0b80c93d5deafce82501b2c28e6692e0bd783927bbfc4bc527a863c0cccc025150a34740a9e29badb02d4b48e56a8aba90  gcc-6.4.0.tar.xz
-# From ftp://gcc.gnu.org/pub/gcc/releases/gcc-7.3.0/sha512.sum
-sha512  ad41a7e4584e40e92cdf860bc0288500fbaf5dfb7e8c3fcabe9eba809c87bcfa85b46c19c19921b0cdf6d05483faede8287bb9ea120c0d1559449a70e602c8d4  gcc-7.3.0.tar.xz
+# From ftp://gcc.gnu.org/pub/gcc/releases/gcc-7.4.0/sha512.sum
+sha512  8864d8e4b97c2e1a4f17422f6e68120172ebefeab97b1757734f7185ca68a6b9a89011c6833c03fa454c17b0ac35b15e1d284881e6971035948ac6100f3aa45e  gcc-7.4.0.tar.xz
 # From ftp://gcc.gnu.org/pub/gcc/releases/gcc-8.2.0/sha512.sum
 sha512  64898a165f67e136d802a92e7633bf1b06c85266027e52127ea025bf5fc2291b5e858288aac0bdba246e6cdf7c6ec88bc8e0e7f3f6f1985f4297710cafde56ed  gcc-8.2.0.tar.xz
 
-- 
2.19.2
