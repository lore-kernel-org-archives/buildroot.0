From: Carlos Santos <casantos@datacom.ind.br>
Date: Wed, 12 Apr 2017 08:42:48 -0300
Subject: [Buildroot] [PATCH v7 1/2] e2fsprogs: refactor to fix conflicts
	with busybox and util-linux
In-Reply-To: <1491997369-21394-1-git-send-email-casantos@datacom.ind.br>
References: <1491997369-21394-1-git-send-email-casantos@datacom.ind.br>
Message-ID: <1491997369-21394-2-git-send-email-casantos@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

So far we attempted to solve the conflicts between busybox and e2fsprogs
by removing busybox programs from /bin and /sbin, leaving the e2fsprogs
ones at /usr/bin and /usr/sbin. This fails with BR2_ROOTFS_MERGED_USR=y,
leading to situations like the one described in bug 9436.

We could provide a better solution by means of a fine-grained selection
of programs, like util-linux does, but this would require big changes in
e2fsprogs. So instead of resorting to dirty tricks we switch to a more
pragmatic approach:

- Use libblkid and libuuid from util-linux for host and target packages.
  This prevents overriding them with e2fsprogs' ones, which may cause
  problems for other packages.

- Drop all configs to select/deselect utilities without corresponding
  enable/disable options to the configure script. In other words, we
  always install the basic set of utilities.

- Do not build UUID utilities, which are disabled along with libuuid.
  The util-linux ones must be used instead.

- Install e2fsprogs utilities at /bin and /sbin, overriding the ones
  eventually installed by busybox.

- Do not create symlinks from mke2fs to mkfs.ext[234], since e2fsprogs'
  installation already creates them (fsck.ext4dev and mkfs.ext4dev were
  dropped in version 1.43.4).

Notice that these changes do exactly the opposite of what is requested
in bug 9436. On the other hand the policy for e2fsprogs becomes coherent
with the one for util-linux: busybox never wins.

Since e2fsprogs depends on util-linux, it's built later. So in order to
have e2fsck from e2fsprogs and the fsck wrapper from util-linux (which
is better maintained and compatible with systemd) we disable e2fsprogs'
fsck if the one from util-linux is selected.

Fixes:
  https://bugs.busybox.net/show_bug.cgi?id=9436 (no fix, in fact)

Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
CC: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
---
Changes v1->v2
  - Add depenndece on !BR2_PACKAGE_UTIL_LINUX_FSCK to
    BR2_PACKAGE_E2FSPROGS_FSCK
  - Add comment telling that the fsck from util-linux has preference.
  - Pass "--enable-fsck" conditionally to configure
  - Remove the guard around the removal of /usr/sbin/fsck, since the
    fsck from busybox and util-linux are installed at /sbin
  - Improve comments and commit message
Changes v2->v3
  - Pass "--disable-fsck" conditionaly to configure too, since enable
    is the default.
  - Do not attempt to remove $(TARGET_DIR)/usr/sbin/fsck, just the
    $(TARGET_DIR)/sbin/fsck from busybox.
Changes v3->v4
   - Improve commit message
Changes v4->v5
   - Extreme overhauling, deeply simplifying the recipe and following
     the suggestion from Arnout Vandecappelle to install e2fsprogs
     utilities on /bin and /sbin.
Changes v5->v6
   - Fix typos and make small changes in commit message
Changes v6->v7
   - Improve/clean comments in Config.in and add a missing depend on
     !BR2_nios2
   - Add explanation in .mk about the dependence on host-util-linux
   - Restore forced link to libintl if BR2_NEEDS_GETTEXT_IF_LOCALE=y
     and BR2_STATIC_LIBS=y.
   - Improve commit message
---
 package/e2fsprogs/Config.in      |  87 ++++++++---------------
 package/e2fsprogs/Config.in.host |   1 +
 package/e2fsprogs/e2fsprogs.mk   | 147 ++++++++++++---------------------------
 3 files changed, 74 insertions(+), 161 deletions(-)

