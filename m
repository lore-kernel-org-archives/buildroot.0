From: Pavel Roskin <proski@gnu.org>
Date: Tue, 28 Nov 2006 21:55:06 -0500
Subject: [Buildroot] [PATCH] acpid vs gcc-4.1.1 fix
Message-ID: <1164768906.4016.72.camel@dv>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

acpid is compiled with -Werror, and gcc 4.1.1 warns about mismatching
pointers.  Fix it by using socklen_t type.

Modify acpid.mk to apply all available patches.  Convert ACPI_SOCKETFILE
adjustment from sed script to a patch.

Please make sure to add the new 2 patches to Subversion.

Index: package/acpid/acpid-sign-warning.patch
===================================================================
--- package/acpid/acpid-sign-warning.patch	(revision 0)
+++ package/acpid/acpid-sign-warning.patch	(revision 0)
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
Index: package/acpid/acpid.mk
===================================================================
--- package/acpid/acpid.mk	(revision 16710)
+++ package/acpid/acpid.mk	(working copy)
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
Index: package/acpid/acpid-socket-path.patch
===================================================================
--- package/acpid/acpid-socket-path.patch	(revision 0)
+++ package/acpid/acpid-socket-path.patch	(revision 0)
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


-- 
Regards,
Pavel Roskin
