From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sun, 28 Sep 2014 08:17:54 -0300
Subject: [Buildroot] [PATCH] bash: update to patchlevel 27
Message-ID: <1411903074-24343-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Patches 26 and 27 are refiniments/improved checks on the CVE.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 ...chlevel25.patch => bash-001-patchlevel27.patch} | 339 +++++++++++++++------
 1 file changed, 243 insertions(+), 96 deletions(-)
 rename package/bash/{bash-001-patchlevel25.patch => bash-001-patchlevel27.patch} (73%)

diff --git a/package/bash/bash-001-patchlevel25.patch b/package/bash/bash-001-patchlevel27.patch
similarity index 73%
rename from package/bash/bash-001-patchlevel25.patch
rename to package/bash/bash-001-patchlevel27.patch
index a8e86a3..6969237 100644
--- a/package/bash/bash-001-patchlevel25.patch
+++ b/package/bash/bash-001-patchlevel27.patch
@@ -1,15 +1,16 @@
-Update bash to patchlevel 25.
+Update bash to patchlevel 27.
 It's basically a single patch made out from
-http://ftp.gnu.org/pub/gnu/bash/bash-4.3-patches/ (bash43-001 to 025).
-Fixes CVE-2014-6271:
+http://ftp.gnu.org/pub/gnu/bash/bash-4.3-patches/ (bash43-001 to 027).
+Fixes CVE-2014-6271 (level 25):
 Under certain circumstances, bash will execute user code while processing the
 environment for exported function definitions.
+Level 26-27 are refinements/improved fixes on CVE-2014-6271.
 
 Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
 
-diff -Nura bash-4.3.orig/arrayfunc.c bash-4.3/arrayfunc.c
---- bash-4.3.orig/arrayfunc.c	2014-09-24 14:45:32.573985743 -0300
-+++ bash-4.3/arrayfunc.c	2014-09-24 14:45:48.858540124 -0300
+diff -Nura bash-4.3/arrayfunc.c bash-4.3.pl27/arrayfunc.c
+--- bash-4.3/arrayfunc.c	2013-08-02 17:19:59.000000000 -0300
++++ bash-4.3.pl27/arrayfunc.c	2014-09-28 08:13:40.311842889 -0300
 @@ -179,6 +179,7 @@
      array_insert (array_cell (entry), ind, newval);
    FREE (newval);
@@ -30,9 +31,9 @@ diff -Nura bash-4.3.orig/arrayfunc.c bash-4.3/arrayfunc.c
  	  free_val = 1;
  	}
  
-diff -Nura bash-4.3.orig/bashline.c bash-4.3/bashline.c
---- bash-4.3.orig/bashline.c	2014-09-24 14:45:32.574985778 -0300
-+++ bash-4.3/bashline.c	2014-09-24 14:45:48.851539885 -0300
+diff -Nura bash-4.3/bashline.c bash-4.3.pl27/bashline.c
+--- bash-4.3/bashline.c	2014-02-09 21:56:58.000000000 -0300
++++ bash-4.3.pl27/bashline.c	2014-09-28 08:13:40.312842925 -0300
 @@ -4167,9 +4167,16 @@
    int qc;
  
@@ -52,9 +53,9 @@ diff -Nura bash-4.3.orig/bashline.c bash-4.3/bashline.c
  
    if (m1 == 0 || m1[0] == 0)
      return m1;
-diff -Nura bash-4.3.orig/builtins/common.h bash-4.3/builtins/common.h
---- bash-4.3.orig/builtins/common.h	2014-09-24 14:45:32.630987683 -0300
-+++ bash-4.3/builtins/common.h	2014-09-24 14:45:48.878540805 -0300
+diff -Nura bash-4.3/builtins/common.h bash-4.3.pl27/builtins/common.h
+--- bash-4.3/builtins/common.h	2013-07-08 17:54:47.000000000 -0300
++++ bash-4.3.pl27/builtins/common.h	2014-09-28 08:13:40.313842959 -0300
 @@ -33,6 +33,8 @@
  #define SEVAL_RESETLINE	0x010
  #define SEVAL_PARSEONLY	0x020
@@ -64,9 +65,9 @@ diff -Nura bash-4.3.orig/builtins/common.h bash-4.3/builtins/common.h
  
  /* Flags for describe_command, shared between type.def and command.def */
  #define CDESC_ALL		0x001	/* type -a */
