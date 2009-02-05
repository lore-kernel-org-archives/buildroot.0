From: Sven Neumann <s.neumann@phase-zero.de>
Date: Thu, 05 Feb 2009 14:34:12 +0100
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/gcc/4.3.2
In-Reply-To: <20090205132411.D88B476454@busybox.osuosl.org>
References: <20090205132411.D88B476454@busybox.osuosl.org>
Message-ID: <1233840852.6323.7.camel@sven>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Thu, 2009-02-05 at 13:24 +0000, jacmet at uclibc.org wrote:

> Changeset:
> Copied: trunk/buildroot/toolchain/gcc/4.3.2/306-arm-funroll-loops.patch (from rev 25247, trunk/buildroot/toolchain/gcc/4.3.2/306-arm-funroll-loops.patch.arm)
> ===================================================================
> --- trunk/buildroot/toolchain/gcc/4.3.2/306-arm-funroll-loops.patch	                        (rev 0)
> +++ trunk/buildroot/toolchain/gcc/4.3.2/306-arm-funroll-loops.patch	2009-02-05 13:24:11 UTC (rev 25248)
> @@ -0,0 +1,31 @@
> +ChangeLog (regrename) 
> + 
> +     gcc/ 
> +     * regrename.c: Unshare RTX earlier in build_def_use to avoid 
> +     corruption of dup_loc. 
> + 
> +
> +Index: gcc/regrename.c
> +===================================================================
> +--- a/gcc/regrename.c	(revision 197947)
> ++++ b/gcc/regrename.c	(working copy)
> +@@ -783,6 +783,10 @@ build_def_use (basic_block bb)
> + 		recog_data.operand_type[i] = OP_INOUT;
> + 	    }
> + 
> ++	  /* Unshare dup_loc RTL */
> ++	  for (i = 0; i < recog_data.n_dups; i++)
> ++	    *recog_data.dup_loc[i] = copy_rtx(*recog_data.dup_loc[i]);
> ++
> + 	  /* Step 1: Close chains for which we have overlapping reads.  */
> + 	  for (i = 0; i < n_ops; i++)
> + 	    scan_rtx (insn, recog_data.operand_loc[i],
> +@@ -813,7 +817,7 @@ build_def_use (basic_block bb)
> + 		    OP_IN, 0);
> + 
> + 	  for (i = 0; i < recog_data.n_dups; i++)
> +-	    *recog_data.dup_loc[i] = copy_rtx (old_dups[i]);
> ++	    *recog_data.dup_loc[i] = old_dups[i];
> + 	  for (i = 0; i < n_ops; i++)
> + 	    *recog_data.operand_loc[i] = old_operands[i];
> + 	  if (recog_data.n_dups)
> 

That is actually a slightly different patch than what was applied
upstream in the gcc-4.3 branch, see
http://gcc.gnu.org/bugzilla/show_bug.cgi?id=39076

Both approaches are discussed here:
http://gcc.gnu.org/ml/gcc-patches/2008-04/msg01577.html


Sven
