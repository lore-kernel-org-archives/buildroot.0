From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sat, 22 Apr 2017 13:59:50 +0200
Subject: [Buildroot] [PATCH v8 07/12] e2fsprogs: refactor to fix conflicts
	with busybox and util-linux
In-Reply-To: <20170422115955.22718-1-arnout@mind.be>
References: <20170422115955.22718-1-arnout@mind.be>
Message-ID: <20170422115955.22718-8-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Carlos Santos <casantos@datacom.ind.br>

So far we attempted to solve the conflicts between busybox and e2fsprogs
by removing busybox programs from /bin and /sbin, leaving the e2fsprogs
ones at /usr/bin and /usr/sbin. This fails with BR2_ROOTFS_MERGED_USR=y,
leading to situations like the one described in bug 9436.

We could provide a better solution by means of a fine-grained selection
of programs, like util-linux does, but this would require big changes in
e2fsprogs. So instead of resorting to dirty tricks we switch to a more
pragmatic approach:

- Drop all configs to select/deselect utilities without corresponding
  enable/disable options to the configure script. In other words, we
  always install the basic set of utilities.

- fsck has a configure option, so use it. Note that --enable-fsck is
  only about the wrapper, not about e2fsck.

- Install e2fsprogs utilities at /bin and /sbin, overriding the ones
  eventually installed by busybox.

Notice that these changes do exactly the opposite of what is requested
in bug 9436. On the other hand the policy for e2fsprogs becomes coherent
with the one for util-linux: busybox never wins.

Fixes:
  https://bugs.busybox.net/show_bug.cgi?id=9436 (no fix, in fact)

Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
[Arnout:
 - don't add 'default y' to resize2fs;
 - don't install the host package in /bin instead of /usr/bin - we
   install everything under /usr (until /usr will be removed, soon)]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
Splitting up the change of installation paths from the removal of some
enable/disable options is slightly more involved, so I chose to keep
these two changes in a single commit. -- Arnout
---
 package/e2fsprogs/Config.in    | 60 +++++-------------------------------------
 package/e2fsprogs/e2fsprogs.mk | 57 ++++++++-------------------------------
 2 files changed, 18 insertions(+), 99 deletions(-)

diff --git a/package/e2fsprogs/Config.in b/package/e2fsprogs/Config.in
index 79b77eac4c..676327dc2f 100644
--- a/package/e2fsprogs/Config.in
+++ b/package/e2fsprogs/Config.in
@@ -7,47 +7,26 @@ menuconfig BR2_PACKAGE_E2FSPROGS
 	help
 	  The EXT2 file system utilities.
 
+	  The following programs are always built and installed:
+	  badblocks chattr debugfs dumpe2fs e2freefrag e2fsck e2image
+	  e2undo e4crypt e4defrag filefrag fsck fuse2fs logsave lsattr
+	  mke2fs mklost+found resize2fs tune2fs
+
 	  The uuid utilities (uuidd, uuidgen) are not built. Use the
 	  ones from util-linux, instead.
 
+	  Other programs can be selected individually.
+
 	  http://e2fsprogs.sourceforge.net
 
 if BR2_PACKAGE_E2FSPROGS
 
-config BR2_PACKAGE_E2FSPROGS_BADBLOCKS
-	bool "badblocks"
-	default y
-
-config BR2_PACKAGE_E2FSPROGS_CHATTR
-	bool "chattr"
-	default y
-
 config BR2_PACKAGE_E2FSPROGS_DEBUGFS
 	bool "debugfs"
 
-config BR2_PACKAGE_E2FSPROGS_DUMPE2FS
-	bool "dumpe2fs"
-	default y
-
-config BR2_PACKAGE_E2FSPROGS_E2FREEFRAG
-	bool "e2freefrag"
-	default y
-
-config BR2_PACKAGE_E2FSPROGS_E2FSCK
-	bool "e2fsck"
-	default y
-
 config BR2_PACKAGE_E2FSPROGS_E2IMAGE
 	bool "e2image"
 
