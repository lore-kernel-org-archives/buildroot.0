From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 20 Jun 2018 11:05:13 +0200
Subject: [Buildroot] [git commit] gcc: fix uclibc runtime issue with gcc-8
 for xtensa
Message-ID: <20180620090501.E2CF8890D5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=91e0fc0bf46fba21af72ccf753db7f012ebdc169
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

gcc-8.1 for xtensa miscompiles uClibc dynamic linker due to gcc PR
target/65416. The build completes successfully, but the binary is
non-functional because the following fragment in the _dl_get_ready_to_run
in ld-uClibc.so overwrites register spill area on stack causing register
corruption in the previous call frame and a subsequent crash:

    419f:       f0c1b2          addi    a11, a1, -16
    41a2:       1ba9            s32i.n  a10, a11, 4
    41a4:       0bc9            s32i.n  a12, a11, 0
    41a6:       5127f2          l32i    a15, a7, 0x144
    41a9:       1765b2          s32i    a11, a5, 92
    41ac:       4e2782          l32i    a8, a7, 0x138
    41af:       146af2          s32i    a15, a10, 80
    41b2:       001b10          movsp   a1, a11

The crash terminates the init process and causes kernel panic.
The fix prevents reordering of movsp opcode and any access to the stack
frame memory and is applicable to all existing gcc versions.

Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../gcc/6.4.0/871-xtensa-fix-PR-target-65416.patch | 101 +++++++++++++++++++++
 .../7.3.0/0002-xtensa-fix-PR-target-65416.patch    | 101 +++++++++++++++++++++
 .../8.1.0/0004-xtensa-fix-PR-target-65416.patch    | 101 +++++++++++++++++++++
 3 files changed, 303 insertions(+)

