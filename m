From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 31 May 2017 21:12:01 +0200
Subject: [Buildroot] [git commit] gcc: allow gcc 6.x for microblaze
	architecture
Message-ID: <20170601202900.039C6818F2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6f0a363d55cac4aac0c8a25c6cf6c0da86edf3a5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

With the two patches from gcc upstream master we can enable gcc 6.x for
microblaze again.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gcc/6.3.0/896-microblaze-Revert.patch      |  40 +++++
 ...laze-support-DWARF-EH-old-Xilinx-patch-ne.patch | 178 +++++++++++++++++++++
 package/gcc/Config.in.host                         |   1 -
 3 files changed, 218 insertions(+), 1 deletion(-)

diff --git a/package/gcc/6.3.0/896-microblaze-Revert.patch b/package/gcc/6.3.0/896-microblaze-Revert.patch
new file mode 100644
index 0000000..7026d0e
--- /dev/null
+++ b/package/gcc/6.3.0/896-microblaze-Revert.patch
@@ -0,0 +1,40 @@
+From 707a69dfb56a2976e2b5c010f0e5cb2ac9905a07 Mon Sep 17 00:00:00 2001
+From: eager <eager@138bc75d-0d04-0410-961f-82ee72b054a4>
+Date: Sat, 27 May 2017 18:29:40 +0000
+Subject: [PATCH] 	Revert: 	2016-01-21  Ajit Agarwal 
+ <ajitkum@xilinx.com>
+
+	See https://gcc.gnu.org/ml/gcc/2017-05/msg00221.html.
+
+	* config/microblaze/microblaze.h
+	(FIXED_REGISTERS): Update in macro.
+	(CALL_USED_REGISTERS): Update in macro.
+
+
+
+git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/trunk at 248540 138bc75d-0d04-0410-961f-82ee72b054a4
+Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
+diff --git a/gcc/config/microblaze/microblaze.h b/gcc/config/microblaze/microblaze.h
+index 66e4ef5..2c9ece1 100644
+--- a/gcc/config/microblaze/microblaze.h
++++ b/gcc/config/microblaze/microblaze.h
+@@ -269,14 +269,14 @@ extern enum pipeline_type microblaze_pipe;
+ #define FIXED_REGISTERS							\
+ {									\
+   1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1,			\
+-  1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,			\
++  1, 1, 1, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,			\
+   1, 1, 1, 1 								\
+ }
+ 
+ #define CALL_USED_REGISTERS						\
+ {									\
+   1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,			\
+-  1, 1, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,			\
++  1, 1, 1, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,			\
+   1, 1, 1, 1								\
+ }
+ #define GP_REG_FIRST    0
+-- 
+2.1.4
+
diff --git a/package/gcc/6.3.0/897-Make-MicroBlaze-support-DWARF-EH-old-Xilinx-patch-ne.patch b/package/gcc/6.3.0/897-Make-MicroBlaze-support-DWARF-EH-old-Xilinx-patch-ne.patch
new file mode 100644
index 0000000..1f2dcab
--- /dev/null
+++ b/package/gcc/6.3.0/897-Make-MicroBlaze-support-DWARF-EH-old-Xilinx-patch-ne.patch
@@ -0,0 +1,178 @@
+From 81aab124bc697a87ad492d4cd3380599c0e0747e Mon Sep 17 00:00:00 2001
+From: jsm28 <jsm28@138bc75d-0d04-0410-961f-82ee72b054a4>
+Date: Fri, 6 Jan 2017 20:54:34 +0000
+Subject: [PATCH] Make MicroBlaze support DWARF EH (old Xilinx patch, needed
+ for glibc build).
+
+This patch, taken from
+<https://git.busybox.net/buildroot/tree/package/gcc/5.4.0/840-microblaze-enable-dwarf-eh-support.patch>
+and with a few formatting cleanups and an update for the removal of
+gen_rtx_raw_REG, enables DWARF EH support for MicroBlaze.
+
+This is needed for building glibc with a compiler that includes shared
+libgcc; right now all glibc builds for MicroBlaze are failing with my
+bot for lack of this support.  (It's dubious if we should have glibc
+ports at all where required support is missing in FSF GCC.)
+
+Tested building glibc with build-many-glibcs.py.  I have *not* done
+any other testing or any execution testing for MicroBlaze.
+
+2017-01-06  Edgar E. Iglesias <edgar.iglesias@xilinx.com>
+	    David Holsgrove <david.holsgrove@xilinx.com>
+
+	* common/config/microblaze/microblaze-common.c
+	(TARGET_EXCEPT_UNWIND_INFO): Remove.
+	* config/microblaze/microblaze-protos.h (microblaze_eh_return):
+	New prototype.
+	* config/microblaze/microblaze.c (microblaze_must_save_register)
+	(microblaze_expand_epilogue, microblaze_return_addr): Handle
+	calls_eh_return.
+	(microblaze_eh_return): New function.
+	* config/microblaze/microblaze.h (RETURN_ADDR_OFFSET)
+	(EH_RETURN_DATA_REGNO, MB_EH_STACKADJ_REGNUM)
+	(EH_RETURN_STACKADJ_RTX, ASM_PREFERRED_EH_DATA_FORMAT): New macros.
+	* config/microblaze/microblaze.md (eh_return): New pattern.
+
+
+git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/trunk at 244183 138bc75d-0d04-0410-961f-82ee72b054a4
+Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
+---
+ gcc/common/config/microblaze/microblaze-common.c |  3 ---
+ gcc/config/microblaze/microblaze-protos.h        |  1 +
+ gcc/config/microblaze/microblaze.c               | 27 ++++++++++++++++++++----
+ gcc/config/microblaze/microblaze.h               | 16 ++++++++++++++
+ gcc/config/microblaze/microblaze.md              | 10 +++++++++
+ 6 files changed, 66 insertions(+), 7 deletions(-)
+
+diff --git a/gcc/common/config/microblaze/microblaze-common.c b/gcc/common/config/microblaze/microblaze-common.c
+index 57a3099..4975663 100644
+--- a/gcc/common/config/microblaze/microblaze-common.c
++++ b/gcc/common/config/microblaze/microblaze-common.c
+@@ -37,7 +37,4 @@ static const struct default_options microblaze_option_optimization_table[] =
+ #undef  TARGET_OPTION_OPTIMIZATION_TABLE
+ #define TARGET_OPTION_OPTIMIZATION_TABLE microblaze_option_optimization_table
+ 
+-#undef TARGET_EXCEPT_UNWIND_INFO
+-#define TARGET_EXCEPT_UNWIND_INFO  sjlj_except_unwind_info
+-
+ struct gcc_targetm_common targetm_common = TARGETM_COMMON_INITIALIZER;
+diff --git a/gcc/config/microblaze/microblaze-protos.h b/gcc/config/microblaze/microblaze-protos.h
+index 6fb3066..9ba8f2d 100644
+--- a/gcc/config/microblaze/microblaze-protos.h
++++ b/gcc/config/microblaze/microblaze-protos.h
+@@ -57,6 +57,7 @@ extern bool microblaze_tls_referenced_p (rtx);
+ extern int symbol_mentioned_p (rtx);
+ extern int label_mentioned_p (rtx);
+ extern bool microblaze_cannot_force_const_mem (machine_mode, rtx);
++extern void microblaze_eh_return (rtx op0);
+ #endif  /* RTX_CODE */
+ 
+ /* Declare functions in microblaze-c.c.  */
+diff --git a/gcc/config/microblaze/microblaze.c b/gcc/config/microblaze/microblaze.c
+index 03b70e1..746bef1 100644
+--- a/gcc/config/microblaze/microblaze.c
++++ b/gcc/config/microblaze/microblaze.c
+@@ -1926,6 +1926,10 @@ microblaze_must_save_register (int regno)
+   if (frame_pointer_needed && (regno == HARD_FRAME_POINTER_REGNUM))
+     return 1;
+ 
++  if (crtl->calls_eh_return
++      && regno == MB_ABI_SUB_RETURN_ADDR_REGNUM)
++    return 1;
++
+   if (!crtl->is_leaf)
+     {
+       if (regno == MB_ABI_SUB_RETURN_ADDR_REGNUM)
+@@ -1953,6 +1957,11 @@ microblaze_must_save_register (int regno)
+ 	return 1;
+     }
+ 
++  if (crtl->calls_eh_return
++      && (regno == EH_RETURN_DATA_REGNO (0)
++          || regno == EH_RETURN_DATA_REGNO (1)))
++    return 1;
++
+   return 0;
+ }
+ 
+@@ -3029,6 +3038,12 @@ microblaze_expand_epilogue (void)
+       emit_insn (gen_addsi3 (stack_pointer_rtx, stack_pointer_rtx, fsiz_rtx));
+     }
+ 
++  if (crtl->calls_eh_return)
++    emit_insn (gen_addsi3 (stack_pointer_rtx,
++                           stack_pointer_rtx,
++                           gen_raw_REG (SImode,
++					MB_EH_STACKADJ_REGNUM)));
++
+   emit_jump_insn (gen_return_internal (gen_rtx_REG (Pmode, GP_REG_FIRST +
+ 						    MB_ABI_SUB_RETURN_ADDR_REGNUM)));
+ }
+@@ -3326,10 +3341,14 @@ microblaze_return_addr (int count, rtx frame ATTRIBUTE_UNUSED)
+   if (count != 0)
+     return NULL_RTX;
+ 
+-  return gen_rtx_PLUS (Pmode,
+-		       get_hard_reg_initial_val (Pmode,
+-						 MB_ABI_SUB_RETURN_ADDR_REGNUM),
+-		       GEN_INT (8));
++  return get_hard_reg_initial_val (Pmode,
++                                   MB_ABI_SUB_RETURN_ADDR_REGNUM);
++}
++
++void
++microblaze_eh_return (rtx op0)
++{
++  emit_insn (gen_movsi (gen_rtx_MEM (Pmode, stack_pointer_rtx), op0));
+ }
+ 
+ /* Queue an .ident string in the queue of top-level asm statements.
+diff --git a/gcc/config/microblaze/microblaze.h b/gcc/config/microblaze/microblaze.h
+index 527f4d3..8fdadbf 100644
+--- a/gcc/config/microblaze/microblaze.h
++++ b/gcc/config/microblaze/microblaze.h
+@@ -184,6 +184,22 @@ extern enum pipeline_type microblaze_pipe;
+ #define INCOMING_RETURN_ADDR_RTX  			\
+   gen_rtx_REG (Pmode, GP_REG_FIRST + MB_ABI_SUB_RETURN_ADDR_REGNUM)
+ 
++/* Specifies the offset from INCOMING_RETURN_ADDR_RTX and the actual return PC.  */
++#define RETURN_ADDR_OFFSET (8)
++
++/* Describe how we implement __builtin_eh_return.  */
++#define EH_RETURN_DATA_REGNO(N)					\
++  (((N) < 2) ? MB_ABI_FIRST_ARG_REGNUM + (N) : INVALID_REGNUM)
++
++#define MB_EH_STACKADJ_REGNUM  MB_ABI_INT_RETURN_VAL2_REGNUM
++#define EH_RETURN_STACKADJ_RTX  gen_rtx_REG (Pmode, MB_EH_STACKADJ_REGNUM)
++
++/* Select a format to encode pointers in exception handling data.  CODE
++   is 0 for data, 1 for code labels, 2 for function pointers.  GLOBAL is
++   true if the symbol may be affected by dynamic relocations.  */
++#define ASM_PREFERRED_EH_DATA_FORMAT(CODE,GLOBAL) \
++  ((flag_pic || GLOBAL) ? DW_EH_PE_aligned : DW_EH_PE_absptr)
++
+ /* Use DWARF 2 debugging information by default.  */
+ #define DWARF2_DEBUGGING_INFO
+ #define PREFERRED_DEBUGGING_TYPE DWARF2_DEBUG
+diff --git a/gcc/config/microblaze/microblaze.md b/gcc/config/microblaze/microblaze.md
+index 8f83daa..66ebc1e 100644
+--- a/gcc/config/microblaze/microblaze.md
++++ b/gcc/config/microblaze/microblaze.md
+@@ -2324,4 +2324,14 @@
+   (set_attr "mode"      "SI")
+   (set_attr "length"    "4")])
+ 
++; This is used in compiling the unwind routines.
++(define_expand "eh_return"
++  [(use (match_operand 0 "general_operand" ""))]
++  ""
++  "
++{
++  microblaze_eh_return (operands[0]);
++  DONE;
++}")
++
+ (include "sync.md")
+-- 
+2.1.4
+
diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index 4c1d64c..3e7fb80 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -58,7 +58,6 @@ config BR2_GCC_VERSION_6_X
 	bool "gcc 6.x"
 	# Broken or unsupported architectures
 	depends on !BR2_arc
-	depends on !BR2_microblaze
 	depends on !BR2_or1k
 	# Unsupported MIPS cores
 	depends on !BR2_mips_m6250 && !BR2_mips_p6600
