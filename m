From: nkukard at uclibc.org <nkukard@uclibc.org>
Date: Tue, 29 Apr 2008 13:03:03 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/bash
Message-ID: <20080429200303.C69333C6FD@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: nkukard
Date: 2008-04-29 13:03:03 -0700 (Tue, 29 Apr 2008)
New Revision: 21895

Log:
* Sync'd bash patches to upstream


Added:
   trunk/buildroot/package/bash/bash32-025
   trunk/buildroot/package/bash/bash32-026
   trunk/buildroot/package/bash/bash32-027
   trunk/buildroot/package/bash/bash32-028
   trunk/buildroot/package/bash/bash32-029
   trunk/buildroot/package/bash/bash32-030
   trunk/buildroot/package/bash/bash32-031
   trunk/buildroot/package/bash/bash32-032
   trunk/buildroot/package/bash/bash32-033


Changeset:
Added: trunk/buildroot/package/bash/bash32-025
===================================================================
--- trunk/buildroot/package/bash/bash32-025	                        (rev 0)
+++ trunk/buildroot/package/bash/bash32-025	2008-04-29 20:03:03 UTC (rev 21895)
@@ -0,0 +1,79 @@
+			     BASH PATCH REPORT
+			     =================
+
+Bash-Release: 3.2
+Patch-ID: bash32-025
+
+Bug-Reported-by:	Tom Bjorkholm <tom.bjorkholm@ericsson.com>
+Bug-Reference-ID:	<AEA1A32F001C6B4F98614B5B80D7647D01C075E9@esealmw115.eemea.ericsson.se>
+Bug-Reference-URL:	http://lists.gnu.org/archive/html/bug-readline/2007-04/msg00004.html
+
+Bug-Description:
+
+An off-by-one error in readline's input buffering caused readline to drop
+each 511th character of buffered input (e.g., when pasting a large amount
+of data into a terminal window).
+
+Patch:
+
+*** ../bash-3.2-patched/lib/readline/input.c	Wed Aug 16 15:15:16 2006
+--- lib/readline/input.c	Tue Jul 17 09:24:21 2007
+***************
+*** 134,139 ****
+  
+    *key = ibuffer[pop_index++];
+! 
+    if (pop_index >= ibuffer_len)
+      pop_index = 0;
+  
+--- 134,142 ----
+  
+    *key = ibuffer[pop_index++];
+! #if 0
+    if (pop_index >= ibuffer_len)
++ #else
++   if (pop_index > ibuffer_len)
++ #endif
+      pop_index = 0;
+  
+***************
+*** 251,255 ****
+  	{
+  	  k = (*rl_getc_function) (rl_instream);
+! 	  rl_stuff_char (k);
+  	  if (k == NEWLINE || k == RETURN)
+  	    break;
+--- 254,259 ----
+  	{
+  	  k = (*rl_getc_function) (rl_instream);
+! 	  if (rl_stuff_char (k) == 0)
+! 	    break;			/* some problem; no more room */
+  	  if (k == NEWLINE || k == RETURN)
+  	    break;
+***************
+*** 374,378 ****
+--- 378,386 ----
+      }
+    ibuffer[push_index++] = key;
++ #if 0
+    if (push_index >= ibuffer_len)
++ #else
++   if (push_index > ibuffer_len)
++ #endif
+      push_index = 0;
+  
+*** ../bash-3.2/patchlevel.h	Thu Apr 13 08:31:04 2006
+--- patchlevel.h	Mon Oct 16 14:22:54 2006
+***************
+*** 26,30 ****
+     looks for to find the patch level (for the sccs version string). */
+  
+! #define PATCHLEVEL 24
+  
+  #endif /* _PATCHLEVEL_H_ */
+--- 26,30 ----
+     looks for to find the patch level (for the sccs version string). */
+  
+! #define PATCHLEVEL 25
+  
+  #endif /* _PATCHLEVEL_H_ */

Added: trunk/buildroot/package/bash/bash32-026
===================================================================
--- trunk/buildroot/package/bash/bash32-026	                        (rev 0)
+++ trunk/buildroot/package/bash/bash32-026	2008-04-29 20:03:03 UTC (rev 21895)
@@ -0,0 +1,82 @@
+			     BASH PATCH REPORT
+			     =================
+
+Bash-Release: 3.2
+Patch-ID: bash32-026
+
+Bug-Reported-by:	Chet Ramey <chet.ramey@case.edu>
+Bug-Reference-ID:
+Bug-Reference-URL:
+
+Bug-Description:
+
+This keeps the Apple linker from attempting to link bash against Apple's
+readline library "replacement" rather than the one shipped with bash.  It
+extends the configure workaround to Mac OS X Leopard (10.5).
+
+As a side effect, the patch updates the copyright date displayed in the
+version string.
+
+You must re-run configure after applying the patch, and before rebuilding
+bash.
+
+Patch:
+
+*** ../bash-3.2-patched/configure.in	2007-03-06 11:07:38.000000000 -0500
+--- configure.in	2007-11-23 15:37:41.000000000 -0500
+***************
+*** 519,523 ****
+  		# dynamic version
+  		case "${host_os}" in
+! 		darwin8*)	READLINE_LIB='${READLINE_LIBRARY}' ;;
+  		*)		READLINE_LIB=-lreadline ;;
+  		esac
+--- 519,523 ----
+  		# dynamic version
+  		case "${host_os}" in
+! 		darwin[[89]]*)	READLINE_LIB='${READLINE_LIBRARY}' ;;
+  		*)		READLINE_LIB=-lreadline ;;
+  		esac
+*** ../bash-3.2-patched/configure	2007-03-24 14:51:22.000000000 -0400
+--- configure	2007-11-23 15:46:15.000000000 -0500
+***************
+*** 4872,4876 ****
+  		# dynamic version
+  		case "${host_os}" in
+! 		darwin8*)	READLINE_LIB='${READLINE_LIBRARY}' ;;
+  		*)		READLINE_LIB=-lreadline ;;
+  		esac
+--- 4872,4876 ----
+  		# dynamic version
+  		case "${host_os}" in
+! 		darwin[89]*)	READLINE_LIB='${READLINE_LIBRARY}' ;;
+  		*)		READLINE_LIB=-lreadline ;;
+  		esac
+*** ../bash-3.2-patched/version.c	2005-05-16 11:58:34.000000000 -0400
+--- version.c	2007-11-23 16:03:40.000000000 -0500
+***************
+*** 80,83 ****
+    printf ("GNU bash, version %s (%s)\n", shell_version_string (), MACHTYPE);
+    if (extended)
+!     printf (_("Copyright (C) 2005 Free Software Foundation, Inc.\n"));
+  }
+--- 80,83 ----
+    printf ("GNU bash, version %s (%s)\n", shell_version_string (), MACHTYPE);
+    if (extended)
+!     printf (_("Copyright (C) 2007 Free Software Foundation, Inc.\n"));
+  }
+*** ../bash-3.2/patchlevel.h	Thu Apr 13 08:31:04 2006
+--- patchlevel.h	Mon Oct 16 14:22:54 2006
+***************
+*** 26,30 ****
+     looks for to find the patch level (for the sccs version string). */
+  
+! #define PATCHLEVEL 25
+  
+  #endif /* _PATCHLEVEL_H_ */
+--- 26,30 ----
+     looks for to find the patch level (for the sccs version string). */
+  
+! #define PATCHLEVEL 26
+  
+  #endif /* _PATCHLEVEL_H_ */

