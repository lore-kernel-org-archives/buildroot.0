From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 12 Dec 2010 22:53:56 +0100
Subject: [Buildroot] [PATCH 10/19] microcom: remove package
In-Reply-To: <cover.1292190675.git.thomas.petazzoni@free-electrons.com>
References: <cover.1292190675.git.thomas.petazzoni@free-electrons.com>
Message-ID: <54e026f39e9d97f4ea1aca4a561a43d323d82bb8.1292190675.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This package has been marked deprecated some time ago, because it has
been integrated into Busybox. Let's get rid of it now.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                                  |    3 -
 package/microcom/Config.in                         |    7 --
 .../microcom/microcom-102-001-speed-defines.patch  |   34 ---------
 .../microcom-102-002-rename-variable-log.patch     |   78 --------------------
 package/microcom/microcom.mk                       |   71 ------------------
 5 files changed, 0 insertions(+), 193 deletions(-)
 delete mode 100644 package/microcom/Config.in
 delete mode 100644 package/microcom/microcom-102-001-speed-defines.patch
 delete mode 100644 package/microcom/microcom-102-002-rename-variable-log.patch
 delete mode 100644 package/microcom/microcom.mk

diff --git a/package/Config.in b/package/Config.in
index 10d8918..32145d0 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -388,9 +388,6 @@ source "package/lighttpd/Config.in"
 endif
 source "package/links/Config.in"
 source "package/lrzsz/Config.in"
-if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
-source "package/microcom/Config.in"
-endif
 source "package/mii-diag/Config.in"
 source "package/mrouted/Config.in"
 source "package/mutt/Config.in"
diff --git a/package/microcom/Config.in b/package/microcom/Config.in
deleted file mode 100644
index bf9f5df..0000000
--- a/package/microcom/Config.in
+++ /dev/null
@@ -1,7 +0,0 @@
-config BR2_PACKAGE_MICROCOM
-	depends on BR2_DEPRECATED
-	bool "microcom"
-	help
-	  A minicom-like serial terminal emulator with scripting support.
-
-	  http://microcom.port5.com/
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
deleted file mode 100644
index f691723..0000000
--- a/package/microcom/microcom.mk
+++ /dev/null
@@ -1,71 +0,0 @@
-#############################################################
-#
-# microcom terminal emulator
-#
-# Maintainer: Tim Riker <Tim@Rikers.org>
-#
-#############################################################
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
-
-$(MICROCOM_DIR)/.unpacked: $(DL_DIR)/$(MICROCOM_SOURCE)
-	mkdir -p $(MICROCOM_DIR)
-	$(ZCAT) $(DL_DIR)/$(MICROCOM_SOURCE) | tar -C $(MICROCOM_DIR) $(TAR_OPTIONS) -
-	toolchain/patch-kernel.sh $(MICROCOM_DIR) package/microcom/ \*.patch
-	touch $@
-
-$(MICROCOM_DIR)/.configured: $(MICROCOM_DIR)/.unpacked
-	$(SED) 's~gcc~$$(CC)~' -e 's~-O~$$(CFLAGS)~' $(MICROCOM_DIR)/Makefile
-	touch $@
-
-$(MICROCOM_DIR)/microcom: $(MICROCOM_DIR)/.configured
-	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(MICROCOM_DIR)
-	$(STRIPCMD) $(STRIP_STRIP_ALL) $@
-
-$(TARGET_DIR)/usr/bin/microcom: $(MICROCOM_DIR)/microcom
-	install -c $(MICROCOM_DIR)/microcom $(TARGET_DIR)/usr/bin/microcom
-
-microcom-clean:
-	rm -f $(MICROCOM_DIR)/*.o $(MICROCOM_DIR)/microcom \
-		$(TARGET_DIR)/usr/bin/microcom
-
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
-- 
1.7.0.4
