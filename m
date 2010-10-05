From: Martin Banky <martin.banky@gmail.com>
Date: Tue,  5 Oct 2010 01:22:38 -0700
Subject: [Buildroot] [PATCH 05/10] microcom: convert to gentargets
In-Reply-To: <1286266963-23413-1-git-send-email-Martin.Banky@gmail.com>
References: <1286266963-23413-1-git-send-email-Martin.Banky@gmail.com>
Message-ID: <1286266963-23413-5-git-send-email-Martin.Banky@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The microcom archive is a flat archive, so the Makefile.package.in extract
function fails to extract any files. The $(TAR_STRIP_COMPONENTS)=1 seems to
strip the file names off.

Signed-off-by: Martin Banky <Martin.Banky@gmail.com>
---
 .../microcom/-microcom-102-001-speed-defines.patch |   34 ++++++++
 .../-microcom-102-002-rename-variable-log.patch    |   78 +++++++++++++++++++
 .../microcom/microcom-102-001-speed-defines.patch  |   34 --------
 .../microcom-102-002-rename-variable-log.patch     |   78 -------------------
 package/microcom/microcom.mk                       |   80 +++++--------------
 5 files changed, 133 insertions(+), 171 deletions(-)
 create mode 100644 package/microcom/-microcom-102-001-speed-defines.patch
 create mode 100644 package/microcom/-microcom-102-002-rename-variable-log.patch
 delete mode 100644 package/microcom/microcom-102-001-speed-defines.patch
 delete mode 100644 package/microcom/microcom-102-002-rename-variable-log.patch

