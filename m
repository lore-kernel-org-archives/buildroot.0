From: hamish at uclibc.org <hamish@uclibc.org>
Date: Tue,  5 Feb 2008 17:26:05 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/readline
Message-ID: <20080206012605.E093412C5FC@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: hamish
Date: 2008-02-05 17:26:03 -0800 (Tue, 05 Feb 2008)
New Revision: 20948

Log:
Upgrade readline to 5.2, including all current upstream patches.
Fetch it from $(BR2_GNU_MIRROR).
Note proper dependency on ncurses.



Modified:
   trunk/buildroot/package/readline/Config.in
   trunk/buildroot/package/readline/readline.mk
   trunk/buildroot/package/readline/readline51-001
   trunk/buildroot/package/readline/readline51-002
   trunk/buildroot/package/readline/readline51-003
   trunk/buildroot/package/readline/readline51-004


Changeset:
Modified: trunk/buildroot/package/readline/Config.in
===================================================================
--- trunk/buildroot/package/readline/Config.in	2008-02-06 00:55:05 UTC (rev 20947)
+++ trunk/buildroot/package/readline/Config.in	2008-02-06 01:26:03 UTC (rev 20948)
@@ -9,5 +9,11 @@
 	bool "readline for the target"
 	depends on BR2_READLINE
 	help
-	  Say yes here to install the readline libraries and headers
+	  Say yes here to install the readline libraries on the target.
+
+config BR2_PACKAGE_READLINE_HEADERS
+	bool "readline headers for the target"
+	depends on BR2_PACKAGE_READLINE_TARGET
+	help
+	  Say yes here to install the readline headers and documentation
 	  on the target.

Modified: trunk/buildroot/package/readline/readline.mk
===================================================================
--- trunk/buildroot/package/readline/readline.mk	2008-02-06 00:55:05 UTC (rev 20947)
+++ trunk/buildroot/package/readline/readline.mk	2008-02-06 01:26:03 UTC (rev 20948)
@@ -3,8 +3,8 @@
 # build GNU readline
 #
 #############################################################
-READLINE_VERSION:=5.1
-READLINE_SITE:=ftp://ftp.cwru.edu/pub/bash
+READLINE_VERSION:=5.2
+READLINE_SITE:=$(BR2_GNU_MIRROR)/readline
 READLINE_SOURCE:=readline-$(READLINE_VERSION).tar.gz
 READLINE_DIR:=$(BUILD_DIR)/readline-$(READLINE_VERSION)
 READLINE_CAT:=$(ZCAT)
@@ -21,6 +21,7 @@
 $(READLINE_DIR)/.unpacked: $(DL_DIR)/$(READLINE_SOURCE)
 	mkdir -p $(READLINE_DIR)
 	tar -C $(BUILD_DIR) -zxf $(DL_DIR)/$(READLINE_SOURCE)
+	toolchain/patch-kernel.sh $(READLINE_DIR) package/readline/ readline??-???
 	$(CONFIG_UPDATE) $(READLINE_DIR)
 	$(CONFIG_UPDATE) $(READLINE_DIR)/support
 	touch $@
@@ -51,7 +52,7 @@
 	touch $@
 
 $(READLINE_DIR)/$(READLINE_BINARY): $(READLINE_DIR)/.configured
-	$(MAKE) -C $(READLINE_DIR)
+	$(MAKE) -C $(READLINE_DIR) SHLIB_LIBS="-lncurses"
 	ls $(READLINE_DIR)/$(READLINE_BINARY)
 	touch -c $@
 
@@ -72,8 +73,13 @@
 	BUILD_CC=$(TARGET_CC) HOSTCC="$(HOSTCC)" CC=$(TARGET_CC) \
 	$(MAKE1) DESTDIR=$(TARGET_DIR) \
 		-C $(READLINE_DIR) install-shared uninstall-doc
+	chmod 775 $(TARGET_DIR)/lib/libreadline.so.$(READLINE_VERSION) $(TARGET_DIR)/lib/libhistory.so.$(READLINE_VERSION)
+	$(STRIPCMD) $(TARGET_DIR)/lib/libreadline.so.$(READLINE_VERSION) $(TARGET_DIR)/lib/libhistory.so.$(READLINE_VERSION)
+ifneq ($(strip $(BR2_PACKAGE_READLINE_HEADERS)),y)
+	rm -rf $(TARGET_DIR)/usr/include/readline
+endif
 
-readline: $(STAGING_DIR)/usr/include/readline/readline.h
+readline: ncurses $(STAGING_DIR)/usr/include/readline/readline.h
 
 readline-clean:
 	$(MAKE) -C $(READLINE_DIR) DESTDIR=$(STAGING_DIR) uninstall
@@ -82,7 +88,7 @@
 readline-dirclean:
 	rm -rf $(READLINE_DIR)
 
