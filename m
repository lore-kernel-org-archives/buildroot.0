From: Pascal de Bruijn <p.debruijn@unilogic.nl>
Date: Tue,  7 Jan 2020 11:24:21 +0100
Subject: [Buildroot] [PATCH] package/bash: update to version 5.0.11
Message-ID: <20200107102421.11432-1-p.debruijn@unilogic.nl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Pascal de Bruijn <p.debruijn@unilogic.nl>
---
 package/bash/0001-bash44-019.patch |  54 ---------
 package/bash/0001-bash50-001.patch | 166 ++++++++++++++++++++++++++
 package/bash/0002-bash44-020.patch | 181 ----------------------------
 package/bash/0002-bash50-002.patch | 113 ++++++++++++++++++
 package/bash/0003-bash44-021.patch |  61 ----------
 package/bash/0003-bash50-003.patch | 239 +++++++++++++++++++++++++++++++++++++
 package/bash/0004-bash44-022.patch |  65 ----------
 package/bash/0004-bash50-004.patch |  53 ++++++++
 package/bash/0005-bash44-023.patch |  56 ---------
 package/bash/0005-bash50-005.patch | 110 +++++++++++++++++
 package/bash/0006-bash50-006.patch |  47 ++++++++
 package/bash/0007-bash50-007.patch |  62 ++++++++++
 package/bash/0008-bash50-008.patch |  68 +++++++++++
 package/bash/0009-bash50-009.patch |  42 +++++++
 package/bash/0010-bash50-010.patch | 172 ++++++++++++++++++++++++++
 package/bash/0011-bash50-011.patch |  59 +++++++++
 package/bash/bash.hash             |   2 +-
 package/bash/bash.mk               |   2 +-
 18 files changed, 1133 insertions(+), 419 deletions(-)
 delete mode 100644 package/bash/0001-bash44-019.patch
 create mode 100644 package/bash/0001-bash50-001.patch
 delete mode 100644 package/bash/0002-bash44-020.patch
 create mode 100644 package/bash/0002-bash50-002.patch
 delete mode 100644 package/bash/0003-bash44-021.patch
 create mode 100644 package/bash/0003-bash50-003.patch
 delete mode 100644 package/bash/0004-bash44-022.patch
 create mode 100644 package/bash/0004-bash50-004.patch
 delete mode 100644 package/bash/0005-bash44-023.patch
 create mode 100644 package/bash/0005-bash50-005.patch
 create mode 100644 package/bash/0006-bash50-006.patch
 create mode 100644 package/bash/0007-bash50-007.patch
 create mode 100644 package/bash/0008-bash50-008.patch
 create mode 100644 package/bash/0009-bash50-009.patch
 create mode 100644 package/bash/0010-bash50-010.patch
 create mode 100644 package/bash/0011-bash50-011.patch

