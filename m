From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 14 Mar 2019 21:31:02 +0100
Subject: [Buildroot] [git commit] package/bash: add upstream patches up to
 patch level 23
Message-ID: <20190314202842.0E2EE821ED@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=87a8f5f51c63fb9c9ff2cb907fd86f5ad0525617
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We unfortunately cannot easily download these because of the file names (not
ending in patch) and patch format (p0), so convert to p1 format and include
in package/bash with the following script:

j=1; for i in 19 20 21 22 23; do
    file=$(printf '%04d-patch44-0%d.patch' $j $i)
    cat > $file << EOF
From https://ftp.gnu.org/gnu/bash/bash-4.4-patches/bash44-0$i

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

EOF
    curl https://ftp.gnu.org/gnu/bash/bash-4.4-patches/bash44-0$i | \
        sed -e 's|^\*\*\* \.\./|*** |' -e 's|^--- |--- b/|' >> $file

    j=$(( j + 1 ))
done

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/bash/0001-bash44-019.patch |  54 +++++++++++
 package/bash/0002-bash44-020.patch | 181 +++++++++++++++++++++++++++++++++++++
 package/bash/0003-bash44-021.patch |  61 +++++++++++++
 package/bash/0004-bash44-022.patch |  65 +++++++++++++
 package/bash/0005-bash44-023.patch |  56 ++++++++++++
 5 files changed, 417 insertions(+)

