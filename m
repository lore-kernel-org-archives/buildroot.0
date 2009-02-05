From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Thu,  5 Feb 2009 13:24:11 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/gcc/4.3.2
Message-ID: <20090205132411.D88B476454@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-02-05 13:24:11 +0000 (Thu, 05 Feb 2009)
New Revision: 25248

Log:
toolchain/gcc/4.3.2: fix arm funroll-loops patch from r24993

Rename it so it actually gets applied and fix it so it can be applied
(-p level).

Added:
   trunk/buildroot/toolchain/gcc/4.3.2/306-arm-funroll-loops.patch

Removed:
   trunk/buildroot/toolchain/gcc/4.3.2/306-arm-funroll-loops.patch.arm


Changeset:
Copied: trunk/buildroot/toolchain/gcc/4.3.2/306-arm-funroll-loops.patch (from rev 25247, trunk/buildroot/toolchain/gcc/4.3.2/306-arm-funroll-loops.patch.arm)
===================================================================
--- trunk/buildroot/toolchain/gcc/4.3.2/306-arm-funroll-loops.patch	                        (rev 0)
+++ trunk/buildroot/toolchain/gcc/4.3.2/306-arm-funroll-loops.patch	2009-02-05 13:24:11 UTC (rev 25248)
@@ -0,0 +1,31 @@
+ChangeLog (regrename) 
+ 
+     gcc/ 
+     * regrename.c: Unshare RTX earlier in build_def_use to avoid 
+     corruption of dup_loc. 
+ 
+
+Index: gcc/regrename.c
+===================================================================
+--- a/gcc/regrename.c	(revision 197947)
++++ b/gcc/regrename.c	(working copy)
+@@ -783,6 +783,10 @@ build_def_use (basic_block bb)
+ 		recog_data.operand_type[i] = OP_INOUT;
+ 	    }
+ 
++	  /* Unshare dup_loc RTL */
++	  for (i = 0; i < recog_data.n_dups; i++)
++	    *recog_data.dup_loc[i] = copy_rtx(*recog_data.dup_loc[i]);
++
+ 	  /* Step 1: Close chains for which we have overlapping reads.  */
+ 	  for (i = 0; i < n_ops; i++)
+ 	    scan_rtx (insn, recog_data.operand_loc[i],
+@@ -813,7 +817,7 @@ build_def_use (basic_block bb)
+ 		    OP_IN, 0);
+ 
+ 	  for (i = 0; i < recog_data.n_dups; i++)
+-	    *recog_data.dup_loc[i] = copy_rtx (old_dups[i]);
++	    *recog_data.dup_loc[i] = old_dups[i];
+ 	  for (i = 0; i < n_ops; i++)
+ 	    *recog_data.operand_loc[i] = old_operands[i];
+ 	  if (recog_data.n_dups)

Deleted: trunk/buildroot/toolchain/gcc/4.3.2/306-arm-funroll-loops.patch.arm
===================================================================
--- trunk/buildroot/toolchain/gcc/4.3.2/306-arm-funroll-loops.patch.arm	2009-02-05 13:24:07 UTC (rev 25247)
+++ trunk/buildroot/toolchain/gcc/4.3.2/306-arm-funroll-loops.patch.arm	2009-02-05 13:24:11 UTC (rev 25248)
@@ -1,31 +0,0 @@
-ChangeLog (regrename) 
- 
-     gcc/ 
-     * regrename.c: Unshare RTX earlier in build_def_use to avoid 
-     corruption of dup_loc. 
- 
-
-Index: gcc/regrename.c
-===================================================================
---- gcc/regrename.c	(revision 197947)
-+++ gcc/regrename.c	(working copy)
-@@ -783,6 +783,10 @@ build_def_use (basic_block bb)
- 		recog_data.operand_type[i] = OP_INOUT;
- 	    }
- 
-+	  /* Unshare dup_loc RTL */
-+	  for (i = 0; i < recog_data.n_dups; i++)
-+	    *recog_data.dup_loc[i] = copy_rtx(*recog_data.dup_loc[i]);
-+
- 	  /* Step 1: Close chains for which we have overlapping reads.  */
- 	  for (i = 0; i < n_ops; i++)
- 	    scan_rtx (insn, recog_data.operand_loc[i],
-@@ -813,7 +817,7 @@ build_def_use (basic_block bb)
- 		    OP_IN, 0);
- 
- 	  for (i = 0; i < recog_data.n_dups; i++)
--	    *recog_data.dup_loc[i] = copy_rtx (old_dups[i]);
-+	    *recog_data.dup_loc[i] = old_dups[i];
- 	  for (i = 0; i < n_ops; i++)
- 	    *recog_data.operand_loc[i] = old_operands[i];
- 	  if (recog_data.n_dups)
