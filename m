From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 24 Jan 2012 13:29:06 -0300
Subject: [Buildroot] [PATCH 2/4] bash: bump to version 4.2 pl20
In-Reply-To: <1327422548-20906-1-git-send-email-gustavo@zacarias.com.ar>
References: <1327422548-20906-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1327422548-20906-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/bash/bash-4.2-011.patch |   46 ++++++++++++
 package/bash/bash-4.2-012.patch |  151 +++++++++++++++++++++++++++++++++++++++
 package/bash/bash-4.2-013.patch |   52 +++++++++++++
 package/bash/bash-4.2-014.patch |   47 ++++++++++++
 package/bash/bash-4.2-015.patch |   81 +++++++++++++++++++++
 package/bash/bash-4.2-016.patch |   46 ++++++++++++
 package/bash/bash-4.2-017.patch |   47 ++++++++++++
 package/bash/bash-4.2-018.patch |   74 +++++++++++++++++++
 package/bash/bash-4.2-019.patch |   47 ++++++++++++
 package/bash/bash-4.2-020.patch |   60 +++++++++++++++
 10 files changed, 651 insertions(+), 0 deletions(-)
 create mode 100644 package/bash/bash-4.2-011.patch
 create mode 100644 package/bash/bash-4.2-012.patch
 create mode 100644 package/bash/bash-4.2-013.patch
 create mode 100644 package/bash/bash-4.2-014.patch
 create mode 100644 package/bash/bash-4.2-015.patch
 create mode 100644 package/bash/bash-4.2-016.patch
 create mode 100644 package/bash/bash-4.2-017.patch
 create mode 100644 package/bash/bash-4.2-018.patch
 create mode 100644 package/bash/bash-4.2-019.patch
 create mode 100644 package/bash/bash-4.2-020.patch