diff --git a/package/bash/0001-bash44-019.patch b/package/bash/0001-bash44-019.patch
deleted file mode 100644
index b3d2f33..0000000
--- a/package/bash/0001-bash44-019.patch
+++ /dev/null
@@ -1,54 +0,0 @@
-From https://ftp.gnu.org/gnu/bash/bash-4.4-patches/bash44-019
-
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
-
-			     BASH PATCH REPORT
-			     =================
-
-Bash-Release:	4.4
-Patch-ID:	bash44-019
-
-Bug-Reported-by:	Kieran Grant <kieran.thehacker.grant@gmail.com>
-Bug-Reference-ID:	<ec9071ae-efb1-9e09-5d03-e905daf2835c@gmail.com>
-Bug-Reference-URL:	http://lists.gnu.org/archive/html/bug-bash/2018-02/msg00002.html
-
-Bug-Description:
-
-With certain values for PS1, especially those that wrap onto three or more
-lines, readline will miscalculate the number of invisible characters,
-leading to crashes and core dumps.
-
-Patch (apply with `patch -p0'):
-
-*** bash-4.4.18/lib/readline/display.c	2016-07-28 14:49:33.000000000 -0400
---- b/lib/readline/display.c	2018-02-03 19:19:35.000000000 -0500
-***************
-*** 772,776 ****
-        wadjust = (newlines == 0)
-  		  ? prompt_invis_chars_first_line
-! 		  : ((newlines == prompt_lines_estimate) ? wrap_offset : prompt_invis_chars_first_line);
-  
-        /* fix from Darin Johnson <darin@acuson.com> for prompt string with
---- b/788,794 ----
-        wadjust = (newlines == 0)
-  		  ? prompt_invis_chars_first_line
-! 		  : ((newlines == prompt_lines_estimate)
-! 		  	? (wrap_offset - prompt_invis_chars_first_line)
-! 		  	: 0);
-  
-        /* fix from Darin Johnson <darin@acuson.com> for prompt string with
-*** bash-4.4/patchlevel.h	2016-06-22 14:51:03.000000000 -0400
---- b/patchlevel.h	2016-10-01 11:01:28.000000000 -0400
-***************
-*** 26,30 ****
-     looks for to find the patch level (for the sccs version string). */
-  
-! #define PATCHLEVEL 18
-  
-  #endif /* _PATCHLEVEL_H_ */
---- b/26,30 ----
-     looks for to find the patch level (for the sccs version string). */
-  
-! #define PATCHLEVEL 19
-  
-  #endif /* _PATCHLEVEL_H_ */
diff --git a/package/bash/0001-bash50-001.patch b/package/bash/0001-bash50-001.patch
new file mode 100644
index 0000000..5412b5f
--- /dev/null
+++ b/package/bash/0001-bash50-001.patch
@@ -0,0 +1,166 @@
+			     BASH PATCH REPORT
+			     =================
+
+Bash-Release:	5.0
+Patch-ID:	bash50-001
+
+Bug-Reported-by:	axel at freakout.de
+Bug-Reference-ID:	<201901082050.x08KoShS006731@bongo.freakout.de>
+Bug-Reference-URL:	http://lists.gnu.org/archive/html/bug-bash/2019-01/msg00079.html
+
+Bug-Description:
+
+Under certain circumstances, the glob expansion code did not remove
+backslashes escaping characters in directory names (or portions of a
+pattern preceding a slash).
+
+Patch (apply with `patch -p0'):
+
+*** ../bash-5.0/bashline.c	2018-11-27 13:20:16.000000000 -0500
+--- b/bashline.c	2019-01-16 16:06:03.000000000 -0500
+***************
+*** 232,235 ****
+--- 232,236 ----
+  static int bash_possible_command_completions __P((int, int));
+  
++ static int completion_glob_pattern __P((char *));
+  static char *glob_complete_word __P((const char *, int));
+  static int bash_glob_completion_internal __P((int));
+***************
+*** 1742,1746 ****
+    /* This could be a globbing pattern, so try to expand it using pathname
+       expansion. */
+!   if (!matches && glob_pattern_p (text))
+      {
+        matches = rl_completion_matches (text, glob_complete_word);
+--- 1743,1747 ----
+    /* This could be a globbing pattern, so try to expand it using pathname
+       expansion. */
+!   if (!matches && completion_glob_pattern ((char *)text))
+      {
+        matches = rl_completion_matches (text, glob_complete_word);
+***************
+*** 1851,1855 ****
+  	}
+  
+!       globpat = glob_pattern_p (hint_text);
+  
+        /* If this is an absolute program name, do not check it against
+--- 1852,1856 ----
+  	}
+  
+!       globpat = completion_glob_pattern ((char *)hint_text);
+  
+        /* If this is an absolute program name, do not check it against
+***************
+*** 3714,3717 ****
+--- 3715,3773 ----
+  }
+  
++ static int
++ completion_glob_pattern (string)
++      char *string;
++ {
++   register int c;
++   char *send;
++   int open;
++ 
++   DECLARE_MBSTATE;
++ 
++   open = 0;
++   send = string + strlen (string);
++ 
++   while (c = *string++)
++     {
++       switch (c)
++ 	{
++ 	case '?':
++ 	case '*':
++ 	  return (1);
++ 
++ 	case '[':
++ 	  open++;
++ 	  continue;
++ 
++ 	case ']':
++ 	  if (open)
++ 	    return (1);
++ 	  continue;
++ 
++ 	case '+':
++ 	case '@':
++ 	case '!':
++ 	  if (*string == '(')	/*)*/
++ 	    return (1);
++ 	  continue;
++ 
++ 	case '\\':
++ 	  if (*string == 0)
++ 	    return (0);	 	  
++ 	}
++ 
++       /* Advance one fewer byte than an entire multibyte character to
++ 	 account for the auto-increment in the loop above. */
++ #ifdef HANDLE_MULTIBYTE
++       string--;
++       ADVANCE_CHAR_P (string, send - string);
++       string++;
++ #else
++       ADVANCE_CHAR_P (string, send - string);
++ #endif
++     }
++   return (0);
++ }
++ 
+  static char *globtext;
+  static char *globorig;
+***************
+*** 3878,3882 ****
+      }      
+  
+!   if (t && glob_pattern_p (t) == 0)
+      rl_explicit_arg = 1;	/* XXX - force glob_complete_word to append `*' */
+    FREE (t);
+--- 3934,3938 ----
+      }      
+  
+!   if (t && completion_glob_pattern (t) == 0)
+      rl_explicit_arg = 1;	/* XXX - force glob_complete_word to append `*' */
+    FREE (t);
+*** ../bash-5.0/lib/glob/glob_loop.c	2018-12-31 13:35:15.000000000 -0500
+--- b/lib/glob/glob_loop.c	2019-01-09 09:44:36.000000000 -0500
+***************
+*** 55,59 ****
+  
+        case L('\\'):
+- #if 0
+  	/* Don't let the pattern end in a backslash (GMATCH returns no match
+  	   if the pattern ends in a backslash anyway), but otherwise return 1,
+--- 55,58 ----
+***************
+*** 61,69 ****
+  	   and it can be removed. */
+  	return (*p != L('\0'));
+- #else
+- 	/* The pattern may not end with a backslash. */
+- 	if (*p++ == L('\0'))
+- 	  return 0;
+- #endif
+        }
+  
+--- 60,63 ----
+*** ../bash-5.0/patchlevel.h	2016-06-22 14:51:03.000000000 -0400
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
diff --git a/package/bash/0002-bash44-020.patch b/package/bash/0002-bash44-020.patch
deleted file mode 100644
index 20f3abb..0000000
--- a/package/bash/0002-bash44-020.patch
+++ /dev/null
@@ -1,181 +0,0 @@
-From https://ftp.gnu.org/gnu/bash/bash-4.4-patches/bash44-020
-
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
-
-			     BASH PATCH REPORT
-			     =================
-
-Bash-Release:	4.4
-Patch-ID:	bash44-020
-
-Bug-Reported-by:	Graham Northup <northug@clarkson.edu>
-Bug-Reference-ID:	<537530c3-61f0-349b-9de6-fa4e2487f428@clarkson.edu>
-Bug-Reference-URL:	http://lists.gnu.org/archive/html/bug-bash/2017-02/msg00025.html
-
-Bug-Description:
-
-In circumstances involving long-running scripts that create and reap many
-processes, it is possible for the hash table bash uses to store exit
-statuses from asynchronous processes to develop loops. This patch fixes
-the loop causes and adds code to detect any future loops.
-
-Patch (apply with `patch -p0'):
-
-*** bash-4.4-patched/jobs.c	2016-11-11 13:42:55.000000000 -0500
---- b/jobs.c	2017-02-22 15:16:28.000000000 -0500
-***************
-*** 813,818 ****
-    struct pidstat *ps;
-  
-!   bucket = pshash_getbucket (pid);
-!   psi = bgp_getindex ();
-    ps = &bgpids.storage[psi];
-  
---- b/796,815 ----
-    struct pidstat *ps;
-  
-!   /* bucket == existing chain of pids hashing to same value
-!      psi = where were going to put this pid/status */
-! 
-!   bucket = pshash_getbucket (pid);	/* index into pidstat_table */
-!   psi = bgp_getindex ();		/* bgpids.head, index into storage */
-! 
-!   /* XXX - what if psi == *bucket? */
-!   if (psi == *bucket)
-!     {
-! #ifdef DEBUG
-!       internal_warning ("hashed pid %d (pid %d) collides with bgpids.head, skipping", psi, pid);
-! #endif
-!       bgpids.storage[psi].pid = NO_PID;		/* make sure */
-!       psi = bgp_getindex ();			/* skip to next one */
-!     }
-! 
-    ps = &bgpids.storage[psi];
-  
-***************
-*** 842,845 ****
---- b/839,843 ----
-  {
-    struct pidstat *ps;
-+   ps_index_t *bucket;
-  
-    ps = &bgpids.storage[psi];
-***************
-*** 847,856 ****
-      return;
-  
-!   if (ps->bucket_next != NO_PID)
-      bgpids.storage[ps->bucket_next].bucket_prev = ps->bucket_prev;
-!   if (ps->bucket_prev != NO_PID)
-      bgpids.storage[ps->bucket_prev].bucket_next = ps->bucket_next;
-    else
-!     *(pshash_getbucket (ps->pid)) = ps->bucket_next;
-  }
-  
---- b/845,861 ----
-      return;
-  
-!   if (ps->bucket_next != NO_PIDSTAT)
-      bgpids.storage[ps->bucket_next].bucket_prev = ps->bucket_prev;
-!   if (ps->bucket_prev != NO_PIDSTAT)
-      bgpids.storage[ps->bucket_prev].bucket_next = ps->bucket_next;
-    else
-!     {
-!       bucket = pshash_getbucket (ps->pid);
-!       *bucket = ps->bucket_next;	/* deleting chain head in hash table */
-!     }
-! 
-!   /* clear out this cell, just in case */
-!   ps->pid = NO_PID;
-!   ps->bucket_next = ps->bucket_prev = NO_PIDSTAT;
-  }
-  
-***************
-*** 859,863 ****
-       pid_t pid;
-  {
-!   ps_index_t psi;
-  
-    if (bgpids.storage == 0 || bgpids.nalloc == 0 || bgpids.npid == 0)
---- b/864,868 ----
-       pid_t pid;
-  {
-!   ps_index_t psi, orig_psi;
-  
-    if (bgpids.storage == 0 || bgpids.nalloc == 0 || bgpids.npid == 0)
-***************
-*** 865,871 ****
-  
-    /* Search chain using hash to find bucket in pidstat_table */
-!   for (psi = *(pshash_getbucket (pid)); psi != NO_PIDSTAT; psi = bgpids.storage[psi].bucket_next)
-!     if (bgpids.storage[psi].pid == pid)
-!       break;
-  
-    if (psi == NO_PIDSTAT)
---- b/870,883 ----
-  
-    /* Search chain using hash to find bucket in pidstat_table */
-!   for (orig_psi = psi = *(pshash_getbucket (pid)); psi != NO_PIDSTAT; psi = bgpids.storage[psi].bucket_next)
-!     {
-!       if (bgpids.storage[psi].pid == pid)
-! 	break;
-!       if (orig_psi == bgpids.storage[psi].bucket_next)	/* catch reported bug */
-! 	{
-! 	  internal_warning ("bgp_delete: LOOP: psi (%d) == storage[psi].bucket_next", psi);
-! 	  return 0;
-! 	}
-!     }
-  
-    if (psi == NO_PIDSTAT)
-***************
-*** 905,909 ****
-       pid_t pid;
-  {
-!   ps_index_t psi;
-  
-    if (bgpids.storage == 0 || bgpids.nalloc == 0 || bgpids.npid == 0)
---- b/917,921 ----
-       pid_t pid;
-  {
-!   ps_index_t psi, orig_psi;
-  
-    if (bgpids.storage == 0 || bgpids.nalloc == 0 || bgpids.npid == 0)
-***************
-*** 911,917 ****
-  
-    /* Search chain using hash to find bucket in pidstat_table */
-!   for (psi = *(pshash_getbucket (pid)); psi != NO_PIDSTAT; psi = bgpids.storage[psi].bucket_next)
-!     if (bgpids.storage[psi].pid == pid)
-!       return (bgpids.storage[psi].status);
-  
-    return -1;
---- b/923,936 ----
-  
-    /* Search chain using hash to find bucket in pidstat_table */
-!   for (orig_psi = psi = *(pshash_getbucket (pid)); psi != NO_PIDSTAT; psi = bgpids.storage[psi].bucket_next)
-!     {
-!       if (bgpids.storage[psi].pid == pid)
-! 	return (bgpids.storage[psi].status);
-!       if (orig_psi == bgpids.storage[psi].bucket_next)	/* catch reported bug */
-! 	{
-! 	  internal_warning ("bgp_search: LOOP: psi (%d) == storage[psi].bucket_next", psi);
-! 	  return -1;
-! 	}
-!     }
-  
-    return -1;
-*** bash-4.4/patchlevel.h	2016-06-22 14:51:03.000000000 -0400
---- b/patchlevel.h	2016-10-01 11:01:28.000000000 -0400
-***************
-*** 26,30 ****
-     looks for to find the patch level (for the sccs version string). */
-  
-! #define PATCHLEVEL 19
-  
-  #endif /* _PATCHLEVEL_H_ */
---- b/26,30 ----
-     looks for to find the patch level (for the sccs version string). */
-  
-! #define PATCHLEVEL 20
-  
-  #endif /* _PATCHLEVEL_H_ */
diff --git a/package/bash/0002-bash50-002.patch b/package/bash/0002-bash50-002.patch
new file mode 100644
index 0000000..7c1d0c9
--- /dev/null
+++ b/package/bash/0002-bash50-002.patch
@@ -0,0 +1,113 @@
+			     BASH PATCH REPORT
+			     =================
+
+Bash-Release:	5.0
+Patch-ID:	bash50-002
+
+Bug-Reported-by:	Ante Peric <synthmeat@gmail.com>
+Bug-Reference-ID:	<B7E3B567-2467-4F7B-B6B9-CA4E75A9C93F@gmail.com>
+Bug-Reference-URL:	http://lists.gnu.org/archive/html/bug-bash/2019-01/msg00095.html
+
+Bug-Description:
+
+When an alias value ends with an unquoted literal tab (not part of a quoted
+string or comment), alias expansion cannot correctly detect the end of the
+alias value after expanding it.
+
+Patch (apply with `patch -p0'):
+
+*** ../bash-5.0/parser.h	2018-12-28 19:11:18.000000000 -0500
+--- b/parser.h	2019-01-11 15:13:03.000000000 -0500
+***************
+*** 48,51 ****
+--- 48,52 ----
+  #define PST_REDIRLIST	0x080000	/* parsing a list of redirections preceding a simple command name */
+  #define PST_COMMENT	0x100000	/* parsing a shell comment; used by aliases */
++ #define PST_ENDALIAS	0x200000	/* just finished expanding and consuming an alias */
+  
+  /* Definition of the delimiter stack.  Needed by parse.y and bashhist.c. */
+*** ../bash-5.0/parse.y	2019-01-02 13:57:34.000000000 -0500
+--- b/parse.y	2019-01-14 08:23:31.000000000 -0500
+***************
+*** 2558,2567 ****
+        pushed_string_list->flags != PSH_DPAREN &&
+        (parser_state & PST_COMMENT) == 0 &&
+        shell_input_line_index > 0 &&
+!       shell_input_line[shell_input_line_index-1] != ' ' &&
+        shell_input_line[shell_input_line_index-1] != '\n' &&
+        shellmeta (shell_input_line[shell_input_line_index-1]) == 0 &&
+        (current_delimiter (dstack) != '\'' && current_delimiter (dstack) != '"'))
+      {
+        return ' ';	/* END_ALIAS */
+      }
+--- 2558,2569 ----
+        pushed_string_list->flags != PSH_DPAREN &&
+        (parser_state & PST_COMMENT) == 0 &&
++       (parser_state & PST_ENDALIAS) == 0 &&	/* only once */
+        shell_input_line_index > 0 &&
+!       shellblank (shell_input_line[shell_input_line_index-1]) == 0 &&
+        shell_input_line[shell_input_line_index-1] != '\n' &&
+        shellmeta (shell_input_line[shell_input_line_index-1]) == 0 &&
+        (current_delimiter (dstack) != '\'' && current_delimiter (dstack) != '"'))
+      {
++       parser_state |= PST_ENDALIAS;
+        return ' ';	/* END_ALIAS */
+      }
+***************
+*** 2572,2575 ****
+--- 2574,2578 ----
+    if (uc == 0 && pushed_string_list && pushed_string_list->flags != PSH_SOURCE)
+      {
++       parser_state &= ~PST_ENDALIAS;
+        pop_string ();
+        uc = shell_input_line[shell_input_line_index];
+*** ../bash-5.0/y.tab.c	2019-01-02 13:57:43.000000000 -0500
+--- b/y.tab.c	2019-01-14 08:39:23.000000000 -0500
+***************
+*** 4874,4883 ****
+        pushed_string_list->flags != PSH_DPAREN &&
+        (parser_state & PST_COMMENT) == 0 &&
+        shell_input_line_index > 0 &&
+!       shell_input_line[shell_input_line_index-1] != ' ' &&
+        shell_input_line[shell_input_line_index-1] != '\n' &&
+        shellmeta (shell_input_line[shell_input_line_index-1]) == 0 &&
+        (current_delimiter (dstack) != '\'' && current_delimiter (dstack) != '"'))
+      {
+        return ' ';	/* END_ALIAS */
+      }
+--- 4874,4885 ----
+        pushed_string_list->flags != PSH_DPAREN &&
+        (parser_state & PST_COMMENT) == 0 &&
++       (parser_state & PST_ENDALIAS) == 0 &&	/* only once */
+        shell_input_line_index > 0 &&
+!       shellblank (shell_input_line[shell_input_line_index-1]) == 0 &&
+        shell_input_line[shell_input_line_index-1] != '\n' &&
+        shellmeta (shell_input_line[shell_input_line_index-1]) == 0 &&
+        (current_delimiter (dstack) != '\'' && current_delimiter (dstack) != '"'))
+      {
++       parser_state |= PST_ENDALIAS;
+        return ' ';	/* END_ALIAS */
+      }
+***************
+*** 4888,4891 ****
+--- 4890,4894 ----
+    if (uc == 0 && pushed_string_list && pushed_string_list->flags != PSH_SOURCE)
+      {
++       parser_state &= ~PST_ENDALIAS;
+        pop_string ();
+        uc = shell_input_line[shell_input_line_index];
+*** ../bash-5.0/patchlevel.h	2016-06-22 14:51:03.000000000 -0400
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
diff --git a/package/bash/0003-bash44-021.patch b/package/bash/0003-bash44-021.patch
deleted file mode 100644
index 52f3b75..0000000
--- a/package/bash/0003-bash44-021.patch
+++ /dev/null
@@ -1,61 +0,0 @@
-From https://ftp.gnu.org/gnu/bash/bash-4.4-patches/bash44-021
-
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
-
-			     BASH PATCH REPORT
-			     =================
-
-Bash-Release:	4.4
-Patch-ID:	bash44-021
-
-Bug-Reported-by:	werner at suse.de
-Bug-Reference-ID:	<201803281402.w2SE2VOa000476@noether.suse.de>
-Bug-Reference-URL:	http://lists.gnu.org/archive/html/bug-bash/2018-03/msg00196.html
-
-Bug-Description:
-
-A SIGINT received inside a SIGINT trap handler can possibly cause the
-shell to loop.
-
-Patch (apply with `patch -p0'):
-
-*** bash-20180329/jobs.c	2018-02-11 18:07:22.000000000 -0500
---- b/jobs.c	2018-04-02 14:24:21.000000000 -0400
-***************
-*** 2690,2694 ****
-    if (job_control == 0 || (subshell_environment&SUBSHELL_COMSUB))
-      {
-!       old_sigint_handler = set_signal_handler (SIGINT, wait_sigint_handler);
-        waiting_for_child = 0;
-        if (old_sigint_handler == SIG_IGN)
---- b/2690,2704 ----
-    if (job_control == 0 || (subshell_environment&SUBSHELL_COMSUB))
-      {
-!       SigHandler *temp_sigint_handler;
-! 
-!       temp_sigint_handler = set_signal_handler (SIGINT, wait_sigint_handler);
-!       if (temp_sigint_handler == wait_sigint_handler)
-!         {
-! #if defined (DEBUG)
-! 	  internal_warning ("wait_for: recursively setting old_sigint_handler to wait_sigint_handler: running_trap = %d", running_trap);
-! #endif
-!         }
-!       else
-! 	old_sigint_handler = temp_sigint_handler;
-        waiting_for_child = 0;
-        if (old_sigint_handler == SIG_IGN)
-*** bash-4.4/patchlevel.h	2016-06-22 14:51:03.000000000 -0400
---- b/patchlevel.h	2016-10-01 11:01:28.000000000 -0400
-***************
-*** 26,30 ****
-     looks for to find the patch level (for the sccs version string). */
-  
-! #define PATCHLEVEL 20
-  
-  #endif /* _PATCHLEVEL_H_ */
---- b/26,30 ----
-     looks for to find the patch level (for the sccs version string). */
-  
-! #define PATCHLEVEL 21
-  
-  #endif /* _PATCHLEVEL_H_ */
diff --git a/package/bash/0003-bash50-003.patch b/package/bash/0003-bash50-003.patch
new file mode 100644
index 0000000..f33ad1a
--- /dev/null
+++ b/package/bash/0003-bash50-003.patch
@@ -0,0 +1,239 @@
+			     BASH PATCH REPORT
+			     =================
+
+Bash-Release:	5.0
+Patch-ID:	bash50-003
+
+Bug-Reported-by:	Andrew Church <achurch+bash@achurch.org>
+Bug-Reference-ID:	<5c534aa2.04371@msgid.achurch.org>
+Bug-Reference-URL:	http://lists.gnu.org/archive/html/bug-bash/2019-01/msg00276.html
+
+Bug-Description:
+
+There are several incompatibilities in how bash-5.0 processes pathname
+expansion (globbing) of filename arguments that have backslashes in the
+directory portion.
+
+Patch (apply with `patch -p0'):
+
+*** ../bash-5.0-patched/lib/glob/glob_loop.c	2019-01-16 16:13:21.000000000 -0500
+--- b/lib/glob/glob_loop.c	2019-02-01 09:45:11.000000000 -0500
+***************
+*** 27,34 ****
+    register const GCHAR *p;
+    register GCHAR c;
+!   int bopen;
+  
+    p = pattern;
+!   bopen = 0;
+  
+    while ((c = *p++) != L('\0'))
+--- 27,34 ----
+    register const GCHAR *p;
+    register GCHAR c;
+!   int bopen, bsquote;
+  
+    p = pattern;
+!   bopen = bsquote = 0;
+  
+    while ((c = *p++) != L('\0'))
+***************
+*** 56,66 ****
+        case L('\\'):
+  	/* Don't let the pattern end in a backslash (GMATCH returns no match
+! 	   if the pattern ends in a backslash anyway), but otherwise return 1,
+! 	   since the matching engine uses backslash as an escape character
+! 	   and it can be removed. */
+! 	return (*p != L('\0'));
+        }
+  
+!   return 0;
+  }
+  
+--- 56,75 ----
+        case L('\\'):
+  	/* Don't let the pattern end in a backslash (GMATCH returns no match
+! 	   if the pattern ends in a backslash anyway), but otherwise note that 
+! 	   we have seen this, since the matching engine uses backslash as an
+! 	   escape character and it can be removed. We return 2 later if we
+! 	   have seen only backslash-escaped characters, so interested callers
+! 	   know they can shortcut and just dequote the pathname. */
+! 	if (*p != L('\0'))
+! 	  {
+! 	    p++;
+! 	    bsquote = 1;
+! 	    continue;
+! 	  }
+! 	else 	/* (*p == L('\0')) */
+! 	  return 0;
+        }
+  
+!   return bsquote ? 2 : 0;
+  }
+  
+*** ../bash-5.0-patched/lib/glob/glob.h	2013-10-28 14:46:12.000000000 -0400
+--- b/lib/glob/glob.h	2019-03-07 11:06:47.000000000 -0500
+***************
+*** 31,34 ****
+--- 31,35 ----
+  #define GX_ADDCURDIR	0x200	/* internal -- add passed directory name */
+  #define GX_GLOBSTAR	0x400	/* turn on special handling of ** */
++ #define GX_RECURSE	0x800	/* internal -- glob_filename called recursively */
+  
+  extern int glob_pattern_p __P((const char *));
+*** ../bash-5.0-patched/lib/glob/glob.c	2018-09-20 10:53:23.000000000 -0400
+--- b/lib/glob/glob.c	2019-03-07 14:23:43.000000000 -0500
+***************
+*** 1062,1066 ****
+    unsigned int directory_len;
+    int free_dirname;			/* flag */
+!   int dflags;
+  
+    result = (char **) malloc (sizeof (char *));
+--- 1078,1082 ----
+    unsigned int directory_len;
+    int free_dirname;			/* flag */
+!   int dflags, hasglob;
+  
+    result = (char **) malloc (sizeof (char *));
+***************
+*** 1111,1117 ****
+      }
+  
+    /* If directory_name contains globbing characters, then we
+!      have to expand the previous levels.  Just recurse. */
+!   if (directory_len > 0 && glob_pattern_p (directory_name))
+      {
+        char **directories, *d, *p;
+--- 1127,1136 ----
+      }
+  
++   hasglob = 0;
+    /* If directory_name contains globbing characters, then we
+!      have to expand the previous levels.  Just recurse.
+!      If glob_pattern_p returns != [0,1] we have a pattern that has backslash
+!      quotes but no unquoted glob pattern characters. We dequote it below. */
+!   if (directory_len > 0 && (hasglob = glob_pattern_p (directory_name)) == 1)
+      {
+        char **directories, *d, *p;
+***************
+*** 1176,1180 ****
+  	d[directory_len - 1] = '\0';
+  
+!       directories = glob_filename (d, dflags);
+  
+        if (free_dirname)
+--- 1195,1199 ----
+  	d[directory_len - 1] = '\0';
+  
+!       directories = glob_filename (d, dflags|GX_RECURSE);
+  
+        if (free_dirname)
+***************
+*** 1333,1336 ****
+--- 1352,1369 ----
+  	  return (NULL);
+  	}
++       /* If we have a directory name with quoted characters, and we are
++ 	 being called recursively to glob the directory portion of a pathname,
++ 	 we need to dequote the directory name before returning it so the
++ 	 caller can read the directory */
++       if (directory_len > 0 && hasglob == 2 && (flags & GX_RECURSE) != 0)
++ 	{
++ 	  dequote_pathname (directory_name);
++ 	  directory_len = strlen (directory_name);
++ 	}
++ 
++       /* We could check whether or not the dequoted directory_name is a
++ 	 directory and return it here, returning the original directory_name
++ 	 if not, but we don't do that yet. I'm not sure it matters. */
++ 
+        /* Handle GX_MARKDIRS here. */
+        result[0] = (char *) malloc (directory_len + 1);
+*** ../bash-5.0-patched/pathexp.c	2018-04-29 17:44:48.000000000 -0400
+--- b/pathexp.c	2019-01-31 20:19:41.000000000 -0500
+***************
+*** 66,74 ****
+    register int c;
+    char *send;
+!   int open;
+  
+    DECLARE_MBSTATE;
+  
+!   open = 0;
+    send = string + strlen (string);
+  
+--- 66,74 ----
+    register int c;
+    char *send;
+!   int open, bsquote;
+  
+    DECLARE_MBSTATE;
+  
+!   open = bsquote = 0;
+    send = string + strlen (string);
+  
+***************
+*** 101,105 ****
+  	   globbing. */
+  	case '\\':
+! 	  return (*string != 0);
+  	 	  
+  	case CTLESC:
+--- 101,112 ----
+  	   globbing. */
+  	case '\\':
+! 	  if (*string != '\0' && *string != '/')
+! 	    {
+! 	      bsquote = 1;
+! 	      string++;
+! 	      continue;
+! 	    }
+! 	  else if (*string == 0)
+! 	    return (0);
+  	 	  
+  	case CTLESC:
+***************
+*** 118,122 ****
+  #endif
+      }
+!   return (0);
+  }
+  
+--- 125,130 ----
+  #endif
+      }
+! 
+!   return (bsquote ? 2 : 0);
+  }
+  
+*** ../bash-5.0-patched/bashline.c	2019-01-16 16:13:21.000000000 -0500
+--- b/bashline.c	2019-02-22 09:29:08.000000000 -0500
+***************
+*** 3753,3757 ****
+  
+  	case '\\':
+! 	  if (*string == 0)
+  	    return (0);	 	  
+  	}
+--- 3766,3770 ----
+  
+  	case '\\':
+! 	  if (*string++ == 0)
+  	    return (0);	 	  
+  	}
+*** ../bash-5.0/patchlevel.h	2016-06-22 14:51:03.000000000 -0400
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
diff --git a/package/bash/0004-bash44-022.patch b/package/bash/0004-bash44-022.patch
deleted file mode 100644
index 0db270a..0000000
--- a/package/bash/0004-bash44-022.patch
+++ /dev/null
@@ -1,65 +0,0 @@
-From https://ftp.gnu.org/gnu/bash/bash-4.4-patches/bash44-022
-
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
-
-			     BASH PATCH REPORT
-			     =================
-
-Bash-Release:	4.4
-Patch-ID:	bash44-022
-
-Bug-Reported-by:	Nuzhna Pomoshch <nuzhna_pomoshch@yahoo.com>
-Bug-Reference-ID:	<1317167476.1492079.1495999776464@mail.yahoo.com>
-Bug-Reference-URL:	https://lists.gnu.org/archive/html/bug-readline/2017-05/msg00005.html
-
-Bug-Description:
-
-There are cases where a failing readline command (e.g., delete-char at the end
-of a line) can cause a multi-character key sequence to `back up' and attempt
-to re-read some of the characters in the sequence.
-
-Patch (apply with `patch -p0'):
-
-*** bash-4.4-patched/lib/readline/readline.c	2016-04-20 15:53:52.000000000 -0400
---- b/lib/readline/readline.c	2018-05-26 17:19:00.000000000 -0400
-***************
-*** 1058,1062 ****
-  	r = _rl_dispatch (ANYOTHERKEY, m);
-      }
-!   else if (r && map[ANYOTHERKEY].function)
-      {
-        /* We didn't match (r is probably -1), so return something to
---- b/1056,1060 ----
-  	r = _rl_dispatch (ANYOTHERKEY, m);
-      }
-!   else if (r < 0 && map[ANYOTHERKEY].function)
-      {
-        /* We didn't match (r is probably -1), so return something to
-***************
-*** 1070,1074 ****
-        return -2;
-      }
-!   else if (r && got_subseq)
-      {
-        /* OK, back up the chain. */
---- b/1068,1072 ----
-        return -2;
-      }
-!   else if (r < 0 && got_subseq)		/* XXX */
-      {
-        /* OK, back up the chain. */
-*** bash-4.4/patchlevel.h	2016-06-22 14:51:03.000000000 -0400
---- b/patchlevel.h	2016-10-01 11:01:28.000000000 -0400
-***************
-*** 26,30 ****
-     looks for to find the patch level (for the sccs version string). */
-  
-! #define PATCHLEVEL 21
-  
-  #endif /* _PATCHLEVEL_H_ */
---- b/26,30 ----
-     looks for to find the patch level (for the sccs version string). */
-  
-! #define PATCHLEVEL 22
-  
-  #endif /* _PATCHLEVEL_H_ */
diff --git a/package/bash/0004-bash50-004.patch b/package/bash/0004-bash50-004.patch
new file mode 100644
index 0000000..d75ade3
--- /dev/null
+++ b/package/bash/0004-bash50-004.patch
@@ -0,0 +1,53 @@
+			     BASH PATCH REPORT
+			     =================
+
+Bash-Release:	5.0
+Patch-ID:	bash50-004
+
+Bug-Reported-by:	Daniel Kahn Gillmor <dkg@fifthhorseman.net>
+Bug-Reference-ID:	<87lg0g8aiw.fsf@fifthhorseman.net>
+Bug-Reference-URL:	http://lists.gnu.org/archive/html/bug-bash/2019-04/msg00076.html
+
+Bug-Description:
+
+In bash-5.0, the `wait' builtin without arguments waits for all children of the
+shell. This includes children it `inherited' at shell invocation time. This
+patch modifies the behavior to not wait for these inherited children, some
+of which might be long-lived.
+
+Patch (apply with `patch -p0'):
+
+*** ../bash-5.0-patched/jobs.c	2018-12-06 11:44:34.000000000 -0500
+--- b/jobs.c	2019-04-12 15:15:10.000000000 -0400
+***************
+*** 2489,2496 ****
+    wait_procsubs ();
+    reap_procsubs ();
+! #if 1
+    /* We don't want to wait indefinitely if we have stopped children. */
+-   /* XXX - should add a loop that goes through the list of process
+-      substitutions and waits for each proc in turn before this code. */
+    if (any_stopped == 0)
+      {
+--- 2490,2495 ----
+    wait_procsubs ();
+    reap_procsubs ();
+! #if 0
+    /* We don't want to wait indefinitely if we have stopped children. */
+    if (any_stopped == 0)
+      {
+*** ../bash-5.0/patchlevel.h	2016-06-22 14:51:03.000000000 -0400
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
diff --git a/package/bash/0005-bash44-023.patch b/package/bash/0005-bash44-023.patch
deleted file mode 100644
index 05b1890..0000000
--- a/package/bash/0005-bash44-023.patch
+++ /dev/null
@@ -1,56 +0,0 @@
-From https://ftp.gnu.org/gnu/bash/bash-4.4-patches/bash44-023
-
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
-
-			     BASH PATCH REPORT
-			     =================
-
-Bash-Release:	4.4
-Patch-ID:	bash44-023
-
-Bug-Reported-by:	Martijn Dekker <martijn@inlv.org>
-Bug-Reference-ID:	<5326d6b9-2625-1d32-3e6e-ad1d15462c09@inlv.org>
-Bug-Reference-URL:	http://lists.gnu.org/archive/html/bug-bash/2016-11/msg00041.html
-
-Bug-Description:
-
-When sourcing a file from an interactive shell, setting the SIGINT handler
-to the default and typing ^C will cause the shell to exit.
-
-Patch (apply with `patch -p0'):
-
-*** bash-4.4-patched/builtins/trap.def	2016-01-25 13:32:38.000000000 -0500
---- b/builtins/trap.def	2016-11-06 12:04:35.000000000 -0500
-***************
-*** 99,102 ****
---- b/99,103 ----
-  
-  extern int posixly_correct, subshell_environment;
-+ extern int sourcelevel, running_trap;
-  
-  int
-***************
-*** 213,216 ****
---- b/214,220 ----
-  			if (interactive)
-  			  set_signal_handler (SIGINT, sigint_sighandler);
-+ 			/* special cases for interactive == 0 */
-+ 			else if (interactive_shell && (sourcelevel||running_trap))
-+ 			  set_signal_handler (SIGINT, sigint_sighandler);
-  			else
-  			  set_signal_handler (SIGINT, termsig_sighandler);
-*** bash-4.4/patchlevel.h	2016-06-22 14:51:03.000000000 -0400
---- b/patchlevel.h	2016-10-01 11:01:28.000000000 -0400
-***************
-*** 26,30 ****
-     looks for to find the patch level (for the sccs version string). */
-  
-! #define PATCHLEVEL 22
-  
-  #endif /* _PATCHLEVEL_H_ */
---- b/26,30 ----
-     looks for to find the patch level (for the sccs version string). */
-  
-! #define PATCHLEVEL 23
-  
-  #endif /* _PATCHLEVEL_H_ */
diff --git a/package/bash/0005-bash50-005.patch b/package/bash/0005-bash50-005.patch
new file mode 100644
index 0000000..569e1ae
--- /dev/null
+++ b/package/bash/0005-bash50-005.patch
@@ -0,0 +1,110 @@
+			     BASH PATCH REPORT
+			     =================
+
+Bash-Release:	5.0
+Patch-ID:	bash50-005
+
+Bug-Reported-by:	Brad Spencer <bspencer@blackberry.com>
+Bug-Reference-ID:	<1b993ff2-ce4f-662a-6be4-393457362e47@blackberry.com>
+Bug-Reference-URL:	http://lists.gnu.org/archive/html/bug-bash/2019-01/msg00250.html
+
+Bug-Description:
+
+In certain cases, bash optimizes out a fork() call too early and prevents
+traps from running.
+
+Patch (apply with `patch -p0'):
+
+*** ../bash-5.0-patched/command.h	2018-07-20 21:16:31.000000000 -0400
+--- b/command.h	2019-02-20 11:09:36.000000000 -0500
+***************
+*** 187,190 ****
+--- 188,192 ----
+  #define CMD_LASTPIPE	    0x2000
+  #define CMD_STDPATH	    0x4000	/* use standard path for command lookup */
++ #define CMD_TRY_OPTIMIZING  0x8000	/* try to optimize this simple command */
+  
+  /* What a command looks like. */
+*** ../bash-5.0-patched/builtins/evalstring.c	2018-12-26 11:19:21.000000000 -0500
+--- b/builtins/evalstring.c	2019-01-29 14:15:19.000000000 -0500
+***************
+*** 101,104 ****
+--- 101,113 ----
+  }
+  
++ int
++ can_optimize_connection (command)
++      COMMAND *command;
++ {
++   return (*bash_input.location.string == '\0' &&
++ 	  (command->value.Connection->connector == AND_AND || command->value.Connection->connector == OR_OR || command->value.Connection->connector == ';') &&
++ 	  command->value.Connection->second->type == cm_simple);
++ }
++ 
+  void
+  optimize_fork (command)
+***************
+*** 106,110 ****
+  {
+    if (command->type == cm_connection &&
+!       (command->value.Connection->connector == AND_AND || command->value.Connection->connector == OR_OR) &&
+        should_suppress_fork (command->value.Connection->second))
+      {
+--- 115,120 ----
+  {
+    if (command->type == cm_connection &&
+!       (command->value.Connection->connector == AND_AND || command->value.Connection->connector == OR_OR || command->value.Connection->connector == ';') &&
+!       (command->value.Connection->second->flags & CMD_TRY_OPTIMIZING) &&
+        should_suppress_fork (command->value.Connection->second))
+      {
+***************
+*** 413,418 ****
+  		  command->value.Simple->flags |= CMD_NO_FORK;
+  		}
+! 	      else if (command->type == cm_connection)
+! 		optimize_fork (command);
+  #endif /* ONESHOT */
+  
+--- 423,438 ----
+  		  command->value.Simple->flags |= CMD_NO_FORK;
+  		}
+! 
+! 	      /* Can't optimize forks out here execept for simple commands.
+! 		 This knows that the parser sets up commands as left-side heavy
+! 		 (&& and || are left-associative) and after the single parse,
+! 		 if we are at the end of the command string, the last in a
+! 		 series of connection commands is
+! 		 command->value.Connection->second. */
+! 	      else if (command->type == cm_connection && can_optimize_connection (command))
+! 		{
+! 		  command->value.Connection->second->flags |= CMD_TRY_OPTIMIZING;
+! 		  command->value.Connection->second->value.Simple->flags |= CMD_TRY_OPTIMIZING;
+! 		}
+  #endif /* ONESHOT */
+  
+*** ../bash-5.0-patched/execute_cmd.c	2018-12-05 09:05:14.000000000 -0500
+--- b/execute_cmd.c	2019-01-25 15:59:00.000000000 -0500
+***************
+*** 2768,2771 ****
+--- 2768,2773 ----
+  	   (exec_result != EXECUTION_SUCCESS)))
+  	{
++ 	  optimize_fork (command);
++ 
+  	  second = command->value.Connection->second;
+  	  if (ignore_return && second)
+*** ../bash-5.0/patchlevel.h	2016-06-22 14:51:03.000000000 -0400
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
diff --git a/package/bash/0006-bash50-006.patch b/package/bash/0006-bash50-006.patch
new file mode 100644
index 0000000..d70b4d1
--- /dev/null
+++ b/package/bash/0006-bash50-006.patch
@@ -0,0 +1,47 @@
+			     BASH PATCH REPORT
+			     =================
+
+Bash-Release:	5.0
+Patch-ID:	bash50-006
+
+Bug-Reported-by:	Tomas Mozes <hydrapolic@gmail.com>
+Bug-Reference-ID:	<CAG6MAzQumLU2vhnmr1UrYAUQAFW5Yo8hfM_sEibX9RJQWJkRrA@mail.gmail.com>
+Bug-Reference-URL:	http://lists.gnu.org/archive/html/bug-bash/2019-03/msg00037.html
+
+Bug-Description:
+
+Bash-5.0 did not build successfully if SYSLOG_HISTORY was defined without
+also defining SYSLOG_SHOPT.
+
+Patch (apply with `patch -p0'):
+
+*** ../bash-5.0-patched/builtins/shopt.def	2018-10-05 14:49:02.000000000 -0400
+--- b/builtins/shopt.def	2019-01-23 09:55:22.000000000 -0500
+***************
+*** 123,127 ****
+  #endif
+  
+! #if defined (SYSLOG_HISTORY) && defined (SYSLOG_SHOPT)
+  extern int syslog_history;
+  #endif
+--- 123,127 ----
+  #endif
+  
+! #if defined (SYSLOG_HISTORY)
+  extern int syslog_history;
+  #endif
+*** ../bash-5.0/patchlevel.h	2016-06-22 14:51:03.000000000 -0400
+--- b/patchlevel.h	2016-10-01 11:01:28.000000000 -0400
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
diff --git a/package/bash/0007-bash50-007.patch b/package/bash/0007-bash50-007.patch
new file mode 100644
index 0000000..afc5bd7
--- /dev/null
+++ b/package/bash/0007-bash50-007.patch
@@ -0,0 +1,62 @@
+			     BASH PATCH REPORT
+			     =================
+
+Bash-Release:	5.0
+Patch-ID:	bash50-007
+
+Bug-Reported-by:	Grisha Levit <grishalevit@gmail.com>
+Bug-Reference-ID:	<CAMu=BroHapG1AS3xB5SQaCX2XKu=-E2Ob9uW6LNuHvd=YohrDw@mail.gmail.com>
+Bug-Reference-URL:	http://lists.gnu.org/archive/html/bug-bash/2019-02/msg00067.html
+
+Bug-Description:
+
+Running `exec' when job control was disabled, even temporarily, but after it
+had been initialized, could leave the terminal in the wrong process group for
+the executed process.
+
+Patch (apply with `patch -p0'):
+
+*** ../bash-5.0-patched/jobs.c	2018-12-06 11:44:34.000000000 -0500
+--- b/jobs.c	2019-04-12 15:15:10.000000000 -0400
+***************
+*** 4838,4850 ****
+  {
+    if (job_control)
+!     {
+!       terminate_stopped_jobs ();
+  
+!       if (original_pgrp >= 0)
+! 	give_terminal_to (original_pgrp, 1);
+!     }
+  
+!   if (original_pgrp >= 0)
+!     setpgid (0, original_pgrp);
+  }
+  
+--- 4838,4848 ----
+  {
+    if (job_control)
+!     terminate_stopped_jobs ();
+  
+!   if (original_pgrp >= 0 && terminal_pgrp != original_pgrp)
+!     give_terminal_to (original_pgrp, 1);
+  
+!   if (original_pgrp >= 0 && setpgid (0, original_pgrp) == 0)
+!     shell_pgrp = original_pgrp;
+  }
+  
+*** ../bash-5.0/patchlevel.h	2016-06-22 14:51:03.000000000 -0400
+--- b/patchlevel.h	2016-10-01 11:01:28.000000000 -0400
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
diff --git a/package/bash/0008-bash50-008.patch b/package/bash/0008-bash50-008.patch
new file mode 100644
index 0000000..70b6174
--- /dev/null
+++ b/package/bash/0008-bash50-008.patch
@@ -0,0 +1,68 @@
+			     BASH PATCH REPORT
+			     =================
+
+Bash-Release:	5.0
+Patch-ID:	bash50-008
+
+Bug-Reported-by:	Michael Albinus <michael.albinus@gmx.de>
+Bug-Reference-ID:	<87bm36k3kz.fsf@gmx.de>
+Bug-Reference-URL:	https://lists.gnu.org/archive/html/bug-bash/2019-02/msg00111.html
+
+Bug-Description:
+
+When HISTSIZE is set to 0, history expansion can leave the history length
+set to an incorrect value, leading to subsequent attempts to access invalid
+memory.
+
+Patch (apply with `patch -p0'):
+
+*** ../bash-5.0-patched/bashhist.c	2018-07-05 22:41:14.000000000 -0400
+--- b/bashhist.c	2019-02-20 16:20:04.000000000 -0500
+***************
+*** 561,573 ****
+    if (!history_expansion_inhibited && history_expansion && history_expansion_p (line))
+      {
+        /* If we are expanding the second or later line of a multi-line
+  	 command, decrease history_length so references to history expansions
+  	 in these lines refer to the previous history entry and not the
+  	 current command. */
+        if (history_length > 0 && command_oriented_history && current_command_first_line_saved && current_command_line_count > 1)
+          history_length--;
+        expanded = history_expand (line, &history_value);
+        if (history_length >= 0 && command_oriented_history && current_command_first_line_saved && current_command_line_count > 1)
+!         history_length++;
+  
+        if (expanded)
+--- 561,576 ----
+    if (!history_expansion_inhibited && history_expansion && history_expansion_p (line))
+      {
++       int old_len;
++ 
+        /* If we are expanding the second or later line of a multi-line
+  	 command, decrease history_length so references to history expansions
+  	 in these lines refer to the previous history entry and not the
+  	 current command. */
++       old_len = history_length;
+        if (history_length > 0 && command_oriented_history && current_command_first_line_saved && current_command_line_count > 1)
+          history_length--;
+        expanded = history_expand (line, &history_value);
+        if (history_length >= 0 && command_oriented_history && current_command_first_line_saved && current_command_line_count > 1)
+!         history_length = old_len;
+  
+        if (expanded)
+
+*** ../bash-5.0/patchlevel.h	2016-06-22 14:51:03.000000000 -0400
+--- b/patchlevel.h	2016-10-01 11:01:28.000000000 -0400
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
diff --git a/package/bash/0009-bash50-009.patch b/package/bash/0009-bash50-009.patch
new file mode 100644
index 0000000..5f28c31
--- /dev/null
+++ b/package/bash/0009-bash50-009.patch
@@ -0,0 +1,42 @@
+			     BASH PATCH REPORT
+			     =================
+
+Bash-Release:	5.0
+Patch-ID:	bash50-009
+
+Bug-Reported-by:	chet.ramey at case.edu
+Bug-Reference-ID:
+Bug-Reference-URL:
+
+Bug-Description:
+
+The history file reading code doesn't close the file descriptor open to
+the history file when it encounters a zero-length file.
+
+Patch (apply with `patch -p0'):
+
+*** ../bash-5.0-patched/lib/readline/histfile.c	2018-06-11 09:14:52.000000000 -0400
+--- b/lib/readline/histfile.c	2019-05-16 15:55:57.000000000 -0400
+***************
+*** 306,309 ****
+--- 312,316 ----
+      {
+        free (input);
++       close (file);
+        return 0;	/* don't waste time if we don't have to */
+      }
+*** ../bash-5.0/patchlevel.h	2016-06-22 14:51:03.000000000 -0400
+--- b/patchlevel.h	2016-10-01 11:01:28.000000000 -0400
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
diff --git a/package/bash/0010-bash50-010.patch b/package/bash/0010-bash50-010.patch
new file mode 100644
index 0000000..26868a4
--- /dev/null
+++ b/package/bash/0010-bash50-010.patch
@@ -0,0 +1,172 @@
+			     BASH PATCH REPORT
+			     =================
+
+Bash-Release:	5.0
+Patch-ID:	bash50-010
+
+Bug-Reported-by:	Thorsten Glaser <tg@mirbsd.de>
+Bug-Reference-ID:	<156622962831.19438.16374961114836556294.reportbug@tglase.lan.tarent.de>
+Bug-Reference-URL:	https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=935115
+
+Bug-Description:
+
+Bash-5.0 changed the way assignment statements preceding special builtins
+and shell functions were handled in posix mode. They automatically created
+or modified global variables instead of modifying existing local variables
+as in bash-4.4.
+
+The bash-4.4 posix-mode semantics were buggy, and resulted in creating
+local variables where they were not intended and modifying global variables
+and local variables simultaneously.
+
+The bash-5.0 changes were intended to fix this issue, but did not preserve
+enough backwards compatibility. The posix standard also changed what it
+required in these cases, so bash-5.0 is not bound by the strict conformance
+requirements that existed in previous issues of the standard.
+
+This patch modifies the bash-5.0 posix mode behavior in an effort to restore
+some backwards compatibility and rationalize the behavior in the presence of
+local variables. It
+
+1. Changes the assignment semantics to be more similar to standalone assignment
+   statements: assignments preceding a function call or special builtin while
+   executing in a shell function will modify the value of a local variable
+   with the same name for the duration of the function's execution;
+
+2. Changes assignments preceding shell function calls or special builtins
+   from within a shell function to no longer create or modify global variables
+   in the presence of a local variable with the same name;
+
+3. Assignment statements preceding a shell function call or special builtin
+   at the global scope continue to modify the (global) calling environment,
+   but are unaffected by assignments preceding function calls or special
+   builtins within a function, as described in item 2. This is also similar
+   to the behavior of a standalone assignment statement.
+
+Patch (apply with `patch -p0'):
+
+*** ../bash-5.0-patched/variables.c	2018-12-18 11:07:21.000000000 -0500
+--- b/variables.c	2019-08-22 10:53:44.000000000 -0400
+***************
+*** 4461,4467 ****
+  
+  /* Take a variable from an assignment statement preceding a posix special
+!    builtin (including `return') and create a global variable from it. This
+!    is called from merge_temporary_env, which is only called when in posix
+!    mode. */
+  static void
+  push_posix_temp_var (data)
+--- 4461,4467 ----
+  
+  /* Take a variable from an assignment statement preceding a posix special
+!    builtin (including `return') and create a variable from it as if a
+!    standalone assignment statement had been performed. This is called from
+!    merge_temporary_env, which is only called when in posix mode. */
+  static void
+  push_posix_temp_var (data)
+***************
+*** 4473,4486 ****
+    var = (SHELL_VAR *)data;
+  
+!   binding_table = global_variables->table;
+!   if (binding_table == 0)
+!     binding_table = global_variables->table = hash_create (VARIABLES_HASH_BUCKETS);
+! 
+!   v = bind_variable_internal (var->name, value_cell (var), binding_table, 0, ASS_FORCE|ASS_NOLONGJMP);
+  
+    /* global variables are no longer temporary and don't need propagating. */
+!   var->attributes &= ~(att_tempvar|att_propagate);
+    if (v)
+!     v->attributes |= var->attributes;
+  
+    if (find_special_var (var->name) >= 0)
+--- 4473,4497 ----
+    var = (SHELL_VAR *)data;
+  
+!   /* Just like do_assignment_internal(). This makes assignments preceding
+!      special builtins act like standalone assignment statements when in
+!      posix mode, satisfying the posix requirement that this affect the
+!      "current execution environment." */
+!   v = bind_variable (var->name, value_cell (var), ASS_FORCE|ASS_NOLONGJMP);
+! 
+!   /* If this modifies an existing local variable, v->context will be non-zero.
+!      If it comes back with v->context == 0, we bound at the global context.
+!      Set binding_table appropriately. It doesn't matter whether it's correct
+!      if the variable is local, only that it's not global_variables->table */
+!   binding_table = v->context ? shell_variables->table : global_variables->table;
+  
+    /* global variables are no longer temporary and don't need propagating. */
+!   if (binding_table == global_variables->table)
+!     var->attributes &= ~(att_tempvar|att_propagate);
+! 
+    if (v)
+!     {
+!       v->attributes |= var->attributes;
+!       v->attributes &= ~att_tempvar;	/* not a temp var now */
+!     }
+  
+    if (find_special_var (var->name) >= 0)
+***************
+*** 4576,4587 ****
+  {
+    int i;
+  
+    tempvar_list = strvec_create (HASH_ENTRIES (temporary_env) + 1);
+    tempvar_list[tvlist_ind = 0] = 0;
+!     
+!   hash_flush (temporary_env, pushf);
+!   hash_dispose (temporary_env);
+    temporary_env = (HASH_TABLE *)NULL;
+  
+    tempvar_list[tvlist_ind] = 0;
+  
+--- 4587,4601 ----
+  {
+    int i;
++   HASH_TABLE *disposer;
+  
+    tempvar_list = strvec_create (HASH_ENTRIES (temporary_env) + 1);
+    tempvar_list[tvlist_ind = 0] = 0;
+! 
+!   disposer = temporary_env;
+    temporary_env = (HASH_TABLE *)NULL;
+  
++   hash_flush (disposer, pushf);
++   hash_dispose (disposer);
++ 
+    tempvar_list[tvlist_ind] = 0;
+  
+*** ../bash-5.0-patched/tests/varenv.right	2018-12-17 15:39:48.000000000 -0500
+--- b/tests/varenv.right	2019-08-22 16:05:25.000000000 -0400
+***************
+*** 147,153 ****
+  outside: declare -- var="one"
+  inside: declare -x var="value"
+! outside: declare -x var="value"
+! inside: declare -- var="local"
+! outside: declare -x var="global"
+  foo=<unset> environment foo=
+  foo=foo environment foo=foo
+--- 147,153 ----
+  outside: declare -- var="one"
+  inside: declare -x var="value"
+! outside: declare -- var="outside"
+! inside: declare -x var="global"
+! outside: declare -- var="outside"
+  foo=<unset> environment foo=
+  foo=foo environment foo=foo
+*** ../bash-5.0/patchlevel.h	2016-06-22 14:51:03.000000000 -0400
+--- b/patchlevel.h	2016-10-01 11:01:28.000000000 -0400
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
diff --git a/package/bash/0011-bash50-011.patch b/package/bash/0011-bash50-011.patch
new file mode 100644
index 0000000..ba67de5
--- /dev/null
+++ b/package/bash/0011-bash50-011.patch
@@ -0,0 +1,59 @@
+			     BASH PATCH REPORT
+			     =================
+
+Bash-Release:	5.0
+Patch-ID:	bash50-011
+
+Bug-Reported-by:	Matt Whitlock
+Bug-Reference-ID:	
+Bug-Reference-URL:	https://savannah.gnu.org/support/?109671
+
+Bug-Description:
+
+The conditional command did not perform appropriate quoted null character
+removal on its arguments, causing syntax errors and attempts to stat
+invalid pathnames.
+
+Patch (apply with `patch -p0'):
+
+*** ../bash-5.0-patched/subst.c	2018-12-22 17:43:37.000000000 -0500
+--- b/subst.c	2019-04-14 13:25:41.000000000 -0400
+***************
+*** 3626,3630 ****
+     SPECIAL is 2, this is an rhs argument for the =~ operator, and should
+     be quoted appropriately for regcomp/regexec.  The caller is responsible
+!    for removing the backslashes if the unquoted word is needed later. */   
+  char *
+  cond_expand_word (w, special)
+--- 3642,3648 ----
+     SPECIAL is 2, this is an rhs argument for the =~ operator, and should
+     be quoted appropriately for regcomp/regexec.  The caller is responsible
+!    for removing the backslashes if the unquoted word is needed later. In
+!    any case, since we don't perform word splitting, we need to do quoted
+!    null character removal. */
+  char *
+  cond_expand_word (w, special)
+***************
+*** 3647,3650 ****
+--- 3665,3670 ----
+        if (special == 0)			/* LHS */
+  	{
++ 	  if (l->word)
++ 	    word_list_remove_quoted_nulls (l);
+  	  dequote_list (l);
+  	  r = string_list (l);
+*** ../bash-5.0/patchlevel.h	2016-06-22 14:51:03.000000000 -0400
+--- b/patchlevel.h	2016-10-01 11:01:28.000000000 -0400
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
diff --git a/package/bash/bash.hash b/package/bash/bash.hash
index 951bcf5..9113b16 100644
--- a/package/bash/bash.hash
+++ b/package/bash/bash.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature from
 # http://ftp.gnu.org/gnu/bash/bash-4.4.18.tar.gz.sig
-sha256 604d9eec5e4ed5fd2180ee44dd756ddca92e0b6aa4217bbab2b6227380317f23	bash-4.4.18.tar.gz
+sha256 b4a80f2ac66170b2913efbfb9f2594f1f76c7b1afd11f799e22035d63077fb4d bash-5.0.tar.gz
 sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903	COPYING
diff --git a/package/bash/bash.mk b/package/bash/bash.mk
index 7fb7192..1843862 100644
--- a/package/bash/bash.mk
+++ b/package/bash/bash.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BASH_VERSION = 4.4.18
+BASH_VERSION = 5.0
 BASH_SITE = $(BR2_GNU_MIRROR)/bash
 BASH_DEPENDENCIES = ncurses readline host-bison
 BASH_CONF_OPTS = --with-installed-readline --without-bash-malloc
-- 
2.7.4
