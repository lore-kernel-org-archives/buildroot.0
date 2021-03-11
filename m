From: Peter Seiderer <ps.report@gmx.net>
Date: Thu, 11 Mar 2021 21:44:48 +0100
Subject: [Buildroot] [PATCH v1] package/bash: bump version to 5.1
Message-ID: <20210311204448.17994-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- removed 0001-bash50-001.patch to 0018-bash50-018.patch

- added 0001-bash51-001.patch, 0002-bash51-002.patch, 0003-bash51-003.patch,
  0004-bash51-004.patch

- moved 0019-input.h-add-missing-include-on-stdio.h.patch to
  0005-input.h-add-missing-include-on-stdio.h.patch

- removed 0020-locale.c-fix-build-without-wchar.patch
  (superseded by upstream commit)

- added 0006-locale-fix-typo-local_shiftstates-vs.-locale_shiftst.patch
  to fix typo from upstream commit (see previous patch)

- added 0007-glob-fix-dequote_pathname-vs.-udequote_pathname.patch

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/bash/0001-bash50-001.patch            | 170 ----------
 package/bash/0001-bash51-001.patch            |  83 +++++
 package/bash/0002-bash50-002.patch            | 117 -------
 package/bash/0002-bash51-002.patch            |  60 ++++
 package/bash/0003-bash50-003.patch            | 243 ---------------
 package/bash/0003-bash51-003.patch            |  56 ++++
 package/bash/0004-bash50-004.patch            |  57 ----
 package/bash/0004-bash51-004.patch            | 129 ++++++++
 package/bash/0005-bash50-005.patch            | 114 -------
 ...ut.h-add-missing-include-on-stdio.h.patch} |   0
 package/bash/0006-bash50-006.patch            |  51 ---
 ...local_shiftstates-vs.-locale_shiftst.patch |  72 +++++
 package/bash/0007-bash50-007.patch            |  66 ----
 ...quote_pathname-vs.-udequote_pathname.patch |  46 +++
 package/bash/0008-bash50-008.patch            |  72 -----
 package/bash/0009-bash50-009.patch            |  46 ---
 package/bash/0010-bash50-010.patch            | 176 -----------
 package/bash/0011-bash50-011.patch            |  63 ----
 package/bash/0012-bash50-012.patch            |  68 ----
 package/bash/0013-bash50-013.patch            |  77 -----
 package/bash/0014-bash50-014.patch            |  56 ----
 package/bash/0015-bash50-015.patch            |  82 -----
 package/bash/0016-bash50-016.patch            |  62 ----
 package/bash/0017-bash50-017.patch            | 293 ------------------
 package/bash/0018-bash50-018.patch            |  49 ---
 ...020-locale.c-fix-build-without-wchar.patch |  84 -----
 package/bash/bash.hash                        |   6 +-
 package/bash/bash.mk                          |   2 +-
 28 files changed, 450 insertions(+), 1950 deletions(-)
 delete mode 100644 package/bash/0001-bash50-001.patch
 create mode 100644 package/bash/0001-bash51-001.patch
 delete mode 100644 package/bash/0002-bash50-002.patch
 create mode 100644 package/bash/0002-bash51-002.patch
 delete mode 100644 package/bash/0003-bash50-003.patch
 create mode 100644 package/bash/0003-bash51-003.patch
 delete mode 100644 package/bash/0004-bash50-004.patch
 create mode 100644 package/bash/0004-bash51-004.patch
 delete mode 100644 package/bash/0005-bash50-005.patch
 rename package/bash/{0019-input.h-add-missing-include-on-stdio.h.patch => 0005-input.h-add-missing-include-on-stdio.h.patch} (100%)
 delete mode 100644 package/bash/0006-bash50-006.patch
 create mode 100644 package/bash/0006-locale-fix-typo-local_shiftstates-vs.-locale_shiftst.patch
 delete mode 100644 package/bash/0007-bash50-007.patch
 create mode 100644 package/bash/0007-glob-fix-dequote_pathname-vs.-udequote_pathname.patch
 delete mode 100644 package/bash/0008-bash50-008.patch
 delete mode 100644 package/bash/0009-bash50-009.patch
 delete mode 100644 package/bash/0010-bash50-010.patch
 delete mode 100644 package/bash/0011-bash50-011.patch
 delete mode 100644 package/bash/0012-bash50-012.patch
 delete mode 100644 package/bash/0013-bash50-013.patch
 delete mode 100644 package/bash/0014-bash50-014.patch
 delete mode 100644 package/bash/0015-bash50-015.patch
 delete mode 100644 package/bash/0016-bash50-016.patch
 delete mode 100644 package/bash/0017-bash50-017.patch
 delete mode 100644 package/bash/0018-bash50-018.patch
 delete mode 100644 package/bash/0020-locale.c-fix-build-without-wchar.patch