-config BR2_PACKAGE_E2FSPROGS_E2LABEL
-	bool "e2label"
-	default y
-
-config BR2_PACKAGE_E2FSPROGS_E2UNDO
-	bool "e2undo"
-	default y
-
 config BR2_PACKAGE_E2FSPROGS_E4DEFRAG
 	bool "e4defrag"
 	depends on !BR2_nios2 # fallocate not implemented
@@ -57,10 +36,6 @@ comment "e4defrag needs a glibc or musl toolchain"
 	depends on !BR2_nios2
 	depends on BR2_TOOLCHAIN_USES_UCLIBC
 
-config BR2_PACKAGE_E2FSPROGS_FILEFRAG
-	bool "filefrag"
-	default y
-
 config BR2_PACKAGE_E2FSPROGS_FSCK
 	bool "fsck"
 	default y
@@ -74,28 +49,7 @@ config BR2_PACKAGE_E2FSPROGS_FUSE2FS
 comment "fuse2fs needs a toolchain w/ threads, dynamic library"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
 
-config BR2_PACKAGE_E2FSPROGS_LOGSAVE
-	bool "logsave"
-	default y
-
-config BR2_PACKAGE_E2FSPROGS_LSATTR
-	bool "lsattr"
-	default y
-
-config BR2_PACKAGE_E2FSPROGS_MKE2FS
-	bool "mke2fs"
-	default y
-
-config BR2_PACKAGE_E2FSPROGS_MKLOSTFOUND
-	bool "mklost+found"
-	default y
-
 config BR2_PACKAGE_E2FSPROGS_RESIZE2FS
 	bool "resize2fs"
 
-config BR2_PACKAGE_E2FSPROGS_TUNE2FS
-	bool "tune2fs"
-	default y
-	select BR2_PACKAGE_E2FSPROGS_E2LABEL
-
 endif
diff --git a/package/e2fsprogs/e2fsprogs.mk b/package/e2fsprogs/e2fsprogs.mk
index d9efb00a2a..e0a7fa9354 100644
--- a/package/e2fsprogs/e2fsprogs.mk
+++ b/package/e2fsprogs/e2fsprogs.mk
@@ -17,6 +17,12 @@ E2FSPROGS_INSTALL_STAGING = YES
 E2FSPROGS_DEPENDENCIES = host-pkgconf util-linux
 HOST_E2FSPROGS_DEPENDENCIES = host-pkgconf host-util-linux
 
+# If both e2fsprogs and busybox are selected, make certain e2fsprogs
+# wins the fight over who gets to have their utils actually installed
+ifeq ($(BR2_PACKAGE_BUSYBOX),y)
+E2FSPROGS_DEPENDENCIES += busybox
+endif
+
 # e4defrag doesn't build on older systems like RHEL5.x, and we don't
 # need it on the host anyway.
 # Disable fuse2fs as well to avoid carrying over deps, and it's unused
@@ -27,16 +33,20 @@ HOST_E2FSPROGS_CONF_OPTS = \
 	--disable-libuuid \
 	--enable-symlink-install
 
+# Set the binary directories to "/bin" and "/sbin" to override programs
+# installed by busybox.
 E2FSPROGS_CONF_OPTS = \
+	--bindir=/bin \
+	--sbindir=/sbin \
 	$(if $(BR2_STATIC_LIBS),,--enable-elf-shlibs) \
 	$(if $(BR2_PACKAGE_E2FSPROGS_DEBUGFS),,--disable-debugfs) \
 	$(if $(BR2_PACKAGE_E2FSPROGS_E2IMAGE),,--disable-imager) \
 	$(if $(BR2_PACKAGE_E2FSPROGS_E4DEFRAG),,--disable-defrag) \
+	$(if $(BR2_PACKAGE_E2FSPROGS_FSCK),--enable-fsck,--disable-fsck) \
 	$(if $(BR2_PACKAGE_E2FSPROGS_RESIZE2FS),,--disable-resizer) \
 	--disable-uuidd \
 	--disable-libblkid \
 	--disable-libuuid \
-	--enable-fsck \
 	--disable-e2initrd-helper \
 	--disable-testio-debug \
 	--disable-rpath \