-diff -Nura bash-4.3.orig/builtins/evalstring.c bash-4.3/builtins/evalstring.c
---- bash-4.3.orig/builtins/evalstring.c	2014-09-24 14:45:32.631987717 -0300
-+++ bash-4.3/builtins/evalstring.c	2014-09-24 14:45:48.879540839 -0300
+diff -Nura bash-4.3/builtins/evalstring.c bash-4.3.pl27/builtins/evalstring.c
+--- bash-4.3/builtins/evalstring.c	2014-02-11 11:42:10.000000000 -0300
++++ bash-4.3.pl27/builtins/evalstring.c	2014-09-28 08:13:40.313842959 -0300
 @@ -308,6 +308,14 @@
  	    {
  	      struct fd_bitmap *bitmap;
@@ -92,9 +93,9 @@ diff -Nura bash-4.3.orig/builtins/evalstring.c bash-4.3/builtins/evalstring.c
  	    }
  	}
        else
-diff -Nura bash-4.3.orig/builtins/read.def bash-4.3/builtins/read.def
---- bash-4.3.orig/builtins/read.def	2014-09-24 14:45:32.631987717 -0300
-+++ bash-4.3/builtins/read.def	2014-09-24 14:45:48.860540192 -0300
+diff -Nura bash-4.3/builtins/read.def bash-4.3.pl27/builtins/read.def
+--- bash-4.3/builtins/read.def	2013-09-02 12:54:00.000000000 -0300
++++ bash-4.3.pl27/builtins/read.def	2014-09-28 08:13:40.313842959 -0300
 @@ -442,7 +442,10 @@
        add_unwind_protect (reset_alarm, (char *)NULL);
  #if defined (READLINE)
@@ -123,9 +124,9 @@ diff -Nura bash-4.3.orig/builtins/read.def bash-4.3/builtins/read.def
  
    if (ret == 0)
      return ret;
-diff -Nura bash-4.3.orig/execute_cmd.c bash-4.3/execute_cmd.c
---- bash-4.3.orig/execute_cmd.c	2014-09-24 14:45:32.573985743 -0300
-+++ bash-4.3/execute_cmd.c	2014-09-24 14:45:48.870540532 -0300
+diff -Nura bash-4.3/execute_cmd.c bash-4.3.pl27/execute_cmd.c
+--- bash-4.3/execute_cmd.c	2014-01-31 12:54:52.000000000 -0300
++++ bash-4.3.pl27/execute_cmd.c	2014-09-28 08:13:40.315843026 -0300
 @@ -2409,7 +2409,16 @@
  #endif
        lstdin = wait_for (lastpid);
@@ -144,9 +145,9 @@ diff -Nura bash-4.3.orig/execute_cmd.c bash-4.3/execute_cmd.c
  #endif
        unfreeze_jobs_list ();
      }
-diff -Nura bash-4.3.orig/externs.h bash-4.3/externs.h
---- bash-4.3.orig/externs.h	2014-09-24 14:45:32.573985743 -0300
-+++ bash-4.3/externs.h	2014-09-24 14:45:48.837539409 -0300
+diff -Nura bash-4.3/externs.h bash-4.3.pl27/externs.h
+--- bash-4.3/externs.h	2014-01-02 16:58:20.000000000 -0300
++++ bash-4.3.pl27/externs.h	2014-09-28 08:13:40.315843026 -0300
 @@ -324,6 +324,7 @@
  extern char *sh_backslash_quote __P((char *, const char *, int));
  extern char *sh_backslash_quote_for_double_quotes __P((char *));
@@ -155,9 +156,9 @@ diff -Nura bash-4.3.orig/externs.h bash-4.3/externs.h
  
  /* declarations for functions defined in lib/sh/spell.c */
  extern int spname __P((char *, char *));
-diff -Nura bash-4.3.orig/jobs.c bash-4.3/jobs.c
---- bash-4.3.orig/jobs.c	2014-09-24 14:45:32.639987989 -0300
-+++ bash-4.3/jobs.c	2014-09-24 14:45:48.843539613 -0300
+diff -Nura bash-4.3/jobs.c bash-4.3.pl27/jobs.c
+--- bash-4.3/jobs.c	2014-01-10 11:05:34.000000000 -0300
++++ bash-4.3.pl27/jobs.c	2014-09-28 08:13:40.316843059 -0300
 @@ -3597,6 +3597,7 @@
    unwind_protect_int (jobs_list_frozen);
    unwind_protect_pointer (the_pipeline);
