From: aldot at uclibc.org <aldot@uclibc.org>
Date: Tue, 15 May 2007 05:50:05 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/e2fsprogs
Message-ID: <20070515125005.8AECA4808C@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-05-15 05:50:04 -0700 (Tue, 15 May 2007)
New Revision: 18629

Log:
- repvik writes: e2fsprogs install several duplicate binaries that act slightly differently depending on what name they're called as. They can safely be removed and replaced with symlinks. This saves 480kb space.
 Closes #1341


Modified:
   trunk/buildroot/package/e2fsprogs/e2fsprogs.mk


Changeset:
Modified: trunk/buildroot/package/e2fsprogs/e2fsprogs.mk
===================================================================
--- trunk/buildroot/package/e2fsprogs/e2fsprogs.mk	2007-05-15 12:05:06 UTC (rev 18628)
+++ trunk/buildroot/package/e2fsprogs/e2fsprogs.mk	2007-05-15 12:50:04 UTC (rev 18629)
@@ -24,7 +24,7 @@
 	$(E2FSPROGS_CAT) $(DL_DIR)/$(E2FSPROGS_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
 	toolchain/patch-kernel.sh $(E2FSPROGS_DIR) package/e2fsprogs/ e2fsprogs\*.patch
 	$(CONFIG_UPDATE) $(E2FSPROGS_DIR)/config
-	touch $(E2FSPROGS_DIR)/.unpacked
+	touch $@
 
 $(E2FSPROGS_DIR)/.configured: $(E2FSPROGS_DIR)/.unpacked
 	(cd $(E2FSPROGS_DIR); rm -rf config.cache; \
@@ -55,7 +55,7 @@
 		--without-catgets $(DISABLE_NLS) \
 		$(DISABLE_LARGEFILE) \
 	);
-	touch $(E2FSPROGS_DIR)/.configured
+	touch $@
 
 $(E2FSPROGS_DIR)/$(E2FSPROGS_BINARY): $(E2FSPROGS_DIR)/.configured
 	$(MAKE1) PATH=$(TARGET_PATH) -C $(E2FSPROGS_DIR)
@@ -68,6 +68,14 @@
 
 $(TARGET_DIR)/$(E2FSPROGS_TARGET_BINARY): $(E2FSPROGS_DIR)/$(E2FSPROGS_BINARY)
 	$(MAKE1) PATH=$(TARGET_PATH) DESTDIR=$(TARGET_DIR) -C $(E2FSPROGS_DIR) install
+	rm -rf ${TARGET_DIR}/sbin/mkfs.ext[23] ${TARGET_DIR}/sbin/fsck.ext[23] \
+		${TARGET_DIR}/sbin/findfs ${TARGET_DIR}/sbin/tune2fs
+	ln -sf mke2fs ${TARGET_DIR}/sbin/mkfs.ext2
+	ln -sf mke2fs ${TARGET_DIR}/sbin/mkfs.ext3
+	ln -sf e2fsck ${TARGET_DIR}/sbin/fsck.ext2
+	ln -sf e2fsck ${TARGET_DIR}/sbin/fsck.ext3
+	ln -sf e2label ${TARGET_DIR}/sbin/tune2fs
+	ln -sf e2label ${TARGET_DIR}/sbin/findfs
 	rm -rf $(TARGET_DIR)/share/locale $(TARGET_DIR)/usr/info \
 		$(TARGET_DIR)/usr/man $(TARGET_DIR)/usr/share/doc
 	touch -c $(TARGET_DIR)/$(E2FSPROGS_TARGET_BINARY)
