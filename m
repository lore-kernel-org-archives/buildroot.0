From: aldot at uclibc.org <aldot@uclibc.org>
Date: Mon, 26 Mar 2007 03:31:57 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/target/jffs2
Message-ID: <20070326103157.BA1884800C@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-03-26 03:31:56 -0700 (Mon, 26 Mar 2007)
New Revision: 18238

Log:
- add option to create a jffs2 filesystem in srec format. Thanks to Xride.


Modified:
   trunk/buildroot/target/jffs2/Config.in
   trunk/buildroot/target/jffs2/jffs2root.mk


Changeset:
Modified: trunk/buildroot/target/jffs2/Config.in
===================================================================
--- trunk/buildroot/target/jffs2/Config.in	2007-03-25 23:21:05 UTC (rev 18237)
+++ trunk/buildroot/target/jffs2/Config.in	2007-03-26 10:31:56 UTC (rev 18238)
@@ -32,6 +32,11 @@
 	depends on BR2_TARGET_ROOTFS_JFFS2
 	default 0x20000
 
+config BR2_JFFS2_TARGET_SREC
+	bool "RootFS in SREC file formet"
+	depends on BR2_TARGET_ROOTFS_JFFS2
+	default n
+
 config BR2_TARGET_ROOTFS_JFFS2_PAD
 	bool "Pad output"
 	depends on BR2_TARGET_ROOTFS_JFFS2

Modified: trunk/buildroot/target/jffs2/jffs2root.mk
===================================================================
--- trunk/buildroot/target/jffs2/jffs2root.mk	2007-03-25 23:21:05 UTC (rev 18237)
+++ trunk/buildroot/target/jffs2/jffs2root.mk	2007-03-26 10:31:56 UTC (rev 18238)
@@ -71,6 +71,10 @@
 	$(STAGING_DIR)/usr/bin/fakeroot -- $(STAGING_DIR)/_fakeroot.$(notdir $(JFFS2_TARGET))
 	- at rm -f $(STAGING_DIR)/_fakeroot.$(notdir $(JFFS2_TARGET))
 	@ls -l $(JFFS2_TARGET)
+ifeq ($(BR2_JFFS2_TARGET_SREC),y)
+	$(TARGET_CROSS)objcopy -I binary -O srec --adjust-vma 0xa1000000 $(JFFS2_TARGET) $(JFFS2_TARGET).srec
+	@ls -l $(JFFS2_TARGET).srec
+endif
 
 JFFS2_COPYTO := $(strip $(subst ",,$(BR2_TARGET_ROOTFS_JFFS2_COPYTO)))
 #"))
