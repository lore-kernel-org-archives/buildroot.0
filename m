From: aldot at uclibc.org <aldot@uclibc.org>
Date: Sun,  7 Oct 2007 11:23:12 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/bash
Message-ID: <20071007182312.7C296A6AC4@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-10-07 11:23:11 -0700 (Sun, 07 Oct 2007)
New Revision: 20197

Log:
- pull patches 018..024


Added:
   trunk/buildroot/package/bash/bash32-018
   trunk/buildroot/package/bash/bash32-019
   trunk/buildroot/package/bash/bash32-020
   trunk/buildroot/package/bash/bash32-021
   trunk/buildroot/package/bash/bash32-022
   trunk/buildroot/package/bash/bash32-023
   trunk/buildroot/package/bash/bash32-024


Changeset:
Added: trunk/buildroot/package/bash/bash32-018
===================================================================
--- trunk/buildroot/package/bash/bash32-018	                        (rev 0)
+++ trunk/buildroot/package/bash/bash32-018	2007-10-07 18:23:11 UTC (rev 20197)
@@ -0,0 +1,98 @@
+			     BASH PATCH REPORT
+			     =================
+
+Bash-Release: 3.2
+Patch-ID: bash32-018
+
+Bug-Reported-by:	osicka at post.cz
+Bug-Reference-ID:	<228.177-19682-1132061412-1179356692@post.cz>
+Bug-Reference-URL:	http://lists.gnu.org/archive/html/bug-bash/2007-05/msg00061.html
+
+Bug-Description:
+
+In certain cases, bash can lose the saved status of a background job, though
+it should still be reported by `wait'.  Bash can also loop infinitely after
+creating and waiting for 4096 jobs.
+
+Patch:
+
+*** ../bash-20070510/jobs.c	Thu Mar  8 16:05:50 2007
+--- bash-3.2/jobs.c	Fri May 18 11:40:14 2007
+***************
+*** 784,792 ****
+      {
+        old = js.j_firstj++;
+        while (js.j_firstj != old)
+  	{
+  	  if (js.j_firstj >= js.j_jobslots)
+  	    js.j_firstj = 0;
+! 	  if (jobs[js.j_firstj])
+  	    break;
+  	  js.j_firstj++;
+--- 784,794 ----
+      {
+        old = js.j_firstj++;
++       if (old >= js.j_jobslots)
++ 	old = js.j_jobslots - 1;
+        while (js.j_firstj != old)
+  	{
+  	  if (js.j_firstj >= js.j_jobslots)
+  	    js.j_firstj = 0;
+! 	  if (jobs[js.j_firstj] || js.j_firstj == old)	/* needed if old == 0 */
+  	    break;
+  	  js.j_firstj++;
+***************
+*** 798,806 ****
+      {
+        old = js.j_lastj--;
+        while (js.j_lastj != old)
+  	{
+  	  if (js.j_lastj < 0)
+  	    js.j_lastj = js.j_jobslots - 1;
+! 	  if (jobs[js.j_lastj])
+  	    break;
+  	  js.j_lastj--;
+--- 800,810 ----
+      {
+        old = js.j_lastj--;
++       if (old < 0)
++ 	old = 0;
+        while (js.j_lastj != old)
+  	{
+  	  if (js.j_lastj < 0)
+  	    js.j_lastj = js.j_jobslots - 1;
+! 	  if (jobs[js.j_lastj] || js.j_lastj == old)	/* needed if old == js.j_jobslots */
+  	    break;
+  	  js.j_lastj--;
+***************
+*** 964,968 ****
+    realloc_jobs_list ();
+  
+!   return (js.j_lastj);
+  }
+  
+--- 975,983 ----
+    realloc_jobs_list ();
+  
+! #ifdef DEBUG
+!   itrace("compact_jobs_list: returning %d", (js.j_lastj || jobs[js.j_lastj]) ? js.j_lastj + 1 : 0);
+! #endif
+! 
+!   return ((js.j_lastj || jobs[js.j_lastj]) ? js.j_lastj + 1 : 0);
+  }
+  
+*** ../bash-3.2/patchlevel.h	Thu Apr 13 08:31:04 2006
+--- bash-3.2/patchlevel.h	Mon Oct 16 14:22:54 2006
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

Added: trunk/buildroot/package/bash/bash32-019
===================================================================
--- trunk/buildroot/package/bash/bash32-019	                        (rev 0)
+++ trunk/buildroot/package/bash/bash32-019	2007-10-07 18:23:11 UTC (rev 20197)
@@ -0,0 +1,343 @@
+			     BASH PATCH REPORT
+			     =================
+
+Bash-Release: 3.2
+Patch-ID: bash32-019
+
+Bug-Reported-by:	Thomas Loeber <ifp@loeber1.de>
+Bug-Reference-ID:	<200703082223.08919.ifp@loeber1.de>
+Bug-Reference-URL:	http://lists.gnu.org/archive/html/bug-bash/2007-03/msg00036.html
+
+Bug-Description:
+
+When rl_read_key returns -1, indicating that bash's controlling terminal
+has been invalidated for some reason (e.g., receiving a SIGHUP), the error
+status was not reported correctly to the caller.  This could cause input
+loops. 
+
+Patch:
+
+*** ../bash-3.2-patched/lib/readline/complete.c	Fri Jul 28 11:35:49 2006
+--- bash-3.2/lib/readline/complete.c	Tue Mar 13 08:50:16 2007
+***************
+*** 429,433 ****
+        if (c == 'n' || c == 'N' || c == RUBOUT)
+  	return (0);
+!       if (c == ABORT_CHAR)
+  	_rl_abort_internal ();
+        if (for_pager && (c == NEWLINE || c == RETURN))
+--- 440,444 ----
+        if (c == 'n' || c == 'N' || c == RUBOUT)
+  	return (0);
+!       if (c == ABORT_CHAR || c < 0)
+  	_rl_abort_internal ();
+        if (for_pager && (c == NEWLINE || c == RETURN))
+*** ../bash-3.2-patched/lib/readline/input.c	Wed Aug 16 15:15:16 2006
+--- bash-3.2/lib/readline/input.c	Wed May  2 16:07:59 2007
+***************
+*** 514,518 ****
+       int size;
+  {
+!   int mb_len = 0;
+    size_t mbchar_bytes_length;
+    wchar_t wc;
+--- 522,526 ----
+       int size;
+  {
+!   int mb_len, c;
+    size_t mbchar_bytes_length;
+    wchar_t wc;
+***************
+*** 521,531 ****
+    memset(&ps, 0, sizeof (mbstate_t));
+    memset(&ps_back, 0, sizeof (mbstate_t));
+!   
+    while (mb_len < size)
+      {
+        RL_SETSTATE(RL_STATE_MOREINPUT);
+!       mbchar[mb_len++] = rl_read_key ();
+        RL_UNSETSTATE(RL_STATE_MOREINPUT);
+  
+        mbchar_bytes_length = mbrtowc (&wc, mbchar, mb_len, &ps);
+        if (mbchar_bytes_length == (size_t)(-1))
+--- 529,545 ----
+    memset(&ps, 0, sizeof (mbstate_t));
+    memset(&ps_back, 0, sizeof (mbstate_t));
+! 
+!   mb_len = 0;  
+    while (mb_len < size)
+      {
+        RL_SETSTATE(RL_STATE_MOREINPUT);
+!       c = rl_read_key ();
+        RL_UNSETSTATE(RL_STATE_MOREINPUT);
+  
++       if (c < 0)
++ 	break;
++ 
++       mbchar[mb_len++] = c;
++ 
+        mbchar_bytes_length = mbrtowc (&wc, mbchar, mb_len, &ps);
+        if (mbchar_bytes_length == (size_t)(-1))
+***************
+*** 565,569 ****
+    c = first;
+    memset (mb, 0, mlen);
+!   for (i = 0; i < mlen; i++)
+      {
+        mb[i] = (char)c;
+--- 579,583 ----
+    c = first;
+    memset (mb, 0, mlen);
+!   for (i = 0; c >= 0 && i < mlen; i++)
+      {
+        mb[i] = (char)c;
+*** ../bash-3.2-patched/lib/readline/isearch.c	Mon Dec 26 17:18:53 2005
+--- bash-3.2/lib/readline/isearch.c	Fri Mar  9 14:30:59 2007
+***************
+*** 328,333 ****
+  
+    f = (rl_command_func_t *)NULL;
+!  
+!  /* Translate the keys we do something with to opcodes. */
+    if (c >= 0 && _rl_keymap[c].type == ISFUNC)
+      {
+--- 328,340 ----
+  
+    f = (rl_command_func_t *)NULL;
+! 
+!   if (c < 0)
+!     {
+!       cxt->sflags |= SF_FAILED;
+!       cxt->history_pos = cxt->last_found_line;
+!       return -1;
+!     }
+! 
+!   /* Translate the keys we do something with to opcodes. */
+    if (c >= 0 && _rl_keymap[c].type == ISFUNC)
+      {
+*** ../bash-3.2-patched/lib/readline/misc.c	Mon Dec 26 17:20:46 2005
+--- bash-3.2/lib/readline/misc.c	Fri Mar  9 14:44:11 2007
+***************
+*** 147,150 ****
+--- 147,152 ----
+  	  rl_clear_message ();
+  	  RL_UNSETSTATE(RL_STATE_NUMERICARG);
++ 	  if (key < 0)
++ 	    return -1;
+  	  return (_rl_dispatch (key, _rl_keymap));
+  	}
+*** ../bash-3.2-patched/lib/readline/readline.c	Wed Aug 16 15:00:36 2006
+--- bash-3.2/lib/readline/readline.c	Fri Mar  9 14:47:24 2007
+***************
+*** 646,649 ****
+--- 669,677 ----
+      {
+        nkey = _rl_subseq_getchar (cxt->okey);
++       if (nkey < 0)
++ 	{
++ 	  _rl_abort_internal ();
++ 	  return -1;
++ 	}
+        r = _rl_dispatch_subseq (nkey, cxt->dmap, cxt->subseq_arg);
+        cxt->flags |= KSEQ_DISPATCHED;
+*** ../bash-3.2-patched/lib/readline/text.c	Fri Jul 28 11:55:27 2006
+--- bash-3.2/lib/readline/text.c	Sun Mar 25 13:41:38 2007
+***************
+*** 858,861 ****
+--- 864,870 ----
+    RL_UNSETSTATE(RL_STATE_MOREINPUT);
+  
++   if (c < 0)
++     return -1;
++ 
+  #if defined (HANDLE_SIGNALS)
+    if (RL_ISSTATE (RL_STATE_CALLBACK) == 0)
+***************
+*** 1521,1524 ****
+--- 1530,1536 ----
+    mb_len = _rl_read_mbchar (mbchar, MB_LEN_MAX);
+  
++   if (mb_len <= 0)
++     return -1;
++ 
+    if (count < 0)
+      return (_rl_char_search_internal (-count, bdir, mbchar, mb_len));
+***************
+*** 1537,1540 ****
+--- 1549,1555 ----
+    RL_UNSETSTATE(RL_STATE_MOREINPUT);
+  
++   if (c < 0)
++     return -1;
++ 
+    if (count < 0)
+      return (_rl_char_search_internal (-count, bdir, c));
+*** ../bash-3.2-patched/lib/readline/vi_mode.c	Sat Jul 29 16:42:28 2006
+--- bash-3.2/lib/readline/vi_mode.c	Fri Mar  9 15:02:11 2007
+***************
+*** 887,890 ****
+--- 887,897 ----
+    c = rl_read_key ();
+    RL_UNSETSTATE(RL_STATE_MOREINPUT);
++ 
++   if (c < 0)
++     {
++       *nextkey = 0;
++       return -1;
++     }
++ 
+    *nextkey = c;
+  
+***************
+*** 903,906 ****
+--- 910,918 ----
+  	  c = rl_read_key ();	/* real command */
+  	  RL_UNSETSTATE(RL_STATE_MOREINPUT);
++ 	  if (c < 0)
++ 	    {
++ 	      *nextkey = 0;
++ 	      return -1;
++ 	    }
+  	  *nextkey = c;
+  	}
+***************
+*** 1225,1236 ****
+       _rl_callback_generic_arg *data;
+  {
+  #if defined (HANDLE_MULTIBYTE)
+!   _rl_vi_last_search_mblen = _rl_read_mbchar (_rl_vi_last_search_mbchar, MB_LEN_MAX);
+  #else
+    RL_SETSTATE(RL_STATE_MOREINPUT);
+!   _rl_vi_last_search_char = rl_read_key ();
+    RL_UNSETSTATE(RL_STATE_MOREINPUT);
+  #endif
+  
+    _rl_callback_func = 0;
+    _rl_want_redisplay = 1;
+--- 1243,1262 ----
+       _rl_callback_generic_arg *data;
+  {
++   int c;
+  #if defined (HANDLE_MULTIBYTE)
+!   c = _rl_vi_last_search_mblen = _rl_read_mbchar (_rl_vi_last_search_mbchar, MB_LEN_MAX);
+  #else
+    RL_SETSTATE(RL_STATE_MOREINPUT);
+!   c = rl_read_key ();
+    RL_UNSETSTATE(RL_STATE_MOREINPUT);
+  #endif
+  
++   if (c <= 0)
++     return -1;
++ 
++ #if !defined (HANDLE_MULTIBYTE)
++   _rl_vi_last_search_char = c;
++ #endif
++ 
+    _rl_callback_func = 0;
+    _rl_want_redisplay = 1;
+***************
+*** 1248,1251 ****
+--- 1274,1278 ----
+       int count, key;
+  {
++   int c;
+  #if defined (HANDLE_MULTIBYTE)
+    static char *target;
+***************
+*** 1294,1302 ****
+  	{
+  #if defined (HANDLE_MULTIBYTE)
+! 	  _rl_vi_last_search_mblen = _rl_read_mbchar (_rl_vi_last_search_mbchar, MB_LEN_MAX);
+  #else
+  	  RL_SETSTATE(RL_STATE_MOREINPUT);
+! 	  _rl_vi_last_search_char = rl_read_key ();
+  	  RL_UNSETSTATE(RL_STATE_MOREINPUT);
+  #endif
+  	}
+--- 1321,1335 ----
+  	{
+  #if defined (HANDLE_MULTIBYTE)
+! 	  c = _rl_read_mbchar (_rl_vi_last_search_mbchar, MB_LEN_MAX);
+! 	  if (c <= 0)
+! 	    return -1;
+! 	  _rl_vi_last_search_mblen = c;
+  #else
+  	  RL_SETSTATE(RL_STATE_MOREINPUT);
+! 	  c = rl_read_key ();
+  	  RL_UNSETSTATE(RL_STATE_MOREINPUT);
++ 	  if (c < 0)
++ 	    return -1;
++ 	  _rl_vi_last_search_char = c;
+  #endif
+  	}
+***************
+*** 1468,1471 ****
+--- 1501,1507 ----
+    RL_UNSETSTATE(RL_STATE_MOREINPUT);
+  
++   if (c < 0)
++     return -1;
++ 
+  #if defined (HANDLE_MULTIBYTE)
+    if (MB_CUR_MAX > 1 && rl_byte_oriented == 0)
+***************
+*** 1486,1489 ****
+--- 1522,1528 ----
+    _rl_vi_last_replacement = c = _rl_vi_callback_getchar (mb, MB_LEN_MAX);
+  
++   if (c < 0)
++     return -1;
++ 
+    _rl_callback_func = 0;
+    _rl_want_redisplay = 1;
+***************
+*** 1517,1520 ****
+--- 1556,1562 ----
+      _rl_vi_last_replacement = c = _rl_vi_callback_getchar (mb, MB_LEN_MAX);
+  
++   if (c < 0)
++     return -1;
++ 
+    return (_rl_vi_change_char (count, c, mb));
+  }
+***************
+*** 1651,1655 ****
+    RL_UNSETSTATE(RL_STATE_MOREINPUT);
+  
+!   if (ch < 'a' || ch > 'z')
+      {
+        rl_ding ();
+--- 1693,1697 ----
+    RL_UNSETSTATE(RL_STATE_MOREINPUT);
+  
+!   if (ch < 0 || ch < 'a' || ch > 'z')	/* make test against 0 explicit */
+      {
+        rl_ding ();
+***************
+*** 1703,1707 ****
+        return 0;
+      }
+!   else if (ch < 'a' || ch > 'z')
+      {
+        rl_ding ();
+--- 1745,1749 ----
+        return 0;
+      }
+!   else if (ch < 0 || ch < 'a' || ch > 'z')	/* make test against 0 explicit */
+      {
+        rl_ding ();
+*** ../bash-3.2/patchlevel.h	Thu Apr 13 08:31:04 2006
+--- bash-3.2/patchlevel.h	Mon Oct 16 14:22:54 2006
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

Added: trunk/buildroot/package/bash/bash32-020
===================================================================
--- trunk/buildroot/package/bash/bash32-020	                        (rev 0)
+++ trunk/buildroot/package/bash/bash32-020	2007-10-07 18:23:11 UTC (rev 20197)
@@ -0,0 +1,183 @@
+			     BASH PATCH REPORT
+			     =================
+
+Bash-Release: 3.2
+Patch-ID: bash32-020
+
+Bug-Reported-by:	Ian A Watson <WATSON_IAN_A@LILLY.COM>
+Bug-Reference-ID:	<OFEC551808.69D02C7F-ON8525729A.0045708D-8525729A.0046150B@EliLilly.lilly.com>
+Bug-Reference-URL:
+
+Bug-Description:
+
+In some cases of error processing, a jump back to the top-level processing
+loop from a builtin command  would leave the shell in an inconsistent state.
+
+Patch:
+
+*** ../bash-3.2-patched/sig.c	Wed Jan 25 14:57:59 2006
+--- bash-3.2/sig.c	Sat Mar 10 11:11:30 2007
+***************
+*** 351,354 ****
+--- 351,373 ----
+  #undef XHANDLER
+  
++ /* Run some of the cleanups that should be performed when we run
++    jump_to_top_level from a builtin command context.  XXX - might want to
++    also call reset_parser here. */
++ void
++ top_level_cleanup ()
++ {
++   /* Clean up string parser environment. */
++   while (parse_and_execute_level)
++     parse_and_execute_cleanup ();
++ 
++ #if defined (PROCESS_SUBSTITUTION)
++   unlink_fifo_list ();
++ #endif /* PROCESS_SUBSTITUTION */
++ 
++   run_unwind_protects ();
++   loop_level = continuing = breaking = 0;
++   return_catch_flag = 0;
++ }
++ 
+  /* What to do when we've been interrupted, and it is safe to handle it. */
+  void
+*** ../bash-3.2-patched/sig.h	Wed Jan 25 14:50:27 2006
+--- bash-3.2/sig.h	Sat Mar 10 11:14:18 2007
+***************
+*** 122,125 ****
+--- 122,126 ----
+  extern void initialize_terminating_signals __P((void));
+  extern void reset_terminating_signals __P((void));
++ extern void top_level_cleanup __P((void));
+  extern void throw_to_top_level __P((void));
+  extern void jump_to_top_level __P((int)) __attribute__((__noreturn__));
+*** ../bash-3.2-patched/builtins/common.c	Tue Apr  3 16:47:13 2007
+--- bash-3.2/builtins/common.c	Mon Apr 30 15:01:33 2007
+***************
+*** 132,135 ****
+--- 132,136 ----
+      {
+        builtin_error (_("too many arguments"));
++       top_level_cleanup ();
+        jump_to_top_level (DISCARD);
+      }
+***************
+*** 396,400 ****
+  	    throw_to_top_level ();
+  	  else
+! 	    jump_to_top_level (DISCARD);
+  	}
+        no_args (list->next);
+--- 410,417 ----
+  	    throw_to_top_level ();
+  	  else
+! 	    {
+! 	      top_level_cleanup ();
+! 	      jump_to_top_level (DISCARD);
+! 	    }
+  	}
+        no_args (list->next);
+*** ../bash-3.2-patched/subst.c	Tue Apr  3 16:47:19 2007
+--- bash-3.2/subst.c	Tue Jul 17 09:45:11 2007
+***************
+*** 1279,1283 ****
+        if (no_longjmp_on_fatal_error == 0)
+  	{			/* { */
+! 	  report_error ("bad substitution: no closing `%s' in %s", "}", string);
+  	  last_command_exit_value = EXECUTION_FAILURE;
+  	  exp_jump_to_top_level (DISCARD);
+--- 1290,1294 ----
+        if (no_longjmp_on_fatal_error == 0)
+  	{			/* { */
+! 	  report_error (_("bad substitution: no closing `%s' in %s"), "}", string);
+  	  last_command_exit_value = EXECUTION_FAILURE;
+  	  exp_jump_to_top_level (DISCARD);
+***************
+*** 7662,7665 ****
+--- 7706,7711 ----
+    expand_no_split_dollar_star = 0;	/* XXX */
+    expanding_redir = 0;
++ 
++   top_level_cleanup ();			/* from sig.c */
+  
+    jump_to_top_level (v);
+***************
+*** 7880,7884 ****
+  	    {
+  	      report_error (_("no match: %s"), tlist->word->word);
+! 	      jump_to_top_level (DISCARD);
+  	    }
+  	  else if (allow_null_glob_expansion == 0)
+--- 7927,7931 ----
+  	    {
+  	      report_error (_("no match: %s"), tlist->word->word);
+! 	      exp_jump_to_top_level (DISCARD);
+  	    }
+  	  else if (allow_null_glob_expansion == 0)
+*** ../bash-3.2-patched/arrayfunc.c	Thu Jul 27 09:37:59 2006
+--- bash-3.2/arrayfunc.c	Thu May 31 11:55:46 2007
+***************
+*** 619,622 ****
+--- 619,624 ----
+      {
+        last_command_exit_value = EXECUTION_FAILURE;
++ 
++       top_level_cleanup ();      
+        jump_to_top_level (DISCARD);
+      }
+*** ../bash-3.2-patched/expr.c	Wed Dec 28 17:47:03 2005
+--- bash-3.2/expr.c	Tue Apr 24 14:17:59 2007
+***************
+*** 930,933 ****
+--- 930,934 ----
+  	{
+  	  expr_unwind ();
++ 	  top_level_cleanup ();
+  	  jump_to_top_level (DISCARD);
+  	}
+*** ../bash-3.2-patched/variables.c	Fri Sep  8 13:33:32 2006
+--- bash-3.2/variables.c	Tue Jul 17 09:54:59 2007
+***************
+*** 1822,1830 ****
+  	  lval = evalexp (oval, &expok);	/* ksh93 seems to do this */
+  	  if (expok == 0)
+! 	    jump_to_top_level (DISCARD);
+  	}
+        rval = evalexp (value, &expok);
+        if (expok == 0)
+! 	jump_to_top_level (DISCARD);
+        if (flags & ASS_APPEND)
+  	rval += lval;
+--- 1855,1869 ----
+  	  lval = evalexp (oval, &expok);	/* ksh93 seems to do this */
+  	  if (expok == 0)
+! 	    {
+! 	      top_level_cleanup ();
+! 	      jump_to_top_level (DISCARD);
+! 	    }
+  	}
+        rval = evalexp (value, &expok);
+        if (expok == 0)
+! 	{
+! 	  top_level_cleanup ();
+! 	  jump_to_top_level (DISCARD);
+! 	}
+        if (flags & ASS_APPEND)
+  	rval += lval;
+*** ../bash-3.2/patchlevel.h	Thu Apr 13 08:31:04 2006
+--- bash-3.2/patchlevel.h	Mon Oct 16 14:22:54 2006
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

