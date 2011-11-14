From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 14 Nov 2011 09:24:53 +0100
Subject: [Buildroot] [git commit branch/next] bash: bump to version 4.2 pl10
Message-ID: <20111114083547.6C64B8F55A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6ba2d9e28ce3df01efa8dd68bb963311889a4805
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/bash/bash-4.1-001.patch                    |   48 ---
 package/bash/bash-4.1-002.patch                    |   65 ----
 package/bash/bash-4.1-003.patch                    |   48 ---
 package/bash/bash-4.1-004.patch                    |   47 ---
 package/bash/bash-4.1-005.patch                    |   56 ----
 package/bash/bash-4.1-006.patch                    |   76 -----
 package/bash/bash-4.1-007.patch                    |   47 ---
 package/bash/bash-4.1-008.patch                    |   49 ---
 package/bash/bash-4.1-009.patch                    |   48 ---
 package/bash/bash-4.2-001.patch                    |   78 +++++
 package/bash/bash-4.2-002.patch                    |   60 ++++
 package/bash/bash-4.2-003.patch                    |  318 ++++++++++++++++++++
 package/bash/bash-4.2-004.patch                    |   53 ++++
 package/bash/bash-4.2-005.patch                    |  131 ++++++++
 package/bash/bash-4.2-006.patch                    |   46 +++
 package/bash/bash-4.2-007.patch                    |   46 +++
 package/bash/bash-4.2-008.patch                    |   74 +++++
 package/bash/bash-4.2-009.patch                    |   82 +++++
 package/bash/bash-4.2-010.patch                    |   61 ++++
 ...cross.patch => bash-4.2-mkbuiltins-cross.patch} |    0
 package/bash/bash.mk                               |    3 +-
 21 files changed, 951 insertions(+), 485 deletions(-)