Added: trunk/buildroot/package/bash/bash32-027
===================================================================
--- trunk/buildroot/package/bash/bash32-027	                        (rev 0)
+++ trunk/buildroot/package/bash/bash32-027	2008-04-29 20:03:03 UTC (rev 21895)
@@ -0,0 +1,85 @@
+			     BASH PATCH REPORT
+			     =================
+
+Bash-Release: 3.2
+Patch-ID: bash32-027
+
+Bug-Reported-by:	dAniel hAhler <ubuntu@thequod.de>
+Bug-Reference-ID:	<4702ED8A.5000503@thequod.de>
+Bug-Reference-URL:	https://bugs.launchpad.net/ubuntu/+source/bash/+bug/119938
+
+Bug-Description:
+
+When updating the display after displaying, for instance, a list of possible
+completions, readline will place the cursor at the wrong position if the
+prompt contains invisible characters and a newline.
+
+Patch:
+
+*** ../bash-3.2.25/lib/readline/display.c	Mon Aug  6 14:26:29 2007
+--- lib/readline/display.c	Wed Oct 10 22:43:58 2007
+***************
+*** 1049,1053 ****
+  	      else
+  		tx = nleft;
+! 	      if (_rl_last_c_pos > tx)
+  		{
+  	          _rl_backspace (_rl_last_c_pos - tx);	/* XXX */
+--- 1049,1053 ----
+  	      else
+  		tx = nleft;
+! 	      if (tx >= 0 && _rl_last_c_pos > tx)
+  		{
+  	          _rl_backspace (_rl_last_c_pos - tx);	/* XXX */
+***************
+*** 1205,1209 ****
+  {
+    register char *ofd, *ols, *oe, *nfd, *nls, *ne;
+!   int temp, lendiff, wsatend, od, nd;
+    int current_invis_chars;
+    int col_lendiff, col_temp;
+--- 1205,1209 ----
+  {
+    register char *ofd, *ols, *oe, *nfd, *nls, *ne;
+!   int temp, lendiff, wsatend, od, nd, o_cpos;
+    int current_invis_chars;
+    int col_lendiff, col_temp;
+***************
+*** 1466,1469 ****
+--- 1466,1471 ----
+      }
+  
++   o_cpos = _rl_last_c_pos;
++ 
+    /* When this function returns, _rl_last_c_pos is correct, and an absolute
+       cursor postion in multibyte mode, but a buffer index when not in a
+***************
+*** 1475,1479 ****
+       invisible characters in the prompt string.  Let's see if setting this when
+       we make sure we're at the end of the drawn prompt string works. */
+!   if (current_line == 0 && MB_CUR_MAX > 1 && rl_byte_oriented == 0 && _rl_last_c_pos == prompt_physical_chars)
+      cpos_adjusted = 1;
+  #endif
+--- 1477,1483 ----
+       invisible characters in the prompt string.  Let's see if setting this when
+       we make sure we're at the end of the drawn prompt string works. */
+!   if (current_line == 0 && MB_CUR_MAX > 1 && rl_byte_oriented == 0 && 
+!       (_rl_last_c_pos > 0 || o_cpos > 0) &&
+!       _rl_last_c_pos == prompt_physical_chars)
+      cpos_adjusted = 1;
+  #endif
+*** ../bash-3.2/patchlevel.h	Thu Apr 13 08:31:04 2006
+--- patchlevel.h	Mon Oct 16 14:22:54 2006
+***************
+*** 26,30 ****
+     looks for to find the patch level (for the sccs version string). */
+  
+! #define PATCHLEVEL 26
+  
+  #endif /* _PATCHLEVEL_H_ */
+--- 26,30 ----
+     looks for to find the patch level (for the sccs version string). */
+  
+! #define PATCHLEVEL 27
+  
+  #endif /* _PATCHLEVEL_H_ */

Added: trunk/buildroot/package/bash/bash32-028
===================================================================
--- trunk/buildroot/package/bash/bash32-028	                        (rev 0)
+++ trunk/buildroot/package/bash/bash32-028	2008-04-29 20:03:03 UTC (rev 21895)
@@ -0,0 +1,60 @@
+			     BASH PATCH REPORT
+			     =================
+
+Bash-Release: 3.2
+Patch-ID: bash32-028
+
+Bug-Reported-by:	dAniel hAhler <ubuntu@thequod.de>
+Bug-Reference-ID:
+Bug-Reference-URL:
+
+Bug-Description:
+
+Under some circumstances, readline will incorrectly display a prompt string
+containing invisible characters after the final newline.
+
+Patch:
+
+*** ../bash-3.2-patched/lib/readline/display.c	2007-08-25 13:47:08.000000000 -0400
+--- lib/readline/display.c	2007-11-10 17:51:29.000000000 -0500
+***************
+*** 392,396 ****
+        local_prompt = expand_prompt (p, &prompt_visible_length,
+  				       &prompt_last_invisible,
+! 				       (int *)NULL,
+  				       &prompt_physical_chars);
+        c = *t; *t = '\0';
+--- 420,424 ----
+        local_prompt = expand_prompt (p, &prompt_visible_length,
+  				       &prompt_last_invisible,
+! 				       &prompt_invis_chars_first_line,
+  				       &prompt_physical_chars);
+        c = *t; *t = '\0';
+***************
+*** 399,403 ****
+        local_prompt_prefix = expand_prompt (prompt, &prompt_prefix_length,
+  						   (int *)NULL,
+! 						   &prompt_invis_chars_first_line,
+  						   (int *)NULL);
+        *t = c;
+--- 427,431 ----
+        local_prompt_prefix = expand_prompt (prompt, &prompt_prefix_length,
+  						   (int *)NULL,
+! 						   (int *)NULL,
+  						   (int *)NULL);
+        *t = c;
+*** ../bash-3.2/patchlevel.h	Thu Apr 13 08:31:04 2006
+--- patchlevel.h	Mon Oct 16 14:22:54 2006
+***************
+*** 26,30 ****
+     looks for to find the patch level (for the sccs version string). */
+  
+! #define PATCHLEVEL 27
+  
+  #endif /* _PATCHLEVEL_H_ */
+--- 26,30 ----
+     looks for to find the patch level (for the sccs version string). */
+  
+! #define PATCHLEVEL 28
+  
+  #endif /* _PATCHLEVEL_H_ */

Added: trunk/buildroot/package/bash/bash32-029
===================================================================
--- trunk/buildroot/package/bash/bash32-029	                        (rev 0)
+++ trunk/buildroot/package/bash/bash32-029	2008-04-29 20:03:03 UTC (rev 21895)
@@ -0,0 +1,52 @@
+			     BASH PATCH REPORT
+			     =================
+
+Bash-Release: 3.2
+Patch-ID: bash32-029
+
+Bug-Reported-by:	Tomas Janousek <tjanouse@redhat.com>
+Bug-Reference-ID:	<20071102104034.GA26893@redhat.com>
+Bug-Reference-URL:	https://bugzilla.redhat.com/show_bug.cgi?id=286861
+
+Bug-Description:
+
+When the bash arithmetic expression evaluator has temporarily turned off
+evalation, such as when parsing a pre- or post-decrement or -increment
+operator, and an error occurs, evaluation is not re-enabled.
+
+Patch:
+
+*** ../bash-3.2-patched/expr.c	2007-08-25 13:47:05.000000000 -0400
+--- expr.c	2007-10-18 08:08:44.000000000 -0400
+***************
+*** 287,290 ****
+--- 287,292 ----
+      }
+    free (expr_stack[expr_depth]);	/* free the allocated EXPR_CONTEXT */
++ 
++   noeval = 0;	/* XXX */
+  }
+  
+***************
+*** 320,323 ****
+--- 322,326 ----
+  
+    val = 0;
++   noeval = 0;
+  
+    FASTCOPY (evalbuf, oevalbuf, sizeof (evalbuf));
+*** ../bash-3.2/patchlevel.h	Thu Apr 13 08:31:04 2006
+--- patchlevel.h	Mon Oct 16 14:22:54 2006
+***************
+*** 26,30 ****
+     looks for to find the patch level (for the sccs version string). */
+  
+! #define PATCHLEVEL 28
+  
+  #endif /* _PATCHLEVEL_H_ */
+--- 26,30 ----
+     looks for to find the patch level (for the sccs version string). */
+  
+! #define PATCHLEVEL 29
+  
+  #endif /* _PATCHLEVEL_H_ */

Added: trunk/buildroot/package/bash/bash32-030
===================================================================
--- trunk/buildroot/package/bash/bash32-030	                        (rev 0)
+++ trunk/buildroot/package/bash/bash32-030	2008-04-29 20:03:03 UTC (rev 21895)
@@ -0,0 +1,50 @@
+			     BASH PATCH REPORT
+			     =================
+
+Bash-Release: 3.2
+Patch-ID: bash32-030
+
+Bug-Reported-by:	Paul Eggert <eggert@cs.ucla.edu> Andreas Schwab <schwab@suse.de>
+Bug-Reference-ID:	<877il0nu84.fsf_-_@penguin.cs.ucla.edu> <m28x5gparz.fsf@igel.home>
+Bug-Reference-URL:	http://lists.gnu.org/archive/html/bug-bash/2007-11/msg00023.html http://lists.gnu.org/archive/html/bug-bash/2007-11/msg00022.htmlhttp://lists.gnu.org/archive/html/bug-bash/2007-11/msg00022.html
+
+Bug-Description:
+
+If redirections attached to a compound command fail, bash does not set the
+command's exit status correctly.  This only happens when the command is the
+first in a sequential list.
+
+Patch:
+
+*** ../bash-3.2-patched/execute_cmd.c	2007-03-24 14:51:05.000000000 -0400
+--- execute_cmd.c	2007-11-05 22:31:14.000000000 -0500
+***************
+*** 615,619 ****
+        redirection_undo_list = (REDIRECT *)NULL;
+        dispose_exec_redirects ();
+!       return (EXECUTION_FAILURE);
+      }
+  
+--- 620,624 ----
+        redirection_undo_list = (REDIRECT *)NULL;
+        dispose_exec_redirects ();
+!       return (last_command_exit_value = EXECUTION_FAILURE);
+      }
+
+*** ../bash-3.2/patchlevel.h	Thu Apr 13 08:31:04 2006
+--- patchlevel.h	Mon Oct 16 14:22:54 2006
+***************
+*** 26,30 ****
+     looks for to find the patch level (for the sccs version string). */
+  
+! #define PATCHLEVEL 29
+  
+  #endif /* _PATCHLEVEL_H_ */
+--- 26,30 ----
+     looks for to find the patch level (for the sccs version string). */
+  
+! #define PATCHLEVEL 30
+  
+  #endif /* _PATCHLEVEL_H_ */
+
+  

