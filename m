From: aldot at uclibc.org <aldot@uclibc.org>
Date: Fri, 19 Jan 2007 11:14:35 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/microcom
Message-ID: <20070119191435.9B42B48586@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-01-19 11:14:33 -0800 (Fri, 19 Jan 2007)
New Revision: 17386

Log:
- make it build.. compile-tested only. Closes #970


Added:
   trunk/buildroot/package/microcom/microcom-102-001-speed-defines.patch
   trunk/buildroot/package/microcom/microcom-102-002-rename-variable-log.patch

Modified:
   trunk/buildroot/package/microcom/microcom.mk


Changeset:
Added: trunk/buildroot/package/microcom/microcom-102-001-speed-defines.patch
===================================================================
--- trunk/buildroot/package/microcom/microcom-102-001-speed-defines.patch	                        (rev 0)
+++ trunk/buildroot/package/microcom/microcom-102-001-speed-defines.patch	2007-01-19 19:14:33 UTC (rev 17386)
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

Added: trunk/buildroot/package/microcom/microcom-102-002-rename-variable-log.patch
===================================================================
--- trunk/buildroot/package/microcom/microcom-102-002-rename-variable-log.patch	                        (rev 0)
+++ trunk/buildroot/package/microcom/microcom-102-002-rename-variable-log.patch	2007-01-19 19:14:33 UTC (rev 17386)
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

Modified: trunk/buildroot/package/microcom/microcom.mk
===================================================================
--- trunk/buildroot/package/microcom/microcom.mk	2007-01-19 18:33:40 UTC (rev 17385)
+++ trunk/buildroot/package/microcom/microcom.mk	2007-01-19 19:14:33 UTC (rev 17386)
@@ -45,7 +45,11 @@
 	touch $@
 
 $(MICROCOM_DIR)/microcom: $(MICROCOM_DIR)/.configured
-	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(MICROCOM_DIR)
+	$(TARGET_CONFIGURE_OPTS) CFLAGS="$(TARGET_CFLAGS)" $(MAKE) -C $(MICROCOM_DIR)
+	#(cd $(MICROCOM_DIR) ; \
+	# $(TARGET_CC) $(TARGET_CFLAGS) --combine -fwhole-program -o $@ $(wildcard $(MICROCOM_DIR)/*.c); \
+	#)
+	$(STRIP) -s $@
 
 $(TARGET_DIR)/usr/bin/microcom: $(MICROCOM_DIR)/microcom
 	install -c $(MICROCOM_DIR)/microcom $(TARGET_DIR)/usr/bin/microcom