diff --git a/package/e2fsprogs/Config.in b/package/e2fsprogs/Config.in
index d1914a9..03a17c9 100644
--- a/package/e2fsprogs/Config.in
+++ b/package/e2fsprogs/Config.in
@@ -1,101 +1,72 @@
-config BR2_PACKAGE_E2FSPROGS
+menuconfig BR2_PACKAGE_E2FSPROGS
 	bool "e2fsprogs"
 	depends on BR2_USE_MMU # util-linux/libblkid
 	select BR2_PACKAGE_UTIL_LINUX
 	select BR2_PACKAGE_UTIL_LINUX_LIBBLKID
-	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
 	help
 	  The EXT2 file system utilities.
 
-	  http://e2fsprogs.sf.net
+	  The following programs are always built and installed:
+	  badblocks chattr debugfs dumpe2fs e2freefrag e2fsck e2image
+	  e2undo e4crypt e4defrag filefrag fsck fuse2fs logsave lsattr
+	  mke2fs mklost+found resize2fs tune2fs
 
-if BR2_PACKAGE_E2FSPROGS
+	  The uuid utilities (uuidd, uuidgen) are not built. Use the
+	  ones from util-linux, instead.
 
-config BR2_PACKAGE_E2FSPROGS_BADBLOCKS
-	bool "badblocks"
-	default y
+	  Other programs can be selected individually.
 
-config BR2_PACKAGE_E2FSPROGS_CHATTR
-	bool "chattr"
-	default y
+	  http://e2fsprogs.sourceforge.net/
+
+if BR2_PACKAGE_E2FSPROGS
 
 config BR2_PACKAGE_E2FSPROGS_DEBUGFS
 	bool "debugfs"
-
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
+	help
+	  ext2/ext3/ext4 file system debugger
 
 config BR2_PACKAGE_E2FSPROGS_E2IMAGE
 	bool "e2image"
-
-config BR2_PACKAGE_E2FSPROGS_E2LABEL
-	bool "e2label"
-	default y
-
-config BR2_PACKAGE_E2FSPROGS_E2UNDO
-	bool "e2undo"
-	default y
+	help
+	  Save critical ext2/ext3/ext4 filesystem metadata to a file
 
 config BR2_PACKAGE_E2FSPROGS_E4DEFRAG
 	bool "e4defrag"
 	depends on !BR2_nios2 # fallocate not implemented
 	depends on !BR2_TOOLCHAIN_USES_UCLIBC # sync_file_range not impl
+	help
+	  Online defragmenter for ext4 filesystem
 
 comment "e4defrag needs a glibc or musl toolchain"
+	depends on !BR2_nios2
 	depends on BR2_TOOLCHAIN_USES_UCLIBC
 
-config BR2_PACKAGE_E2FSPROGS_FILEFRAG
-	bool "filefrag"
-	default y
-
 config BR2_PACKAGE_E2FSPROGS_FSCK
 	bool "fsck"
+	depends on !BR2_PACKAGE_UTIL_LINUX_FSCK
 	default y
+	help
+	  Check and repair a Linux file system. This is a wrapper around
+	  the filesystem-specific fsck tools.
+
+comment "the fsck from util-linux has preference over this one"
+	depends on BR2_PACKAGE_UTIL_LINUX_FSCK
 
 config BR2_PACKAGE_E2FSPROGS_FUSE2FS
 	bool "fuse2fs"
 	depends on !BR2_STATIC_LIBS # libfuse
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libfuse
 	select BR2_PACKAGE_LIBFUSE
+	help
+	  FUSE file system client for ext2/ext3/ext4 file systems
 
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
-
-config BR2_PACKAGE_E2FSPROGS_TUNE2FS
-	bool "tune2fs"
-	default y
-	select BR2_PACKAGE_E2FSPROGS_E2LABEL
-
-config BR2_PACKAGE_E2FSPROGS_UUIDGEN
-	bool "uuidgen"
 	default y
