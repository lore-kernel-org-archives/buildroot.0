From: ulf at uclibc.org <ulf@uclibc.org>
Date: Fri, 23 Jan 2009 23:03:27 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/gcc/4.3.2
Message-ID: <20090123230327.4D7FA76564@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2009-01-23 23:03:25 +0000 (Fri, 23 Jan 2009)
New Revision: 24993

Log:
Fix unroll bug for ARM toolchain

Added:
   trunk/buildroot/toolchain/gcc/4.3.2/306-arm-funroll-loops.patch.arm


Changeset:
Added: trunk/buildroot/toolchain/gcc/4.3.2/306-arm-funroll-loops.patch.arm
===================================================================
--- trunk/buildroot/toolchain/gcc/4.3.2/306-arm-funroll-loops.patch.arm	                        (rev 0)
+++ trunk/buildroot/toolchain/gcc/4.3.2/306-arm-funroll-loops.patch.arm	2009-01-23 23:03:25 UTC (rev 24993)
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
+--- gcc/regrename.c	(revision 197947)
++++ gcc/regrename.c	(working copy)
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