Added: trunk/buildroot/package/bash/bash32-021
===================================================================
--- trunk/buildroot/package/bash/bash32-021	                        (rev 0)
+++ trunk/buildroot/package/bash/bash32-021	2007-10-07 18:23:11 UTC (rev 20197)
@@ -0,0 +1,72 @@
+			     BASH PATCH REPORT
+			     =================
+
+Bash-Release: 3.2
+Patch-ID: bash32-021
+
+Bug-Reported-by:	BAGSHAW Paul RD-TECH-REN <paul.bagshaw@orange-ftgroup.com>
+Bug-Reference-ID:	<941BA0BF46DB8F4983FF7C8AFE800BC205EA7D4B@ftrdmel3.rd.francetelecom.fr>
+Bug-Reference-URL:	http://lists.gnu.org/archive/html/bug-bash/2007-03/msg00065.html
+
+Bug-Description:
+
+When the parser read a backslash-escaped character that would be treated
+internally as an escape, it would double the number of escape characters.
+
+Patch:
+
+*** ../bash-3.2-patched/parse.y	Mon Oct 30 17:22:00 2006
+--- bash-3.2/parse.y	Sat Mar 24 17:13:20 2007
+***************
+*** 3377,3381 ****
+  	{
+  	  pass_next_character = 0;
+! 	  goto got_character;
+  	}
+  
+--- 3377,3381 ----
+  	{
+  	  pass_next_character = 0;
+! 	  goto got_escaped_character;
+  	}
+  
+***************
+*** 3651,3660 ****
+      got_character:
+  
+-       all_digit_token &= DIGIT (character);
+-       dollar_present |= character == '$';
+- 
+        if (character == CTLESC || character == CTLNUL)
+  	token[token_index++] = CTLESC;
+  
+        token[token_index++] = character;
+  
+--- 3651,3662 ----
+      got_character:
+  
+        if (character == CTLESC || character == CTLNUL)
+  	token[token_index++] = CTLESC;
+  
++     got_escaped_character:
++ 
++       all_digit_token &= DIGIT (character);
++       dollar_present |= character == '$';
++ 
+        token[token_index++] = character;
+  
+*** ../bash-3.2/patchlevel.h	Thu Apr 13 08:31:04 2006
+--- bash-3.2/patchlevel.h	Mon Oct 16 14:22:54 2006
+***************
+*** 26,30 ****
+     looks for to find the patch level (for the sccs version string). */
+  
+! #define PATCHLEVEL 20
+  
+  #endif /* _PATCHLEVEL_H_ */
+--- 26,30 ----
+     looks for to find the patch level (for the sccs version string). */
+  
+! #define PATCHLEVEL 21
+  
+  #endif /* _PATCHLEVEL_H_ */

