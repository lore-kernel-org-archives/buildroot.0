From: Lada Trimasova <Lada.Trimasova@synopsys.com>
Date: Thu, 26 Nov 2015 20:21:38 +0300
Subject: [Buildroot] [PATCH] gcc: fix incorrect handling of the comparison
	arguments
Message-ID: <1448558498-8518-1-git-send-email-ltrimas@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch fixes compiler error during libbroadvoice build.
The comparison arguments where not correctly handled.
The fix is done in development tree:
https://github.com/foss-for-synopsys-dwc-arc-processors/gcc/commit/b4035128ba8f8bbbf9527f54f261a87b304ca4c5
and will be a part of the next release of ARC GNU tools.
Once that new release happens this patch must be removed.

Fixes:
http://autobuild.buildroot.net/results/bea/beace68a19382b43370c798dcf7d2ef412f9d75e/

Signed-off-by: Lada Trimasova <ltrimas@synopsys.com>
Cc: Alexey Brodkin <abrodkin@synopsys.com>
Cc: Anton Kolesov <akolesov@synopsys.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Peter Korsgaard <peter@korsgaard.com>
---
 .../0001-Handle-correctly-compare-arguments.patch  | 71 ++++++++++++++++++++++
 1 file changed, 71 insertions(+)
 create mode 100644 package/gcc/arc-2015.06/0001-Handle-correctly-compare-arguments.patch

diff --git a/package/gcc/arc-2015.06/0001-Handle-correctly-compare-arguments.patch b/package/gcc/arc-2015.06/0001-Handle-correctly-compare-arguments.patch
new file mode 100644
index 0000000..b9a60d9
--- /dev/null
+++ b/package/gcc/arc-2015.06/0001-Handle-correctly-compare-arguments.patch
@@ -0,0 +1,71 @@
+From b4035128ba8f8bbbf9527f54f261a87b304ca4c5 Mon Sep 17 00:00:00 2001
+From: Claudiu Zissulescu <claziss@synopsys.com>
+Date: Mon, 9 Nov 2015 15:23:39 +0100
+Subject: [PATCH] Handle correctly compare arguments
+
+---
+ gcc/config/arc/arc.c | 24 ++++++++++++++++++------
+ 1 files changed, 18 insertions(+), 6 deletions(-)
+
+diff --git a/gcc/config/arc/arc.c b/gcc/config/arc/arc.c
+index bd53525..caf483b 100644
+--- a/gcc/config/arc/arc.c
++++ b/gcc/config/arc/arc.c
+@@ -1998,7 +1998,7 @@ gen_compare_reg (rtx comparison, enum machine_mode omode)
+   rtx y = XEXP (comparison, 1);
+   rtx tmp, cc_reg;
+   enum machine_mode mode, cmode;
+-
++  bool swap = false;
+ 
+   cmode = GET_MODE (x);
+   if (cmode == VOIDmode)
+@@ -2073,6 +2073,7 @@ gen_compare_reg (rtx comparison, enum machine_mode omode)
+       rtx op0 = gen_rtx_REG (cmode, 0);
+       rtx op1 = gen_rtx_REG (cmode, GET_MODE_SIZE (cmode) / UNITS_PER_WORD);
+ 
++      swap = false;
+       switch (code)
+ 	{
+ 	case NE: case EQ: case GT: case UNLE: case GE: case UNLT:
+@@ -2080,22 +2081,33 @@ gen_compare_reg (rtx comparison, enum machine_mode omode)
+ 	  break;
+ 	case LT: case UNGE: case LE: case UNGT:
+ 	  code = swap_condition (code);
+-	  tmp = x;
+-	  x = y;
+-	  y = tmp;
++	  swap = true;
+ 	  break;
+ 	default:
+ 	  gcc_unreachable ();
+ 	}
+       if (currently_expanding_to_rtl)
+ 	{
+-	  emit_move_insn (op0, x);
+-	  emit_move_insn (op1, y);
++	  if (swap)
++	    {
++	      emit_move_insn (op0, y);
++	      emit_move_insn (op1, x);
++	    }
++	  else
++	    {
++	      emit_move_insn (op0, x);
++	      emit_move_insn (op1, y);
++	    }
+ 	}
+       else
+ 	{
+ 	  gcc_assert (rtx_equal_p (op0, x));
+ 	  gcc_assert (rtx_equal_p (op1, y));
++	  if (swap)
++	    {
++	      op0 = y;
++	      op1 = x;
++	    }
+ 	}
+       emit_insn (gen_cmp_float (cc_reg, gen_rtx_COMPARE (mode, op0, op1)));
+     }
+-- 
+2.5.0
-- 
2.5.0