@@ -175,9 +176,9 @@ diff -Nura bash-4.3.orig/jobs.c bash-4.3/jobs.c
      {
        terminate_stopped_jobs ();
  
-diff -Nura bash-4.3.orig/lib/glob/glob.c bash-4.3/lib/glob/glob.c
---- bash-4.3.orig/lib/glob/glob.c	2014-09-24 14:45:32.652988432 -0300
-+++ bash-4.3/lib/glob/glob.c	2014-09-24 14:45:48.853539954 -0300
+diff -Nura bash-4.3/lib/glob/glob.c bash-4.3.pl27/lib/glob/glob.c
+--- bash-4.3/lib/glob/glob.c	2014-01-31 23:43:51.000000000 -0300
++++ bash-4.3.pl27/lib/glob/glob.c	2014-09-28 08:13:40.317843093 -0300
 @@ -123,6 +123,8 @@
  extern char *glob_patscan __P((char *, char *, int));
  extern wchar_t *glob_patscan_wc __P((wchar_t *, wchar_t *, int));
@@ -326,9 +327,9 @@ diff -Nura bash-4.3.orig/lib/glob/glob.c bash-4.3/lib/glob/glob.c
    if (filename == NULL)
      {
        filename = pathname;
-diff -Nura bash-4.3.orig/lib/glob/gmisc.c bash-4.3/lib/glob/gmisc.c
---- bash-4.3.orig/lib/glob/gmisc.c	2014-09-24 14:45:32.652988432 -0300
-+++ bash-4.3/lib/glob/gmisc.c	2014-09-24 14:45:48.854539988 -0300
+diff -Nura bash-4.3/lib/glob/gmisc.c bash-4.3.pl27/lib/glob/gmisc.c
+--- bash-4.3/lib/glob/gmisc.c	2013-10-28 15:45:25.000000000 -0300
++++ bash-4.3.pl27/lib/glob/gmisc.c	2014-09-28 08:13:40.317843093 -0300
 @@ -42,6 +42,8 @@
  #define WLPAREN         L'('
  #define WRPAREN         L')'
@@ -381,9 +382,9 @@ diff -Nura bash-4.3.orig/lib/glob/gmisc.c bash-4.3/lib/glob/gmisc.c
 +    }
 +  return d;
 +}
-diff -Nura bash-4.3.orig/lib/readline/display.c bash-4.3/lib/readline/display.c
---- bash-4.3.orig/lib/readline/display.c	2014-09-24 14:45:32.652988432 -0300
-+++ bash-4.3/lib/readline/display.c	2014-09-24 14:45:48.845539681 -0300
+diff -Nura bash-4.3/lib/readline/display.c bash-4.3.pl27/lib/readline/display.c
+--- bash-4.3/lib/readline/display.c	2013-12-27 15:10:56.000000000 -0300
++++ bash-4.3.pl27/lib/readline/display.c	2014-09-28 08:13:40.318843127 -0300
 @@ -1637,7 +1637,7 @@
    /* If we are changing the number of invisible characters in a line, and
       the spot of first difference is before the end of the invisible chars,
@@ -418,9 +419,9 @@ diff -Nura bash-4.3.orig/lib/readline/display.c bash-4.3/lib/readline/display.c
        _rl_vis_botlin = 0;
        fflush (rl_outstream);
        rl_restart_output (1, 0);
-diff -Nura bash-4.3.orig/lib/readline/input.c bash-4.3/lib/readline/input.c
---- bash-4.3.orig/lib/readline/input.c	2014-09-24 14:45:32.651988398 -0300
-+++ bash-4.3/lib/readline/input.c	2014-09-24 14:45:48.860540192 -0300
+diff -Nura bash-4.3/lib/readline/input.c bash-4.3.pl27/lib/readline/input.c
+--- bash-4.3/lib/readline/input.c	2014-01-10 17:07:08.000000000 -0300
++++ bash-4.3.pl27/lib/readline/input.c	2014-09-28 08:13:40.318843127 -0300
 @@ -534,8 +534,16 @@
  	return (RL_ISSTATE (RL_STATE_READCMD) ? READERR : EOF);
        else if (_rl_caught_signal == SIGHUP || _rl_caught_signal == SIGTERM)
@@ -438,9 +439,9 @@ diff -Nura bash-4.3.orig/lib/readline/input.c bash-4.3/lib/readline/input.c
  
        if (rl_signal_event_hook)
  	(*rl_signal_event_hook) ();
-diff -Nura bash-4.3.orig/lib/readline/misc.c bash-4.3/lib/readline/misc.c
---- bash-4.3.orig/lib/readline/misc.c	2014-09-24 14:45:32.652988432 -0300
-+++ bash-4.3/lib/readline/misc.c	2014-09-24 14:45:48.867540430 -0300
+diff -Nura bash-4.3/lib/readline/misc.c bash-4.3.pl27/lib/readline/misc.c
+--- bash-4.3/lib/readline/misc.c	2012-09-01 19:03:11.000000000 -0300
++++ bash-4.3.pl27/lib/readline/misc.c	2014-09-28 08:13:40.319843161 -0300
 @@ -461,6 +461,7 @@
  	    saved_undo_list = 0;
  	  /* Set up rl_line_buffer and other variables from history entry */