Added: trunk/buildroot/package/bash/bash32-022
===================================================================
--- trunk/buildroot/package/bash/bash32-022	                        (rev 0)
+++ trunk/buildroot/package/bash/bash32-022	2007-10-07 18:23:11 UTC (rev 20197)
@@ -0,0 +1,126 @@
+			     BASH PATCH REPORT
+			     =================
+
+Bash-Release: 3.2
+Patch-ID: bash32-022
+
+Bug-Reported-by:	Chet Ramey <chet.ramey@cwru.edu>
+Bug-Reference-ID:
+Bug-Reference-URL:
+
+Bug-Description:
+
+POSIX specifies that the `read' builtin invoked from an interative shell
+must prompt with $PS2 when a line is continued using a backslash while
+reading from a terminal.
+
+Patch:
+
+*** ../bash-3.2-patched/builtins/read.def	Tue Sep 19 08:45:48 2006
+--- bash-3.2/builtins/read.def	Thu May 24 16:03:30 2007
+***************
+*** 128,133 ****
+  {
+    register char *varname;
+!   int size, i, nr, pass_next, saw_escape, eof, opt, retval, code;
+!   int input_is_tty, input_is_pipe, unbuffered_read;
+    int raw, edit, nchars, silent, have_timeout, fd;
+    unsigned int tmout;
+--- 131,136 ----
+  {
+    register char *varname;
+!   int size, i, nr, pass_next, saw_escape, eof, opt, retval, code, print_ps2;
+!   int input_is_tty, input_is_pipe, unbuffered_read, skip_ctlesc, skip_ctlnul;
+    int raw, edit, nchars, silent, have_timeout, fd;
+    unsigned int tmout;
+***************
+*** 135,139 ****
+    char c;
+    char *input_string, *orig_input_string, *ifs_chars, *prompt, *arrayname;
+!   char *e, *t, *t1;
+    struct stat tsb;
+    SHELL_VAR *var;
+--- 138,142 ----
+    char c;
+    char *input_string, *orig_input_string, *ifs_chars, *prompt, *arrayname;
+!   char *e, *t, *t1, *ps2;
+    struct stat tsb;
+    SHELL_VAR *var;
+***************
+*** 149,152 ****
+--- 152,156 ----
+    USE_VAR(i);
+    USE_VAR(pass_next);
++   USE_VAR(print_ps2);
+    USE_VAR(saw_escape);
+    USE_VAR(input_is_pipe);
+***************
+*** 164,167 ****
+--- 168,172 ----
+  #endif
+    USE_VAR(list);
++   USE_VAR(ps2);
+  
+    i = 0;		/* Index into the string that we are reading. */
+***************
+*** 387,391 ****
+  #endif
+  
+!   for (eof = retval = 0;;)
+      {
+  #if defined (READLINE)
+--- 394,399 ----
+  #endif
+  
+!   ps2 = 0;
+!   for (print_ps2 = eof = retval = 0;;)
+      {
+  #if defined (READLINE)
+***************
+*** 413,416 ****
+--- 421,433 ----
+  #endif
+  
++       if (print_ps2)
++ 	{
++ 	  if (ps2 == 0)
++ 	    ps2 = get_string_value ("PS2");
++ 	  fprintf (stderr, "%s", ps2 ? ps2 : "");
++ 	  fflush (stderr);
++ 	  print_ps2 = 0;
++ 	}
++ 
+        if (unbuffered_read)
+  	retval = zread (fd, &c, 1);
+***************
+*** 441,445 ****
+  	  pass_next = 0;
+  	  if (c == '\n')
+! 	    i--;		/* back up over the CTLESC */
+  	  else
+  	    goto add_char;
+--- 458,466 ----
+  	  pass_next = 0;
+  	  if (c == '\n')
+! 	    {
+! 	      i--;		/* back up over the CTLESC */
+! 	      if (interactive && input_is_tty && raw == 0)
+! 		print_ps2 = 1;
+! 	    }
+  	  else
+  	    goto add_char;
+*** ../bash-3.2/patchlevel.h	Thu Apr 13 08:31:04 2006
+--- bash-3.2/patchlevel.h	Mon Oct 16 14:22:54 2006
+***************
+*** 26,30 ****
+     looks for to find the patch level (for the sccs version string). */
+  
+! #define PATCHLEVEL 21
+  
+  #endif /* _PATCHLEVEL_H_ */
+--- 26,30 ----
+     looks for to find the patch level (for the sccs version string). */
+  
+! #define PATCHLEVEL 22
+  
+  #endif /* _PATCHLEVEL_H_ */

Added: trunk/buildroot/package/bash/bash32-023
===================================================================
--- trunk/buildroot/package/bash/bash32-023	                        (rev 0)
+++ trunk/buildroot/package/bash/bash32-023	2007-10-07 18:23:11 UTC (rev 20197)
@@ -0,0 +1,51 @@
+			     BASH PATCH REPORT
+			     =================
+
+Bash-Release: 3.2
+Patch-ID: bash32-023
+
+Bug-Reported-by:	Chet Ramey <chet.ramey@cwru.edu>
+Bug-Reference-ID:
+Bug-Reference-URL:
+
+Bug-Description:
+
+When an error occurs during the pattern removal word expansion, the shell
+can free unallocated memory or free memory multiple times.
+
+Patch:
+
+*** ../bash-3.2-patched/subst.c	Tue Apr  3 16:47:19 2007
+--- bash-3.2/subst.c	Tue Jul 17 09:45:11 2007
+***************
+*** 3975,3979 ****
+      patstr++;
+  
+!   pattern = getpattern (patstr, quoted, 1);
+  
+    temp1 = (char *)NULL;		/* shut up gcc */
+--- 4008,4016 ----
+      patstr++;
+  
+!   /* Need to pass getpattern newly-allocated memory in case of expansion --
+!      the expansion code will free the passed string on an error. */
+!   temp1 = savestring (patstr);
+!   pattern = getpattern (temp1, quoted, 1);
+!   free (temp1);
+  
+    temp1 = (char *)NULL;		/* shut up gcc */
+*** ../bash-3.2/patchlevel.h	Thu Apr 13 08:31:04 2006
+--- bash-3.2/patchlevel.h	Mon Oct 16 14:22:54 2006
+***************
+*** 26,30 ****
+     looks for to find the patch level (for the sccs version string). */
+  
+! #define PATCHLEVEL 22
+  
+  #endif /* _PATCHLEVEL_H_ */
+--- 26,30 ----
+     looks for to find the patch level (for the sccs version string). */
+  
+! #define PATCHLEVEL 23
+  
+  #endif /* _PATCHLEVEL_H_ */

Added: trunk/buildroot/package/bash/bash32-024
===================================================================
--- trunk/buildroot/package/bash/bash32-024	                        (rev 0)
+++ trunk/buildroot/package/bash/bash32-024	2007-10-07 18:23:11 UTC (rev 20197)
@@ -0,0 +1,77 @@
+			     BASH PATCH REPORT
+			     =================
+
+Bash-Release: 3.2
+Patch-ID: bash32-024
+
+Bug-Reported-by:	Peter Volkov <torre_cremata@mail.ru>
+Bug-Reference-ID:	<1178376645.9063.25.camel@localhost>
+Bug-Reference-URL:	http://bugs.gentoo.org/177095
+
+Bug-Description:
+
+The readline display code miscalculated the screen position when performing
+a redisplay in which the new text occupies more screen space that the old,
+but takes fewer bytes to do so (e.g., when replacing a shorter string
+containing multibyte characters with a longer one containing only ASCII).
+
+Patch:
+
+*** ../bash-3.2-patched/lib/readline/display.c	Thu Apr 26 11:38:22 2007
+--- bash-3.2/lib/readline/display.c	Thu Jul 12 23:10:10 2007
+***************
+*** 1519,1527 ****
+        /* Non-zero if we're increasing the number of lines. */
+        int gl = current_line >= _rl_vis_botlin && inv_botlin > _rl_vis_botlin;
+        /* Sometimes it is cheaper to print the characters rather than
+  	 use the terminal's capabilities.  If we're growing the number
+  	 of lines, make sure we actually cause the new line to wrap
+  	 around on auto-wrapping terminals. */
+!       if (_rl_terminal_can_insert && ((2 * col_temp) >= col_lendiff || _rl_term_IC) && (!_rl_term_autowrap || !gl))
+  	{
+  	  /* If lendiff > prompt_visible_length and _rl_last_c_pos == 0 and
+--- 1568,1596 ----
+        /* Non-zero if we're increasing the number of lines. */
+        int gl = current_line >= _rl_vis_botlin && inv_botlin > _rl_vis_botlin;
++       /* If col_lendiff is > 0, implying that the new string takes up more
++ 	 screen real estate than the old, but lendiff is < 0, meaning that it
++ 	 takes fewer bytes, we need to just output the characters starting
++ 	 from the first difference.  These will overwrite what is on the
++ 	 display, so there's no reason to do a smart update.  This can really
++ 	 only happen in a multibyte environment. */
++       if (lendiff < 0)
++ 	{
++ 	  _rl_output_some_chars (nfd, temp);
++ 	  _rl_last_c_pos += _rl_col_width (nfd, 0, temp);
++ 	  /* If nfd begins before any invisible characters in the prompt,
++ 	     adjust _rl_last_c_pos to account for wrap_offset and set
++ 	     cpos_adjusted to let the caller know. */
++ 	  if (current_line == 0 && wrap_offset && ((nfd - new) <= prompt_last_invisible))
++ 	    {
++ 	      _rl_last_c_pos -= wrap_offset;
++ 	      cpos_adjusted = 1;
++ 	    }
++ 	  return;
++ 	}
+        /* Sometimes it is cheaper to print the characters rather than
+  	 use the terminal's capabilities.  If we're growing the number
+  	 of lines, make sure we actually cause the new line to wrap
+  	 around on auto-wrapping terminals. */
+!       else if (_rl_terminal_can_insert && ((2 * col_temp) >= col_lendiff || _rl_term_IC) && (!_rl_term_autowrap || !gl))
+  	{
+  	  /* If lendiff > prompt_visible_length and _rl_last_c_pos == 0 and
+*** ../bash-3.2/patchlevel.h	Thu Apr 13 08:31:04 2006
+--- bash-3.2/patchlevel.h	Mon Oct 16 14:22:54 2006
+***************
+*** 26,30 ****
+     looks for to find the patch level (for the sccs version string). */
+  
+! #define PATCHLEVEL 23
+  
+  #endif /* _PATCHLEVEL_H_ */
+--- 26,30 ----
+     looks for to find the patch level (for the sccs version string). */
+  
+! #define PATCHLEVEL 24
+  
+  #endif /* _PATCHLEVEL_H_ */