diff --git a/package/bash/0001-bash50-001.patch b/package/bash/0001-bash50-001.patch
deleted file mode 100644
index 90e89ce568..0000000000
--- a/package/bash/0001-bash50-001.patch
+++ /dev/null
@@ -1,170 +0,0 @@
-From https://ftp.gnu.org/gnu/bash/bash-5.0-patches/bash50-001
-
-Signed-off-by: Pascal de Bruijn <p.debruijn@unilogic.nl>
-
-			     BASH PATCH REPORT
-			     =================
-
-Bash-Release:	5.0
-Patch-ID:	bash50-001
-
-Bug-Reported-by:	axel at freakout.de
-Bug-Reference-ID:	<201901082050.x08KoShS006731@bongo.freakout.de>
-Bug-Reference-URL:	http://lists.gnu.org/archive/html/bug-bash/2019-01/msg00079.html
-
-Bug-Description:
-
-Under certain circumstances, the glob expansion code did not remove
-backslashes escaping characters in directory names (or portions of a
-pattern preceding a slash).
-
-Patch (apply with `patch -p0'):
-
-*** ../bash-5.0/bashline.c	2018-11-27 13:20:16.000000000 -0500
---- b/bashline.c	2019-01-16 16:06:03.000000000 -0500
-***************
-*** 232,235 ****
---- 232,236 ----
-  static int bash_possible_command_completions __P((int, int));
-  
-+ static int completion_glob_pattern __P((char *));
-  static char *glob_complete_word __P((const char *, int));
-  static int bash_glob_completion_internal __P((int));
-***************
-*** 1742,1746 ****
-    /* This could be a globbing pattern, so try to expand it using pathname
-       expansion. */
-!   if (!matches && glob_pattern_p (text))
-      {
-        matches = rl_completion_matches (text, glob_complete_word);
---- 1743,1747 ----
-    /* This could be a globbing pattern, so try to expand it using pathname
-       expansion. */
-!   if (!matches && completion_glob_pattern ((char *)text))
-      {
-        matches = rl_completion_matches (text, glob_complete_word);
-***************
-*** 1851,1855 ****
-  	}
-  
-!       globpat = glob_pattern_p (hint_text);
-  
-        /* If this is an absolute program name, do not check it against
---- 1852,1856 ----
-  	}
-  
-!       globpat = completion_glob_pattern ((char *)hint_text);
-  
-        /* If this is an absolute program name, do not check it against
-***************
-*** 3714,3717 ****
---- 3715,3773 ----
-  }
-  
-+ static int
-+ completion_glob_pattern (string)
-+      char *string;
-+ {
-+   register int c;
-+   char *send;
-+   int open;
-+ 
-+   DECLARE_MBSTATE;
-+ 
-+   open = 0;
-+   send = string + strlen (string);
-+ 
-+   while (c = *string++)
-+     {
-+       switch (c)
-+ 	{
-+ 	case '?':
-+ 	case '*':
-+ 	  return (1);
-+ 
-+ 	case '[':
-+ 	  open++;
-+ 	  continue;
-+ 
-+ 	case ']':
-+ 	  if (open)
-+ 	    return (1);
-+ 	  continue;
-+ 
-+ 	case '+':
-+ 	case '@':
-+ 	case '!':
-+ 	  if (*string == '(')	/*)*/
-+ 	    return (1);
-+ 	  continue;
-+ 
-+ 	case '\\':
-+ 	  if (*string == 0)
-+ 	    return (0);	 	  
-+ 	}
-+ 
-+       /* Advance one fewer byte than an entire multibyte character to
-+ 	 account for the auto-increment in the loop above. */
-+ #ifdef HANDLE_MULTIBYTE
-+       string--;
-+       ADVANCE_CHAR_P (string, send - string);
-+       string++;
-+ #else
-+       ADVANCE_CHAR_P (string, send - string);
-+ #endif
-+     }
-+   return (0);
-+ }
-+ 
-  static char *globtext;
-  static char *globorig;
-***************
-*** 3878,3882 ****
-      }      
-  
-!   if (t && glob_pattern_p (t) == 0)
-      rl_explicit_arg = 1;	/* XXX - force glob_complete_word to append `*' */
-    FREE (t);
---- 3934,3938 ----
-      }      
-  
-!   if (t && completion_glob_pattern (t) == 0)
-      rl_explicit_arg = 1;	/* XXX - force glob_complete_word to append `*' */
-    FREE (t);
-*** ../bash-5.0/lib/glob/glob_loop.c	2018-12-31 13:35:15.000000000 -0500
---- b/lib/glob/glob_loop.c	2019-01-09 09:44:36.000000000 -0500
-***************
-*** 55,59 ****
-  
-        case L('\\'):
-- #if 0
-  	/* Don't let the pattern end in a backslash (GMATCH returns no match
-  	   if the pattern ends in a backslash anyway), but otherwise return 1,
---- 55,58 ----
-***************
-*** 61,69 ****
-  	   and it can be removed. */
-  	return (*p != L('\0'));
-- #else
-- 	/* The pattern may not end with a backslash. */
-- 	if (*p++ == L('\0'))
-- 	  return 0;
-- #endif
-        }
-  
---- 60,63 ----
-*** ../bash-5.0/patchlevel.h	2016-06-22 14:51:03.000000000 -0400
---- b/patchlevel.h	2016-10-01 11:01:28.000000000 -0400
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
diff --git a/package/bash/0001-bash51-001.patch b/package/bash/0001-bash51-001.patch
new file mode 100644
index 0000000000..8f18cccc31
--- /dev/null
+++ b/package/bash/0001-bash51-001.patch
@@ -0,0 +1,83 @@
+[From http://mirror.keystealth.org/gnu/bash/bash-5.1-patches/bash51-001]
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+
+			     BASH PATCH REPORT
+			     =================
+
+Bash-Release:	5.1
+Patch-ID:	bash51-001
+
+Bug-Reported-by:	Fazal Majid <fazal@majid.org>
+Bug-Reference-ID:	<DEAB7D2C-C626-450C-B2E5-281AFF2D26D4@majid.org>
+Bug-Reference-URL:	https://lists.gnu.org/archive/html/bug-bash/2020-12/msg00000.html
+
+Bug-Description:
+
+There is a missing dependency on a constructed file, which can cause highly
+parellel builds to fail.
+
+Patch (apply with `patch -p0'):
+
+*** ../bash-5.1-patched/Makefile.in	2020-12-04 09:51:19.000000000 -0500
+--- b/Makefile.in	2020-12-16 11:28:36.000000000 -0500
+***************
+*** 1316,1319 ****
+--- 1316,1320 ----
+  bashline.o: pcomplete.h ${BASHINCDIR}/chartypes.h input.h
+  bashline.o: ${BASHINCDIR}/shmbutil.h ${BASHINCDIR}/shmbchar.h
++ bashline.o: ${DEFDIR}/builtext.h
+  bracecomp.o: config.h bashansi.h ${BASHINCDIR}/ansi_stdlib.h
+  bracecomp.o: shell.h syntax.h config.h bashjmp.h ${BASHINCDIR}/posixjmp.h
+***************
+*** 1436,1439 ****
+--- 1437,1441 ----
+  builtins/evalstring.o: jobs.h builtins.h flags.h input.h execute_cmd.h
+  builtins/evalstring.o: bashhist.h $(DEFSRC)/common.h pathnames.h
++ builtins/evalstring.o: ${DEFDIR}/builtext.h
+  builtins/getopt.o: config.h ${BASHINCDIR}/memalloc.h
+  builtins/getopt.o: shell.h syntax.h bashjmp.h command.h general.h xmalloc.h error.h
+
+*** ../bash-5.1-patched/builtins/Makefile.in	2019-07-25 08:03:45.000000000 -0400
+--- b/builtins/Makefile.in	2020-12-16 11:29:29.000000000 -0500
+***************
+*** 362,366 ****
+  evalstring.o: $(topdir)/flags.h $(topdir)/input.h $(topdir)/execute_cmd.h
+  evalstring.o: $(topdir)/bashhist.h $(srcdir)/common.h
+! evalstring.o: $(topdir)/trap.h $(topdir)/redir.h ../pathnames.h
+  #evalstring.o: $(topdir)/y.tab.h
+  getopt.o: ../config.h $(BASHINCDIR)/memalloc.h
+--- 362,366 ----
+  evalstring.o: $(topdir)/flags.h $(topdir)/input.h $(topdir)/execute_cmd.h
+  evalstring.o: $(topdir)/bashhist.h $(srcdir)/common.h
+! evalstring.o: $(topdir)/trap.h $(topdir)/redir.h ../pathnames.h ./builtext.h
+  #evalstring.o: $(topdir)/y.tab.h
+  getopt.o: ../config.h $(BASHINCDIR)/memalloc.h
+
+*** ../bash-5.1/patchlevel.h	2020-06-22 14:51:03.000000000 -0400
+--- b/patchlevel.h	2020-10-01 11:01:28.000000000 -0400
+***************
+*** 1,5 ****
+  /* patchlevel.h -- current bash patch level */
+  
+! /* Copyright (C) 2001-2016 Free Software Foundation, Inc.
+  
+     This file is part of GNU Bash, the Bourne Again SHell.
+--- 1,5 ----
+  /* patchlevel.h -- current bash patch level */
+  
+! /* Copyright (C) 2001-2020 Free Software Foundation, Inc.
+  
+     This file is part of GNU Bash, the Bourne Again SHell.
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
diff --git a/package/bash/0002-bash50-002.patch b/package/bash/0002-bash50-002.patch
deleted file mode 100644
index 60d0a76f9d..0000000000
--- a/package/bash/0002-bash50-002.patch
+++ /dev/null
@@ -1,117 +0,0 @@
-From https://ftp.gnu.org/gnu/bash/bash-5.0-patches/bash50-002
-
-Signed-off-by: Pascal de Bruijn <p.debruijn@unilogic.nl>
-
-			     BASH PATCH REPORT
-			     =================
-
-Bash-Release:	5.0
-Patch-ID:	bash50-002
-
-Bug-Reported-by:	Ante Peric <synthmeat@gmail.com>
-Bug-Reference-ID:	<B7E3B567-2467-4F7B-B6B9-CA4E75A9C93F@gmail.com>
-Bug-Reference-URL:	http://lists.gnu.org/archive/html/bug-bash/2019-01/msg00095.html
-
-Bug-Description:
-
-When an alias value ends with an unquoted literal tab (not part of a quoted
-string or comment), alias expansion cannot correctly detect the end of the
-alias value after expanding it.
-
-Patch (apply with `patch -p0'):
-
-*** ../bash-5.0/parser.h	2018-12-28 19:11:18.000000000 -0500
---- b/parser.h	2019-01-11 15:13:03.000000000 -0500
-***************
-*** 48,51 ****
---- 48,52 ----
-  #define PST_REDIRLIST	0x080000	/* parsing a list of redirections preceding a simple command name */
-  #define PST_COMMENT	0x100000	/* parsing a shell comment; used by aliases */
-+ #define PST_ENDALIAS	0x200000	/* just finished expanding and consuming an alias */
-  
-  /* Definition of the delimiter stack.  Needed by parse.y and bashhist.c. */
-*** ../bash-5.0/parse.y	2019-01-02 13:57:34.000000000 -0500
---- b/parse.y	2019-01-14 08:23:31.000000000 -0500
-***************
-*** 2558,2567 ****
-        pushed_string_list->flags != PSH_DPAREN &&
-        (parser_state & PST_COMMENT) == 0 &&
-        shell_input_line_index > 0 &&
-!       shell_input_line[shell_input_line_index-1] != ' ' &&
-        shell_input_line[shell_input_line_index-1] != '\n' &&
-        shellmeta (shell_input_line[shell_input_line_index-1]) == 0 &&
-        (current_delimiter (dstack) != '\'' && current_delimiter (dstack) != '"'))
-      {
-        return ' ';	/* END_ALIAS */
-      }
---- 2558,2569 ----
-        pushed_string_list->flags != PSH_DPAREN &&
-        (parser_state & PST_COMMENT) == 0 &&
-+       (parser_state & PST_ENDALIAS) == 0 &&	/* only once */
-        shell_input_line_index > 0 &&
-!       shellblank (shell_input_line[shell_input_line_index-1]) == 0 &&
-        shell_input_line[shell_input_line_index-1] != '\n' &&
-        shellmeta (shell_input_line[shell_input_line_index-1]) == 0 &&
-        (current_delimiter (dstack) != '\'' && current_delimiter (dstack) != '"'))
-      {
-+       parser_state |= PST_ENDALIAS;
-        return ' ';	/* END_ALIAS */
-      }
-***************
-*** 2572,2575 ****
---- 2574,2578 ----
-    if (uc == 0 && pushed_string_list && pushed_string_list->flags != PSH_SOURCE)
-      {
-+       parser_state &= ~PST_ENDALIAS;
-        pop_string ();
-        uc = shell_input_line[shell_input_line_index];
-*** ../bash-5.0/y.tab.c	2019-01-02 13:57:43.000000000 -0500
---- b/y.tab.c	2019-01-14 08:39:23.000000000 -0500
-***************
-*** 4874,4883 ****
-        pushed_string_list->flags != PSH_DPAREN &&
-        (parser_state & PST_COMMENT) == 0 &&
-        shell_input_line_index > 0 &&
-!       shell_input_line[shell_input_line_index-1] != ' ' &&
-        shell_input_line[shell_input_line_index-1] != '\n' &&
-        shellmeta (shell_input_line[shell_input_line_index-1]) == 0 &&
-        (current_delimiter (dstack) != '\'' && current_delimiter (dstack) != '"'))
-      {
-        return ' ';	/* END_ALIAS */
-      }
---- 4874,4885 ----
-        pushed_string_list->flags != PSH_DPAREN &&
-        (parser_state & PST_COMMENT) == 0 &&
-+       (parser_state & PST_ENDALIAS) == 0 &&	/* only once */
-        shell_input_line_index > 0 &&
-!       shellblank (shell_input_line[shell_input_line_index-1]) == 0 &&
-        shell_input_line[shell_input_line_index-1] != '\n' &&
-        shellmeta (shell_input_line[shell_input_line_index-1]) == 0 &&
-        (current_delimiter (dstack) != '\'' && current_delimiter (dstack) != '"'))
-      {
-+       parser_state |= PST_ENDALIAS;
-        return ' ';	/* END_ALIAS */
-      }
-***************
-*** 4888,4891 ****
---- 4890,4894 ----
-    if (uc == 0 && pushed_string_list && pushed_string_list->flags != PSH_SOURCE)
-      {
-+       parser_state &= ~PST_ENDALIAS;
-        pop_string ();
-        uc = shell_input_line[shell_input_line_index];
-*** ../bash-5.0/patchlevel.h	2016-06-22 14:51:03.000000000 -0400
---- b/patchlevel.h	2016-10-01 11:01:28.000000000 -0400
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
diff --git a/package/bash/0002-bash51-002.patch b/package/bash/0002-bash51-002.patch
new file mode 100644
index 0000000000..c9836082c1
--- /dev/null
+++ b/package/bash/0002-bash51-002.patch
@@ -0,0 +1,60 @@
+[From http://mirror.keystealth.org/gnu/bash/bash-5.1-patches/bash51-002]
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+
+			     BASH PATCH REPORT
+			     =================
+
+Bash-Release:	5.1
+Patch-ID:	bash51-002
+
+Bug-Reported-by:	oguzismailuysal at gmail.com
+Bug-Reference-ID:	<CAH7i3LoHFUa4aSF5-AD2r80HG-p-YzD_9ZxomarZkhP8NMq63g@mail.gmail.com>
+Bug-Reference-URL:	https://lists.gnu.org/archive/html/bug-bash/2020-12/msg00037.html
+
+Bug-Description:
+
+If there are no jobs, and the `-n' and `-p' options are both supplied to
+`wait', bash can assign a value to the variable name specified with `-p'
+instead of leaving it unset.
+
+Patch (apply with `patch -p0'):
+
+*** ../bash-5.1-patched/builtins/wait.def	2020-04-09 15:13:57.000000000 -0400
+--- b/builtins/wait.def	2020-12-11 09:46:49.000000000 -0500
+***************
+*** 214,222 ****
+  
+        status = wait_for_any_job (wflags, &pstat);
+-       if (status < 0)
+- 	status = 127;
+- 
+        if (vname && status >= 0)
+  	bind_var_to_int (vname, pstat.pid);
+        if (list)
+  	unset_waitlist ();
+--- 214,222 ----
+  
+        status = wait_for_any_job (wflags, &pstat);
+        if (vname && status >= 0)
+  	bind_var_to_int (vname, pstat.pid);
++ 
++       if (status < 0)
++ 	status = 127;
+        if (list)
+  	unset_waitlist ();
+
+*** ../bash-5.1/patchlevel.h	2020-06-22 14:51:03.000000000 -0400
+--- b/patchlevel.h	2020-10-01 11:01:28.000000000 -0400
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
diff --git a/package/bash/0003-bash50-003.patch b/package/bash/0003-bash50-003.patch
deleted file mode 100644
index 12edb16a2a..0000000000
--- a/package/bash/0003-bash50-003.patch
+++ /dev/null
@@ -1,243 +0,0 @@
-From https://ftp.gnu.org/gnu/bash/bash-5.0-patches/bash50-003
-
-Signed-off-by: Pascal de Bruijn <p.debruijn@unilogic.nl>
-
-			     BASH PATCH REPORT
-			     =================
-
-Bash-Release:	5.0
-Patch-ID:	bash50-003
-
-Bug-Reported-by:	Andrew Church <achurch+bash@achurch.org>
-Bug-Reference-ID:	<5c534aa2.04371@msgid.achurch.org>
-Bug-Reference-URL:	http://lists.gnu.org/archive/html/bug-bash/2019-01/msg00276.html
-
-Bug-Description:
-
-There are several incompatibilities in how bash-5.0 processes pathname
-expansion (globbing) of filename arguments that have backslashes in the
-directory portion.
-
-Patch (apply with `patch -p0'):
-
-*** ../bash-5.0-patched/lib/glob/glob_loop.c	2019-01-16 16:13:21.000000000 -0500
---- b/lib/glob/glob_loop.c	2019-02-01 09:45:11.000000000 -0500
-***************
-*** 27,34 ****
-    register const GCHAR *p;
-    register GCHAR c;
-!   int bopen;
-  
-    p = pattern;
-!   bopen = 0;
-  
-    while ((c = *p++) != L('\0'))
---- 27,34 ----
-    register const GCHAR *p;
-    register GCHAR c;
-!   int bopen, bsquote;
-  
-    p = pattern;
-!   bopen = bsquote = 0;
-  
-    while ((c = *p++) != L('\0'))
-***************
-*** 56,66 ****
-        case L('\\'):
-  	/* Don't let the pattern end in a backslash (GMATCH returns no match
-! 	   if the pattern ends in a backslash anyway), but otherwise return 1,
-! 	   since the matching engine uses backslash as an escape character
-! 	   and it can be removed. */
-! 	return (*p != L('\0'));
-        }
-  
-!   return 0;
-  }
-  
---- 56,75 ----
-        case L('\\'):
-  	/* Don't let the pattern end in a backslash (GMATCH returns no match
-! 	   if the pattern ends in a backslash anyway), but otherwise note that 
-! 	   we have seen this, since the matching engine uses backslash as an
-! 	   escape character and it can be removed. We return 2 later if we
-! 	   have seen only backslash-escaped characters, so interested callers
-! 	   know they can shortcut and just dequote the pathname. */
-! 	if (*p != L('\0'))
-! 	  {
-! 	    p++;
-! 	    bsquote = 1;
-! 	    continue;
-! 	  }
-! 	else 	/* (*p == L('\0')) */
-! 	  return 0;
-        }
-  
-!   return bsquote ? 2 : 0;
-  }
-  
-*** ../bash-5.0-patched/lib/glob/glob.h	2013-10-28 14:46:12.000000000 -0400
---- b/lib/glob/glob.h	2019-03-07 11:06:47.000000000 -0500
-***************
-*** 31,34 ****
---- 31,35 ----
-  #define GX_ADDCURDIR	0x200	/* internal -- add passed directory name */
-  #define GX_GLOBSTAR	0x400	/* turn on special handling of ** */
-+ #define GX_RECURSE	0x800	/* internal -- glob_filename called recursively */
-  
-  extern int glob_pattern_p __P((const char *));
-*** ../bash-5.0-patched/lib/glob/glob.c	2018-09-20 10:53:23.000000000 -0400
---- b/lib/glob/glob.c	2019-03-07 14:23:43.000000000 -0500
-***************
-*** 1062,1066 ****
-    unsigned int directory_len;
-    int free_dirname;			/* flag */
-!   int dflags;
-  
-    result = (char **) malloc (sizeof (char *));
---- 1078,1082 ----
-    unsigned int directory_len;
-    int free_dirname;			/* flag */
-!   int dflags, hasglob;
-  
-    result = (char **) malloc (sizeof (char *));
-***************
-*** 1111,1117 ****
-      }
-  
-    /* If directory_name contains globbing characters, then we
-!      have to expand the previous levels.  Just recurse. */
-!   if (directory_len > 0 && glob_pattern_p (directory_name))
-      {
-        char **directories, *d, *p;
---- 1127,1136 ----
-      }
-  
-+   hasglob = 0;
-    /* If directory_name contains globbing characters, then we
-!      have to expand the previous levels.  Just recurse.
-!      If glob_pattern_p returns != [0,1] we have a pattern that has backslash
-!      quotes but no unquoted glob pattern characters. We dequote it below. */
-!   if (directory_len > 0 && (hasglob = glob_pattern_p (directory_name)) == 1)
-      {
-        char **directories, *d, *p;
-***************
-*** 1176,1180 ****
-  	d[directory_len - 1] = '\0';
-  
-!       directories = glob_filename (d, dflags);
-  
-        if (free_dirname)
---- 1195,1199 ----
-  	d[directory_len - 1] = '\0';
-  
-!       directories = glob_filename (d, dflags|GX_RECURSE);
-  
-        if (free_dirname)
-***************
-*** 1333,1336 ****
---- 1352,1369 ----
-  	  return (NULL);
-  	}
-+       /* If we have a directory name with quoted characters, and we are
-+ 	 being called recursively to glob the directory portion of a pathname,
-+ 	 we need to dequote the directory name before returning it so the
-+ 	 caller can read the directory */
-+       if (directory_len > 0 && hasglob == 2 && (flags & GX_RECURSE) != 0)
-+ 	{
-+ 	  dequote_pathname (directory_name);
-+ 	  directory_len = strlen (directory_name);
-+ 	}
-+ 
-+       /* We could check whether or not the dequoted directory_name is a
-+ 	 directory and return it here, returning the original directory_name
-+ 	 if not, but we don't do that yet. I'm not sure it matters. */
-+ 
-        /* Handle GX_MARKDIRS here. */
-        result[0] = (char *) malloc (directory_len + 1);
-*** ../bash-5.0-patched/pathexp.c	2018-04-29 17:44:48.000000000 -0400
---- b/pathexp.c	2019-01-31 20:19:41.000000000 -0500
-***************
-*** 66,74 ****
-    register int c;
-    char *send;
-!   int open;
-  
-    DECLARE_MBSTATE;
-  
-!   open = 0;
-    send = string + strlen (string);
-  
---- 66,74 ----
-    register int c;
-    char *send;
-!   int open, bsquote;
-  
-    DECLARE_MBSTATE;
-  
-!   open = bsquote = 0;
-    send = string + strlen (string);
-  
-***************
-*** 101,105 ****
-  	   globbing. */
-  	case '\\':
-! 	  return (*string != 0);
-  	 	  
-  	case CTLESC:
---- 101,112 ----
-  	   globbing. */
-  	case '\\':
-! 	  if (*string != '\0' && *string != '/')
-! 	    {
-! 	      bsquote = 1;
-! 	      string++;
-! 	      continue;
-! 	    }
-! 	  else if (*string == 0)
-! 	    return (0);
-  	 	  
-  	case CTLESC:
-***************
-*** 118,122 ****
-  #endif
-      }
-!   return (0);
-  }
-  
---- 125,130 ----
-  #endif
-      }
-! 
-!   return (bsquote ? 2 : 0);
-  }
-  
-*** ../bash-5.0-patched/bashline.c	2019-01-16 16:13:21.000000000 -0500
---- b/bashline.c	2019-02-22 09:29:08.000000000 -0500
-***************
-*** 3753,3757 ****
-  
-  	case '\\':
-! 	  if (*string == 0)
-  	    return (0);	 	  
-  	}
---- 3766,3770 ----
-  
-  	case '\\':
-! 	  if (*string++ == 0)
-  	    return (0);	 	  
-  	}
-*** ../bash-5.0/patchlevel.h	2016-06-22 14:51:03.000000000 -0400
---- b/patchlevel.h	2016-10-01 11:01:28.000000000 -0400
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
diff --git a/package/bash/0003-bash51-003.patch b/package/bash/0003-bash51-003.patch
new file mode 100644
index 0000000000..ff13fb0c9f
--- /dev/null
+++ b/package/bash/0003-bash51-003.patch
@@ -0,0 +1,56 @@
+[From http://mirror.keystealth.org/gnu/bash/bash-5.1-patches/bash51-003]
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+
+			     BASH PATCH REPORT
+			     =================
+
+Bash-Release:	5.1
+Patch-ID:	bash51-003
+
+Bug-Reported-by:	oguzismailuysal at gmail.com
+Bug-Reference-ID:	<CAH7i3LpG91BnNcDtaTUm2Ph7a+PnJkuh6nAc87cVL7_38tOaMQ@mail.gmail.com>
+Bug-Reference-URL:	https://lists.gnu.org/archive/html/bug-bash/2020-12/msg00050.html
+
+Bug-Description:
+
+Bash does not put a command substitution process that is started to perform an
+expansion in a child process into the right process group where it can receive
+keyboard-generated signals.
+
+Patch (apply with `patch -p0'):
+
+*** ../bash-5.1-patched/subst.c	2020-11-16 10:33:15.000000000 -0500
+--- b/subst.c	2020-12-12 13:50:11.000000000 -0500
+***************
+*** 6357,6362 ****
+  #if defined (JOB_CONTROL)
+    old_pipeline_pgrp = pipeline_pgrp;
+!   /* Don't reset the pipeline pgrp if we're already a subshell in a pipeline. */
+!   if ((subshell_environment & SUBSHELL_PIPE) == 0)
+      pipeline_pgrp = shell_pgrp;
+    cleanup_the_pipeline ();
+--- 6357,6364 ----
+  #if defined (JOB_CONTROL)
+    old_pipeline_pgrp = pipeline_pgrp;
+!   /* Don't reset the pipeline pgrp if we're already a subshell in a pipeline or
+!      we've already forked to run a disk command (and are expanding redirections,
+!      for example). */
+!   if ((subshell_environment & (SUBSHELL_FORK|SUBSHELL_PIPE)) == 0)
+      pipeline_pgrp = shell_pgrp;
+    cleanup_the_pipeline ();
+
+*** ../bash-5.1/patchlevel.h	2020-06-22 14:51:03.000000000 -0400
+--- b/patchlevel.h	2020-10-01 11:01:28.000000000 -0400
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
diff --git a/package/bash/0004-bash50-004.patch b/package/bash/0004-bash50-004.patch
deleted file mode 100644
index b27358609b..0000000000
--- a/package/bash/0004-bash50-004.patch
+++ /dev/null
@@ -1,57 +0,0 @@
-From https://ftp.gnu.org/gnu/bash/bash-5.0-patches/bash50-004
-
-Signed-off-by: Pascal de Bruijn <p.debruijn@unilogic.nl>
-
-			     BASH PATCH REPORT
-			     =================
-
-Bash-Release:	5.0
-Patch-ID:	bash50-004
-
-Bug-Reported-by:	Daniel Kahn Gillmor <dkg@fifthhorseman.net>
-Bug-Reference-ID:	<87lg0g8aiw.fsf@fifthhorseman.net>
-Bug-Reference-URL:	http://lists.gnu.org/archive/html/bug-bash/2019-04/msg00076.html
-
-Bug-Description:
-
-In bash-5.0, the `wait' builtin without arguments waits for all children of the
-shell. This includes children it `inherited' at shell invocation time. This
-patch modifies the behavior to not wait for these inherited children, some
-of which might be long-lived.
-
-Patch (apply with `patch -p0'):
-
-*** ../bash-5.0-patched/jobs.c	2018-12-06 11:44:34.000000000 -0500
---- b/jobs.c	2019-04-12 15:15:10.000000000 -0400
-***************
-*** 2489,2496 ****
-    wait_procsubs ();
-    reap_procsubs ();
-! #if 1
-    /* We don't want to wait indefinitely if we have stopped children. */
--   /* XXX - should add a loop that goes through the list of process
--      substitutions and waits for each proc in turn before this code. */
-    if (any_stopped == 0)
-      {
---- 2490,2495 ----
-    wait_procsubs ();
-    reap_procsubs ();
-! #if 0
-    /* We don't want to wait indefinitely if we have stopped children. */
-    if (any_stopped == 0)
-      {
-*** ../bash-5.0/patchlevel.h	2016-06-22 14:51:03.000000000 -0400
---- b/patchlevel.h	2016-10-01 11:01:28.000000000 -0400
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
diff --git a/package/bash/0004-bash51-004.patch b/package/bash/0004-bash51-004.patch
new file mode 100644
index 0000000000..48a38645f7
--- /dev/null
+++ b/package/bash/0004-bash51-004.patch
@@ -0,0 +1,129 @@
+[From http://mirror.keystealth.org/gnu/bash/bash-5.1-patches/bash51-004]
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+
+			     BASH PATCH REPORT
+			     =================
+
+Bash-Release:	5.1
+Patch-ID:	bash51-004
+
+Bug-Reported-by:	oguzismailuysal at gmail.com
+Bug-Reference-ID:	<CAH7i3LoHGmwaghDpCWRUfcY04gQmeDTH3RiG=bf2b=KbU=gyhw@mail.gmail.com>
+Bug-Reference-URL:	https://lists.gnu.org/archive/html/bug-bash/2020-12/msg00039.html
+
+Bug-Description:
+
+If a key-value compound array assignment to an associative array is supplied
+as an assignment statement argument to the `declare' command that declares the
+array, the assignment doesn't perform the correct word expansions.
+
+This patch makes key-value assignment and subscript assignment perform the
+same expansions when they're supplied as an argument to `declare'.
+
+Patch (apply with `patch -p0'):
+
+*** ../bash-5.1-patched/arrayfunc.c	2020-10-09 11:38:58.000000000 -0400
+--- b/arrayfunc.c	2020-12-11 15:12:22.000000000 -0500
+***************
+*** 598,601 ****
+--- 598,622 ----
+      }
+  }
++ 
++ /* Return non-zero if L appears to be a key-value pair associative array
++    compound assignment. */ 
++ int
++ kvpair_assignment_p (l)
++      WORD_LIST *l;
++ {
++   return (l && (l->word->flags & W_ASSIGNMENT) == 0 && l->word->word[0] != '[');	/*]*/
++ }
++ 
++ char *
++ expand_and_quote_kvpair_word (w)
++      char *w;
++ {
++   char *t, *r;
++ 
++   t = w ? expand_assignment_string_to_string (w, 0) : 0;
++   r = sh_single_quote (t ? t : "");
++   free (t);
++   return r;
++ }
+  #endif
+       
+***************
+*** 641,645 ****
+  
+  #if ASSOC_KVPAIR_ASSIGNMENT
+!   if (assoc_p (var) && nlist && (nlist->word->flags & W_ASSIGNMENT) == 0 && nlist->word->word[0] != '[')	/*]*/
+      {
+        iflags = flags & ~ASS_APPEND;
+--- 662,666 ----
+  
+  #if ASSOC_KVPAIR_ASSIGNMENT
+!   if (assoc_p (var) && kvpair_assignment_p (nlist))
+      {
+        iflags = flags & ~ASS_APPEND;
+*** ../bash-5.1-patched/arrayfunc.h	2020-04-29 17:24:15.000000000 -0400
+--- b/arrayfunc.h	2020-12-11 14:23:50.000000000 -0500
+***************
+*** 68,71 ****
+--- 68,74 ----
+  extern void quote_compound_array_list PARAMS((WORD_LIST *, int));
+  
++ extern int kvpair_assignment_p PARAMS((WORD_LIST *));
++ extern char *expand_and_quote_kvpair_word PARAMS((char *));
++ 
+  extern int unbind_array_element PARAMS((SHELL_VAR *, char *, int));
+  extern int skipsubscript PARAMS((const char *, int, int));
+*** ../bash-5.1-patched/subst.c	2020-11-16 10:33:15.000000000 -0500
+--- b/subst.c	2020-12-11 15:11:10.000000000 -0500
+***************
+*** 11605,11608 ****
+--- 11605,11609 ----
+    WORD_LIST *l, *nl;
+    char *t;
++   int kvpair;
+    
+    if (flags == 0)
+***************
+*** 11619,11622 ****
+--- 11620,11627 ----
+        /* Associative array */
+        l = parse_string_to_word_list (value, 1, "array assign");
++ #if ASSOC_KVPAIR_ASSIGNMENT
++       kvpair = kvpair_assignment_p (l);
++ #endif
++ 
+        /* For associative arrays, with their arbitrary subscripts, we have to
+  	 expand and quote in one step so we don't have to search for the
+***************
+*** 11624,11627 ****
+--- 11629,11638 ----
+        for (nl = l; nl; nl = nl->next)
+  	{
++ #if ASSOC_KVPAIR_ASSIGNMENT
++ 	  if (kvpair)
++ 	    /* keys and values undergo the same set of expansions */
++ 	    t = expand_and_quote_kvpair_word (nl->word->word);
++ 	  else
++ #endif
+  	  if ((nl->word->flags & W_ASSIGNMENT) == 0)
+  	    t = sh_single_quote (nl->word->word ? nl->word->word : "");
+
+*** ../bash-5.1/patchlevel.h	2020-06-22 14:51:03.000000000 -0400
+--- b/patchlevel.h	2020-10-01 11:01:28.000000000 -0400
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
diff --git a/package/bash/0005-bash50-005.patch b/package/bash/0005-bash50-005.patch
deleted file mode 100644
index df1772f9ba..0000000000
--- a/package/bash/0005-bash50-005.patch
+++ /dev/null
@@ -1,114 +0,0 @@
-From https://ftp.gnu.org/gnu/bash/bash-5.0-patches/bash50-005
-
-Signed-off-by: Pascal de Bruijn <p.debruijn@unilogic.nl>
-
-			     BASH PATCH REPORT
-			     =================
-
-Bash-Release:	5.0
-Patch-ID:	bash50-005
-
-Bug-Reported-by:	Brad Spencer <bspencer@blackberry.com>
-Bug-Reference-ID:	<1b993ff2-ce4f-662a-6be4-393457362e47@blackberry.com>
-Bug-Reference-URL:	http://lists.gnu.org/archive/html/bug-bash/2019-01/msg00250.html
-
-Bug-Description:
-
-In certain cases, bash optimizes out a fork() call too early and prevents
-traps from running.
-
-Patch (apply with `patch -p0'):
-
-*** ../bash-5.0-patched/command.h	2018-07-20 21:16:31.000000000 -0400
---- b/command.h	2019-02-20 11:09:36.000000000 -0500
-***************
-*** 187,190 ****
---- 188,192 ----
-  #define CMD_LASTPIPE	    0x2000
-  #define CMD_STDPATH	    0x4000	/* use standard path for command lookup */
-+ #define CMD_TRY_OPTIMIZING  0x8000	/* try to optimize this simple command */
-  
-  /* What a command looks like. */
-*** ../bash-5.0-patched/builtins/evalstring.c	2018-12-26 11:19:21.000000000 -0500
---- b/builtins/evalstring.c	2019-01-29 14:15:19.000000000 -0500
-***************
-*** 101,104 ****
---- 101,113 ----
-  }
-  
-+ int
-+ can_optimize_connection (command)
-+      COMMAND *command;
-+ {
-+   return (*bash_input.location.string == '\0' &&
-+ 	  (command->value.Connection->connector == AND_AND || command->value.Connection->connector == OR_OR || command->value.Connection->connector == ';') &&
-+ 	  command->value.Connection->second->type == cm_simple);
-+ }
-+ 
-  void
-  optimize_fork (command)
-***************
-*** 106,110 ****
-  {
-    if (command->type == cm_connection &&
-!       (command->value.Connection->connector == AND_AND || command->value.Connection->connector == OR_OR) &&
-        should_suppress_fork (command->value.Connection->second))
-      {
---- 115,120 ----
-  {
-    if (command->type == cm_connection &&
-!       (command->value.Connection->connector == AND_AND || command->value.Connection->connector == OR_OR || command->value.Connection->connector == ';') &&
-!       (command->value.Connection->second->flags & CMD_TRY_OPTIMIZING) &&
-        should_suppress_fork (command->value.Connection->second))
-      {
-***************
-*** 413,418 ****
-  		  command->value.Simple->flags |= CMD_NO_FORK;
-  		}
-! 	      else if (command->type == cm_connection)
-! 		optimize_fork (command);
-  #endif /* ONESHOT */
-  
---- 423,438 ----
-  		  command->value.Simple->flags |= CMD_NO_FORK;
-  		}
-! 
-! 	      /* Can't optimize forks out here execept for simple commands.
-! 		 This knows that the parser sets up commands as left-side heavy
-! 		 (&& and || are left-associative) and after the single parse,
-! 		 if we are at the end of the command string, the last in a
-! 		 series of connection commands is
-! 		 command->value.Connection->second. */
-! 	      else if (command->type == cm_connection && can_optimize_connection (command))
-! 		{
-! 		  command->value.Connection->second->flags |= CMD_TRY_OPTIMIZING;
-! 		  command->value.Connection->second->value.Simple->flags |= CMD_TRY_OPTIMIZING;
-! 		}
-  #endif /* ONESHOT */
-  
-*** ../bash-5.0-patched/execute_cmd.c	2018-12-05 09:05:14.000000000 -0500
---- b/execute_cmd.c	2019-01-25 15:59:00.000000000 -0500
-***************
-*** 2768,2771 ****
---- 2768,2773 ----
-  	   (exec_result != EXECUTION_SUCCESS)))
-  	{
-+ 	  optimize_fork (command);
-+ 
-  	  second = command->value.Connection->second;
-  	  if (ignore_return && second)
-*** ../bash-5.0/patchlevel.h	2016-06-22 14:51:03.000000000 -0400
---- b/patchlevel.h	2016-10-01 11:01:28.000000000 -0400
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
diff --git a/package/bash/0019-input.h-add-missing-include-on-stdio.h.patch b/package/bash/0005-input.h-add-missing-include-on-stdio.h.patch
similarity index 100%
rename from package/bash/0019-input.h-add-missing-include-on-stdio.h.patch
rename to package/bash/0005-input.h-add-missing-include-on-stdio.h.patch
diff --git a/package/bash/0006-bash50-006.patch b/package/bash/0006-bash50-006.patch
deleted file mode 100644
index e447989d05..0000000000
--- a/package/bash/0006-bash50-006.patch
+++ /dev/null
@@ -1,51 +0,0 @@
-From https://ftp.gnu.org/gnu/bash/bash-5.0-patches/bash50-006
-
-Signed-off-by: Pascal de Bruijn <p.debruijn@unilogic.nl>
-
-			     BASH PATCH REPORT
-			     =================
-
-Bash-Release:	5.0
-Patch-ID:	bash50-006
-
-Bug-Reported-by:	Tomas Mozes <hydrapolic@gmail.com>
-Bug-Reference-ID:	<CAG6MAzQumLU2vhnmr1UrYAUQAFW5Yo8hfM_sEibX9RJQWJkRrA@mail.gmail.com>
-Bug-Reference-URL:	http://lists.gnu.org/archive/html/bug-bash/2019-03/msg00037.html
-
-Bug-Description:
-
-Bash-5.0 did not build successfully if SYSLOG_HISTORY was defined without
-also defining SYSLOG_SHOPT.
-
-Patch (apply with `patch -p0'):
-
-*** ../bash-5.0-patched/builtins/shopt.def	2018-10-05 14:49:02.000000000 -0400
---- b/builtins/shopt.def	2019-01-23 09:55:22.000000000 -0500
-***************
-*** 123,127 ****
-  #endif
-  
-! #if defined (SYSLOG_HISTORY) && defined (SYSLOG_SHOPT)
-  extern int syslog_history;
-  #endif
---- 123,127 ----
-  #endif
-  
-! #if defined (SYSLOG_HISTORY)
-  extern int syslog_history;
-  #endif
-*** ../bash-5.0/patchlevel.h	2016-06-22 14:51:03.000000000 -0400
---- b/patchlevel.h	2016-10-01 11:01:28.000000000 -0400
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
diff --git a/package/bash/0006-locale-fix-typo-local_shiftstates-vs.-locale_shiftst.patch b/package/bash/0006-locale-fix-typo-local_shiftstates-vs.-locale_shiftst.patch
new file mode 100644
index 0000000000..1636c18036
--- /dev/null
+++ b/package/bash/0006-locale-fix-typo-local_shiftstates-vs.-locale_shiftst.patch
@@ -0,0 +1,72 @@
+From 3d6b9e18506ad9daf4ec7b7d406b38d58ec88009 Mon Sep 17 00:00:00 2001
+From: Peter Seiderer <ps.report@gmx.net>
+Date: Thu, 11 Mar 2021 20:48:36 +0100
+Subject: [PATCH] locale: fix typo local_shiftstates vs. locale_shiftstates
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Fixes:
+
+  locale.c:94:3: error: ?local_shiftstates? undeclared (first use in this function); did you mean ?locale_shiftstates??
+     94 |   local_shiftstates = 0;
+        |   ^~~~~~~~~~~~~~~~~
+        |   locale_shiftstates
+
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+---
+ locale.c | 10 +++++-----
+ 1 file changed, 5 insertions(+), 5 deletions(-)
+
+diff --git a/locale.c b/locale.c
+index 17ccc58..d6dd95a 100644
+--- a/locale.c
++++ b/locale.c
+@@ -91,7 +91,7 @@ set_default_locale ()
+ #if defined (HANDLE_MULTIBYTE)
+   locale_shiftstates = mblen ((char *)NULL, 0);
+ #else
+-  local_shiftstates = 0;
++  locale_shiftstates = 0;
+ #endif
+ }
+ 
+@@ -117,7 +117,7 @@ set_default_locale_vars ()
+ #    if defined (HANDLE_MULTIBYTE)
+       locale_shiftstates = mblen ((char *)NULL, 0);
+ #    else
+-      local_shiftstates = 0;
++      locale_shiftstates = 0;
+ #    endif
+ 
+       u32reset ();
+@@ -226,7 +226,7 @@ set_locale_var (var, value)
+ #  if defined (HANDLE_MULTIBYTE)
+       locale_shiftstates = mblen ((char *)NULL, 0);
+ #  else
+-      local_shiftstates = 0;
++      locale_shiftstates = 0;
+ #  endif
+       u32reset ();
+       return r;
+@@ -250,7 +250,7 @@ set_locale_var (var, value)
+ #if defined (HANDLE_MULTIBYTE)
+ 	  locale_shiftstates = mblen ((char *)NULL, 0);
+ #else
+-	  local_shiftstates = 0;
++	  locale_shiftstates = 0;
+ #endif
+ 	  u32reset ();
+ 	}
+@@ -391,7 +391,7 @@ reset_locale_vars ()
+ #  if defined (HANDLE_MULTIBYTE)
+   locale_shiftstates = mblen ((char *)NULL, 0);
+ #  else
+-  local_shiftstates = 0;
++  locale_shiftstates = 0;
+ #  endif
+   u32reset ();
+ #endif
+-- 
+2.30.1
+
diff --git a/package/bash/0007-bash50-007.patch b/package/bash/0007-bash50-007.patch
deleted file mode 100644
index 164dfcc9e0..0000000000
--- a/package/bash/0007-bash50-007.patch
+++ /dev/null
@@ -1,66 +0,0 @@
-From https://ftp.gnu.org/gnu/bash/bash-5.0-patches/bash50-007
-
-Signed-off-by: Pascal de Bruijn <p.debruijn@unilogic.nl>
-
-			     BASH PATCH REPORT
-			     =================
-
-Bash-Release:	5.0
-Patch-ID:	bash50-007
-
-Bug-Reported-by:	Grisha Levit <grishalevit@gmail.com>
-Bug-Reference-ID:	<CAMu=BroHapG1AS3xB5SQaCX2XKu=-E2Ob9uW6LNuHvd=YohrDw@mail.gmail.com>
-Bug-Reference-URL:	http://lists.gnu.org/archive/html/bug-bash/2019-02/msg00067.html
-
-Bug-Description:
-
-Running `exec' when job control was disabled, even temporarily, but after it
-had been initialized, could leave the terminal in the wrong process group for
-the executed process.
-
-Patch (apply with `patch -p0'):
-
-*** ../bash-5.0-patched/jobs.c	2018-12-06 11:44:34.000000000 -0500
---- b/jobs.c	2019-04-12 15:15:10.000000000 -0400
-***************
-*** 4838,4850 ****
-  {
-    if (job_control)
-!     {
-!       terminate_stopped_jobs ();
-  
-!       if (original_pgrp >= 0)
-! 	give_terminal_to (original_pgrp, 1);
-!     }
-  
-!   if (original_pgrp >= 0)
-!     setpgid (0, original_pgrp);
-  }
-  
---- 4838,4848 ----
-  {
-    if (job_control)
-!     terminate_stopped_jobs ();
-  
-!   if (original_pgrp >= 0 && terminal_pgrp != original_pgrp)
-!     give_terminal_to (original_pgrp, 1);
-  
-!   if (original_pgrp >= 0 && setpgid (0, original_pgrp) == 0)
-!     shell_pgrp = original_pgrp;
-  }
-  
-*** ../bash-5.0/patchlevel.h	2016-06-22 14:51:03.000000000 -0400
---- b/patchlevel.h	2016-10-01 11:01:28.000000000 -0400
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
diff --git a/package/bash/0007-glob-fix-dequote_pathname-vs.-udequote_pathname.patch b/package/bash/0007-glob-fix-dequote_pathname-vs.-udequote_pathname.patch
new file mode 100644
index 0000000000..b769dc296e
--- /dev/null
+++ b/package/bash/0007-glob-fix-dequote_pathname-vs.-udequote_pathname.patch
@@ -0,0 +1,46 @@
+From a60ab1e5e88863acf9b0e9bcaa7919bbf093da05 Mon Sep 17 00:00:00 2001
+From: Peter Seiderer <ps.report@gmx.net>
+Date: Thu, 11 Mar 2021 20:55:52 +0100
+Subject: [PATCH] glob: fix dequote_pathname vs. udequote_pathname
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Fixes:
+
+  glob.c:123:28: error: static declaration of ?udequote_pathname? follows non-static declaration
+    123 | #  define dequote_pathname udequote_pathname
+        |                            ^~~~~~~~~~~~~~~~~
+  glob.c:125:13: note: in expansion of macro ?dequote_pathname?
+    125 | static void dequote_pathname PARAMS((char *));
+        |             ^~~~~~~~~~~~~~~~
+  glob.c:118:6: note: previous declaration of ?udequote_pathname? was here
+    118 | void udequote_pathname PARAMS((char *));
+        |      ^~~~~~~~~~~~~~~~~
+
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+---
+ lib/glob/glob.c | 3 +--
+ 1 file changed, 1 insertion(+), 2 deletions(-)
+
+diff --git a/lib/glob/glob.c b/lib/glob/glob.c
+index eb6277f..c903b15 100644
+--- a/lib/glob/glob.c
++++ b/lib/glob/glob.c
+@@ -117,12 +117,11 @@ static int mbskipname PARAMS((char *, char *, int));
+ #endif
+ void udequote_pathname PARAMS((char *));
+ #if HANDLE_MULTIBYTE
+-void wcdequote_pathname PARAMS((wchar_t *));
++static void wcdequote_pathname PARAMS((wchar_t *));
+ static void wdequote_pathname PARAMS((char *));
+ #else
+ #  define dequote_pathname udequote_pathname
+ #endif
+-static void dequote_pathname PARAMS((char *));
+ static int glob_testdir PARAMS((char *, int));
+ static char **glob_dir_to_array PARAMS((char *, char **, int));
+ 
+-- 
+2.30.1
+
diff --git a/package/bash/0008-bash50-008.patch b/package/bash/0008-bash50-008.patch
deleted file mode 100644
index b571c92336..0000000000
--- a/package/bash/0008-bash50-008.patch
+++ /dev/null
@@ -1,72 +0,0 @@
-From https://ftp.gnu.org/gnu/bash/bash-5.0-patches/bash50-008
-
-Signed-off-by: Pascal de Bruijn <p.debruijn@unilogic.nl>
-
-			     BASH PATCH REPORT
-			     =================
-
-Bash-Release:	5.0
-Patch-ID:	bash50-008
-
-Bug-Reported-by:	Michael Albinus <michael.albinus@gmx.de>
-Bug-Reference-ID:	<87bm36k3kz.fsf@gmx.de>
-Bug-Reference-URL:	https://lists.gnu.org/archive/html/bug-bash/2019-02/msg00111.html
-
-Bug-Description:
-
-When HISTSIZE is set to 0, history expansion can leave the history length
-set to an incorrect value, leading to subsequent attempts to access invalid
-memory.
-
-Patch (apply with `patch -p0'):
-
-*** ../bash-5.0-patched/bashhist.c	2018-07-05 22:41:14.000000000 -0400
---- b/bashhist.c	2019-02-20 16:20:04.000000000 -0500
-***************
-*** 561,573 ****
-    if (!history_expansion_inhibited && history_expansion && history_expansion_p (line))
-      {
-        /* If we are expanding the second or later line of a multi-line
-  	 command, decrease history_length so references to history expansions
-  	 in these lines refer to the previous history entry and not the
-  	 current command. */
-        if (history_length > 0 && command_oriented_history && current_command_first_line_saved && current_command_line_count > 1)
-          history_length--;
-        expanded = history_expand (line, &history_value);
-        if (history_length >= 0 && command_oriented_history && current_command_first_line_saved && current_command_line_count > 1)
-!         history_length++;
-  
-        if (expanded)
---- 561,576 ----
-    if (!history_expansion_inhibited && history_expansion && history_expansion_p (line))
-      {
-+       int old_len;
-+ 
-        /* If we are expanding the second or later line of a multi-line
-  	 command, decrease history_length so references to history expansions
-  	 in these lines refer to the previous history entry and not the
-  	 current command. */
-+       old_len = history_length;
-        if (history_length > 0 && command_oriented_history && current_command_first_line_saved && current_command_line_count > 1)
-          history_length--;
-        expanded = history_expand (line, &history_value);
-        if (history_length >= 0 && command_oriented_history && current_command_first_line_saved && current_command_line_count > 1)
-!         history_length = old_len;
-  
-        if (expanded)
-
-*** ../bash-5.0/patchlevel.h	2016-06-22 14:51:03.000000000 -0400
---- b/patchlevel.h	2016-10-01 11:01:28.000000000 -0400
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
diff --git a/package/bash/0009-bash50-009.patch b/package/bash/0009-bash50-009.patch
deleted file mode 100644
index c53f464ae0..0000000000
--- a/package/bash/0009-bash50-009.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From https://ftp.gnu.org/gnu/bash/bash-5.0-patches/bash50-009
-
-Signed-off-by: Pascal de Bruijn <p.debruijn@unilogic.nl>
-
-			     BASH PATCH REPORT
-			     =================
-
-Bash-Release:	5.0
-Patch-ID:	bash50-009
-
-Bug-Reported-by:	chet.ramey at case.edu
-Bug-Reference-ID:
-Bug-Reference-URL:
-
-Bug-Description:
-
-The history file reading code doesn't close the file descriptor open to
-the history file when it encounters a zero-length file.
-
-Patch (apply with `patch -p0'):
-
-*** ../bash-5.0-patched/lib/readline/histfile.c	2018-06-11 09:14:52.000000000 -0400
---- b/lib/readline/histfile.c	2019-05-16 15:55:57.000000000 -0400
-***************
-*** 306,309 ****
---- 312,316 ----
-      {
-        free (input);
-+       close (file);
-        return 0;	/* don't waste time if we don't have to */
-      }
-*** ../bash-5.0/patchlevel.h	2016-06-22 14:51:03.000000000 -0400
---- b/patchlevel.h	2016-10-01 11:01:28.000000000 -0400
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
diff --git a/package/bash/0010-bash50-010.patch b/package/bash/0010-bash50-010.patch
deleted file mode 100644
index ebc06a6672..0000000000
--- a/package/bash/0010-bash50-010.patch
+++ /dev/null
@@ -1,176 +0,0 @@
-From https://ftp.gnu.org/gnu/bash/bash-5.0-patches/bash50-010
-
-Signed-off-by: Pascal de Bruijn <p.debruijn@unilogic.nl>
-
-			     BASH PATCH REPORT
-			     =================
-
-Bash-Release:	5.0
-Patch-ID:	bash50-010
-
-Bug-Reported-by:	Thorsten Glaser <tg@mirbsd.de>
-Bug-Reference-ID:	<156622962831.19438.16374961114836556294.reportbug@tglase.lan.tarent.de>
-Bug-Reference-URL:	https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=935115
-
-Bug-Description:
-
-Bash-5.0 changed the way assignment statements preceding special builtins
-and shell functions were handled in posix mode. They automatically created
-or modified global variables instead of modifying existing local variables
-as in bash-4.4.
-
-The bash-4.4 posix-mode semantics were buggy, and resulted in creating
-local variables where they were not intended and modifying global variables
-and local variables simultaneously.
-
-The bash-5.0 changes were intended to fix this issue, but did not preserve
-enough backwards compatibility. The posix standard also changed what it
-required in these cases, so bash-5.0 is not bound by the strict conformance
-requirements that existed in previous issues of the standard.
-
-This patch modifies the bash-5.0 posix mode behavior in an effort to restore
-some backwards compatibility and rationalize the behavior in the presence of
-local variables. It
-
-1. Changes the assignment semantics to be more similar to standalone assignment
-   statements: assignments preceding a function call or special builtin while
-   executing in a shell function will modify the value of a local variable
-   with the same name for the duration of the function's execution;
-
-2. Changes assignments preceding shell function calls or special builtins
-   from within a shell function to no longer create or modify global variables
-   in the presence of a local variable with the same name;
-
-3. Assignment statements preceding a shell function call or special builtin
-   at the global scope continue to modify the (global) calling environment,
-   but are unaffected by assignments preceding function calls or special
-   builtins within a function, as described in item 2. This is also similar
-   to the behavior of a standalone assignment statement.
-
-Patch (apply with `patch -p0'):
-
-*** ../bash-5.0-patched/variables.c	2018-12-18 11:07:21.000000000 -0500
---- b/variables.c	2019-08-22 10:53:44.000000000 -0400
-***************
-*** 4461,4467 ****
-  
-  /* Take a variable from an assignment statement preceding a posix special
-!    builtin (including `return') and create a global variable from it. This
-!    is called from merge_temporary_env, which is only called when in posix
-!    mode. */
-  static void
-  push_posix_temp_var (data)
---- 4461,4467 ----
-  
-  /* Take a variable from an assignment statement preceding a posix special
-!    builtin (including `return') and create a variable from it as if a
-!    standalone assignment statement had been performed. This is called from
-!    merge_temporary_env, which is only called when in posix mode. */
-  static void
-  push_posix_temp_var (data)
-***************
-*** 4473,4486 ****
-    var = (SHELL_VAR *)data;
-  
-!   binding_table = global_variables->table;
-!   if (binding_table == 0)
-!     binding_table = global_variables->table = hash_create (VARIABLES_HASH_BUCKETS);
-! 
-!   v = bind_variable_internal (var->name, value_cell (var), binding_table, 0, ASS_FORCE|ASS_NOLONGJMP);
-  
-    /* global variables are no longer temporary and don't need propagating. */
-!   var->attributes &= ~(att_tempvar|att_propagate);
-    if (v)
-!     v->attributes |= var->attributes;
-  
-    if (find_special_var (var->name) >= 0)
---- 4473,4497 ----
-    var = (SHELL_VAR *)data;
-  
-!   /* Just like do_assignment_internal(). This makes assignments preceding
-!      special builtins act like standalone assignment statements when in
-!      posix mode, satisfying the posix requirement that this affect the
-!      "current execution environment." */
-!   v = bind_variable (var->name, value_cell (var), ASS_FORCE|ASS_NOLONGJMP);
-! 
-!   /* If this modifies an existing local variable, v->context will be non-zero.
-!      If it comes back with v->context == 0, we bound at the global context.
-!      Set binding_table appropriately. It doesn't matter whether it's correct
-!      if the variable is local, only that it's not global_variables->table */
-!   binding_table = v->context ? shell_variables->table : global_variables->table;
-  
-    /* global variables are no longer temporary and don't need propagating. */
-!   if (binding_table == global_variables->table)
-!     var->attributes &= ~(att_tempvar|att_propagate);
-! 
-    if (v)
-!     {
-!       v->attributes |= var->attributes;
-!       v->attributes &= ~att_tempvar;	/* not a temp var now */
-!     }
-  
-    if (find_special_var (var->name) >= 0)
-***************
-*** 4576,4587 ****
-  {
-    int i;
-  
-    tempvar_list = strvec_create (HASH_ENTRIES (temporary_env) + 1);
-    tempvar_list[tvlist_ind = 0] = 0;
-!     
-!   hash_flush (temporary_env, pushf);
-!   hash_dispose (temporary_env);
-    temporary_env = (HASH_TABLE *)NULL;
-  
-    tempvar_list[tvlist_ind] = 0;
-  
---- 4587,4601 ----
-  {
-    int i;
-+   HASH_TABLE *disposer;
-  
-    tempvar_list = strvec_create (HASH_ENTRIES (temporary_env) + 1);
-    tempvar_list[tvlist_ind = 0] = 0;
-! 
-!   disposer = temporary_env;
-    temporary_env = (HASH_TABLE *)NULL;
-  
-+   hash_flush (disposer, pushf);
-+   hash_dispose (disposer);
-+ 
-    tempvar_list[tvlist_ind] = 0;
-  
-*** ../bash-5.0-patched/tests/varenv.right	2018-12-17 15:39:48.000000000 -0500
---- b/tests/varenv.right	2019-08-22 16:05:25.000000000 -0400
-***************
-*** 147,153 ****
-  outside: declare -- var="one"
-  inside: declare -x var="value"
-! outside: declare -x var="value"
-! inside: declare -- var="local"
-! outside: declare -x var="global"
-  foo=<unset> environment foo=
-  foo=foo environment foo=foo
---- 147,153 ----
-  outside: declare -- var="one"
-  inside: declare -x var="value"
-! outside: declare -- var="outside"
-! inside: declare -x var="global"
-! outside: declare -- var="outside"
-  foo=<unset> environment foo=
-  foo=foo environment foo=foo
-*** ../bash-5.0/patchlevel.h	2016-06-22 14:51:03.000000000 -0400
---- b/patchlevel.h	2016-10-01 11:01:28.000000000 -0400
-***************
-*** 26,30 ****
-     looks for to find the patch level (for the sccs version string). */
-  
-! #define PATCHLEVEL 9
-  
-  #endif /* _PATCHLEVEL_H_ */
---- 26,30 ----
-     looks for to find the patch level (for the sccs version string). */
-  
-! #define PATCHLEVEL 10
-  
-  #endif /* _PATCHLEVEL_H_ */
diff --git a/package/bash/0011-bash50-011.patch b/package/bash/0011-bash50-011.patch
deleted file mode 100644
index 555d0f8f8b..0000000000
--- a/package/bash/0011-bash50-011.patch
+++ /dev/null
@@ -1,63 +0,0 @@
-From https://ftp.gnu.org/gnu/bash/bash-5.0-patches/bash50-011
-
-Signed-off-by: Pascal de Bruijn <p.debruijn@unilogic.nl>
-
-			     BASH PATCH REPORT
-			     =================
-
-Bash-Release:	5.0
-Patch-ID:	bash50-011
-
-Bug-Reported-by:	Matt Whitlock
-Bug-Reference-ID:	
-Bug-Reference-URL:	https://savannah.gnu.org/support/?109671
-
-Bug-Description:
-
-The conditional command did not perform appropriate quoted null character
-removal on its arguments, causing syntax errors and attempts to stat
-invalid pathnames.
-
-Patch (apply with `patch -p0'):
-
-*** ../bash-5.0-patched/subst.c	2018-12-22 17:43:37.000000000 -0500
---- b/subst.c	2019-04-14 13:25:41.000000000 -0400
-***************
-*** 3626,3630 ****
-     SPECIAL is 2, this is an rhs argument for the =~ operator, and should
-     be quoted appropriately for regcomp/regexec.  The caller is responsible
-!    for removing the backslashes if the unquoted word is needed later. */   
-  char *
-  cond_expand_word (w, special)
---- 3642,3648 ----
-     SPECIAL is 2, this is an rhs argument for the =~ operator, and should
-     be quoted appropriately for regcomp/regexec.  The caller is responsible
-!    for removing the backslashes if the unquoted word is needed later. In
-!    any case, since we don't perform word splitting, we need to do quoted
-!    null character removal. */
-  char *
-  cond_expand_word (w, special)
-***************
-*** 3647,3650 ****
---- 3665,3670 ----
-        if (special == 0)			/* LHS */
-  	{
-+ 	  if (l->word)
-+ 	    word_list_remove_quoted_nulls (l);
-  	  dequote_list (l);
-  	  r = string_list (l);
-*** ../bash-5.0/patchlevel.h	2016-06-22 14:51:03.000000000 -0400
---- b/patchlevel.h	2016-10-01 11:01:28.000000000 -0400
-***************
-*** 26,30 ****
-     looks for to find the patch level (for the sccs version string). */
-  
-! #define PATCHLEVEL 10
-  
-  #endif /* _PATCHLEVEL_H_ */
---- 26,30 ----
-     looks for to find the patch level (for the sccs version string). */
-  
-! #define PATCHLEVEL 11
-  
-  #endif /* _PATCHLEVEL_H_ */
diff --git a/package/bash/0012-bash50-012.patch b/package/bash/0012-bash50-012.patch
deleted file mode 100644
index d634932ee1..0000000000
--- a/package/bash/0012-bash50-012.patch
+++ /dev/null
@@ -1,68 +0,0 @@
-From https://ftp.gnu.org/gnu/bash/bash-5.0-patches/bash50-012
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-
-			     BASH PATCH REPORT
-			     =================
-
-Bash-Release:	5.0
-Patch-ID:	bash50-012
-
-Bug-Reported-by:	lessbug at qq.com
-Bug-Reference-ID:	<tencent_6AA531D9A5CC4121D86BD5CDA2E0DA98C605@qq.com>
-Bug-Reference-URL:
-
-Bug-Description:
-
-When using previous-history to go back beyond the beginning of the history list,
-it's possible to move to an incorrect partial line.
-
-Patch (apply with `patch -p0'):
-
-*** ../bash-5.0-patched/lib/readline/misc.c	2017-07-07 17:30:12.000000000 -0400
---- b/lib/readline/misc.c	2019-05-16 11:43:46.000000000 -0400
-***************
-*** 577,580 ****
---- 590,594 ----
-  {
-    HIST_ENTRY *old_temp, *temp;
-+   int had_saved_line;
-  
-    if (count < 0)
-***************
-*** 589,592 ****
---- 603,607 ----
-  
-    /* If we don't have a line saved, then save this one. */
-+   had_saved_line = _rl_saved_line_for_history != 0;
-    rl_maybe_save_line ();
-  
-***************
-*** 612,616 ****
-    if (temp == 0)
-      {
-!       rl_maybe_unsave_line ();
-        rl_ding ();
-      }
---- 627,632 ----
-    if (temp == 0)
-      {
-!       if (had_saved_line == 0)
-!         _rl_free_saved_history_line ();
-        rl_ding ();
-      }
-*** ../bash-5.0/patchlevel.h	2016-06-22 14:51:03.000000000 -0400
---- b/patchlevel.h	2016-10-01 11:01:28.000000000 -0400
-***************
-*** 26,30 ****
-     looks for to find the patch level (for the sccs version string). */
-  
-! #define PATCHLEVEL 11
-  
-  #endif /* _PATCHLEVEL_H_ */
---- 26,30 ----
-     looks for to find the patch level (for the sccs version string). */
-  
-! #define PATCHLEVEL 12
-  
-  #endif /* _PATCHLEVEL_H_ */
diff --git a/package/bash/0013-bash50-013.patch b/package/bash/0013-bash50-013.patch
deleted file mode 100644
index 1c99f5c8c0..0000000000
--- a/package/bash/0013-bash50-013.patch
+++ /dev/null
@@ -1,77 +0,0 @@
-From https://ftp.gnu.org/gnu/bash/bash-5.0-patches/bash50-013
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-
-			     BASH PATCH REPORT
-			     =================
-
-Bash-Release:	5.0
-Patch-ID:	bash50-013
-
-Bug-Reported-by:	HIROSE Masaaki <hirose31@gmail.com>
-Bug-Reference-ID:	<CAGSOfA-RqiTe=+GsXsDKyZrrMWH4bDbXgMVVegMa6OjqC5xbnQ@mail.gmail.com>
-Bug-Reference-URL:	https://lists.gnu.org/archive/html/bug-bash/2019-05/msg00038.html
-
-Bug-Description:
-
-Reading history entries with timestamps can result in history entries joined
-by linefeeds.
-
-Patch (apply with `patch -p0'):
-
-*** ../bash-5.0-patched/lib/readline/histfile.c	2018-06-11 09:14:52.000000000 -0400
---- b/lib/readline/histfile.c	2019-05-16 15:55:57.000000000 -0400
-***************
-*** 370,376 ****
-  
-    has_timestamps = HIST_TIMESTAMP_START (buffer);
-!   history_multiline_entries += has_timestamps && history_write_timestamps;  
-  
-    /* Skip lines until we are at FROM. */
-    for (line_start = line_end = buffer; line_end < bufend && current_line < from; line_end++)
-      if (*line_end == '\n')
---- 370,378 ----
-  
-    has_timestamps = HIST_TIMESTAMP_START (buffer);
-!   history_multiline_entries += has_timestamps && history_write_timestamps;
-  
-    /* Skip lines until we are at FROM. */
-+   if (has_timestamps)
-+     last_ts = buffer;
-    for (line_start = line_end = buffer; line_end < bufend && current_line < from; line_end++)
-      if (*line_end == '\n')
-***************
-*** 381,385 ****
---- 383,398 ----
-  	if (HIST_TIMESTAMP_START(p) == 0)
-  	  current_line++;
-+ 	else
-+ 	  last_ts = p;
-  	line_start = p;
-+ 	/* If we are@the last line (current_line == from) but we have
-+ 	   timestamps (has_timestamps), then line_start points to the
-+ 	   text of the last command, and we need to skip to its end. */
-+ 	if (current_line >= from && has_timestamps)
-+ 	  {
-+ 	    for (line_end = p; line_end < bufend && *line_end != '\n'; line_end++)
-+ 	      ;
-+ 	    line_start = (*line_end == '\n') ? line_end + 1 : line_end;
-+ 	  }
-        }
-  
-
-*** ../bash-5.0/patchlevel.h	2016-06-22 14:51:03.000000000 -0400
---- b/patchlevel.h	2016-10-01 11:01:28.000000000 -0400
-***************
-*** 26,30 ****
-     looks for to find the patch level (for the sccs version string). */
-  
-! #define PATCHLEVEL 12
-  
-  #endif /* _PATCHLEVEL_H_ */
---- 26,30 ----
-     looks for to find the patch level (for the sccs version string). */
-  
-! #define PATCHLEVEL 13
-  
-  #endif /* _PATCHLEVEL_H_ */
diff --git a/package/bash/0014-bash50-014.patch b/package/bash/0014-bash50-014.patch
deleted file mode 100644
index 2aadbda880..0000000000
--- a/package/bash/0014-bash50-014.patch
+++ /dev/null
@@ -1,56 +0,0 @@
-From https://ftp.gnu.org/gnu/bash/bash-5.0-patches/bash50-014
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-
-			     BASH PATCH REPORT
-			     =================
-
-Bash-Release:	5.0
-Patch-ID:	bash50-014
-
-Bug-Reported-by:	Johannes Hielscher <jhielscher@posteo.de>
-Bug-Reference-ID:	<20190208205048.77c25a83@hordevm>
-Bug-Reference-URL:	https://lists.gnu.org/archive/html/bug-bash/2019-02/msg00032.html
-
-Bug-Description:
-
-If the current line is empty, using the emacs C-xC-e binding to enter the
-editor will edit the previous command instead of the current (empty) one.
-
-Patch (apply with `patch -p0'):
-
-*** ../bash-5.0-patched/bashline.c	2019-01-16 16:13:21.000000000 -0500
---- b/bashline.c	2019-02-11 11:18:57.000000000 -0500
-***************
-*** 962,970 ****
-  	 finished with the command, so we should not ignore the last command */
-        using_history ();
-!       if (rl_line_buffer[0])
-! 	{
-! 	  current_command_line_count++;	/* for rl_newline above */
-! 	  bash_add_history (rl_line_buffer);
-! 	}
-        current_command_line_count = 0;	/* for dummy history entry */
-        bash_add_history ("");
---- 965,970 ----
-  	 finished with the command, so we should not ignore the last command */
-        using_history ();
-!       current_command_line_count++;	/* for rl_newline above */
-!       bash_add_history (rl_line_buffer);
-        current_command_line_count = 0;	/* for dummy history entry */
-        bash_add_history ("");
-*** ../bash-5.0/patchlevel.h	2016-06-22 14:51:03.000000000 -0400
---- b/patchlevel.h	2016-10-01 11:01:28.000000000 -0400
-***************
-*** 26,30 ****
-     looks for to find the patch level (for the sccs version string). */
-  
-! #define PATCHLEVEL 13
-  
-  #endif /* _PATCHLEVEL_H_ */
---- 26,30 ----
-     looks for to find the patch level (for the sccs version string). */
-  
-! #define PATCHLEVEL 14
-  
-  #endif /* _PATCHLEVEL_H_ */
diff --git a/package/bash/0015-bash50-015.patch b/package/bash/0015-bash50-015.patch
deleted file mode 100644
index d927f41af8..0000000000
--- a/package/bash/0015-bash50-015.patch
+++ /dev/null
@@ -1,82 +0,0 @@
-From https://ftp.gnu.org/gnu/bash/bash-5.0-patches/bash50-015
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-
-			     BASH PATCH REPORT
-			     =================
-
-Bash-Release:	5.0
-Patch-ID:	bash50-015
-
-Bug-Reported-by:	Yu Kou <ckyoog@gmail.com>
-Bug-Reference-ID:	<CAAqoF9Ko3nAShJXGzucafs-ByUagzZ4nbQonwEkwC7s9UqfWKw@mail.gmail.com>
-Bug-Reference-URL:	https://lists.gnu.org/archive/html/bug-bash/2019-05/msg00032.html
-
-Bug-Description:
-
-If alias expansion is enabled when processing the command argument to the
-`-c' option, an alias is defined in that command, and the command ends with
-the invocation of that alias, the shell's command parser can prematurely
-terminate before the entire command is executed.
-
-Patch (apply with `patch -p0'):
-
-*** ../bash-20190426/builtins/evalstring.c	2019-01-29 14:15:19.000000000 -0500
---- b/builtins/evalstring.c	2019-05-15 14:19:36.000000000 -0400
-***************
-*** 92,95 ****
---- 92,96 ----
-  	  running_trap == 0 &&
-  	  *bash_input.location.string == '\0' &&
-+ 	  parser_expanding_alias () == 0 &&
-  	  command->type == cm_simple &&
-  	  signal_is_trapped (EXIT_TRAP) == 0 &&
-***************
-*** 106,109 ****
---- 107,111 ----
-  {
-    return (*bash_input.location.string == '\0' &&
-+ 	  parser_expanding_alias () == 0 &&
-  	  (command->value.Connection->connector == AND_AND || command->value.Connection->connector == OR_OR || command->value.Connection->connector == ';') &&
-  	  command->value.Connection->second->type == cm_simple);
-***************
-*** 291,295 ****
-    with_input_from_string (string, from_file);
-    clear_shell_input_line ();
-!   while (*(bash_input.location.string))
-      {
-        command = (COMMAND *)NULL;
---- 293,297 ----
-    with_input_from_string (string, from_file);
-    clear_shell_input_line ();
-!   while (*(bash_input.location.string) || parser_expanding_alias ())
-      {
-        command = (COMMAND *)NULL;
-***************
-*** 546,550 ****
-  
-    with_input_from_string (string, from_file);
-!   while (*(bash_input.location.string))
-      {
-        command = (COMMAND *)NULL;
---- 548,552 ----
-  
-    with_input_from_string (string, from_file);
-!   while (*(bash_input.location.string))		/* XXX - parser_expanding_alias () ? */
-      {
-        command = (COMMAND *)NULL;
-*** ../bash-5.0/patchlevel.h	2016-06-22 14:51:03.000000000 -0400
---- b/patchlevel.h	2016-10-01 11:01:28.000000000 -0400
-***************
-*** 26,30 ****
-     looks for to find the patch level (for the sccs version string). */
-  
-! #define PATCHLEVEL 14
-  
-  #endif /* _PATCHLEVEL_H_ */
---- 26,30 ----
-     looks for to find the patch level (for the sccs version string). */
-  
-! #define PATCHLEVEL 15
-  
-  #endif /* _PATCHLEVEL_H_ */
diff --git a/package/bash/0016-bash50-016.patch b/package/bash/0016-bash50-016.patch
deleted file mode 100644
index 8dec1fb34c..0000000000
--- a/package/bash/0016-bash50-016.patch
+++ /dev/null
@@ -1,62 +0,0 @@
-From https://ftp.gnu.org/gnu/bash/bash-5.0-patches/bash50-016
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-
-			     BASH PATCH REPORT
-			     =================
-
-Bash-Release:	5.0
-Patch-ID:	bash50-016
-
-Bug-Reported-by:	sunnycemetery at gmail.com
-Bug-Reference-ID:	<20190316041534.GB22884@midnight>
-Bug-Reference-URL:	https://lists.gnu.org/archive/html/bug-bash/2019-03/msg00070.html
-
-Bug-Description:
-
-Bash waits too long to reap /dev/fd process substitutions used as redirections
-with loops and group commands, which can lead to file descriptor exhaustion.
-
-Patch (apply with `patch -p0'):
-
-*** ../bash-5.0-patched/execute_cmd.c	2019-04-19 15:46:36.000000000 -0400
---- b/execute_cmd.c	2019-07-01 16:45:49.000000000 -0400
-***************
-*** 1104,1107 ****
---- 1085,1104 ----
-        discard_unwind_frame ("internal_fifos");
-      }
-+ # if defined (HAVE_DEV_FD)
-+   /* Reap process substitutions at the end of loops */
-+   switch (command->type)
-+     {
-+     case cm_while:
-+     case cm_until:
-+     case cm_for:
-+     case cm_group:
-+ #    if defined (ARITH_FOR_COMMAND)
-+     case cm_arith_for:
-+ #    endif
-+       reap_procsubs ();
-+     default:
-+       break;
-+     }
-+ #  endif /* HAVE_DEV_FD */
-  #endif
-  
-
-*** ../bash-5.0/patchlevel.h	2016-06-22 14:51:03.000000000 -0400
---- b/patchlevel.h	2016-10-01 11:01:28.000000000 -0400
-***************
-*** 26,30 ****
-     looks for to find the patch level (for the sccs version string). */
-  
-! #define PATCHLEVEL 15
-  
-  #endif /* _PATCHLEVEL_H_ */
---- 26,30 ----
-     looks for to find the patch level (for the sccs version string). */
-  
-! #define PATCHLEVEL 16
-  
-  #endif /* _PATCHLEVEL_H_ */
diff --git a/package/bash/0017-bash50-017.patch b/package/bash/0017-bash50-017.patch
deleted file mode 100644
index 6758b203f8..0000000000
--- a/package/bash/0017-bash50-017.patch
+++ /dev/null
@@ -1,293 +0,0 @@
-From https://ftp.gnu.org/gnu/bash/bash-5.0-patches/bash55-017
-
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
-
-			     BASH PATCH REPORT
-			     =================
-
-Bash-Release:	5.0
-Patch-ID:	bash50-017
-
-Bug-Reported-by:	Valentin Lab <valentin.lab@kalysto.org>
-Bug-Reference-ID:	<ab981b9c-60a5-46d0-b7e6-a6d88b80df50@kalysto.org>
-Bug-Reference-URL:	https://lists.gnu.org/archive/html/bug-bash/2020-03/msg00062.html
-
-Bug-Description:
-
-There were cases where patch 16 reaped process substitution file descriptors
-(or FIFOs) and processes to early. This is a better fix for the problem that
-bash50-016 attempted to solve.
-
-Patch (apply with `patch -p0'):
-
-*** bash-5.0-patched/subst.c	2019-08-29 11:16:49.000000000 -0400
---- b/subst.c	2020-04-02 16:24:19.000000000 -0400
-***************
-*** 5337,5341 ****
-  }
-  
-! char *
-  copy_fifo_list (sizep)
-       int *sizep;
---- b/5337,5341 ----
-  }
-  
-! void *
-  copy_fifo_list (sizep)
-       int *sizep;
-***************
-*** 5343,5347 ****
-    if (sizep)
-      *sizep = 0;
-!   return (char *)NULL;
-  }
-  
---- b/5343,5347 ----
-    if (sizep)
-      *sizep = 0;
-!   return (void *)NULL;
-  }
-  
-***************
-*** 5409,5414 ****
-  	if (fifo_list[i].file)
-  	  {
-! 	    fifo_list[j].file = fifo_list[i].file;
-! 	    fifo_list[j].proc = fifo_list[i].proc;
-  	    j++;
-  	  }
---- b/5409,5419 ----
-  	if (fifo_list[i].file)
-  	  {
-! 	    if (i != j)
-! 	      {
-! 		fifo_list[j].file = fifo_list[i].file;
-! 		fifo_list[j].proc = fifo_list[i].proc;
-! 		fifo_list[i].file = (char *)NULL;
-! 		fifo_list[i].proc = 0;
-! 	      }
-  	    j++;
-  	  }
-***************
-*** 5426,5433 ****
-  void
-  close_new_fifos (list, lsize)
-!      char *list;
-       int lsize;
-  {
-    int i;
-  
-    if (list == 0)
---- b/5431,5439 ----
-  void
-  close_new_fifos (list, lsize)
-!      void *list;
-       int lsize;
-  {
-    int i;
-+   char *plist;
-  
-    if (list == 0)
-***************
-*** 5437,5442 ****
-      }
-  
-!   for (i = 0; i < lsize; i++)
-!     if (list[i] == 0 && i < fifo_list_size && fifo_list[i].proc != -1)
-        unlink_fifo (i);
-  
---- b/5443,5448 ----
-      }
-  
-!   for (plist = (char *)list, i = 0; i < lsize; i++)
-!     if (plist[i] == 0 && i < fifo_list_size && fifo_list[i].proc != -1)
-        unlink_fifo (i);
-  
-***************
-*** 5560,5568 ****
-  }
-  
-! char *
-  copy_fifo_list (sizep)
-       int *sizep;
-  {
-!   char *ret;
-  
-    if (nfds == 0 || totfds == 0)
---- b/5566,5574 ----
-  }
-  
-! void *
-  copy_fifo_list (sizep)
-       int *sizep;
-  {
-!   void *ret;
-  
-    if (nfds == 0 || totfds == 0)
-***************
-*** 5570,5579 ****
-        if (sizep)
-  	*sizep = 0;
-!       return (char *)NULL;
-      }
-  
-    if (sizep)
-      *sizep = totfds;
-!   ret = (char *)xmalloc (totfds * sizeof (pid_t));
-    return (memcpy (ret, dev_fd_list, totfds * sizeof (pid_t)));
-  }
---- b/5576,5585 ----
-        if (sizep)
-  	*sizep = 0;
-!       return (void *)NULL;
-      }
-  
-    if (sizep)
-      *sizep = totfds;
-!   ret = xmalloc (totfds * sizeof (pid_t));
-    return (memcpy (ret, dev_fd_list, totfds * sizeof (pid_t)));
-  }
-***************
-*** 5648,5655 ****
-  void
-  close_new_fifos (list, lsize)
-!      char *list;
-       int lsize;
-  {
-    int i;
-  
-    if (list == 0)
---- b/5654,5662 ----
-  void
-  close_new_fifos (list, lsize)
-!      void *list;
-       int lsize;
-  {
-    int i;
-+   pid_t *plist;
-  
-    if (list == 0)
-***************
-*** 5659,5664 ****
-      }
-  
-!   for (i = 0; i < lsize; i++)
-!     if (list[i] == 0 && i < totfds && dev_fd_list[i])
-        unlink_fifo (i);
-  
---- b/5666,5671 ----
-      }
-  
-!   for (plist = (pid_t *)list, i = 0; i < lsize; i++)
-!     if (plist[i] == 0 && i < totfds && dev_fd_list[i])
-        unlink_fifo (i);
-  
-*** bash-5.0-patched/subst.h	2018-10-21 18:46:09.000000000 -0400
---- b/subst.h	2020-04-02 16:29:28.000000000 -0400
-***************
-*** 274,280 ****
-  extern void unlink_fifo __P((int));
-  
-! extern char *copy_fifo_list __P((int *));
-! extern void unlink_new_fifos __P((char *, int));
-! extern void close_new_fifos __P((char *, int));
-  
-  extern void clear_fifo_list __P((void));
---- b/274,279 ----
-  extern void unlink_fifo __P((int));
-  
-! extern void *copy_fifo_list __P((int *));
-! extern void close_new_fifos __P((void *, int));
-  
-  extern void clear_fifo_list __P((void));
-*** bash-5.0-patched/execute_cmd.c	2020-02-06 20:16:48.000000000 -0500
---- b/execute_cmd.c	2020-04-02 17:00:10.000000000 -0400
-***************
-*** 565,569 ****
-  #if defined (PROCESS_SUBSTITUTION)
-    volatile int ofifo, nfifo, osize, saved_fifo;
-!   volatile char *ofifo_list;
-  #endif
-  
---- b/565,569 ----
-  #if defined (PROCESS_SUBSTITUTION)
-    volatile int ofifo, nfifo, osize, saved_fifo;
-!   volatile void *ofifo_list;
-  #endif
-  
-***************
-*** 751,760 ****
-  #  endif
-  
-!   if (variable_context != 0)	/* XXX - also if sourcelevel != 0? */
-      {
-        ofifo = num_fifos ();
-        ofifo_list = copy_fifo_list ((int *)&osize);
-        begin_unwind_frame ("internal_fifos");
-!       add_unwind_protect (xfree, ofifo_list);
-        saved_fifo = 1;
-      }
---- b/751,762 ----
-  #  endif
-  
-!   /* XXX - also if sourcelevel != 0? */
-!   if (variable_context != 0)
-      {
-        ofifo = num_fifos ();
-        ofifo_list = copy_fifo_list ((int *)&osize);
-        begin_unwind_frame ("internal_fifos");
-!       if (ofifo_list)
-! 	add_unwind_protect (xfree, ofifo_list);
-        saved_fifo = 1;
-      }
-***************
-*** 1100,1123 ****
-        nfifo = num_fifos ();
-        if (nfifo > ofifo)
-! 	close_new_fifos ((char *)ofifo_list, osize);
-        free ((void *)ofifo_list);
-        discard_unwind_frame ("internal_fifos");
-      }
-- # if defined (HAVE_DEV_FD)
--   /* Reap process substitutions at the end of loops */
--   switch (command->type)
--     {
--     case cm_while:
--     case cm_until:
--     case cm_for:
--     case cm_group:
-- #    if defined (ARITH_FOR_COMMAND)
--     case cm_arith_for:
-- #    endif
--       reap_procsubs ();
--     default:
--       break;
--     }
-- #  endif /* HAVE_DEV_FD */
-  #endif
-  
---- b/1102,1109 ----
-        nfifo = num_fifos ();
-        if (nfifo > ofifo)
-! 	close_new_fifos ((void *)ofifo_list, osize);
-        free ((void *)ofifo_list);
-        discard_unwind_frame ("internal_fifos");
-      }
-  #endif
-  
-
-*** bash-5.0/patchlevel.h	2016-06-22 14:51:03.000000000 -0400
---- b/patchlevel.h	2016-10-01 11:01:28.000000000 -0400
-***************
-*** 26,30 ****
-     looks for to find the patch level (for the sccs version string). */
-  
-! #define PATCHLEVEL 16
-  
-  #endif /* _PATCHLEVEL_H_ */
---- b/26,30 ----
-     looks for to find the patch level (for the sccs version string). */
-  
-! #define PATCHLEVEL 17
-  
-  #endif /* _PATCHLEVEL_H_ */
diff --git a/package/bash/0018-bash50-018.patch b/package/bash/0018-bash50-018.patch
deleted file mode 100644
index efecb1897d..0000000000
--- a/package/bash/0018-bash50-018.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-From https://ftp.gnu.org/gnu/bash/bash-5.0-patches/bash55-018
-
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
-
-			     BASH PATCH REPORT
-			     =================
-
-Bash-Release:	5.0
-Patch-ID:	bash50-018
-
-Bug-Reported-by:	oguzismailuysal at gmail.com
-Bug-Reference-ID:
-Bug-Reference-URL:	https://lists.gnu.org/archive/html/bug-bash/2019-10/msg00098.html
-
-Bug-Description:
-
-In certain cases, bash does not perform quoted null removal on patterns
-that are used as part of word expansions such as ${parameter##pattern}, so
-empty patterns are treated as non-empty.
-
-Patch (apply with `patch -p0'):
-
-*** bash-5.0.17/subst.c	2020-04-02 17:14:58.000000000 -0400
---- b/subst.c	2020-07-09 15:28:19.000000000 -0400
-***************
-*** 5113,5116 ****
---- b/5113,5118 ----
-  				      (int *)NULL, (int *)NULL)
-  	     : (WORD_LIST *)0;
-+   if (l)
-+     word_list_remove_quoted_nulls (l);
-    pat = string_list (l);
-    dispose_words (l);
-
-*** bash-5.0/patchlevel.h	2016-06-22 14:51:03.000000000 -0400
---- b/patchlevel.h	2016-10-01 11:01:28.000000000 -0400
-***************
-*** 26,30 ****
-     looks for to find the patch level (for the sccs version string). */
-  
-! #define PATCHLEVEL 17
-  
-  #endif /* _PATCHLEVEL_H_ */
---- b/26,30 ----
-     looks for to find the patch level (for the sccs version string). */
-  
-! #define PATCHLEVEL 18
-  
-  #endif /* _PATCHLEVEL_H_ */
diff --git a/package/bash/0020-locale.c-fix-build-without-wchar.patch b/package/bash/0020-locale.c-fix-build-without-wchar.patch
deleted file mode 100644
index 15c5f2e401..0000000000
--- a/package/bash/0020-locale.c-fix-build-without-wchar.patch
+++ /dev/null
@@ -1,84 +0,0 @@
-From 73ca494c60d46103f806325e6ccbe9e400238008 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sun, 23 Feb 2020 11:41:09 +0100
-Subject: [PATCH] locale.c: fix build without wchar
-
-bash unconditionally builds locale.c which depends on mblen since
-version 5.0 and
-https://github.com/bminor/bash/commit/d233b485e83c3a784b803fb894280773f16f2deb
-
-This results in the following build failure if wchar is not available:
-
-/home/buildroot/autobuild/run/instance-0/output-1/host/bin/microblazeel-buildroot-linux-uclibc-gcc -L./builtins -L/home/buildroot/autobuild/run/instance-0/output-1/host/microblazeel-buildroot-linux-uclibc/sysroot/lib -L/home/buildroot/autobuild/run/instance-0/output-1/host/microblazeel-buildroot-linux-uclibc/sysroot/lib -L./lib/glob -L./lib/tilde  -L./lib/sh  -rdynamic -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -O2   -Wno-parentheses -Wno-format-security   -o bash shell.o eval.o y.tab.o general.o make_cmd.o print_cmd.o  dispose_cmd.o execute_cmd.o variables.o copy_cmd.o error.o expr.o flags.o jobs.o subst.o hashcmd.o hashlib.o mailcheck.o trap.o input.o unwind_prot.o pathexp.o sig.o test.o version.o alias.o array.o arrayfunc.o assoc.o braces.o bracecomp.o bashhist.o bashline.o  list.o stringlib.o locale.o findcmd.o redir.o pcomplete.o pcomplib.o syntax.o xmalloc.o signames.o -lbuiltins -lglob -lsh -lreadline -lhistory -lcurses -ltilde     -ldl
-/home/buildroot/autobuild/run/instance-0/output-1/host/lib/gcc/microblazeel-buildroot-linux-uclibc/8.3.0/../../../../microblazeel-buildroot-linux-uclibc/bin/ld: locale.o: in function `set_default_locale':
-(.text+0x260): undefined reference to `mblen'
-
-To fix this issue, don't use mblen if HANDLE_MULTIBYTE is not defined,
-an other possibility would be to use MBLEN wrapper defined in shmbutil.h
-
-Fixes:
- - http://autobuild.buildroot.org/results/298fb9c785e137bff432dd304eb56986e54ce3ed
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://savannah.gnu.org/support/index.php?110200]
----
- locale.c | 10 ++++++++++
- 1 file changed, 10 insertions(+)
-
-diff --git a/locale.c b/locale.c
-index d62547f6..a64c5b4b 100644
---- a/locale.c
-+++ b/locale.c
-@@ -86,7 +86,9 @@ set_default_locale ()
- 
-   locale_mb_cur_max = MB_CUR_MAX;
-   locale_utf8locale = locale_isutf8 (default_locale);
-+#if defined (HANDLE_MULTIBYTE)
-   locale_shiftstates = mblen ((char *)NULL, 0);
-+#endif
- }
- 
- /* Set default values for LC_CTYPE, LC_COLLATE, LC_MESSAGES, LC_NUMERIC and
-@@ -107,7 +109,9 @@ set_default_locale_vars ()
-       locale_setblanks ();
-       locale_mb_cur_max = MB_CUR_MAX;
-       locale_utf8locale = locale_isutf8 (lc_all);
-+#    if defined (HANDLE_MULTIBYTE)
-       locale_shiftstates = mblen ((char *)NULL, 0);
-+#    endif
-       u32reset ();
-     }
- #  endif
-@@ -211,7 +215,9 @@ set_locale_var (var, value)
-       /* if LC_ALL == "", reset_locale_vars has already called this */
-       if (*lc_all && x)
- 	locale_utf8locale = locale_isutf8 (lc_all);
-+#  if defined (HANDLE_MULTIBYTE)
-       locale_shiftstates = mblen ((char *)NULL, 0);
-+#  endif
-       u32reset ();
-       return r;
- #else
-@@ -231,7 +237,9 @@ set_locale_var (var, value)
- 	  /* if setlocale() returns NULL, the locale is not changed */
- 	  if (x)
- 	    locale_utf8locale = locale_isutf8 (x);
-+#    if defined (HANDLE_MULTIBYTE)
- 	  locale_shiftstates = mblen ((char *)NULL, 0);
-+#    endif
- 	  u32reset ();
- 	}
- #  endif
-@@ -368,7 +376,9 @@ reset_locale_vars ()
-   locale_mb_cur_max = MB_CUR_MAX;
-   if (x)
-     locale_utf8locale = locale_isutf8 (x);
-+#  if defined (HANDLE_MULTIBYTE)
-   locale_shiftstates = mblen ((char *)NULL, 0);
-+#  endif
-   u32reset ();
- #endif
-   return 1;
--- 
-2.25.0
-
diff --git a/package/bash/bash.hash b/package/bash/bash.hash
index 9113b1653f..2e547c8c30 100644
--- a/package/bash/bash.hash
+++ b/package/bash/bash.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature from
-# http://ftp.gnu.org/gnu/bash/bash-4.4.18.tar.gz.sig
-sha256 b4a80f2ac66170b2913efbfb9f2594f1f76c7b1afd11f799e22035d63077fb4d bash-5.0.tar.gz
-sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903	COPYING
+# http://mirror.keystealth.org/gnu/bash/bash-5.1.tar.gz.sig
+sha256  cc012bc860406dcf42f64431bcd3d2fa7560c02915a601aba9cd597a39329baa  bash-5.1.tar.gz
+sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/bash/bash.mk b/package/bash/bash.mk
index b4681c1085..efe7cbbe59 100644
--- a/package/bash/bash.mk
+++ b/package/bash/bash.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BASH_VERSION = 5.0
+BASH_VERSION = 5.1
 BASH_SITE = $(BR2_GNU_MIRROR)/bash
 BASH_DEPENDENCIES = ncurses readline host-bison
 BASH_CONF_OPTS = --with-installed-readline --without-bash-malloc
-- 
2.30.1