@@ -457,9 +458,9 @@ diff -Nura bash-4.3.orig/lib/readline/misc.c bash-4.3/lib/readline/misc.c
  	}
        entry = previous_history ();
      }
-diff -Nura bash-4.3.orig/lib/readline/readline.c bash-4.3/lib/readline/readline.c
---- bash-4.3.orig/lib/readline/readline.c	2014-09-24 14:45:32.652988432 -0300
-+++ bash-4.3/lib/readline/readline.c	2014-09-24 14:45:48.819538797 -0300
+diff -Nura bash-4.3/lib/readline/readline.c bash-4.3.pl27/lib/readline/readline.c
+--- bash-4.3/lib/readline/readline.c	2013-10-28 15:58:06.000000000 -0300
++++ bash-4.3.pl27/lib/readline/readline.c	2014-09-28 08:13:40.319843161 -0300
 @@ -744,7 +744,8 @@
      r = _rl_subseq_result (r, cxt->oldmap, cxt->okey, (cxt->flags & KSEQ_SUBSEQ));
  
@@ -479,9 +480,9 @@ diff -Nura bash-4.3.orig/lib/readline/readline.c bash-4.3/lib/readline/readline.
        _rl_vi_textmod_command (key))
      _rl_vi_set_last (key, rl_numeric_arg, rl_arg_sign);
  #endif
-diff -Nura bash-4.3.orig/lib/sh/shquote.c bash-4.3/lib/sh/shquote.c
---- bash-4.3.orig/lib/sh/shquote.c	2014-09-24 14:45:32.654988500 -0300
-+++ bash-4.3/lib/sh/shquote.c	2014-09-24 14:45:48.837539409 -0300
+diff -Nura bash-4.3/lib/sh/shquote.c bash-4.3.pl27/lib/sh/shquote.c
+--- bash-4.3/lib/sh/shquote.c	2013-03-31 22:53:32.000000000 -0300
++++ bash-4.3.pl27/lib/sh/shquote.c	2014-09-28 08:13:40.319843161 -0300
 @@ -311,3 +311,17 @@
  
    return (0);
@@ -500,9 +501,9 @@ diff -Nura bash-4.3.orig/lib/sh/shquote.c bash-4.3/lib/sh/shquote.c
 +    }
 +  return 0;
 +}
-diff -Nura bash-4.3.orig/parse.y bash-4.3/parse.y
---- bash-4.3.orig/parse.y	2014-09-24 14:45:32.650988364 -0300
-+++ bash-4.3/parse.y	2014-09-24 14:45:48.863540294 -0300
+diff -Nura bash-4.3/parse.y bash-4.3.pl27/parse.y
+--- bash-4.3/parse.y	2014-02-11 11:42:10.000000000 -0300
++++ bash-4.3.pl27/parse.y	2014-09-28 08:14:06.094720199 -0300
 @@ -2424,7 +2424,7 @@
  	 not already end in an EOF character.  */
        if (shell_input_line_terminator != EOF)
