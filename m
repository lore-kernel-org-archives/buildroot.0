From: Sagaert Johan <sagaert.johan@skynet.be>
Date: Wed, 25 Jan 2012 11:40:41 +0100
Subject: [Buildroot] buildroot Digest, Vol 67, Issue 109 GDB remark
In-Reply-To: <mailman.46589.1327445585.2942.buildroot@busybox.net>
References: <mailman.46589.1327445585.2942.buildroot@busybox.net>
Message-ID: <46788C2CBE484794AB37FB418C75E5FD@JohanW7>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Hi 

Did you see my comment on gdb 7.3 ? (buildroot Digest, Vol 67, Issue 68 issue 8)

Its broken for ARM , if I have some spare time I will try to check 7.4 on ARM

Johan

-----Oorspronkelijk bericht-----
Van: buildroot-bounces at busybox.net [mailto:buildroot-bounces at busybox.net] Namens buildroot-request at busybox.net
Verzonden: dinsdag 24 januari 2012 23:53
Aan: buildroot at busybox.net
Onderwerp: buildroot Digest, Vol 67, Issue 109

Send buildroot mailing list submissions to
	buildroot at busybox.net

To subscribe or unsubscribe via the World Wide Web, visit
	http://lists.busybox.net/mailman/listinfo/buildroot
or, via email, send a message with subject or body 'help' to
	buildroot-request at busybox.net

You can reach the person managing the list at
	buildroot-owner at busybox.net

When replying, please edit your Subject line so it is more specific
than "Re: Contents of buildroot digest..."


Today's Topics:

   1. [git commit] gdb: add 7.4, mark 7.1 as deprecated
      (Peter Korsgaard)
   2. [git commit] grep: bump to version 2.10 (Peter Korsgaard)
   3. [git commit] sudo: bump to version 1.7.8p1 (Peter Korsgaard)
   4. [git commit] coreutils: bump to version 8.15 (Peter Korsgaard)
   5. [git commit] bash: bump to version 4.2 pl20 (Peter Korsgaard)


----------------------------------------------------------------------

Message: 1
Date: Tue, 24 Jan 2012 22:28:47 +0100
From: Peter Korsgaard <jacmet@sunsite.dk>
To: buildroot at busybox.net
Subject: [Buildroot] [git commit] gdb: add 7.4, mark 7.1 as deprecated
Message-ID: <20120124223446.406CC9039B@busybox.osuosl.org>

commit: http://git.buildroot.net/buildroot/commit/?id=21f39f524ff52e0649c88acf32fb78d3592fb3c8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/gdb/Config.in |   10 +++++++++-
 1 files changed, 9 insertions(+), 1 deletions(-)

diff --git a/toolchain/gdb/Config.in b/toolchain/gdb/Config.in
index 9868580..8501983 100644
--- a/toolchain/gdb/Config.in
+++ b/toolchain/gdb/Config.in
@@ -30,7 +30,7 @@ choice
 	prompt "GDB debugger Version"
 	default BR2_GDB_VERSION_6_6 if BR2_bfin
 	default BR2_GDB_VERSION_6_7_1_AVR32_2_1_5 if BR2_avr32
-	default BR2_GDB_VERSION_7_3
+	default BR2_GDB_VERSION_7_4
 	depends on BR2_PACKAGE_GDB || BR2_PACKAGE_GDB_SERVER || BR2_PACKAGE_GDB_HOST
 	help
 	  Select the version of gdb you wish to use.
@@ -58,6 +58,7 @@ choice
 	config BR2_GDB_VERSION_7_1
 		bool "gdb 7.1"
 		depends on !BR2_bfin
+		depends on BR2_DEPRECATED
 		depends on BR2_TOOLCHAIN_HAS_THREADS_DEBUG_IF_NEEDED
 		select BR2_PTHREAD_DEBUG if (BR2_TOOLCHAIN_BUILDROOT && !BR2_PTHREADS_NONE)
 
@@ -73,6 +74,12 @@ choice
 		depends on BR2_TOOLCHAIN_HAS_THREADS_DEBUG_IF_NEEDED
 		select BR2_PTHREAD_DEBUG if (BR2_TOOLCHAIN_BUILDROOT && !BR2_PTHREADS_NONE)
 
+	config BR2_GDB_VERSION_7_4
+		bool "gdb 7.4.x"
+		depends on !BR2_bfin
+		depends on BR2_TOOLCHAIN_HAS_THREADS_DEBUG_IF_NEEDED
+		select BR2_PTHREAD_DEBUG if (BR2_TOOLCHAIN_BUILDROOT && !BR2_PTHREADS_NONE)
+
 endchoice
 
 comment "gdb 7.x support needs pthread debug support in toolchain"