Added: trunk/buildroot/package/bash/bash32-031
===================================================================
--- trunk/buildroot/package/bash/bash32-031	                        (rev 0)
+++ trunk/buildroot/package/bash/bash32-031	2008-04-29 20:03:03 UTC (rev 21895)
@@ -0,0 +1,62 @@
+			     BASH PATCH REPORT
+			     =================
+
+Bash-Release: 3.2
+Patch-ID: bash32-031
+
+Bug-Reported-by:	Miroslav Lichvar <mlichvar@redhat.com>
+Bug-Reference-ID:	Fri, 02 Nov 2007 14:07:45 +0100
+Bug-Reference-URL:	http://lists.gnu.org/archive/html/bug-readline/2007-11/msg00000.html
+
+Bug-Description:
+
+In certain cases when outputting characters at the end of the line,
+e.g., when displaying the prompt string, readline positions the cursor
+incorrectly if the prompt string contains invisible characters and the
+text being drawn begins before the last invisible character in the line.
+
+Patch:
+
+*** ../bash-3.2-patched/lib/readline/display.c	2007-08-25 13:47:08.000000000 -0400
+--- lib/readline/display.c	2007-11-10 17:51:29.000000000 -0500
+***************
+*** 1566,1574 ****
+  	  else
+  	    {
+- 	      /* We have horizontal scrolling and we are not inserting at
+- 		 the end.  We have invisible characters in this line.  This
+- 		 is a dumb update. */
+  	      _rl_output_some_chars (nfd, temp);
+  	      _rl_last_c_pos += col_temp;
+  	      return;
+  	    }
+--- 1619,1632 ----
+  	  else
+  	    {
+  	      _rl_output_some_chars (nfd, temp);
+  	      _rl_last_c_pos += col_temp;
++ 	      /* If nfd begins before any invisible characters in the prompt,
++ 		 adjust _rl_last_c_pos to account for wrap_offset and set
++ 		 cpos_adjusted to let the caller know. */
++ 	      if (current_line == 0 && wrap_offset && ((nfd - new) <= prompt_last_invisible))
++ 		{
++ 		  _rl_last_c_pos -= wrap_offset;
++ 		  cpos_adjusted = 1;
++ 		}
+  	      return;
+  	    }
+*** ../bash-3.2/patchlevel.h	Thu Apr 13 08:31:04 2006
+--- patchlevel.h	Mon Oct 16 14:22:54 2006
+***************
+*** 26,30 ****
+     looks for to find the patch level (for the sccs version string). */
+  
+! #define PATCHLEVEL 30
+  
+  #endif /* _PATCHLEVEL_H_ */
+--- 26,30 ----
+     looks for to find the patch level (for the sccs version string). */
+  
+! #define PATCHLEVEL 31
+  
+  #endif /* _PATCHLEVEL_H_ */

