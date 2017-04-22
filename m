From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sat, 22 Apr 2017 13:59:49 +0200
Subject: [Buildroot] [PATCH v8 06/12] e2fsprogs: let it create symlinks
In-Reply-To: <20170422115955.22718-1-arnout@mind.be>
References: <20170422115955.22718-1-arnout@mind.be>
Message-ID: <20170422115955.22718-7-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Carlos Santos <casantos@datacom.ind.br>

We have post-install hooks to create the symlinks mkfs.ext2 -> mke2fs
etc. However, the e2fsprogs build system creates those symlinks itself.
So just rely on that.

fsck.ext4dev and mkfs.ext4dev were dropped in version 1.43.4.

Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
[Arnout: keep configure options more or less alphabetical]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/e2fsprogs/e2fsprogs.mk | 45 ++++--------------------------------------
 1 file changed, 4 insertions(+), 41 deletions(-)

diff --git a/package/e2fsprogs/e2fsprogs.mk b/package/e2fsprogs/e2fsprogs.mk
index 5231a97f9c..d9efb00a2a 100644
--- a/package/e2fsprogs/e2fsprogs.mk
+++ b/package/e2fsprogs/e2fsprogs.mk
@@ -24,7 +24,8 @@ HOST_E2FSPROGS_CONF_OPTS = \
 	--disable-defrag \
 	--disable-fuse2fs \
 	--disable-libblkid \
-	--disable-libuuid
+	--disable-libuuid \
+	--enable-symlink-install
 
 E2FSPROGS_CONF_OPTS = \
 	$(if $(BR2_STATIC_LIBS),,--enable-elf-shlibs) \
@@ -38,7 +39,8 @@ E2FSPROGS_CONF_OPTS = \
 	--enable-fsck \
 	--disable-e2initrd-helper \
 	--disable-testio-debug \
-	--disable-rpath
+	--disable-rpath \
+	--enable-symlink-install
 
 ifeq ($(BR2_PACKAGE_E2FSPROGS_FUSE2FS),y)
 E2FSPROGS_CONF_OPTS += --enable-fuse2fs
@@ -99,43 +101,12 @@ E2FSPROGS_BINTARGETS_$(BR2_PACKAGE_E2FSPROGS_LSATTR) += usr/bin/lsattr
 E2FSPROGS_BINTARGETS_$(BR2_PACKAGE_E2FSPROGS_MKE2FS) += usr/sbin/mke2fs
 E2FSPROGS_BINTARGETS_$(BR2_PACKAGE_E2FSPROGS_MKLOSTFOUND) += usr/sbin/mklost+found
 
-# files to remove
-E2FSPROGS_TXTTARGETS_ = \
-	usr/sbin/mkfs.ext[234] \
-	usr/sbin/mkfs.ext4dev \
-	usr/sbin/fsck.ext[234] \
-	usr/sbin/fsck.ext4dev \
-	usr/sbin/tune2fs
-
 define E2FSPROGS_TARGET_REMOVE_UNNEEDED
 	rm -f $(addprefix $(TARGET_DIR)/, $(E2FSPROGS_BINTARGETS_))
-	rm -f $(addprefix $(TARGET_DIR)/, $(E2FSPROGS_TXTTARGETS_))
 endef
 
 E2FSPROGS_POST_INSTALL_TARGET_HOOKS += E2FSPROGS_TARGET_REMOVE_UNNEEDED
 
-define E2FSPROGS_TARGET_MKE2FS_SYMLINKS
-	ln -sf mke2fs $(TARGET_DIR)/usr/sbin/mkfs.ext2
-	ln -sf mke2fs $(TARGET_DIR)/usr/sbin/mkfs.ext3
-	ln -sf mke2fs $(TARGET_DIR)/usr/sbin/mkfs.ext4
-	ln -sf mke2fs $(TARGET_DIR)/usr/sbin/mkfs.ext4dev
-endef
-
-ifeq ($(BR2_PACKAGE_E2FSPROGS_MKE2FS),y)
-E2FSPROGS_POST_INSTALL_TARGET_HOOKS += E2FSPROGS_TARGET_MKE2FS_SYMLINKS
-endif
-
-define E2FSPROGS_TARGET_E2FSCK_SYMLINKS
-	ln -sf e2fsck $(TARGET_DIR)/usr/sbin/fsck.ext2
-	ln -sf e2fsck $(TARGET_DIR)/usr/sbin/fsck.ext3
-	ln -sf e2fsck $(TARGET_DIR)/usr/sbin/fsck.ext4
-	ln -sf e2fsck $(TARGET_DIR)/usr/sbin/fsck.ext4dev
-endef
-
-ifeq ($(BR2_PACKAGE_E2FSPROGS_E2FSCK),y)
-E2FSPROGS_POST_INSTALL_TARGET_HOOKS += E2FSPROGS_TARGET_E2FSCK_SYMLINKS
-endif
-
 # If BusyBox is included, its configuration may supply its own variant
 # of ext2-related tools. Since Buildroot desires having full blown
 # variants take precedence (in this case, e2fsprogs), we want to remove
@@ -159,13 +130,5 @@ endef
 E2FSPROGS_PRE_INSTALL_TARGET_HOOKS += E2FSPROGS_REMOVE_BUSYBOX_APPLETS
 endif
 
-define E2FSPROGS_TARGET_TUNE2FS_SYMLINK
-	ln -sf e2label $(TARGET_DIR)/usr/sbin/tune2fs
-endef
-
-ifeq ($(BR2_PACKAGE_E2FSPROGS_TUNE2FS),y)
-E2FSPROGS_POST_INSTALL_TARGET_HOOKS += E2FSPROGS_TARGET_TUNE2FS_SYMLINK
-endif
-
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
-- 
2.11.0