@@ -85,50 +95,5 @@ define HOST_E2FSPROGS_INSTALL_CMDS
 	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) install install-libs
 endef
 
-# binaries to keep or remove
-E2FSPROGS_BINTARGETS_$(BR2_PACKAGE_E2FSPROGS_BADBLOCKS) += usr/sbin/badblocks
-E2FSPROGS_BINTARGETS_$(BR2_PACKAGE_E2FSPROGS_CHATTR) += usr/bin/chattr
-E2FSPROGS_BINTARGETS_$(BR2_PACKAGE_E2FSPROGS_DUMPE2FS) += usr/sbin/dumpe2fs
-E2FSPROGS_BINTARGETS_$(BR2_PACKAGE_E2FSPROGS_E2FREEFRAG) += usr/sbin/e2freefrag
-E2FSPROGS_BINTARGETS_$(BR2_PACKAGE_E2FSPROGS_E2FSCK) += usr/sbin/e2fsck
-E2FSPROGS_BINTARGETS_$(BR2_PACKAGE_E2FSPROGS_E2LABEL) += usr/sbin/e2label
-E2FSPROGS_BINTARGETS_$(BR2_PACKAGE_E2FSPROGS_E2UNDO) += usr/sbin/e2undo
-E2FSPROGS_BINTARGETS_$(BR2_PACKAGE_E2FSPROGS_E4DEFRAG) += usr/sbin/e4defrag
-E2FSPROGS_BINTARGETS_$(BR2_PACKAGE_E2FSPROGS_FILEFRAG) += usr/sbin/filefrag
-E2FSPROGS_BINTARGETS_$(BR2_PACKAGE_E2FSPROGS_FSCK) += usr/sbin/fsck
-E2FSPROGS_BINTARGETS_$(BR2_PACKAGE_E2FSPROGS_LOGSAVE) += usr/sbin/logsave
-E2FSPROGS_BINTARGETS_$(BR2_PACKAGE_E2FSPROGS_LSATTR) += usr/bin/lsattr
-E2FSPROGS_BINTARGETS_$(BR2_PACKAGE_E2FSPROGS_MKE2FS) += usr/sbin/mke2fs
-E2FSPROGS_BINTARGETS_$(BR2_PACKAGE_E2FSPROGS_MKLOSTFOUND) += usr/sbin/mklost+found
-
-define E2FSPROGS_TARGET_REMOVE_UNNEEDED
-	rm -f $(addprefix $(TARGET_DIR)/, $(E2FSPROGS_BINTARGETS_))
-endef
-
-E2FSPROGS_POST_INSTALL_TARGET_HOOKS += E2FSPROGS_TARGET_REMOVE_UNNEEDED
-
-# If BusyBox is included, its configuration may supply its own variant
-# of ext2-related tools. Since Buildroot desires having full blown
-# variants take precedence (in this case, e2fsprogs), we want to remove
-# BusyBox's variant of e2fsprogs provided binaries. e2fsprogs targets
-# /usr/{bin,sbin} where BusyBox targets /{bin,sbin}. We will attempt to
-# remove BusyBox-generated ext2-related tools from /{bin,sbin}. We need
-# to do this in the pre-install stage to ensure we do not accidentally
-# remove e2fsprogs's binaries in usr-merged environments (ie. if they
-# are removed, they would be re-installed in this package's install
-# stage).
-ifeq ($(BR2_PACKAGE_BUSYBOX),y)
-E2FSPROGS_DEPENDENCIES += busybox
-
-define E2FSPROGS_REMOVE_BUSYBOX_APPLETS
-	$(RM) -f $(TARGET_DIR)/bin/chattr
-	$(RM) -f $(TARGET_DIR)/bin/lsattr
-	$(RM) -f $(TARGET_DIR)/sbin/fsck
-	$(RM) -f $(TARGET_DIR)/sbin/tune2fs
-	$(RM) -f $(TARGET_DIR)/sbin/e2label
-endef
-E2FSPROGS_PRE_INSTALL_TARGET_HOOKS += E2FSPROGS_REMOVE_BUSYBOX_APPLETS
-endif
-
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
-- 
2.11.0