Added: trunk/buildroot/package/bash/bash32-032
===================================================================
--- trunk/buildroot/package/bash/bash32-032	                        (rev 0)
+++ trunk/buildroot/package/bash/bash32-032	2008-04-29 20:03:03 UTC (rev 21895)
@@ -0,0 +1,47 @@
+			     BASH PATCH REPORT
+			     =================
+
+Bash-Release: 3.2
+Patch-ID: bash32-032
+
+Bug-Reported-by:	Uwe Doering <gemini@geminix.org>
+Bug-Reference-ID:	<46F3DD72.2090801@geminix.org>
+Bug-Reference-URL:	http://lists.gnu.org/archive/html/bug-bash/2007-09/msg00102.html
+
+Bug-Description:
+
+There is an off-by-one error in the code that buffers characters received
+very quickly in succession, causing characters to be dropped.
+
+Patch:
+
+*** ../bash-3.2-patched/lib/readline/input.c	2007-08-25 13:47:10.000000000 -0400
+--- lib/readline/input.c	2007-10-12 22:55:25.000000000 -0400
+***************
+*** 155,159 ****
+        pop_index--;
+        if (pop_index < 0)
+! 	pop_index = ibuffer_len - 1;
+        ibuffer[pop_index] = key;
+        return (1);
+--- 155,159 ----
+        pop_index--;
+        if (pop_index < 0)
+! 	pop_index = ibuffer_len;
+        ibuffer[pop_index] = key;
+        return (1);
+*** ../bash-3.2/patchlevel.h	Thu Apr 13 08:31:04 2006
+--- patchlevel.h	Mon Oct 16 14:22:54 2006
+***************
+*** 26,30 ****
+     looks for to find the patch level (for the sccs version string). */
+  
+! #define PATCHLEVEL 31
+  
+  #endif /* _PATCHLEVEL_H_ */
+--- 26,30 ----
+     looks for to find the patch level (for the sccs version string). */
+  
+! #define PATCHLEVEL 32
+  
+  #endif /* _PATCHLEVEL_H_ */