diff --git a/package/bash/0001-bash44-019.patch b/package/bash/0001-bash44-019.patch
new file mode 100644
index 0000000000..b3d2f331b6
--- /dev/null
+++ b/package/bash/0001-bash44-019.patch
@@ -0,0 +1,54 @@
+From https://ftp.gnu.org/gnu/bash/bash-4.4-patches/bash44-019
+
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+
+			     BASH PATCH REPORT
+			     =================
+
+Bash-Release:	4.4
+Patch-ID:	bash44-019
+
+Bug-Reported-by:	Kieran Grant <kieran.thehacker.grant@gmail.com>
+Bug-Reference-ID:	<ec9071ae-efb1-9e09-5d03-e905daf2835c@gmail.com>
+Bug-Reference-URL:	http://lists.gnu.org/archive/html/bug-bash/2018-02/msg00002.html
+
+Bug-Description:
+
+With certain values for PS1, especially those that wrap onto three or more
+lines, readline will miscalculate the number of invisible characters,
+leading to crashes and core dumps.
+
+Patch (apply with `patch -p0'):
+
+*** bash-4.4.18/lib/readline/display.c	2016-07-28 14:49:33.000000000 -0400
+--- b/lib/readline/display.c	2018-02-03 19:19:35.000000000 -0500
+***************
+*** 772,776 ****
+        wadjust = (newlines == 0)
+  		  ? prompt_invis_chars_first_line
+! 		  : ((newlines == prompt_lines_estimate) ? wrap_offset : prompt_invis_chars_first_line);
+  
+        /* fix from Darin Johnson <darin@acuson.com> for prompt string with
+--- b/788,794 ----
+        wadjust = (newlines == 0)
+  		  ? prompt_invis_chars_first_line
+! 		  : ((newlines == prompt_lines_estimate)
+! 		  	? (wrap_offset - prompt_invis_chars_first_line)
+! 		  	: 0);
+  
+        /* fix from Darin Johnson <darin@acuson.com> for prompt string with
+*** bash-4.4/patchlevel.h	2016-06-22 14:51:03.000000000 -0400
+--- b/patchlevel.h	2016-10-01 11:01:28.000000000 -0400
+***************
+*** 26,30 ****
+     looks for to find the patch level (for the sccs version string). */
+  
+! #define PATCHLEVEL 18
+  
+  #endif /* _PATCHLEVEL_H_ */
+--- b/26,30 ----
+     looks for to find the patch level (for the sccs version string). */
+  
+! #define PATCHLEVEL 19
+  
+  #endif /* _PATCHLEVEL_H_ */
diff --git a/package/bash/0002-bash44-020.patch b/package/bash/0002-bash44-020.patch
new file mode 100644
index 0000000000..20f3abb586
--- /dev/null
+++ b/package/bash/0002-bash44-020.patch
@@ -0,0 +1,181 @@
+From https://ftp.gnu.org/gnu/bash/bash-4.4-patches/bash44-020
+
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+
+			     BASH PATCH REPORT
+			     =================
+
+Bash-Release:	4.4
+Patch-ID:	bash44-020
+
+Bug-Reported-by:	Graham Northup <northug@clarkson.edu>
+Bug-Reference-ID:	<537530c3-61f0-349b-9de6-fa4e2487f428@clarkson.edu>
+Bug-Reference-URL:	http://lists.gnu.org/archive/html/bug-bash/2017-02/msg00025.html
+
+Bug-Description:
+
+In circumstances involving long-running scripts that create and reap many
+processes, it is possible for the hash table bash uses to store exit
+statuses from asynchronous processes to develop loops. This patch fixes
+the loop causes and adds code to detect any future loops.
+
+Patch (apply with `patch -p0'):
+
+*** bash-4.4-patched/jobs.c	2016-11-11 13:42:55.000000000 -0500
+--- b/jobs.c	2017-02-22 15:16:28.000000000 -0500
+***************
+*** 813,818 ****
+    struct pidstat *ps;
+  
+!   bucket = pshash_getbucket (pid);
+!   psi = bgp_getindex ();
+    ps = &bgpids.storage[psi];
+  
+--- b/796,815 ----
+    struct pidstat *ps;
+  
+!   /* bucket == existing chain of pids hashing to same value
+!      psi = where were going to put this pid/status */
+! 
+!   bucket = pshash_getbucket (pid);	/* index into pidstat_table */
+!   psi = bgp_getindex ();		/* bgpids.head, index into storage */
+! 
+!   /* XXX - what if psi == *bucket? */
+!   if (psi == *bucket)
+!     {
+! #ifdef DEBUG
+!       internal_warning ("hashed pid %d (pid %d) collides with bgpids.head, skipping", psi, pid);
+! #endif
+!       bgpids.storage[psi].pid = NO_PID;		/* make sure */
+!       psi = bgp_getindex ();			/* skip to next one */
+!     }
+! 
+    ps = &bgpids.storage[psi];
+  
+***************
+*** 842,845 ****
+--- b/839,843 ----
+  {
+    struct pidstat *ps;
++   ps_index_t *bucket;
+  
+    ps = &bgpids.storage[psi];
+***************
+*** 847,856 ****
+      return;
+  
+!   if (ps->bucket_next != NO_PID)
+      bgpids.storage[ps->bucket_next].bucket_prev = ps->bucket_prev;
+!   if (ps->bucket_prev != NO_PID)
+      bgpids.storage[ps->bucket_prev].bucket_next = ps->bucket_next;
+    else
+!     *(pshash_getbucket (ps->pid)) = ps->bucket_next;
+  }
+  
+--- b/845,861 ----
+      return;
+  
+!   if (ps->bucket_next != NO_PIDSTAT)
+      bgpids.storage[ps->bucket_next].bucket_prev = ps->bucket_prev;
+!   if (ps->bucket_prev != NO_PIDSTAT)
+      bgpids.storage[ps->bucket_prev].bucket_next = ps->bucket_next;
+    else
+!     {
+!       bucket = pshash_getbucket (ps->pid);
+!       *bucket = ps->bucket_next;	/* deleting chain head in hash table */
+!     }
+! 
+!   /* clear out this cell, just in case */
+!   ps->pid = NO_PID;
+!   ps->bucket_next = ps->bucket_prev = NO_PIDSTAT;
+  }
+  
+***************
+*** 859,863 ****
+       pid_t pid;
+  {
+!   ps_index_t psi;
+  
+    if (bgpids.storage == 0 || bgpids.nalloc == 0 || bgpids.npid == 0)
+--- b/864,868 ----
+       pid_t pid;
+  {
+!   ps_index_t psi, orig_psi;
+  
+    if (bgpids.storage == 0 || bgpids.nalloc == 0 || bgpids.npid == 0)
+***************
+*** 865,871 ****
+  
+    /* Search chain using hash to find bucket in pidstat_table */
+!   for (psi = *(pshash_getbucket (pid)); psi != NO_PIDSTAT; psi = bgpids.storage[psi].bucket_next)
+!     if (bgpids.storage[psi].pid == pid)
+!       break;
+  
+    if (psi == NO_PIDSTAT)
+--- b/870,883 ----
+  
+    /* Search chain using hash to find bucket in pidstat_table */
+!   for (orig_psi = psi = *(pshash_getbucket (pid)); psi != NO_PIDSTAT; psi = bgpids.storage[psi].bucket_next)
+!     {
+!       if (bgpids.storage[psi].pid == pid)
+! 	break;
+!       if (orig_psi == bgpids.storage[psi].bucket_next)	/* catch reported bug */
+! 	{
+! 	  internal_warning ("bgp_delete: LOOP: psi (%d) == storage[psi].bucket_next", psi);
+! 	  return 0;
+! 	}
+!     }
+  
+    if (psi == NO_PIDSTAT)
+***************
+*** 905,909 ****
+       pid_t pid;
+  {
+!   ps_index_t psi;
+  
+    if (bgpids.storage == 0 || bgpids.nalloc == 0 || bgpids.npid == 0)
+--- b/917,921 ----
+       pid_t pid;
+  {
+!   ps_index_t psi, orig_psi;
+  
+    if (bgpids.storage == 0 || bgpids.nalloc == 0 || bgpids.npid == 0)
+***************
+*** 911,917 ****
+  
+    /* Search chain using hash to find bucket in pidstat_table */
+!   for (psi = *(pshash_getbucket (pid)); psi != NO_PIDSTAT; psi = bgpids.storage[psi].bucket_next)
+!     if (bgpids.storage[psi].pid == pid)
+!       return (bgpids.storage[psi].status);
+  
+    return -1;
+--- b/923,936 ----
+  
+    /* Search chain using hash to find bucket in pidstat_table */
+!   for (orig_psi = psi = *(pshash_getbucket (pid)); psi != NO_PIDSTAT; psi = bgpids.storage[psi].bucket_next)
+!     {
+!       if (bgpids.storage[psi].pid == pid)
+! 	return (bgpids.storage[psi].status);
+!       if (orig_psi == bgpids.storage[psi].bucket_next)	/* catch reported bug */
+! 	{
+! 	  internal_warning ("bgp_search: LOOP: psi (%d) == storage[psi].bucket_next", psi);
+! 	  return -1;
+! 	}
+!     }
+  
+    return -1;
+*** bash-4.4/patchlevel.h	2016-06-22 14:51:03.000000000 -0400
+--- b/patchlevel.h	2016-10-01 11:01:28.000000000 -0400
+***************
+*** 26,30 ****
+     looks for to find the patch level (for the sccs version string). */
+  
+! #define PATCHLEVEL 19
+  
+  #endif /* _PATCHLEVEL_H_ */
+--- b/26,30 ----
+     looks for to find the patch level (for the sccs version string). */
+  
+! #define PATCHLEVEL 20
+  
+  #endif /* _PATCHLEVEL_H_ */
diff --git a/package/bash/0003-bash44-021.patch b/package/bash/0003-bash44-021.patch
new file mode 100644
index 0000000000..52f3b75eac
--- /dev/null
+++ b/package/bash/0003-bash44-021.patch
@@ -0,0 +1,61 @@
+From https://ftp.gnu.org/gnu/bash/bash-4.4-patches/bash44-021
+
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+
+			     BASH PATCH REPORT
+			     =================
+
+Bash-Release:	4.4
+Patch-ID:	bash44-021
+
+Bug-Reported-by:	werner at suse.de
+Bug-Reference-ID:	<201803281402.w2SE2VOa000476@noether.suse.de>
+Bug-Reference-URL:	http://lists.gnu.org/archive/html/bug-bash/2018-03/msg00196.html
+
+Bug-Description:
+
+A SIGINT received inside a SIGINT trap handler can possibly cause the
+shell to loop.
+
+Patch (apply with `patch -p0'):
+
+*** bash-20180329/jobs.c	2018-02-11 18:07:22.000000000 -0500
+--- b/jobs.c	2018-04-02 14:24:21.000000000 -0400
+***************
+*** 2690,2694 ****
+    if (job_control == 0 || (subshell_environment&SUBSHELL_COMSUB))
+      {
+!       old_sigint_handler = set_signal_handler (SIGINT, wait_sigint_handler);
+        waiting_for_child = 0;
+        if (old_sigint_handler == SIG_IGN)
+--- b/2690,2704 ----
+    if (job_control == 0 || (subshell_environment&SUBSHELL_COMSUB))
+      {
+!       SigHandler *temp_sigint_handler;
+! 
+!       temp_sigint_handler = set_signal_handler (SIGINT, wait_sigint_handler);
+!       if (temp_sigint_handler == wait_sigint_handler)
+!         {
+! #if defined (DEBUG)
+! 	  internal_warning ("wait_for: recursively setting old_sigint_handler to wait_sigint_handler: running_trap = %d", running_trap);
+! #endif
+!         }
+!       else
+! 	old_sigint_handler = temp_sigint_handler;
+        waiting_for_child = 0;
+        if (old_sigint_handler == SIG_IGN)
+*** bash-4.4/patchlevel.h	2016-06-22 14:51:03.000000000 -0400
+--- b/patchlevel.h	2016-10-01 11:01:28.000000000 -0400
+***************
+*** 26,30 ****
+     looks for to find the patch level (for the sccs version string). */
+  
+! #define PATCHLEVEL 20
+  
+  #endif /* _PATCHLEVEL_H_ */
+--- b/26,30 ----
+     looks for to find the patch level (for the sccs version string). */
+  
+! #define PATCHLEVEL 21
+  
+  #endif /* _PATCHLEVEL_H_ */
diff --git a/package/bash/0004-bash44-022.patch b/package/bash/0004-bash44-022.patch
new file mode 100644
index 0000000000..0db270a17e
--- /dev/null
+++ b/package/bash/0004-bash44-022.patch
@@ -0,0 +1,65 @@
+From https://ftp.gnu.org/gnu/bash/bash-4.4-patches/bash44-022
+
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+
+			     BASH PATCH REPORT
+			     =================
+
+Bash-Release:	4.4
+Patch-ID:	bash44-022
+
+Bug-Reported-by:	Nuzhna Pomoshch <nuzhna_pomoshch@yahoo.com>
+Bug-Reference-ID:	<1317167476.1492079.1495999776464@mail.yahoo.com>
+Bug-Reference-URL:	https://lists.gnu.org/archive/html/bug-readline/2017-05/msg00005.html
+
+Bug-Description:
+
+There are cases where a failing readline command (e.g., delete-char at the end
+of a line) can cause a multi-character key sequence to `back up' and attempt
+to re-read some of the characters in the sequence.
+
+Patch (apply with `patch -p0'):
+
+*** bash-4.4-patched/lib/readline/readline.c	2016-04-20 15:53:52.000000000 -0400
+--- b/lib/readline/readline.c	2018-05-26 17:19:00.000000000 -0400
+***************
+*** 1058,1062 ****
+  	r = _rl_dispatch (ANYOTHERKEY, m);
+      }
+!   else if (r && map[ANYOTHERKEY].function)
+      {
+        /* We didn't match (r is probably -1), so return something to
+--- b/1056,1060 ----
+  	r = _rl_dispatch (ANYOTHERKEY, m);
+      }
+!   else if (r < 0 && map[ANYOTHERKEY].function)
+      {
+        /* We didn't match (r is probably -1), so return something to
+***************
+*** 1070,1074 ****
+        return -2;
+      }
+!   else if (r && got_subseq)
+      {
+        /* OK, back up the chain. */
+--- b/1068,1072 ----
+        return -2;
+      }
+!   else if (r < 0 && got_subseq)		/* XXX */
+      {
+        /* OK, back up the chain. */
+*** bash-4.4/patchlevel.h	2016-06-22 14:51:03.000000000 -0400
+--- b/patchlevel.h	2016-10-01 11:01:28.000000000 -0400
+***************
+*** 26,30 ****
+     looks for to find the patch level (for the sccs version string). */
+  
+! #define PATCHLEVEL 21
+  
+  #endif /* _PATCHLEVEL_H_ */
+--- b/26,30 ----
+     looks for to find the patch level (for the sccs version string). */
+  
+! #define PATCHLEVEL 22
+  
+  #endif /* _PATCHLEVEL_H_ */
diff --git a/package/bash/0005-bash44-023.patch b/package/bash/0005-bash44-023.patch
new file mode 100644
index 0000000000..05b18902a5
--- /dev/null
+++ b/package/bash/0005-bash44-023.patch
@@ -0,0 +1,56 @@
+From https://ftp.gnu.org/gnu/bash/bash-4.4-patches/bash44-023
+
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+
+			     BASH PATCH REPORT
+			     =================
+
+Bash-Release:	4.4
+Patch-ID:	bash44-023
+
+Bug-Reported-by:	Martijn Dekker <martijn@inlv.org>
+Bug-Reference-ID:	<5326d6b9-2625-1d32-3e6e-ad1d15462c09@inlv.org>
+Bug-Reference-URL:	http://lists.gnu.org/archive/html/bug-bash/2016-11/msg00041.html
+
+Bug-Description:
+
+When sourcing a file from an interactive shell, setting the SIGINT handler
+to the default and typing ^C will cause the shell to exit.
+
+Patch (apply with `patch -p0'):
+
+*** bash-4.4-patched/builtins/trap.def	2016-01-25 13:32:38.000000000 -0500
+--- b/builtins/trap.def	2016-11-06 12:04:35.000000000 -0500
+***************
+*** 99,102 ****
+--- b/99,103 ----
+  
+  extern int posixly_correct, subshell_environment;
++ extern int sourcelevel, running_trap;
+  
+  int
+***************
+*** 213,216 ****
+--- b/214,220 ----
+  			if (interactive)
+  			  set_signal_handler (SIGINT, sigint_sighandler);
++ 			/* special cases for interactive == 0 */
++ 			else if (interactive_shell && (sourcelevel||running_trap))
++ 			  set_signal_handler (SIGINT, sigint_sighandler);
+  			else
+  			  set_signal_handler (SIGINT, termsig_sighandler);
+*** bash-4.4/patchlevel.h	2016-06-22 14:51:03.000000000 -0400
+--- b/patchlevel.h	2016-10-01 11:01:28.000000000 -0400
+***************
+*** 26,30 ****
+     looks for to find the patch level (for the sccs version string). */
+  
+! #define PATCHLEVEL 22
+  
+  #endif /* _PATCHLEVEL_H_ */
+--- b/26,30 ----
+     looks for to find the patch level (for the sccs version string). */
+  
+! #define PATCHLEVEL 23
+  
+  #endif /* _PATCHLEVEL_H_ */