+	help
+	  ext2/ext3/ext4 file system resizer
 
 endif
diff --git a/package/e2fsprogs/Config.in.host b/package/e2fsprogs/Config.in.host
index de9148e..7591bbc 100644
--- a/package/e2fsprogs/Config.in.host
+++ b/package/e2fsprogs/Config.in.host
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_HOST_E2FSPROGS
 	bool "host e2fsprogs"
+	select BR2_PACKAGE_HOST_UTIL_LINUX
 	help
 	  The EXT2/3/4 file system utilities.
 
diff --git a/package/e2fsprogs/e2fsprogs.mk b/package/e2fsprogs/e2fsprogs.mk
index 3f235c5..2a73683 100644
--- a/package/e2fsprogs/e2fsprogs.mk
+++ b/package/e2fsprogs/e2fsprogs.mk
@@ -10,36 +10,60 @@ E2FSPROGS_SITE = $(BR2_KERNEL_MIRROR)/linux/kernel/people/tytso/e2fsprogs/v$(E2F
 E2FSPROGS_LICENSE = GPL-2.0, BSD-3-Clause (libuuid), MIT-like with advertising clause (libss and libet)
 E2FSPROGS_LICENSE_FILES = NOTICE lib/uuid/COPYING lib/ss/mit-sipb-copyright.h lib/et/internal.h
 E2FSPROGS_INSTALL_STAGING = YES
+
+# Use libblkid and libuuid from util-linux for host and target packages.
+# This prevents overriding them with e2fsprogs' ones, which may cause
+# problems for other packages.
 E2FSPROGS_DEPENDENCIES = host-pkgconf util-linux
-# we don't have a host-util-linux
-HOST_E2FSPROGS_DEPENDENCIES = host-pkgconf
+HOST_E2FSPROGS_DEPENDENCIES = host-pkgconf host-util-linux
+
+# If both e2fsprogs and busybox are selected, make certain e2fsprogs
+# wins the fight over who gets to have their utils actually installed
+ifeq ($(BR2_PACKAGE_BUSYBOX),y)
+E2FSPROGS_DEPENDENCIES += busybox
+endif
+
+ifeq ($(BR2_PACKAGE_E2FSPROGS_FUSE2FS),y)
+E2FSPROGS_DEPENDENCIES += libfuse
+endif
 
 # e4defrag doesn't build on older systems like RHEL5.x, and we don't
 # need it on the host anyway.
 # Disable fuse2fs as well to avoid carrying over deps, and it's unused
-HOST_E2FSPROGS_CONF_OPTS += --disable-defrag --disable-fuse2fs
+# Set the binary directories to "$(HOST_DIR)/bin" and "$(HOST_DIR)/sbin"
+# to match the target paths (the $(HOST_DIR) prefix is required because
+# passing DESTDIR=$(HOST_DIR) in the install command does not work).
+HOST_E2FSPROGS_CONF_OPTS = \
+	--disable-defrag \
+	--disable-fuse2fs \
+	--bindir=$(HOST_DIR)/bin \
+	--sbindir=$(HOST_DIR)/sbin \
+	--enable-symlink-install \
+	--disable-libblkid \
+	--disable-libuuid \
+	--disable-e2initrd-helper \
+	--disable-testio-debug \
+	--disable-rpath
 
+# Set the binary directories to "/bin" and "/sbin" to override programs
+# installed by busybox.
 E2FSPROGS_CONF_OPTS = \
-	$(if $(BR2_STATIC_LIBS),,--enable-elf-shlibs) \
-	$(if $(BR2_PACKAGE_E2FSPROGS_DEBUGFS),,--disable-debugfs) \
-	$(if $(BR2_PACKAGE_E2FSPROGS_E2IMAGE),,--disable-imager) \
-	$(if $(BR2_PACKAGE_E2FSPROGS_E4DEFRAG),,--disable-defrag) \
-	$(if $(BR2_PACKAGE_E2FSPROGS_RESIZE2FS),,--disable-resizer) \
-	--disable-uuidd \
+	$(if $(BR2_STATIC_LIBS),--disable-elf-shlibs,--enable-elf-shlibs) \
+	$(if $(BR2_PACKAGE_E2FSPROGS_DEBUGFS),--enable-debugfs,--disable-debugfs) \
+	$(if $(BR2_PACKAGE_E2FSPROGS_E2IMAGE),--enable-imager,--disable-imager) \
+	$(if $(BR2_PACKAGE_E2FSPROGS_E4DEFRAG),--enable-defrag,--disable-defrag) \
+	$(if $(BR2_PACKAGE_E2FSPROGS_FSCK),--enable-fsck,--disable-fsck) \
+	$(if $(BR2_PACKAGE_E2FSPROGS_FUSE2FS),--enable-fuse2fs,--disable-fuse2fs) \
+	$(if $(BR2_PACKAGE_E2FSPROGS_RESIZE2FS),--enable-resizer,--disable-resizer) \
+	--bindir=/bin \
+	--sbindir=/sbin \
+	--enable-symlink-install \
 	--disable-libblkid \
 	--disable-libuuid \
-	--enable-fsck \
 	--disable-e2initrd-helper \
 	--disable-testio-debug \
 	--disable-rpath
 
-ifeq ($(BR2_PACKAGE_E2FSPROGS_FUSE2FS),y)
-E2FSPROGS_CONF_OPTS += --enable-fuse2fs
-E2FSPROGS_DEPENDENCIES += libfuse
-else
-E2FSPROGS_CONF_OPTS += --disable-fuse2fs
-endif
-
 ifeq ($(BR2_nios2),y)
 E2FSPROGS_CONF_ENV += ac_cv_func_fallocate=no
 endif
@@ -56,17 +80,19 @@ HOST_E2FSPROGS_CONF_ENV += \
 	ac_cv_header_magic_h=no \
 	ac_cv_lib_magic_magic_file=no
 
-ifeq ($(BR2_NEEDS_GETTEXT_IF_LOCALE),y)
+ifeq ($(BR2_NEEDS_GETTEXT_IF_LOCALE)$(BR2_STATIC_LIBS),yy)
 # util-linux libuuid pulls in libintl if needed, so ensure we also
 # link against it, otherwise static linking fails
 E2FSPROGS_CONF_ENV += LIBS=-lintl
 endif
 
 E2FSPROGS_MAKE_OPTS = LDCONFIG=true
+
 E2FSPROGS_INSTALL_STAGING_OPTS = \
 	DESTDIR=$(STAGING_DIR) \
 	LDCONFIG=true \
 	install-libs
+
 E2FSPROGS_INSTALL_TARGET_OPTS = \
 	DESTDIR=$(TARGET_DIR) \
 	LDCONFIG=true \
@@ -76,90 +102,5 @@ define HOST_E2FSPROGS_INSTALL_CMDS
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
-E2FSPROGS_BINTARGETS_$(BR2_PACKAGE_E2FSPROGS_UUIDGEN) += usr/bin/uuidgen
-
-# files to remove
-E2FSPROGS_TXTTARGETS_ = \
-	usr/sbin/mkfs.ext[234] \
-	usr/sbin/mkfs.ext4dev \
-	usr/sbin/fsck.ext[234] \
-	usr/sbin/fsck.ext4dev \
-	usr/sbin/tune2fs
-
-define E2FSPROGS_TARGET_REMOVE_UNNEEDED
-	rm -f $(addprefix $(TARGET_DIR)/, $(E2FSPROGS_BINTARGETS_))
-	rm -f $(addprefix $(TARGET_DIR)/, $(E2FSPROGS_TXTTARGETS_))
-endef
-
-E2FSPROGS_POST_INSTALL_TARGET_HOOKS += E2FSPROGS_TARGET_REMOVE_UNNEEDED
-
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
2.7.4