diff --git a/package/microcom/-microcom-102-001-speed-defines.patch b/package/microcom/-microcom-102-001-speed-defines.patch
new file mode 100644
index 0000000..b9aece8
--- /dev/null
+++ b/package/microcom/-microcom-102-001-speed-defines.patch
@@ -0,0 +1,34 @@
+diff -rdup microcom-1.02.orig/help.c microcom-1.02/help.c
+--- microcom-1.02.orig/help.c	2000-07-30 06:15:47.000000000 +0200
++++ microcom-1.02/help.c	2007-01-19 19:44:19.000000000 +0100
+@@ -273,12 +273,29 @@ static void help_set_speed(int fd, char 
+     B19200,
+     B38400,
+     B57600,
++#if defined B115200
+     B115200,
++#endif
++#if defined B230400
+     B230400,
++#endif
++#if defined B460800
+     B460800
++#endif
+   };
++#undef __STOPCHAR
++#if defined B115200
++#define __STOPCHAR 'h'
++#endif
++#if defined B230400
++#define __STOPCHAR 'i'
++#endif
++#if defined B460800
++#define __STOPCHAR 'j'
++#endif
+ 
+-  if (c < 'a' && c > 'j') {
++
++  if (c < 'a' && c > __STOPCHAR) {
+     if (c == '~') {
+       help_speed();
+       return;
diff --git a/package/microcom/-microcom-102-002-rename-variable-log.patch b/package/microcom/-microcom-102-002-rename-variable-log.patch
new file mode 100644
index 0000000..8516b56
--- /dev/null
+++ b/package/microcom/-microcom-102-002-rename-variable-log.patch
@@ -0,0 +1,78 @@
+diff -rdup microcom-1.02.speed/help.c microcom-1.02/help.c
+--- microcom-1.02.speed/help.c	2007-01-19 19:44:19.000000000 +0100
++++ microcom-1.02/help.c	2007-01-19 19:48:20.000000000 +0100
+@@ -23,7 +23,7 @@ extern int crnl_mapping; //0 - no mappin
+ extern int script; /* script active flag */
+ extern char scr_name[MAX_SCRIPT_NAME]; /* default name of the script */
+ extern char device[MAX_DEVICE_NAME]; /* serial device name */
+-extern int log; /* log active flag */
++extern int log_active; /* log active flag */
+ extern FILE* flog;   /* log file */
+ 
+ static int help_state = 0;
+@@ -85,7 +85,7 @@ static void help_escape(void) {
+ 
+   write(STDOUT_FILENO, str1, strlen(str1));
+ 
+-  if (log == 0)
++  if (log_active == 0)
+     write(STDOUT_FILENO, "  l - log on             \n", 26);
+   else
+     write(STDOUT_FILENO, "  l - log off            \n", 26);
+@@ -156,11 +156,11 @@ static void help_send_escape(int fd, cha
+   case 'q': /* quit help */
+     break;
+   case 'l': /* log on/off */
+-    log = (log == 0)? 1: 0;
+-    if (log) { /* open log file */
++    log_active = (log_active == 0)? 1: 0;
++    if (log_active) { /* open log file */
+       if ((flog = fopen("microcom.log", "a")) == (FILE *)0) {
+ 	write(STDOUT_FILENO, "Cannot open microcom.log \n", 26);
+-	log = 0;
++	log_active = 0;
+       }
+     }
+     else { /* cloase log file */
+diff -rdup microcom-1.02.speed/microcom.c microcom-1.02/microcom.c
+--- microcom-1.02.speed/microcom.c	2000-08-27 17:22:47.000000000 +0200
++++ microcom-1.02/microcom.c	2007-01-19 19:48:37.000000000 +0100
+@@ -25,7 +25,7 @@ int crnl_mapping; //0 - no mapping, 1 ma
+ int script = 0; /* script active flag */
+ char scr_name[MAX_SCRIPT_NAME] = "script.scr"; /* default name of the script */
+ char device[MAX_DEVICE_NAME]; /* serial device name */
+-int log = 0; /* log active flag */
++int log_active = 0; /* log active flag */
+ FILE* flog;   /* log file */
+ int  pf = 0;  /* port file descriptor */
+ struct termios pots; /* old port termios settings to restore */
+@@ -106,7 +106,7 @@ void main_usage(int exitcode, char *str,
+ /* restore original terminal settings on exit */
+ void cleanup_termios(int signal) {
+   /* cloase the log file first */
+-  if (log) {
++  if (log_active) {
+     fflush(flog);
+     fclose(flog);
+   }
+diff -rdup microcom-1.02.speed/mux.c microcom-1.02/mux.c
+--- microcom-1.02.speed/mux.c	2000-07-30 06:15:47.000000000 +0200
++++ microcom-1.02/mux.c	2007-01-19 19:48:48.000000000 +0100
+@@ -24,7 +24,7 @@
+ 
+ extern int script;
+ extern char scr_name[];
+-extern int log;
++extern int log_active;
+ extern FILE* flog;
+ 
+ void mux_clear_sflag(void) {
+@@ -71,7 +71,7 @@ void mux_loop(int pf) {
+       i = read(pf, buf, BUFSIZE);
+       if (i > 0) {
+ 	write(STDOUT_FILENO, buf, i);
+-	if (log)
++	if (log_active)
+ 	  fwrite(buf, 1, i, flog);
+ 	if (script) {
+ 	  i = script_process(S_DCE, buf, i);
diff --git a/package/microcom/microcom-102-001-speed-defines.patch b/package/microcom/microcom-102-001-speed-defines.patch
deleted file mode 100644
index b9aece8..0000000
--- a/package/microcom/microcom-102-001-speed-defines.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-diff -rdup microcom-1.02.orig/help.c microcom-1.02/help.c
---- microcom-1.02.orig/help.c	2000-07-30 06:15:47.000000000 +0200
-+++ microcom-1.02/help.c	2007-01-19 19:44:19.000000000 +0100
-@@ -273,12 +273,29 @@ static void help_set_speed(int fd, char 
-     B19200,
-     B38400,
-     B57600,
-+#if defined B115200
-     B115200,
-+#endif
-+#if defined B230400
-     B230400,
-+#endif
-+#if defined B460800
-     B460800
-+#endif
-   };
-+#undef __STOPCHAR
-+#if defined B115200
-+#define __STOPCHAR 'h'
-+#endif
-+#if defined B230400
-+#define __STOPCHAR 'i'
-+#endif
-+#if defined B460800
-+#define __STOPCHAR 'j'
-+#endif
- 
--  if (c < 'a' && c > 'j') {
-+
-+  if (c < 'a' && c > __STOPCHAR) {
-     if (c == '~') {
-       help_speed();
-       return;
diff --git a/package/microcom/microcom-102-002-rename-variable-log.patch b/package/microcom/microcom-102-002-rename-variable-log.patch
deleted file mode 100644
index 8516b56..0000000
--- a/package/microcom/microcom-102-002-rename-variable-log.patch
+++ /dev/null
@@ -1,78 +0,0 @@
-diff -rdup microcom-1.02.speed/help.c microcom-1.02/help.c
---- microcom-1.02.speed/help.c	2007-01-19 19:44:19.000000000 +0100
-+++ microcom-1.02/help.c	2007-01-19 19:48:20.000000000 +0100
-@@ -23,7 +23,7 @@ extern int crnl_mapping; //0 - no mappin
- extern int script; /* script active flag */
- extern char scr_name[MAX_SCRIPT_NAME]; /* default name of the script */
- extern char device[MAX_DEVICE_NAME]; /* serial device name */
--extern int log; /* log active flag */
-+extern int log_active; /* log active flag */
- extern FILE* flog;   /* log file */
- 
- static int help_state = 0;
-@@ -85,7 +85,7 @@ static void help_escape(void) {
- 
-   write(STDOUT_FILENO, str1, strlen(str1));
- 
--  if (log == 0)
-+  if (log_active == 0)
-     write(STDOUT_FILENO, "  l - log on             \n", 26);
-   else
-     write(STDOUT_FILENO, "  l - log off            \n", 26);
-@@ -156,11 +156,11 @@ static void help_send_escape(int fd, cha
-   case 'q': /* quit help */
-     break;
-   case 'l': /* log on/off */
--    log = (log == 0)? 1: 0;
--    if (log) { /* open log file */
-+    log_active = (log_active == 0)? 1: 0;
-+    if (log_active) { /* open log file */
-       if ((flog = fopen("microcom.log", "a")) == (FILE *)0) {
- 	write(STDOUT_FILENO, "Cannot open microcom.log \n", 26);
--	log = 0;
-+	log_active = 0;
-       }
-     }
-     else { /* cloase log file */
-diff -rdup microcom-1.02.speed/microcom.c microcom-1.02/microcom.c
---- microcom-1.02.speed/microcom.c	2000-08-27 17:22:47.000000000 +0200
-+++ microcom-1.02/microcom.c	2007-01-19 19:48:37.000000000 +0100
-@@ -25,7 +25,7 @@ int crnl_mapping; //0 - no mapping, 1 ma
- int script = 0; /* script active flag */
- char scr_name[MAX_SCRIPT_NAME] = "script.scr"; /* default name of the script */
- char device[MAX_DEVICE_NAME]; /* serial device name */
--int log = 0; /* log active flag */
-+int log_active = 0; /* log active flag */
- FILE* flog;   /* log file */
- int  pf = 0;  /* port file descriptor */
- struct termios pots; /* old port termios settings to restore */
-@@ -106,7 +106,7 @@ void main_usage(int exitcode, char *str,
- /* restore original terminal settings on exit */
- void cleanup_termios(int signal) {
-   /* cloase the log file first */
--  if (log) {
-+  if (log_active) {
-     fflush(flog);
-     fclose(flog);
-   }
-diff -rdup microcom-1.02.speed/mux.c microcom-1.02/mux.c
---- microcom-1.02.speed/mux.c	2000-07-30 06:15:47.000000000 +0200
-+++ microcom-1.02/mux.c	2007-01-19 19:48:48.000000000 +0100
-@@ -24,7 +24,7 @@
- 
- extern int script;
- extern char scr_name[];
--extern int log;
-+extern int log_active;
- extern FILE* flog;
- 
- void mux_clear_sflag(void) {
-@@ -71,7 +71,7 @@ void mux_loop(int pf) {
-       i = read(pf, buf, BUFSIZE);
-       if (i > 0) {
- 	write(STDOUT_FILENO, buf, i);
--	if (log)
-+	if (log_active)
- 	  fwrite(buf, 1, i, flog);
- 	if (script) {
- 	  i = script_process(S_DCE, buf, i);
diff --git a/package/microcom/microcom.mk b/package/microcom/microcom.mk
index f691723..729230e 100644
--- a/package/microcom/microcom.mk
+++ b/package/microcom/microcom.mk
@@ -2,70 +2,32 @@
 #
 # microcom terminal emulator
 #
-# Maintainer: Tim Riker <Tim@Rikers.org>
-#
 #############################################################
-# Copyright (C) 2001-2003 by Erik Andersen <andersen@codepoet.org>
-# Copyright (C) 2002 by Tim Riker <Tim@Rikers.org>
-#
-# This program is free software; you can redistribute it and/or modify
-# it under the terms of the GNU Library General Public License as
-# published by the Free Software Foundation; either version 2 of the
-# License, or (at your option) any later version.
-#
-# This program is distributed in the hope that it will be useful, but
-# WITHOUT ANY WARRANTY; without even the implied warranty of
-# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
-# Library General Public License for more details.
-#
-# You should have received a copy of the GNU Library General Public
-# License along with this program; if not, write to the Free Software
-# Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307
-# USA
-
-# TARGETS
-# http://microcom.port5.com/m102.tar.gz
-MICROCOM_VERSION:=1.02
-MICROCOM_SITE:=http://buildroot.net/downloads/sources/
-MICROCOM_SOURCE:=m102.tar.gz
-MICROCOM_DIR:=$(BUILD_DIR)/microcom-$(MICROCOM_VERSION)
-
-$(DL_DIR)/$(MICROCOM_SOURCE):
-	$(call DOWNLOAD,$(MICROCOM_SITE),$(MICROCOM_SOURCE))
-
-microcom-source: $(DL_DIR)/$(MICROCOM_SOURCE)
+MICROCOM_VERSION = 1.02
+MICROCOM_SOURCE = m102.tar.gz
+MICROCOM_SITE = http://sources.buildroot.net
 
-$(MICROCOM_DIR)/.unpacked: $(DL_DIR)/$(MICROCOM_SOURCE)
-	mkdir -p $(MICROCOM_DIR)
-	$(ZCAT) $(DL_DIR)/$(MICROCOM_SOURCE) | tar -C $(MICROCOM_DIR) $(TAR_OPTIONS) -
+define MICROCOM_CONFIGURE_CMDS
+	$(ZCAT) $(DL_DIR)/$(MICROCOM_SOURCE) | tar -C $(@D) $(TAR_OPTIONS) -
 	toolchain/patch-kernel.sh $(MICROCOM_DIR) package/microcom/ \*.patch
-	touch $@
+	$(SED) 's~gcc~$$(CC)~' -e 's~-O~$$(CFLAGS)~' $(@D)/Makefile
+endef
 
-$(MICROCOM_DIR)/.configured: $(MICROCOM_DIR)/.unpacked
-	$(SED) 's~gcc~$$(CC)~' -e 's~-O~$$(CFLAGS)~' $(MICROCOM_DIR)/Makefile
-	touch $@
+define MICROCOM_BUILD_CMDS
+	$(MAKE) CC="$(TARGET_CC)" CFLAGS="$(TARGET_CFLAGS)" \
+	LDFLAGS="$(TARGET_LDFLAGS)" -C $(@D)
+endef
 
-$(MICROCOM_DIR)/microcom: $(MICROCOM_DIR)/.configured
-	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(MICROCOM_DIR)
-	$(STRIPCMD) $(STRIP_STRIP_ALL) $@
+define MICROCOM_INSTALL_TARGET_CMDS
+	install -D -m 755 $(@D)/microcom $(TARGET_DIR)/usr/bin/microcom
+endef
 
-$(TARGET_DIR)/usr/bin/microcom: $(MICROCOM_DIR)/microcom
-	install -c $(MICROCOM_DIR)/microcom $(TARGET_DIR)/usr/bin/microcom
+define MICROCOM_UNINSTALL_TARGET_CMDS
+	rm -f $(TARGET_DIR)/usr/bin/microcom
+endef
 
-microcom-clean:
-	rm -f $(MICROCOM_DIR)/*.o $(MICROCOM_DIR)/microcom \
-		$(TARGET_DIR)/usr/bin/microcom
+define MICROCOM_CLEAN_CMDS
+	rm -f $(@D)/*.o
+endef
 
-microcom-dirclean:
-	rm -rf $(MICROCOM_DIR)
-
-microcom: $(TARGET_DIR)/usr/bin/microcom
-
-#############################################################
-#
-# Toplevel Makefile options
-#
-#############################################################
-ifeq ($(BR2_PACKAGE_MICROCOM),y)
-TARGETS+=microcom
-endif
+$(eval $(call GENTARGETS,package,microcom))
-- 
1.7.3.1