diff --git a/package/bash/bash-4.2-011.patch b/package/bash/bash-4.2-011.patch
new file mode 100644
index 0000000..802c1f1
--- /dev/null
+++ b/package/bash/bash-4.2-011.patch
@@ -0,0 +1,46 @@
+			     BASH PATCH REPORT
+			     =================
+
+Bash-Release:	4.2
+Patch-ID:	bash42-011
+
+Bug-Reported-by:	"David Parks" <davidparks21@yahoo.com>
+Bug-Reference-ID:	<014101cc82c6$46ac1540$d4043fc0$@com>
+Bug-Reference-URL:	http://lists.gnu.org/archive/html/bug-bash/2011-10/msg00031.html
+
+Bug-Description:
+
+Overwriting a value in an associative array causes the memory allocated to
+store the key on the second and subsequent assignments to leak.
+
+Patch (apply with `patch -p0'):
+
+*** ../bash-4.2-patched/assoc.c	2009-08-05 20:19:40.000000000 -0400
+--- ./assoc.c	2011-10-04 20:23:07.000000000 -0400
+***************
+*** 78,81 ****
+--- 78,86 ----
+    if (b == 0)
+      return -1;
++   /* If we are overwriting an existing element's value, we're not going to
++      use the key.  Nothing in the array assignment code path frees the key
++      string, so we can free it here to avoid a memory leak. */
++   if (b->key != key)
++     free (key);
+    FREE (b->data);
+    b->data = value ? savestring (value) : (char *)0;
+*** ../bash-4.2-patched/patchlevel.h	Sat Jun 12 20:14:48 2010
+--- ./patchlevel.h	Thu Feb 24 21:41:34 2011
+***************
+*** 26,30 ****
+     looks for to find the patch level (for the sccs version string). */
+  
+! #define PATCHLEVEL 10
+  
+  #endif /* _PATCHLEVEL_H_ */
+--- 26,30 ----
+     looks for to find the patch level (for the sccs version string). */
+  
+! #define PATCHLEVEL 11
+  
+  #endif /* _PATCHLEVEL_H_ */
diff --git a/package/bash/bash-4.2-012.patch b/package/bash/bash-4.2-012.patch
new file mode 100644
index 0000000..9a1c49c
--- /dev/null
+++ b/package/bash/bash-4.2-012.patch
@@ -0,0 +1,151 @@
+			     BASH PATCH REPORT
+			     =================
+
+Bash-Release:	4.2
+Patch-ID:	bash42-012
+
+Bug-Reported-by:	Rui Santos <rsantos@grupopie.com>
+Bug-Reference-ID:	<4E04C6D0.2020507@grupopie.com>
+Bug-Reference-URL:	http://lists.gnu.org/archive/html/bug-bash/2011-06/msg00079.html
+
+Bug-Description:
+
+When calling the parser to recursively parse a command substitution within
+an arithmetic expansion, the shell overwrote the saved shell input line and
+associated state, resulting in a garbled command.
+
+Patch (apply with `patch -p0'):
+
+*** ../bash-4.2-patched/parse.y	2011-02-26 19:19:05.000000000 -0500
+--- ./parse.y	2011-06-24 20:08:22.000000000 -0400
+***************
+*** 3843,3846 ****
+--- 3849,3853 ----
+  {
+    sh_parser_state_t ps;
++   sh_input_line_state_t ls;
+    int orig_ind, nc, sflags;
+    char *ret, *s, *ep, *ostring;
+***************
+*** 3850,3857 ****
+--- 3857,3866 ----
+    ostring = string;
+  
++ /*itrace("xparse_dolparen: size = %d shell_input_line = `%s'", shell_input_line_size, shell_input_line);*/
+    sflags = SEVAL_NONINT|SEVAL_NOHIST|SEVAL_NOFREE;
+    if (flags & SX_NOLONGJMP)
+      sflags |= SEVAL_NOLONGJMP;
+    save_parser_state (&ps);
++   save_input_line_state (&ls);
+  
+    /*(*/
+***************
+*** 3862,3865 ****
+--- 3871,3876 ----
+    restore_parser_state (&ps);
+    reset_parser ();
++   /* reset_parser clears shell_input_line and associated variables */
++   restore_input_line_state (&ls);
+    if (interactive)
+      token_to_read = 0;
+***************
+*** 5909,5912 ****
+--- 5920,5929 ----
+    ps->echo_input_at_read = echo_input_at_read;
+  
++   ps->token = token;
++   ps->token_buffer_size = token_buffer_size;
++   /* Force reallocation on next call to read_token_word */
++   token = 0;
++   token_buffer_size = 0;
++ 
+    return (ps);
+  }
+***************
+*** 5950,5953 ****
+--- 5967,6006 ----
+    expand_aliases = ps->expand_aliases;
+    echo_input_at_read = ps->echo_input_at_read;
++ 
++   FREE (token);
++   token = ps->token;
++   token_buffer_size = ps->token_buffer_size;
++ }
++ 
++ sh_input_line_state_t *
++ save_input_line_state (ls)
++      sh_input_line_state_t *ls;
++ {
++   if (ls == 0)
++     ls = (sh_input_line_state_t *)xmalloc (sizeof (sh_input_line_state_t));
++   if (ls == 0)
++     return ((sh_input_line_state_t *)NULL);
++ 
++   ls->input_line = shell_input_line;
++   ls->input_line_size = shell_input_line_size;
++   ls->input_line_len = shell_input_line_len;
++   ls->input_line_index = shell_input_line_index;
++ 
++   /* force reallocation */
++   shell_input_line = 0;
++   shell_input_line_size = shell_input_line_len = shell_input_line_index = 0;
++ }
++ 
++ void
++ restore_input_line_state (ls)
++      sh_input_line_state_t *ls;
++ {
++   FREE (shell_input_line);
++   shell_input_line = ls->input_line;
++   shell_input_line_size = ls->input_line_size;
++   shell_input_line_len = ls->input_line_len;
++   shell_input_line_index = ls->input_line_index;
++ 
++   set_line_mbstate ();
+  }
+  
+*** ../bash-4.2-patched/shell.h	2011-01-06 22:16:55.000000000 -0500
+--- ./shell.h	2011-06-24 19:12:25.000000000 -0400
+***************
+*** 137,140 ****
+--- 139,145 ----
+    int *token_state;
+  
++   char *token;
++   int token_buffer_size;
++ 
+    /* input line state -- line number saved elsewhere */
+    int input_line_terminator;
+***************
+*** 167,171 ****
+--- 172,186 ----
+  } sh_parser_state_t;
+  
++ typedef struct _sh_input_line_state_t {
++   char *input_line;
++   int input_line_index;
++   int input_line_size;
++   int input_line_len;
++ } sh_input_line_state_t;
++ 
+  /* Let's try declaring these here. */
+  extern sh_parser_state_t *save_parser_state __P((sh_parser_state_t *));
+  extern void restore_parser_state __P((sh_parser_state_t *));
++ 
++ extern sh_input_line_state_t *save_input_line_state __P((sh_input_line_state_t *));
++ extern void restore_input_line_state __P((sh_input_line_state_t *));
+*** ../bash-4.2-patched/patchlevel.h	Sat Jun 12 20:14:48 2010
+--- ./patchlevel.h	Thu Feb 24 21:41:34 2011
+***************
+*** 26,30 ****
+     looks for to find the patch level (for the sccs version string). */
+  
+! #define PATCHLEVEL 11
+  
+  #endif /* _PATCHLEVEL_H_ */
+--- 26,30 ----
+     looks for to find the patch level (for the sccs version string). */
+  
+! #define PATCHLEVEL 12
+  
+  #endif /* _PATCHLEVEL_H_ */
diff --git a/package/bash/bash-4.2-013.patch b/package/bash/bash-4.2-013.patch
new file mode 100644
index 0000000..06840a3
--- /dev/null
+++ b/package/bash/bash-4.2-013.patch
@@ -0,0 +1,52 @@
+			     BASH PATCH REPORT
+			     =================
+
+Bash-Release:	4.2
+Patch-ID:	bash42-013
+
+Bug-Reported-by:	Marten Wikstrom <marten.wikstrom@keystream.se>
+Bug-Reference-ID:	<BANLkTikKECAh94ZEX68iQvxYuPeEM_xoSQ@mail.gmail.com>
+Bug-Reference-URL:	http://lists.gnu.org/archive/html/bug-bash/2011-05/msg00049.html
+
+Bug-Description:
+
+An off-by-one error caused the shell to skip over CTLNUL characters,
+which are used internally to mark quoted null strings.  The effect
+was to have stray 0x7f characters left after expanding words like
+""""""""aa.
+
+Patch (apply with `patch -p0'):
+
+*** ../bash-4.2-patched/subst.c	2011-03-06 14:11:11.000000000 -0500
+--- ./subst.c	2011-05-11 11:23:33.000000000 -0400
+***************
+*** 3707,3711 ****
+  	}
+        else if (string[i] == CTLNUL)
+! 	i++;
+  
+        prev_i = i;
+--- 3710,3717 ----
+  	}
+        else if (string[i] == CTLNUL)
+! 	{
+! 	  i++;
+! 	  continue;
+! 	}
+  
+        prev_i = i;
+*** ../bash-4.2-patched/patchlevel.h	Sat Jun 12 20:14:48 2010
+--- ./patchlevel.h	Thu Feb 24 21:41:34 2011
+***************
+*** 26,30 ****
+     looks for to find the patch level (for the sccs version string). */
+  
+! #define PATCHLEVEL 12
+  
+  #endif /* _PATCHLEVEL_H_ */
+--- 26,30 ----
+     looks for to find the patch level (for the sccs version string). */
+  
+! #define PATCHLEVEL 13
+  
+  #endif /* _PATCHLEVEL_H_ */
diff --git a/package/bash/bash-4.2-014.patch b/package/bash/bash-4.2-014.patch
new file mode 100644
index 0000000..d6652eb
--- /dev/null
+++ b/package/bash/bash-4.2-014.patch
@@ -0,0 +1,47 @@
+			     BASH PATCH REPORT
+			     =================
+
+Bash-Release:	4.2
+Patch-ID:	bash42-014
+
+Bug-Reported-by:	Shawn Bohrer <sbohrer@rgmadvisors.com>
+Bug-Reference-ID:	<20110504152320.6E8F28130527@dev1.rgmadvisors.com>
+Bug-Reference-URL:	http://lists.gnu.org/archive/html/bug-bash/2011-05/msg00018.html
+
+Bug-Description:
+
+The regular expression matching operator did not correctly match
+expressions with an embedded ^A.
+
+Patch (apply with `patch -p0'):
+
+*** ../bash-4.2-patched/pathexp.c	2010-08-13 23:21:57.000000000 -0400
+--- ./pathexp.c	2011-05-05 16:40:58.000000000 -0400
+***************
+*** 197,201 ****
+  	  if ((qflags & QGLOB_FILENAME) && pathname[i+1] == '/')
+  	    continue;
+! 	  if ((qflags & QGLOB_REGEXP) && ere_char (pathname[i+1]) == 0)
+  	    continue;
+  	  temp[j++] = '\\';
+--- 197,201 ----
+  	  if ((qflags & QGLOB_FILENAME) && pathname[i+1] == '/')
+  	    continue;
+! 	  if (pathname[i+1] != CTLESC && (qflags & QGLOB_REGEXP) && ere_char (pathname[i+1]) == 0)
+  	    continue;
+  	  temp[j++] = '\\';
+*** ../bash-4.2-patched/patchlevel.h	Sat Jun 12 20:14:48 2010
+--- ./patchlevel.h	Thu Feb 24 21:41:34 2011
+***************
+*** 26,30 ****
+     looks for to find the patch level (for the sccs version string). */
+  
+! #define PATCHLEVEL 13
+  
+  #endif /* _PATCHLEVEL_H_ */
+--- 26,30 ----
+     looks for to find the patch level (for the sccs version string). */
+  
+! #define PATCHLEVEL 14
+  
+  #endif /* _PATCHLEVEL_H_ */
diff --git a/package/bash/bash-4.2-015.patch b/package/bash/bash-4.2-015.patch
new file mode 100644
index 0000000..5bcca34
--- /dev/null
+++ b/package/bash/bash-4.2-015.patch
@@ -0,0 +1,81 @@
+			     BASH PATCH REPORT
+			     =================
+
+Bash-Release:	4.2
+Patch-ID:	bash42-015
+
+Bug-Reported-by:	<dnade.ext@orange-ftgroup.com>
+Bug-Reference-ID:	<728_1312188080_4E3666B0_728_118711_1_3B5D3E0F95CC5C478D6500CDCE8B691F7AAAA4AA3D@PUEXCB2B.nanterre.francetelecom.fr>
+Bug-Reference-URL:	http://lists.gnu.org/archive/html/bug-bash/2011-08/msg00000.html
+
+Bug-Description:
+
+When in a context where arithmetic evaluation is not taking place, the
+evaluator should not check for division by 0.
+
+Patch (apply with `patch -p0'):
+
+*** ../bash-4.2-patched/expr.c	2010-12-21 11:12:13.000000000 -0500
+--- ./expr.c	2011-08-02 20:58:28.000000000 -0400
+***************
+*** 477,480 ****
+--- 481,492 ----
+        if (special)
+  	{
++ 	  if ((op == DIV || op == MOD) && value == 0)
++ 	    {
++ 	      if (noeval == 0)
++ 		evalerror (_("division by 0"));
++ 	      else
++ 	        value = 1;
++ 	    }
++ 
+  	  switch (op)
+  	    {
+***************
+*** 483,493 ****
+  	      break;
+  	    case DIV:
+- 	      if (value == 0)
+- 		evalerror (_("division by 0"));
+  	      lvalue /= value;
+  	      break;
+  	    case MOD:
+- 	      if (value == 0)
+- 		evalerror (_("division by 0"));
+  	      lvalue %= value;
+  	      break;
+--- 495,501 ----
+***************
+*** 805,809 ****
+  
+        if (((op == DIV) || (op == MOD)) && (val2 == 0))
+! 	evalerror (_("division by 0"));
+  
+        if (op == MUL)
+--- 813,822 ----
+  
+        if (((op == DIV) || (op == MOD)) && (val2 == 0))
+! 	{
+! 	  if (noeval == 0)
+! 	    evalerror (_("division by 0"));
+! 	  else
+! 	    val2 = 1;
+! 	}
+  
+        if (op == MUL)
+*** ../bash-4.2-patched/patchlevel.h	Sat Jun 12 20:14:48 2010
+--- ./patchlevel.h	Thu Feb 24 21:41:34 2011
+***************
+*** 26,30 ****
+     looks for to find the patch level (for the sccs version string). */
+  
+! #define PATCHLEVEL 14
+  
+  #endif /* _PATCHLEVEL_H_ */
+--- 26,30 ----
+     looks for to find the patch level (for the sccs version string). */
+  
+! #define PATCHLEVEL 15
+  
+  #endif /* _PATCHLEVEL_H_ */
diff --git a/package/bash/bash-4.2-016.patch b/package/bash/bash-4.2-016.patch
new file mode 100644
index 0000000..04f9432
--- /dev/null
+++ b/package/bash/bash-4.2-016.patch
@@ -0,0 +1,46 @@
+			     BASH PATCH REPORT
+			     =================
+
+Bash-Release:	4.2
+Patch-ID:	bash42-016
+
+Bug-Reported-by:	Martin von Gagern <Martin.vGagern@gmx.net>
+Bug-Reference-ID:	<4E43AD9E.8060501@gmx.net>
+Bug-Reference-URL:	http://lists.gnu.org/archive/html/bug-bash/2011-08/msg00141.html
+
+Bug-Description:
+
+Bash should not check for mail while executing the `eval' builtin.
+
+Patch (apply with `patch -p0'):
+
+*** ../bash-4.2-patched/parse.y	Fri Feb 25 12:07:41 2011
+--- ./parse.y	Thu Aug 11 19:02:26 2011
+***************
+*** 2500,2504 ****
+  	 is the mail alarm reset; nothing takes place in check_mail ()
+  	 except the checking of mail.  Please don't change this. */
+!       if (prompt_is_ps1 && time_to_check_mail ())
+  	{
+  	  check_mail ();
+--- 2498,2502 ----
+  	 is the mail alarm reset; nothing takes place in check_mail ()
+  	 except the checking of mail.  Please don't change this. */
+!       if (prompt_is_ps1 && parse_and_execute_level == 0 && time_to_check_mail ())
+  	{
+  	  check_mail ();
+*** ../bash-4.2-patched/patchlevel.h	Sat Jun 12 20:14:48 2010
+--- ./patchlevel.h	Thu Feb 24 21:41:34 2011
+***************
+*** 26,30 ****
+     looks for to find the patch level (for the sccs version string). */
+  
+! #define PATCHLEVEL 15
+  
+  #endif /* _PATCHLEVEL_H_ */
+--- 26,30 ----
+     looks for to find the patch level (for the sccs version string). */
+  
+! #define PATCHLEVEL 16
+  
+  #endif /* _PATCHLEVEL_H_ */
diff --git a/package/bash/bash-4.2-017.patch b/package/bash/bash-4.2-017.patch
new file mode 100644
index 0000000..fdecffa
--- /dev/null
+++ b/package/bash/bash-4.2-017.patch
@@ -0,0 +1,47 @@
+			     BASH PATCH REPORT
+			     =================
+
+Bash-Release:	4.2
+Patch-ID:	bash42-017
+
+Bug-Reported-by:	Curtis Doty <Curtis@GreenKey.net>
+Bug-Reference-ID:	<20110621035324.A4F70849F59@mx1.iParadigms.net>
+Bug-Reference-URL:	http://lists.gnu.org/archive/html/bug-bash/2011-06/msg00053.html
+
+Bug-Description:
+
+Using `read -a foo' where foo was an already-declared associative array
+caused the shell to die with a segmentation fault.
+
+Patch (apply with `patch -p0'):
+
+*** ../bash-4.2-patched/builtins/read.def	2011-01-04 11:43:36.000000000 -0500
+--- ./builtins/read.def	2011-06-21 10:31:02.000000000 -0400
+***************
+*** 643,646 ****
+--- 642,651 ----
+  	  return EXECUTION_FAILURE;	/* readonly or noassign */
+  	}
++       if (assoc_p (var))
++ 	{
++           builtin_error (_("%s: cannot convert associative to indexed array"), arrayname);
++ 	  xfree (input_string);
++ 	  return EXECUTION_FAILURE;	/* existing associative array */
++ 	}
+        array_flush (array_cell (var));
+  
+*** ../bash-4.2-patched/patchlevel.h	Sat Jun 12 20:14:48 2010
+--- ./patchlevel.h	Thu Feb 24 21:41:34 2011
+***************
+*** 26,30 ****
+     looks for to find the patch level (for the sccs version string). */
+  
+! #define PATCHLEVEL 16
+  
+  #endif /* _PATCHLEVEL_H_ */
+--- 26,30 ----
+     looks for to find the patch level (for the sccs version string). */
+  
+! #define PATCHLEVEL 17
+  
+  #endif /* _PATCHLEVEL_H_ */
diff --git a/package/bash/bash-4.2-018.patch b/package/bash/bash-4.2-018.patch
new file mode 100644
index 0000000..c96b901
--- /dev/null
+++ b/package/bash/bash-4.2-018.patch
@@ -0,0 +1,74 @@
+			     BASH PATCH REPORT
+			     =================
+
+Bash-Release:	4.2
+Patch-ID:	bash42-018
+
+Bug-Reported-by:	Thomas Cort <tcort@minix3.org>
+Bug-Reference-ID:	<BANLkTik-ebGGw3k_1YtB=RyfV1bsqdxC_g@mail.gmail.com>
+Bug-Reference-URL:	http://lists.gnu.org/archive/html/bug-bash/2011-06/msg00110.html
+
+Bug-Description:
+
+Bash fails to compile unless JOB_CONTROL is defined.
+
+Patch (apply with `patch -p0'):
+
+*** ../bash-4.2-patched/execute_cmd.c	2011-02-09 17:32:25.000000000 -0500
+--- ./execute_cmd.c	2011-11-06 15:12:48.000000000 -0500
+***************
+*** 2197,2200 ****
+--- 2315,2319 ----
+      cmd->flags |= CMD_IGNORE_RETURN;
+  
++ #if defined (JOB_CONTROL)
+    lastpipe_flag = 0;
+    begin_unwind_frame ("lastpipe-exec");
+***************
+*** 2216,2228 ****
+  	  add_unwind_protect (lastpipe_cleanup, lastpipe_jid);
+  	}
+!       cmd->flags |= CMD_LASTPIPE;
+      }	  
+    if (prev >= 0)
+      add_unwind_protect (close, prev);
+  
+    exec_result = execute_command_internal (cmd, asynchronous, prev, pipe_out, fds_to_close);
+  
+    if (lstdin > 0)
+      restore_stdin (lstdin);
+  
+    if (prev >= 0)
+--- 2335,2351 ----
+  	  add_unwind_protect (lastpipe_cleanup, lastpipe_jid);
+  	}
+!       if (cmd)
+! 	cmd->flags |= CMD_LASTPIPE;
+      }	  
+    if (prev >= 0)
+      add_unwind_protect (close, prev);
++ #endif
+  
+    exec_result = execute_command_internal (cmd, asynchronous, prev, pipe_out, fds_to_close);
+  
++ #if defined (JOB_CONTROL)
+    if (lstdin > 0)
+      restore_stdin (lstdin);
++ #endif
+  
+    if (prev >= 0)
+*** ../bash-4.2-patched/patchlevel.h	Sat Jun 12 20:14:48 2010
+--- ./patchlevel.h	Thu Feb 24 21:41:34 2011
+***************
+*** 26,30 ****
+     looks for to find the patch level (for the sccs version string). */
+  
+! #define PATCHLEVEL 17
+  
+  #endif /* _PATCHLEVEL_H_ */
+--- 26,30 ----
+     looks for to find the patch level (for the sccs version string). */
+  
+! #define PATCHLEVEL 18
+  
+  #endif /* _PATCHLEVEL_H_ */
diff --git a/package/bash/bash-4.2-019.patch b/package/bash/bash-4.2-019.patch
new file mode 100644
index 0000000..01603a9
--- /dev/null
+++ b/package/bash/bash-4.2-019.patch
@@ -0,0 +1,47 @@
+			     BASH PATCH REPORT
+			     =================
+
+Bash-Release:	4.2
+Patch-ID:	bash42-019
+
+Bug-Reported-by:	Diego Augusto Molina <diegoaugustomolina@gmail.com>
+Bug-Reference-ID:	<CAGOxLdHcSQu3ck9Qy3pRjj_NBU5tAPSAvNm-95-nLQ9Szwb6aA@mail.gmail.com>
+Bug-Reference-URL:	lists.gnu.org/archive/html/bug-bash/2011-09/msg00047.html
+
+Bug-Description:
+
+Using `declare' with attributes and an invalid array variable name or
+assignment reference resulted in a segmentation fault instead of a
+declaration error.
+
+Patch (apply with `patch -p0'):
+
+*** ../bash-4.2-patched/builtins/declare.def	2010-05-30 18:25:21.000000000 -0400
+--- ./builtins/declare.def	2011-09-15 15:20:20.000000000 -0400
+***************
+*** 514,517 ****
+--- 514,522 ----
+  	      var = assign_array_element (name, value, 0);	/* XXX - not aflags */
+  	      *subscript_start = '\0';
++ 	      if (var == 0)	/* some kind of assignment error */
++ 		{
++ 		  assign_error++;
++ 		  NEXT_VARIABLE ();
++ 		}
+  	    }
+  	  else if (simple_array_assign)
+*** ../bash-4.2-patched/patchlevel.h	Sat Jun 12 20:14:48 2010
+--- ./patchlevel.h	Thu Feb 24 21:41:34 2011
+***************
+*** 26,30 ****
+     looks for to find the patch level (for the sccs version string). */
+  
+! #define PATCHLEVEL 18
+  
+  #endif /* _PATCHLEVEL_H_ */
+--- 26,30 ----
+     looks for to find the patch level (for the sccs version string). */
+  
+! #define PATCHLEVEL 19
+  
+  #endif /* _PATCHLEVEL_H_ */
diff --git a/package/bash/bash-4.2-020.patch b/package/bash/bash-4.2-020.patch
new file mode 100644
index 0000000..77e31df
--- /dev/null
+++ b/package/bash/bash-4.2-020.patch
@@ -0,0 +1,60 @@
+			     BASH PATCH REPORT
+			     =================
+
+Bash-Release:	4.2
+Patch-ID:	bash42-020
+
+Bug-Reported-by:	Vincent Sheffer <vince.sheffer@apisphere.com>
+Bug-Reference-ID:	<F13C1C4F-C44C-4071-BFED-4BB6D13CF92F@apisphere.com>
+Bug-Reference-URL:	https://lists.gnu.org/archive/html/bug-readline/2011-08/msg00000.html
+
+Bug-Description:
+
+The shared object helper script needs to be updated for Mac OS X 10.7
+(Lion, darwin11).
+
+Patch (apply with `patch -p0'):
+
+*** ../bash-4.2-patched/support/shobj-conf	2009-10-28 09:20:21.000000000 -0400
+--- ./support/shobj-conf	2011-08-27 13:25:23.000000000 -0400
+***************
+*** 158,162 ****
+  
+  # Darwin/MacOS X
+! darwin[89]*|darwin10*)
+  	SHOBJ_STATUS=supported
+  	SHLIB_STATUS=supported
+--- 172,176 ----
+  
+  # Darwin/MacOS X
+! darwin[89]*|darwin1[012]*)
+  	SHOBJ_STATUS=supported
+  	SHLIB_STATUS=supported
+***************
+*** 187,191 ****
+  
+  	case "${host_os}" in
+! 	darwin[789]*|darwin10*)	SHOBJ_LDFLAGS=''
+  			SHLIB_XLDFLAGS='-dynamiclib -arch_only `/usr/bin/arch` -install_name $(libdir)/$@ -current_version $(SHLIB_MAJOR)$(SHLIB_MINOR) -compatibility_version $(SHLIB_MAJOR) -v'
+  			;;
+--- 201,205 ----
+  
+  	case "${host_os}" in
+! 	darwin[789]*|darwin1[012]*)	SHOBJ_LDFLAGS=''
+  			SHLIB_XLDFLAGS='-dynamiclib -arch_only `/usr/bin/arch` -install_name $(libdir)/$@ -current_version $(SHLIB_MAJOR)$(SHLIB_MINOR) -compatibility_version $(SHLIB_MAJOR) -v'
+  			;;
+*** ../bash-4.2-patched/patchlevel.h	Sat Jun 12 20:14:48 2010
+--- ./patchlevel.h	Thu Feb 24 21:41:34 2011
+***************
+*** 26,30 ****
+     looks for to find the patch level (for the sccs version string). */
+  
+! #define PATCHLEVEL 19
+  
+  #endif /* _PATCHLEVEL_H_ */
+--- 26,30 ----
+     looks for to find the patch level (for the sccs version string). */
+  
+! #define PATCHLEVEL 20
+  
+  #endif /* _PATCHLEVEL_H_ */
-- 
1.7.3.4