@@ -521,7 +522,16 @@ diff -Nura bash-4.3.orig/parse.y bash-4.3/parse.y
      {
        parser_state |= PST_HEREDOC;
        make_here_document (redir_stack[r++], line_number);
-@@ -3398,7 +3398,7 @@
+@@ -2953,6 +2953,8 @@
+   FREE (word_desc_to_read);
+   word_desc_to_read = (WORD_DESC *)NULL;
+ 
++  eol_ungetc_lookahead = 0;
++
+   current_token = '\n';		/* XXX */
+   last_read_token = '\n';
+   token_to_read = '\n';
+@@ -3398,7 +3400,7 @@
           within a double-quoted ${...} construct "an even number of
           unescaped double-quotes or single-quotes, if any, shall occur." */
        /* This was changed in Austin Group Interp 221 */
@@ -530,7 +540,7 @@ diff -Nura bash-4.3.orig/parse.y bash-4.3/parse.y
  	continue;
  
        /* Could also check open == '`' if we want to parse grouping constructs
-@@ -6075,6 +6075,7 @@
+@@ -6075,6 +6077,7 @@
  
    ps->expand_aliases = expand_aliases;
    ps->echo_input_at_read = echo_input_at_read;
@@ -538,7 +548,7 @@ diff -Nura bash-4.3.orig/parse.y bash-4.3/parse.y
  
    ps->token = token;
    ps->token_buffer_size = token_buffer_size;
-@@ -6123,6 +6124,7 @@
+@@ -6123,6 +6126,7 @@
  
    expand_aliases = ps->expand_aliases;
    echo_input_at_read = ps->echo_input_at_read;
@@ -546,20 +556,20 @@ diff -Nura bash-4.3.orig/parse.y bash-4.3/parse.y
  
    FREE (token);
    token = ps->token;
-diff -Nura bash-4.3.orig/patchlevel.h bash-4.3/patchlevel.h
---- bash-4.3.orig/patchlevel.h	2014-09-24 14:45:32.639987989 -0300
-+++ bash-4.3/patchlevel.h	2014-09-24 14:45:48.883540975 -0300
+diff -Nura bash-4.3/patchlevel.h bash-4.3.pl27/patchlevel.h
+--- bash-4.3/patchlevel.h	2012-12-29 12:47:57.000000000 -0300
++++ bash-4.3.pl27/patchlevel.h	2014-09-28 08:14:07.486767564 -0300
 @@ -25,6 +25,6 @@
     regexp `^#define[ 	]*PATCHLEVEL', since that's what support/mkversion.sh
     looks for to find the patch level (for the sccs version string). */
  
 -#define PATCHLEVEL 0
-+#define PATCHLEVEL 25
++#define PATCHLEVEL 27
  
  #endif /* _PATCHLEVEL_H_ */
-diff -Nura bash-4.3.orig/pcomplete.c bash-4.3/pcomplete.c
---- bash-4.3.orig/pcomplete.c	2014-09-24 14:45:32.637987921 -0300
-+++ bash-4.3/pcomplete.c	2014-09-24 14:45:48.838539443 -0300
+diff -Nura bash-4.3/pcomplete.c bash-4.3.pl27/pcomplete.c
+--- bash-4.3/pcomplete.c	2013-08-26 16:23:45.000000000 -0300
++++ bash-4.3.pl27/pcomplete.c	2014-09-28 08:13:40.321843229 -0300
 @@ -183,6 +183,7 @@
  
  COMPSPEC *pcomp_curcs;
@@ -628,9 +638,9 @@ diff -Nura bash-4.3.orig/pcomplete.c bash-4.3/pcomplete.c
  
    /* We need to conditionally handle setting *retryp here */
    if (retryp)
-diff -Nura bash-4.3.orig/shell.h bash-4.3/shell.h
---- bash-4.3.orig/shell.h	2014-09-24 14:45:32.573985743 -0300
-+++ bash-4.3/shell.h	2014-09-24 14:45:48.862540260 -0300
+diff -Nura bash-4.3/shell.h bash-4.3.pl27/shell.h
+--- bash-4.3/shell.h	2012-12-25 23:11:01.000000000 -0300
++++ bash-4.3.pl27/shell.h	2014-09-28 08:13:40.321843229 -0300
 @@ -168,7 +168,8 @@
    /* flags state affecting the parser */
    int expand_aliases;
@@ -641,9 +651,9 @@ diff -Nura bash-4.3.orig/shell.h bash-4.3/shell.h
  } sh_parser_state_t;
  
  typedef struct _sh_input_line_state_t {
-diff -Nura bash-4.3.orig/subst.c bash-4.3/subst.c
---- bash-4.3.orig/subst.c	2014-09-24 14:45:32.640988023 -0300
-+++ bash-4.3/subst.c	2014-09-24 14:45:48.882540941 -0300
+diff -Nura bash-4.3/subst.c bash-4.3.pl27/subst.c
+--- bash-4.3/subst.c	2014-01-23 18:26:37.000000000 -0300
++++ bash-4.3.pl27/subst.c	2014-09-28 08:13:40.322843263 -0300
 @@ -1192,12 +1192,18 @@
     Start extracting at (SINDEX) as if we had just seen "<(".
     Make (SINDEX) get the position of the matching ")". */ /*))*/
@@ -775,9 +785,9 @@ diff -Nura bash-4.3.orig/subst.c bash-4.3/subst.c
  	  if ((quoted & (Q_DOUBLE_QUOTES|Q_HERE_DOCUMENT)) || (quoted_state == WHOLLY_QUOTED))
  	    tword->flags |= W_QUOTED;
  	  if (word->flags & W_ASSIGNMENT)
-diff -Nura bash-4.3.orig/subst.h bash-4.3/subst.h
---- bash-4.3.orig/subst.h	2014-09-24 14:45:32.655988534 -0300
-+++ bash-4.3/subst.h	2014-09-24 14:45:48.871540566 -0300
+diff -Nura bash-4.3/subst.h bash-4.3.pl27/subst.h
+--- bash-4.3/subst.h	2014-01-11 23:02:27.000000000 -0300
++++ bash-4.3.pl27/subst.h	2014-09-28 08:13:40.322843263 -0300
 @@ -82,7 +82,7 @@
  /* Extract the <( or >( construct in STRING, and return a new string.
     Start extracting at (SINDEX) as if we had just seen "<(".
@@ -787,9 +797,9 @@ diff -Nura bash-4.3.orig/subst.h bash-4.3/subst.h
  #endif /* PROCESS_SUBSTITUTION */
  
  /* Extract the name of the variable to bind to from the assignment string. */
-diff -Nura bash-4.3.orig/test.c bash-4.3/test.c
---- bash-4.3.orig/test.c	2014-09-24 14:45:32.650988364 -0300
-+++ bash-4.3/test.c	2014-09-24 14:45:48.814538631 -0300
+diff -Nura bash-4.3/test.c bash-4.3.pl27/test.c
+--- bash-4.3/test.c	2014-02-04 18:52:58.000000000 -0300
++++ bash-4.3.pl27/test.c	2014-09-28 08:13:40.323843297 -0300
 @@ -646,8 +646,8 @@
        return (v && invisible_p (v) == 0 && var_isset (v) ? TRUE : FALSE);
  
@@ -809,9 +819,9 @@ diff -Nura bash-4.3.orig/test.c bash-4.3/test.c
        return (1);
      }
  
