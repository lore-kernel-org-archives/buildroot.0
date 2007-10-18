From: vanokuten at uclibc.org <vanokuten@uclibc.org>
Date: Thu, 18 Oct 2007 15:23:54 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/lockfile-progs
Message-ID: <20071018222354.877BCA5D34@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: vanokuten
Date: 2007-10-18 15:23:52 -0700 (Thu, 18 Oct 2007)
New Revision: 20292

Log:
bump lockfile-progs to 0.1.11 version, provide sus3v legacy patch

Added:
   trunk/buildroot/package/lockfile-progs/lockfile-progs-0.1.11-sus3v-legacy.patch

Modified:
   trunk/buildroot/package/lockfile-progs/lockfile-progs.mk


Changeset:
Added: trunk/buildroot/package/lockfile-progs/lockfile-progs-0.1.11-sus3v-legacy.patch
===================================================================
--- trunk/buildroot/package/lockfile-progs/lockfile-progs-0.1.11-sus3v-legacy.patch	                        (rev 0)
+++ trunk/buildroot/package/lockfile-progs/lockfile-progs-0.1.11-sus3v-legacy.patch	2007-10-18 22:23:52 UTC (rev 20292)
@@ -0,0 +1,11 @@
+--- /lockfile-progs.orig.c	2007-10-11 10:32:09.000000000 -0300
++++ /lockfile-progs.c	2007-10-11 10:32:28.000000000 -0300
+@@ -93,7 +93,7 @@
+     { NULL, 0, NULL, 0 }
+   };
+ 
+-  char *cmd_name = rindex(argv[0], '/');
++  char *cmd_name = strrchr(argv[0], '/');
+   int mail_cmd_p = 0;
+ 
+   if(cmd_name != NULL) {

Modified: trunk/buildroot/package/lockfile-progs/lockfile-progs.mk
===================================================================
--- trunk/buildroot/package/lockfile-progs/lockfile-progs.mk	2007-10-18 21:55:09 UTC (rev 20291)
+++ trunk/buildroot/package/lockfile-progs/lockfile-progs.mk	2007-10-18 22:23:52 UTC (rev 20292)
@@ -3,11 +3,11 @@
 # lockfile-progs
 #
 #############################################################
-LOCKFILE_PROGS_VERSION=0.1.10
+LOCKFILE_PROGS_VERSION=0.1.11
 LOCKFILE_PROGS_SOURCE:=lockfile-progs_$(LOCKFILE_PROGS_VERSION).tar.gz
 LOCKFILE_PROGS_SITE:=http://ftp.debian.org/debian/pool/main/l/lockfile-progs/
 LOCKFILE_PROGS_CAT:=$(ZCAT)
-LOCKFILE_PROGS_DIR:=$(BUILD_DIR)/lockfile-progs-$(LOCKFILE_PROGS_VERSION)
+LOCKFILE_PROGS_DIR:=$(BUILD_DIR)/sid
 LOCKFILE_PROGS_BINARY:=usr/bin/lockfile-create
 
 $(DL_DIR)/$(LOCKFILE_PROGS_SOURCE):
@@ -17,6 +17,7 @@
 
 $(LOCKFILE_PROGS_DIR)/.unpacked: $(DL_DIR)/$(LOCKFILE_PROGS_SOURCE)
 	$(LOCKFILE_PROGS_CAT) $(DL_DIR)/$(LOCKFILE_PROGS_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
+	toolchain/patch-kernel.sh $(LOCKFILE_PROGS_DIR) package/lockfile-progs/ *.patch
 	touch $(LOCKFILE_PROGS_DIR)/.unpacked
 
 $(TARGET_DIR)/$(LOCKFILE_PROGS_BINARY): $(LOCKFILE_PROGS_DIR)/.unpacked