@@ -88,3 +95,4 @@ config BR2_GDB_VERSION
 	default "7.1a"     if BR2_GDB_VERSION_7_1
 	default "7.2a"     if BR2_GDB_VERSION_7_2
 	default "7.3.1"    if BR2_GDB_VERSION_7_3
+	default "7.4"      if BR2_GDB_VERSION_7_4


------------------------------

Message: 2
Date: Tue, 24 Jan 2012 23:40:49 +0100
From: Peter Korsgaard <jacmet@sunsite.dk>
To: buildroot at busybox.net
Subject: [Buildroot] [git commit] grep: bump to version 2.10
Message-ID: <20120124225256.BF0FC90392@busybox.osuosl.org>

commit: http://git.buildroot.net/buildroot/commit/?id=ce7a7896c5cdc4ecc6a5ca16f9403c57d0a329f9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/grep/grep.mk |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/package/grep/grep.mk b/package/grep/grep.mk
index e039135..a4391d7 100644
--- a/package/grep/grep.mk
+++ b/package/grep/grep.mk
@@ -4,8 +4,9 @@
 #
 #############################################################
 
-GREP_VERSION = 2.9
+GREP_VERSION = 2.10
 GREP_SITE = $(BR2_GNU_MIRROR)/grep
+GREP_SOURCE = grep-$(GREP_VERSION).tar.xz
 GREP_CONF_OPT = --disable-perl-regexp --without-included-regex
 GREP_DEPENDENCIES = $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext libintl)
 


------------------------------

Message: 3
Date: Tue, 24 Jan 2012 23:40:34 +0100
From: Peter Korsgaard <jacmet@sunsite.dk>
To: buildroot at busybox.net
Subject: [Buildroot] [git commit] sudo: bump to version 1.7.8p1
Message-ID: <20120124225256.B185890392@busybox.osuosl.org>

commit: http://git.buildroot.net/buildroot/commit/?id=70b489f2d9da688c5b4005b34576b4bbe6eb67dd
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/sudo/sudo.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/sudo/sudo.mk b/package/sudo/sudo.mk
index 9c62c49..f10d294 100644
--- a/package/sudo/sudo.mk
+++ b/package/sudo/sudo.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-SUDO_VERSION = 1.7.7
+SUDO_VERSION = 1.7.8p1
 SUDO_SITE    = http://www.sudo.ws/sudo/dist
 
 SUDO_CONF_OPT = \


------------------------------

Message: 4
Date: Tue, 24 Jan 2012 23:41:47 +0100
From: Peter Korsgaard <jacmet@sunsite.dk>
To: buildroot at busybox.net
Subject: [Buildroot] [git commit] coreutils: bump to version 8.15
Message-ID: <20120124225256.E5FDF9039C@busybox.osuosl.org>

commit: http://git.buildroot.net/buildroot/commit/?id=0d2a304ef39fa838824b31e4453dcef21b5302ff
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .../coreutils/coreutils-8.14-hostname-man.patch    |   51 --------------------
 package/coreutils/coreutils.mk                     |    2 +-
 2 files changed, 1 insertions(+), 52 deletions(-)

