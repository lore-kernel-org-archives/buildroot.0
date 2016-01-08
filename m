From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 8 Jan 2016 18:48:12 +0100
Subject: [Buildroot] [git commit] bash: bump to patchlevel 42
Message-ID: <20160108175325.EE13F827EC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4a37f3316ccf122ad9dd5cab812edd758b5031e8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/bash/0034-patchlevel-34.patch | 94 +++++++++++++++++++++++++++++++++++
 package/bash/0035-patchlevel-35.patch | 67 +++++++++++++++++++++++++
 package/bash/0036-patchlevel-36.patch | 61 +++++++++++++++++++++++
 package/bash/0037-patchlevel-37.patch | 47 ++++++++++++++++++
 package/bash/0038-patchlevel-38.patch | 92 ++++++++++++++++++++++++++++++++++
 package/bash/0039-patchlevel-39.patch | 61 +++++++++++++++++++++++
 package/bash/0040-patchlevel-40.patch | 51 +++++++++++++++++++
 package/bash/0041-patchlevel-41.patch | 76 ++++++++++++++++++++++++++++
 package/bash/0042-patchlevel-42.patch | 59 ++++++++++++++++++++++
 9 files changed, 608 insertions(+)

diff --git a/package/bash/0034-patchlevel-34.patch b/package/bash/0034-patchlevel-34.patch
new file mode 100644
index 0000000..79c8945
--- /dev/null
+++ b/package/bash/0034-patchlevel-34.patch
@@ -0,0 +1,94 @@
+From http://ftp.gnu.org/pub/gnu/bash/bash-4.3-patches/bash43-034
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+
+			     BASH PATCH REPORT
+			     =================
+
+Bash-Release:	4.3
+Patch-ID:	bash43-034
+
+Bug-Reported-by:	Dreamcat4 <dreamcat4@gmail.com>
+Bug-Reference-ID:	<CAN39uTpAEs2GFu4ebC_SfSVMRTh-DJ9YanrY4BZZ3OO+CCHjng@mail.gmail.com>
+Bug-Reference-URL:	http://lists.gnu.org/archive/html/bug-bash/2015-05/msg00001.html
+
+Bug-Description:
+
+If neither the -f nor -v options is supplied to unset, and a name argument is
+found to be a function and unset, subsequent name arguments are not treated as
+variables before attempting to unset a function by that name.
+
+Patch (apply with `patch -p0'):
+
+*** a/bash-4.3-patched/builtins/set.def	2013-04-19 07:20:34.000000000 -0400
+--- b/builtins/set.def	2015-05-05 13:25:36.000000000 -0400
+***************
+*** 752,758 ****
+--- 797,805 ----
+  {
+    int unset_function, unset_variable, unset_array, opt, nameref, any_failed;
++   int global_unset_func, global_unset_var;
+    char *name;
+  
+    unset_function = unset_variable = unset_array = nameref = any_failed = 0;
++   global_unset_func = global_unset_var = 0;
+  
+    reset_internal_getopt ();
+***************
+*** 762,769 ****
+  	{
+  	case 'f':
+! 	  unset_function = 1;
+  	  break;
+  	case 'v':
+! 	  unset_variable = 1;
+  	  break;
+  	case 'n':
+--- 809,816 ----
+  	{
+  	case 'f':
+! 	  global_unset_func = 1;
+  	  break;
+  	case 'v':
+! 	  global_unset_var = 1;
+  	  break;
+  	case 'n':
+***************
+*** 778,782 ****
+    list = loptend;
+  
+!   if (unset_function && unset_variable)
+      {
+        builtin_error (_("cannot simultaneously unset a function and a variable"));
+--- 825,829 ----
+    list = loptend;
+  
+!   if (global_unset_func && global_unset_var)
+      {
+        builtin_error (_("cannot simultaneously unset a function and a variable"));
+***************
+*** 796,799 ****
+--- 843,849 ----
+        name = list->word->word;
+  
++       unset_function = global_unset_func;
++       unset_variable = global_unset_var;
++ 
+  #if defined (ARRAY_VARS)
+        unset_array = 0;
+
+*** a/bash-4.3/patchlevel.h	2012-12-29 10:47:57.000000000 -0500
+--- b/patchlevel.h	2014-03-20 20:01:28.000000000 -0400
+***************
+*** 26,30 ****
+     looks for to find the patch level (for the sccs version string). */
+  
+! #define PATCHLEVEL 33
+  
+  #endif /* _PATCHLEVEL_H_ */
+--- 26,30 ----
+     looks for to find the patch level (for the sccs version string). */
+  
+! #define PATCHLEVEL 34
+  
+  #endif /* _PATCHLEVEL_H_ */
diff --git a/package/bash/0035-patchlevel-35.patch b/package/bash/0035-patchlevel-35.patch
new file mode 100644
index 0000000..c18b60d
--- /dev/null
+++ b/package/bash/0035-patchlevel-35.patch
@@ -0,0 +1,67 @@
+From http://ftp.gnu.org/pub/gnu/bash/bash-4.3-patches/bash43-035
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+
+			     BASH PATCH REPORT
+			     =================
+
+Bash-Release:	4.3
+Patch-ID:	bash43-035
+
+Bug-Reported-by:	<romerox.adrian@gmail.com>
+Bug-Reference-ID:	<CABV5r3zhPXmSKUe9uedeGc5YFBM2njJ1iVmY2h5neWdQpDBQug@mail.gmail.com>
+Bug-Reference-URL:	http://lists.gnu.org/archive/html/bug-bash/2014-08/msg00045.html
+
+Bug-Description:
+
+A locale with a long name can trigger a buffer overflow and core dump.  This
+applies on systems that do not have locale_charset in libc, are not using
+GNU libiconv, and are not using the libintl that ships with bash in lib/intl.
+
+Patch (apply with `patch -p0'):
+
+*** a/bash-4.3-patched/lib/sh/unicode.c	2014-01-30 16:47:19.000000000 -0500
+--- b/lib/sh/unicode.c	2015-05-01 08:58:30.000000000 -0400
+***************
+*** 79,83 ****
+    if (s)
+      {
+!       strcpy (charsetbuf, s+1);
+        t = strchr (charsetbuf, '@');
+        if (t)
+--- 79,84 ----
+    if (s)
+      {
+!       strncpy (charsetbuf, s+1, sizeof (charsetbuf) - 1);
+!       charsetbuf[sizeof (charsetbuf) - 1] = '\0';
+        t = strchr (charsetbuf, '@');
+        if (t)
+***************
+*** 85,89 ****
+        return charsetbuf;
+      }
+!   strcpy (charsetbuf, locale);
+    return charsetbuf;
+  }
+--- 86,91 ----
+        return charsetbuf;
+      }
+!   strncpy (charsetbuf, locale, sizeof (charsetbuf) - 1);
+!   charsetbuf[sizeof (charsetbuf) - 1] = '\0';
+    return charsetbuf;
+  }
+*** a/bash-4.3/patchlevel.h	2012-12-29 10:47:57.000000000 -0500
+--- b/patchlevel.h	2014-03-20 20:01:28.000000000 -0400
+***************
+*** 26,30 ****
+     looks for to find the patch level (for the sccs version string). */
+  
+! #define PATCHLEVEL 34
+  
+  #endif /* _PATCHLEVEL_H_ */
+--- 26,30 ----
+     looks for to find the patch level (for the sccs version string). */
+  
+! #define PATCHLEVEL 35
+  
+  #endif /* _PATCHLEVEL_H_ */
diff --git a/package/bash/0036-patchlevel-36.patch b/package/bash/0036-patchlevel-36.patch
new file mode 100644
index 0000000..f35b29b
--- /dev/null
+++ b/package/bash/0036-patchlevel-36.patch
@@ -0,0 +1,61 @@
+From http://ftp.gnu.org/pub/gnu/bash/bash-4.3-patches/bash43-036
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+
+			     BASH PATCH REPORT
+			     =================
+
+Bash-Release:	4.3
+Patch-ID:	bash43-036
+
+Bug-Reported-by:	emanuelczirai at cryptolab.net
+Bug-Reference-ID:	<f962e4f556da5ebfadaf7afe9c78a8cb@cryptolab.net>
+Bug-Reference-URL:	http://lists.gnu.org/archive/html/bug-bash/2015-02/msg00071.html
+
+Bug-Description:
+
+When evaluating and setting integer variables, and the assignment fails to
+create a variable (for example, when performing an operation on an array
+variable with an invalid subscript), bash attempts to dereference a null
+pointer, causing a segmentation violation.
+
+Patch (apply with `patch -p0'):
+
+*** a/bash-20150206/variables.c	2015-01-23 20:39:27.000000000 -0500
+--- b/variables.c	2015-02-19 13:56:12.000000000 -0500
+***************
+*** 2834,2841 ****
+      v = bind_variable (lhs, rhs, 0);
+  
+!   if (v && isint)
+!     VSETATTR (v, att_integer);
+! 
+!   VUNSETATTR (v, att_invisible);
+  
+    return (v);
+--- 2834,2843 ----
+      v = bind_variable (lhs, rhs, 0);
+  
+!   if (v)
+!     {
+!       if (isint)
+! 	VSETATTR (v, att_integer);
+!       VUNSETATTR (v, att_invisible);
+!     }
+  
+    return (v);
+*** a/bash-4.3/patchlevel.h	2012-12-29 10:47:57.000000000 -0500
+--- b/patchlevel.h	2014-03-20 20:01:28.000000000 -0400
+***************
+*** 26,30 ****
+     looks for to find the patch level (for the sccs version string). */
+  
+! #define PATCHLEVEL 35
+  
+  #endif /* _PATCHLEVEL_H_ */
+--- 26,30 ----
+     looks for to find the patch level (for the sccs version string). */
+  
+! #define PATCHLEVEL 36
+  
+  #endif /* _PATCHLEVEL_H_ */
diff --git a/package/bash/0037-patchlevel-37.patch b/package/bash/0037-patchlevel-37.patch
new file mode 100644
index 0000000..5f8aff3
--- /dev/null
+++ b/package/bash/0037-patchlevel-37.patch
@@ -0,0 +1,47 @@
+From http://ftp.gnu.org/pub/gnu/bash/bash-4.3-patches/bash43-037
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+
+			     BASH PATCH REPORT
+			     =================
+
+Bash-Release:	4.3
+Patch-ID:	bash43-037
+
+Bug-Reported-by:	Greg Wooledge <wooledg@eeg.ccf.org>
+Bug-Reference-ID:	<20150204144240.GN13956@eeg.ccf.org>
+Bug-Reference-URL:	http://lists.gnu.org/archive/html/bug-bash/2015-02/msg00007.html
+
+Bug-Description:
+
+If an associative array uses `@' or `*' as a subscript, `declare -p' produces
+output that cannot be reused as input.
+
+Patch (apply with `patch -p0'):
+
+*** a/bash-4.3-patched/assoc.c	2011-11-05 16:39:05.000000000 -0400
+--- b/assoc.c	2015-02-04 15:28:25.000000000 -0500
+***************
+*** 437,440 ****
+--- 440,445 ----
+  	if (sh_contains_shell_metas (tlist->key))
+  	  istr = sh_double_quote (tlist->key);
++ 	else if (ALL_ELEMENT_SUB (tlist->key[0]) && tlist->key[1] == '\0')
++ 	  istr = sh_double_quote (tlist->key);	
+  	else
+  	  istr = tlist->key;	
+*** a/bash-4.3/patchlevel.h	2012-12-29 10:47:57.000000000 -0500
+--- b/patchlevel.h	2014-03-20 20:01:28.000000000 -0400
+***************
+*** 26,30 ****
+     looks for to find the patch level (for the sccs version string). */
+  
+! #define PATCHLEVEL 36
+  
+  #endif /* _PATCHLEVEL_H_ */
+--- 26,30 ----
+     looks for to find the patch level (for the sccs version string). */
+  
+! #define PATCHLEVEL 37
+  
+  #endif /* _PATCHLEVEL_H_ */
diff --git a/package/bash/0038-patchlevel-38.patch b/package/bash/0038-patchlevel-38.patch
new file mode 100644
index 0000000..09fd9c2
--- /dev/null
+++ b/package/bash/0038-patchlevel-38.patch
@@ -0,0 +1,92 @@
+From http://ftp.gnu.org/pub/gnu/bash/bash-4.3-patches/bash43-038
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+
+			     BASH PATCH REPORT
+			     =================
+
+Bash-Release:	4.3
+Patch-ID:	bash43-038
+
+Bug-Reported-by:	worley at alum.mit.edu (Dale R. Worley)
+Bug-Reference-ID:	<201406100051.s5A0pCeB014978@hobgoblin.ariadne.com>
+Bug-Reference-URL:	http://lists.gnu.org/archive/html/bug-bash/2014-06/msg00028.html
+
+Bug-Description:
+
+There are a number of instances where `time' is not recognized as a reserved
+word when the shell grammar says it should be.
+
+Patch (apply with `patch -p0'):
+
+*** a/bash-4.3-patched/parse.y	2014-04-07 11:56:12.000000000 -0400
+--- b/parse.y	2014-06-11 10:25:53.000000000 -0400
+***************
+*** 2819,2827 ****
+      case OR_OR:
+      case '&':
+      case DO:
+      case THEN:
+      case ELSE:
+      case '{':		/* } */
+!     case '(':		/* ) */
+      case BANG:		/* ! time pipeline */
+      case TIME:		/* time time pipeline */
+--- 2819,2832 ----
+      case OR_OR:
+      case '&':
++     case WHILE:
+      case DO:
++     case UNTIL:
++     case IF:
+      case THEN:
++     case ELIF:
+      case ELSE:
+      case '{':		/* } */
+!     case '(':		/* )( */
+!     case ')':		/* only valid in case statement */
+      case BANG:		/* ! time pipeline */
+      case TIME:		/* time time pipeline */
+*** a/bash-4.3-patched/y.tab.c	2014-10-05 13:52:50.000000000 -0400
+--- b/y.tab.c	2015-05-19 15:08:43.000000000 -0400
+***************
+*** 5131,5139 ****
+      case OR_OR:
+      case '&':
+      case DO:
+      case THEN:
+      case ELSE:
+      case '{':		/* } */
+!     case '(':		/* ) */
+      case BANG:		/* ! time pipeline */
+      case TIME:		/* time time pipeline */
+--- 5131,5144 ----
+      case OR_OR:
+      case '&':
++     case WHILE:
+      case DO:
++     case UNTIL:
++     case IF:
+      case THEN:
++     case ELIF:
+      case ELSE:
+      case '{':		/* } */
+!     case '(':		/* )( */
+!     case ')':		/* only valid in case statement */
+      case BANG:		/* ! time pipeline */
+      case TIME:		/* time time pipeline */
+*** a/bash-4.3/patchlevel.h	2012-12-29 10:47:57.000000000 -0500
+--- b/patchlevel.h	2014-03-20 20:01:28.000000000 -0400
+***************
+*** 26,30 ****
+     looks for to find the patch level (for the sccs version string). */
+  
+! #define PATCHLEVEL 37
+  
+  #endif /* _PATCHLEVEL_H_ */
+--- 26,30 ----
+     looks for to find the patch level (for the sccs version string). */
+  
+! #define PATCHLEVEL 38
+  
+  #endif /* _PATCHLEVEL_H_ */
diff --git a/package/bash/0039-patchlevel-39.patch b/package/bash/0039-patchlevel-39.patch
new file mode 100644
index 0000000..2a555b9
--- /dev/null
+++ b/package/bash/0039-patchlevel-39.patch
@@ -0,0 +1,61 @@
+From http://ftp.gnu.org/pub/gnu/bash/bash-4.3-patches/bash43-039
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+
+			     BASH PATCH REPORT
+			     =================
+
+Bash-Release:	4.3
+Patch-ID:	bash43-039
+
+Bug-Reported-by:	SN <poczta-sn@gazeta.pl>
+Bug-Reference-ID:	<54E2554C.205@gazeta.pl>
+Bug-Reference-URL:	http://lists.gnu.org/archive/html/bug-bash/2015-02/msg00060.html
+
+Bug-Description:
+
+Using the output of `declare -p' when run in a function can result in variables
+that are invisible to `declare -p'.  This problem occurs when an assignment
+builtin such as `declare' receives a quoted compound array assignment as one of
+its arguments.
+
+Patch (apply with `patch -p0'):
+
+*** a/bash-4.3-patched/arrayfunc.c	2014-10-01 13:08:48.000000000 -0400
+--- b/arrayfunc.c	2015-02-19 14:33:05.000000000 -0500
+***************
+*** 405,408 ****
+--- 405,411 ----
+      else
+        array_insert (a, i, l->word->word);
++ 
++   VUNSETATTR (var, att_invisible);	/* no longer invisible */
++ 
+    return var;
+  }
+***************
+*** 635,638 ****
+--- 638,645 ----
+    if (nlist)
+      dispose_words (nlist);
++ 
++   if (var)
++     VUNSETATTR (var, att_invisible);	/* no longer invisible */
++ 
+    return (var);
+  }
+*** a/bash-4.3/patchlevel.h	2012-12-29 10:47:57.000000000 -0500
+--- b/patchlevel.h	2014-03-20 20:01:28.000000000 -0400
+***************
+*** 26,30 ****
+     looks for to find the patch level (for the sccs version string). */
+  
+! #define PATCHLEVEL 38
+  
+  #endif /* _PATCHLEVEL_H_ */
+--- 26,30 ----
+     looks for to find the patch level (for the sccs version string). */
+  
+! #define PATCHLEVEL 39
+  
+  #endif /* _PATCHLEVEL_H_ */
diff --git a/package/bash/0040-patchlevel-40.patch b/package/bash/0040-patchlevel-40.patch
new file mode 100644
index 0000000..2a03c45
--- /dev/null
+++ b/package/bash/0040-patchlevel-40.patch
@@ -0,0 +1,51 @@
+From http://ftp.gnu.org/pub/gnu/bash/bash-4.3-patches/bash43-040
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacrias.com.ar>
+
+			     BASH PATCH REPORT
+			     =================
+
+Bash-Release:	4.3
+Patch-ID:	bash43-040
+
+Bug-Reported-by:	Jean Delvare <jdelvare@suse.de>
+Bug-Reference-ID:	<20150609180231.5f463695@endymion.delvare>
+Bug-Reference-URL:	http://lists.gnu.org/archive/html/bug-bash/2015-06/msg00033.html
+
+Bug-Description:
+
+There is a memory leak that occurs when bash expands an array reference on
+the rhs of an assignment statement.
+
+Patch (apply with `patch -p0'):
+
+*** a/bash-4.3-patched/subst.c	2014-10-01 12:57:47.000000000 -0400
+--- b/subst.c	2015-06-22 09:16:53.000000000 -0400
+***************
+*** 5783,5787 ****
+        if (pflags & PF_ASSIGNRHS)
+          {
+!           temp = array_variable_name (name, &tt, (int *)0);
+            if (ALL_ELEMENT_SUB (tt[0]) && tt[1] == ']')
+  	    temp = array_value (name, quoted|Q_DOUBLE_QUOTES, 0, &atype, &ind);
+--- 5783,5787 ----
+        if (pflags & PF_ASSIGNRHS)
+          {
+!           var = array_variable_part (name, &tt, (int *)0);
+            if (ALL_ELEMENT_SUB (tt[0]) && tt[1] == ']')
+  	    temp = array_value (name, quoted|Q_DOUBLE_QUOTES, 0, &atype, &ind);
+*** a/bash-4.3/patchlevel.h	2012-12-29 10:47:57.000000000 -0500
+--- b/patchlevel.h	2014-03-20 20:01:28.000000000 -0400
+***************
+*** 26,30 ****
+     looks for to find the patch level (for the sccs version string). */
+  
+! #define PATCHLEVEL 39
+  
+  #endif /* _PATCHLEVEL_H_ */
+--- 26,30 ----
+     looks for to find the patch level (for the sccs version string). */
+  
+! #define PATCHLEVEL 40
+  
+  #endif /* _PATCHLEVEL_H_ */
diff --git a/package/bash/0041-patchlevel-41.patch b/package/bash/0041-patchlevel-41.patch
new file mode 100644
index 0000000..c8ba4b1
--- /dev/null
+++ b/package/bash/0041-patchlevel-41.patch
@@ -0,0 +1,76 @@
+From http://ftp.gnu.org/pub/gnu/bash/bash-4.3-patches/bash43-041
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+
+			     BASH PATCH REPORT
+			     =================
+
+Bash-Release:	4.3
+Patch-ID:	bash43-041
+
+Bug-Reported-by:	Hanno B??ck <hanno@hboeck.de>
+Bug-Reference-ID:	<20150623131106.6f111da9@pc1>, <20150707004640.0e61d2f9@pc1>
+Bug-Reference-URL:	http://lists.gnu.org/archive/html/bug-bash/2015-06/msg00089.html,
+			http://lists.gnu.org/archive/html/bug-bash/2015-07/msg00018.html
+
+Bug-Description:
+
+There are several out-of-bounds read errors that occur when completing command
+lines where assignment statements appear before the command name.  The first
+two appear only when programmable completion is enabled; the last one only
+happens when listing possible completions.
+
+Patch (apply with `patch -p0'):
+
+*** a/bash-4.3.40/bashline.c	2014-12-29 14:39:43.000000000 -0500
+--- b/bashline.c	2015-08-12 10:21:58.000000000 -0400
+***************
+*** 1469,1476 ****
+--- 1469,1489 ----
+        os = start;
+        n = 0;
++       was_assignment = 0;
+        s = find_cmd_start (os);
+        e = find_cmd_end (end);
+        do
+  	{
++ 	  /* Don't read past the end of rl_line_buffer */
++ 	  if (s > rl_end)
++ 	    {
++ 	      s1 = s = e1;
++ 	      break;
++ 	    }
++ 	  /* Or past point if point is within an assignment statement */
++ 	  else if (was_assignment && s > rl_point)
++ 	    {
++ 	      s1 = s = e1;
++ 	      break;
++ 	    }
+  	  /* Skip over assignment statements preceding a command name.  If we
+  	     don't find a command name at all, we can perform command name
+*** a/bash-4.3.40/lib/readline/complete.c	2013-10-14 09:27:10.000000000 -0400
+--- b/lib/readline/complete.c	2015-07-31 09:34:39.000000000 -0400
+***************
+*** 690,693 ****
+--- 690,695 ----
+    if (temp == 0 || *temp == '\0')
+      return (pathname);
++   else if (temp[1] == 0 && temp == pathname)
++     return (pathname);
+    /* If the basename is NULL, we might have a pathname like '/usr/src/'.
+       Look for a previous slash and, if one is found, return the portion
+*** a/bash-4.3/patchlevel.h	2012-12-29 10:47:57.000000000 -0500
+--- b/patchlevel.h	2014-03-20 20:01:28.000000000 -0400
+***************
+*** 26,30 ****
+     looks for to find the patch level (for the sccs version string). */
+  
+! #define PATCHLEVEL 40
+  
+  #endif /* _PATCHLEVEL_H_ */
+--- 26,30 ----
+     looks for to find the patch level (for the sccs version string). */
+  
+! #define PATCHLEVEL 41
+  
+  #endif /* _PATCHLEVEL_H_ */
diff --git a/package/bash/0042-patchlevel-42.patch b/package/bash/0042-patchlevel-42.patch
new file mode 100644
index 0000000..bb3471c
--- /dev/null
+++ b/package/bash/0042-patchlevel-42.patch
@@ -0,0 +1,59 @@
+From http://ftp.gnu.org/pub/gnu/bash/bash-4.3-patches/bash43-042
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+
+			     BASH PATCH REPORT
+			     =================
+
+Bash-Release:	4.3
+Patch-ID:	bash43-042
+
+Bug-Reported-by:	Nathan Neulinger <nneul@neulinger.org>
+Bug-Reference-ID:	<558EFDF2.7060402@neulinger.org>
+Bug-Reference-URL:	http://lists.gnu.org/archive/html/bug-bash/2015-06/msg00096.html
+
+Bug-Description:
+
+There is a problem when parsing command substitutions containing `case'
+commands within pipelines that causes the parser to not correctly identify
+the end of the command substitution.
+
+Patch (apply with `patch -p0'):
+
+*** a/bash-4.3-patched/parse.y	2015-05-18 19:27:05.000000000 -0400
+--- b/parse.y	2015-06-29 10:59:27.000000000 -0400
+***************
+*** 3709,3712 ****
+--- 3709,3714 ----
+  	      tflags |= LEX_INWORD;
+  	      lex_wlen = 0;
++ 	      if (tflags & LEX_RESWDOK)
++ 		lex_rwlen = 0;
+  	    }
+  	}
+*** a/bash-4.3-patched/y.tab.c	2015-05-18 19:27:05.000000000 -0400
+--- b/y.tab.c	2015-06-29 10:59:27.000000000 -0400
+***************
+*** 6021,6024 ****
+--- 6021,6026 ----
+  	      tflags |= LEX_INWORD;
+  	      lex_wlen = 0;
++ 	      if (tflags & LEX_RESWDOK)
++ 		lex_rwlen = 0;
+  	    }
+  	}
+*** a/bash-4.3/patchlevel.h	2012-12-29 10:47:57.000000000 -0500
+--- b/patchlevel.h	2014-03-20 20:01:28.000000000 -0400
+***************
+*** 26,30 ****
+     looks for to find the patch level (for the sccs version string). */
+  
+! #define PATCHLEVEL 41
+  
+  #endif /* _PATCHLEVEL_H_ */
+--- 26,30 ----
+     looks for to find the patch level (for the sccs version string). */
+  
+! #define PATCHLEVEL 42
+  
+  #endif /* _PATCHLEVEL_H_ */