diff --git a/package/bash/bash-4.1-001.patch b/package/bash/bash-4.1-001.patch
deleted file mode 100644
index be5f982..0000000
--- a/package/bash/bash-4.1-001.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-			     BASH PATCH REPORT
-			     =================
-
-Bash-Release:	4.1
-Patch-ID:	bash41-001
-
-Bug-Reported-by:	Yann Rouillard <yann@pleiades.fr.eu.org>
-Bug-Reference-ID:	<4B44A410.4070107@pleiades.fr.eu.org>
-Bug-Reference-URL:	http://lists.gnu.org/archive/html/bug-bash/2010-01/msg00018.html
-
-Bug-Description:
-
-A prototype for vsnprintf was incorrect, and caused compilation failures
-on systems that did not have a suitable vsnprintf, but had a declaration in
-one of the system header files.
-
-Patch (apply with `patch -p0'):
-
-*** ../bash-4.1-patched/builtins/printf.def	2009-11-20 15:31:23.000000000 -0500
---- ./builtins/printf.def	2010-01-07 08:50:06.000000000 -0500
-***************
-*** 173,177 ****
-  
-  #if !HAVE_VSNPRINTF
-! extern int vsnprintf __P((char *, size_t, const char *, ...)) __attribute__((__format__ (printf, 3, 4)));
-  #endif
-  
---- 173,177 ----
-  
-  #if !HAVE_VSNPRINTF
-! extern int vsnprintf __P((char *, size_t, const char *, va_list)) __attribute__((__format__ (printf, 3, 0)));
-  #endif
-  
-*** ../bash-4.1-patched/patchlevel.h	2009-10-01 16:39:22.000000000 -0400
---- ./patchlevel.h	2010-01-14 09:38:08.000000000 -0500
-***************
-*** 26,30 ****
-     looks for to find the patch level (for the sccs version string). */
-  
-! #define PATCHLEVEL 0
-  
-  #endif /* _PATCHLEVEL_H_ */
---- 26,30 ----
-     looks for to find the patch level (for the sccs version string). */
-  
-! #define PATCHLEVEL 1
-  
-  #endif /* _PATCHLEVEL_H_ */
diff --git a/package/bash/bash-4.1-002.patch b/package/bash/bash-4.1-002.patch
deleted file mode 100644
index 7601ab2..0000000
--- a/package/bash/bash-4.1-002.patch
+++ /dev/null
@@ -1,65 +0,0 @@
-			     BASH PATCH REPORT
-			     =================
-
-Bash-Release:	4.1
-Patch-ID:	bash41-002
-
-Bug-Reported-by:	guillaume.outters at free.fr
-Bug-Reference-ID:	<20100105230441.70D171AA7F52@asterix.local>
-Bug-Reference-URL:	http://lists.gnu.org/archive/html/bug-bash/2010-01/msg00017.html
-
-Bug-Description:
-
-Bash-4.1/Readline-6.1 introduced a hook function that allows applications
-to rewrite or modify filenames read from the file system before comparing
-them with a word to be completed.  The converted filename, if it matches,
-needs to be inserted into the line buffer, replacing the original contents.
-
-This fixes a completion bug on Mac OS X involving filenames containing
-UTF-8 characters.
-
-Patch (apply with `patch -p0'):
-
-*** ../bash-4.1-patched/lib/readline/complete.c	2009-11-29 18:39:30.000000000 -0500
---- ./lib/readline/complete.c	2010-01-06 08:30:23.000000000 -0500
-***************
-*** 2139,2143 ****
-        if (filename_len == 0)
-  	{
-! 	  if (_rl_match_hidden_files == 0 && HIDDEN_FILE (entry->d_name))
-  	    continue;
-  
---- 2139,2143 ----
-        if (filename_len == 0)
-  	{
-! 	  if (_rl_match_hidden_files == 0 && HIDDEN_FILE (convfn))
-  	    continue;
-  
-***************
-*** 2220,2224 ****
-  	    }
-  
-! 	  strcpy (temp + dirlen, entry->d_name);
-  	}
-        else
---- 2220,2224 ----
-  	    }
-  
-! 	  strcpy (temp + dirlen, convfn);
-  	}
-        else
-*** ../bash-4.1-patched/patchlevel.h	2009-10-01 16:39:22.000000000 -0400
---- ./patchlevel.h	2010-01-14 09:38:08.000000000 -0500
-***************
-*** 26,30 ****
-     looks for to find the patch level (for the sccs version string). */
-  
-! #define PATCHLEVEL 1
-  
-  #endif /* _PATCHLEVEL_H_ */
---- 26,30 ----
-     looks for to find the patch level (for the sccs version string). */
-  
-! #define PATCHLEVEL 2
-  
-  #endif /* _PATCHLEVEL_H_ */
diff --git a/package/bash/bash-4.1-003.patch b/package/bash/bash-4.1-003.patch
deleted file mode 100644
index fc12bb5..0000000
--- a/package/bash/bash-4.1-003.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-			     BASH PATCH REPORT
-			     =================
-
-Bash-Release:	4.1
-Patch-ID:	bash41-003
-
-Bug-Reported-by:	coyote at wariat.org.pl
-Bug-Reference-ID:	<4b64a1f8.06e2660a.60af.4bfb@mx.google.com>
-Bug-Reference-URL:	http://lists.gnu.org/archive/html/bug-bash/2010-01/msg00135.html
-
-Bug-Description:
-
-If command completion is attempted on a word with a quoted globbing
-character (e.g., `*' or `?'), bash can reference a NULL pointer and
-dump core.
-
-Patch (apply with `patch -p0'):
-
-*** ../bash-4.1-patched/bashline.c	2009-10-24 14:10:19.000000000 -0400
---- ./bashline.c	2010-01-30 21:53:49.000000000 -0500
-***************
-*** 1681,1685 ****
-       characters in the common prefix are bad) will ever be returned on
-       regular completion. */
-!   if (glob_pattern_p (hint))
-      {
-        if (state == 0)
---- 1681,1685 ----
-       characters in the common prefix are bad) will ever be returned on
-       regular completion. */
-!   if (globpat)
-      {
-        if (state == 0)
-*** ../bash-4.1-patched/patchlevel.h	2009-10-01 16:39:22.000000000 -0400
---- ./patchlevel.h	2010-01-14 09:38:08.000000000 -0500
-***************
-*** 26,30 ****
-     looks for to find the patch level (for the sccs version string). */
-  
-! #define PATCHLEVEL 2
-  
-  #endif /* _PATCHLEVEL_H_ */
---- 26,30 ----
-     looks for to find the patch level (for the sccs version string). */
-  
-! #define PATCHLEVEL 3
-  
-  #endif /* _PATCHLEVEL_H_ */
diff --git a/package/bash/bash-4.1-004.patch b/package/bash/bash-4.1-004.patch
deleted file mode 100644
index a6b8335..0000000
--- a/package/bash/bash-4.1-004.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-			     BASH PATCH REPORT
-			     =================
-
-Bash-Release:	4.1
-Patch-ID:	bash41-004
-
-Bug-Reported-by:	Crestez Dan Leonard <cdleonard@gmail.com>
-Bug-Reference-ID:	<1265592839.30682.21.camel@deskbox>
-Bug-Reference-URL:	http://lists.gnu.org/archive/html/bug-bash/2010-02/msg00034.html
-
-Bug-Description:
-
-When running in Posix mode and executing a shell function without local
-variables, bash will not propagate a variable in a special builtin's temporary
-environment to have global scope.
-
-Patch (apply with `patch -p0'):
-
-*** ../bash-4.1-patched/variables.c	2009-11-03 14:13:58.000000000 -0500
---- ./variables.c	2010-02-08 17:36:18.000000000 -0500
-***************
-*** 3809,3812 ****
---- 3809,3817 ----
-    if (tempvar_p (var) && (posixly_correct || (var->attributes & att_propagate)))
-      {
-+       /* Make sure we have a hash table to store the variable in while it is
-+ 	 being propagated down to the global variables table.  Create one if
-+ 	 we have to */
-+       if ((vc_isfuncenv (shell_variables) || vc_istempenv (shell_variables)) && shell_variables->table == 0)
-+ 	shell_variables->table = hash_create (0);
-        /* XXX - should we set v->context here? */
-        v = bind_variable_internal (var->name, value_cell (var), shell_variables->table, 0, 0);
-*** ../bash-4.1-patched/patchlevel.h	2009-10-01 16:39:22.000000000 -0400
---- ./patchlevel.h	2010-01-14 09:38:08.000000000 -0500
-***************
-*** 26,30 ****
-     looks for to find the patch level (for the sccs version string). */
-  
-! #define PATCHLEVEL 3
-  
-  #endif /* _PATCHLEVEL_H_ */
---- 26,30 ----
-     looks for to find the patch level (for the sccs version string). */
-  
-! #define PATCHLEVEL 4
-  
-  #endif /* _PATCHLEVEL_H_ */
diff --git a/package/bash/bash-4.1-005.patch b/package/bash/bash-4.1-005.patch
deleted file mode 100644
index 7974547..0000000
--- a/package/bash/bash-4.1-005.patch
+++ /dev/null
@@ -1,56 +0,0 @@
-			     BASH PATCH REPORT
-			     =================
-
-Bash-Release:	4.1
-Patch-ID:	bash41-005
-
-Bug-Reported-by:	werner at suse.de
-Bug-Reference-ID:	<201002251238.o1PCcYcg016893@boole.suse.de>
-Bug-Reference-URL:	http://lists.gnu.org/archive/html/bug-bash/2010-02/msg00132.html
-
-Bug-Description:
-
-When the `read' builtin times out after the timeout specified with -t is
-exceeded, it does not reset the flags that tell signal handlers to process
-signals immediately instead of deferring their handling.  This can result
-in unsafe functions being called from signal handlers, which can cause bash
-to hang or dump core.
-
-Patch (apply with `patch -p0'):
-
-*** ../bash-4.1-patched/builtins/read.def	2009-10-08 11:35:46.000000000 -0400
---- ./builtins/read.def	2010-03-17 17:35:39.000000000 -0400
-***************
-*** 616,621 ****
-      zsyncfd (fd);
-  
--   interrupt_immediately--;
--   terminate_immediately--;
-    discard_unwind_frame ("read_builtin");
-  
---- 616,619 ----
-***************
-*** 624,627 ****
---- 622,628 ----
-  assign_vars:
-  
-+   interrupt_immediately--;
-+   terminate_immediately--;
-+ 
-  #if defined (ARRAY_VARS)
-    /* If -a was given, take the string read, break it into a list of words,
-*** ../bash-4.1-patched/patchlevel.h	2009-10-01 16:39:22.000000000 -0400
---- ./patchlevel.h	2010-01-14 09:38:08.000000000 -0500
-***************
-*** 26,30 ****
-     looks for to find the patch level (for the sccs version string). */
-  
-! #define PATCHLEVEL 4
-  
-  #endif /* _PATCHLEVEL_H_ */
---- 26,30 ----
-     looks for to find the patch level (for the sccs version string). */
-  
-! #define PATCHLEVEL 5
-  
-  #endif /* _PATCHLEVEL_H_ */
diff --git a/package/bash/bash-4.1-006.patch b/package/bash/bash-4.1-006.patch
deleted file mode 100644
index c33d0bd..0000000
--- a/package/bash/bash-4.1-006.patch
+++ /dev/null
@@ -1,76 +0,0 @@
-			     BASH PATCH REPORT
-			     =================
-
-Bash-Release:	4.1
-Patch-ID:	bash41-006
-
-Bug-Reported-by:	Mike Frysinger <vapier@gentoo.org>
-Bug-Reference-ID:	<201003210155.56618.vapier@gentoo.org>
-Bug-Reference-URL:	http://lists.gnu.org/archive/html/bug-bash/2010-03/msg00063.html
-
-Bug-Description:
-
-Bash did not correctly print/reproduce here documents attached to commands
-inside compound commands such as for and while.  This affected the
-execution of such commands inside a shell function when the function
-definition is saved and later restored using `.' or `eval'.
-
-Patch (apply with `patch -p0'):
-
-*** ../bash-4.1-patched/print_cmd.c	2009-09-16 15:32:26.000000000 -0400
---- ./print_cmd.c	2010-03-22 21:15:30.000000000 -0400
-***************
-*** 114,117 ****
---- 114,123 ----
-  #define CHECK_XTRACE_FP	xtrace_fp = (xtrace_fp ? xtrace_fp : stderr)
-  
-+ #define PRINT_DEFERRED_HEREDOCS(x) \
-+   do { \
-+     if (deferred_heredocs) \
-+       print_deferred_heredocs (x); \
-+   } while (0)
-+ 
-  /* Non-zero means the stuff being printed is inside of a function def. */
-  static int inside_function_def;
-***************
-*** 561,571 ****
-  {
-    print_for_command_head (for_command);
-- 
-    cprintf (";");
-    newline ("do\n");
-    indentation += indentation_amount;
-    make_command_string_internal (for_command->action);
-    semicolon ();
-    indentation -= indentation_amount;
-    newline ("done");
-  }
---- 566,578 ----
-  {
-    print_for_command_head (for_command);
-    cprintf (";");
-    newline ("do\n");
-+ 
-    indentation += indentation_amount;
-    make_command_string_internal (for_command->action);
-+   PRINT_DEFERRED_HEREDOCS ("");
-    semicolon ();
-    indentation -= indentation_amount;
-+ 
-    newline ("done");
-  }
-*** ../bash-4.1-patched/patchlevel.h	2009-10-01 16:39:22.000000000 -0400
---- ./patchlevel.h	2010-01-14 09:38:08.000000000 -0500
-***************
-*** 26,30 ****
-     looks for to find the patch level (for the sccs version string). */
-  
-! #define PATCHLEVEL 5
-  
-  #endif /* _PATCHLEVEL_H_ */
---- 26,30 ----
-     looks for to find the patch level (for the sccs version string). */
-  
-! #define PATCHLEVEL 6
-  
-  #endif /* _PATCHLEVEL_H_ */
diff --git a/package/bash/bash-4.1-007.patch b/package/bash/bash-4.1-007.patch
deleted file mode 100644
index a421b0c..0000000
--- a/package/bash/bash-4.1-007.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-			     BASH PATCH REPORT
-			     =================
-
-Bash-Release:	4.1
-Patch-ID:	bash41-007
-
-Bug-Reported-by:	Rob Robason <rob@robason.net>
-Bug-Reference-ID:	<1269513145.22336.9.camel@home.robason.homelinux.net>
-Bug-Reference-URL:	http://lists.gnu.org/archive/html/bug-bash/2010-03/msg00089.html
-
-Bug-Description:
-
-A typo caused bash to not honor a precision specification in a printf
-format.
-
-Patch (apply with `patch -p0'):
-
-*** ../bash-4.1-patched/builtins/printf.def	2010-01-18 10:50:22.000000000 -0500
---- ./builtins/printf.def	2010-03-25 09:40:56.000000000 -0400
-***************
-*** 118,122 ****
-        nw = vflag ? vbprintf (f, fieldwidth, func) : printf (f, fieldwidth, func); \
-      else if (have_precision) \
-!       nw = vflag ? vbprintf (f, precision, func) : printf (f, fieldwidth, func); \
-      else \
-        nw = vflag ? vbprintf (f, func) : printf (f, func); \
---- 118,122 ----
-        nw = vflag ? vbprintf (f, fieldwidth, func) : printf (f, fieldwidth, func); \
-      else if (have_precision) \
-!       nw = vflag ? vbprintf (f, precision, func) : printf (f, precision, func); \
-      else \
-        nw = vflag ? vbprintf (f, func) : printf (f, func); \
-*** ../bash-4.1-patched/patchlevel.h	2009-10-01 16:39:22.000000000 -0400
---- ./patchlevel.h	2010-01-14 09:38:08.000000000 -0500
-***************
-*** 26,30 ****
-     looks for to find the patch level (for the sccs version string). */
-  
-! #define PATCHLEVEL 6
-  
-  #endif /* _PATCHLEVEL_H_ */
---- 26,30 ----
-     looks for to find the patch level (for the sccs version string). */
-  
-! #define PATCHLEVEL 7
-  
-  #endif /* _PATCHLEVEL_H_ */
diff --git a/package/bash/bash-4.1-008.patch b/package/bash/bash-4.1-008.patch
deleted file mode 100644
index 72b855e..0000000
--- a/package/bash/bash-4.1-008.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-			     BASH PATCH REPORT
-			     =================
-
-Bash-Release:	4.1
-Patch-ID:	bash41-008
-
-Bug-Reported-by:	Dennis van Dok <dvandok@gmail.com>
-Bug-Reference-ID:	<4BBF2501.5050703@gmail.com>
-Bug-Reference-URL:	http://lists.gnu.org/archive/html/bug-bash/2010-04/msg00038.html
-
-Bug-Description:
-
-When declaring an associative array and implicitly assigning a value
-to element "0", bash does not correctly allocate memory, leading to
-a segmentation violation when that element or the array itself is
-unset.
-
-Patch (apply with `patch -p0'):
-
-*** ../bash-4.1-patched/builtins/declare.def	2009-11-25 19:42:00.000000000 -0500
---- ./builtins/declare.def	2010-05-30 18:25:21.000000000 -0400
-***************
-*** 513,517 ****
-  	      /* let bind_{array,assoc}_variable take care of this. */
-  	      if (assoc_p (var))
-! 		bind_assoc_variable (var, name, "0", value, aflags);
-  	      else
-  		bind_array_variable (name, 0, value, aflags);
---- 519,523 ----
-  	      /* let bind_{array,assoc}_variable take care of this. */
-  	      if (assoc_p (var))
-! 		bind_assoc_variable (var, name, savestring ("0"), value, aflags);
-  	      else
-  		bind_array_variable (name, 0, value, aflags);
-*** ../bash-4.1-patched/patchlevel.h	2009-10-01 16:39:22.000000000 -0400
---- ./patchlevel.h	2010-01-14 09:38:08.000000000 -0500
-***************
-*** 26,30 ****
-     looks for to find the patch level (for the sccs version string). */
-  
-! #define PATCHLEVEL 7
-  
-  #endif /* _PATCHLEVEL_H_ */
---- 26,30 ----
-     looks for to find the patch level (for the sccs version string). */
-  
-! #define PATCHLEVEL 8
-  
-  #endif /* _PATCHLEVEL_H_ */
diff --git a/package/bash/bash-4.1-009.patch b/package/bash/bash-4.1-009.patch
deleted file mode 100644
index ed136a9..0000000
--- a/package/bash/bash-4.1-009.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-			     BASH PATCH REPORT
-			     =================
-
-Bash-Release:	4.1
-Patch-ID:	bash41-009
-
-Bug-Reported-by:	Tomas Trnka <tomastrnka@gmx.com>
-Bug-Reference-ID:	<201003242030.02166.tomastrnka@gmx.com>
-Bug-Reference-URL:	http://lists.gnu.org/archive/html/bug-bash/2010-03/msg00090.html
-
-Bug-Description:
-
-An arriving SIGCHLD will interrupt `slow' system calls such as write(2) to
-or read(2) from a terminal.  This results in an error message and truncated
-input or output.
-
-Patch (apply with `patch -p0'):
-
-*** ../bash-4.1-patched/sig.c	Fri Aug 14 16:31:52 2009
---- ./sig.c	Fri Mar 26 22:34:11 2010
-***************
-*** 655,660 ****
---- 655,663 ----
-      act.sa_flags |= SA_INTERRUPT;	/* XXX */
-    else
-      act.sa_flags |= SA_RESTART;		/* XXX */
-+ #else
-+   if (sig == SIGCHLD)
-+     act.sa_flags |= SA_RESTART;
-  #endif
-    sigemptyset (&act.sa_mask);
-    sigemptyset (&oact.sa_mask);
-*** ../bash-4.1-patched/patchlevel.h	2009-10-01 16:39:22.000000000 -0400
---- ./patchlevel.h	2010-01-14 09:38:08.000000000 -0500
-***************
-*** 26,30 ****
-     looks for to find the patch level (for the sccs version string). */
-  
-! #define PATCHLEVEL 8
-  
-  #endif /* _PATCHLEVEL_H_ */
---- 26,30 ----
-     looks for to find the patch level (for the sccs version string). */
-  
-! #define PATCHLEVEL 9
-  
-  #endif /* _PATCHLEVEL_H_ */
-
diff --git a/package/bash/bash-4.2-001.patch b/package/bash/bash-4.2-001.patch
new file mode 100644
index 0000000..b5c0aa9
--- /dev/null
+++ b/package/bash/bash-4.2-001.patch
@@ -0,0 +1,78 @@
+			     BASH PATCH REPORT
+			     =================
+
+Bash-Release:	4.2
+Patch-ID:	bash42-001
+
+Bug-Reported-by:	Juergen Daubert <jue@jue.li>
+Bug-Reference-ID:	<20110214175132.GA19813@jue.netz>
+Bug-Reference-URL:	http://lists.gnu.org/archive/html/bug-bash/2011-02/msg00125.html
+
+Bug-Description:
+
+When running in Posix mode, bash does not correctly expand the right-hand
+side of a double-quoted word expansion containing single quotes.
+
+Patch (apply with `patch -p0'):
+
+*** ../bash-4.2-patched/subst.c	2011-01-02 16:12:51.000000000 -0500
+--- ./subst.c	2011-02-19 00:00:00.000000000 -0500
+***************
+*** 1380,1387 ****
+  
+    /* The handling of dolbrace_state needs to agree with the code in parse.y:
+!      parse_matched_pair() */
+!   dolbrace_state = 0;
+!   if (quoted & (Q_HERE_DOCUMENT|Q_DOUBLE_QUOTES))
+!     dolbrace_state = (flags & SX_POSIXEXP) ? DOLBRACE_QUOTE : DOLBRACE_PARAM;
+  
+    i = *sindex;
+--- 1380,1389 ----
+  
+    /* The handling of dolbrace_state needs to agree with the code in parse.y:
+!      parse_matched_pair().  The different initial value is to handle the
+!      case where this function is called to parse the word in
+!      ${param op word} (SX_WORD). */
+!   dolbrace_state = (flags & SX_WORD) ? DOLBRACE_WORD : DOLBRACE_PARAM;
+!   if ((quoted & (Q_HERE_DOCUMENT|Q_DOUBLE_QUOTES)) && (flags & SX_POSIXEXP))
+!     dolbrace_state = DOLBRACE_QUOTE;
+  
+    i = *sindex;
+***************
+*** 7177,7181 ****
+        /* Extract the contents of the ${ ... } expansion
+  	 according to the Posix.2 rules. */
+!       value = extract_dollar_brace_string (string, &sindex, quoted, (c == '%' || c == '#') ? SX_POSIXEXP : 0);
+        if (string[sindex] == RBRACE)
+  	sindex++;
+--- 7181,7185 ----
+        /* Extract the contents of the ${ ... } expansion
+  	 according to the Posix.2 rules. */
+!       value = extract_dollar_brace_string (string, &sindex, quoted, (c == '%' || c == '#' || c =='/' || c == '^' || c == ',' || c ==':') ? SX_POSIXEXP|SX_WORD : SX_WORD);
+        if (string[sindex] == RBRACE)
+  	sindex++;
+*** ../bash-4.2-patched/subst.h	2010-12-02 20:21:29.000000000 -0500
+--- ./subst.h	2011-02-16 21:12:09.000000000 -0500
+***************
+*** 57,60 ****
+--- 57,61 ----
+  #define SX_ARITHSUB	0x0080	/* extracting $(( ... )) (currently unused) */
+  #define SX_POSIXEXP	0x0100	/* extracting new Posix pattern removal expansions in extract_dollar_brace_string */
++ #define SX_WORD		0x0200	/* extracting word in ${param op word} */
+  
+  /* Remove backslashes which are quoting backquotes from STRING.  Modifies
+*** ../bash-4.2-patched/patchlevel.h	Sat Jun 12 20:14:48 2010
+--- ./patchlevel.h	Thu Feb 24 21:41:34 2011
+***************
+*** 26,30 ****
+     looks for to find the patch level (for the sccs version string). */
+  
+! #define PATCHLEVEL 0
+  
+  #endif /* _PATCHLEVEL_H_ */
+--- 26,30 ----
+     looks for to find the patch level (for the sccs version string). */
+  
+! #define PATCHLEVEL 1
+  
+  #endif /* _PATCHLEVEL_H_ */
diff --git a/package/bash/bash-4.2-002.patch b/package/bash/bash-4.2-002.patch
new file mode 100644
index 0000000..0d35ad2
--- /dev/null
+++ b/package/bash/bash-4.2-002.patch
@@ -0,0 +1,60 @@
+			     BASH PATCH REPORT
+			     =================
+
+Bash-Release:	4.2
+Patch-ID:	bash42-002
+
+Bug-Reported-by:	Clark J. Wang <dearvoid@gmail.com>
+Bug-Reference-ID:	<AANLkTimGbW7aC4E5infXP6ku5WPci4t=xVc+L1SyHqrD@mail.gmail.com>
+Bug-Reference-URL:	http://lists.gnu.org/archive/html/bug-bash/2011-02/msg00157.html
+
+Bug-Description:
+
+The readline vi-mode `cc', `dd', and `yy' commands failed to modify the
+entire line.
+
+Patch (apply with `patch -p0'):
+
+*** ../bash-4.2-patched/lib/readline/vi_mode.c	2010-11-20 19:51:39.000000000 -0500
+--- ./lib/readline/vi_mode.c	2011-02-17 20:24:25.000000000 -0500
+***************
+*** 1115,1119 ****
+        _rl_vi_last_motion = c;
+        RL_UNSETSTATE (RL_STATE_VIMOTION);
+!       return (0);
+      }
+  #if defined (READLINE_CALLBACKS)
+--- 1115,1119 ----
+        _rl_vi_last_motion = c;
+        RL_UNSETSTATE (RL_STATE_VIMOTION);
+!       return (vidomove_dispatch (m));
+      }
+  #if defined (READLINE_CALLBACKS)
+*** ../bash-4.2-patched/lib/readline/callback.c	2010-06-06 12:18:58.000000000 -0400
+--- ./lib/readline/callback.c	2011-02-17 20:43:28.000000000 -0500
+***************
+*** 149,152 ****
+--- 149,155 ----
+  	  /* Should handle everything, including cleanup, numeric arguments,
+  	     and turning off RL_STATE_VIMOTION */
++ 	  if (RL_ISSTATE (RL_STATE_NUMERICARG) == 0)
++ 	    _rl_internal_char_cleanup ();
++ 
+  	  return;
+  	}
+*** ../bash-4.2-patched/patchlevel.h	Sat Jun 12 20:14:48 2010
+--- ./patchlevel.h	Thu Feb 24 21:41:34 2011
+***************
+*** 26,30 ****
+     looks for to find the patch level (for the sccs version string). */
+  
+! #define PATCHLEVEL 1
+  
+  #endif /* _PATCHLEVEL_H_ */
+--- 26,30 ----
+     looks for to find the patch level (for the sccs version string). */
+  
+! #define PATCHLEVEL 2
+  
+  #endif /* _PATCHLEVEL_H_ */
+
diff --git a/package/bash/bash-4.2-003.patch b/package/bash/bash-4.2-003.patch
new file mode 100644
index 0000000..a17b127
--- /dev/null
+++ b/package/bash/bash-4.2-003.patch
@@ -0,0 +1,318 @@
+			     BASH PATCH REPORT
+			     =================
+
+Bash-Release:	4.2
+Patch-ID:	bash42-003
+
+Bug-Reported-by:	Clark J. Wang <dearvoid@gmail.com>
+Bug-Reference-ID:	<AANLkTikZ_rVV-frR8Fh0PzhXnMKnm5XsUR-F3qtPPs5G@mail.gmail.com>
+Bug-Reference-URL:	http://lists.gnu.org/archive/html/bug-bash/2011-02/msg00136.html
+
+Bug-Description:
+
+When using the pattern replacement and pattern removal word expansions, bash
+miscalculates the possible match length in the presence of an unescaped left
+bracket without a closing right bracket, resulting in a failure to match
+the pattern.
+
+Patch (apply with `patch -p0'):
+
+*** ../bash-4.2-patched/lib/glob/gmisc.c	2011-02-05 16:11:17.000000000 -0500
+--- ./lib/glob/gmisc.c	2011-02-18 23:53:42.000000000 -0500
+***************
+*** 78,83 ****
+       size_t wmax;
+  {
+!   wchar_t wc, *wbrack;
+!   int matlen, t, in_cclass, in_collsym, in_equiv;
+  
+    if (*wpat == 0)
+--- 78,83 ----
+       size_t wmax;
+  {
+!   wchar_t wc;
+!   int matlen, bracklen, t, in_cclass, in_collsym, in_equiv;
+  
+    if (*wpat == 0)
+***************
+*** 119,123 ****
+  	case L'[':
+  	  /* scan for ending `]', skipping over embedded [:...:] */
+! 	  wbrack = wpat;
+  	  wc = *wpat++;
+  	  do
+--- 119,123 ----
+  	case L'[':
+  	  /* scan for ending `]', skipping over embedded [:...:] */
+! 	  bracklen = 1;
+  	  wc = *wpat++;
+  	  do
+***************
+*** 125,140 ****
+  	      if (wc == 0)
+  		{
+! 	          matlen += wpat - wbrack - 1;	/* incremented below */
+! 	          break;
+  	        }
+  	      else if (wc == L'\\')
+  		{
+! 		  wc = *wpat++;
+! 		  if (*wpat == 0)
+! 		    break;
+  		}
+  	      else if (wc == L'[' && *wpat == L':')	/* character class */
+  		{
+  		  wpat++;
+  		  in_cclass = 1;
+  		}
+--- 125,148 ----
+  	      if (wc == 0)
+  		{
+! 		  wpat--;			/* back up to NUL */
+! 	          matlen += bracklen;
+! 	          goto bad_bracket;
+  	        }
+  	      else if (wc == L'\\')
+  		{
+! 		  /* *wpat == backslash-escaped character */
+! 		  bracklen++;
+! 		  /* If the backslash or backslash-escape ends the string,
+! 		     bail.  The ++wpat skips over the backslash escape */
+! 		  if (*wpat == 0 || *++wpat == 0)
+! 		    {
+! 		      matlen += bracklen;
+! 		      goto bad_bracket;
+! 		    }
+  		}
+  	      else if (wc == L'[' && *wpat == L':')	/* character class */
+  		{
+  		  wpat++;
++ 		  bracklen++;
+  		  in_cclass = 1;
+  		}
+***************
+*** 142,145 ****
+--- 150,154 ----
+  		{
+  		  wpat++;
++ 		  bracklen++;
+  		  in_cclass = 0;
+  		}
+***************
+*** 147,152 ****
+  		{
+  		  wpat++;
+  		  if (*wpat == L']')	/* right bracket can appear as collating symbol */
+! 		    wpat++;
+  		  in_collsym = 1;
+  		}
+--- 156,165 ----
+  		{
+  		  wpat++;
++ 		  bracklen++;
+  		  if (*wpat == L']')	/* right bracket can appear as collating symbol */
+! 		    {
+! 		      wpat++;
+! 		      bracklen++;
+! 		    }
+  		  in_collsym = 1;
+  		}
+***************
+*** 154,157 ****
+--- 167,171 ----
+  		{
+  		  wpat++;
++ 		  bracklen++;
+  		  in_collsym = 0;
+  		}
+***************
+*** 159,164 ****
+  		{
+  		  wpat++;
+  		  if (*wpat == L']')	/* right bracket can appear as equivalence class */
+! 		    wpat++;
+  		  in_equiv = 1;
+  		}
+--- 173,182 ----
+  		{
+  		  wpat++;
++ 		  bracklen++;
+  		  if (*wpat == L']')	/* right bracket can appear as equivalence class */
+! 		    {
+! 		      wpat++;
+! 		      bracklen++;
+! 		    }
+  		  in_equiv = 1;
+  		}
+***************
+*** 166,174 ****
+--- 184,196 ----
+  		{
+  		  wpat++;
++ 		  bracklen++;
+  		  in_equiv = 0;
+  		}
++ 	      else
++ 		bracklen++;
+  	    }
+  	  while ((wc = *wpat++) != L']');
+  	  matlen++;		/* bracket expression can only match one char */
++ bad_bracket:
+  	  break;
+  	}
+***************
+*** 214,219 ****
+       size_t max;
+  {
+!   char c, *brack;
+!   int matlen, t, in_cclass, in_collsym, in_equiv;
+  
+    if (*pat == 0)
+--- 236,241 ----
+       size_t max;
+  {
+!   char c;
+!   int matlen, bracklen, t, in_cclass, in_collsym, in_equiv;
+  
+    if (*pat == 0)
+***************
+*** 255,259 ****
+  	case '[':
+  	  /* scan for ending `]', skipping over embedded [:...:] */
+! 	  brack = pat;
+  	  c = *pat++;
+  	  do
+--- 277,281 ----
+  	case '[':
+  	  /* scan for ending `]', skipping over embedded [:...:] */
+! 	  bracklen = 1;
+  	  c = *pat++;
+  	  do
+***************
+*** 261,276 ****
+  	      if (c == 0)
+  		{
+! 	          matlen += pat - brack - 1;	/* incremented below */
+! 	          break;
+  	        }
+  	      else if (c == '\\')
+  		{
+! 		  c = *pat++;
+! 		  if (*pat == 0)
+! 		    break;
+  		}
+  	      else if (c == '[' && *pat == ':')	/* character class */
+  		{
+  		  pat++;
+  		  in_cclass = 1;
+  		}
+--- 283,306 ----
+  	      if (c == 0)
+  		{
+! 		  pat--;			/* back up to NUL */
+! 		  matlen += bracklen;
+! 		  goto bad_bracket;
+  	        }
+  	      else if (c == '\\')
+  		{
+! 		  /* *pat == backslash-escaped character */
+! 		  bracklen++;
+! 		  /* If the backslash or backslash-escape ends the string,
+! 		     bail.  The ++pat skips over the backslash escape */
+! 		  if (*pat == 0 || *++pat == 0)
+! 		    {
+! 		      matlen += bracklen;
+! 		      goto bad_bracket;
+! 		    }
+  		}
+  	      else if (c == '[' && *pat == ':')	/* character class */
+  		{
+  		  pat++;
++ 		  bracklen++;
+  		  in_cclass = 1;
+  		}
+***************
+*** 278,281 ****
+--- 308,312 ----
+  		{
+  		  pat++;
++ 		  bracklen++;
+  		  in_cclass = 0;
+  		}
+***************
+*** 283,288 ****
+  		{
+  		  pat++;
+  		  if (*pat == ']')	/* right bracket can appear as collating symbol */
+! 		    pat++;
+  		  in_collsym = 1;
+  		}
+--- 314,323 ----
+  		{
+  		  pat++;
++ 		  bracklen++;
+  		  if (*pat == ']')	/* right bracket can appear as collating symbol */
+! 		    {
+! 		      pat++;
+! 		      bracklen++;
+! 		    }
+  		  in_collsym = 1;
+  		}
+***************
+*** 290,293 ****
+--- 325,329 ----
+  		{
+  		  pat++;
++ 		  bracklen++;
+  		  in_collsym = 0;
+  		}
+***************
+*** 295,300 ****
+  		{
+  		  pat++;
+  		  if (*pat == ']')	/* right bracket can appear as equivalence class */
+! 		    pat++;
+  		  in_equiv = 1;
+  		}
+--- 331,340 ----
+  		{
+  		  pat++;
++ 		  bracklen++;
+  		  if (*pat == ']')	/* right bracket can appear as equivalence class */
+! 		    {
+! 		      pat++;
+! 		      bracklen++;
+! 		    }
+  		  in_equiv = 1;
+  		}
+***************
+*** 302,310 ****
+--- 342,354 ----
+  		{
+  		  pat++;
++ 		  bracklen++;
+  		  in_equiv = 0;
+  		}
++ 	      else
++ 		bracklen++;
+  	    }
+  	  while ((c = *pat++) != ']');
+  	  matlen++;		/* bracket expression can only match one char */
++ bad_bracket:
+  	  break;
+  	}
+*** ../bash-4.2-patched/patchlevel.h	Sat Jun 12 20:14:48 2010
+--- ./patchlevel.h	Thu Feb 24 21:41:34 2011
+***************
+*** 26,30 ****
+     looks for to find the patch level (for the sccs version string). */
+  
+! #define PATCHLEVEL 2
+  
+  #endif /* _PATCHLEVEL_H_ */
+--- 26,30 ----
+     looks for to find the patch level (for the sccs version string). */
+  
+! #define PATCHLEVEL 3
+  
+  #endif /* _PATCHLEVEL_H_ */
diff --git a/package/bash/bash-4.2-004.patch b/package/bash/bash-4.2-004.patch
new file mode 100644
index 0000000..fe419fa
--- /dev/null
+++ b/package/bash/bash-4.2-004.patch
@@ -0,0 +1,53 @@
+			     BASH PATCH REPORT
+			     =================
+
+Bash-Release:	4.2
+Patch-ID:	bash42-004
+
+Bug-Reported-by:	Mike Frysinger <vapier@gentoo.org>
+Bug-Reference-ID:	<201102182106.17834.vapier@gentoo.org>
+Bug-Reference-URL:	http://lists.gnu.org/archive/html/bug-bash/2011-02/msg00222.html
+
+Bug-Description:
+
+When used in contexts where word splitting and quote removal were not
+performed, such as pattern removal or pattern substitution, empty strings
+(either literal or resulting from quoted variables that were unset or
+null) were not matched correctly, resulting in failure.
+
+Patch (apply with `patch -p0'):
+
+*** ../bash-4.2-patched/subst.c	2011-01-02 16:12:51.000000000 -0500
+--- ./subst.c	2011-02-18 22:30:13.000000000 -0500
+***************
+*** 3373,3379 ****
+    if (string == 0 || *string == '\0')
+      return (WORD_LIST *)NULL;
+  
+!   td.flags = 0;
+    td.word = string;
+    tresult = call_expand_word_internal (&td, quoted, 1, dollar_at_p, has_dollar_at);
+    return (tresult);
+--- 3373,3379 ----
+    if (string == 0 || *string == '\0')
+      return (WORD_LIST *)NULL;
+  
+!   td.flags = W_NOSPLIT2;		/* no splitting, remove "" and '' */
+    td.word = string;
+    tresult = call_expand_word_internal (&td, quoted, 1, dollar_at_p, has_dollar_at);
+    return (tresult);
+*** ../bash-4.2-patched/patchlevel.h	Sat Jun 12 20:14:48 2010
+--- ./patchlevel.h	Thu Feb 24 21:41:34 2011
+***************
+*** 26,30 ****
+     looks for to find the patch level (for the sccs version string). */
+  
+! #define PATCHLEVEL 3
+  
+  #endif /* _PATCHLEVEL_H_ */
+--- 26,30 ----
+     looks for to find the patch level (for the sccs version string). */
+  
+! #define PATCHLEVEL 4
+  
+  #endif /* _PATCHLEVEL_H_ */
diff --git a/package/bash/bash-4.2-005.patch b/package/bash/bash-4.2-005.patch
new file mode 100644
index 0000000..c53a4e9
--- /dev/null
+++ b/package/bash/bash-4.2-005.patch
@@ -0,0 +1,131 @@
+			     BASH PATCH REPORT
+			     =================
+
+Bash-Release:	4.2
+Patch-ID:	bash42-005
+
+Bug-Reported-by:	Dennis Williamson <dennistwilliamson@gmail.com>
+Bug-Reference-ID:	<AANLkTikDbEV5rnbPc0zOfmZfBcg0xGetzLLzK+KjRiNa@mail.gmail.com>
+Bug-Reference-URL:	http://lists.gnu.org/archive/html/bug-bash/2011-02/msg00147.html
+
+Bug-Description:
+
+Systems that use tzset() to set the local timezone require the TZ variable
+to be in the environment.  Bash must make sure the environment has been
+modified with any updated value for TZ before calling tzset().  This
+affects prompt string expansions and the `%T' printf conversion specification
+on systems that do not allow bash to supply a replacement for getenv(3).
+
+Patch (apply with `patch -p0'):
+
+*** ../bash-4.2-patched/variables.h	2010-12-02 20:22:01.000000000 -0500
+--- ./variables.h	2011-02-19 19:57:12.000000000 -0500
+***************
+*** 314,317 ****
+--- 314,318 ----
+  extern void sort_variables __P((SHELL_VAR **));
+  
++ extern int chkexport __P((char *));
+  extern void maybe_make_export_env __P((void));
+  extern void update_export_env_inplace __P((char *, int, char *));
+*** ../bash-4.2-patched/variables.c	2011-01-24 20:07:48.000000000 -0500
+--- ./variables.c	2011-02-19 20:04:50.000000000 -0500
+***************
+*** 3654,3657 ****
+--- 3654,3673 ----
+  }
+  
++ int
++ chkexport (name)
++      char *name;
++ {
++   SHELL_VAR *v;
++ 
++   v = find_variable (name);
++   if (exported_p (v))
++     {
++       array_needs_making = 1;
++       maybe_make_export_env ();
++       return 1;
++     }
++   return 0;
++ }
++ 
+  void
+  maybe_make_export_env ()
+***************
+*** 4215,4219 ****
+    { "TEXTDOMAINDIR", sv_locale },
+  
+! #if defined (HAVE_TZSET) && defined (PROMPT_STRING_DECODE)
+    { "TZ", sv_tz },
+  #endif
+--- 4231,4235 ----
+    { "TEXTDOMAINDIR", sv_locale },
+  
+! #if defined (HAVE_TZSET)
+    { "TZ", sv_tz },
+  #endif
+***************
+*** 4559,4568 ****
+  #endif /* HISTORY */
+  
+! #if defined (HAVE_TZSET) && defined (PROMPT_STRING_DECODE)
+  void
+  sv_tz (name)
+       char *name;
+  {
+!   tzset ();
+  }
+  #endif
+--- 4575,4585 ----
+  #endif /* HISTORY */
+  
+! #if defined (HAVE_TZSET)
+  void
+  sv_tz (name)
+       char *name;
+  {
+!   if (chkexport (name))
+!     tzset ();
+  }
+  #endif
+*** ../bash-4.2-patched/parse.y	2011-01-02 15:48:11.000000000 -0500
+--- ./parse.y	2011-02-19 20:05:00.000000000 -0500
+***************
+*** 5136,5139 ****
+--- 5136,5142 ----
+  	      /* Make the current time/date into a string. */
+  	      (void) time (&the_time);
++ #if defined (HAVE_TZSET)
++ 	      sv_tz ("TZ");		/* XXX -- just make sure */
++ #endif
+  	      tm = localtime (&the_time);
+  
+*** ../bash-4.2-patched/builtins/printf.def	2010-11-23 10:02:55.000000000 -0500
+--- ./builtins/printf.def	2011-02-19 20:05:04.000000000 -0500
+***************
+*** 466,469 ****
+--- 466,472 ----
+  		else
+  		  secs = arg;
++ #if defined (HAVE_TZSET)
++ 		sv_tz ("TZ");		/* XXX -- just make sure */
++ #endif
+  		tm = localtime (&secs);
+  		n = strftime (timebuf, sizeof (timebuf), timefmt, tm);
+*** ../bash-4.2-patched/patchlevel.h	Sat Jun 12 20:14:48 2010
+--- ./patchlevel.h	Thu Feb 24 21:41:34 2011
+***************
+*** 26,30 ****
+     looks for to find the patch level (for the sccs version string). */
+  
+! #define PATCHLEVEL 4
+  
+  #endif /* _PATCHLEVEL_H_ */
+--- 26,30 ----
+     looks for to find the patch level (for the sccs version string). */
+  
+! #define PATCHLEVEL 5
+  
+  #endif /* _PATCHLEVEL_H_ */
diff --git a/package/bash/bash-4.2-006.patch b/package/bash/bash-4.2-006.patch
new file mode 100644
index 0000000..ce8d989
--- /dev/null
+++ b/package/bash/bash-4.2-006.patch
@@ -0,0 +1,46 @@
+			     BASH PATCH REPORT
+			     =================
+
+Bash-Release:	4.2
+Patch-ID:	bash42-006
+
+Bug-Reported-by:	Allan McRae <allan@archlinux.org>
+Bug-Reference-ID:	<4D6D0D0B.50908@archlinux.org>
+Bug-Reference-URL:	http://lists.gnu.org/archive/html/bug-bash/2011-03/msg00001.html
+
+Bug-Description:
+
+A problem with bash42-005 caused it to dump core if TZ was unset.
+
+Patch (apply with `patch -p0'):
+
+*** ../bash-4.2-patched/variables.c	2011-02-25 12:07:41.000000000 -0500
+--- ./variables.c	2011-03-01 10:13:04.000000000 -0500
+***************
+*** 3661,3665 ****
+  
+    v = find_variable (name);
+!   if (exported_p (v))
+      {
+        array_needs_making = 1;
+--- 3661,3665 ----
+  
+    v = find_variable (name);
+!   if (v && exported_p (v))
+      {
+        array_needs_making = 1;
+*** ../bash-4.2-patched/patchlevel.h	Sat Jun 12 20:14:48 2010
+--- ./patchlevel.h	Thu Feb 24 21:41:34 2011
+***************
+*** 26,30 ****
+     looks for to find the patch level (for the sccs version string). */
+  
+! #define PATCHLEVEL 5
+  
+  #endif /* _PATCHLEVEL_H_ */
+--- 26,30 ----
+     looks for to find the patch level (for the sccs version string). */
+  
+! #define PATCHLEVEL 6
+  
+  #endif /* _PATCHLEVEL_H_ */
diff --git a/package/bash/bash-4.2-007.patch b/package/bash/bash-4.2-007.patch
new file mode 100644
index 0000000..6fca896
--- /dev/null
+++ b/package/bash/bash-4.2-007.patch
@@ -0,0 +1,46 @@
+			     BASH PATCH REPORT
+			     =================
+
+Bash-Release:	4.2
+Patch-ID:	bash42-007
+
+Bug-Reported-by:	Matthias Klose <doko@debian.org>
+Bug-Reference-ID:	<4D6FD2AC.1010500@debian.org>
+Bug-Reference-URL:	http://lists.gnu.org/archive/html/bug-bash/2011-03/msg00015.html
+
+Bug-Description:
+
+When used in contexts where word splitting and quote removal were not
+performed, such as case statement word expansion, empty strings
+(either literal or resulting from quoted variables that were unset or
+null) were not expanded correctly, resulting in failure.
+
+Patch (apply with `patch -p0'):
+
+*** ../bash-4.2-patched/subst.c	2011-02-25 12:03:58.000000000 -0500
+--- ./subst.c	2011-03-03 14:08:23.000000000 -0500
+***************
+*** 4609,4614 ****
+--- 4611,4617 ----
+    if (ifs_firstc == 0)
+  #endif
+      word->flags |= W_NOSPLIT;
++   word->flags |= W_NOSPLIT2;
+    result = call_expand_word_internal (word, quoted, 0, (int *)NULL, (int *)NULL);
+    expand_no_split_dollar_star = 0;
+  
+*** ../bash-4.2-patched/patchlevel.h	Sat Jun 12 20:14:48 2010
+--- ./patchlevel.h	Thu Feb 24 21:41:34 2011
+***************
+*** 26,30 ****
+     looks for to find the patch level (for the sccs version string). */
+  
+! #define PATCHLEVEL 6
+  
+  #endif /* _PATCHLEVEL_H_ */
+--- 26,30 ----
+     looks for to find the patch level (for the sccs version string). */
+  
+! #define PATCHLEVEL 7
+  
+  #endif /* _PATCHLEVEL_H_ */
diff --git a/package/bash/bash-4.2-008.patch b/package/bash/bash-4.2-008.patch
new file mode 100644
index 0000000..91f8882
--- /dev/null
+++ b/package/bash/bash-4.2-008.patch
@@ -0,0 +1,74 @@
+			     BASH PATCH REPORT
+			     =================
+
+Bash-Release:	4.2
+Patch-ID:	bash42-008
+
+Bug-Reported-by:	Doug McMahon <mc2man@optonline.net>
+Bug-Reference-ID:	<1299441211.2535.11.camel@doug-XPS-M1330>
+Bug-Reference-URL:	http://lists.gnu.org/archive/html/bug-bash/2011-03/msg00050.html
+
+Bug-Description:
+
+Bash-4.2 does not attempt to save the shell history on receipt of a
+terminating signal that is handled synchronously.  Unfortunately, the
+`close' button on most X11 terminal emulators sends SIGHUP, which
+kills the shell.
+
+This is a very small patch to save the history in the case that an
+interactive shell receives a SIGHUP or SIGTERM while in readline and
+reading a command.
+
+The next version of bash will do this differently.
+
+Patch (apply with `patch -p0'):
+
+*** ../bash-4.2-patched/sig.c	Tue Nov 23 08:21:22 2010
+--- ./sig.c	Tue Mar  8 21:28:32 2011
+***************
+*** 47,50 ****
+--- 47,51 ----
+  #if defined (READLINE)
+  #  include "bashline.h"
++ #  include <readline/readline.h>
+  #endif
+  
+***************
+*** 63,66 ****
+--- 64,68 ----
+  extern int history_lines_this_session;
+  #endif
++ extern int no_line_editing;
+  
+  extern void initialize_siglist ();
+***************
+*** 506,510 ****
+  #if defined (HISTORY)
+        /* XXX - will inhibit history file being written */
+!       history_lines_this_session = 0;
+  #endif
+        terminate_immediately = 0;
+--- 508,515 ----
+  #if defined (HISTORY)
+        /* XXX - will inhibit history file being written */
+! #  if defined (READLINE)
+!       if (interactive_shell == 0 || interactive == 0 || (sig != SIGHUP && sig != SIGTERM) || no_line_editing || (RL_ISSTATE (RL_STATE_READCMD) == 0))
+! #  endif
+!         history_lines_this_session = 0;
+  #endif
+        terminate_immediately = 0;
+*** ../bash-4.2-patched/patchlevel.h	Sat Jun 12 20:14:48 2010
+--- ./patchlevel.h	Thu Feb 24 21:41:34 2011
+***************
+*** 26,30 ****
+     looks for to find the patch level (for the sccs version string). */
+  
+! #define PATCHLEVEL 7
+  
+  #endif /* _PATCHLEVEL_H_ */
+--- 26,30 ----
+     looks for to find the patch level (for the sccs version string). */
+  
+! #define PATCHLEVEL 8
+  
+  #endif /* _PATCHLEVEL_H_ */
diff --git a/package/bash/bash-4.2-009.patch b/package/bash/bash-4.2-009.patch
new file mode 100644
index 0000000..a4a5ded
--- /dev/null
+++ b/package/bash/bash-4.2-009.patch
@@ -0,0 +1,82 @@
+			     BASH PATCH REPORT
+			     =================
+
+Bash-Release:	4.2
+Patch-ID:	bash42-009
+
+Bug-Reported-by:	<piuma@piumalab.org>
+Bug-Reference-ID:	<4DAAC0DB.7060606@piumalab.org>
+Bug-Reference-URL:	http://lists.gnu.org/archive/html/bug-bash/2011-04/msg00075.html
+
+Bug-Description:
+
+Under certain circumstances, running `fc -l' two times in succession with a
+relative history offset at the end of the history will result in an incorrect
+calculation of the last history entry and a seg fault.
+
+Patch (apply with `patch -p0'):
+
+*** ../bash-4.2-patched/builtins/fc.def	2010-05-30 18:25:38.000000000 -0400
+--- ./builtins/fc.def	2011-04-19 15:46:17.000000000 -0400
+***************
+*** 305,309 ****
+  
+    /* XXX */
+!   if (saved_command_line_count > 0 && i == last_hist && hlist[last_hist] == 0)
+      while (last_hist >= 0 && hlist[last_hist] == 0)
+        last_hist--;
+--- 305,309 ----
+  
+    /* XXX */
+!   if (i == last_hist && hlist[last_hist] == 0)
+      while (last_hist >= 0 && hlist[last_hist] == 0)
+        last_hist--;
+***************
+*** 476,480 ****
+  {
+    int sign, n, clen, rh;
+!   register int i, j;
+    register char *s;
+  
+--- 476,480 ----
+  {
+    int sign, n, clen, rh;
+!   register int i, j, last_hist;
+    register char *s;
+  
+***************
+*** 496,500 ****
+       calculation as if it were on. */
+    rh = remember_on_history || ((subshell_environment & SUBSHELL_COMSUB) && enable_history_list);
+!   i -= rh + hist_last_line_added;
+  
+    /* No specification defaults to most recent command. */
+--- 496,508 ----
+       calculation as if it were on. */
+    rh = remember_on_history || ((subshell_environment & SUBSHELL_COMSUB) && enable_history_list);
+!   last_hist = i - rh - hist_last_line_added;
+! 
+!   if (i == last_hist && hlist[last_hist] == 0)
+!     while (last_hist >= 0 && hlist[last_hist] == 0)
+!       last_hist--;
+!   if (last_hist < 0)
+!     return (-1);
+! 
+!   i = last_hist;
+  
+    /* No specification defaults to most recent command. */
+*** ../bash-4.2-patched/patchlevel.h	Sat Jun 12 20:14:48 2010
+--- ./patchlevel.h	Thu Feb 24 21:41:34 2011
+***************
+*** 26,30 ****
+     looks for to find the patch level (for the sccs version string). */
+  
+! #define PATCHLEVEL 8
+  
+  #endif /* _PATCHLEVEL_H_ */
+--- 26,30 ----
+     looks for to find the patch level (for the sccs version string). */
+  
+! #define PATCHLEVEL 9
+  
+  #endif /* _PATCHLEVEL_H_ */
diff --git a/package/bash/bash-4.2-010.patch b/package/bash/bash-4.2-010.patch
new file mode 100644
index 0000000..0970c37
--- /dev/null
+++ b/package/bash/bash-4.2-010.patch
@@ -0,0 +1,61 @@
+			     BASH PATCH REPORT
+			     =================
+
+Bash-Release:	4.2
+Patch-ID:	bash42-010
+
+Bug-Reported-by:	Mike Frysinger <vapier@gentoo.org>
+Bug-Reference-ID:	<201104122356.20160.vapier@gentoo.org>
+Bug-Reference-URL:	http://lists.gnu.org/archive/html/bug-bash/2011-04/msg00058.html
+
+Bug-Description:
+
+Bash did not correctly print/reproduce here documents attached to commands
+inside compound commands such as arithmetic for loops and user-specified
+subshells.  This affected the execution of such commands inside a shell
+function when the function definition is saved and later restored using
+`.' or `eval'.
+
+Patch (apply with `patch -p0'):
+
+*** ../bash-4.2-patched/print_cmd.c	2010-05-30 18:34:08.000000000 -0400
+--- ./print_cmd.c	2011-04-14 10:43:18.000000000 -0400
+***************
+*** 316,319 ****
+--- 317,321 ----
+  	  skip_this_indent++;
+  	  make_command_string_internal (command->value.Subshell->command);
++ 	  PRINT_DEFERRED_HEREDOCS ("");
+  	  cprintf (" )");
+  	  break;
+***************
+*** 593,596 ****
+--- 606,610 ----
+    indentation += indentation_amount;
+    make_command_string_internal (arith_for_command->action);
++   PRINT_DEFERRED_HEREDOCS ("");
+    semicolon ();
+    indentation -= indentation_amount;
+***************
+*** 654,657 ****
+--- 668,672 ----
+  
+    make_command_string_internal (group_command->command);
++   PRINT_DEFERRED_HEREDOCS ("");
+  
+    if (inside_function_def)
+*** ../bash-4.2-patched/patchlevel.h	Sat Jun 12 20:14:48 2010
+--- ./patchlevel.h	Thu Feb 24 21:41:34 2011
+***************
+*** 26,30 ****
+     looks for to find the patch level (for the sccs version string). */
+  
+! #define PATCHLEVEL 9
+  
+  #endif /* _PATCHLEVEL_H_ */
+--- 26,30 ----
+     looks for to find the patch level (for the sccs version string). */
+  
+! #define PATCHLEVEL 10
+  
+  #endif /* _PATCHLEVEL_H_ */
diff --git a/package/bash/bash-4.1-mkbuiltins-cross.patch b/package/bash/bash-4.2-mkbuiltins-cross.patch
similarity index 100%
rename from package/bash/bash-4.1-mkbuiltins-cross.patch
rename to package/bash/bash-4.2-mkbuiltins-cross.patch
diff --git a/package/bash/bash.mk b/package/bash/bash.mk
index b20f6a8..f1f951c 100644
--- a/package/bash/bash.mk
+++ b/package/bash/bash.mk
@@ -4,9 +4,10 @@
 #
 #############################################################
 
-BASH_VERSION = 4.1
+BASH_VERSION = 4.2
 BASH_SITE = $(BR2_GNU_MIRROR)/bash
 BASH_DEPENDENCIES = ncurses
+BASH_CONF_ENV = bash_cv_job_control_missing=no
 
 # Make sure we build after busybox so that /bin/sh links to bash
 ifeq ($(BR2_PACKAGE_BUSYBOX),y)