Added: trunk/buildroot/package/bash/bash32-033
===================================================================
--- trunk/buildroot/package/bash/bash32-033	                        (rev 0)
+++ trunk/buildroot/package/bash/bash32-033	2008-04-29 20:03:03 UTC (rev 21895)
@@ -0,0 +1,88 @@
+			     BASH PATCH REPORT
+			     =================
+
+Bash-Release: 3.2
+Patch-ID: bash32-033
+
+Bug-Reported-by:	Christophe Martin <schplurtz@free.fr>
+Bug-Reference-ID:	<465ABA4A.3030805@free.fr>
+Bug-Reference-URL:	http://lists.gnu.org/archive/html/bug-bash/2007-05/msg00104.html
+
+Bug-Description:
+
+References made within a function to an uninitialized local array variable
+using the [*] subscript in a double-quoted string  can result in spurious
+ASCII 127 characters in the expanded value.
+
+Patch:
+
+*** ../bash-3.2-patched/arrayfunc.c	2007-08-25 13:47:05.000000000 -0400
+--- arrayfunc.c	2007-05-31 11:55:46.000000000 -0400
+***************
+*** 723,727 ****
+      {
+        if (rtype)
+! 	*rtype = 1;
+        if (allow_all == 0)
+  	{
+--- 723,727 ----
+      {
+        if (rtype)
+! 	*rtype = (t[0] == '*') ? 1 : 2;
+        if (allow_all == 0)
+  	{
+*** ../bash-3.2-patched/subst.c	2007-08-25 13:47:08.000000000 -0400
+--- subst.c	2007-11-14 15:43:00.000000000 -0500
+***************
+*** 4908,4915 ****
+    intmax_t arg_index;
+    SHELL_VAR *var;
+!   int atype;
+  
+    ret = 0;
+    temp = 0;
+  
+    /* Handle multiple digit arguments, as in ${11}. */  
+--- 4973,4981 ----
+    intmax_t arg_index;
+    SHELL_VAR *var;
+!   int atype, rflags;
+  
+    ret = 0;
+    temp = 0;
++   rflags = 0;
+  
+    /* Handle multiple digit arguments, as in ${11}. */  
+***************
+*** 4944,4947 ****
+--- 5010,5015 ----
+   		  ? quote_string (temp)
+   		  : quote_escapes (temp);
++       else if (atype == 1 && temp && QUOTED_NULL (temp) && (quoted & (Q_DOUBLE_QUOTES|Q_HERE_DOCUMENT)))
++ 	rflags |= W_HASQUOTEDNULL;
+      }
+  #endif
+***************
+*** 4971,4974 ****
+--- 5039,5043 ----
+        ret = alloc_word_desc ();
+        ret->word = temp;
++       ret->flags |= rflags;
+      }
+    return ret;
+*** ../bash-3.2/patchlevel.h	Thu Apr 13 08:31:04 2006
+--- patchlevel.h	Mon Oct 16 14:22:54 2006
+***************
+*** 26,30 ****
+     looks for to find the patch level (for the sccs version string). */
+  
+! #define PATCHLEVEL 32
+  
+  #endif /* _PATCHLEVEL_H_ */
+--- 26,30 ----
+     looks for to find the patch level (for the sccs version string). */
+  
+! #define PATCHLEVEL 33
+  
+  #endif /* _PATCHLEVEL_H_ */
+
