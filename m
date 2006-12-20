From: aldot at uclibc.org <aldot@uclibc.org>
Date: Wed, 20 Dec 2006 08:45:47 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/target/ext2
Message-ID: <20061220164547.0A85A485DE@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2006-12-20 08:45:47 -0800 (Wed, 20 Dec 2006)
New Revision: 17017

Log:
- Lars Munch noticed that i broke the ext2 compressor. Thanks!


Modified:
   trunk/buildroot/target/ext2/ext2root.mk


Changeset:
Modified: trunk/buildroot/target/ext2/ext2root.mk
===================================================================
--- trunk/buildroot/target/ext2/ext2root.mk	2006-12-20 16:38:22 UTC (rev 17016)
+++ trunk/buildroot/target/ext2/ext2root.mk	2006-12-20 16:45:47 UTC (rev 17017)
@@ -61,8 +61,6 @@
 EXT2_BASE :=	$(subst ",,$(BR2_TARGET_ROOTFS_EXT2_OUTPUT))
 #")
 
-EXT2_TARGET := $(EXT2_BASE)
-
 EXT2_ROOTFS_COMPRESSOR:=
 EXT2_ROOTFS_COMPRESSOR_EXT:=
 EXT2_ROOTFS_COMPRESSOR_PREREQ:=
@@ -82,6 +80,12 @@
 EXT2_ROOTFS_COMPRESSOR_PREREQ:= lzma-host
 endif
 
+ifneq ($(EXT2_ROOTFS_COMPRESSOR),)
+EXT2_TARGET := $(EXT2_BASE).$(EXT2_ROOTFS_COMPRESSOR_EXT)
+else
+EXT2_TARGET := $(EXT2_BASE)
+endif
+
 $(EXT2_BASE): host-fakeroot makedevs genext2fs
 	- at find $(TARGET_DIR) -type f -perm +111 | xargs $(STRIP) 2>/dev/null || true;
 	@rm -rf $(TARGET_DIR)/usr/man
@@ -116,8 +120,8 @@
 	- at rm -f $(STAGING_DIR)/_fakeroot.$(notdir $(EXT2_TARGET))
 
 ifneq ($(EXT2_ROOTFS_COMPRESSOR),)
-$(EXT2_TARGET).(EXT2_ROOTFS_COMPRESSOR_EXT): $(EXT2_ROOTFS_COMPRESSOR_PREREQ) $(EXT2_BASE)
-	$(EXT2_ROOTFS_COMPRESSOR) $(EXT2_TARGET) > $(EXT2_TARGET).$(EXT2_ROOTFS_COMPRESSOR_EXT)
+$(EXT2_BASE).$(EXT2_ROOTFS_COMPRESSOR_EXT): $(EXT2_ROOTFS_COMPRESSOR_PREREQ) $(EXT2_BASE)
+	$(EXT2_ROOTFS_COMPRESSOR) $(EXT2_BASE) > $(EXT2_TARGET)
 endif
 
 EXT2_COPYTO := $(strip $(subst ",,$(BR2_TARGET_ROOTFS_EXT2_COPYTO)))
