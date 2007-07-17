From: ulf at uclibc.org <ulf@uclibc.org>
Date: Tue, 17 Jul 2007 10:07:35 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/sysvinit
Message-ID: <20070717170735.67C6CA6830@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-07-17 10:07:33 -0700 (Tue, 17 Jul 2007)
New Revision: 19139

Log:
Avoid repeated rebuilds of 'sysvinit'

Modified:
   trunk/buildroot/package/sysvinit/sysvinit.mk


Changeset:
Modified: trunk/buildroot/package/sysvinit/sysvinit.mk
===================================================================
--- trunk/buildroot/package/sysvinit/sysvinit.mk	2007-07-17 17:05:58 UTC (rev 19138)
+++ trunk/buildroot/package/sysvinit/sysvinit.mk	2007-07-17 17:07:33 UTC (rev 19139)
@@ -9,13 +9,11 @@
 SYSVINIT_DIR:=$(BUILD_DIR)/sysvinit-$(SYSVINIT_VERSION)
 SYSVINIT_CAT:=$(ZCAT)
 SYSVINIT_BINARY:=src/init
-SYSVINIT_TARGET_BINARY:=bin/init
+SYSVINIT_TARGET_BINARY:=sbin/init
 
 $(DL_DIR)/$(SYSVINIT_SOURCE):
 	$(WGET) -P $(DL_DIR) $(SYSVINIT_SITE)/$(SYSVINIT_SOURCE)
 
-sysvinit-source: $(DL_DIR)/$(SYSVINIT_SOURCE)
-
 sysvinit-unpacked: $(SYSVINIT_DIR)/.unpacked
 $(SYSVINIT_DIR)/.unpacked: $(DL_DIR)/$(SYSVINIT_SOURCE)
 	$(SYSVINIT_CAT) $(DL_DIR)/$(SYSVINIT_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
@@ -32,6 +30,8 @@
 
 sysvinit: uclibc ncurses $(TARGET_DIR)/$(SYSVINIT_TARGET_BINARY)
 
+sysvinit-source: $(DL_DIR)/$(SYSVINIT_SOURCE)
+
 sysvinit-clean:
 	for x in halt init shutdown ; do \
 		rm -f $(TARGET_DIR)/sbin/$$x || exit 1 ; \
