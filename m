From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Fri,  7 Mar 2008 02:00:06 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package: ed editors
	editors/ed editors/nano edit etc...
Message-ID: <20080307100006.6F47C120159@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-03-07 02:00:04 -0800 (Fri, 07 Mar 2008)
New Revision: 21264

Log:
buildroot: move editors under package/editors and merge menus

Based on patch by Arnar Mar Sig.


Added:
   trunk/buildroot/package/editors/ed/
   trunk/buildroot/package/editors/ed/Config.in
   trunk/buildroot/package/editors/ed/ed.mk
   trunk/buildroot/package/editors/nano/
   trunk/buildroot/package/editors/nano/Config.in
   trunk/buildroot/package/editors/nano/nano.mk
   trunk/buildroot/package/editors/uemacs/
   trunk/buildroot/package/editors/uemacs/Config.in
   trunk/buildroot/package/editors/uemacs/uemacs-4.0.15-lt.01.patch
   trunk/buildroot/package/editors/uemacs/uemacs-4.0.15-lt.02.patch
   trunk/buildroot/package/editors/uemacs/uemacs.mk

Removed:
   trunk/buildroot/package/ed/Config.in
   trunk/buildroot/package/ed/ed.mk
   trunk/buildroot/package/nano/Config.in
   trunk/buildroot/package/nano/nano.mk
   trunk/buildroot/package/uemacs/Config.in
   trunk/buildroot/package/uemacs/uemacs-4.0.15-lt.01.patch
   trunk/buildroot/package/uemacs/uemacs-4.0.15-lt.02.patch
   trunk/buildroot/package/uemacs/uemacs.mk

Modified:
   trunk/buildroot/package/Config.in
   trunk/buildroot/package/editors/Config.in


Changeset:
Modified: trunk/buildroot/package/Config.in
===================================================================
--- trunk/buildroot/package/Config.in	2008-03-07 07:24:35 UTC (rev 21263)
+++ trunk/buildroot/package/Config.in	2008-03-07 10:00:04 UTC (rev 21264)
@@ -11,7 +11,6 @@
 endif
 source "package/diffutils/Config.in"
 if !BR2_PACKAGE_BUSYBOX_HIDE_OTHERS
-source "package/ed/Config.in"
 source "package/findutils/Config.in"
 endif
 source "package/flex/Config.in"
@@ -119,19 +118,11 @@
 if !BR2_PACKAGE_BUSYBOX_HIDE_OTHERS
 # busybox has an editor
 
-menuconfig BR2_TEXTEDIT_SUPPORT
-	bool "Text editors"
-	default y
-	help
-	  Support for text editors
+# text editors
+source "package/editors/Config.in"
 
-if BR2_TEXTEDIT_SUPPORT
-source "package/nano/Config.in"
-source "package/uemacs/Config.in"
 endif
 
-endif
-
 menuconfig BR2_NETWORK_SUPPORT
 	bool "Networking"
 	default y
@@ -490,6 +481,4 @@
 source "package/vice/Config.in"
 endif
 
-source "package/editors/Config.in"
-
 endmenu

Deleted: trunk/buildroot/package/ed/Config.in
===================================================================
--- trunk/buildroot/package/ed/Config.in	2008-03-07 07:24:35 UTC (rev 21263)
+++ trunk/buildroot/package/ed/Config.in	2008-03-07 10:00:04 UTC (rev 21264)
@@ -1,9 +0,0 @@
-config BR2_PACKAGE_ED
-	bool "ed"
-	default n
-	help
-	  A line-oriented text editor.  Used to create, display, modify, 
-	  and otherwise manipulate text files.  Often used in scripts 
-	  rather than invoked directly.
-
-	  http://www.gnu.org/software/ed/

