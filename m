From: aldot at uclibc.org <aldot@uclibc.org>
Date: Wed, 22 Nov 2006 15:36:41 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/target/ext2
Message-ID: <20061122233641.AF556485A1@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2006-11-22 15:36:41 -0800 (Wed, 22 Nov 2006)
New Revision: 16642

Log:
- pass a LC_ALL to du to avoid i18n trouble when calculating the size.
  Fixes #1044


Modified:
   trunk/buildroot/target/ext2/ext2root.mk


Changeset:
Modified: trunk/buildroot/target/ext2/ext2root.mk
===================================================================
--- trunk/buildroot/target/ext2/ext2root.mk	2006-11-22 23:22:06 UTC (rev 16641)
+++ trunk/buildroot/target/ext2/ext2root.mk	2006-11-22 23:36:41 UTC (rev 16642)
@@ -86,7 +86,7 @@
 		>> $(STAGING_DIR)/_fakeroot.$(notdir $(EXT2_TARGET))
 	# Use fakeroot so genext2fs believes the previous fakery
 ifeq ($(strip $(BR2_TARGET_ROOTFS_EXT2_BLOCKS)),0)
-	GENEXT2_REALSIZE=`LANG=C du -l -s -c -k $(TARGET_DIR) | grep total | sed -e "s/total//"`; \
+	GENEXT2_REALSIZE=`LANG=C LC_ALL=POSIX du -l -s -c -k $(TARGET_DIR) | grep total | sed -e "s/total//"`; \
 	GENEXT2_ADDTOROOTSIZE=`if [ $$GENEXT2_REALSIZE -ge 20000 ] ; then echo 16384; else echo 2400; fi`; \
 	GENEXT2_SIZE=`expr $$GENEXT2_REALSIZE + $$GENEXT2_ADDTOROOTSIZE`; \
 	GENEXT2_ADDTOINODESIZE=`find $(TARGET_DIR) | wc -l`; \
