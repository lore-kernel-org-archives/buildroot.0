From: Chih-Min Chao <cmchao@gmail.com>
Date: Fri, 11 Mar 2011 16:13:31 +0800
Subject: [Buildroot] [PATCH 5/9] bash : bump to version 4.2
In-Reply-To: <1299831215-26466-1-git-send-email-cmchao@gmail.com>
References: <1299831215-26466-1-git-send-email-cmchao@gmail.com>
Message-ID: <1299831215-26466-5-git-send-email-cmchao@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Chih-Min Chao <cmchao@gmail.com>
---
 package/bash/bash-4.1-001.patch              |   48 ----------------
 package/bash/bash-4.1-002.patch              |   65 ----------------------
 package/bash/bash-4.1-003.patch              |   48 ----------------
 package/bash/bash-4.1-004.patch              |   47 ----------------
 package/bash/bash-4.1-005.patch              |   56 -------------------
 package/bash/bash-4.1-006.patch              |   76 --------------------------
 package/bash/bash-4.1-007.patch              |   47 ----------------
 package/bash/bash-4.1-008.patch              |   49 -----------------
 package/bash/bash-4.1-009.patch              |   48 ----------------
 package/bash/bash-4.1-mkbuiltins-cross.patch |   31 -----------
 package/bash/bash-4.2-mkbuiltins-cross.patch |   30 ++++++++++
 package/bash/bash.mk                         |    5 ++-
 12 files changed, 34 insertions(+), 516 deletions(-)
 delete mode 100644 package/bash/bash-4.1-001.patch
 delete mode 100644 package/bash/bash-4.1-002.patch
 delete mode 100644 package/bash/bash-4.1-003.patch
 delete mode 100644 package/bash/bash-4.1-004.patch
 delete mode 100644 package/bash/bash-4.1-005.patch
 delete mode 100644 package/bash/bash-4.1-006.patch
 delete mode 100644 package/bash/bash-4.1-007.patch
 delete mode 100644 package/bash/bash-4.1-008.patch
 delete mode 100644 package/bash/bash-4.1-009.patch
 delete mode 100644 package/bash/bash-4.1-mkbuiltins-cross.patch
 create mode 100644 package/bash/bash-4.2-mkbuiltins-cross.patch

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
diff --git a/package/bash/bash-4.1-mkbuiltins-cross.patch b/package/bash/bash-4.1-mkbuiltins-cross.patch
deleted file mode 100644
index 4252d53..0000000
--- a/package/bash/bash-4.1-mkbuiltins-cross.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-Let mkbuiltins use config.h even if cross compiling
-
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
----
- builtins/mkbuiltins.c |    9 ---------
- 1 files changed, 0 insertions(+), 9 deletions(-)
-
-diff --git a/builtins/mkbuiltins.c b/builtins/mkbuiltins.c
-index cdd45e4..1349093 100644
---- a/builtins/mkbuiltins.c
-+++ b/builtins/mkbuiltins.c
-@@ -19,16 +19,7 @@
-    along with Bash.  If not, see <http://www.gnu.org/licenses/>.
- */
- 
--#if !defined (CROSS_COMPILING) 
- #  include <config.h>
--#else	/* CROSS_COMPILING */
--/* A conservative set of defines based on POSIX/SUS3/XPG6 */
--#  define HAVE_UNISTD_H
--#  define HAVE_STRING_H
--#  define HAVE_STDLIB_H
--
--#  define HAVE_RENAME
--#endif /* CROSS_COMPILING */
- 
- #if defined (HAVE_UNISTD_H)
- #  ifdef _MINIX
--- 
-1.7.2.2
-
diff --git a/package/bash/bash-4.2-mkbuiltins-cross.patch b/package/bash/bash-4.2-mkbuiltins-cross.patch
new file mode 100644
index 0000000..f2cc606
--- /dev/null
+++ b/package/bash/bash-4.2-mkbuiltins-cross.patch
@@ -0,0 +1,30 @@
+Let mkbuiltins use config.h even if cross compiling
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+---
+ builtins/mkbuiltins.c |    9 ---------
+ 1 files changed, 0 insertions(+), 9 deletions(-)
+
+diff --git a/builtins/mkbuiltins.c b/builtins/mkbuiltins.c
+index cdd45e4..1349093 100644
+--- a/builtins/mkbuiltins.c
++++ b/builtins/mkbuiltins.c
+@@ -19,16 +19,7 @@
+    along with Bash.  If not, see <http://www.gnu.org/licenses/>.
+ */
+
+-#if !defined (CROSS_COMPILING)
+ #  include <config.h>
+-#else	/* CROSS_COMPILING */
+-/* A conservative set of defines based on POSIX/SUS3/XPG6 */
+-#  define HAVE_UNISTD_H
+-#  define HAVE_STRING_H
+-#  define HAVE_STDLIB_H
+-
+-#  define HAVE_RENAME
+-#endif /* CROSS_COMPILING */
+
+ #if defined (HAVE_UNISTD_H)
+ #  ifdef _MINIX
+--
+1.7.2.2
diff --git a/package/bash/bash.mk b/package/bash/bash.mk
index 2bcf0c4..fa9d6df 100644
--- a/package/bash/bash.mk
+++ b/package/bash/bash.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-BASH_VERSION = 4.1
+BASH_VERSION = 4.2
 BASH_SITE = $(BR2_GNU_MIRROR)/bash
 BASH_DEPENDENCIES = ncurses
 
@@ -13,6 +13,9 @@ ifeq ($(BR2_PACKAGE_BUSYBOX),y)
 BASH_DEPENDENCIES += busybox
 endif
 
+#enable job control for cross-compiling condition
+BASH_CONF_ENV += bash_cv_job_control_missing=no
+
 # Save the old sh file/link if there is one and symlink bash->sh
 define BASH_INSTALL_TARGET_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
-- 
1.7.0.4