diff --git a/package/coreutils/coreutils-8.14-hostname-man.patch b/package/coreutils/coreutils-8.14-hostname-man.patch
deleted file mode 100644
index 5f8fa1e..0000000
--- a/package/coreutils/coreutils-8.14-hostname-man.patch
+++ /dev/null
@@ -1,51 +0,0 @@
---- /dev/null	2010-09-18 00:21:07.280000001 -0700
-+++ b/man/hostname.1	2010-09-23 12:08:06.000000000 -0700
-@@ -0,0 +1,48 @@
-+.\" DO NOT MODIFY THIS FILE!  It was generated by help2man 1.35.
-+.TH HOSTNAME "1" "January 2011" "GNU coreutils 8.9" "User Commands"
-+.SH NAME
-+hostname \- set or print the name of the current host system
-+.SH SYNOPSIS
-+.B hostname
-+[\fINAME\fR]
-+.br
-+.B hostname
-+\fIOPTION\fR
-+.SH DESCRIPTION
-+.\" Add any additional description here
-+.PP
-+Print or set the hostname of the current system.
-+.TP
-+\fB\-\-help\fR
-+display this help and exit
-+.TP
-+\fB\-\-version\fR
-+output version information and exit
-+.SH AUTHOR
-+Written by Jim Meyering.
-+.SH "REPORTING BUGS"
-+Report hostname bugs to bug\-coreutils at gnu.org
-+.br
-+GNU coreutils home page: <http://www.gnu.org/software/coreutils/>
-+.br
-+General help using GNU software: <http://www.gnu.org/gethelp/>
-+.br
-+Report hostname translation bugs to <http://translationproject.org/team/>
-+.SH COPYRIGHT
-+Copyright \(co 2010 Free Software Foundation, Inc.
-+License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>.
-+.br
-+This is free software: you are free to change and redistribute it.
-+There is NO WARRANTY, to the extent permitted by law.
-+.SH "SEE ALSO"
-+The full documentation for
-+.B hostname
-+is maintained as a Texinfo manual.  If the
-+.B info
-+and
-+.B hostname
-+programs are properly installed at your site, the command
-+.IP
-+.B info coreutils \(aqhostname invocation\(aq
-+.PP
-+should give you access to the complete manual.
diff --git a/package/coreutils/coreutils.mk b/package/coreutils/coreutils.mk
index eb88535..0a85586 100644
--- a/package/coreutils/coreutils.mk
+++ b/package/coreutils/coreutils.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-COREUTILS_VERSION = 8.14
+COREUTILS_VERSION = 8.15
 COREUTILS_SITE = $(BR2_GNU_MIRROR)/coreutils
 COREUTILS_SOURCE = coreutils-$(COREUTILS_VERSION).tar.xz
 


------------------------------

Message: 5
Date: Tue, 24 Jan 2012 23:41:22 +0100
From: Peter Korsgaard <jacmet@sunsite.dk>
To: buildroot at busybox.net
Subject: [Buildroot] [git commit] bash: bump to version 4.2 pl20
Message-ID: <20120124225256.D5BBD90392@busybox.osuosl.org>

commit: http://git.buildroot.net/buildroot/commit/?id=5bedeb2fb36d8b36dc1e7392a2fc16e0bd1a0e81
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/bash/bash-4.2-011.patch |   46 ++++++++++++
 package/bash/bash-4.2-012.patch |  151 +++++++++++++++++++++++++++++++++++++++
 package/bash/bash-4.2-013.patch |   52 +++++++++++++
 package/bash/bash-4.2-014.patch |   47 ++++++++++++
 package/bash/bash-4.2-015.patch |   81 +++++++++++++++++++++
 package/bash/bash-4.2-016.patch |   46 ++++++++++++
 package/bash/bash-4.2-017.patch |   47 ++++++++++++
 package/bash/bash-4.2-018.patch |   74 +++++++++++++++++++
 package/bash/bash-4.2-019.patch |   47 ++++++++++++
 package/bash/bash-4.2-020.patch |   60 +++++++++++++++
 10 files changed, 651 insertions(+), 0 deletions(-)

diff --git a/package/bash/bash-4.2-011.patch b/package/bash/bash-4.2-011.patch
new file mode 100644
index 0000000..802c1f1
--- /dev/null
+++ b/package/bash/bash-4.2-011.patch
@@ -0,0 +1,46 @@
+			     BASH PATCH REPORT
+			     =================
+
+Bash-Release:	4.2
+Patch-ID:	bash42-011
+
+Bug-Reported-by:	"David Parks" <davidparks21@yahoo.com>
+Bug-Reference-ID:	<014101cc82c6$46ac1540$d4043fc0$@com>
+Bug-Reference-URL:	http://lists.gnu.org/archive/html/bug-bash/2011-10/msg00031.html
+
+Bug-Description:
+
+Overwriting a value in an associative array causes the memory allocated to
+store the key on the second and subsequent assignments to leak.
+
+Patch (apply with `patch -p0'):
+
+*** ../bash-4.2-patched/assoc.c	2009-08-05 20:19:40.000000000 -0400
+--- ./assoc.c	2011-10-04 20:23:07.000000000 -0400
+***************
+*** 78,81 ****
+--- 78,86 ----
+    if (b == 0)
+      return -1;
++   /* If we are overwriting an existing element's value, we're not going to
++      use the key.  Nothing in the array assignment code path frees the key
++      string, so we can free it here to avoid a memory leak. */
++   if (b->key != key)
++     free (key);
+    FREE (b->data);
+    b->data = value ? savestring (value) : (char *)0;
+*** ../bash-4.2-patched/patchlevel.h	Sat Jun 12 20:14:48 2010
+--- ./patchlevel.h	Thu Feb 24 21:41:34 2011
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
diff --git a/package/bash/bash-4.2-012.patch b/package/bash/bash-4.2-012.patch
new file mode 100644
index 0000000..9a1c49c
--- /dev/null
+++ b/package/bash/bash-4.2-012.patch
@@ -0,0 +1,151 @@
+			     BASH PATCH REPORT
+			     =================
+
+Bash-Release:	4.2
+Patch-ID:	bash42-012
+
+Bug-Reported-by:	Rui Santos <rsantos@grupopie.com>
+Bug-Reference-ID:	<4E04C6D0.2020507@grupopie.com>
+Bug-Reference-URL:	http://lists.gnu.org/archive/html/bug-bash/2011-06/msg00079.html
+
+Bug-Description:
+
+When calling the parser to recursively parse a command substitution within
+an arithmetic expansion, the shell overwrote the saved shell input line and
+associated state, resulting in a garbled command.
+
+Patch (apply with `patch -p0'):
+
+*** ../bash-4.2-patched/parse.y	2011-02-26 19:19:05.000000000 -0500
+--- ./parse.y	2011-06-24 20:08:22.000000000 -0400
+***************
+*** 3843,3846 ****
+--- 3849,3853 ----
+  {
+    sh_parser_state_t ps;
++   sh_input_line_state_t ls;
+    int orig_ind, nc, sflags;
+    char *ret, *s, *ep, *ostring;
+***************
+*** 3850,3857 ****
+--- 3857,3866 ----
+    ostring = string;
+  
++ /*itrace("xparse_dolparen: size = %d shell_input_line = `%s'", shell_input_line_size, shell_input_line);*/
+    sflags = SEVAL_NONINT|SEVAL_NOHIST|SEVAL_NOFREE;
+    if (flags & SX_NOLONGJMP)
+      sflags |= SEVAL_NOLONGJMP;
+    save_parser_state (&ps);
++   save_input_line_state (&ls);
+  
+    /*(*/
+***************
+*** 3862,3865 ****
+--- 3871,3876 ----
+    restore_parser_state (&ps);
+    reset_parser ();
++   /* reset_parser clears shell_input_line and associated variables */
++   restore_input_line_state (&ls);
+    if (interactive)
+      token_to_read = 0;
+***************
+*** 5909,5912 ****
+--- 5920,5929 ----
+    ps->echo_input_at_read = echo_input_at_read;
+  
++   ps->token = token;
++   ps->token_buffer_size = token_buffer_size;
++   /* Force reallocation on next call to read_token_word */
++   token = 0;
++   token_buffer_size = 0;
++ 
+    return (ps);
+  }
+***************
+*** 5950,5953 ****
+--- 5967,6006 ----
+    expand_aliases = ps->expand_aliases;
+    echo_input_at_read = ps->echo_input_at_read;
++ 
++   FREE (token);
++   token = ps->token;
++   token_buffer_size = ps->token_buffer_size;
++ }
++ 
++ sh_input_line_state_t *
++ save_input_line_state (ls)
++      sh_input_line_state_t *ls;
++ {
++   if (ls == 0)
++     ls = (sh_input_line_state_t *)xmalloc (sizeof (sh_input_line_state_t));
++   if (ls == 0)
++     return ((sh_input_line_state_t *)NULL);
++ 
++   ls->input_line = shell_input_line;
++   ls->input_line_size = shell_input_line_size;
++   ls->input_line_len = shell_input_line_len;
++   ls->input_line_index = shell_input_line_index;
++ 
++   /* force reallocation */
++   shell_input_line = 0;
++   shell_input_line_size = shell_input_line_len = shell_input_line_index = 0;
++ }
++ 
++ void
++ restore_input_line_state (ls)
++      sh_input_line_state_t *ls;
++ {
++   FREE (shell_input_line);
++   shell_input_line = ls->input_line;
++   shell_input_line_size = ls->input_line_size;
++   shell_input_line_len = ls->input_line_len;
++   shell_input_line_index = ls->input_line_index;
++ 
++   set_line_mbstate ();
+  }
+  
+*** ../bash-4.2-patched/shell.h	2011-01-06 22:16:55.000000000 -0500
+--- ./shell.h	2011-06-24 19:12:25.000000000 -0400
+***************
+*** 137,140 ****
+--- 139,145 ----
+    int *token_state;
+  
++   char *token;
++   int token_buffer_size;
++ 
+    /* input line state -- line number saved elsewhere */
+    int input_line_terminator;
+***************
+*** 167,171 ****
+--- 172,186 ----
+  } sh_parser_state_t;
+  
++ typedef struct _sh_input_line_state_t {
++   char *input_line;
++   int input_line_index;
++   int input_line_size;
++   int input_line_len;
++ } sh_input_line_state_t;
++ 
+  /* Let's try declaring these here. */
+  extern sh_parser_state_t *save_parser_state __P((sh_parser_state_t *));
+  extern void restore_parser_state __P((sh_parser_state_t *));
++ 
++ extern sh_input_line_state_t *save_input_line_state __P((sh_input_line_state_t *));
++ extern void restore_input_line_state __P((sh_input_line_state_t *));
+*** ../bash-4.2-patched/patchlevel.h	Sat Jun 12 20:14:48 2010
+--- ./patchlevel.h	Thu Feb 24 21:41:34 2011
+***************
+*** 26,30 ****
+     looks for to find the patch level (for the sccs version string). */
+  
+! #define PATCHLEVEL 11
+  
+  #endif /* _PATCHLEVEL_H_ */
+--- 26,30 ----
+     looks for to find the patch level (for the sccs version string). */
+  
+! #define PATCHLEVEL 12
+  
+  #endif /* _PATCHLEVEL_H_ */
diff --git a/package/bash/bash-4.2-013.patch b/package/bash/bash-4.2-013.patch
new file mode 100644
index 0000000..06840a3
--- /dev/null
+++ b/package/bash/bash-4.2-013.patch
@@ -0,0 +1,52 @@
+			     BASH PATCH REPORT
+			     =================
+
+Bash-Release:	4.2
+Patch-ID:	bash42-013
+
+Bug-Reported-by:	Marten Wikstrom <marten.wikstrom@keystream.se>
+Bug-Reference-ID:	<BANLkTikKECAh94ZEX68iQvxYuPeEM_xoSQ@mail.gmail.com>
+Bug-Reference-URL:	http://lists.gnu.org/archive/html/bug-bash/2011-05/msg00049.html
+
+Bug-Description:
+
+An off-by-one error caused the shell to skip over CTLNUL characters,
+which are used internally to mark quoted null strings.  The effect
+was to have stray 0x7f characters left after expanding words like
+""""""""aa.
+
+Patch (apply with `patch -p0'):
+
+*** ../bash-4.2-patched/subst.c	2011-03-06 14:11:11.000000000 -0500
+--- ./subst.c	2011-05-11 11:23:33.000000000 -0400
+***************
+*** 3707,3711 ****
+  	}
+        else if (string[i] == CTLNUL)
+! 	i++;
+  
+        prev_i = i;
+--- 3710,3717 ----
+  	}
+        else if (string[i] == CTLNUL)
+! 	{
+! 	  i++;
+! 	  continue;
+! 	}
+  
+        prev_i = i;
+*** ../bash-4.2-patched/patchlevel.h	Sat Jun 12 20:14:48 2010
+--- ./patchlevel.h	Thu Feb 24 21:41:34 2011
+***************
+*** 26,30 ****
+     looks for to find the patch level (for the sccs version string). */
+  
+! #define PATCHLEVEL 12
+  
+  #endif /* _PATCHLEVEL_H_ */
+--- 26,30 ----
+     looks for to find the patch level (for the sccs version string). */
+  
+! #define PATCHLEVEL 13
+  
+  #endif /* _PATCHLEVEL_H_ */
diff --git a/package/bash/bash-4.2-014.patch b/package/bash/bash-4.2-014.patch
new file mode 100644
index 0000000..d6652eb
--- /dev/null
+++ b/package/bash/bash-4.2-014.patch
@@ -0,0 +1,47 @@
+			     BASH PATCH REPORT
+			     =================
+
+Bash-Release:	4.2
+Patch-ID:	bash42-014
+
+Bug-Reported-by:	Shawn Bohrer <sbohrer@rgmadvisors.com>
+Bug-Reference-ID:	<20110504152320.6E8F28130527@dev1.rgmadvisors.com>
+Bug-Reference-URL:	http://lists.gnu.org/archive/html/bug-bash/2011-05/msg00018.html
+
+Bug-Description:
+
+The regular expression matching operator did not correctly match
+expressions with an embedded ^A.
+
+Patch (apply with `patch -p0'):
+
+*** ../bash-4.2-patched/pathexp.c	2010-08-13 23:21:57.000000000 -0400
+--- ./pathexp.c	2011-05-05 16:40:58.000000000 -0400
+***************
+*** 197,201 ****
+  	  if ((qflags & QGLOB_FILENAME) && pathname[i+1] == '/')
+  	    continue;
+! 	  if ((qflags & QGLOB_REGEXP) && ere_char (pathname[i+1]) == 0)
+  	    continue;
+  	  temp[j++] = '\\';
+--- 197,201 ----
+  	  if ((qflags & QGLOB_FILENAME) && pathname[i+1] == '/')
+  	    continue;
+! 	  if (pathname[i+1] != CTLESC && (qflags & QGLOB_REGEXP) && ere_char (pathname[i+1]) == 0)
+  	    continue;
+  	  temp[j++] = '\\';
+*** ../bash-4.2-patched/patchlevel.h	Sat Jun 12 20:14:48 2010
+--- ./patchlevel.h	Thu Feb 24 21:41:34 2011
+***************
+*** 26,30 ****
+     looks for to find the patch level (for the sccs version string). */
+  
+! #define PATCHLEVEL 13
+  
+  #endif /* _PATCHLEVEL_H_ */
+--- 26,30 ----
+     looks for to find the patch level (for the sccs version string). */
+  
+! #define PATCHLEVEL 14
+  
+  #endif /* _PATCHLEVEL_H_ */
diff --git a/package/bash/bash-4.2-015.patch b/package/bash/bash-4.2-015.patch
new file mode 100644
index 0000000..5bcca34
--- /dev/null
+++ b/package/bash/bash-4.2-015.patch
@@ -0,0 +1,81 @@
+			     BASH PATCH REPORT
+			     =================
+
+Bash-Release:	4.2
+Patch-ID:	bash42-015
+
+Bug-Reported-by:	<dnade.ext@orange-ftgroup.com>
+Bug-Reference-ID:
<728_1312188080_4E3666B0_728_118711_1_3B5D3E0F95CC5C478D6500CDCE8B691F7AAAA4AA3D@PUEXCB2B.nanterre.francetelecom.fr>
+Bug-Reference-URL:	http://lists.gnu.org/archive/html/bug-bash/2011-08/msg00000.html
+
+Bug-Description:
+
+When in a context where arithmetic evaluation is not taking place, the
+evaluator should not check for division by 0.
+
+Patch (apply with `patch -p0'):
+
+*** ../bash-4.2-patched/expr.c	2010-12-21 11:12:13.000000000 -0500
+--- ./expr.c	2011-08-02 20:58:28.000000000 -0400
+***************
+*** 477,480 ****
+--- 481,492 ----
+        if (special)
+  	{
++ 	  if ((op == DIV || op == MOD) && value == 0)
++ 	    {
++ 	      if (noeval == 0)
++ 		evalerror (_("division by 0"));
++ 	      else
++ 	        value = 1;
++ 	    }
++ 
+  	  switch (op)
+  	    {
+***************
+*** 483,493 ****
+  	      break;
+  	    case DIV:
+- 	      if (value == 0)
+- 		evalerror (_("division by 0"));
+  	      lvalue /= value;
+  	      break;
+  	    case MOD:
+- 	      if (value == 0)
+- 		evalerror (_("division by 0"));
+  	      lvalue %= value;
+  	      break;
+--- 495,501 ----
+***************
+*** 805,809 ****
+  
+        if (((op == DIV) || (op == MOD)) && (val2 == 0))
+! 	evalerror (_("division by 0"));
+  
+        if (op == MUL)
+--- 813,822 ----
+  
+        if (((op == DIV) || (op == MOD)) && (val2 == 0))
+! 	{
+! 	  if (noeval == 0)
+! 	    evalerror (_("division by 0"));
+! 	  else
+! 	    val2 = 1;
+! 	}
+  
+        if (op == MUL)
+*** ../bash-4.2-patched/patchlevel.h	Sat Jun 12 20:14:48 2010
+--- ./patchlevel.h	Thu Feb 24 21:41:34 2011
+***************
+*** 26,30 ****
+     looks for to find the patch level (for the sccs version string). */
+  
+! #define PATCHLEVEL 14
+  
+  #endif /* _PATCHLEVEL_H_ */
+--- 26,30 ----
+     looks for to find the patch level (for the sccs version string). */
+  
+! #define PATCHLEVEL 15
+  
+  #endif /* _PATCHLEVEL_H_ */
diff --git a/package/bash/bash-4.2-016.patch b/package/bash/bash-4.2-016.patch
new file mode 100644
index 0000000..04f9432
--- /dev/null
+++ b/package/bash/bash-4.2-016.patch
@@ -0,0 +1,46 @@
+			     BASH PATCH REPORT
+			     =================
+
+Bash-Release:	4.2
+Patch-ID:	bash42-016
+
+Bug-Reported-by:	Martin von Gagern <Martin.vGagern@gmx.net>
+Bug-Reference-ID:	<4E43AD9E.8060501@gmx.net>
+Bug-Reference-URL:	http://lists.gnu.org/archive/html/bug-bash/2011-08/msg00141.html
+
+Bug-Description:
+
+Bash should not check for mail while executing the `eval' builtin.
+
+Patch (apply with `patch -p0'):
+
+*** ../bash-4.2-patched/parse.y	Fri Feb 25 12:07:41 2011
+--- ./parse.y	Thu Aug 11 19:02:26 2011
+***************
+*** 2500,2504 ****
+  	 is the mail alarm reset; nothing takes place in check_mail ()
+  	 except the checking of mail.  Please don't change this. */
+!       if (prompt_is_ps1 && time_to_check_mail ())
+  	{
+  	  check_mail ();
+--- 2498,2502 ----
+  	 is the mail alarm reset; nothing takes place in check_mail ()
+  	 except the checking of mail.  Please don't change this. */
+!       if (prompt_is_ps1 && parse_and_execute_level == 0 && time_to_check_mail ())
+  	{
+  	  check_mail ();
+*** ../bash-4.2-patched/patchlevel.h	Sat Jun 12 20:14:48 2010
+--- ./patchlevel.h	Thu Feb 24 21:41:34 2011
+***************
+*** 26,30 ****
+     looks for to find the patch level (for the sccs version string). */
+  
+! #define PATCHLEVEL 15
+  
+  #endif /* _PATCHLEVEL_H_ */
+--- 26,30 ----
+     looks for to find the patch level (for the sccs version string). */
+  
+! #define PATCHLEVEL 16
+  
+  #endif /* _PATCHLEVEL_H_ */
diff --git a/package/bash/bash-4.2-017.patch b/package/bash/bash-4.2-017.patch
new file mode 100644
index 0000000..fdecffa
--- /dev/null
+++ b/package/bash/bash-4.2-017.patch
@@ -0,0 +1,47 @@
+			     BASH PATCH REPORT
+			     =================
+
+Bash-Release:	4.2
+Patch-ID:	bash42-017
+
+Bug-Reported-by:	Curtis Doty <Curtis@GreenKey.net>
+Bug-Reference-ID:	<20110621035324.A4F70849F59@mx1.iParadigms.net>
+Bug-Reference-URL:	http://lists.gnu.org/archive/html/bug-bash/2011-06/msg00053.html
+
+Bug-Description:
+
+Using `read -a foo' where foo was an already-declared associative array
+caused the shell to die with a segmentation fault.
+
+Patch (apply with `patch -p0'):
+
+*** ../bash-4.2-patched/builtins/read.def	2011-01-04 11:43:36.000000000 -0500
+--- ./builtins/read.def	2011-06-21 10:31:02.000000000 -0400
+***************
+*** 643,646 ****
+--- 642,651 ----
+  	  return EXECUTION_FAILURE;	/* readonly or noassign */
+  	}
++       if (assoc_p (var))
++ 	{
++           builtin_error (_("%s: cannot convert associative to indexed array"), arrayname);
++ 	  xfree (input_string);
++ 	  return EXECUTION_FAILURE;	/* existing associative array */
++ 	}
+        array_flush (array_cell (var));
+  
+*** ../bash-4.2-patched/patchlevel.h	Sat Jun 12 20:14:48 2010
+--- ./patchlevel.h	Thu Feb 24 21:41:34 2011
+***************
+*** 26,30 ****
+     looks for to find the patch level (for the sccs version string). */
+  
+! #define PATCHLEVEL 16
+  
+  #endif /* _PATCHLEVEL_H_ */
+--- 26,30 ----
+     looks for to find the patch level (for the sccs version string). */
+  
+! #define PATCHLEVEL 17
+  
+  #endif /* _PATCHLEVEL_H_ */
diff --git a/package/bash/bash-4.2-018.patch b/package/bash/bash-4.2-018.patch
new file mode 100644
index 0000000..c96b901
--- /dev/null
+++ b/package/bash/bash-4.2-018.patch
@@ -0,0 +1,74 @@
+			     BASH PATCH REPORT
+			     =================
+
+Bash-Release:	4.2
+Patch-ID:	bash42-018
+
+Bug-Reported-by:	Thomas Cort <tcort@minix3.org>
+Bug-Reference-ID:	<BANLkTik-ebGGw3k_1YtB=RyfV1bsqdxC_g@mail.gmail.com>
+Bug-Reference-URL:	http://lists.gnu.org/archive/html/bug-bash/2011-06/msg00110.html
+
+Bug-Description:
+
+Bash fails to compile unless JOB_CONTROL is defined.
+
+Patch (apply with `patch -p0'):
+
+*** ../bash-4.2-patched/execute_cmd.c	2011-02-09 17:32:25.000000000 -0500
+--- ./execute_cmd.c	2011-11-06 15:12:48.000000000 -0500
+***************
+*** 2197,2200 ****
+--- 2315,2319 ----
+      cmd->flags |= CMD_IGNORE_RETURN;
+  
++ #if defined (JOB_CONTROL)
+    lastpipe_flag = 0;
+    begin_unwind_frame ("lastpipe-exec");
+***************
+*** 2216,2228 ****
+  	  add_unwind_protect (lastpipe_cleanup, lastpipe_jid);
+  	}
+!       cmd->flags |= CMD_LASTPIPE;
+      }	  
+    if (prev >= 0)
+      add_unwind_protect (close, prev);
+  
+    exec_result = execute_command_internal (cmd, asynchronous, prev, pipe_out, fds_to_close);
+  
+    if (lstdin > 0)
+      restore_stdin (lstdin);
+  
+    if (prev >= 0)
+--- 2335,2351 ----
+  	  add_unwind_protect (lastpipe_cleanup, lastpipe_jid);
+  	}
+!       if (cmd)
+! 	cmd->flags |= CMD_LASTPIPE;
+      }	  
+    if (prev >= 0)
+      add_unwind_protect (close, prev);
++ #endif
+  
+    exec_result = execute_command_internal (cmd, asynchronous, prev, pipe_out, fds_to_close);
+  
++ #if defined (JOB_CONTROL)
+    if (lstdin > 0)
+      restore_stdin (lstdin);
++ #endif
+  
+    if (prev >= 0)
+*** ../bash-4.2-patched/patchlevel.h	Sat Jun 12 20:14:48 2010
+--- ./patchlevel.h	Thu Feb 24 21:41:34 2011
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
diff --git a/package/bash/bash-4.2-019.patch b/package/bash/bash-4.2-019.patch
new file mode 100644
index 0000000..01603a9
--- /dev/null
+++ b/package/bash/bash-4.2-019.patch
@@ -0,0 +1,47 @@
+			     BASH PATCH REPORT
+			     =================
+
+Bash-Release:	4.2
+Patch-ID:	bash42-019
+
+Bug-Reported-by:	Diego Augusto Molina <diegoaugustomolina@gmail.com>
+Bug-Reference-ID:	<CAGOxLdHcSQu3ck9Qy3pRjj_NBU5tAPSAvNm-95-nLQ9Szwb6aA@mail.gmail.com>
+Bug-Reference-URL:	lists.gnu.org/archive/html/bug-bash/2011-09/msg00047.html
+
+Bug-Description:
+
+Using `declare' with attributes and an invalid array variable name or
+assignment reference resulted in a segmentation fault instead of a
+declaration error.
+
+Patch (apply with `patch -p0'):
+
+*** ../bash-4.2-patched/builtins/declare.def	2010-05-30 18:25:21.000000000 -0400
+--- ./builtins/declare.def	2011-09-15 15:20:20.000000000 -0400
+***************
+*** 514,517 ****
+--- 514,522 ----
+  	      var = assign_array_element (name, value, 0);	/* XXX - not aflags */
+  	      *subscript_start = '\0';
++ 	      if (var == 0)	/* some kind of assignment error */
++ 		{
++ 		  assign_error++;
++ 		  NEXT_VARIABLE ();
++ 		}
+  	    }
+  	  else if (simple_array_assign)
+*** ../bash-4.2-patched/patchlevel.h	Sat Jun 12 20:14:48 2010
+--- ./patchlevel.h	Thu Feb 24 21:41:34 2011
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
diff --git a/package/bash/bash-4.2-020.patch b/package/bash/bash-4.2-020.patch
new file mode 100644
index 0000000..77e31df
--- /dev/null
+++ b/package/bash/bash-4.2-020.patch
@@ -0,0 +1,60 @@
+			     BASH PATCH REPORT
+			     =================
+
+Bash-Release:	4.2
+Patch-ID:	bash42-020
+
+Bug-Reported-by:	Vincent Sheffer <vince.sheffer@apisphere.com>
+Bug-Reference-ID:	<F13C1C4F-C44C-4071-BFED-4BB6D13CF92F@apisphere.com>
+Bug-Reference-URL:	https://lists.gnu.org/archive/html/bug-readline/2011-08/msg00000.html
+
+Bug-Description:
+
+The shared object helper script needs to be updated for Mac OS X 10.7
+(Lion, darwin11).
+
+Patch (apply with `patch -p0'):
+
+*** ../bash-4.2-patched/support/shobj-conf	2009-10-28 09:20:21.000000000 -0400
+--- ./support/shobj-conf	2011-08-27 13:25:23.000000000 -0400
+***************
+*** 158,162 ****
+  
+  # Darwin/MacOS X
+! darwin[89]*|darwin10*)
+  	SHOBJ_STATUS=supported
+  	SHLIB_STATUS=supported
+--- 172,176 ----
+  
+  # Darwin/MacOS X
+! darwin[89]*|darwin1[012]*)
+  	SHOBJ_STATUS=supported
+  	SHLIB_STATUS=supported
+***************
+*** 187,191 ****
+  
+  	case "${host_os}" in
+! 	darwin[789]*|darwin10*)	SHOBJ_LDFLAGS=''
+  			SHLIB_XLDFLAGS='-dynamiclib -arch_only `/usr/bin/arch` -install_name $(libdir)/$@ -current_version
$(SHLIB_MAJOR)$(SHLIB_MINOR) -compatibility_version $(SHLIB_MAJOR) -v'
+  			;;
+--- 201,205 ----
+  
+  	case "${host_os}" in
+! 	darwin[789]*|darwin1[012]*)	SHOBJ_LDFLAGS=''
+  			SHLIB_XLDFLAGS='-dynamiclib -arch_only `/usr/bin/arch` -install_name $(libdir)/$@ -current_version
$(SHLIB_MAJOR)$(SHLIB_MINOR) -compatibility_version $(SHLIB_MAJOR) -v'
+  			;;
+*** ../bash-4.2-patched/patchlevel.h	Sat Jun 12 20:14:48 2010
+--- ./patchlevel.h	Thu Feb 24 21:41:34 2011
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


------------------------------

_______________________________________________
buildroot mailing list
buildroot at busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot

End of buildroot Digest, Vol 67, Issue 109
******************************************
