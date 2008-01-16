From: vanokuten at uclibc.org <vanokuten@uclibc.org>
Date: Wed, 16 Jan 2008 01:25:08 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/target/cloop
Message-ID: <20080116092508.A374B12C592@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: vanokuten
Date: 2008-01-16 01:25:07 -0800 (Wed, 16 Jan 2008)
New Revision: 20857

Log:
cloop target update, patch by Claus Klein

Modified:
   trunk/buildroot/target/cloop/cloop.mk


Changeset:
Modified: trunk/buildroot/target/cloop/cloop.mk
===================================================================
--- trunk/buildroot/target/cloop/cloop.mk	2008-01-14 16:10:11 UTC (rev 20856)
+++ trunk/buildroot/target/cloop/cloop.mk	2008-01-16 09:25:07 UTC (rev 20857)
@@ -3,17 +3,10 @@
 # mkcloop to build to target cloop filesystems
 #
 #############################################################
-### /cloop_2.01.5.orig.tar.gz
-CLOOP_VERSION=2.01
+CLOOP_VERSION=2.06
 CLOOP_DIR=$(BUILD_DIR)/cloop-$(CLOOP_VERSION)
-### CLOOP_SOURCE=cloop_$(CLOOP_VERSION).5.orig.tar.gz
-### CLOOP_SITE=http://ftp.debian.org/debian/pool/main/c/cloop
-# http://ftp.debian.org/debian/pool/main/c/cloop/cloop_2.01.5-4.diff.gz
-### CLOOP_PATCH1:=cloop_2.01.5-4.diff.gz
-### CLOOP_PATCH1_URL:=$(CLOOP_SITE)
-# http://developer.linuxtag.net/knoppix/sources/cloop_2.01-5.tar.gz
-CLOOP_SOURCE=cloop_$(CLOOP_VERSION)-5.tar.gz
-CLOOP_SITE=http://developer.linuxtag.net/knoppix/sources
+CLOOP_SOURCE=cloop_$(CLOOP_VERSION)-2.tar.gz
+CLOOP_SITE=http://debian-knoppix.alioth.debian.org/sources/
 
 CLOOP_TARGET:=$(IMAGE).cloop
 ### Note: not used yet! ck
@@ -70,25 +63,26 @@
 ### Note: target/default/device_table.txt is not yet supported! ck
 # the quickfix is to use sudo to mount the previous created cramroot
 check-tools:
-	which mkisofs
-	- which symlinks
-
-clooproot: cloop check-tools $(IMAGE).cramfs ### cramfsroot
-	- at find $(TARGET_DIR) -type f -perm +111 | xargs $(STRIPCMD) 2>/dev/null || true
 ifneq ($(BR2_HAVE_MANPAGES),y)
 	@rm -rf $(TARGET_DIR)/usr/man
 	@rm -rf $(TARGET_DIR)/usr/share/man
 endif
 ifneq ($(BR2_HAVE_INFOPAGES),y)
 	@rm -rf $(TARGET_DIR)/usr/info
+	@rm -rf $(TARGET_DIR)/usr/share/info
 endif
 	@rmdir -p --ignore-fail-on-non-empty $(TARGET_DIR)/usr/share
+	which mkisofs
+	- at find $(TARGET_DIR) -type f -perm +111 | xargs $(STRIPCMD) 2>/dev/null || true
+	- which symlinks && symlinks -r $(TARGET_DIR)
+
+$(IMAGE).cramfs: cramfsroot
+
+clooproot: cloop check-tools $(IMAGE).cramfs
 	### $(CLOOP_DIR)/create_compressed_fs -q -D target/default/device_table.txt $(TARGET_DIR) $(CLOOP_TARGET)
 	## mkisofs -r $(TARGET_DIR) | $(CLOOP_DIR)/create_compressed_fs - 65536 > $(CLOOP_TARGET)
-	sudo /sbin/losetup -d /dev/loop1
-	sudo /sbin/losetup /dev/loop1 $(IMAGE).cramfs
 	sudo mkdir -p /mnt/compressed
-	sudo mount -o ro -t cramfs /dev/loop1 /mnt/compressed
+	sudo mount -o ro,loop -t cramfs $(IMAGE).cramfs /mnt/compressed
 	mkisofs -r /mnt/compressed | $(CLOOP_DIR)/create_compressed_fs - 65536 > $(CLOOP_TARGET)
 	- symlinks -r /mnt/compressed
 	sudo umount /mnt/compressed