Deleted: trunk/buildroot/package/ed/ed.mk
===================================================================
--- trunk/buildroot/package/ed/ed.mk	2008-03-07 07:24:35 UTC (rev 21263)
+++ trunk/buildroot/package/ed/ed.mk	2008-03-07 10:00:04 UTC (rev 21264)
@@ -1,59 +0,0 @@
-#############################################################
-#
-# ed
-#
-#############################################################
-ED_VERSION:=0.8
-ED_SOURCE:=ed-$(ED_VERSION).tar.bz2
-ED_SITE:=$(BR2_GNU_MIRROR)/ed/
-ED_CAT:=$(BZCAT)
-ED_DIR:=$(BUILD_DIR)/ed-$(ED_VERSION)
-ED_BINARY:=ed
-ED_TARGET_BINARY:=bin/ed
-
-$(DL_DIR)/$(ED_SOURCE):
-	 $(WGET) -P $(DL_DIR) $(ED_SITE)/$(ED_SOURCE)
-
-$(ED_DIR)/.unpacked: $(DL_DIR)/$(ED_SOURCE)
-	$(ED_CAT) $(DL_DIR)/$(ED_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	toolchain/patch-kernel.sh $(ED_DIR) package/ed/ ed-\*.patch
-	touch $@
-
-$(ED_DIR)/.configured: $(ED_DIR)/.unpacked
-	(cd $(ED_DIR); rm -rf config.cache; \
-		$(TARGET_CONFIGURE_OPTS) \
-		$(TARGET_CONFIGURE_ARGS) \
-		./configure \
-		--target=$(GNU_TARGET_NAME) \
-		--host=$(GNU_TARGET_NAME) \
-		--build=$(GNU_HOST_NAME) \
-		--prefix=/usr \
-		--exec-prefix=/usr \
-	)
-	touch $@
-
-$(ED_DIR)/$(ED_BINARY): $(ED_DIR)/.configured
-	$(MAKE) CC=$(TARGET_CC) -C $(ED_DIR)
-
-$(TARGET_DIR)/$(ED_TARGET_BINARY): $(ED_DIR)/$(ED_BINARY)
-	$(INSTALL) -D $(ED_DIR)/$(ED_BINARY) $(TARGET_DIR)/$(ED_TARGET_BINARY)
-
-ed: uclibc $(TARGET_DIR)/$(ED_TARGET_BINARY)
-
-ed-source: $(DL_DIR)/$(ED_SOURCE)
-
-ed-clean:
-	$(MAKE) DESTDIR=$(TARGET_DIR) CC=$(TARGET_CC) -C $(ED_DIR) uninstall
-	-$(MAKE) -C $(ED_DIR) clean
-
-ed-dirclean:
-	rm -rf $(ED_DIR)
-
-#############################################################
-#
-# Toplevel Makefile options
-#
-#############################################################
-ifeq ($(strip $(BR2_PACKAGE_ED)),y)
-TARGETS+=ed
-endif

Modified: trunk/buildroot/package/editors/Config.in
===================================================================
--- trunk/buildroot/package/editors/Config.in	2008-03-07 07:24:35 UTC (rev 21263)
+++ trunk/buildroot/package/editors/Config.in	2008-03-07 10:00:04 UTC (rev 21264)
@@ -1,5 +1,12 @@
-menu "Editors"
+menuconfig BR2_TEXTEDIT_SUPPORT
+	bool "Text editors"
+	default y
+	help
+	  Support for text editors
 
+if BR2_TEXTEDIT_SUPPORT
+source "package/editors/ed/Config.in"
+source "package/editors/nano/Config.in"
+source "package/editors/uemacs/Config.in"
 source "package/editors/vim/Config.in"
-
-endmenu
+endif

Copied: trunk/buildroot/package/editors/ed/Config.in (from rev 21263, trunk/buildroot/package/ed/Config.in)
===================================================================
--- trunk/buildroot/package/editors/ed/Config.in	                        (rev 0)
+++ trunk/buildroot/package/editors/ed/Config.in	2008-03-07 10:00:04 UTC (rev 21264)
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_ED
+	bool "ed"
+	default n
+	help
+	  A line-oriented text editor.  Used to create, display, modify, 
+	  and otherwise manipulate text files.  Often used in scripts 
+	  rather than invoked directly.
+
+	  http://www.gnu.org/software/ed/

Copied: trunk/buildroot/package/editors/ed/ed.mk (from rev 21263, trunk/buildroot/package/ed/ed.mk)
===================================================================
--- trunk/buildroot/package/editors/ed/ed.mk	                        (rev 0)
+++ trunk/buildroot/package/editors/ed/ed.mk	2008-03-07 10:00:04 UTC (rev 21264)
@@ -0,0 +1,59 @@
+#############################################################
+#
+# ed
+#
+#############################################################
+ED_VERSION:=0.8
+ED_SOURCE:=ed-$(ED_VERSION).tar.bz2
+ED_SITE:=$(BR2_GNU_MIRROR)/ed/
+ED_CAT:=$(BZCAT)
+ED_DIR:=$(BUILD_DIR)/ed-$(ED_VERSION)
+ED_BINARY:=ed
+ED_TARGET_BINARY:=bin/ed
+
+$(DL_DIR)/$(ED_SOURCE):
+	 $(WGET) -P $(DL_DIR) $(ED_SITE)/$(ED_SOURCE)
+
+$(ED_DIR)/.unpacked: $(DL_DIR)/$(ED_SOURCE)
+	$(ED_CAT) $(DL_DIR)/$(ED_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
+	toolchain/patch-kernel.sh $(ED_DIR) package/ed/ ed-\*.patch
+	touch $@
+
+$(ED_DIR)/.configured: $(ED_DIR)/.unpacked
+	(cd $(ED_DIR); rm -rf config.cache; \
+		$(TARGET_CONFIGURE_OPTS) \
+		$(TARGET_CONFIGURE_ARGS) \
+		./configure \
+		--target=$(GNU_TARGET_NAME) \
+		--host=$(GNU_TARGET_NAME) \
+		--build=$(GNU_HOST_NAME) \
+		--prefix=/usr \
+		--exec-prefix=/usr \
+	)
+	touch $@
+
+$(ED_DIR)/$(ED_BINARY): $(ED_DIR)/.configured
+	$(MAKE) CC=$(TARGET_CC) -C $(ED_DIR)
+
+$(TARGET_DIR)/$(ED_TARGET_BINARY): $(ED_DIR)/$(ED_BINARY)
+	$(INSTALL) -D $(ED_DIR)/$(ED_BINARY) $(TARGET_DIR)/$(ED_TARGET_BINARY)
+
+ed: uclibc $(TARGET_DIR)/$(ED_TARGET_BINARY)
+
+ed-source: $(DL_DIR)/$(ED_SOURCE)
+
+ed-clean:
+	$(MAKE) DESTDIR=$(TARGET_DIR) CC=$(TARGET_CC) -C $(ED_DIR) uninstall
+	-$(MAKE) -C $(ED_DIR) clean
+
+ed-dirclean:
+	rm -rf $(ED_DIR)
+
+#############################################################
+#
+# Toplevel Makefile options
+#
+#############################################################
+ifeq ($(strip $(BR2_PACKAGE_ED)),y)
+TARGETS+=ed
+endif

Copied: trunk/buildroot/package/editors/nano/Config.in (from rev 21263, trunk/buildroot/package/nano/Config.in)
===================================================================
--- trunk/buildroot/package/editors/nano/Config.in	                        (rev 0)
+++ trunk/buildroot/package/editors/nano/Config.in	2008-03-07 10:00:04 UTC (rev 21264)
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_NANO
+	bool "nano"
+	default n
+	select BR2_PACKAGE_NCURSES
+	help
+	  A nice ncurses-based editor.  Started out as a clone of pico.  
+	  Great editor for new users.
+
+	  http://www.nano-editor.org/

Copied: trunk/buildroot/package/editors/nano/nano.mk (from rev 21263, trunk/buildroot/package/nano/nano.mk)
===================================================================
--- trunk/buildroot/package/editors/nano/nano.mk	                        (rev 0)
+++ trunk/buildroot/package/editors/nano/nano.mk	2008-03-07 10:00:04 UTC (rev 21264)
@@ -0,0 +1,59 @@
+#############################################################
+#
+# nano
+#
+#############################################################
+NANO_VERSION:=1.3.12
+NANO_SOURCE:=nano-$(NANO_VERSION).tar.gz
+NANO_SITE:=http://www.nano-editor.org/dist/v1.3/
+NANO_DIR:=$(BUILD_DIR)/nano-$(NANO_VERSION)
+NANO_CAT:=$(ZCAT)
+NANO_BINARY:=src/nano
+NANO_TARGET_BINARY:=bin/nano
+
+$(DL_DIR)/$(NANO_SOURCE):
+	$(WGET) -P $(DL_DIR) $(NANO_SITE)/$(NANO_SOURCE)
+
+nano-source: $(DL_DIR)/$(NANO_SOURCE)
+
+$(NANO_DIR)/.unpacked: $(DL_DIR)/$(NANO_SOURCE)
+	$(NANO_CAT) $(DL_DIR)/$(NANO_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
+	$(CONFIG_UPDATE) $(NANO_DIR)
+	touch $@
+
+$(NANO_DIR)/.configured: $(NANO_DIR)/.unpacked
+	(cd $(NANO_DIR); rm -rf config.cache; \
+		$(TARGET_CONFIGURE_OPTS) \
+		$(TARGET_CONFIGURE_ARGS) \
+		ac_cv_header_regex_h=no \
+		./configure \
+		--target=$(GNU_TARGET_NAME) \
+		--host=$(GNU_TARGET_NAME) \
+		--build=$(GNU_HOST_NAME) \
+		--prefix=/ \
+		--enable-tiny \
+	)
+	touch $@
+
+$(NANO_DIR)/$(NANO_BINARY): $(NANO_DIR)/.configured
+	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(NANO_DIR)
+
+$(TARGET_DIR)/$(NANO_TARGET_BINARY): $(NANO_DIR)/$(NANO_BINARY)
+	install -D $(NANO_DIR)/$(NANO_BINARY) $(TARGET_DIR)/$(NANO_TARGET_BINARY)
+
+nano: uclibc ncurses $(TARGET_DIR)/$(NANO_TARGET_BINARY)
+
+nano-clean:
+	rm -f $(TARGET_DIR)/$(NANO_TARGET_BINARY)
+	-$(MAKE) -C $(NANO_DIR) clean
+
+nano-dirclean:
+	rm -rf $(NANO_DIR)
+#############################################################
+#
+# Toplevel Makefile options
+#
+#############################################################
+ifeq ($(strip $(BR2_PACKAGE_NANO)),y)
+TARGETS+=nano
+endif

Copied: trunk/buildroot/package/editors/uemacs/Config.in (from rev 21263, trunk/buildroot/package/uemacs/Config.in)
===================================================================
--- trunk/buildroot/package/editors/uemacs/Config.in	                        (rev 0)
+++ trunk/buildroot/package/editors/uemacs/Config.in	2008-03-07 10:00:04 UTC (rev 21264)
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_UEMACS
+	bool "uemacs"
+	default n
+	select BR2_PACKAGE_NCURSES
+	help
+	  A small emacs.
+
+	  ftp://ftp.kernel.org/pub/software/editors/uemacs/

Copied: trunk/buildroot/package/editors/uemacs/uemacs-4.0.15-lt.01.patch (from rev 21263, trunk/buildroot/package/uemacs/uemacs-4.0.15-lt.01.patch)
===================================================================
--- trunk/buildroot/package/editors/uemacs/uemacs-4.0.15-lt.01.patch	                        (rev 0)
+++ trunk/buildroot/package/editors/uemacs/uemacs-4.0.15-lt.01.patch	2008-03-07 10:00:04 UTC (rev 21264)
@@ -0,0 +1,33 @@
+diff -rup em-4.0.15-lt.oorig/display.c em-4.0.15-lt/display.c
+--- em-4.0.15-lt.oorig/display.c	1994-05-21 12:40:56.000000000 +0200
++++ em-4.0.15-lt/display.c	2005-11-16 16:54:22.000000000 +0100
+@@ -9,6 +9,7 @@
+  */
+ 
+ #include        <stdio.h>
++#include        <errno.h>
+ #include	"estruct.h"
+ #include        "edef.h"
+ 
+diff -rup em-4.0.15-lt.oorig/main.c em-4.0.15-lt/main.c
+--- em-4.0.15-lt.oorig/main.c	1994-05-21 12:41:03.000000000 +0200
++++ em-4.0.15-lt/main.c	2005-11-16 16:54:01.000000000 +0100
+@@ -123,7 +123,7 @@ char *argv[];	/* argument strings */
+ #endif
+ 
+ #if UNIX
+-	static void emergencyexit();
++	void emergencyexit();
+ #ifdef SIGWINCH
+ 	extern void sizesignal();
+ #endif
+@@ -599,7 +599,7 @@ quickexit(f, n)
+ 	return(TRUE);
+ }
+ 
+-static void emergencyexit(signr)
++void emergencyexit(signr)
+ int signr;
+ {
+ 	quickexit(FALSE, 0);
+

Copied: trunk/buildroot/package/editors/uemacs/uemacs-4.0.15-lt.02.patch (from rev 21263, trunk/buildroot/package/uemacs/uemacs-4.0.15-lt.02.patch)
===================================================================
--- trunk/buildroot/package/editors/uemacs/uemacs-4.0.15-lt.02.patch	                        (rev 0)
+++ trunk/buildroot/package/editors/uemacs/uemacs-4.0.15-lt.02.patch	2008-03-07 10:00:04 UTC (rev 21264)
@@ -0,0 +1,16 @@
+--- em-4.0.15-lt.oorig/lock.c	1999-05-16 09:04:17.000000000 +0200
++++ em-4.0.15-lt/lock.c	2006-03-10 15:22:16.000000000 +0100
+@@ -152,10 +152,8 @@
+ 
+ 	strcpy(obuf, errstr);
+ 	strcat(obuf, " - ");
+-	if (errno < sys_nerr)
+-		strcat(obuf, sys_errlist[errno]);
+-	else
+-		strcat(obuf, "(can not get system error message)");
++	strcat(obuf, strerror(errno));
++
+ 	mlwrite(obuf);
+ }
+ #endif
+

Copied: trunk/buildroot/package/editors/uemacs/uemacs.mk (from rev 21263, trunk/buildroot/package/uemacs/uemacs.mk)
===================================================================
--- trunk/buildroot/package/editors/uemacs/uemacs.mk	                        (rev 0)
+++ trunk/buildroot/package/editors/uemacs/uemacs.mk	2008-03-07 10:00:04 UTC (rev 21264)
@@ -0,0 +1,48 @@
+#############################################################
+#
+# uemacs
+#
+#############################################################
+UEMACS_VERSION:=4.0.15-lt
+UEMACS_SOURCE:=em-$(UEMACS_VERSION).tar.bz2
+UEMACS_CAT:=$(BZCAT)
+UEMACS_SITE:=ftp://ftp.kernel.org/pub/software/editors/uemacs/
+UEMACS_DIR:=$(BUILD_DIR)/em-$(UEMACS_VERSION)
+UEMACS_BINARY:=em
+UEMACS_TARGET_BINARY:=usr/bin/emacs
+
+$(DL_DIR)/$(UEMACS_SOURCE):
+	 $(WGET) -P $(DL_DIR) $(UEMACS_SITE)/$(UEMACS_SOURCE)
+
+uemacs-source: $(DL_DIR)/$(UEMACS_SOURCE)
+
+$(UEMACS_DIR)/.unpacked: $(DL_DIR)/$(UEMACS_SOURCE)
+	$(UEMACS_CAT) $(DL_DIR)/$(UEMACS_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
+	toolchain/patch-kernel.sh $(UEMACS_DIR) package/uemacs/ uemacs\*.patch
+	touch $(UEMACS_DIR)/.unpacked
+
+$(UEMACS_DIR)/$(UEMACS_BINARY): $(UEMACS_DIR)/.unpacked
+	$(MAKE) -C $(UEMACS_DIR) \
+	CC="$(TARGET_CC)" DEFINES="-DAUTOCONF -DPOSIX -DUSG" CFLAGS+="$(TARGET_CFLAGS) " LIBS=-lncurses
+	$(STRIPCMD) $(UEMACS_DIR)/$(UEMACS_BINARY)
+
+$(TARGET_DIR)/$(UEMACS_TARGET_BINARY): $(UEMACS_DIR)/$(UEMACS_BINARY)
+	$(INSTALL) -m 0755 -D $(UEMACS_DIR)/$(UEMACS_BINARY) $(TARGET_DIR)/$(UEMACS_TARGET_BINARY)
+
+uemacs: uclibc ncurses $(TARGET_DIR)/$(UEMACS_TARGET_BINARY)
+
+uemacs-clean:
+	rm -f $(TARGET_DIR)/$(UEMACS_TARGET_BINARY)
+	-$(MAKE) -C $(UEMACS_DIR) clean
+
+uemacs-dirclean:
+	rm -rf $(UEMACS_DIR)
+
+#############################################################
+#
+# Toplevel Makefile options
+#
+#############################################################
+ifeq ($(strip $(BR2_PACKAGE_UEMACS)),y)
+TARGETS+=uemacs
+endif

Deleted: trunk/buildroot/package/nano/Config.in
===================================================================
--- trunk/buildroot/package/nano/Config.in	2008-03-07 07:24:35 UTC (rev 21263)
+++ trunk/buildroot/package/nano/Config.in	2008-03-07 10:00:04 UTC (rev 21264)
@@ -1,9 +0,0 @@
-config BR2_PACKAGE_NANO
-	bool "nano"
-	default n
-	select BR2_PACKAGE_NCURSES
-	help
-	  A nice ncurses-based editor.  Started out as a clone of pico.  
-	  Great editor for new users.
-
-	  http://www.nano-editor.org/

Deleted: trunk/buildroot/package/nano/nano.mk
===================================================================
--- trunk/buildroot/package/nano/nano.mk	2008-03-07 07:24:35 UTC (rev 21263)
+++ trunk/buildroot/package/nano/nano.mk	2008-03-07 10:00:04 UTC (rev 21264)
@@ -1,59 +0,0 @@
-#############################################################
-#
-# nano
-#
-#############################################################
-NANO_VERSION:=1.3.12
-NANO_SOURCE:=nano-$(NANO_VERSION).tar.gz
-NANO_SITE:=http://www.nano-editor.org/dist/v1.3/
-NANO_DIR:=$(BUILD_DIR)/nano-$(NANO_VERSION)
-NANO_CAT:=$(ZCAT)
-NANO_BINARY:=src/nano
-NANO_TARGET_BINARY:=bin/nano
-
-$(DL_DIR)/$(NANO_SOURCE):
-	$(WGET) -P $(DL_DIR) $(NANO_SITE)/$(NANO_SOURCE)
-
-nano-source: $(DL_DIR)/$(NANO_SOURCE)
-
-$(NANO_DIR)/.unpacked: $(DL_DIR)/$(NANO_SOURCE)
-	$(NANO_CAT) $(DL_DIR)/$(NANO_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	$(CONFIG_UPDATE) $(NANO_DIR)
-	touch $@
-
-$(NANO_DIR)/.configured: $(NANO_DIR)/.unpacked
-	(cd $(NANO_DIR); rm -rf config.cache; \
-		$(TARGET_CONFIGURE_OPTS) \
-		$(TARGET_CONFIGURE_ARGS) \
-		ac_cv_header_regex_h=no \
-		./configure \
-		--target=$(GNU_TARGET_NAME) \
-		--host=$(GNU_TARGET_NAME) \
-		--build=$(GNU_HOST_NAME) \
-		--prefix=/ \
-		--enable-tiny \
-	)
-	touch $@
-
-$(NANO_DIR)/$(NANO_BINARY): $(NANO_DIR)/.configured
-	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(NANO_DIR)
-
-$(TARGET_DIR)/$(NANO_TARGET_BINARY): $(NANO_DIR)/$(NANO_BINARY)
-	install -D $(NANO_DIR)/$(NANO_BINARY) $(TARGET_DIR)/$(NANO_TARGET_BINARY)
-
-nano: uclibc ncurses $(TARGET_DIR)/$(NANO_TARGET_BINARY)
-
-nano-clean:
-	rm -f $(TARGET_DIR)/$(NANO_TARGET_BINARY)
-	-$(MAKE) -C $(NANO_DIR) clean
-
-nano-dirclean:
-	rm -rf $(NANO_DIR)
-#############################################################
-#
-# Toplevel Makefile options
-#
-#############################################################
-ifeq ($(strip $(BR2_PACKAGE_NANO)),y)
-TARGETS+=nano
-endif

Deleted: trunk/buildroot/package/uemacs/Config.in
===================================================================
--- trunk/buildroot/package/uemacs/Config.in	2008-03-07 07:24:35 UTC (rev 21263)
+++ trunk/buildroot/package/uemacs/Config.in	2008-03-07 10:00:04 UTC (rev 21264)
@@ -1,8 +0,0 @@
-config BR2_PACKAGE_UEMACS
-	bool "uemacs"
-	default n
-	select BR2_PACKAGE_NCURSES
-	help
-	  A small emacs.
-
-	  ftp://ftp.kernel.org/pub/software/editors/uemacs/

Deleted: trunk/buildroot/package/uemacs/uemacs-4.0.15-lt.01.patch
===================================================================
--- trunk/buildroot/package/uemacs/uemacs-4.0.15-lt.01.patch	2008-03-07 07:24:35 UTC (rev 21263)
+++ trunk/buildroot/package/uemacs/uemacs-4.0.15-lt.01.patch	2008-03-07 10:00:04 UTC (rev 21264)
@@ -1,33 +0,0 @@
-diff -rup em-4.0.15-lt.oorig/display.c em-4.0.15-lt/display.c
---- em-4.0.15-lt.oorig/display.c	1994-05-21 12:40:56.000000000 +0200
-+++ em-4.0.15-lt/display.c	2005-11-16 16:54:22.000000000 +0100
-@@ -9,6 +9,7 @@
-  */
- 
- #include        <stdio.h>
-+#include        <errno.h>
- #include	"estruct.h"
- #include        "edef.h"
- 
-diff -rup em-4.0.15-lt.oorig/main.c em-4.0.15-lt/main.c
---- em-4.0.15-lt.oorig/main.c	1994-05-21 12:41:03.000000000 +0200
-+++ em-4.0.15-lt/main.c	2005-11-16 16:54:01.000000000 +0100
-@@ -123,7 +123,7 @@ char *argv[];	/* argument strings */
- #endif
- 
- #if UNIX
--	static void emergencyexit();
-+	void emergencyexit();
- #ifdef SIGWINCH
- 	extern void sizesignal();
- #endif
-@@ -599,7 +599,7 @@ quickexit(f, n)
- 	return(TRUE);
- }
- 
--static void emergencyexit(signr)
-+void emergencyexit(signr)
- int signr;
- {
- 	quickexit(FALSE, 0);
-

Deleted: trunk/buildroot/package/uemacs/uemacs-4.0.15-lt.02.patch
===================================================================
--- trunk/buildroot/package/uemacs/uemacs-4.0.15-lt.02.patch	2008-03-07 07:24:35 UTC (rev 21263)
+++ trunk/buildroot/package/uemacs/uemacs-4.0.15-lt.02.patch	2008-03-07 10:00:04 UTC (rev 21264)
@@ -1,16 +0,0 @@
---- em-4.0.15-lt.oorig/lock.c	1999-05-16 09:04:17.000000000 +0200
-+++ em-4.0.15-lt/lock.c	2006-03-10 15:22:16.000000000 +0100
-@@ -152,10 +152,8 @@
- 
- 	strcpy(obuf, errstr);
- 	strcat(obuf, " - ");
--	if (errno < sys_nerr)
--		strcat(obuf, sys_errlist[errno]);
--	else
--		strcat(obuf, "(can not get system error message)");
-+	strcat(obuf, strerror(errno));
-+
- 	mlwrite(obuf);
- }
- #endif
-

Deleted: trunk/buildroot/package/uemacs/uemacs.mk
===================================================================
--- trunk/buildroot/package/uemacs/uemacs.mk	2008-03-07 07:24:35 UTC (rev 21263)
+++ trunk/buildroot/package/uemacs/uemacs.mk	2008-03-07 10:00:04 UTC (rev 21264)
@@ -1,48 +0,0 @@
-#############################################################
-#
-# uemacs
-#
-#############################################################
-UEMACS_VERSION:=4.0.15-lt
-UEMACS_SOURCE:=em-$(UEMACS_VERSION).tar.bz2
-UEMACS_CAT:=$(BZCAT)
-UEMACS_SITE:=ftp://ftp.kernel.org/pub/software/editors/uemacs/
-UEMACS_DIR:=$(BUILD_DIR)/em-$(UEMACS_VERSION)
-UEMACS_BINARY:=em
-UEMACS_TARGET_BINARY:=usr/bin/emacs
-
-$(DL_DIR)/$(UEMACS_SOURCE):
-	 $(WGET) -P $(DL_DIR) $(UEMACS_SITE)/$(UEMACS_SOURCE)
-
-uemacs-source: $(DL_DIR)/$(UEMACS_SOURCE)
-
-$(UEMACS_DIR)/.unpacked: $(DL_DIR)/$(UEMACS_SOURCE)
-	$(UEMACS_CAT) $(DL_DIR)/$(UEMACS_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	toolchain/patch-kernel.sh $(UEMACS_DIR) package/uemacs/ uemacs\*.patch
-	touch $(UEMACS_DIR)/.unpacked
-
-$(UEMACS_DIR)/$(UEMACS_BINARY): $(UEMACS_DIR)/.unpacked
-	$(MAKE) -C $(UEMACS_DIR) \
-	CC="$(TARGET_CC)" DEFINES="-DAUTOCONF -DPOSIX -DUSG" CFLAGS+="$(TARGET_CFLAGS) " LIBS=-lncurses
-	$(STRIPCMD) $(UEMACS_DIR)/$(UEMACS_BINARY)
-
-$(TARGET_DIR)/$(UEMACS_TARGET_BINARY): $(UEMACS_DIR)/$(UEMACS_BINARY)
-	$(INSTALL) -m 0755 -D $(UEMACS_DIR)/$(UEMACS_BINARY) $(TARGET_DIR)/$(UEMACS_TARGET_BINARY)
-
-uemacs: uclibc ncurses $(TARGET_DIR)/$(UEMACS_TARGET_BINARY)
-
-uemacs-clean:
-	rm -f $(TARGET_DIR)/$(UEMACS_TARGET_BINARY)
-	-$(MAKE) -C $(UEMACS_DIR) clean
-
-uemacs-dirclean:
-	rm -rf $(UEMACS_DIR)
-
-#############################################################
-#
-# Toplevel Makefile options
-#
-#############################################################
-ifeq ($(strip $(BR2_PACKAGE_UEMACS)),y)
-TARGETS+=uemacs
-endif