-diff -Nura bash-4.3.orig/trap.c bash-4.3/trap.c
---- bash-4.3.orig/trap.c	2014-09-24 14:45:32.637987921 -0300
-+++ bash-4.3/trap.c	2014-09-24 14:45:48.815538661 -0300
+diff -Nura bash-4.3/trap.c bash-4.3.pl27/trap.c
+--- bash-4.3/trap.c	2014-02-05 12:03:21.000000000 -0300
++++ bash-4.3.pl27/trap.c	2014-09-28 08:13:40.323843297 -0300
 @@ -920,7 +920,8 @@
        subst_assign_varlist = 0;
  
@@ -832,40 +842,94 @@ diff -Nura bash-4.3.orig/trap.c bash-4.3/trap.c
  #endif
  
        subst_assign_varlist = save_subst_varlist;
-diff -Nura bash-4.3.orig/variables.c bash-4.3/variables.c
---- bash-4.3.orig/variables.c	2014-09-24 14:45:32.632987751 -0300
-+++ bash-4.3/variables.c	2014-09-24 14:45:48.880540873 -0300
-@@ -358,13 +358,11 @@
- 	  temp_string[char_index] = ' ';
- 	  strcpy (temp_string + char_index + 1, string);
+diff -Nura bash-4.3/variables.c bash-4.3.pl27/variables.c
+--- bash-4.3/variables.c	2014-02-14 13:55:12.000000000 -0300
++++ bash-4.3.pl27/variables.c	2014-09-28 08:14:07.486767564 -0300
+@@ -83,6 +83,11 @@
+ 
+ #define ifsname(s)	((s)[0] == 'I' && (s)[1] == 'F' && (s)[2] == 'S' && (s)[3] == '\0')
+ 
++#define BASHFUNC_PREFIX		"BASH_FUNC_"
++#define BASHFUNC_PREFLEN	10	/* == strlen(BASHFUNC_PREFIX */
++#define BASHFUNC_SUFFIX		"%%"
++#define BASHFUNC_SUFFLEN	2	/* == strlen(BASHFUNC_SUFFIX) */
++
+ extern char **environ;
+ 
+ /* Variables used here and defined in other files. */
+@@ -279,7 +284,7 @@
+ static void propagate_temp_var __P((PTR_T));
+ static void dispose_temporary_env __P((sh_free_func_t *));     
+ 
+-static inline char *mk_env_string __P((const char *, const char *));
++static inline char *mk_env_string __P((const char *, const char *, int));
+ static char **make_env_array_from_var_list __P((SHELL_VAR **));
+ static char **make_var_export_array __P((VAR_CONTEXT *));
+ static char **make_func_export_array __P((void));
+@@ -349,24 +354,33 @@
+ 
+       /* If exported function, define it now.  Don't import functions from
+ 	 the environment in privileged mode. */
+-      if (privmode == 0 && read_but_dont_execute == 0 && STREQN ("() {", string, 4))
++      if (privmode == 0 && read_but_dont_execute == 0 && 
++          STREQN (BASHFUNC_PREFIX, name, BASHFUNC_PREFLEN) &&
++          STREQ (BASHFUNC_SUFFIX, name + char_index - BASHFUNC_SUFFLEN) &&
++	  STREQN ("() {", string, 4))
+ 	{
+-	  string_length = strlen (string);
+-	  temp_string = (char *)xmalloc (3 + string_length + char_index);
++	  size_t namelen;
++	  char *tname;		/* desired imported function name */
+ 
+-	  strcpy (temp_string, name);
+-	  temp_string[char_index] = ' ';
+-	  strcpy (temp_string + char_index + 1, string);
++	  namelen = char_index - BASHFUNC_PREFLEN - BASHFUNC_SUFFLEN;
  
 -	  if (posixly_correct == 0 || legal_identifier (name))
 -	    parse_and_execute (temp_string, name, SEVAL_NONINT|SEVAL_NOHIST);
--
++	  tname = name + BASHFUNC_PREFLEN;	/* start of func name */
++	  tname[namelen] = '\0';		/* now tname == func name */
++
++	  string_length = strlen (string);
++	  temp_string = (char *)xmalloc (namelen + string_length + 2);
+ 
 -	  /* Ancient backwards compatibility.  Old versions of bash exported
 -	     functions like name()=() {...} */
 -	  if (name[char_index - 1] == ')' && name[char_index - 2] == '(')
 -	    name[char_index - 2] = '\0';
++	  memcpy (temp_string, tname, namelen);
++	  temp_string[namelen] = ' ';
++	  memcpy (temp_string + namelen + 1, string, string_length + 1);
++
 +	  /* Don't import function names that are invalid identifiers from the
 +	     environment, though we still allow them to be defined as shell
 +	     variables. */
-+	  if (legal_identifier (name))
-+	    parse_and_execute (temp_string, name, SEVAL_NONINT|SEVAL_NOHIST|SEVAL_FUNCDEF|SEVAL_ONECMD);
++	  if (absolute_program (tname) == 0 && (posixly_correct == 0 || legal_identifier (tname)))
++	    parse_and_execute (temp_string, tname, SEVAL_NONINT|SEVAL_NOHIST|SEVAL_FUNCDEF|SEVAL_ONECMD);
  
- 	  if (temp_var = find_function (name))
+-	  if (temp_var = find_function (name))
++	  if (temp_var = find_function (tname))
  	    {
-@@ -381,10 +379,6 @@
+ 	      VSETATTR (temp_var, (att_exported|att_imported));
+ 	      array_needs_making = 1;
+@@ -379,12 +393,11 @@
+ 		  array_needs_making = 1;
+ 		}
  	      last_command_exit_value = 1;
- 	      report_error (_("error importing function definition for `%s'"), name);
+-	      report_error (_("error importing function definition for `%s'"), name);
++	      report_error (_("error importing function definition for `%s'"), tname);
  	    }
