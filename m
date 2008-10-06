From: wberrier at uclibc.org <wberrier@uclibc.org>
Date: Mon,  6 Oct 2008 15:46:41 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/vsftpd
Message-ID: <20081006224641.F0B81F8008@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: wberrier
Date: 2008-10-06 15:46:41 -0700 (Mon, 06 Oct 2008)
New Revision: 23611

Log:
vsftpd:
-Patch to build against newer kernel headers
 ( vsftpd-2.0.7-uclibc.patch , based on idea from
   http://www.bitshrine.org/gpp/vsftpd-2.0.5-syscall2.patch )
-new basic init script (no config yet)
-Update version (2.0.7)
-openssl fixes
-cleanup makefile deps so it doesn't get built when things
 don't change


Added:
   trunk/buildroot/package/vsftpd/vsftpd-2.0.7-uclibc.patch
   trunk/buildroot/package/vsftpd/vsftpd-init

Modified:
   trunk/buildroot/package/vsftpd/vsftpd.mk


Changeset:
Added: trunk/buildroot/package/vsftpd/vsftpd-2.0.7-uclibc.patch
===================================================================
--- trunk/buildroot/package/vsftpd/vsftpd-2.0.7-uclibc.patch	                        (rev 0)
+++ trunk/buildroot/package/vsftpd/vsftpd-2.0.7-uclibc.patch	2008-10-06 22:46:41 UTC (rev 23611)
@@ -0,0 +1,15 @@
+--- vsftpd-2.0.5/sysdeputil.c.orig	2008-10-06 15:24:42.000000000 -0600
++++ vsftpd-2.0.5/sysdeputil.c	2008-10-06 15:35:35.000000000 -0600
+@@ -159,7 +159,12 @@
+ #include <linux/capability.h>
+ #include <errno.h>
+ #include <syscall.h>
++/* try to handle kernel header versions correctly (2.4 and >= 2.6.18) */
++#ifndef capset
++#define capset(head,data) syscall(__NR_capset,head,data)
++#else
+ _syscall2(int, capset, cap_user_header_t, header, const cap_user_data_t, data)
++#endif /* capset */
+ /* Gross HACK to avoid warnings - linux headers overlap glibc headers */
+ #undef __NFDBITS
+ #undef __FDMASK

Added: trunk/buildroot/package/vsftpd/vsftpd-init
===================================================================
--- trunk/buildroot/package/vsftpd/vsftpd-init	                        (rev 0)
+++ trunk/buildroot/package/vsftpd/vsftpd-init	2008-10-06 22:46:41 UTC (rev 23611)
@@ -0,0 +1,33 @@
+#! /bin/sh
+
+set -e
+
+DESC="vsftpd"
+NAME=vsftpd
+DAEMON=/usr/sbin/$NAME
+
+case "$1" in
+  start)
+	echo -n "Starting $DESC: "
+	start-stop-daemon -S -b -x $NAME
+	echo "OK"
+	;;
+  stop)
+	echo -n "Stopping $DESC: "
+	start-stop-daemon -K -x $NAME
+	echo "OK"
+	;;
+  restart|force-reload)
+	echo "Restarting $DESC: "
+	$0 stop
+	sleep 1
+	$0 start
+	echo ""
+	;;
+  *)
+	echo "Usage: $0 {start|stop|restart|force-reload}" >&2
+	exit 1
+	;;
+esac
+
+exit 0


Property changes on: trunk/buildroot/package/vsftpd/vsftpd-init
___________________________________________________________________
Name: svn:executable
   + *

Modified: trunk/buildroot/package/vsftpd/vsftpd.mk
===================================================================
--- trunk/buildroot/package/vsftpd/vsftpd.mk	2008-10-06 20:41:12 UTC (rev 23610)
+++ trunk/buildroot/package/vsftpd/vsftpd.mk	2008-10-06 22:46:41 UTC (rev 23611)
@@ -3,7 +3,7 @@
 # vsftpd
 #
 #############################################################
-VSFTPD_VERSION:=2.0.5
+VSFTPD_VERSION:=2.0.7
 VSFTPD_SOURCE:=vsftpd-$(VSFTPD_VERSION).tar.gz
 VSFTPD_SITE:=ftp://vsftpd.beasts.org/users/cevans
 VSFTPD_DIR:=$(BUILD_DIR)/vsftpd-$(VSFTPD_VERSION)
@@ -12,7 +12,6 @@
 VSFTPD_TARGET_BINARY:=usr/sbin/vsftpd
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
-VSFTPF_PREREQ:=openssl
 VSFTPD_LIBS:=-lcrypt -lssl
 else
 VSFTPD_LIBS:=-lcrypt
@@ -26,7 +25,7 @@
 $(VSFTPD_DIR)/.unpacked: $(DL_DIR)/$(VSFTPD_SOURCE)
 	$(VSFTPD_CAT) $(DL_DIR)/$(VSFTPD_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
 	toolchain/patch-kernel.sh $(VSFTPD_DIR) package/vsftpd/ vsftpd\*.patch
-	touch $(VSFTPD_DIR)/.unpacked
+	touch $@
 
 $(VSFTPD_DIR)/.configured: $(VSFTPD_DIR)/.unpacked
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
@@ -45,17 +44,22 @@
 endif
 
 
-$(VSFTPD_DIR)/$(VSFTPD_BINARY): $(VSFTPF_PREREQ) $(VSFTPD_DIR)/.configured
+$(VSFTPD_DIR)/$(VSFTPD_BINARY): $(VSFTPD_DIR)/.configured
 	$(MAKE) CC=$(TARGET_CC) CFLAGS="$(TARGET_CFLAGS)" LIBS="$(VSFTPD_LIBS)" -C $(VSFTPD_DIR)
 
-$(TARGET_DIR)/usr/sbin/$(VSFTPD_BINARY): $(VSFTPD_DIR)/$(VSFTPD_BINARY)
+$(TARGET_DIR)/$(VSFTPD_TARGET_BINARY): $(VSFTPD_DIR)/$(VSFTPD_BINARY)
 	cp -dpf $< $@
+	$(INSTALL) -D -m 0755 package/vsftpd/vsftpd-init $(TARGET_DIR)/etc/init.d/S70vsftpd
 
-vsftpd: uclibc libgmp $(TARGET_DIR)/$(VSFTPD_TARGET_BINARY)
+ifeq ($(BR2_PACKAGE_OPENSSL),y)
+vsftpd: uclibc openssl $(TARGET_DIR)/$(VSFTPD_TARGET_BINARY)
+else
+vsftpd: uclibc $(TARGET_DIR)/$(VSFTPD_TARGET_BINARY)
+endif
 
 vsftpd-clean:
 	-$(MAKE) -C $(VSFTPD_DIR) clean
-	rm -f $(TARGET_DIR)/usr/sbin/$(VSFTPD_BINARY)
+	rm -f $(TARGET_DIR)/$(VSFTPD_TARGET_BINARY)
 
 vsftpd-dirclean:
 	rm -rf $(VSFTPD_DIR)