diff --git a/package/gcc/6.4.0/871-xtensa-fix-PR-target-65416.patch b/package/gcc/6.4.0/871-xtensa-fix-PR-target-65416.patch
new file mode 100644
index 0000000000..7ead575439
--- /dev/null
+++ b/package/gcc/6.4.0/871-xtensa-fix-PR-target-65416.patch
@@ -0,0 +1,101 @@
+From 87fda0741d210727672cba5e54a37a189e8ac04e Mon Sep 17 00:00:00 2001
+From: Max Filippov <jcmvbkbc@gmail.com>
+Date: Sun, 17 Jun 2018 21:18:39 -0700
+Subject: [PATCH] xtensa: fix PR target/65416
+
+The issue is caused by reordering of stack pointer update after stack
+space allocation with instructions that write to the allocated stack
+space. In windowed ABI register spill area for the previous call frame
+is located just below the stack pointer and may be reloaded back into
+the register file on movsp.
+Implement allocate_stack pattern for windowed ABI configuration and
+insert an instruction that prevents reordering of frame memory access
+and stack pointer update.
+
+gcc/
+2018-06-19  Max Filippov  <jcmvbkbc@gmail.com>
+
+	* config/xtensa/xtensa.md (UNSPEC_FRAME_BLOCKAGE): New unspec
+	constant.
+	(allocate_stack, frame_blockage, *frame_blockage): New patterns.
+
+Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
+Backported from: r261755
+---
+ gcc/config/xtensa/xtensa.md | 46 +++++++++++++++++++++++++++++++++++++++++++++
+ 1 file changed, 46 insertions(+)
+
+diff --git a/gcc/config/xtensa/xtensa.md b/gcc/config/xtensa/xtensa.md
+index 84967dbedc08..209f839cfb0f 100644
+--- a/gcc/config/xtensa/xtensa.md
++++ b/gcc/config/xtensa/xtensa.md
+@@ -38,6 +38,7 @@
+   (UNSPEC_MEMW		11)
+   (UNSPEC_LSETUP_START  12)
+   (UNSPEC_LSETUP_END    13)
++  (UNSPEC_FRAME_BLOCKAGE 14)
+ 
+   (UNSPECV_SET_FP	1)
+   (UNSPECV_ENTRY	2)
+@@ -1676,6 +1677,32 @@
+ 
+ ;; Miscellaneous instructions.
+ 
++;; In windowed ABI stack pointer adjustment must happen before any access
++;; to the space allocated on stack is allowed, otherwise register spill
++;; area may be clobbered.  That's what frame blockage is supposed to enforce.
++
++(define_expand "allocate_stack"
++  [(set (match_operand 0 "nonimmed_operand")
++        (minus (reg A1_REG) (match_operand 1 "add_operand")))
++   (set (reg A1_REG)
++        (minus (reg A1_REG) (match_dup 1)))]
++  "TARGET_WINDOWED_ABI"
++{
++  if (CONST_INT_P (operands[1]))
++    {
++      rtx neg_op0 = GEN_INT (-INTVAL (operands[1]));
++      emit_insn (gen_addsi3 (stack_pointer_rtx, stack_pointer_rtx, neg_op0));
++    }
++  else
++    {
++      emit_insn (gen_subsi3 (stack_pointer_rtx, stack_pointer_rtx,
++			     operands[1]));
++    }
++  emit_move_insn (operands[0], virtual_stack_dynamic_rtx);
++  emit_insn (gen_frame_blockage ());
++  DONE;
++})
++
+ (define_expand "prologue"
+   [(const_int 0)]
+   ""
+@@ -1767,6 +1794,25 @@
+   [(set_attr "length" "0")
+    (set_attr "type" "nop")])
+ 
++;; Do not schedule instructions accessing memory before this point.
++
++(define_expand "frame_blockage"
++  [(set (match_dup 0)
++        (unspec:BLK [(match_dup 1)] UNSPEC_FRAME_BLOCKAGE))]
++  ""
++{
++  operands[0] = gen_rtx_MEM (BLKmode, gen_rtx_SCRATCH (Pmode));
++  MEM_VOLATILE_P (operands[0]) = 1;
++  operands[1] = stack_pointer_rtx;
++})
++
++(define_insn "*frame_blockage"
++  [(set (match_operand:BLK 0 "" "")
++        (unspec:BLK [(match_operand:SI 1 "" "")] UNSPEC_FRAME_BLOCKAGE))]
++  ""
++  ""
++  [(set_attr "length" "0")])
++
+ (define_insn "trap"
+   [(trap_if (const_int 1) (const_int 0))]
+   ""
+-- 
+2.11.0
+
diff --git a/package/gcc/7.3.0/0002-xtensa-fix-PR-target-65416.patch b/package/gcc/7.3.0/0002-xtensa-fix-PR-target-65416.patch
new file mode 100644
index 0000000000..7ead575439
--- /dev/null
+++ b/package/gcc/7.3.0/0002-xtensa-fix-PR-target-65416.patch
@@ -0,0 +1,101 @@
+From 87fda0741d210727672cba5e54a37a189e8ac04e Mon Sep 17 00:00:00 2001
+From: Max Filippov <jcmvbkbc@gmail.com>
+Date: Sun, 17 Jun 2018 21:18:39 -0700
+Subject: [PATCH] xtensa: fix PR target/65416
+
+The issue is caused by reordering of stack pointer update after stack
+space allocation with instructions that write to the allocated stack
+space. In windowed ABI register spill area for the previous call frame
+is located just below the stack pointer and may be reloaded back into
+the register file on movsp.
+Implement allocate_stack pattern for windowed ABI configuration and
+insert an instruction that prevents reordering of frame memory access
+and stack pointer update.
+
+gcc/
+2018-06-19  Max Filippov  <jcmvbkbc@gmail.com>
+
+	* config/xtensa/xtensa.md (UNSPEC_FRAME_BLOCKAGE): New unspec
+	constant.
+	(allocate_stack, frame_blockage, *frame_blockage): New patterns.
+
+Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
+Backported from: r261755
+---
+ gcc/config/xtensa/xtensa.md | 46 +++++++++++++++++++++++++++++++++++++++++++++
+ 1 file changed, 46 insertions(+)
+
+diff --git a/gcc/config/xtensa/xtensa.md b/gcc/config/xtensa/xtensa.md
+index 84967dbedc08..209f839cfb0f 100644
+--- a/gcc/config/xtensa/xtensa.md
++++ b/gcc/config/xtensa/xtensa.md
+@@ -38,6 +38,7 @@
+   (UNSPEC_MEMW		11)
+   (UNSPEC_LSETUP_START  12)
+   (UNSPEC_LSETUP_END    13)
++  (UNSPEC_FRAME_BLOCKAGE 14)
+ 
+   (UNSPECV_SET_FP	1)
+   (UNSPECV_ENTRY	2)
+@@ -1676,6 +1677,32 @@
+ 
+ ;; Miscellaneous instructions.
+ 
++;; In windowed ABI stack pointer adjustment must happen before any access
++;; to the space allocated on stack is allowed, otherwise register spill
++;; area may be clobbered.  That's what frame blockage is supposed to enforce.
++
++(define_expand "allocate_stack"
++  [(set (match_operand 0 "nonimmed_operand")
++        (minus (reg A1_REG) (match_operand 1 "add_operand")))
++   (set (reg A1_REG)
++        (minus (reg A1_REG) (match_dup 1)))]
++  "TARGET_WINDOWED_ABI"
++{
++  if (CONST_INT_P (operands[1]))
++    {
++      rtx neg_op0 = GEN_INT (-INTVAL (operands[1]));
++      emit_insn (gen_addsi3 (stack_pointer_rtx, stack_pointer_rtx, neg_op0));
++    }
++  else
++    {
++      emit_insn (gen_subsi3 (stack_pointer_rtx, stack_pointer_rtx,
++			     operands[1]));
++    }
++  emit_move_insn (operands[0], virtual_stack_dynamic_rtx);
++  emit_insn (gen_frame_blockage ());
++  DONE;
++})
++
+ (define_expand "prologue"
+   [(const_int 0)]
+   ""
+@@ -1767,6 +1794,25 @@
+   [(set_attr "length" "0")
+    (set_attr "type" "nop")])
+ 
++;; Do not schedule instructions accessing memory before this point.
++
++(define_expand "frame_blockage"
++  [(set (match_dup 0)
++        (unspec:BLK [(match_dup 1)] UNSPEC_FRAME_BLOCKAGE))]
++  ""
++{
++  operands[0] = gen_rtx_MEM (BLKmode, gen_rtx_SCRATCH (Pmode));
++  MEM_VOLATILE_P (operands[0]) = 1;
++  operands[1] = stack_pointer_rtx;
++})
++
++(define_insn "*frame_blockage"
++  [(set (match_operand:BLK 0 "" "")
++        (unspec:BLK [(match_operand:SI 1 "" "")] UNSPEC_FRAME_BLOCKAGE))]
++  ""
++  ""
++  [(set_attr "length" "0")])
++
+ (define_insn "trap"
+   [(trap_if (const_int 1) (const_int 0))]
+   ""
+-- 
+2.11.0
+
diff --git a/package/gcc/8.1.0/0004-xtensa-fix-PR-target-65416.patch b/package/gcc/8.1.0/0004-xtensa-fix-PR-target-65416.patch
new file mode 100644
index 0000000000..7ead575439
--- /dev/null
+++ b/package/gcc/8.1.0/0004-xtensa-fix-PR-target-65416.patch
@@ -0,0 +1,101 @@
+From 87fda0741d210727672cba5e54a37a189e8ac04e Mon Sep 17 00:00:00 2001
+From: Max Filippov <jcmvbkbc@gmail.com>
+Date: Sun, 17 Jun 2018 21:18:39 -0700
+Subject: [PATCH] xtensa: fix PR target/65416
+
+The issue is caused by reordering of stack pointer update after stack
+space allocation with instructions that write to the allocated stack
+space. In windowed ABI register spill area for the previous call frame
+is located just below the stack pointer and may be reloaded back into
+the register file on movsp.
+Implement allocate_stack pattern for windowed ABI configuration and
+insert an instruction that prevents reordering of frame memory access
+and stack pointer update.
+
+gcc/
+2018-06-19  Max Filippov  <jcmvbkbc@gmail.com>
+
+	* config/xtensa/xtensa.md (UNSPEC_FRAME_BLOCKAGE): New unspec
+	constant.
+	(allocate_stack, frame_blockage, *frame_blockage): New patterns.
+
+Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
+Backported from: r261755
+---
+ gcc/config/xtensa/xtensa.md | 46 +++++++++++++++++++++++++++++++++++++++++++++
+ 1 file changed, 46 insertions(+)
+
+diff --git a/gcc/config/xtensa/xtensa.md b/gcc/config/xtensa/xtensa.md
+index 84967dbedc08..209f839cfb0f 100644
+--- a/gcc/config/xtensa/xtensa.md
++++ b/gcc/config/xtensa/xtensa.md
+@@ -38,6 +38,7 @@
+   (UNSPEC_MEMW		11)
+   (UNSPEC_LSETUP_START  12)
+   (UNSPEC_LSETUP_END    13)
++  (UNSPEC_FRAME_BLOCKAGE 14)
+ 
+   (UNSPECV_SET_FP	1)
+   (UNSPECV_ENTRY	2)
+@@ -1676,6 +1677,32 @@
+ 
+ ;; Miscellaneous instructions.
+ 
++;; In windowed ABI stack pointer adjustment must happen before any access
++;; to the space allocated on stack is allowed, otherwise register spill
++;; area may be clobbered.  That's what frame blockage is supposed to enforce.
++
++(define_expand "allocate_stack"
++  [(set (match_operand 0 "nonimmed_operand")
++        (minus (reg A1_REG) (match_operand 1 "add_operand")))
++   (set (reg A1_REG)
++        (minus (reg A1_REG) (match_dup 1)))]
++  "TARGET_WINDOWED_ABI"
++{
++  if (CONST_INT_P (operands[1]))
++    {
++      rtx neg_op0 = GEN_INT (-INTVAL (operands[1]));
++      emit_insn (gen_addsi3 (stack_pointer_rtx, stack_pointer_rtx, neg_op0));
++    }
++  else
++    {
++      emit_insn (gen_subsi3 (stack_pointer_rtx, stack_pointer_rtx,
++			     operands[1]));
++    }
++  emit_move_insn (operands[0], virtual_stack_dynamic_rtx);
++  emit_insn (gen_frame_blockage ());
++  DONE;
++})
++
+ (define_expand "prologue"
+   [(const_int 0)]
+   ""
+@@ -1767,6 +1794,25 @@
+   [(set_attr "length" "0")
+    (set_attr "type" "nop")])
+ 
++;; Do not schedule instructions accessing memory before this point.
++
++(define_expand "frame_blockage"
++  [(set (match_dup 0)
++        (unspec:BLK [(match_dup 1)] UNSPEC_FRAME_BLOCKAGE))]
++  ""
++{
++  operands[0] = gen_rtx_MEM (BLKmode, gen_rtx_SCRATCH (Pmode));
++  MEM_VOLATILE_P (operands[0]) = 1;
++  operands[1] = stack_pointer_rtx;
++})
++
++(define_insn "*frame_blockage"
++  [(set (match_operand:BLK 0 "" "")
++        (unspec:BLK [(match_operand:SI 1 "" "")] UNSPEC_FRAME_BLOCKAGE))]
++  ""
++  ""
++  [(set_attr "length" "0")])
++
+ (define_insn "trap"
+   [(trap_if (const_int 1) (const_int 0))]
+   ""
+-- 
+2.11.0
+
