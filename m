From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 12 Oct 2020 10:37:41 +0200
Subject: [Buildroot] [git commit branch/2020.08.x] package/bash: update to
 patch level 18
Message-ID: <20201012084444.468DD813C2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ce3b6156bd4f79b291188d267d60e6fc3ceb81d3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.08.x

Fixes a regression introduced in patch level 16.

Rename the 2 uClibc patches so the upstream patch numbering matches ours.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit d73ec6e0ab40675604d735536f67d43b967cb529)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/bash/0017-bash50-017.patch                 | 293 +++++++++++++++++++++
 package/bash/0018-bash50-018.patch                 |  49 ++++
 ...9-input.h-add-missing-include-on-stdio.h.patch} |   0
 ...=> 0020-locale.c-fix-build-without-wchar.patch} |   0
 4 files changed, 342 insertions(+)

diff --git a/package/bash/0017-bash50-017.patch b/package/bash/0017-bash50-017.patch
new file mode 100644
index 0000000000..6758b203f8
--- /dev/null
+++ b/package/bash/0017-bash50-017.patch
@@ -0,0 +1,293 @@
+From https://ftp.gnu.org/gnu/bash/bash-5.0-patches/bash55-017
+
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+
+			     BASH PATCH REPORT
+			     =================
+
+Bash-Release:	5.0
+Patch-ID:	bash50-017
+
+Bug-Reported-by:	Valentin Lab <valentin.lab@kalysto.org>
+Bug-Reference-ID:	<ab981b9c-60a5-46d0-b7e6-a6d88b80df50@kalysto.org>
+Bug-Reference-URL:	https://lists.gnu.org/archive/html/bug-bash/2020-03/msg00062.html
+
+Bug-Description:
+
+There were cases where patch 16 reaped process substitution file descriptors
+(or FIFOs) and processes to early. This is a better fix for the problem that
+bash50-016 attempted to solve.
+
+Patch (apply with `patch -p0'):
+
+*** bash-5.0-patched/subst.c	2019-08-29 11:16:49.000000000 -0400
+--- b/subst.c	2020-04-02 16:24:19.000000000 -0400
+***************
+*** 5337,5341 ****
+  }
+  
+! char *
+  copy_fifo_list (sizep)
+       int *sizep;
+--- b/5337,5341 ----
+  }
+  
+! void *
+  copy_fifo_list (sizep)
+       int *sizep;
+***************
+*** 5343,5347 ****
+    if (sizep)
+      *sizep = 0;
+!   return (char *)NULL;
+  }
+  
+--- b/5343,5347 ----
+    if (sizep)
+      *sizep = 0;
+!   return (void *)NULL;
+  }
+  
+***************
+*** 5409,5414 ****
+  	if (fifo_list[i].file)
+  	  {
+! 	    fifo_list[j].file = fifo_list[i].file;
+! 	    fifo_list[j].proc = fifo_list[i].proc;
+  	    j++;
+  	  }
+--- b/5409,5419 ----
+  	if (fifo_list[i].file)
+  	  {
+! 	    if (i != j)
+! 	      {
+! 		fifo_list[j].file = fifo_list[i].file;
+! 		fifo_list[j].proc = fifo_list[i].proc;
+! 		fifo_list[i].file = (char *)NULL;
+! 		fifo_list[i].proc = 0;
+! 	      }
+  	    j++;
+  	  }
+***************
+*** 5426,5433 ****
+  void
+  close_new_fifos (list, lsize)
+!      char *list;
+       int lsize;
+  {
+    int i;
+  
+    if (list == 0)
+--- b/5431,5439 ----
+  void
+  close_new_fifos (list, lsize)
+!      void *list;
+       int lsize;
+  {
+    int i;
++   char *plist;
+  
+    if (list == 0)
+***************
+*** 5437,5442 ****
+      }
+  
+!   for (i = 0; i < lsize; i++)
+!     if (list[i] == 0 && i < fifo_list_size && fifo_list[i].proc != -1)
+        unlink_fifo (i);
+  
+--- b/5443,5448 ----
+      }
+  
+!   for (plist = (char *)list, i = 0; i < lsize; i++)
+!     if (plist[i] == 0 && i < fifo_list_size && fifo_list[i].proc != -1)
+        unlink_fifo (i);
+  
+***************
+*** 5560,5568 ****
+  }
+  
+! char *
+  copy_fifo_list (sizep)
+       int *sizep;
+  {
+!   char *ret;
+  
+    if (nfds == 0 || totfds == 0)
+--- b/5566,5574 ----
+  }
+  
+! void *
+  copy_fifo_list (sizep)
+       int *sizep;
+  {
+!   void *ret;
+  
+    if (nfds == 0 || totfds == 0)
+***************
+*** 5570,5579 ****
+        if (sizep)
+  	*sizep = 0;
+!       return (char *)NULL;
+      }
+  
+    if (sizep)
+      *sizep = totfds;
+!   ret = (char *)xmalloc (totfds * sizeof (pid_t));
+    return (memcpy (ret, dev_fd_list, totfds * sizeof (pid_t)));
+  }
+--- b/5576,5585 ----
+        if (sizep)
+  	*sizep = 0;
+!       return (void *)NULL;
+      }
+  
+    if (sizep)
+      *sizep = totfds;
+!   ret = xmalloc (totfds * sizeof (pid_t));
+    return (memcpy (ret, dev_fd_list, totfds * sizeof (pid_t)));
+  }
+***************
+*** 5648,5655 ****
+  void
+  close_new_fifos (list, lsize)
+!      char *list;
+       int lsize;
+  {
+    int i;
+  
+    if (list == 0)
+--- b/5654,5662 ----
+  void
+  close_new_fifos (list, lsize)
+!      void *list;
+       int lsize;
+  {
+    int i;
++   pid_t *plist;
+  
+    if (list == 0)
+***************
+*** 5659,5664 ****
+      }
+  
+!   for (i = 0; i < lsize; i++)
+!     if (list[i] == 0 && i < totfds && dev_fd_list[i])
+        unlink_fifo (i);
+  
+--- b/5666,5671 ----
+      }
+  
+!   for (plist = (pid_t *)list, i = 0; i < lsize; i++)
+!     if (plist[i] == 0 && i < totfds && dev_fd_list[i])
+        unlink_fifo (i);
+  
+*** bash-5.0-patched/subst.h	2018-10-21 18:46:09.000000000 -0400
+--- b/subst.h	2020-04-02 16:29:28.000000000 -0400
+***************
+*** 274,280 ****
+  extern void unlink_fifo __P((int));
+  
+! extern char *copy_fifo_list __P((int *));
+! extern void unlink_new_fifos __P((char *, int));
+! extern void close_new_fifos __P((char *, int));
+  
+  extern void clear_fifo_list __P((void));
+--- b/274,279 ----
+  extern void unlink_fifo __P((int));
+  
+! extern void *copy_fifo_list __P((int *));
+! extern void close_new_fifos __P((void *, int));
+  
+  extern void clear_fifo_list __P((void));
+*** bash-5.0-patched/execute_cmd.c	2020-02-06 20:16:48.000000000 -0500
+--- b/execute_cmd.c	2020-04-02 17:00:10.000000000 -0400
+***************
+*** 565,569 ****
+  #if defined (PROCESS_SUBSTITUTION)
+    volatile int ofifo, nfifo, osize, saved_fifo;
+!   volatile char *ofifo_list;
+  #endif
+  
+--- b/565,569 ----
+  #if defined (PROCESS_SUBSTITUTION)
+    volatile int ofifo, nfifo, osize, saved_fifo;
+!   volatile void *ofifo_list;
+  #endif
+  
+***************
+*** 751,760 ****
+  #  endif
+  
+!   if (variable_context != 0)	/* XXX - also if sourcelevel != 0? */
+      {
+        ofifo = num_fifos ();
+        ofifo_list = copy_fifo_list ((int *)&osize);
+        begin_unwind_frame ("internal_fifos");
+!       add_unwind_protect (xfree, ofifo_list);
+        saved_fifo = 1;
+      }
+--- b/751,762 ----
+  #  endif
+  
+!   /* XXX - also if sourcelevel != 0? */
+!   if (variable_context != 0)
+      {
+        ofifo = num_fifos ();
+        ofifo_list = copy_fifo_list ((int *)&osize);
+        begin_unwind_frame ("internal_fifos");
+!       if (ofifo_list)
+! 	add_unwind_protect (xfree, ofifo_list);
+        saved_fifo = 1;
+      }
+***************
+*** 1100,1123 ****
+        nfifo = num_fifos ();
+        if (nfifo > ofifo)
+! 	close_new_fifos ((char *)ofifo_list, osize);
+        free ((void *)ofifo_list);
+        discard_unwind_frame ("internal_fifos");
+      }
+- # if defined (HAVE_DEV_FD)
+-   /* Reap process substitutions at the end of loops */
+-   switch (command->type)
+-     {
+-     case cm_while:
+-     case cm_until:
+-     case cm_for:
+-     case cm_group:
+- #    if defined (ARITH_FOR_COMMAND)
+-     case cm_arith_for:
+- #    endif
+-       reap_procsubs ();
+-     default:
+-       break;
+-     }
+- #  endif /* HAVE_DEV_FD */
+  #endif
+  
+--- b/1102,1109 ----
+        nfifo = num_fifos ();
+        if (nfifo > ofifo)
+! 	close_new_fifos ((void *)ofifo_list, osize);
+        free ((void *)ofifo_list);
+        discard_unwind_frame ("internal_fifos");
+      }
+  #endif
+  
+
+*** bash-5.0/patchlevel.h	2016-06-22 14:51:03.000000000 -0400
+--- b/patchlevel.h	2016-10-01 11:01:28.000000000 -0400
+***************
+*** 26,30 ****
+     looks for to find the patch level (for the sccs version string). */
+  
+! #define PATCHLEVEL 16
+  
+  #endif /* _PATCHLEVEL_H_ */
+--- b/26,30 ----
+     looks for to find the patch level (for the sccs version string). */
+  
+! #define PATCHLEVEL 17
+  
+  #endif /* _PATCHLEVEL_H_ */
diff --git a/package/bash/0018-bash50-018.patch b/package/bash/0018-bash50-018.patch
new file mode 100644
index 0000000000..efecb1897d
--- /dev/null
+++ b/package/bash/0018-bash50-018.patch
@@ -0,0 +1,49 @@
+From https://ftp.gnu.org/gnu/bash/bash-5.0-patches/bash55-018
+
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+
+			     BASH PATCH REPORT
+			     =================
+
+Bash-Release:	5.0
+Patch-ID:	bash50-018
+
+Bug-Reported-by:	oguzismailuysal at gmail.com
+Bug-Reference-ID:
+Bug-Reference-URL:	https://lists.gnu.org/archive/html/bug-bash/2019-10/msg00098.html
+
+Bug-Description:
+
+In certain cases, bash does not perform quoted null removal on patterns
+that are used as part of word expansions such as ${parameter##pattern}, so
+empty patterns are treated as non-empty.
+
+Patch (apply with `patch -p0'):
+
+*** bash-5.0.17/subst.c	2020-04-02 17:14:58.000000000 -0400
+--- b/subst.c	2020-07-09 15:28:19.000000000 -0400
+***************
+*** 5113,5116 ****
+--- b/5113,5118 ----
+  				      (int *)NULL, (int *)NULL)
+  	     : (WORD_LIST *)0;
++   if (l)
++     word_list_remove_quoted_nulls (l);
+    pat = string_list (l);
+    dispose_words (l);
+
+*** bash-5.0/patchlevel.h	2016-06-22 14:51:03.000000000 -0400
+--- b/patchlevel.h	2016-10-01 11:01:28.000000000 -0400
+***************
+*** 26,30 ****
+     looks for to find the patch level (for the sccs version string). */
+  
+! #define PATCHLEVEL 17
+  
+  #endif /* _PATCHLEVEL_H_ */
+--- b/26,30 ----
+     looks for to find the patch level (for the sccs version string). */
+  
+! #define PATCHLEVEL 18
+  
+  #endif /* _PATCHLEVEL_H_ */
diff --git a/package/bash/0017-input.h-add-missing-include-on-stdio.h.patch b/package/bash/0019-input.h-add-missing-include-on-stdio.h.patch
similarity index 100%
rename from package/bash/0017-input.h-add-missing-include-on-stdio.h.patch
rename to package/bash/0019-input.h-add-missing-include-on-stdio.h.patch
diff --git a/package/bash/0018-locale.c-fix-build-without-wchar.patch b/package/bash/0020-locale.c-fix-build-without-wchar.patch
similarity index 100%
rename from package/bash/0018-locale.c-fix-build-without-wchar.patch
rename to package/bash/0020-locale.c-fix-build-without-wchar.patch
