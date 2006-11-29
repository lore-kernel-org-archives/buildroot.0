From: aldot at uclibc.org <aldot@uclibc.org>
Date: Wed, 29 Nov 2006 00:42:37 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/acpid
Message-ID: <20061129084237.B1C4248571@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2006-11-29 00:42:37 -0800 (Wed, 29 Nov 2006)
New Revision: 16712

Log:
- acpid is compiled with -Werror, and gcc 4.1.1 warns about mismatching
  pointers.  Fix it by using socklen_t type.
- Modify acpid.mk to apply all available patches.  Convert ACPI_SOCKETFILE
  adjustment from sed script to a patch.
Thanks to Pavel Roskin


Added:
   trunk/buildroot/package/acpid/acpid-sign-warning.patch
   trunk/buildroot/package/acpid/acpid-socket-path.patch

Modified:
   trunk/buildroot/package/acpid/acpid.mk


Changeset:
Added: trunk/buildroot/package/acpid/acpid-sign-warning.patch
===================================================================
--- trunk/buildroot/package/acpid/acpid-sign-warning.patch	2006-11-29 08:36:32 UTC (rev 16711)
+++ trunk/buildroot/package/acpid/acpid-sign-warning.patch	2006-11-29 08:42:37 UTC (rev 16712)
@@ -0,0 +1,11 @@
+--- acpid-1.0.4/ud_socket.c
++++ acpid-1.0.4/ud_socket.c
+@@ -58,7 +58,7 @@ ud_accept(int listenfd, struct ucred *cr
+ 	while (1) {
+ 		int newsock = 0;
+ 		struct sockaddr_un cliaddr;
+-		int len = sizeof(struct sockaddr_un);
++		socklen_t len = sizeof(struct sockaddr_un);
+ 
+ 		newsock = accept(listenfd, (struct sockaddr *)&cliaddr, &len);
+ 		if (newsock < 0) {

Added: trunk/buildroot/package/acpid/acpid-socket-path.patch
===================================================================
--- trunk/buildroot/package/acpid/acpid-socket-path.patch	2006-11-29 08:36:32 UTC (rev 16711)
+++ trunk/buildroot/package/acpid/acpid-socket-path.patch	2006-11-29 08:42:37 UTC (rev 16712)
@@ -0,0 +1,11 @@
+--- acpid-1.0.4/acpid.h
++++ acpid-1.0.4/acpid.h
+@@ -32,7 +32,7 @@
+ #define ACPI_EVENTFILE		ACPI_PROCDIR "/event"
+ #define ACPI_CONFDIR		"/etc/acpi/events"
+ #define ACPI_LOGFILE		"/var/log/acpid"
+-#define ACPI_SOCKETFILE		"/var/run/acpid.socket"
++#define ACPI_SOCKETFILE		"/tmp/acpid.socket"
+ #define ACPI_SOCKETMODE		0666
+ #define ACPI_MAX_ERRS		5
+ 

Modified: trunk/buildroot/package/acpid/acpid.mk
===================================================================
--- trunk/buildroot/package/acpid/acpid.mk	2006-11-29 08:36:32 UTC (rev 16711)
+++ trunk/buildroot/package/acpid/acpid.mk	2006-11-29 08:42:37 UTC (rev 16712)
@@ -10,12 +10,12 @@
 $(DL_DIR)/$(ACPID_SOURCE):
 	$(WGET) -P $(DL_DIR) $(ACPID_SITE)/$(ACPID_SOURCE)
 
-$(ACPID_DIR)/Makefile: $(DL_DIR)/$(ACPID_SOURCE)
+$(ACPID_DIR)/.unpacked: $(DL_DIR)/$(ACPID_SOURCE)
 	$(ZCAT) $(DL_DIR)/$(ACPID_SOURCE) | tar -C $(BUILD_DIR) -xvf -
-	$(SED) "s:ACPI_SOCKETFILE.*:ACPI_SOCKETFILE \"/tmp/acpid.socket\":" $(ACPID_DIR)/acpid.h
-	touch -c $(ACPID_DIR)/Makefile
+	toolchain/patch-kernel.sh $(ACPID_DIR) package/acpid/ acpid\*.patch
+	touch $(ACPID_DIR)/.unpacked
 
-$(ACPID_DIR)/acpid: $(ACPID_DIR)/Makefile
+$(ACPID_DIR)/acpid: $(ACPID_DIR)/.unpacked
 	$(MAKE) CC=$(TARGET_CC) -C $(ACPID_DIR)
 	$(STRIP) -s $(ACPID_DIR)/acpid
 	$(STRIP) -s $(ACPID_DIR)/acpi_listen
