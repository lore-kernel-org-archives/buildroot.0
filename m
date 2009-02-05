From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Thu,  5 Feb 2009 14:13:44 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/gcc/4.3.2
Message-ID: <20090205141344.A3E8276454@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-02-05 14:13:43 +0000 (Thu, 05 Feb 2009)
New Revision: 25252

Log:
toolchain/gcc/4.3.2: use what really got committed upstream for PR39076

Thanks to Sven Neumann for noticing.

Added:
   trunk/buildroot/toolchain/gcc/4.3.2/900-backport-fix-for-bug-39076.patch

Removed:
   trunk/buildroot/toolchain/gcc/4.3.2/306-arm-funroll-loops.patch


Changeset:
Deleted: trunk/buildroot/toolchain/gcc/4.3.2/306-arm-funroll-loops.patch
===================================================================
--- trunk/buildroot/toolchain/gcc/4.3.2/306-arm-funroll-loops.patch	2009-02-05 13:24:22 UTC (rev 25251)
+++ trunk/buildroot/toolchain/gcc/4.3.2/306-arm-funroll-loops.patch	2009-02-05 14:13:43 UTC (rev 25252)
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
---- a/gcc/regrename.c	(revision 197947)
-+++ b/gcc/regrename.c	(working copy)
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

Added: trunk/buildroot/toolchain/gcc/4.3.2/900-backport-fix-for-bug-39076.patch
===================================================================
--- trunk/buildroot/toolchain/gcc/4.3.2/900-backport-fix-for-bug-39076.patch	                        (rev 0)
+++ trunk/buildroot/toolchain/gcc/4.3.2/900-backport-fix-for-bug-39076.patch	2009-02-05 14:13:43 UTC (rev 25252)
@@ -0,0 +1,11 @@
+--- gcc-4.3.2.orig/gcc/regrename.c	2007-09-09 04:23:47.000000000 +0200
++++ gcc-4.3.2/gcc/regrename.c	2009-02-05 10:23:59.000000000 +0100
+@@ -813,7 +813,7 @@
+ 		    OP_IN, 0);
+ 
+ 	  for (i = 0; i < recog_data.n_dups; i++)
+-	    *recog_data.dup_loc[i] = copy_rtx (old_dups[i]);
++	    *recog_data.dup_loc[i] = old_dups[i];
+ 	  for (i = 0; i < n_ops; i++)
+ 	    *recog_data.operand_loc[i] = old_operands[i];
+ 	  if (recog_data.n_dups)
