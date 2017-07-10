From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Mon, 10 Jul 2017 14:29:41 +0200
Subject: [Buildroot] [PATCH] gcc: bump 6.x series to version 6.4.0
Message-ID: <20170710122941.26082-1-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Drop the following patches:
  * the Xtensa patches 870 and 871 are upstream now
  * patch 942 was backported from GCC 6 branch

Note, that a bz2 release tarball is not provided anymore and is replaced by a xz
tarball file.

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
---
 .../gcc/6.3.0/870-xtensa-Fix-PR-target-78118.patch | 320 ---------------------
 .../gcc/6.3.0/871-xtensa-Fix-PR-target-78603.patch |  37 ---
 .../6.3.0/942-ubsan-fix-check-empty-string.patch   |  40 ---
 package/gcc/{6.3.0 => 6.4.0}/100-uclibc-conf.patch |   0
 .../{6.3.0 => 6.4.0}/301-missing-execinfo_h.patch  |   0
 .../810-arm-softfloat-libgcc.patch                 |   0
 .../{6.3.0 => 6.4.0}/830-arm_unbreak_armv4t.patch  |   0
 ...et-70473-Reduce-size-of-Cortex-A8-automat.patch |   0
 package/gcc/{6.3.0 => 6.4.0}/860-cilk-wchar.patch  |   0
 .../{6.3.0 => 6.4.0}/890-fix-m68k-compile.patch    |   0
 .../{6.3.0 => 6.4.0}/891-fix-m68k-uclinux.patch    |   0
 ...bgcc-mkmap-symver-support-skip_underscore.patch |   0
 ...ig-bfin-use-the-generic-linker-version-in.patch |   0
 ...-fix-DWARF-compilation-with-FDPIC-targets.patch |   0
 .../895-bfin-define-REENTRANT.patch                |   0
 .../{6.3.0 => 6.4.0}/896-microblaze-Revert.patch   |   0
 ...laze-support-DWARF-EH-old-Xilinx-patch-ne.patch |   0
 .../940-uclinux-enable-threads.patch               |   0
 .../941-mips-Add-support-for-mips-r6-musl.patch    |   0
 package/gcc/Config.in.host                         |   2 +-
 package/gcc/gcc.hash                               |   4 +-
 package/gcc/gcc.mk                                 |   6 +
 22 files changed, 9 insertions(+), 400 deletions(-)
 delete mode 100644 package/gcc/6.3.0/870-xtensa-Fix-PR-target-78118.patch
 delete mode 100644 package/gcc/6.3.0/871-xtensa-Fix-PR-target-78603.patch
 delete mode 100644 package/gcc/6.3.0/942-ubsan-fix-check-empty-string.patch
 rename package/gcc/{6.3.0 => 6.4.0}/100-uclibc-conf.patch (100%)
 rename package/gcc/{6.3.0 => 6.4.0}/301-missing-execinfo_h.patch (100%)
 rename package/gcc/{6.3.0 => 6.4.0}/810-arm-softfloat-libgcc.patch (100%)
 rename package/gcc/{6.3.0 => 6.4.0}/830-arm_unbreak_armv4t.patch (100%)
 rename package/gcc/{6.3.0 => 6.4.0}/831-ARM-PR-target-70473-Reduce-size-of-Cortex-A8-automat.patch (100%)
 rename package/gcc/{6.3.0 => 6.4.0}/860-cilk-wchar.patch (100%)
 rename package/gcc/{6.3.0 => 6.4.0}/890-fix-m68k-compile.patch (100%)
 rename package/gcc/{6.3.0 => 6.4.0}/891-fix-m68k-uclinux.patch (100%)
 rename package/gcc/{6.3.0 => 6.4.0}/892-libgcc-mkmap-symver-support-skip_underscore.patch (100%)
 rename package/gcc/{6.3.0 => 6.4.0}/893-libgcc-config-bfin-use-the-generic-linker-version-in.patch (100%)
 rename package/gcc/{6.3.0 => 6.4.0}/894-libgcc-fix-DWARF-compilation-with-FDPIC-targets.patch (100%)
 rename package/gcc/{6.3.0 => 6.4.0}/895-bfin-define-REENTRANT.patch (100%)
 rename package/gcc/{6.3.0 => 6.4.0}/896-microblaze-Revert.patch (100%)
 rename package/gcc/{6.3.0 => 6.4.0}/897-Make-MicroBlaze-support-DWARF-EH-old-Xilinx-patch-ne.patch (100%)
 rename package/gcc/{6.3.0 => 6.4.0}/940-uclinux-enable-threads.patch (100%)
 rename package/gcc/{6.3.0 => 6.4.0}/941-mips-Add-support-for-mips-r6-musl.patch (100%)