--
+ 
 -	  /* ( */
 -	  if (name[char_index - 1] == ')' && name[char_index - 2] == '\0')
 -	    name[char_index - 2] = '(';		/* ) */
++	  /* Restore original suffix */
++	  tname[namelen] = BASHFUNC_SUFFIX[0];
  	}
  #if defined (ARRAY_VARS)
  #  if ARRAY_EXPORT
-@@ -2197,10 +2191,7 @@
+@@ -2197,10 +2210,7 @@
    /* local foo; local foo;  is a no-op. */
    old_var = find_variable (name);
    if (old_var && local_p (old_var) && old_var->context == variable_context)
@@ -877,9 +941,78 @@ diff -Nura bash-4.3.orig/variables.c bash-4.3/variables.c
  
    was_tmpvar = old_var && tempvar_p (old_var);
    /* If we're making a local variable in a shell function, the temporary env
-diff -Nura bash-4.3.orig/y.tab.c bash-4.3/y.tab.c
---- bash-4.3.orig/y.tab.c	2014-09-24 14:45:32.573985743 -0300
-+++ bash-4.3/y.tab.c	2014-09-24 14:45:48.865540362 -0300
+@@ -2963,7 +2973,7 @@
+   var->context = variable_context;	/* XXX */
+ 
+   INVALIDATE_EXPORTSTR (var);
+-  var->exportstr = mk_env_string (name, value);
++  var->exportstr = mk_env_string (name, value, 0);
+ 
+   array_needs_making = 1;
+ 
+@@ -3861,21 +3871,42 @@
+ /* **************************************************************** */
+ 
+ static inline char *
+-mk_env_string (name, value)
++mk_env_string (name, value, isfunc)
+      const char *name, *value;
++     int isfunc;
+ {
+-  int name_len, value_len;
+-  char	*p;
++  size_t name_len, value_len;
++  char	*p, *q;
+ 
+   name_len = strlen (name);
+   value_len = STRLEN (value);
+-  p = (char *)xmalloc (2 + name_len + value_len);
+-  strcpy (p, name);
+-  p[name_len] = '=';
++
++  /* If we are exporting a shell function, construct the encoded function
++     name. */
++  if (isfunc && value)
++    {
++      p = (char *)xmalloc (BASHFUNC_PREFLEN + name_len + BASHFUNC_SUFFLEN + value_len + 2);
++      q = p;
++      memcpy (q, BASHFUNC_PREFIX, BASHFUNC_PREFLEN);
++      q += BASHFUNC_PREFLEN;
++      memcpy (q, name, name_len);
++      q += name_len;
++      memcpy (q, BASHFUNC_SUFFIX, BASHFUNC_SUFFLEN);
++      q += BASHFUNC_SUFFLEN;
++    }
++  else
++    {
++      p = (char *)xmalloc (2 + name_len + value_len);
++      memcpy (p, name, name_len);
++      q = p + name_len;
++    }
++
++  q[0] = '=';
+   if (value && *value)
+-    strcpy (p + name_len + 1, value);
++    memcpy (q + 1, value, value_len + 1);
+   else
+-    p[name_len + 1] = '\0';
++    q[1] = '\0';
++
+   return (p);
+ }
+ 
+@@ -3961,7 +3992,7 @@
+ 	  /* Gee, I'd like to get away with not using savestring() if we're
+ 	     using the cached exportstr... */
+ 	  list[list_index] = USE_EXPORTSTR ? savestring (value)
+-					   : mk_env_string (var->name, value);
++					   : mk_env_string (var->name, value, function_p (var));
+ 
+ 	  if (USE_EXPORTSTR == 0)
+ 	    SAVE_EXPORTSTR (var, list[list_index]);
+diff -Nura bash-4.3/y.tab.c bash-4.3.pl27/y.tab.c
+--- bash-4.3/y.tab.c	2014-02-11 12:57:47.000000000 -0300
++++ bash-4.3.pl27/y.tab.c	2014-09-28 08:14:06.096720267 -0300
 @@ -4736,7 +4736,7 @@
  	 not already end in an EOF character.  */
        if (shell_input_line_terminator != EOF)
