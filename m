From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 18 Mar 2015 14:39:10 +0100
Subject: [Buildroot] [git commit] readline: bump to patchlevel 8
Message-ID: <20150318133914.1BF2E81865@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b817e8c58117402561a61c0d749337f415c9c985
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes various issues, one in particular reported by Pascal de Bruijn on
IRC where bash won't timeout when using readline as in 'read -e -t 10',
which should escape back to shell when left alone for 10 seconds.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...01-curses-link.patch => 0000-curses-link.patch} |    0
 package/readline/0001-patchlevel-1.patch           |   47 ++++++++++++++
 package/readline/0002-patchlevel-2.patch           |   48 ++++++++++++++
 package/readline/0003-patchlevel-3.patch           |   51 +++++++++++++++
 package/readline/0004-patchlevel-4.patch           |   49 ++++++++++++++
 package/readline/0005-patchlevel-5.patch           |   62 ++++++++++++++++++
 package/readline/0006-patchlevel-6.patch           |   67 ++++++++++++++++++++
 package/readline/0007-patchlevel-7.patch           |   51 +++++++++++++++
 package/readline/0008-patchlevel-8.patch           |   51 +++++++++++++++
 9 files changed, 426 insertions(+), 0 deletions(-)

diff --git a/package/readline/0001-curses-link.patch b/package/readline/0000-curses-link.patch
similarity index 100%
rename from package/readline/0001-curses-link.patch
rename to package/readline/0000-curses-link.patch
diff --git a/package/readline/0001-patchlevel-1.patch b/package/readline/0001-patchlevel-1.patch
new file mode 100644
index 0000000..8593073
--- /dev/null
+++ b/package/readline/0001-patchlevel-1.patch
@@ -0,0 +1,47 @@
+From http://ftp.gnu.org/pub/gnu/readline/readline-6.3-patches/readline63-001
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+
+			   READLINE PATCH REPORT
+			   =====================
+
+Readline-Release: 6.3
+Patch-ID: readline63-001
+
+Bug-Reported-by:	Daan van Rossum <daan@flash.uchicago.edu>
+Bug-Reference-ID:	<20140307072523.GA14250@flash.uchicago.edu>
+Bug-Reference-URL:	
+
+Bug-Description:
+
+The `.' command in vi mode cannot undo multi-key commands beginning with
+`c', `d', and `y' (command plus motion specifier).
+
+Patch (apply with `patch -p0'):
+
+*** a/readline-6.3/readline.c	2013-10-28 14:58:06.000000000 -0400
+--- b/readline.c	2014-03-07 15:20:33.000000000 -0500
+***************
+*** 965,969 ****
+    if (rl_editing_mode == vi_mode && _rl_keymap == vi_movement_keymap &&
+        key != ANYOTHERKEY &&
+!       rl_key_sequence_length == 1 &&	/* XXX */
+        _rl_vi_textmod_command (key))
+      _rl_vi_set_last (key, rl_numeric_arg, rl_arg_sign);
+--- 965,969 ----
+    if (rl_editing_mode == vi_mode && _rl_keymap == vi_movement_keymap &&
+        key != ANYOTHERKEY &&
+!       _rl_dispatching_keymap == vi_movement_keymap &&
+        _rl_vi_textmod_command (key))
+      _rl_vi_set_last (key, rl_numeric_arg, rl_arg_sign);
+*** a/readline-6.3/patchlevel	2013-11-15 08:11:11.000000000 -0500
+--- b/patchlevel	2014-03-21 08:28:40.000000000 -0400
+***************
+*** 1,3 ****
+  # Do not edit -- exists only for use by patch
+  
+! 5
+--- 1,3 ----
+  # Do not edit -- exists only for use by patch
+  
+! 1
diff --git a/package/readline/0002-patchlevel-2.patch b/package/readline/0002-patchlevel-2.patch
new file mode 100644
index 0000000..a8a94e0
--- /dev/null
+++ b/package/readline/0002-patchlevel-2.patch
@@ -0,0 +1,48 @@
+From http://ftp.gnu.org/pub/gnu/readline/readline-6.3-patches/readline63-002
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+
+			   READLINE PATCH REPORT
+			   =====================
+
+Readline-Release: 6.3
+Patch-ID: readline63-002
+
+Bug-Reported-by:	Anatol Pomozov <anatol.pomozov@gmail.com>
+Bug-Reference-ID:	<CAOMFOmXy3mT2So5GQ5F-smCVArQuAeBwZ2QKzgCtMeXJoDeYOQ@mail.gmail.com>
+Bug-Reference-URL:	http://lists.gnu.org/archive/html/bug-readline/2014-03/msg00010.html
+
+Bug-Description:
+
+When in callback mode, some readline commands can cause readline to seg
+fault by passing invalid contexts to callback functions.
+
+Patch (apply with `patch -p0'):
+
+*** a/readline-6.3/readline.c	2013-10-28 14:58:06.000000000 -0400
+--- b/readline.c	2014-03-10 14:15:02.000000000 -0400
+***************
+*** 745,749 ****
+  
+    RL_CHECK_SIGNALS ();
+!   if (r == 0)			/* success! */
+      {
+        _rl_keyseq_chain_dispose ();
+--- 745,750 ----
+  
+    RL_CHECK_SIGNALS ();
+!   /* We only treat values < 0 specially to simulate recursion. */
+!   if (r >= 0 || (r == -1 && (cxt->flags & KSEQ_SUBSEQ) == 0))	/* success! or failure! */
+      {
+        _rl_keyseq_chain_dispose ();
+*** a/readline-6.3/patchlevel	2013-11-15 08:11:11.000000000 -0500
+--- b/patchlevel	2014-03-21 08:28:40.000000000 -0400
+***************
+*** 1,3 ****
+  # Do not edit -- exists only for use by patch
+  
+! 1
+--- 1,3 ----
+  # Do not edit -- exists only for use by patch
+  
+! 2
diff --git a/package/readline/0003-patchlevel-3.patch b/package/readline/0003-patchlevel-3.patch
new file mode 100644
index 0000000..195ed55
--- /dev/null
+++ b/package/readline/0003-patchlevel-3.patch
@@ -0,0 +1,51 @@
+From http://ftp.gnu.org/pub/gnu/readline/readline-6.3-patches/readline63-003
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+
+			   READLINE PATCH REPORT
+			   =====================
+
+Readline-Release: 6.3
+Patch-ID: readline63-003
+
+Bug-Reported-by:
+Bug-Reference-ID:
+Bug-Reference-URL:
+
+Bug-Description:
+
+There are debugging functions in the readline release that are theoretically
+exploitable as security problems.  They are not public functions, but have
+global linkage.
+
+Patch (apply with `patch -p0'):
+
+*** a/readline-6.3/util.c	2013-09-02 13:36:12.000000000 -0400
+--- b/util.c	2014-03-20 10:25:53.000000000 -0400
+***************
+*** 477,480 ****
+--- 479,483 ----
+  }
+  
++ #if defined (DEBUG)
+  #if defined (USE_VARARGS)
+  static FILE *_rl_tracefp;
+***************
+*** 539,542 ****
+--- 542,546 ----
+  }
+  #endif
++ #endif /* DEBUG */
+  
+  
+*** a/readline-6.3/patchlevel	2013-11-15 08:11:11.000000000 -0500
+--- b/patchlevel	2014-03-21 08:28:40.000000000 -0400
+***************
+*** 1,3 ****
+  # Do not edit -- exists only for use by patch
+  
+! 2
+--- 1,3 ----
+  # Do not edit -- exists only for use by patch
+  
+! 3
diff --git a/package/readline/0004-patchlevel-4.patch b/package/readline/0004-patchlevel-4.patch
new file mode 100644
index 0000000..86ab3d5
--- /dev/null
+++ b/package/readline/0004-patchlevel-4.patch
@@ -0,0 +1,49 @@
+From http://ftp.gnu.org/pub/gnu/readline/readline-6.3-patches/readline63-004
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+
+			   READLINE PATCH REPORT
+			   =====================
+
+Readline-Release: 6.3
+Patch-ID: readline63-004
+
+Bug-Reported-by:	Egmont Koblinger <egmont@gmail.com>
+Bug-Reference-ID:	<CAGWcZk+bU5Jo1M+tutGvL-250UBE9DXjpeJVofYJSFcqFEVfMg@mail.gmail.com>
+Bug-Reference-URL:	http://lists.gnu.org/archive/html/bug-bash/2014-03/msg00153.html
+
+Bug-Description:
+
+The signal handling changes to bash and readline (to avoid running any code
+in a signal handler context) cause the cursor to be placed on the wrong
+line of a multi-line command after a ^C interrupts editing.
+
+Patch (apply with `patch -p0'):
+
+*** a/readline-6.3-patched/display.c	2013-12-27 13:10:56.000000000 -0500
+--- b/display.c	2014-03-27 11:52:45.000000000 -0400
+***************
+*** 2678,2682 ****
+    if (_rl_echoing_p)
+      {
+!       _rl_move_vert (_rl_vis_botlin);
+        _rl_vis_botlin = 0;
+        fflush (rl_outstream);
+--- 2678,2683 ----
+    if (_rl_echoing_p)
+      {
+!       if (_rl_vis_botlin > 0)	/* minor optimization plus bug fix */
+! 	_rl_move_vert (_rl_vis_botlin);
+        _rl_vis_botlin = 0;
+        fflush (rl_outstream);
+*** a/readline-6.3/patchlevel	2013-11-15 08:11:11.000000000 -0500
+--- b/patchlevel	2014-03-21 08:28:40.000000000 -0400
+***************
+*** 1,3 ****
+  # Do not edit -- exists only for use by patch
+  
+! 3
+--- 1,3 ----
+  # Do not edit -- exists only for use by patch
+  
+! 4
diff --git a/package/readline/0005-patchlevel-5.patch b/package/readline/0005-patchlevel-5.patch
new file mode 100644
index 0000000..6e73c7f
--- /dev/null
+++ b/package/readline/0005-patchlevel-5.patch
@@ -0,0 +1,62 @@
+From http://ftp.gnu.org/pub/gnu/readline/readline-6.3-patches/readline63-005
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+
+			   READLINE PATCH REPORT
+			   =====================
+
+Readline-Release: 6.3
+Patch-ID: readline63-005
+
+Bug-Reported-by:	Juergen Daubert <jue@jue.li>
+Bug-Reference-ID:	<20140303180430.GA7346@jue.netz>
+Bug-Reference-URL:	http://lists.gnu.org/archive/html/bug-readline/2014-03/msg00002.html
+
+Bug-Description:
+
+There are still applications using the deprecated Function/VFunction/etc.
+typedefs in rltypedefs.h.  This patch restores the typedefs, but attempts
+to mark them as deprecated using gcc/clang attributes.  Thanks to Max Horn
+for the suggestion.
+
+Patch (apply with `patch -p0'):
+
+*** a/readline-6.3-patched/rltypedefs.h	2011-03-26 14:53:31.000000000 -0400
+--- b/rltypedefs.h	2014-04-10 11:30:45.000000000 -0400
+***************
+*** 27,30 ****
+--- 27,49 ----
+  #endif
+  
++ /* Old-style, attempt to mark as deprecated in some way people will notice. */
++ 
++ #if !defined (_FUNCTION_DEF)
++ #  define _FUNCTION_DEF
++ 
++ #if defined(__GNUC__) || defined(__clang__)
++ typedef int Function () __attribute__ ((deprecated));
++ typedef void VFunction () __attribute__ ((deprecated));
++ typedef char *CPFunction () __attribute__ ((deprecated));
++ typedef char **CPPFunction () __attribute__ ((deprecated));
++ #else
++ typedef int Function ();
++ typedef void VFunction ();
++ typedef char *CPFunction ();
++ typedef char **CPPFunction ();
++ #endif
++ 
++ #endif /* _FUNCTION_DEF */
++ 
+  /* New style. */
+  
+*** a/readline-6.3/patchlevel	2013-11-15 08:11:11.000000000 -0500
+--- b/patchlevel	2014-03-21 08:28:40.000000000 -0400
+***************
+*** 1,3 ****
+  # Do not edit -- exists only for use by patch
+  
+! 4
+--- 1,3 ----
+  # Do not edit -- exists only for use by patch
+  
+! 5
diff --git a/package/readline/0006-patchlevel-6.patch b/package/readline/0006-patchlevel-6.patch
new file mode 100644
index 0000000..b28b53c
--- /dev/null
+++ b/package/readline/0006-patchlevel-6.patch
@@ -0,0 +1,67 @@
+From http://ftp.gnu.org/pub/gnu/readline/readline-6.3-patches/readline63-006
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+
+			   READLINE PATCH REPORT
+			   =====================
+
+Readline-Release: 6.3
+Patch-ID: readline63-006
+
+Bug-Reported-by:	<Trond.Endrestol@ximalas.info>
+Bug-Reference-ID:	<alpine.BSF.2.03.1404192114310.1973@enterprise.ximalas.info>
+Bug-Reference-URL:	http://lists.gnu.org/archive/html/bug-bash/2014-04/msg00069.html
+
+Bug-Description:
+
+Using reverse-i-search when horizontal scrolling is enabled does not redisplay
+the entire line containing the successful search results.
+
+Patch (apply with `patch -p0'):
+
+*** a/readline-6.3-patched/display.c	2014-04-08 18:19:36.000000000 -0400
+--- b/display.c	2014-04-20 18:32:52.000000000 -0400
+***************
+*** 1638,1642 ****
+       the spot of first difference is before the end of the invisible chars,
+       lendiff needs to be adjusted. */
+!   if (current_line == 0 && !_rl_horizontal_scroll_mode &&
+        current_invis_chars != visible_wrap_offset)
+      {
+--- 1638,1642 ----
+       the spot of first difference is before the end of the invisible chars,
+       lendiff needs to be adjusted. */
+!   if (current_line == 0 && /* !_rl_horizontal_scroll_mode && */
+        current_invis_chars != visible_wrap_offset)
+      {
+***************
+*** 1826,1831 ****
+  		_rl_last_c_pos += bytes_to_insert;
+  
+  	      if (_rl_horizontal_scroll_mode && ((oe-old) > (ne-new)))
+! 		goto clear_rest_of_line;
+  	    }
+  	}
+--- 1826,1836 ----
+  		_rl_last_c_pos += bytes_to_insert;
+  
++ 	      /* XXX - we only want to do this if we are at the end of the line
++ 		 so we move there with _rl_move_cursor_relative */
+  	      if (_rl_horizontal_scroll_mode && ((oe-old) > (ne-new)))
+! 		{
+! 		  _rl_move_cursor_relative (ne-new, new);
+! 		  goto clear_rest_of_line;
+! 		}
+  	    }
+  	}
+*** a/readline-6.3/patchlevel	2013-11-15 08:11:11.000000000 -0500
+--- b/patchlevel	2014-03-21 08:28:40.000000000 -0400
+***************
+*** 1,3 ****
+  # Do not edit -- exists only for use by patch
+  
+! 5
+--- 1,3 ----
+  # Do not edit -- exists only for use by patch
+  
+! 6
diff --git a/package/readline/0007-patchlevel-7.patch b/package/readline/0007-patchlevel-7.patch
new file mode 100644
index 0000000..4c6f59c
--- /dev/null
+++ b/package/readline/0007-patchlevel-7.patch
@@ -0,0 +1,51 @@
+From http://ftp.gnu.org/pub/gnu/readline/readline-6.3-patches/readline63-007
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+
+			   READLINE PATCH REPORT
+			   =====================
+
+Readline-Release: 6.3
+Patch-ID: readline63-007
+
+Bug-Reported-by:	John Lenton
+Bug-Reference-ID:
+Bug-Reference-URL:	https://bugs.launchpad.net/ubuntu/+source/bash/+bug/1317476
+
+Bug-Description:
+
+Readline should allow SIGALRM and SIGVTALRM (if available) to `interrupt'
+rl_getc and cause the handler to run when not in a signal handling context.
+
+Patch (apply with `patch -p0'):
+
+*** a/readline-6.3-patched/input.c	2014-01-10 15:07:08.000000000 -0500
+--- b/input.c	2014-05-30 16:20:56.000000000 -0400
+***************
+*** 535,540 ****
+--- 538,551 ----
+        else if (_rl_caught_signal == SIGHUP || _rl_caught_signal == SIGTERM)
+  	return (RL_ISSTATE (RL_STATE_READCMD) ? READERR : EOF);
++       /* keyboard-generated signals of interest */
+        else if (_rl_caught_signal == SIGINT || _rl_caught_signal == SIGQUIT)
+          RL_CHECK_SIGNALS ();
++       /* non-keyboard-generated signals of interest */
++       else if (_rl_caught_signal == SIGALRM
++ #if defined (SIGVTALRM)
++ 		|| _rl_caught_signal == SIGVTALRM
++ #endif
++ 	      )
++         RL_CHECK_SIGNALS ();
+  
+        if (rl_signal_event_hook)
+*** a/readline-6.3/patchlevel	2013-11-15 08:11:11.000000000 -0500
+--- b/patchlevel	2014-03-21 08:28:40.000000000 -0400
+***************
+*** 1,3 ****
+  # Do not edit -- exists only for use by patch
+  
+! 6
+--- 1,3 ----
+  # Do not edit -- exists only for use by patch
+  
+! 7
diff --git a/package/readline/0008-patchlevel-8.patch b/package/readline/0008-patchlevel-8.patch
new file mode 100644
index 0000000..412ba35
--- /dev/null
+++ b/package/readline/0008-patchlevel-8.patch
@@ -0,0 +1,51 @@
+From http://ftp.gnu.org/pub/gnu/readline/readline-6.3-patches/readline63-008
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+
+			   READLINE PATCH REPORT
+			   =====================
+
+Readline-Release: 6.3
+Patch-ID: readline63-008
+
+Bug-Reported-by:	Jared Yanovich <slovichon@gmail.com>
+Bug-Reference-ID:	<20140625225019.GJ17044@nightderanger.psc.edu>
+Bug-Reference-URL:	http://lists.gnu.org/archive/html/bug-bash/2014-06/msg00070.html
+
+Bug-Description:
+
+When the readline `revert-all-at-newline' option is set, pressing newline
+when the current line is one retrieved from history results in a double free
+and a segmentation fault.
+
+Patch (apply with `patch -p0'):
+
+*** a/readline-6.3-patched/misc.c	2012-09-01 18:03:11.000000000 -0400
+--- b/misc.c	2014-06-30 13:41:19.000000000 -0400
+***************
+*** 462,465 ****
+--- 462,466 ----
+  	  /* Set up rl_line_buffer and other variables from history entry */
+  	  rl_replace_from_history (entry, 0);	/* entry->line is now current */
++ 	  entry->data = 0;			/* entry->data is now current undo list */
+  	  /* Undo all changes to this history entry */
+  	  while (rl_undo_list)
+***************
+*** 469,473 ****
+  	  FREE (entry->line);
+  	  entry->line = savestring (rl_line_buffer);
+- 	  entry->data = 0;
+  	}
+        entry = previous_history ();
+--- 470,473 ----
+*** a/readline-6.3/patchlevel	2013-11-15 08:11:11.000000000 -0500
+--- b/patchlevel	2014-03-21 08:28:40.000000000 -0400
+***************
+*** 1,3 ****
+  # Do not edit -- exists only for use by patch
+  
+! 7
+--- 1,3 ----
+  # Do not edit -- exists only for use by patch
+  
+! 8