diff --git a/package/gcc/6.3.0/870-xtensa-Fix-PR-target-78118.patch b/package/gcc/6.3.0/870-xtensa-Fix-PR-target-78118.patch
deleted file mode 100644
index 0598c76c2f..0000000000
--- a/package/gcc/6.3.0/870-xtensa-Fix-PR-target-78118.patch
+++ /dev/null
@@ -1,320 +0,0 @@
-From 0d2556fa652cc85b3d042e862a38dd07d454175a Mon Sep 17 00:00:00 2001
-From: Max Filippov <jcmvbkbc@gmail.com>
-Date: Wed, 26 Oct 2016 08:02:51 +0000
-Subject: [PATCH 1/2] xtensa: Fix PR target/78118
-
-It started failing after the following commit: 32e90dc6a0cda45 ("PR
-rtl-optimization/61047").
-
-The change that made xtensa backend go ICE looks completely unrelated,
-and indeed, the issue is caused by the side effect of
-compute_frame_size() function call hidden in the
-INITIAL_ELIMINATION_OFFSET macro. This call updates the value of the
-xtensa_current_frame_size static variable, used in "return" instruction
-predicate. Prior to the change the value of xtensa_current_frame_size was
-set to 0 after the end of epilogue generation, which enabled the "return"
-instruction for the CALL0 ABI, but after the change the additional
-INITIAL_ELIMINATION_OFFSET calls make xtensa_current_frame_size non-zero
-and "return" pattern unavailable.
-
-Get rid of the global xtensa_current_frame_size and
-xtensa_callee_save_size variables by moving them into the
-machine_function structure. Implement predicate for the "return" pattern
-as a function. Don't communicate completion of epilogue generation
-through zeroing of xtensa_current_frame_size, add explicit epilogue_done
-variable to the machine_function structure. Don't update stack frame
-layout after the completion of reload.
-
-2016-10-26  Max Filippov  <jcmvbkbc@gmail.com>
-gcc/
-	* config/xtensa/xtensa-protos.h
-	(xtensa_use_return_instruction_p): New prototype.
-	* config/xtensa/xtensa.c (xtensa_current_frame_size,
-	xtensa_callee_save_size): Remove.
-	(struct machine_function): Add new fields: current_frame_size,
-	callee_save_size, frame_laid_out and epilogue_done.
-	(compute_frame_size, xtensa_expand_prologue,
-	xtensa_expand_epilogue): Replace xtensa_callee_save_size with
-	cfun->machine->callee_save_size and xtensa_current_frame_size
-	with cfun->machine->current_frame_size.
-	(compute_frame_size): Update cfun->machine->frame_laid_out and
-	don't update frame layout after reload completion.
-	(xtensa_expand_epilogue): Set cfun->machine->epilogue_done
-	instead of zeroing xtensa_current_frame_size.
-	(xtensa_use_return_instruction_p): New function.
-	* config/xtensa/xtensa.h (xtensa_current_frame_size): Remove
-	declaration.
-	(INITIAL_ELIMINATION_OFFSET): Use return value of
-	compute_frame_size instead of xtensa_current_frame_size value.
-	* config/xtensa/xtensa.md ("return" pattern): Use new predicate
-	function xtensa_use_return_instruction_p instead of inline code.
-
-Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
----
-Backported from: r241748
-
- gcc/config/xtensa/xtensa-protos.h |  1 +
- gcc/config/xtensa/xtensa.c        | 82 ++++++++++++++++++++++++---------------
- gcc/config/xtensa/xtensa.h        |  6 +--
- gcc/config/xtensa/xtensa.md       |  2 +-
- 4 files changed, 55 insertions(+), 36 deletions(-)
-
-diff --git a/gcc/config/xtensa/xtensa-protos.h b/gcc/config/xtensa/xtensa-protos.h
-index f2ca526..873557f 100644
---- a/gcc/config/xtensa/xtensa-protos.h
-+++ b/gcc/config/xtensa/xtensa-protos.h
-@@ -68,6 +68,7 @@ extern rtx xtensa_return_addr (int, rtx);
- extern void xtensa_setup_frame_addresses (void);
- extern int xtensa_dbx_register_number (int);
- extern long compute_frame_size (int);
-+extern bool xtensa_use_return_instruction_p (void);
- extern void xtensa_expand_prologue (void);
- extern void xtensa_expand_epilogue (void);
- extern void order_regs_for_local_alloc (void);
-diff --git a/gcc/config/xtensa/xtensa.c b/gcc/config/xtensa/xtensa.c
-index 64d089b..e49f784 100644
---- a/gcc/config/xtensa/xtensa.c
-+++ b/gcc/config/xtensa/xtensa.c
-@@ -78,11 +78,6 @@ enum internal_test
-    can support a given mode.  */
- char xtensa_hard_regno_mode_ok[(int) MAX_MACHINE_MODE][FIRST_PSEUDO_REGISTER];
- 
--/* Current frame size calculated by compute_frame_size.  */
--unsigned xtensa_current_frame_size;
--/* Callee-save area size in the current frame calculated by compute_frame_size. */
--int xtensa_callee_save_size;
--
- /* Largest block move to handle in-line.  */
- #define LARGEST_MOVE_RATIO 15
- 
-@@ -94,6 +89,13 @@ struct GTY(()) machine_function
-   bool vararg_a7;
-   rtx vararg_a7_copy;
-   rtx_insn *set_frame_ptr_insn;
-+  /* Current frame size calculated by compute_frame_size.  */
-+  unsigned current_frame_size;
-+  /* Callee-save area size in the current frame calculated by
-+     compute_frame_size.  */
-+  int callee_save_size;
-+  bool frame_laid_out;
-+  bool epilogue_done;
- };
- 
- /* Vector, indexed by hard register number, which contains 1 for a
-@@ -2628,24 +2630,29 @@ compute_frame_size (int size)
- {
-   int regno;
- 
-+  if (reload_completed && cfun->machine->frame_laid_out)
-+    return cfun->machine->current_frame_size;
-+
-   /* Add space for the incoming static chain value.  */
-   if (cfun->static_chain_decl != NULL)
-     size += (1 * UNITS_PER_WORD);
- 
--  xtensa_callee_save_size = 0;
-+  cfun->machine->callee_save_size = 0;
-   for (regno = 0; regno < FIRST_PSEUDO_REGISTER; ++regno)
-     {
-       if (xtensa_call_save_reg(regno))
--	xtensa_callee_save_size += UNITS_PER_WORD;
-+	cfun->machine->callee_save_size += UNITS_PER_WORD;
-     }
- 
--  xtensa_current_frame_size =
-+  cfun->machine->current_frame_size =
-     XTENSA_STACK_ALIGN (size
--			+ xtensa_callee_save_size
-+			+ cfun->machine->callee_save_size
- 			+ crtl->outgoing_args_size
- 			+ (WINDOW_SIZE * UNITS_PER_WORD));
--  xtensa_callee_save_size = XTENSA_STACK_ALIGN (xtensa_callee_save_size);
--  return xtensa_current_frame_size;
-+  cfun->machine->callee_save_size =
-+    XTENSA_STACK_ALIGN (cfun->machine->callee_save_size);
-+  cfun->machine->frame_laid_out = true;
-+  return cfun->machine->current_frame_size;
- }
- 
- 
-@@ -2696,6 +2703,7 @@ xtensa_expand_prologue (void)
-     {
-       int regno;
-       HOST_WIDE_INT offset = 0;
-+      int callee_save_size = cfun->machine->callee_save_size;
- 
-       /* -128 is a limit of single addi instruction. */
-       if (total_size > 0 && total_size <= 128)
-@@ -2709,7 +2717,7 @@ xtensa_expand_prologue (void)
- 	  add_reg_note (insn, REG_FRAME_RELATED_EXPR, note_rtx);
- 	  offset = total_size - UNITS_PER_WORD;
- 	}
--      else if (xtensa_callee_save_size)
-+      else if (callee_save_size)
- 	{
- 	  /* 1020 is maximal s32i offset, if the frame is bigger than that
- 	   * we move sp to the end of callee-saved save area, save and then
-@@ -2717,13 +2725,13 @@ xtensa_expand_prologue (void)
- 	  if (total_size > 1024)
- 	    {
- 	      insn = emit_insn (gen_addsi3 (stack_pointer_rtx, stack_pointer_rtx,
--					    GEN_INT (-xtensa_callee_save_size)));
-+					    GEN_INT (-callee_save_size)));
- 	      RTX_FRAME_RELATED_P (insn) = 1;
- 	      note_rtx = gen_rtx_SET (stack_pointer_rtx,
- 				      plus_constant (Pmode, stack_pointer_rtx,
--						     -xtensa_callee_save_size));
-+						     -callee_save_size));
- 	      add_reg_note (insn, REG_FRAME_RELATED_EXPR, note_rtx);
--	      offset = xtensa_callee_save_size - UNITS_PER_WORD;
-+	      offset = callee_save_size - UNITS_PER_WORD;
- 	    }
- 	  else
- 	    {
-@@ -2759,13 +2767,13 @@ xtensa_expand_prologue (void)
- 	{
- 	  rtx tmp_reg = gen_rtx_REG (Pmode, A9_REG);
- 	  emit_move_insn (tmp_reg, GEN_INT (total_size -
--					    xtensa_callee_save_size));
-+					    callee_save_size));
- 	  insn = emit_insn (gen_subsi3 (stack_pointer_rtx,
- 					stack_pointer_rtx, tmp_reg));
- 	  RTX_FRAME_RELATED_P (insn) = 1;
- 	  note_rtx = gen_rtx_SET (stack_pointer_rtx,
- 				  plus_constant (Pmode, stack_pointer_rtx,
--						 xtensa_callee_save_size -
-+						 callee_save_size -
- 						 total_size));
- 	  add_reg_note (insn, REG_FRAME_RELATED_EXPR, note_rtx);
- 	}
-@@ -2833,21 +2841,21 @@ xtensa_expand_epilogue (void)
-       int regno;
-       HOST_WIDE_INT offset;
- 
--      if (xtensa_current_frame_size > (frame_pointer_needed ? 127 : 1024))
-+      if (cfun->machine->current_frame_size > (frame_pointer_needed ? 127 : 1024))
- 	{
- 	  rtx tmp_reg = gen_rtx_REG (Pmode, A9_REG);
--	  emit_move_insn (tmp_reg, GEN_INT (xtensa_current_frame_size -
--					    xtensa_callee_save_size));
-+	  emit_move_insn (tmp_reg, GEN_INT (cfun->machine->current_frame_size -
-+					    cfun->machine->callee_save_size));
- 	  emit_insn (gen_addsi3 (stack_pointer_rtx, frame_pointer_needed ?
- 				 hard_frame_pointer_rtx : stack_pointer_rtx,
- 				 tmp_reg));
--	  offset = xtensa_callee_save_size - UNITS_PER_WORD;
-+	  offset = cfun->machine->callee_save_size - UNITS_PER_WORD;
- 	}
-       else
- 	{
- 	  if (frame_pointer_needed)
- 	    emit_move_insn (stack_pointer_rtx, hard_frame_pointer_rtx);
--	  offset = xtensa_current_frame_size - UNITS_PER_WORD;
-+	  offset = cfun->machine->current_frame_size - UNITS_PER_WORD;
- 	}
- 
-       /* Prevent reordering of saved a0 update and loading it back from
-@@ -2867,16 +2875,16 @@ xtensa_expand_epilogue (void)
- 	    }
- 	}
- 
--      if (xtensa_current_frame_size > 0)
-+      if (cfun->machine->current_frame_size > 0)
- 	{
- 	  if (frame_pointer_needed || /* always reachable with addi */
--	      xtensa_current_frame_size > 1024 ||
--	      xtensa_current_frame_size <= 127)
-+	      cfun->machine->current_frame_size > 1024 ||
-+	      cfun->machine->current_frame_size <= 127)
- 	    {
--	      if (xtensa_current_frame_size <= 127)
--		offset = xtensa_current_frame_size;
-+	      if (cfun->machine->current_frame_size <= 127)
-+		offset = cfun->machine->current_frame_size;
- 	      else
--		offset = xtensa_callee_save_size;
-+		offset = cfun->machine->callee_save_size;
- 
- 	      emit_insn (gen_addsi3 (stack_pointer_rtx,
- 				     stack_pointer_rtx,
-@@ -2885,7 +2893,8 @@ xtensa_expand_epilogue (void)
- 	  else
- 	    {
- 	      rtx tmp_reg = gen_rtx_REG (Pmode, A9_REG);
--	      emit_move_insn (tmp_reg, GEN_INT (xtensa_current_frame_size));
-+	      emit_move_insn (tmp_reg,
-+			      GEN_INT (cfun->machine->current_frame_size));
- 	      emit_insn (gen_addsi3 (stack_pointer_rtx, stack_pointer_rtx,
- 				     tmp_reg));
- 	    }
-@@ -2896,11 +2905,22 @@ xtensa_expand_epilogue (void)
- 				  stack_pointer_rtx,
- 				  EH_RETURN_STACKADJ_RTX));
-     }
--  xtensa_current_frame_size = 0;
--  xtensa_callee_save_size = 0;
-+  cfun->machine->epilogue_done = true;
-   emit_jump_insn (gen_return ());
- }
- 
-+bool
-+xtensa_use_return_instruction_p (void)
-+{
-+  if (!reload_completed)
-+    return false;
-+  if (TARGET_WINDOWED_ABI)
-+    return true;
-+  if (compute_frame_size (get_frame_size ()) == 0)
-+    return true;
-+  return cfun->machine->epilogue_done;
-+}
-+
- void
- xtensa_set_return_address (rtx address, rtx scratch)
- {
-diff --git a/gcc/config/xtensa/xtensa.h b/gcc/config/xtensa/xtensa.h
-index 82e9900..58eb1b2 100644
---- a/gcc/config/xtensa/xtensa.h
-+++ b/gcc/config/xtensa/xtensa.h
-@@ -23,8 +23,6 @@ along with GCC; see the file COPYING3.  If not see
- 
- /* External variables defined in xtensa.c.  */
- 
--extern unsigned xtensa_current_frame_size;
--
- /* Macros used in the machine description to select various Xtensa
-    configuration options.  */
- #ifndef XCHAL_HAVE_MUL32_HIGH
-@@ -477,14 +475,14 @@ enum reg_class
- /* Specify the initial difference between the specified pair of registers.  */
- #define INITIAL_ELIMINATION_OFFSET(FROM, TO, OFFSET)			\
-   do {									\
--    compute_frame_size (get_frame_size ());				\
-+    long frame_size = compute_frame_size (get_frame_size ());		\
-     switch (FROM)							\
-       {									\
-       case FRAME_POINTER_REGNUM:					\
-         (OFFSET) = 0;							\
- 	break;								\
-       case ARG_POINTER_REGNUM:						\
--        (OFFSET) = xtensa_current_frame_size;				\
-+        (OFFSET) = frame_size;						\
- 	break;								\
-       default:								\
- 	gcc_unreachable ();						\
-diff --git a/gcc/config/xtensa/xtensa.md b/gcc/config/xtensa/xtensa.md
-index db54a12..fcdb6c8 100644
---- a/gcc/config/xtensa/xtensa.md
-+++ b/gcc/config/xtensa/xtensa.md
-@@ -1663,7 +1663,7 @@
- (define_insn "return"
-   [(return)
-    (use (reg:SI A0_REG))]
--  "(TARGET_WINDOWED_ABI || !xtensa_current_frame_size) && reload_completed"
-+  "xtensa_use_return_instruction_p ()"
- {
-   return TARGET_WINDOWED_ABI ?
-       (TARGET_DENSITY ? "retw.n" : "retw") :
--- 
-2.1.4
-
diff --git a/package/gcc/6.3.0/871-xtensa-Fix-PR-target-78603.patch b/package/gcc/6.3.0/871-xtensa-Fix-PR-target-78603.patch
deleted file mode 100644
index 0331814398..0000000000
--- a/package/gcc/6.3.0/871-xtensa-Fix-PR-target-78603.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From 59cce7b304a8cbbb508ba21ab2f9052d3ee9a9e3 Mon Sep 17 00:00:00 2001
-From: Max Filippov <jcmvbkbc@gmail.com>
-Date: Tue, 29 Nov 2016 13:09:17 -0800
-Subject: [PATCH 2/2] xtensa: Fix PR target/78603
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
-index e49f784..70f698a 100644
---- a/gcc/config/xtensa/xtensa.c
-+++ b/gcc/config/xtensa/xtensa.c
-@@ -4158,7 +4158,10 @@ hwloop_optimize (hwloop_info loop)
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
diff --git a/package/gcc/6.3.0/942-ubsan-fix-check-empty-string.patch b/package/gcc/6.3.0/942-ubsan-fix-check-empty-string.patch
deleted file mode 100644
index 98e627053b..0000000000
--- a/package/gcc/6.3.0/942-ubsan-fix-check-empty-string.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From 8db2cf6353c13f2a84cbe49b689654897906c499 Mon Sep 17 00:00:00 2001
-From: kyukhin <kyukhin@138bc75d-0d04-0410-961f-82ee72b054a4>
-Date: Sat, 3 Sep 2016 10:57:05 +0000
-Subject: [PATCH] gcc/ubsan.c: Fix check for empty string
-
-Building host-gcc-initial with GCC7 on the host fails due to the
-comparison of a pointer to an integer in ubsan_use_new_style_p, which
-is forbidden by ISO C++:
-
-ubsan.c:1474:23: error: ISO C++ forbids comparison between pointer and
-integer [-fpermissive]
-       || xloc.file == '\0' || xloc.file[0] == '\xff'
-
-Backport the fix from upstream GCC to enable the build with GCC 7.
-
-Backported from:
-https://gcc.gnu.org/viewcvs/gcc?view=revision&revision=239971
-
-Signed-off-by: Joshua Lock <joshua.g.lock@intel.com>
-[Add commit log from [1]]
-Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
-
-[1] https://patchwork.openembedded.org/patch/138884/
----
- gcc/ubsan.c   | 2 +-
- 2 files changed, 5 insertions(+), 1 deletion(-)
-
-Index: gcc-6.3.0/gcc/ubsan.c
-===================================================================
---- gcc-6.3.0.orig/gcc/ubsan.c
-+++ gcc-6.3.0/gcc/ubsan.c
-@@ -1471,7 +1471,7 @@ ubsan_use_new_style_p (location_t loc)
- 
-   expanded_location xloc = expand_location (loc);
-   if (xloc.file == NULL || strncmp (xloc.file, "\1", 2) == 0
--      || xloc.file == '\0' || xloc.file[0] == '\xff'
-+      || xloc.file[0] == '\0' || xloc.file[0] == '\xff'
-       || xloc.file[1] == '\xff')
-     return false;
- 
diff --git a/package/gcc/6.3.0/100-uclibc-conf.patch b/package/gcc/6.4.0/100-uclibc-conf.patch
similarity index 100%
rename from package/gcc/6.3.0/100-uclibc-conf.patch
rename to package/gcc/6.4.0/100-uclibc-conf.patch
diff --git a/package/gcc/6.3.0/301-missing-execinfo_h.patch b/package/gcc/6.4.0/301-missing-execinfo_h.patch
similarity index 100%
rename from package/gcc/6.3.0/301-missing-execinfo_h.patch
rename to package/gcc/6.4.0/301-missing-execinfo_h.patch
diff --git a/package/gcc/6.3.0/810-arm-softfloat-libgcc.patch b/package/gcc/6.4.0/810-arm-softfloat-libgcc.patch
similarity index 100%
rename from package/gcc/6.3.0/810-arm-softfloat-libgcc.patch
rename to package/gcc/6.4.0/810-arm-softfloat-libgcc.patch
diff --git a/package/gcc/6.3.0/830-arm_unbreak_armv4t.patch b/package/gcc/6.4.0/830-arm_unbreak_armv4t.patch
similarity index 100%
rename from package/gcc/6.3.0/830-arm_unbreak_armv4t.patch
rename to package/gcc/6.4.0/830-arm_unbreak_armv4t.patch
diff --git a/package/gcc/6.3.0/831-ARM-PR-target-70473-Reduce-size-of-Cortex-A8-automat.patch b/package/gcc/6.4.0/831-ARM-PR-target-70473-Reduce-size-of-Cortex-A8-automat.patch
similarity index 100%
rename from package/gcc/6.3.0/831-ARM-PR-target-70473-Reduce-size-of-Cortex-A8-automat.patch
rename to package/gcc/6.4.0/831-ARM-PR-target-70473-Reduce-size-of-Cortex-A8-automat.patch
diff --git a/package/gcc/6.3.0/860-cilk-wchar.patch b/package/gcc/6.4.0/860-cilk-wchar.patch
similarity index 100%
rename from package/gcc/6.3.0/860-cilk-wchar.patch
rename to package/gcc/6.4.0/860-cilk-wchar.patch
diff --git a/package/gcc/6.3.0/890-fix-m68k-compile.patch b/package/gcc/6.4.0/890-fix-m68k-compile.patch
similarity index 100%
rename from package/gcc/6.3.0/890-fix-m68k-compile.patch
rename to package/gcc/6.4.0/890-fix-m68k-compile.patch
diff --git a/package/gcc/6.3.0/891-fix-m68k-uclinux.patch b/package/gcc/6.4.0/891-fix-m68k-uclinux.patch
similarity index 100%
rename from package/gcc/6.3.0/891-fix-m68k-uclinux.patch
rename to package/gcc/6.4.0/891-fix-m68k-uclinux.patch
diff --git a/package/gcc/6.3.0/892-libgcc-mkmap-symver-support-skip_underscore.patch b/package/gcc/6.4.0/892-libgcc-mkmap-symver-support-skip_underscore.patch
similarity index 100%
rename from package/gcc/6.3.0/892-libgcc-mkmap-symver-support-skip_underscore.patch
rename to package/gcc/6.4.0/892-libgcc-mkmap-symver-support-skip_underscore.patch
diff --git a/package/gcc/6.3.0/893-libgcc-config-bfin-use-the-generic-linker-version-in.patch b/package/gcc/6.4.0/893-libgcc-config-bfin-use-the-generic-linker-version-in.patch
similarity index 100%
rename from package/gcc/6.3.0/893-libgcc-config-bfin-use-the-generic-linker-version-in.patch
rename to package/gcc/6.4.0/893-libgcc-config-bfin-use-the-generic-linker-version-in.patch
diff --git a/package/gcc/6.3.0/894-libgcc-fix-DWARF-compilation-with-FDPIC-targets.patch b/package/gcc/6.4.0/894-libgcc-fix-DWARF-compilation-with-FDPIC-targets.patch
similarity index 100%
rename from package/gcc/6.3.0/894-libgcc-fix-DWARF-compilation-with-FDPIC-targets.patch
rename to package/gcc/6.4.0/894-libgcc-fix-DWARF-compilation-with-FDPIC-targets.patch
diff --git a/package/gcc/6.3.0/895-bfin-define-REENTRANT.patch b/package/gcc/6.4.0/895-bfin-define-REENTRANT.patch
similarity index 100%
rename from package/gcc/6.3.0/895-bfin-define-REENTRANT.patch
rename to package/gcc/6.4.0/895-bfin-define-REENTRANT.patch
diff --git a/package/gcc/6.3.0/896-microblaze-Revert.patch b/package/gcc/6.4.0/896-microblaze-Revert.patch
similarity index 100%
rename from package/gcc/6.3.0/896-microblaze-Revert.patch
rename to package/gcc/6.4.0/896-microblaze-Revert.patch
diff --git a/package/gcc/6.3.0/897-Make-MicroBlaze-support-DWARF-EH-old-Xilinx-patch-ne.patch b/package/gcc/6.4.0/897-Make-MicroBlaze-support-DWARF-EH-old-Xilinx-patch-ne.patch
similarity index 100%
rename from package/gcc/6.3.0/897-Make-MicroBlaze-support-DWARF-EH-old-Xilinx-patch-ne.patch
rename to package/gcc/6.4.0/897-Make-MicroBlaze-support-DWARF-EH-old-Xilinx-patch-ne.patch
diff --git a/package/gcc/6.3.0/940-uclinux-enable-threads.patch b/package/gcc/6.4.0/940-uclinux-enable-threads.patch
similarity index 100%
rename from package/gcc/6.3.0/940-uclinux-enable-threads.patch
rename to package/gcc/6.4.0/940-uclinux-enable-threads.patch
diff --git a/package/gcc/6.3.0/941-mips-Add-support-for-mips-r6-musl.patch b/package/gcc/6.4.0/941-mips-Add-support-for-mips-r6-musl.patch
similarity index 100%
rename from package/gcc/6.3.0/941-mips-Add-support-for-mips-r6-musl.patch
rename to package/gcc/6.4.0/941-mips-Add-support-for-mips-r6-musl.patch
diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index 5dcaa03ff0..8eaf307473 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -89,7 +89,7 @@ config BR2_GCC_VERSION
 	string
 	default "4.9.4"     if BR2_GCC_VERSION_4_9_X
 	default "5.4.0"     if BR2_GCC_VERSION_5_X
-	default "6.3.0"     if BR2_GCC_VERSION_6_X
+	default "6.4.0"     if BR2_GCC_VERSION_6_X
 	default "7.1.0"     if BR2_GCC_VERSION_7_X
 	default "arc-2017.03" if BR2_GCC_VERSION_ARC
 	default "musl-5.4.0" if BR2_GCC_VERSION_OR1K
diff --git a/package/gcc/gcc.hash b/package/gcc/gcc.hash
index f64329b072..c3e5ffb4b1 100644
--- a/package/gcc/gcc.hash
+++ b/package/gcc/gcc.hash
@@ -2,8 +2,8 @@
 sha512  93abb78e16277454f41a8e9810f41f66c0fdffdc539a762ff6b67d3037f78db971378683fd2ebf707d1d51c059fad2161fe42d110c330027f40214b7db0f3efe  gcc-4.9.4.tar.bz2
 # From ftp://gcc.gnu.org/pub/gcc/releases/gcc-5.4.0/sha512.sum
 sha512  2941cc950c8f2409a314df497631f9b0266211aa74746c1839c46e04f1c7c299afe2528d1ef16ea39def408a644ba48f97519ec7a7dd37d260c3e9423514265b  gcc-5.4.0.tar.bz2
-# From ftp://gcc.gnu.org/pub/gcc/releases/gcc-6.3.0/sha512.sum
-sha512  234dd9b1bdc9a9c6e352216a7ef4ccadc6c07f156006a59759c5e0e6a69f0abcdc14630eff11e3826dd6ba5933a8faa43043f3d1d62df6bd5ab1e82862f9bf78  gcc-6.3.0.tar.bz2
+# From ftp://gcc.gnu.org/pub/gcc/releases/gcc-6.4.0/sha512.sum
+sha512  02c60e54527c7adf584798d5251f8a0b80c93d5deafce82501b2c28e6692e0bd783927bbfc4bc527a863c0cccc025150a34740a9e29badb02d4b48e56a8aba90  gcc-6.4.0.tar.xz
 # From ftp://gcc.gnu.org/pub/gcc/releases/gcc-7.1.0/sha512.sum
 sha512  b5d952be9a10f0e0926bb2868877d10544039d6d2f35ba0a08f51231dd622a007650764a03e173194701467547789ad7d2d9cbc10adcdf118d619cdedbd14aec  gcc-7.1.0.tar.bz2
 
diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
index ff69209f84..ebda993bf4 100644
--- a/package/gcc/gcc.mk
+++ b/package/gcc/gcc.mk
@@ -18,7 +18,13 @@ GCC_SITE = $(call github,openrisc,or1k-gcc,$(GCC_VERSION))
 GCC_SOURCE = gcc-$(GCC_VERSION).tar.gz
 else
 GCC_SITE = $(BR2_GNU_MIRROR:/=)/gcc/gcc-$(GCC_VERSION)
+# From version 6.4.0 a bz2 release tarball is not provided anymore. Use the xz
+# tarball instead.
+ifeq ($(BR2_GCC_VERSION_6_X),y)
+GCC_SOURCE = gcc-$(GCC_VERSION).tar.xz
+else
 GCC_SOURCE = gcc-$(GCC_VERSION).tar.bz2
+endif # BR2_GCC_VERSION_6_X
 endif
 
 #
-- 
2.13.2
