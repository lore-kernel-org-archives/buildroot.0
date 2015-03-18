From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 18 Mar 2015 14:39:28 +0100
Subject: [Buildroot] [git commit] bash: bump to patchlevel 33
Message-ID: <20150318133932.BB12881865@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=47df048f8d1191a0c79188afa44e20d17a239def
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Misc fixes.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/bash/0031-patchlevel-31.patch |  116 +++++++++++++++++
 package/bash/0032-patchlevel-32.patch |   55 ++++++++
 package/bash/0033-patchlevel-33.patch |  229 +++++++++++++++++++++++++++++++++
 3 files changed, 400 insertions(+), 0 deletions(-)

diff --git a/package/bash/0031-patchlevel-31.patch b/package/bash/0031-patchlevel-31.patch
new file mode 100644
index 0000000..d285a1f
--- /dev/null
+++ b/package/bash/0031-patchlevel-31.patch
@@ -0,0 +1,116 @@
+From http://ftp.gnu.org/pub/gnu/bash/bash-4.3-patches/bash43-031
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+
+			     BASH PATCH REPORT
+			     =================
+
+Bash-Release:	4.3
+Patch-ID:	bash43-031
+
+Bug-Reported-by:	lolilolicon <lolilolicon@gmail.com>
+Bug-Reference-ID:	<CAMtVo_Nz=32Oq=zWTb6=+8gUNXOo2rRvud1W4oPnA-cgVk_ZqQ@mail.gmail.com>
+Bug-Reference-URL:	http://lists.gnu.org/archive/html/bug-bash/2014-08/msg00139.html
+
+Bug-Description:
+
+The new nameref assignment functionality introduced in bash-4.3 did not perform
+enough validation on the variable value and would create variables with
+invalid names.
+
+Patch (apply with `patch -p0'):
+
+*** a/bash-4.3-patched/subst.h	2014-01-11 21:02:27.000000000 -0500
+--- b/subst.h	2014-09-01 12:16:56.000000000 -0400
+***************
+*** 48,51 ****
+--- 48,52 ----
+  #define ASS_MKGLOBAL	0x0008	/* force global assignment */
+  #define ASS_NAMEREF	0x0010	/* assigning to nameref variable */
++ #define ASS_FROMREF	0x0020	/* assigning from value of nameref variable */
+  
+  /* Flags for the string extraction functions. */
+*** a/bash-4.3-patched/variables.c	2014-05-15 08:26:50.000000000 -0400
+--- b/variables.c	2014-09-01 14:37:44.000000000 -0400
+***************
+*** 2504,2511 ****
+       int hflags, aflags;
+  {
+!   char *newval;
+    SHELL_VAR *entry;
+  
+    entry = (hflags & HASH_NOSRCH) ? (SHELL_VAR *)NULL : hash_lookup (name, table);
+    /* Follow the nameref chain here if this is the global variables table */
+    if (entry && nameref_p (entry) && (invisible_p (entry) == 0) && table == global_variables->table)
+--- 2566,2590 ----
+       int hflags, aflags;
+  {
+!   char *newname, *newval;
+    SHELL_VAR *entry;
++ #if defined (ARRAY_VARS)
++   arrayind_t ind;
++   char *subp;
++   int sublen;
++ #endif
+  
++   newname = 0;
++ #if defined (ARRAY_VARS)
++   if ((aflags & ASS_FROMREF) && (hflags & HASH_NOSRCH) == 0 && valid_array_reference (name))
++     {
++       newname = array_variable_name (name, &subp, &sublen);
++       if (newname == 0)
++ 	return (SHELL_VAR *)NULL;	/* XXX */
++       entry = hash_lookup (newname, table);
++     }
++   else
++ #endif
+    entry = (hflags & HASH_NOSRCH) ? (SHELL_VAR *)NULL : hash_lookup (name, table);
++ 
+    /* Follow the nameref chain here if this is the global variables table */
+    if (entry && nameref_p (entry) && (invisible_p (entry) == 0) && table == global_variables->table)
+***************
+*** 2538,2541 ****
+--- 2617,2630 ----
+        }
+      }
++ #if defined (ARRAY_VARS)
++   else if (entry == 0 && newname)
++     {
++       entry = make_new_array_variable (newname);	/* indexed array by default */
++       if (entry == 0)
++ 	return entry;
++       ind = array_expand_index (name, subp, sublen);
++       bind_array_element (entry, ind, value, aflags);
++     }
++ #endif
+    else if (entry == 0)
+      {
+***************
+*** 2658,2662 ****
+  		      if (nameref_cell (nv) == 0)
+  			return (bind_variable_internal (nv->name, value, nvc->table, 0, flags));
+! 		      return (bind_variable_internal (nameref_cell (nv), value, nvc->table, 0, flags));
+  		    }
+  		  else
+--- 2747,2752 ----
+  		      if (nameref_cell (nv) == 0)
+  			return (bind_variable_internal (nv->name, value, nvc->table, 0, flags));
+! 		      /* XXX - bug here with ref=array[index] */
+! 		      return (bind_variable_internal (nameref_cell (nv), value, nvc->table, 0, flags|ASS_FROMREF));
+  		    }
+  		  else
+*** a/bash-4.3/patchlevel.h	2012-12-29 10:47:57.000000000 -0500
+--- b/patchlevel.h	2014-03-20 20:01:28.000000000 -0400
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
diff --git a/package/bash/0032-patchlevel-32.patch b/package/bash/0032-patchlevel-32.patch
new file mode 100644
index 0000000..6cdc0f1
--- /dev/null
+++ b/package/bash/0032-patchlevel-32.patch
@@ -0,0 +1,55 @@
+From http://ftp.gnu.org/pub/gnu/bash/bash-4.3-patches/bash43-032
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+
+			     BASH PATCH REPORT
+			     =================
+
+Bash-Release:	4.3
+Patch-ID:	bash43-032
+
+Bug-Reported-by:	crispusfairbairn at gmail.com
+Bug-Reference-ID:	<b5e499f7-3b98-408d-9f94-c0387580e73a@googlegroups.com>
+Bug-Reference-URL:	http://lists.gnu.org/archive/html/bug-bash/2014-09/msg00013.html
+
+Bug-Description:
+
+When bash is running in Posix mode, it allows signals -- including SIGCHLD --
+to interrupt the `wait' builtin, as Posix requires.  However, the interrupt
+causes bash to not run a SIGCHLD trap for all exited children.  This patch
+fixes the issue and restores the documented behavior in Posix mode.
+
+Patch (apply with `patch -p0'):
+
+*** a/bash-4.3-patched/jobs.c	2014-05-14 09:20:15.000000000 -0400
+--- b/jobs.c	2014-09-09 11:50:38.000000000 -0400
+***************
+*** 3340,3344 ****
+  	{
+  	  interrupt_immediately = 0;
+! 	  trap_handler (SIGCHLD);	/* set pending_traps[SIGCHLD] */
+  	  wait_signal_received = SIGCHLD;
+  	  /* If we're in a signal handler, let CHECK_WAIT_INTR pick it up;
+--- 3346,3352 ----
+  	{
+  	  interrupt_immediately = 0;
+! 	  /* This was trap_handler (SIGCHLD) but that can lose traps if
+! 	     children_exited > 1 */
+! 	  queue_sigchld_trap (children_exited);
+  	  wait_signal_received = SIGCHLD;
+  	  /* If we're in a signal handler, let CHECK_WAIT_INTR pick it up;
+*** a/bash-4.3/patchlevel.h	2012-12-29 10:47:57.000000000 -0500
+--- b/patchlevel.h	2014-03-20 20:01:28.000000000 -0400
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
diff --git a/package/bash/0033-patchlevel-33.patch b/package/bash/0033-patchlevel-33.patch
new file mode 100644
index 0000000..45fb686
--- /dev/null
+++ b/package/bash/0033-patchlevel-33.patch
@@ -0,0 +1,229 @@
+From http://ftp.gnu.org/pub/gnu/bash/bash-4.3-patches/bash43-033
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+
+			     BASH PATCH REPORT
+			     =================
+
+Bash-Release:	4.3
+Patch-ID:	bash43-033
+
+Bug-Reported-by:	mickael9 at gmail.com, Jan Rome <jan.rome@gmail.com>
+Bug-Reference-ID:	<20140907224046.382ED3610CC@mickael-laptop.localdomain>,
+			<540D661D.50908@gmail.com>
+Bug-Reference-URL:	http://lists.gnu.org/archive/html/bug-bash/2014-09/msg00029.html
+			http://lists.gnu.org/archive/html/bug-bash/2014-09/msg00030.html
+
+Bug-Description:
+
+Bash does not clean up the terminal state in all cases where bash or
+readline  modifies it and bash is subsequently terminated by a fatal signal.
+This happens when the `read' builtin modifies the terminal settings, both
+when readline is active and when it is not.  It occurs most often when a script
+installs a trap that exits on a signal without re-sending the signal to itself.
+
+Patch (apply with `patch -p0'):
+
+*** a/bash-4.3-patched/shell.c	2014-01-14 08:04:32.000000000 -0500
+--- b/shell.c	2014-12-22 10:27:50.000000000 -0500
+***************
+*** 74,77 ****
+--- 74,78 ----
+  
+  #if defined (READLINE)
++ #  include <readline/readline.h>
+  #  include "bashline.h"
+  #endif
+***************
+*** 910,913 ****
+--- 912,923 ----
+    fflush (stderr);
+  
++   /* Clean up the terminal if we are in a state where it's been modified. */
++ #if defined (READLINE)
++   if (RL_ISSTATE (RL_STATE_TERMPREPPED) && rl_deprep_term_function)
++     (*rl_deprep_term_function) ();
++ #endif
++   if (read_tty_modified ())
++     read_tty_cleanup ();
++ 
+    /* Do trap[0] if defined.  Allow it to override the exit status
+       passed to us. */
+*** a/bash-4.3-patched/builtins/read.def	2014-10-01 12:57:38.000000000 -0400
+--- b/builtins/read.def	2014-12-22 10:48:54.000000000 -0500
+***************
+*** 141,148 ****
+  int sigalrm_seen;
+  
+! static int reading;
+  static SigHandler *old_alrm;
+  static unsigned char delim;
+  
+  /* In all cases, SIGALRM just sets a flag that we check periodically.  This
+     avoids problems with the semi-tricky stuff we do with the xfree of
+--- 141,150 ----
+  int sigalrm_seen;
+  
+! static int reading, tty_modified;
+  static SigHandler *old_alrm;
+  static unsigned char delim;
+  
++ static struct ttsave termsave;
++ 
+  /* In all cases, SIGALRM just sets a flag that we check periodically.  This
+     avoids problems with the semi-tricky stuff we do with the xfree of
+***************
+*** 189,193 ****
+    SHELL_VAR *var;
+    TTYSTRUCT ttattrs, ttset;
+-   struct ttsave termsave;
+  #if defined (ARRAY_VARS)
+    WORD_LIST *alist;
+--- 191,194 ----
+***************
+*** 222,226 ****
+    USE_VAR(lastsig);
+  
+!   sigalrm_seen = reading = 0;
+  
+    i = 0;		/* Index into the string that we are reading. */
+--- 223,227 ----
+    USE_VAR(lastsig);
+  
+!   sigalrm_seen = reading = tty_modified = 0;
+  
+    i = 0;		/* Index into the string that we are reading. */
+***************
+*** 439,442 ****
+--- 440,445 ----
+  	  goto assign_vars;
+  	}
++       if (interactive_shell == 0)
++ 	initialize_terminating_signals ();
+        old_alrm = set_signal_handler (SIGALRM, sigalrm);
+        add_unwind_protect (reset_alarm, (char *)NULL);
+***************
+*** 483,487 ****
+--- 486,493 ----
+  	  if (i < 0)
+  	    sh_ttyerror (1);
++ 	  tty_modified = 1;
+  	  add_unwind_protect ((Function *)ttyrestore, (char *)&termsave);
++ 	  if (interactive_shell == 0)
++ 	    initialize_terminating_signals ();
+  	}
+      }
+***************
+*** 498,502 ****
+--- 504,511 ----
+  	sh_ttyerror (1);
+  
++       tty_modified = 1;
+        add_unwind_protect ((Function *)ttyrestore, (char *)&termsave);
++       if (interactive_shell == 0)
++ 	initialize_terminating_signals ();
+      }
+  
+***************
+*** 589,592 ****
+--- 598,603 ----
+  	  else
+  	    lastsig = 0;
++ 	  if (terminating_signal && tty_modified)
++ 	    ttyrestore (&termsave);	/* fix terminal before exiting */
+  	  CHECK_TERMSIG;
+  	  eof = 1;
+***************
+*** 979,982 ****
+--- 990,1007 ----
+  {
+    ttsetattr (ttp->fd, ttp->attrs);
++   tty_modified = 0;
++ }
++ 
++ void
++ read_tty_cleanup ()
++ {
++   if (tty_modified)
++     ttyrestore (&termsave);
++ }
++ 
++ int
++ read_tty_modified ()
++ {
++   return (tty_modified);
+  }
+  
+*** ./bash-4.3-patched/builtins/common.h	2014-10-01 12:57:47.000000000 -0400
+--- b/builtins/common.h	2014-12-22 10:10:14.000000000 -0500
+***************
+*** 123,126 ****
+--- 141,148 ----
+  extern void getopts_reset __P((int));
+  
++ /* Functions from read.def */
++ extern void read_tty_cleanup __P((void));
++ extern int read_tty_modified __P((void));
++ 
+  /* Functions from set.def */
+  extern int minus_o_option_value __P((char *));
+*** a/bash-4.3-patched/bashline.c	2014-05-14 09:22:39.000000000 -0400
+--- b/bashline.c	2014-09-08 11:28:56.000000000 -0400
+***************
+*** 203,206 ****
+--- 203,207 ----
+  extern int array_needs_making;
+  extern int posixly_correct, no_symbolic_links;
++ extern int sigalrm_seen;
+  extern char *current_prompt_string, *ps1_prompt;
+  extern STRING_INT_ALIST word_token_alist[];
+***************
+*** 4209,4214 ****
+    /* If we're going to longjmp to top_level, make sure we clean up readline.
+       check_signals will call QUIT, which will eventually longjmp to top_level,
+!      calling run_interrupt_trap along the way. */
+!   if (interrupt_state)
+      rl_cleanup_after_signal ();
+    bashline_reset_event_hook ();
+--- 4262,4268 ----
+    /* If we're going to longjmp to top_level, make sure we clean up readline.
+       check_signals will call QUIT, which will eventually longjmp to top_level,
+!      calling run_interrupt_trap along the way.  The check for sigalrm_seen is
+!      to clean up the read builtin's state. */
+!   if (terminating_signal || interrupt_state || sigalrm_seen)
+      rl_cleanup_after_signal ();
+    bashline_reset_event_hook ();
+*** a/bash-4.3-patched/sig.c	2014-01-10 15:06:06.000000000 -0500
+--- b/sig.c	2014-09-08 11:26:33.000000000 -0400
+***************
+*** 533,538 ****
+    /* Set the event hook so readline will call it after the signal handlers
+       finish executing, so if this interrupted character input we can get
+!      quick response. */
+!   if (interactive_shell && interactive && no_line_editing == 0)
+      bashline_set_event_hook ();
+  #endif
+--- 533,540 ----
+    /* Set the event hook so readline will call it after the signal handlers
+       finish executing, so if this interrupted character input we can get
+!      quick response.  If readline is active or has modified the terminal we
+!      need to set this no matter what the signal is, though the check for
+!      RL_STATE_TERMPREPPED is possibly redundant. */
+!   if (RL_ISSTATE (RL_STATE_SIGHANDLER) || RL_ISSTATE (RL_STATE_TERMPREPPED))
+      bashline_set_event_hook ();
+  #endif
+*** a/bash-4.3/patchlevel.h	2012-12-29 10:47:57.000000000 -0500
+--- b/patchlevel.h	2014-03-20 20:01:28.000000000 -0400
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
