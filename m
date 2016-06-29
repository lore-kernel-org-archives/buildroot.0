From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed, 29 Jun 2016 07:58:03 +0200
Subject: [Buildroot] [PATCH 1/1] package/bash: bump to patchlevel 46
Message-ID: <1467179883-27512-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/bash/0043-patchlevel-43.patch | 63 +++++++++++++++++++++++++++++++++++
 package/bash/0044-patchlevel-44.patch | 52 +++++++++++++++++++++++++++++
 package/bash/0045-patchlevel-45.patch | 56 +++++++++++++++++++++++++++++++
 package/bash/0046-patchlevel-46.patch | 59 ++++++++++++++++++++++++++++++++
 4 files changed, 230 insertions(+)
 create mode 100644 package/bash/0043-patchlevel-43.patch
 create mode 100644 package/bash/0044-patchlevel-44.patch
 create mode 100644 package/bash/0045-patchlevel-45.patch
 create mode 100644 package/bash/0046-patchlevel-46.patch

diff --git a/package/bash/0043-patchlevel-43.patch b/package/bash/0043-patchlevel-43.patch
new file mode 100644
index 0000000..429f0ae
--- /dev/null
+++ b/package/bash/0043-patchlevel-43.patch
@@ -0,0 +1,63 @@
+From http://ftp.gnu.org/pub/gnu/bash/bash-4.3-patches/bash43-043
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+
+			     BASH PATCH REPORT
+			     =================
+
+Bash-Release:	4.3
+Patch-ID:	bash43-043
+
+Bug-Reported-by:	lolilolicon <lolilolicon@gmail.com>
+Bug-Reference-ID:	<CAMtVo_MF16KWanCB4C8WxA88Qt26zWsvV6V7+_U2fM0E6tCDxw@mail.gmail.com>
+Bug-Reference-URL:	http://lists.gnu.org/archive/html/bug-bash/2014-08/msg00040.html
+
+Bug-Description:
+
+When the lastpipe option is enabled, the last component can contain nested
+pipelines and cause a segmentation fault under certain circumestances.
+
+Patch (apply with `patch -p0'):
+
+*** ../bash-4.3-patched/execute_cmd.c	2014-07-30 10:26:52.000000000 -0400
+--- execute_cmd.c	2014-08-15 08:55:24.000000000 -0400
+***************
+*** 2406,2412 ****
+      {
+  #if defined (JOB_CONTROL)
+!       append_process (savestring (the_printed_command), dollar_dollar_pid, exec_result, lastpipe_jid);
+! #endif
+        lstdin = wait_for (lastpid);
+  #if defined (JOB_CONTROL)
+        /* If wait_for removes the job from the jobs table, use result of last
+--- 2433,2447 ----
+      {
+  #if defined (JOB_CONTROL)
+!       if (INVALID_JOB (lastpipe_jid) == 0)
+!         {
+!           append_process (savestring (the_printed_command_except_trap), dollar_dollar_pid, exec_result, lastpipe_jid);
+!           lstdin = wait_for (lastpid);
+!         }
+!       else
+!         lstdin = wait_for_single_pid (lastpid);		/* checks bgpids list */
+! #else
+        lstdin = wait_for (lastpid);
++ #endif
++ 
+  #if defined (JOB_CONTROL)
+        /* If wait_for removes the job from the jobs table, use result of last
+*** ../bash-4.3/patchlevel.h	2012-12-29 10:47:57.000000000 -0500
+--- patchlevel.h	2014-03-20 20:01:28.000000000 -0400
+***************
+*** 26,30 ****
+     looks for to find the patch level (for the sccs version string). */
+  
+! #define PATCHLEVEL 42
+  
+  #endif /* _PATCHLEVEL_H_ */
+--- 26,30 ----
+     looks for to find the patch level (for the sccs version string). */
+  
+! #define PATCHLEVEL 43
+  
+  #endif /* _PATCHLEVEL_H_ */
diff --git a/package/bash/0044-patchlevel-44.patch b/package/bash/0044-patchlevel-44.patch
new file mode 100644
index 0000000..4b0a2f1
--- /dev/null
+++ b/package/bash/0044-patchlevel-44.patch
@@ -0,0 +1,52 @@
+From http://ftp.gnu.org/pub/gnu/bash/bash-4.3-patches/bash43-044
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+
+			     BASH PATCH REPORT
+			     =================
+
+Bash-Release:	4.3
+Patch-ID:	bash43-044
+
+Bug-Reported-by:	Ondrej Oprala <ooprala@redhat.com>
+Bug-Reference-ID:	<539ED55B.2080103@redhat.com>
+Bug-Reference-URL:	http://lists.gnu.org/archive/html/bug-bash/2014-06/msg00046.html
+
+Bug-Description:
+
+A typo prevents the `compat42' shopt option from working as intended.
+
+Patch (apply with `patch -p0'):
+
+diff -rC 2 bash-4.3.42/builtins/shopt.def bash-4.3.43/builtins/shopt.def
+*** bash-4.3.42/builtins/shopt.def	2013-02-27 09:43:20.000000000 -0500
+--- builtins/shopt.def	2015-10-16 11:25:28.000000000 -0400
+***************
+*** 161,165 ****
+    { "compat40", &shopt_compat40, set_compatibility_level },
+    { "compat41", &shopt_compat41, set_compatibility_level },
+!   { "compat42", &shopt_compat41, set_compatibility_level },
+  #if defined (READLINE)
+    { "complete_fullquote", &complete_fullquote, (shopt_set_func_t *)NULL},
+--- 161,165 ----
+    { "compat40", &shopt_compat40, set_compatibility_level },
+    { "compat41", &shopt_compat41, set_compatibility_level },
+!   { "compat42", &shopt_compat42, set_compatibility_level },
+  #if defined (READLINE)
+    { "complete_fullquote", &complete_fullquote, (shopt_set_func_t *)NULL},
+
+*** ../bash-4.3/patchlevel.h	2012-12-29 10:47:57.000000000 -0500
+--- patchlevel.h	2014-03-20 20:01:28.000000000 -0400
+***************
+*** 26,30 ****
+     looks for to find the patch level (for the sccs version string). */
+  
+! #define PATCHLEVEL 43
+  
+  #endif /* _PATCHLEVEL_H_ */
+--- 26,30 ----
+     looks for to find the patch level (for the sccs version string). */
+  
+! #define PATCHLEVEL 44
+  
+  #endif /* _PATCHLEVEL_H_ */
diff --git a/package/bash/0045-patchlevel-45.patch b/package/bash/0045-patchlevel-45.patch
new file mode 100644
index 0000000..e763d00
--- /dev/null
+++ b/package/bash/0045-patchlevel-45.patch
@@ -0,0 +1,56 @@
+From http://ftp.gnu.org/pub/gnu/bash/bash-4.3-patches/bash43-045
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+
+			     BASH PATCH REPORT
+			     =================
+
+Bash-Release:	4.3
+Patch-ID:	bash43-045
+
+Bug-Reported-by:	Basin Ilya <basinilya@gmail.com>
+Bug-Reference-ID:	<5624C0AC.8070802@gmail.com>
+Bug-Reference-URL:	http://lists.gnu.org/archive/html/bug-bash/2015-10/msg00141.html
+
+Bug-Description:
+
+If a file open attempted as part of a redirection fails because it is interrupted
+by a signal, the shell needs to process any pending traps to allow the redirection
+to be canceled.
+
+Patch (apply with `patch -p0'):
+
+*** bash-20150109/redir.c	2014-12-03 10:47:38.000000000 -0500
+--- redir.c	2015-01-16 10:15:47.000000000 -0500
+***************
+*** 672,676 ****
+  	  e = errno;
+  	  if (fd < 0 && e == EINTR)
+! 	    QUIT;
+  	  errno = e;
+  	}
+--- 672,679 ----
+  	  e = errno;
+  	  if (fd < 0 && e == EINTR)
+! 	    {
+! 	      QUIT;
+! 	      run_pending_traps ();
+! 	    }
+  	  errno = e;
+  	}
+
+*** ../bash-4.3/patchlevel.h	2012-12-29 10:47:57.000000000 -0500
+--- patchlevel.h	2014-03-20 20:01:28.000000000 -0400
+***************
+*** 26,30 ****
+     looks for to find the patch level (for the sccs version string). */
+  
+! #define PATCHLEVEL 44
+  
+  #endif /* _PATCHLEVEL_H_ */
+--- 26,30 ----
+     looks for to find the patch level (for the sccs version string). */
+  
+! #define PATCHLEVEL 45
+  
+  #endif /* _PATCHLEVEL_H_ */
diff --git a/package/bash/0046-patchlevel-46.patch b/package/bash/0046-patchlevel-46.patch
new file mode 100644
index 0000000..c38ece7
--- /dev/null
+++ b/package/bash/0046-patchlevel-46.patch
@@ -0,0 +1,59 @@
+From http://ftp.gnu.org/pub/gnu/bash/bash-4.3-patches/bash43-046
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+
+			     BASH PATCH REPORT
+			     =================
+
+Bash-Release:	4.3
+Patch-ID:	bash43-046
+
+Bug-Reported-by:	Sergey Tselikh <stselikh@gmail.com>
+Bug-Reference-ID:	<20150816110235.91f3e12e3f20d20cdaad963e@gmail.com>
+Bug-Reference-URL:	http://lists.gnu.org/archive/html/bug-bash/2015-08/msg00080.html
+
+Bug-Description:
+
+An incorrect conversion from an indexed to associative array can result in a
+core dump.
+
+Patch (apply with `patch -p0'):
+
+*** /fs2/chet/bash/bash-20150813/subst.c	2015-08-13 11:32:54.000000000 -0400
+--- subst.c	2015-08-18 10:13:59.000000000 -0400
+***************
+*** 9562,9566 ****
+  	  opts[opti] = '\0';
+  	  if (opti > 0)
+! 	    make_internal_declare (tlist->word->word, opts);
+  
+  	  t = do_word_assignment (tlist->word, 0);
+--- 9562,9573 ----
+  	  opts[opti] = '\0';
+  	  if (opti > 0)
+! 	    {
+! 	      t = make_internal_declare (tlist->word->word, opts);
+! 	      if (t != EXECUTION_SUCCESS)
+! 		{
+! 		  last_command_exit_value = t;
+! 		  exp_jump_to_top_level (DISCARD);
+! 		}
+! 	    }
+  
+  	  t = do_word_assignment (tlist->word, 0);
+
+*** ../bash-4.3/patchlevel.h	2012-12-29 10:47:57.000000000 -0500
+--- patchlevel.h	2014-03-20 20:01:28.000000000 -0400
+***************
+*** 26,30 ****
+     looks for to find the patch level (for the sccs version string). */
+  
+! #define PATCHLEVEL 45
+  
+  #endif /* _PATCHLEVEL_H_ */
+--- 26,30 ----
+     looks for to find the patch level (for the sccs version string). */
+  
+! #define PATCHLEVEL 46
+  
+  #endif /* _PATCHLEVEL_H_ */
-- 
2.8.1
