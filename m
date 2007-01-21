From: aldot at uclibc.org <aldot@uclibc.org>
Date: Sun, 21 Jan 2007 15:09:52 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/nfs-utils
Message-ID: <20070121230952.9BADF4859A@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-01-21 15:09:51 -0800 (Sun, 21 Jan 2007)
New Revision: 17445

Log:
- add missing dependency on host-fakeroot


Modified:
   trunk/buildroot/package/nfs-utils/nfs-utils.mk


Changeset:
Modified: trunk/buildroot/package/nfs-utils/nfs-utils.mk
===================================================================
--- trunk/buildroot/package/nfs-utils/nfs-utils.mk	2007-01-21 22:31:03 UTC (rev 17444)
+++ trunk/buildroot/package/nfs-utils/nfs-utils.mk	2007-01-21 23:09:51 UTC (rev 17445)
@@ -20,7 +20,7 @@
 	$(NFS_UTILS_CAT) $(DL_DIR)/$(NFS_UTILS_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
 	toolchain/patch-kernel.sh $(NFS_UTILS_DIR) package/nfs-utils/ nfs-utils*.patch
 	toolchain/patch-kernel.sh $(NFS_UTILS_DIR) $(NFS_UTILS_DIR)/debian/ *.patch
-	touch $(NFS_UTILS_DIR)/.unpacked
+	touch $@
 
 $(NFS_UTILS_DIR)/.configured: $(NFS_UTILS_DIR)/.unpacked
 	(cd $(NFS_UTILS_DIR); rm -rf config.cache; \
@@ -36,7 +36,7 @@
 		--disable-nfsv4 \
 		--disable-gss \
 	);
-	touch $(NFS_UTILS_DIR)/.configured
+	touch $@
 
 $(NFS_UTILS_DIR)/$(NFS_UTILS_BINARY): $(NFS_UTILS_DIR)/.configured
 	$(MAKE) CC=$(TARGET_CC) CC_FOR_BUILD="$(HOSTCC)" \
@@ -65,7 +65,7 @@
 $(TARGET_DIR)/$(NFS_UTILS_TARGET_BINARY): $(STAGING_DIR)/.fakeroot.nfs-utils
 	touch -c $(TARGET_DIR)/$(NFS_UTILS_TARGET_BINARY)
 
-nfs-utils: uclibc $(TARGET_DIR)/$(NFS_UTILS_TARGET_BINARY)
+nfs-utils: uclibc host-fakeroot $(TARGET_DIR)/$(NFS_UTILS_TARGET_BINARY)
 
 nfs-utils-clean:
 	rm -f $(TARGET_DIR)/etc/init.d/S60nfs