@@ -898,7 +1031,16 @@ diff -Nura bash-4.3.orig/y.tab.c bash-4.3/y.tab.c
      {
        parser_state |= PST_HEREDOC;
        make_here_document (redir_stack[r++], line_number);
-@@ -5710,7 +5710,7 @@
+@@ -5265,6 +5265,8 @@
+   FREE (word_desc_to_read);
+   word_desc_to_read = (WORD_DESC *)NULL;
+ 
++  eol_ungetc_lookahead = 0;
++
+   current_token = '\n';		/* XXX */
+   last_read_token = '\n';
+   token_to_read = '\n';
+@@ -5710,7 +5712,7 @@
           within a double-quoted ${...} construct "an even number of
           unescaped double-quotes or single-quotes, if any, shall occur." */
        /* This was changed in Austin Group Interp 221 */
@@ -907,7 +1049,7 @@ diff -Nura bash-4.3.orig/y.tab.c bash-4.3/y.tab.c
  	continue;
  
        /* Could also check open == '`' if we want to parse grouping constructs
-@@ -8387,6 +8387,7 @@
+@@ -8387,6 +8389,7 @@
  
    ps->expand_aliases = expand_aliases;
    ps->echo_input_at_read = echo_input_at_read;
@@ -915,7 +1057,7 @@ diff -Nura bash-4.3.orig/y.tab.c bash-4.3/y.tab.c
  
    ps->token = token;
    ps->token_buffer_size = token_buffer_size;
-@@ -8435,6 +8436,7 @@
+@@ -8435,6 +8438,7 @@
  
    expand_aliases = ps->expand_aliases;
    echo_input_at_read = ps->echo_input_at_read;
@@ -923,3 +1065,8 @@ diff -Nura bash-4.3.orig/y.tab.c bash-4.3/y.tab.c
  
    FREE (token);
    token = ps->token;
+@@ -8537,4 +8541,3 @@
+     }
+ }
+ #endif /* HANDLE_MULTIBYTE */
+-
-- 
1.8.5.5