-readline-target: $(TARGET_DIR)/$(READLINE_TARGET_SHARED_BINARY)
+readline-target: readline $(TARGET_DIR)/$(READLINE_TARGET_SHARED_BINARY)
 
 readline-target-clean:
 	$(MAKE1) DESTDIR=$(TARGET_DIR) -C $(READLINE_DIR) uninstall

Modified: trunk/buildroot/package/readline/readline51-001
===================================================================
--- trunk/buildroot/package/readline/readline51-001	2008-02-06 00:55:05 UTC (rev 20947)
+++ trunk/buildroot/package/readline/readline51-001	2008-02-06 01:26:03 UTC (rev 20948)
@@ -1,77 +0,0 @@
-			   READLINE PATCH REPORT
-			   =====================
-
-Readline-Release: 5.1
-Patch-ID: readline51-001
-
-Bug-Reported-by: Andreas Schwab <schwab@suse.de>
-Bug-Reference-ID: <20051213141916.4014A394BFABD@sykes.suse.de>
-Bug-Reference-URL: http://lists.gnu.org/archive/html/bug-bash/2005-12/msg00038.html
-
-Bug-Description:
-
-A problem with the readline callback interface can result in segmentation
-faults when using the delete-char function via a multiple-key sequence.
-Two consecutive calls to delete-char will crash the application calling
-readline.
-
-Patch:
-
-*** readline-5.1/readline.c	Mon Jul  4 22:29:35 2005
---- readline-5.1/readline.c	Tue Dec 20 17:38:29 2005
-***************
-*** 715,719 ****
-  	  rl_dispatching = 1;
-  	  RL_SETSTATE(RL_STATE_DISPATCHING);
-! 	  r = (*map[key].function)(rl_numeric_arg * rl_arg_sign, key);
-  	  RL_UNSETSTATE(RL_STATE_DISPATCHING);
-  	  rl_dispatching = 0;
---- 715,719 ----
-  	  rl_dispatching = 1;
-  	  RL_SETSTATE(RL_STATE_DISPATCHING);
-! 	  (*map[key].function)(rl_numeric_arg * rl_arg_sign, key);
-  	  RL_UNSETSTATE(RL_STATE_DISPATCHING);
-  	  rl_dispatching = 0;
-*** ../readline-5.1/text.c	Sat Sep 24 19:06:07 2005
---- text.c	Tue Dec 20 17:38:26 2005
-***************
-*** 1072,1077 ****
-       int count, key;
-  {
--   int r;
-- 
-    if (count < 0)
-      return (_rl_rubout_char (-count, key));
---- 1072,1075 ----
-***************
-*** 1091,1097 ****
-  	rl_forward_byte (count, key);
-  
-!       r = rl_kill_text (orig_point, rl_point);
-        rl_point = orig_point;
--       return r;
-      }
-    else
---- 1089,1094 ----
-  	rl_forward_byte (count, key);
-  
-!       rl_kill_text (orig_point, rl_point);
-        rl_point = orig_point;
-      }
-    else
-***************
-*** 1100,1105 ****
-  
-        new_point = MB_NEXTCHAR (rl_line_buffer, rl_point, 1, MB_FIND_NONZERO);
-!       return (rl_delete_text (rl_point, new_point));
-      }
-  }
-  
---- 1097,1103 ----
-  
-        new_point = MB_NEXTCHAR (rl_line_buffer, rl_point, 1, MB_FIND_NONZERO);
-!       rl_delete_text (rl_point, new_point);
-      }
-+   return 0;
-  }
-  

