From: vapier at uclibc.org <vapier@uclibc.org>
Date: Sun, 24 Sep 2006 14:28:52 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/binutils:
	2.17.50.0.3
Message-ID: <20060924212852.8C98D48670@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: vapier
Date: 2006-09-24 14:28:52 -0700 (Sun, 24 Sep 2006)
New Revision: 16212

Log:
ver bump

Removed:
   trunk/buildroot/toolchain/binutils/2.17.50.0.3/702-binutils-skip-comments.patch

Modified:
   trunk/buildroot/toolchain/binutils/Config.in


Changeset:
Deleted: trunk/buildroot/toolchain/binutils/2.17.50.0.3/702-binutils-skip-comments.patch
===================================================================
--- trunk/buildroot/toolchain/binutils/2.17.50.0.3/702-binutils-skip-comments.patch	2006-09-24 02:10:03 UTC (rev 16211)
+++ trunk/buildroot/toolchain/binutils/2.17.50.0.3/702-binutils-skip-comments.patch	2006-09-24 21:28:52 UTC (rev 16212)
@@ -1,93 +0,0 @@
-Retrieved from http://sources.redhat.com/ml/binutils/2004-04/msg00646.html
-Fixes
-localealias.s:544: Error: junk at end of line, first unrecognized character is `,' 
-when building glibc-2.3.2 with gcc-3.4.0 and binutils-2.15.90.0.3
-
-Paths adjusted to match crosstool's patcher.
-
-Message-Id: m3n052qw2g.fsf at whitebox.m5r.de
-From: Andreas Schwab <schwab@suse dot de>
-To: Nathan Sidwell <nathan@codesourcery dot com>
-Cc: Ian Lance Taylor <ian@wasabisystems dot com>, binutils at sources dot redhat dot com
-Date: Fri, 23 Apr 2004 22:27:19 +0200
-Subject: Re: demand_empty_rest_of_line and ignore_rest_of_line
-
-Nathan Sidwell <nathan@codesourcery.com> writes:
-
-> Index: read.c
-> ===================================================================
-> RCS file: /cvs/src/src/gas/read.c,v
-> retrieving revision 1.76
-> diff -c -3 -p -r1.76 read.c
-> *** read.c	12 Mar 2004 17:48:12 -0000	1.76
-> --- read.c	18 Mar 2004 09:56:05 -0000
-> *************** read_a_source_file (char *name)
-> *** 1053,1059 ****
->   #endif
->   	  input_line_pointer--;
->   	  /* Report unknown char as ignored.  */
-> ! 	  ignore_rest_of_line ();
->   	}
->   
->   #ifdef md_after_pass_hook
-> --- 1053,1059 ----
->   #endif
->   	  input_line_pointer--;
->   	  /* Report unknown char as ignored.  */
-> ! 	  demand_empty_rest_of_line ();
->   	}
->   
->   #ifdef md_after_pass_hook
-
-This means that the unknown character is no longer ignored, despite the
-comment.  As a side effect a line starting with a line comment character
-not followed by APP in NO_APP mode now triggers an error instead of just a
-warning, breaking builds of glibc on m68k-linux.  Earlier in
-read_a_source_file where #APP is handled there is another comment that
-claims that unknown comments are ignored, when in fact they aren't (only
-the initial line comment character is skipped).
-
-Note that the presence of #APP will mess up the line counters, but
-that appears to be difficult to fix.
-
-Andreas.
-
-2004-04-23  Andreas Schwab  <schwab@suse.de>
-
-	* read.c (read_a_source_file): Ignore unknown text after line
-	comment character.  Fix misleading comment.
-
---- binutils/gas/read.c.~1.78.~	2004-04-23 08:58:23.000000000 +0200
-+++ binutils/gas/read.c	2004-04-23 21:49:01.000000000 +0200
-@@ -950,10 +950,14 @@ read_a_source_file (char *name)
- 	      unsigned int new_length;
- 	      char *tmp_buf = 0;
- 
--	      bump_line_counters ();
- 	      s = input_line_pointer;
- 	      if (strncmp (s, "APP\n", 4))
--		continue;	/* We ignore it */
-+		{
-+		  /* We ignore it */
-+		  ignore_rest_of_line ();
-+		  continue;
-+		}
-+	      bump_line_counters ();
- 	      s += 4;
- 
- 	      sb_new (&sbuf);
-@@ -1052,7 +1056,7 @@ read_a_source_file (char *name)
- 	    continue;
- #endif
- 	  input_line_pointer--;
--	  /* Report unknown char as ignored.  */
-+	  /* Report unknown char as error.  */
- 	  demand_empty_rest_of_line ();
- 	}
- 
-
--- 
-Andreas Schwab, SuSE Labs, schwab at suse.de
-SuSE Linux AG, Maxfeldstra&#xC3;e 5, 90409 N&#xC3;rnberg, Germany
-Key fingerprint = 58CA 54C7 6D53 942B 1756  01D3 44D5 214B 8276 4ED5
-"And now for something completely different."

Modified: trunk/buildroot/toolchain/binutils/Config.in
===================================================================
--- trunk/buildroot/toolchain/binutils/Config.in	2006-09-24 02:10:03 UTC (rev 16211)
+++ trunk/buildroot/toolchain/binutils/Config.in	2006-09-24 21:28:52 UTC (rev 16212)
@@ -51,6 +51,10 @@
 		depends !BR2_nios2
 		bool "binutils 2.17.50.0.3"
 
+	config BR2_BINUTILS_VERSION_2_17_50_0_4
+		depends !BR2_nios2
+		bool "binutils 2.17.50.0.4"
+
 endchoice
 
 config BR2_BINUTILS_VERSION
@@ -66,6 +70,7 @@
 	default "2.17"            if BR2_BINUTILS_VERSION_2_17
 	default "2.17.50.0.2"     if BR2_BINUTILS_VERSION_2_17_50_0_2
 	default "2.17.50.0.3"     if BR2_BINUTILS_VERSION_2_17_50_0_3
+	default "2.17.50.0.4"     if BR2_BINUTILS_VERSION_2_17_50_0_4
 
 config BR2_EXTRA_BINUTILS_CONFIG_OPTIONS
 	string "Additional binutils options"
