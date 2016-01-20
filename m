From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 20 Jan 2016 21:26:17 +0100
Subject: [Buildroot] [git commit] gcc: immediate changes to arc-2015.12-rc1
Message-ID: <20160120202626.36D6A82813@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d7e7ad4f34b693d5d0f83c39a6047c6dd6c9bcc3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

These patches solve several problems that were discovered
after bumping tools to arc-2015.12-rc1.

The fixes were done in development tree arc-4.8-dev and will be
a part of the next release of ARC GNU tools.
Once that new release happens these patches must be removed.

Signed-off-by: Lada Trimasova <ltrimas@synopsys.com>
Cc: Alexey Brodkin <abrodkin@synopsys.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...900-UPDATE-Fix-handling-complex-PIC-moves.patch | 103 +++++++++++++++++++++
 ...01-UPDATE1-Fix-handling-complex-PIC-moves.patch |  83 +++++++++++++++++
 ...950-Don-t-allow-mcompact-casesi-for-ARCv2.patch | 100 ++++++++++++++++++++
 3 files changed, 286 insertions(+)

diff --git a/package/gcc/arc-2015.12-rc1/900-UPDATE-Fix-handling-complex-PIC-moves.patch b/package/gcc/arc-2015.12-rc1/900-UPDATE-Fix-handling-complex-PIC-moves.patch
new file mode 100644
index 0000000..48228dc
--- /dev/null
+++ b/package/gcc/arc-2015.12-rc1/900-UPDATE-Fix-handling-complex-PIC-moves.patch
@@ -0,0 +1,103 @@
+From b55922d45fd16f5e8fc7c3885da42b2b9b37754d Mon Sep 17 00:00:00 2001
+From: Claudiu Zissulescu <claziss@synopsys.com>
+Date: Mon, 18 Jan 2016 16:43:18 +0100
+Subject: [PATCH] UPDATE: Fix handling complex PIC moves.
+
+fwprop is putting in the REG_EQUIV notes which are involving the
+constant pic unspecs.  Then, loop may use those notes for
+optimizations rezulting in complex patterns that are not supported by
+the current implementation. The following piece of code tries to
+convert the complex instruction in simpler ones.
+
+The fix is done in development tree: [arc-4.8-dev b55922d] 
+and will be a part of the next release of ARC GNU tools.
+Once that new release happens this patch must be removed.
+
+
+gcc/
+2016-01-18  Claudiu Zissulescu  <claziss@synopsys.com>
+
+	* config/arc/arc.c (arc_legitimize_pic_address): Handle MINUS
+	operations when doing PIC moves. Make this function static.
+	(arc_legitimate_pc_offset_p): Use
+	arc_raw_symbolic_reference_mentioned_p.
+	* config/arc/arc-protos.h (arc_legitimize_pic_address): Remove.
+
+ gcc/config/arc/arc-protos.h |  1 -
+ gcc/config/arc/arc.c        | 33 +++++++++++++++++++--------------
+ 2 files changed, 19 insertions(+), 15 deletions(-)
+
+ 	* config/arc/arc.c (arc_legitimize_pic_address): Handle complex
+diff --git a/gcc/config/arc/arc-protos.h b/gcc/config/arc/arc-protos.h
+index 464e0ab..5986e06 100644
+--- a/gcc/config/arc/arc-protos.h
++++ b/gcc/config/arc/arc-protos.h
+@@ -53,7 +53,6 @@ extern unsigned int arc_compute_frame_size ();
+ extern bool arc_ccfsm_branch_deleted_p (void);
+ extern void arc_ccfsm_record_branch_deleted (void);
+ 
+-extern rtx arc_legitimize_pic_address (rtx, rtx);
+ void arc_asm_output_aligned_decl_local (FILE *, tree, const char *,
+ 					unsigned HOST_WIDE_INT,
+ 					unsigned HOST_WIDE_INT,
+diff --git a/gcc/config/arc/arc.c b/gcc/config/arc/arc.c
+index a89c8ee..f7cae9f 100644
+--- a/gcc/config/arc/arc.c
++++ b/gcc/config/arc/arc.c
+@@ -5243,19 +5243,7 @@ arc_legitimate_pc_offset_p (rtx addr)
+   if (GET_CODE (addr) != CONST)
+     return false;
+   addr = XEXP (addr, 0);
+-  if (GET_CODE (addr) == PLUS)
+-    {
+-      if (GET_CODE (XEXP (addr, 1)) != CONST_INT)
+-	return false;
+-      addr = XEXP (addr, 0);
+-    }
+-  return (GET_CODE (addr) == UNSPEC
+-	  && XVECLEN (addr, 0) == 1
+-	  && (XINT (addr, 1) == ARC_UNSPEC_GOT
+-	      || XINT (addr, 1) == ARC_UNSPEC_GOTOFFPC
+-	      || XINT (addr, 1) == UNSPEC_TLS_GD
+-	      || XINT (addr, 1) == UNSPEC_TLS_IE)
+-	  && GET_CODE (XVECEXP (addr, 0, 0)) == SYMBOL_REF);
++  return flag_pic && !arc_raw_symbolic_reference_mentioned_p (addr, false);
+ }
+ 
+ /* Return true if ADDR is a valid pic address.
+@@ -5522,7 +5510,7 @@ arc_legitimize_tls_address (rtx addr, enum tls_model model)
+    The return value is the legitimated address.
+    If OLDX is non-zero, it is the target to assign the address to first.  */
+ 
+-rtx
++static rtx
+ arc_legitimize_pic_address (rtx orig, rtx oldx)
+ {
+   rtx addr = orig;
+@@ -5569,6 +5557,23 @@ arc_legitimize_pic_address (rtx orig, rtx oldx)
+ 	      /* Check that the unspec is one of the ones we generate?  */
+ 	      return orig;
+ 	    }
++	  else if (GET_CODE (addr) == MINUS)
++	    {
++	      /* The same story with fwprop.  */
++	      rtx op0 = XEXP (addr, 0);
++	      rtx op1 = XEXP (addr, 1);
++	      gcc_assert (oldx);
++	      gcc_assert (GET_CODE (op1) == UNSPEC);
++
++	      emit_move_insn (oldx,
++			      gen_rtx_CONST (SImode,
++					     arc_legitimize_pic_address (op1,
++									 NULL_RTX)));
++	      emit_insn (gen_rtx_SET (VOIDmode, oldx,
++				      gen_rtx_MINUS (SImode, op0, oldx)));
++	      return oldx;
++
++	    }
+ 	  else if (GET_CODE (addr) != PLUS)
+ 	    {
+ 	      /* fwprop is putting in the REG_EQUIV notes which are
+-- 
+2.5.0
+
diff --git a/package/gcc/arc-2015.12-rc1/901-UPDATE1-Fix-handling-complex-PIC-moves.patch b/package/gcc/arc-2015.12-rc1/901-UPDATE1-Fix-handling-complex-PIC-moves.patch
new file mode 100644
index 0000000..28cb7c1
--- /dev/null
+++ b/package/gcc/arc-2015.12-rc1/901-UPDATE1-Fix-handling-complex-PIC-moves.patch
@@ -0,0 +1,83 @@
+From f00b0f17d6889d811468c2c77508fbea8bfc377d Mon Sep 17 00:00:00 2001
+From: Claudiu Zissulescu <claziss@synopsys.com>
+Date: Tue, 19 Jan 2016 14:40:16 +0100
+Subject: [PATCH] UPDATE1: Fix handling complex PIC moves.
+
+The arc_legitimate_pc_offset_p condition is too lax. Updated it.
+
+The fix is done in development tree: [arc-4.8-dev f00b0f1] 
+and will be a part of the next release of ARC GNU tools.
+Once that new release happens this patch must be removed.
+
+gcc/
+2016-01-18  Claudiu Zissulescu  <claziss@synopsys.com>
+
+	* config/arc/arc.c (arc_needs_pcl_p ): New function
+	(arc_legitimate_pc_offset_p): Use arc_needs_pcl_p.
+---
+ gcc/config/arc/arc.c | 42 ++++++++++++++++++++++++++++++++++++++++--
+ 1 file changed, 40 insertions(+), 2 deletions(-)
+
+diff --git a/gcc/config/arc/arc.c b/gcc/config/arc/arc.c
+index f7cae9f..18d88a3 100644
+--- a/gcc/config/arc/arc.c
++++ b/gcc/config/arc/arc.c
+@@ -5234,6 +5234,45 @@ arc_rtx_costs (rtx x, int code, int outer_code, int opno ATTRIBUTE_UNUSED,
+     }
+ }
+ 
++/* Helper used by arc_legitimate_pc_offset_p.  */
++
++static bool
++arc_needs_pcl_p (rtx x)
++{
++  register const char *fmt;
++  register int i, j;
++
++  if ((GET_CODE (x) == UNSPEC)
++      && (XVECLEN (x, 0) == 1)
++      && (GET_CODE (XVECEXP (x, 0, 0)) == SYMBOL_REF))
++    switch (XINT (x, 1))
++      {
++      case ARC_UNSPEC_GOT:
++      case ARC_UNSPEC_GOTOFFPC:
++      case UNSPEC_TLS_GD:
++      case UNSPEC_TLS_IE:
++	return true;
++      default:
++	break;
++      }
++
++  fmt = GET_RTX_FORMAT (GET_CODE (x));
++  for (i = GET_RTX_LENGTH (GET_CODE (x)) - 1; i >= 0; i--)
++    {
++      if (fmt[i] == 'e')
++	{
++	  if (arc_needs_pcl_p (XEXP (x, i)))
++	    return true;
++	}
++      else if (fmt[i] == 'E')
++	for (j = XVECLEN (x, i) - 1; j >= 0; j--)
++	  if (arc_needs_pcl_p (XVECEXP (x, i, j)))
++	    return true;
++    }
++
++  return false;
++}
++
+ /* Return true if ADDR is an address that needs to be expressed as an
+    explicit sum of pcl + offset.  */
+ 
+@@ -5242,8 +5281,7 @@ arc_legitimate_pc_offset_p (rtx addr)
+ {
+   if (GET_CODE (addr) != CONST)
+     return false;
+-  addr = XEXP (addr, 0);
+-  return flag_pic && !arc_raw_symbolic_reference_mentioned_p (addr, false);
++  return arc_needs_pcl_p (addr);
+ }
+ 
+ /* Return true if ADDR is a valid pic address.
+-- 
+2.5.0
+
diff --git a/package/gcc/arc-2015.12-rc1/950-Don-t-allow-mcompact-casesi-for-ARCv2.patch b/package/gcc/arc-2015.12-rc1/950-Don-t-allow-mcompact-casesi-for-ARCv2.patch
new file mode 100644
index 0000000..dc03a02
--- /dev/null
+++ b/package/gcc/arc-2015.12-rc1/950-Don-t-allow-mcompact-casesi-for-ARCv2.patch
@@ -0,0 +1,100 @@
+From 09463827001a7b8094f4b9460514370a1876d908 Mon Sep 17 00:00:00 2001
+From: Claudiu Zissulescu <claziss@synopsys.com>
+Date: Wed, 20 Jan 2016 16:32:40 +0100
+Subject: [PATCH] Don't allow mcompact-casesi for ARCv2
+
+The compact casesi is not working for arcv2 processors family as it
+makes use of the add_s rx,rx,pcl instruction which is only valid for
+arc6xx and arc700 processors. Also not having this instruction makes
+no much sens to change the compact-casesi pattern to use normal add
+instructions as it nullifies the advantage of short instruction use.
+The default casesi pattern betters suits the arcv2 architecture.
+
+The fix is done in development tree: [arc-4.8-dev 0946382] 
+and will be a part of the next release of ARC GNU tools.
+Once that new release happens this patch must be removed.
+
+gcc/
+2016-01-20  Claudiu Zissulescu  <claziss@synopsys.com>
+
+	* common/config/arc/arc-common.c (arc_option_optimization_table):
+	Remove mcompact-casesi option.
+	* config/arc/arc.c (arc_override_options): Use compact-casesi only
+	for arcv1.
+	* config/arc/arc.md (casesi_load): Use short instructions.
+---
+ gcc/common/config/arc/arc-common.c |  1 -
+ gcc/config/arc/arc.c               |  9 +++++----
+ gcc/config/arc/arc.md              | 10 ++++++++--
+ 3 files changed, 13 insertions(+), 7 deletions(-)
+ 
+ 	* config/arc/arc.c (arc_legitimize_pic_address): Handle MINUS
+diff --git a/gcc/common/config/arc/arc-common.c b/gcc/common/config/arc/arc-common.c
+index e2e36fa..310bc80 100644
+--- a/gcc/common/config/arc/arc-common.c
++++ b/gcc/common/config/arc/arc-common.c
+@@ -58,7 +58,6 @@ static const struct default_options arc_option_optimization_table[] =
+     { OPT_LEVELS_ALL, OPT_mbbit_peephole, NULL, 1 },
+     { OPT_LEVELS_SIZE, OPT_mq_class, NULL, 1 },
+     { OPT_LEVELS_SIZE, OPT_mcase_vector_pcrel, NULL, 1 },
+-    { OPT_LEVELS_SIZE, OPT_mcompact_casesi, NULL, 1 },
+     { OPT_LEVELS_NONE, 0, NULL, 0 }
+   };
+ 
+diff --git a/gcc/config/arc/arc.c b/gcc/config/arc/arc.c
+index 18d88a3..f828398 100644
+--- a/gcc/config/arc/arc.c
++++ b/gcc/config/arc/arc.c
+@@ -1151,6 +1151,11 @@ arc_override_options (void)
+   if (arc_size_opt_level == 3)
+     optimize_size = 1;
+ 
++  if (TARGET_V2)
++    TARGET_COMPACT_CASESI = 0;
++  else if (optimize_size == 1)
++    TARGET_COMPACT_CASESI = 1;
++
+   if (flag_pic)
+     target_flags |= MASK_NO_SDATA_SET;
+ 
+@@ -1163,10 +1168,6 @@ arc_override_options (void)
+   if (!TARGET_Q_CLASS)
+     TARGET_COMPACT_CASESI = 0;
+ 
+-  /* For the time being don't support COMPACT_CASESI for ARCv2. */
+-  if (TARGET_V2)
+-    TARGET_COMPACT_CASESI = 0;
+-
+   if (TARGET_COMPACT_CASESI)
+     TARGET_CASE_VECTOR_PC_RELATIVE = 1;
+ 
+diff --git a/gcc/config/arc/arc.md b/gcc/config/arc/arc.md
+index bc4ac38..ba7c8bc 100644
+--- a/gcc/config/arc/arc.md
++++ b/gcc/config/arc/arc.md
+@@ -3837,14 +3837,20 @@
+   switch (GET_MODE (diff_vec))
+     {
+     case SImode:
+-      return \"ld.as %0,[%1,%2]%&\";
++      if ((which_alternative == 0) && TARGET_CODE_DENSITY)
++       return \"ld_s.as %0,[%1,%2]%&\";
++      else
++       return \"ld.as %0,[%1,%2]%&\";
+     case HImode:
+       if (ADDR_DIFF_VEC_FLAGS (diff_vec).offset_unsigned)
+ 	return \"ldw.as %0,[%1,%2]\";
+       return \"ldw.x.as %0,[%1,%2]\";
+     case QImode:
+       if (ADDR_DIFF_VEC_FLAGS (diff_vec).offset_unsigned)
+-	return \"ldb%? %0,[%1,%2]%&\";
++        if (which_alternative == 0)
++	 return \"ldb_s %0,[%1,%2]%&\";
++        else
++	 return \"ldb %0,[%1,%2]%&\";
+       return \"ldb.x %0,[%1,%2]\";
+     default:
+       gcc_unreachable ();
+-- 
+2.5.0
+