Modified: trunk/buildroot/package/readline/readline51-002
===================================================================
--- trunk/buildroot/package/readline/readline51-002	2008-02-06 00:55:05 UTC (rev 20947)
+++ trunk/buildroot/package/readline/readline51-002	2008-02-06 01:26:03 UTC (rev 20948)
@@ -1,43 +0,0 @@
-			   READLINE PATCH REPORT
-			   =====================
-
-Readline-Release: 5.1
-Patch-ID: readline51-002
-
-Bug-Reported-by: Mike Frysinger <vapier@gentoo.org>
-Bug-Reference-ID: <200601120613.11907.vapier@gentoo.org>
-Bug-Reference-URL: http://lists.gnu.org/archive/html/bug-bash/2006-01/msg00045.html
-
-Bug-Description:
-
-Under some circumstances, Readline can use an incorrect setting for the flag
-that indicates whether or not the terminal can auto-wrap, resulting in line-
-wrapping errors.
-
-Patch:
-
-*** readline-5.1/terminal.c	Sat Nov 12 20:46:54 2005
---- readline-5.1/terminal.c	Tue Jan 31 10:57:54 2006
-***************
-*** 123,127 ****
-  
-  /* Non-zero means the terminal can auto-wrap lines. */
-! int _rl_term_autowrap;
-  
-  /* Non-zero means that this terminal has a meta key. */
---- 126,130 ----
-  
-  /* Non-zero means the terminal can auto-wrap lines. */
-! int _rl_term_autowrap = -1;
-  
-  /* Non-zero means that this terminal has a meta key. */
-***************
-*** 275,278 ****
---- 278,284 ----
-       int rows, cols;
-  {
-+   if (_rl_term_autowrap == -1)
-+     _rl_init_terminal_io (rl_terminal_name);
-+ 
-    if (rows > 0)
-      _rl_screenheight = rows;

Modified: trunk/buildroot/package/readline/readline51-003
===================================================================
--- trunk/buildroot/package/readline/readline51-003	2008-02-06 00:55:05 UTC (rev 20947)
+++ trunk/buildroot/package/readline/readline51-003	2008-02-06 01:26:03 UTC (rev 20948)
@@ -1,29 +0,0 @@
-			   READLINE PATCH REPORT
-			   =====================
-
-Readline-Release: 5.1
-Patch-ID: readline51-003
-
-Bug-Reported-by: Bob Rossi <bob@brasko.net>
-Bug-Reference-ID: <43F60606.80708@case.edu>
-Bug-Reference-URL:
-
-Bug-Description:
-
-In some cases, readline will reference freed memory when attempting to
-display a portion of the prompt.
-
-Patch:
-
-*** readline-5.1/readline.c	Tue Dec 20 17:38:29 2005
---- readline-5.1/readline.c	Fri Feb 17 22:54:22 2006
-***************
-*** 282,287 ****
---- 282,288 ----
-  {
-    FREE (rl_prompt);
-    rl_prompt = prompt ? savestring (prompt) : (char *)NULL;
-+   rl_display_prompt = rl_prompt ? rl_prompt : "";
-  
-    rl_visible_prompt_length = rl_expand_prompt (rl_prompt);
-    return 0;

Modified: trunk/buildroot/package/readline/readline51-004
===================================================================
--- trunk/buildroot/package/readline/readline51-004	2008-02-06 00:55:05 UTC (rev 20947)
+++ trunk/buildroot/package/readline/readline51-004	2008-02-06 01:26:03 UTC (rev 20948)
@@ -1,90 +0,0 @@
-			   READLINE PATCH REPORT
-			   =====================
-
-Readline-Release: 5.1
-Patch-ID: readline51-004
-
-Bug-Reported-by: Mike Stroyan <mike.stroyan@hp.com>
-Bug-Reference-ID: <20060203191607.GC27614@localhost>
-Bug-Reference-URL: http://lists.gnu.org/archive/html/bug-bash/2006-02/msg00004.html
-
-Bug-Description:
-
-The displayed search prompt is corrupted when using non-incremental
-searches in vi and emacs mode if the prompt contains non-printing
-characters or spans multiple lines.  The prompt is expanded more than
-once; the second time without the escape sequences that protect non-
-printing characters from the length calculations.
-
-Patch:
-
-*** readline-5.1-patched/display.c	Wed Nov 30 14:05:02 2005
---- readline-5.1/display.c	Sat Feb 18 12:14:58 2006
-***************
-*** 1983,1993 ****
-       int pchar;
-  {
-    int len;
-!   char *pmt;
-  
-    rl_save_prompt ();
-  
-!   if (saved_local_prompt == 0)
-      {
-        len = (rl_prompt && *rl_prompt) ? strlen (rl_prompt) : 0;
-        pmt = (char *)xmalloc (len + 2);
---- 1998,2012 ----
-       int pchar;
-  {
-    int len;
-!   char *pmt, *p;
-  
-    rl_save_prompt ();
-  
-!   /* We've saved the prompt, and can do anything with the various prompt
-!      strings we need before they're restored.  We want the unexpanded
-!      portion of the prompt string after any final newline. */
-!   p = rl_prompt ? strrchr (rl_prompt, '\n') : 0;
-!   if (p == 0)
-      {
-        len = (rl_prompt && *rl_prompt) ? strlen (rl_prompt) : 0;
-        pmt = (char *)xmalloc (len + 2);
-***************
-*** 1998,2016 ****
-      }
-    else
-      {
-!       len = *saved_local_prompt ? strlen (saved_local_prompt) : 0;
-        pmt = (char *)xmalloc (len + 2);
-        if (len)
-! 	strcpy (pmt, saved_local_prompt);
-        pmt[len] = pchar;
-        pmt[len+1] = '\0';
-!       local_prompt = savestring (pmt);
-!       prompt_last_invisible = saved_last_invisible;
-!       prompt_visible_length = saved_visible_length + 1;
-!     }
-  
-    prompt_physical_chars = saved_physical_chars + 1;
-- 
-    return pmt;
-  }
-  
---- 2017,2033 ----
-      }
-    else
-      {
-!       p++;
-!       len = strlen (p);
-        pmt = (char *)xmalloc (len + 2);
-        if (len)
-! 	strcpy (pmt, p);
-        pmt[len] = pchar;
-        pmt[len+1] = '\0';
-!     }  
-  
-+   /* will be overwritten by expand_prompt, called from rl_message */
-    prompt_physical_chars = saved_physical_chars + 1;
-    return pmt;
-  }
-  
