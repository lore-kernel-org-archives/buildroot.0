From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 22 Feb 2020 19:40:27 +0100
Subject: [Buildroot] [PATCH 1/2] package/bash: add upstream patches
In-Reply-To: <20200222095035.298539-1-fontaine.fabrice@gmail.com>
References: <20200222095035.298539-1-fontaine.fabrice@gmail.com>
Message-ID: <20200222184026.GJ17342@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2020-02-22 10:50 +0100, Fabrice Fontaine spake thusly:
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Both applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/bash/0012-bash50-012.patch | 68 +++++++++++++++++++++++++
>  package/bash/0013-bash50-013.patch | 77 ++++++++++++++++++++++++++++
>  package/bash/0014-bash50-014.patch | 56 ++++++++++++++++++++
>  package/bash/0015-bash50-015.patch | 82 ++++++++++++++++++++++++++++++
>  package/bash/0016-bash50-016.patch | 62 ++++++++++++++++++++++
>  5 files changed, 345 insertions(+)
>  create mode 100644 package/bash/0012-bash50-012.patch
>  create mode 100644 package/bash/0013-bash50-013.patch
>  create mode 100644 package/bash/0014-bash50-014.patch
>  create mode 100644 package/bash/0015-bash50-015.patch
>  create mode 100644 package/bash/0016-bash50-016.patch
> 
> diff --git a/package/bash/0012-bash50-012.patch b/package/bash/0012-bash50-012.patch
> new file mode 100644
> index 0000000000..d634932ee1
> --- /dev/null
> +++ b/package/bash/0012-bash50-012.patch
> @@ -0,0 +1,68 @@
> +From https://ftp.gnu.org/gnu/bash/bash-5.0-patches/bash50-012
> +
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +
> +			     BASH PATCH REPORT
> +			     =================
> +
> +Bash-Release:	5.0
> +Patch-ID:	bash50-012
> +
> +Bug-Reported-by:	lessbug at qq.com
> +Bug-Reference-ID:	<tencent_6AA531D9A5CC4121D86BD5CDA2E0DA98C605@qq.com>
> +Bug-Reference-URL:
> +
> +Bug-Description:
> +
> +When using previous-history to go back beyond the beginning of the history list,
> +it's possible to move to an incorrect partial line.
> +
> +Patch (apply with `patch -p0'):
> +
> +*** ../bash-5.0-patched/lib/readline/misc.c	2017-07-07 17:30:12.000000000 -0400
> +--- b/lib/readline/misc.c	2019-05-16 11:43:46.000000000 -0400
> +***************
> +*** 577,580 ****
> +--- 590,594 ----
> +  {
> +    HIST_ENTRY *old_temp, *temp;
> ++   int had_saved_line;
> +  
> +    if (count < 0)
> +***************
> +*** 589,592 ****
> +--- 603,607 ----
> +  
> +    /* If we don't have a line saved, then save this one. */
> ++   had_saved_line = _rl_saved_line_for_history != 0;
> +    rl_maybe_save_line ();
> +  
> +***************
> +*** 612,616 ****
> +    if (temp == 0)
> +      {
> +!       rl_maybe_unsave_line ();
> +        rl_ding ();
> +      }
> +--- 627,632 ----
> +    if (temp == 0)
> +      {
> +!       if (had_saved_line == 0)
> +!         _rl_free_saved_history_line ();
> +        rl_ding ();
> +      }
> +*** ../bash-5.0/patchlevel.h	2016-06-22 14:51:03.000000000 -0400
> +--- b/patchlevel.h	2016-10-01 11:01:28.000000000 -0400
> +***************
> +*** 26,30 ****
> +     looks for to find the patch level (for the sccs version string). */
> +  
> +! #define PATCHLEVEL 11
> +  
> +  #endif /* _PATCHLEVEL_H_ */
> +--- 26,30 ----
> +     looks for to find the patch level (for the sccs version string). */
> +  
> +! #define PATCHLEVEL 12
> +  
> +  #endif /* _PATCHLEVEL_H_ */
> diff --git a/package/bash/0013-bash50-013.patch b/package/bash/0013-bash50-013.patch
> new file mode 100644
> index 0000000000..1c99f5c8c0
> --- /dev/null
> +++ b/package/bash/0013-bash50-013.patch
> @@ -0,0 +1,77 @@
> +From https://ftp.gnu.org/gnu/bash/bash-5.0-patches/bash50-013
> +
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +
> +			     BASH PATCH REPORT
> +			     =================
> +
> +Bash-Release:	5.0
> +Patch-ID:	bash50-013
> +
> +Bug-Reported-by:	HIROSE Masaaki <hirose31@gmail.com>
> +Bug-Reference-ID:	<CAGSOfA-RqiTe=+GsXsDKyZrrMWH4bDbXgMVVegMa6OjqC5xbnQ@mail.gmail.com>
> +Bug-Reference-URL:	https://lists.gnu.org/archive/html/bug-bash/2019-05/msg00038.html
> +
> +Bug-Description:
> +
> +Reading history entries with timestamps can result in history entries joined
> +by linefeeds.
> +
> +Patch (apply with `patch -p0'):
> +
> +*** ../bash-5.0-patched/lib/readline/histfile.c	2018-06-11 09:14:52.000000000 -0400
> +--- b/lib/readline/histfile.c	2019-05-16 15:55:57.000000000 -0400
> +***************
> +*** 370,376 ****
> +  
> +    has_timestamps = HIST_TIMESTAMP_START (buffer);
> +!   history_multiline_entries += has_timestamps && history_write_timestamps;  
> +  
> +    /* Skip lines until we are at FROM. */
> +    for (line_start = line_end = buffer; line_end < bufend && current_line < from; line_end++)
> +      if (*line_end == '\n')
> +--- 370,378 ----
> +  
> +    has_timestamps = HIST_TIMESTAMP_START (buffer);
> +!   history_multiline_entries += has_timestamps && history_write_timestamps;
> +  
> +    /* Skip lines until we are at FROM. */
> ++   if (has_timestamps)
> ++     last_ts = buffer;
> +    for (line_start = line_end = buffer; line_end < bufend && current_line < from; line_end++)
> +      if (*line_end == '\n')
> +***************
> +*** 381,385 ****
> +--- 383,398 ----
> +  	if (HIST_TIMESTAMP_START(p) == 0)
> +  	  current_line++;
> ++ 	else
> ++ 	  last_ts = p;
> +  	line_start = p;
> ++ 	/* If we are at the last line (current_line == from) but we have
> ++ 	   timestamps (has_timestamps), then line_start points to the
> ++ 	   text of the last command, and we need to skip to its end. */
> ++ 	if (current_line >= from && has_timestamps)
> ++ 	  {
> ++ 	    for (line_end = p; line_end < bufend && *line_end != '\n'; line_end++)
> ++ 	      ;
> ++ 	    line_start = (*line_end == '\n') ? line_end + 1 : line_end;
> ++ 	  }
> +        }
> +  
> +
> +*** ../bash-5.0/patchlevel.h	2016-06-22 14:51:03.000000000 -0400
> +--- b/patchlevel.h	2016-10-01 11:01:28.000000000 -0400
> +***************
> +*** 26,30 ****
> +     looks for to find the patch level (for the sccs version string). */
> +  
> +! #define PATCHLEVEL 12
> +  
> +  #endif /* _PATCHLEVEL_H_ */
> +--- 26,30 ----
> +     looks for to find the patch level (for the sccs version string). */
> +  
> +! #define PATCHLEVEL 13
> +  
> +  #endif /* _PATCHLEVEL_H_ */
> diff --git a/package/bash/0014-bash50-014.patch b/package/bash/0014-bash50-014.patch
> new file mode 100644
> index 0000000000..2aadbda880
> --- /dev/null
> +++ b/package/bash/0014-bash50-014.patch
> @@ -0,0 +1,56 @@
> +From https://ftp.gnu.org/gnu/bash/bash-5.0-patches/bash50-014
> +
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +
> +			     BASH PATCH REPORT
> +			     =================
> +
> +Bash-Release:	5.0
> +Patch-ID:	bash50-014
> +
> +Bug-Reported-by:	Johannes Hielscher <jhielscher@posteo.de>
> +Bug-Reference-ID:	<20190208205048.77c25a83@hordevm>
> +Bug-Reference-URL:	https://lists.gnu.org/archive/html/bug-bash/2019-02/msg00032.html
> +
> +Bug-Description:
> +
> +If the current line is empty, using the emacs C-xC-e binding to enter the
> +editor will edit the previous command instead of the current (empty) one.
> +
> +Patch (apply with `patch -p0'):
> +
> +*** ../bash-5.0-patched/bashline.c	2019-01-16 16:13:21.000000000 -0500
> +--- b/bashline.c	2019-02-11 11:18:57.000000000 -0500
> +***************
> +*** 962,970 ****
> +  	 finished with the command, so we should not ignore the last command */
> +        using_history ();
> +!       if (rl_line_buffer[0])
> +! 	{
> +! 	  current_command_line_count++;	/* for rl_newline above */
> +! 	  bash_add_history (rl_line_buffer);
> +! 	}
> +        current_command_line_count = 0;	/* for dummy history entry */
> +        bash_add_history ("");
> +--- 965,970 ----
> +  	 finished with the command, so we should not ignore the last command */
> +        using_history ();
> +!       current_command_line_count++;	/* for rl_newline above */
> +!       bash_add_history (rl_line_buffer);
> +        current_command_line_count = 0;	/* for dummy history entry */
> +        bash_add_history ("");
> +*** ../bash-5.0/patchlevel.h	2016-06-22 14:51:03.000000000 -0400
> +--- b/patchlevel.h	2016-10-01 11:01:28.000000000 -0400
> +***************
> +*** 26,30 ****
> +     looks for to find the patch level (for the sccs version string). */
> +  
> +! #define PATCHLEVEL 13
> +  
> +  #endif /* _PATCHLEVEL_H_ */
> +--- 26,30 ----
> +     looks for to find the patch level (for the sccs version string). */
> +  
> +! #define PATCHLEVEL 14
> +  
> +  #endif /* _PATCHLEVEL_H_ */
> diff --git a/package/bash/0015-bash50-015.patch b/package/bash/0015-bash50-015.patch
> new file mode 100644
> index 0000000000..d927f41af8
> --- /dev/null
> +++ b/package/bash/0015-bash50-015.patch
> @@ -0,0 +1,82 @@
> +From https://ftp.gnu.org/gnu/bash/bash-5.0-patches/bash50-015
> +
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +
> +			     BASH PATCH REPORT
> +			     =================
> +
> +Bash-Release:	5.0
> +Patch-ID:	bash50-015
> +
> +Bug-Reported-by:	Yu Kou <ckyoog@gmail.com>
> +Bug-Reference-ID:	<CAAqoF9Ko3nAShJXGzucafs-ByUagzZ4nbQonwEkwC7s9UqfWKw@mail.gmail.com>
> +Bug-Reference-URL:	https://lists.gnu.org/archive/html/bug-bash/2019-05/msg00032.html
> +
> +Bug-Description:
> +
> +If alias expansion is enabled when processing the command argument to the
> +`-c' option, an alias is defined in that command, and the command ends with
> +the invocation of that alias, the shell's command parser can prematurely
> +terminate before the entire command is executed.
> +
> +Patch (apply with `patch -p0'):
> +
> +*** ../bash-20190426/builtins/evalstring.c	2019-01-29 14:15:19.000000000 -0500
> +--- b/builtins/evalstring.c	2019-05-15 14:19:36.000000000 -0400
> +***************
> +*** 92,95 ****
> +--- 92,96 ----
> +  	  running_trap == 0 &&
> +  	  *bash_input.location.string == '\0' &&
> ++ 	  parser_expanding_alias () == 0 &&
> +  	  command->type == cm_simple &&
> +  	  signal_is_trapped (EXIT_TRAP) == 0 &&
> +***************
> +*** 106,109 ****
> +--- 107,111 ----
> +  {
> +    return (*bash_input.location.string == '\0' &&
> ++ 	  parser_expanding_alias () == 0 &&
> +  	  (command->value.Connection->connector == AND_AND || command->value.Connection->connector == OR_OR || command->value.Connection->connector == ';') &&
> +  	  command->value.Connection->second->type == cm_simple);
> +***************
> +*** 291,295 ****
> +    with_input_from_string (string, from_file);
> +    clear_shell_input_line ();
> +!   while (*(bash_input.location.string))
> +      {
> +        command = (COMMAND *)NULL;
> +--- 293,297 ----
> +    with_input_from_string (string, from_file);
> +    clear_shell_input_line ();
> +!   while (*(bash_input.location.string) || parser_expanding_alias ())
> +      {
> +        command = (COMMAND *)NULL;
> +***************
> +*** 546,550 ****
> +  
> +    with_input_from_string (string, from_file);
> +!   while (*(bash_input.location.string))
> +      {
> +        command = (COMMAND *)NULL;
> +--- 548,552 ----
> +  
> +    with_input_from_string (string, from_file);
> +!   while (*(bash_input.location.string))		/* XXX - parser_expanding_alias () ? */
> +      {
> +        command = (COMMAND *)NULL;
> +*** ../bash-5.0/patchlevel.h	2016-06-22 14:51:03.000000000 -0400
> +--- b/patchlevel.h	2016-10-01 11:01:28.000000000 -0400
> +***************
> +*** 26,30 ****
> +     looks for to find the patch level (for the sccs version string). */
> +  
> +! #define PATCHLEVEL 14
> +  
> +  #endif /* _PATCHLEVEL_H_ */
> +--- 26,30 ----
> +     looks for to find the patch level (for the sccs version string). */
> +  
> +! #define PATCHLEVEL 15
> +  
> +  #endif /* _PATCHLEVEL_H_ */
> diff --git a/package/bash/0016-bash50-016.patch b/package/bash/0016-bash50-016.patch
> new file mode 100644
> index 0000000000..8dec1fb34c
> --- /dev/null
> +++ b/package/bash/0016-bash50-016.patch
> @@ -0,0 +1,62 @@
> +From https://ftp.gnu.org/gnu/bash/bash-5.0-patches/bash50-016
> +
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +
> +			     BASH PATCH REPORT
> +			     =================
> +
> +Bash-Release:	5.0
> +Patch-ID:	bash50-016
> +
> +Bug-Reported-by:	sunnycemetery at gmail.com
> +Bug-Reference-ID:	<20190316041534.GB22884@midnight>
> +Bug-Reference-URL:	https://lists.gnu.org/archive/html/bug-bash/2019-03/msg00070.html
> +
> +Bug-Description:
> +
> +Bash waits too long to reap /dev/fd process substitutions used as redirections
> +with loops and group commands, which can lead to file descriptor exhaustion.
> +
> +Patch (apply with `patch -p0'):
> +
> +*** ../bash-5.0-patched/execute_cmd.c	2019-04-19 15:46:36.000000000 -0400
> +--- b/execute_cmd.c	2019-07-01 16:45:49.000000000 -0400
> +***************
> +*** 1104,1107 ****
> +--- 1085,1104 ----
> +        discard_unwind_frame ("internal_fifos");
> +      }
> ++ # if defined (HAVE_DEV_FD)
> ++   /* Reap process substitutions at the end of loops */
> ++   switch (command->type)
> ++     {
> ++     case cm_while:
> ++     case cm_until:
> ++     case cm_for:
> ++     case cm_group:
> ++ #    if defined (ARITH_FOR_COMMAND)
> ++     case cm_arith_for:
> ++ #    endif
> ++       reap_procsubs ();
> ++     default:
> ++       break;
> ++     }
> ++ #  endif /* HAVE_DEV_FD */
> +  #endif
> +  
> +
> +*** ../bash-5.0/patchlevel.h	2016-06-22 14:51:03.000000000 -0400
> +--- b/patchlevel.h	2016-10-01 11:01:28.000000000 -0400
> +***************
> +*** 26,30 ****
> +     looks for to find the patch level (for the sccs version string). */
> +  
> +! #define PATCHLEVEL 15
> +  
> +  #endif /* _PATCHLEVEL_H_ */
> +--- 26,30 ----
> +     looks for to find the patch level (for the sccs version string). */
> +  
> +! #define PATCHLEVEL 16
> +  
> +  #endif /* _PATCHLEVEL_H_ */
> -- 
> 2.25.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
