From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun,  8 Jan 2017 09:24:50 +0100
Subject: [Buildroot] [PATCH] bash: add upstream fixes to patch level 5
Message-ID: <20170108082450.6870-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We unfortunately cannot easily download these because of the file names (not
ending in patch) and patch format (p0), so convert to p1 format and include
in package/bash.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/bash/bash44-001.patch | 64 +++++++++++++++++++++++++++++++
 package/bash/bash44-002.patch | 73 +++++++++++++++++++++++++++++++++++
 package/bash/bash44-003.patch | 62 ++++++++++++++++++++++++++++++
 package/bash/bash44-004.patch | 88 +++++++++++++++++++++++++++++++++++++++++++
 package/bash/bash44-005.patch | 51 +++++++++++++++++++++++++
 5 files changed, 338 insertions(+)
 create mode 100644 package/bash/bash44-001.patch
 create mode 100644 package/bash/bash44-002.patch
 create mode 100644 package/bash/bash44-003.patch
 create mode 100644 package/bash/bash44-004.patch
 create mode 100644 package/bash/bash44-005.patch

diff --git a/package/bash/bash44-001.patch b/package/bash/bash44-001.patch
new file mode 100644
index 000000000..842aea431
--- /dev/null
+++ b/package/bash/bash44-001.patch
@@ -0,0 +1,64 @@
+From https://ftp.gnu.org/gnu/bash/bash-4.4-patches/bash44-001
+
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+
+			     BASH PATCH REPORT
+			     =================
+
+Bash-Release:	4.4
+Patch-ID:	bash44-001
+
+Bug-Reported-by:	Sean Zha <freeman_cha@hotmail.com>
+Bug-Reference-ID:	<BN3PR01MB13657D9303EB94BF6E54216E8CCA0@BN3PR01MB1365.prod.exchangelabs.com>
+Bug-Reference-URL:	http://lists.gnu.org/archive/html/bug-bash/2016-09/msg00107.html
+
+Bug-Description:
+
+Bash-4.4 changed the way the history list is initially allocated to reduce
+the number of reallocations and copies.  Users who set HISTSIZE to a very
+large number to essentially unlimit the size of the history list will get
+memory allocation errors 
+
+Patch (apply with `patch -p0'):
+
+*** a/bash-4.4/lib/readline/history.c	2015-12-28 13:50:31.000000000 -0500
+--- b/lib/readline/history.c	2016-09-30 14:28:40.000000000 -0400
+***************
+*** 58,61 ****
+--- 58,63 ----
+  #define DEFAULT_HISTORY_INITIAL_SIZE	502
+  
++ #define MAX_HISTORY_INITIAL_SIZE	8192
++ 
+  /* The number of slots to increase the_history by. */
+  #define DEFAULT_HISTORY_GROW_SIZE 50
+***************
+*** 308,312 ****
+  	{
+  	  if (history_stifled && history_max_entries > 0)
+! 	    history_size = history_max_entries + 2;
+  	  else
+  	    history_size = DEFAULT_HISTORY_INITIAL_SIZE;
+--- 310,316 ----
+  	{
+  	  if (history_stifled && history_max_entries > 0)
+! 	    history_size = (history_max_entries > MAX_HISTORY_INITIAL_SIZE)
+! 				? MAX_HISTORY_INITIAL_SIZE
+! 				: history_max_entries + 2;
+  	  else
+  	    history_size = DEFAULT_HISTORY_INITIAL_SIZE;
+*** a/bash-4.4/patchlevel.h	2016-06-22 14:51:03.000000000 -0400
+--- b/patchlevel.h	2016-10-01 11:01:28.000000000 -0400
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
diff --git a/package/bash/bash44-002.patch b/package/bash/bash44-002.patch
new file mode 100644
index 000000000..6f4a809fb
--- /dev/null
+++ b/package/bash/bash44-002.patch
@@ -0,0 +1,73 @@
+From https://ftp.gnu.org/gnu/bash/bash-4.4-patches/bash44-002
+
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+
+			     BASH PATCH REPORT
+			     =================
+
+Bash-Release:	4.4
+Patch-ID:	bash44-002
+
+Bug-Reported-by:	Eric Pruitt <eric.pruitt@gmail.com>
+Bug-Reference-ID:	<20160916055120.GA28272@sinister.codevat.com>
+Bug-Reference-URL:	http://lists.gnu.org/archive/html/bug-bash/2016-09/msg00015.html
+
+Bug-Description:
+
+Bash-4.4 warns when discarding NUL bytes in command substitution output
+instead of silently dropping them.  This patch changes the warnings from
+one per NUL byte encountered to one warning per command substitution.
+
+Patch (apply with `patch -p0'):
+
+*** a/bash-4.4/subst.c	2016-08-30 16:46:38.000000000 -0400
+--- b/subst.c	2016-09-26 10:20:19.000000000 -0400
+***************
+*** 5932,5935 ****
+--- 5933,5937 ----
+    int istring_index, istring_size, c, tflag, skip_ctlesc, skip_ctlnul;
+    ssize_t bufn;
++   int nullbyte;
+  
+    istring = (char *)NULL;
+***************
+*** 5939,5942 ****
+--- 5941,5946 ----
+      skip_ctlesc |= *s == CTLESC, skip_ctlnul |= *s == CTLNUL;
+  
++   nullbyte = 0;
++ 
+    /* Read the output of the command through the pipe.  This may need to be
+       changed to understand multibyte characters in the future. */
+***************
+*** 5957,5961 ****
+  	{
+  #if 1
+! 	  internal_warning ("%s", _("command substitution: ignored null byte in input"));
+  #endif
+  	  continue;
+--- 5961,5969 ----
+  	{
+  #if 1
+! 	  if (nullbyte == 0)
+! 	    {
+! 	      internal_warning ("%s", _("command substitution: ignored null byte in input"));
+! 	      nullbyte = 1;
+! 	    }
+  #endif
+  	  continue;
+*** a/bash-4.4/patchlevel.h	2016-06-22 14:51:03.000000000 -0400
+--- b/patchlevel.h	2016-10-01 11:01:28.000000000 -0400
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
diff --git a/package/bash/bash44-003.patch b/package/bash/bash44-003.patch
new file mode 100644
index 000000000..cdfc206f8
--- /dev/null
+++ b/package/bash/bash44-003.patch
@@ -0,0 +1,62 @@
+From https://ftp.gnu.org/gnu/bash/bash-4.4-patches/bash44-003
+
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+
+			     BASH PATCH REPORT
+			     =================
+
+Bash-Release:	4.4
+Patch-ID:	bash44-003
+
+Bug-Reported-by:	op7ic \x00 <op7ica@gmail.com>
+Bug-Reference-ID:	<CAFHyJTopWC5Jx+U7WcvxSZKu+KrqSf+_3sHPiRWo=VzXSiPq=w@mail.gmail.com>
+Bug-Reference-URL:	http://lists.gnu.org/archive/html/bug-bash/2016-11/msg00005.html
+
+Bug-Description:
+
+Specially-crafted input, in this case an incomplete pathname expansion
+bracket expression containing an invalid collating symbol, can cause the
+shell to crash.
+
+Patch (apply with `patch -p0'):
+
+*** a/bash-4.4/lib/glob/sm_loop.c	2016-04-10 11:23:21.000000000 -0400
+--- b/lib/glob/sm_loop.c	2016-11-02 14:03:34.000000000 -0400
+***************
+*** 331,334 ****
+--- 331,340 ----
+      if (p[pc] == L('.') && p[pc+1] == L(']'))
+        break;
++    if (p[pc] == 0)
++     {
++       if (vp)
++ 	*vp = INVALID;
++       return (p + pc);
++     }
+     val = COLLSYM (p, pc);
+     if (vp)
+***************
+*** 484,487 ****
+--- 490,496 ----
+        c = FOLD (c);
+  
++       if (c == L('\0'))
++ 	return ((test == L('[')) ? savep : (CHAR *)0);
++ 
+        if ((flags & FNM_PATHNAME) && c == L('/'))
+  	/* [/] can never match when matching a pathname.  */
+*** a/bash-4.4/patchlevel.h	2016-06-22 14:51:03.000000000 -0400
+--- b/patchlevel.h	2016-10-01 11:01:28.000000000 -0400
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
diff --git a/package/bash/bash44-004.patch b/package/bash/bash44-004.patch
new file mode 100644
index 000000000..ba6ff6268
--- /dev/null
+++ b/package/bash/bash44-004.patch
@@ -0,0 +1,88 @@
+From https://ftp.gnu.org/gnu/bash/bash-4.4-patches/bash44-004
+
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+
+			     BASH PATCH REPORT
+			     =================
+
+Bash-Release:	4.4
+Patch-ID:	bash44-004
+
+Bug-Reported-by:	Christian Weisgerber <naddy@mips.inka.de>
+Bug-Reference-ID:	<20161101160302.GB54856@lorvorc.mips.inka.de>
+Bug-Reference-URL:	http://lists.gnu.org/archive/html/bug-bash/2016-11/msg00004.html
+
+Bug-Description:
+
+There is a race condition that can result in bash referencing freed memory
+when freeing data associated with the last process substitution.
+
+Patch (apply with `patch -p0'):
+
+*** a/bash-4.4/jobs.c	2016-08-23 16:38:44.000000000 -0400
+--- b/jobs.c	2016-11-02 18:24:45.000000000 -0400
+***************
+*** 454,457 ****
+--- 454,472 ----
+  }
+  
++ void
++ discard_last_procsub_child ()
++ {
++   PROCESS *disposer;
++   sigset_t set, oset;
++ 
++   BLOCK_CHILD (set, oset);
++   disposer = last_procsub_child;
++   last_procsub_child = (PROCESS *)NULL;
++   UNBLOCK_CHILD (oset);
++ 
++   if (disposer)
++     discard_pipeline (disposer);
++ }
++ 
+  struct pipeline_saver *
+  alloc_pipeline_saver ()
+*** a/bash-4.4/jobs.h	2016-04-27 10:35:51.000000000 -0400
+--- b/jobs.h	2016-11-02 18:25:08.000000000 -0400
+***************
+*** 191,194 ****
+--- 191,195 ----
+  extern void stop_making_children __P((void));
+  extern void cleanup_the_pipeline __P((void));
++ extern void discard_last_procsub_child __P((void));
+  extern void save_pipeline __P((int));
+  extern PROCESS *restore_pipeline __P((int));
+*** a/bash-4.4/subst.c	2016-08-30 16:46:38.000000000 -0400
+--- b/subst.c	2016-11-02 18:23:24.000000000 -0400
+***************
+*** 5809,5816 ****
+  #if defined (JOB_CONTROL)
+        if (last_procsub_child)
+! 	{
+! 	  discard_pipeline (last_procsub_child);
+! 	  last_procsub_child = (PROCESS *)NULL;
+! 	}
+        last_procsub_child = restore_pipeline (0);
+  #endif
+--- 5834,5838 ----
+  #if defined (JOB_CONTROL)
+        if (last_procsub_child)
+! 	discard_last_procsub_child ();
+        last_procsub_child = restore_pipeline (0);
+  #endif
+*** a/bash-4.4/patchlevel.h	2016-06-22 14:51:03.000000000 -0400
+--- b/patchlevel.h	2016-10-01 11:01:28.000000000 -0400
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
diff --git a/package/bash/bash44-005.patch b/package/bash/bash44-005.patch
new file mode 100644
index 000000000..0278e31df
--- /dev/null
+++ b/package/bash/bash44-005.patch
@@ -0,0 +1,51 @@
+From https://ftp.gnu.org/gnu/bash/bash-4.4-patches/bash44-005
+
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+
+			     BASH PATCH REPORT
+			     =================
+
+Bash-Release:	4.4
+Patch-ID:	bash44-005
+
+Bug-Reported-by:	Dr. Werner Fink <werner@suse.de>
+Bug-Reference-ID:	<20161107100936.ajnojd7dspirdflf@noether.suse.de>
+Bug-Reference-URL:	http://lists.gnu.org/archive/html/bug-bash/2016-11/msg00054.html
+
+Bug-Description:
+
+Under certain circumstances, a simple command is optimized to eliminate a
+fork, resulting in an EXIT trap not being executed.
+
+Patch (apply with `patch -p0'):
+
+*** a/bash-4.4/builtins/evalstring.c	2016-08-11 14:18:51.000000000 -0400
+--- b/builtins/evalstring.c	2016-11-08 15:05:07.000000000 -0500
+***************
+*** 105,114 ****
+  	  *bash_input.location.string == '\0' &&
+  	  command->type == cm_simple &&
+- #if 0
+  	  signal_is_trapped (EXIT_TRAP) == 0 &&
+  	  signal_is_trapped (ERROR_TRAP) == 0 &&
+- #else
+  	  any_signals_trapped () < 0 &&
+- #endif
+  	  command->redirects == 0 && command->value.Simple->redirects == 0 &&
+  	  ((command->flags & CMD_TIME_PIPELINE) == 0) &&
+--- 105,111 ----
+*** a/bash-4.4/patchlevel.h	2016-06-22 14:51:03.000000000 -0400
+--- b/patchlevel.h	2016-10-01 11:01:28.000000000 -0400
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
-- 
2.11.0
