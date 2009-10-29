From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 29 Oct 2009 21:35:33 +0100
Subject: [Buildroot] [git commit master] e2fsprogs: convert to
	Makefile.autotools.in format and update Kconfig
Message-ID: <20091029203854.BF07B776F5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=69ec17cd8d9140d50d5a28ee4e7ada527e9a3a06
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Closes #667.

I have updated the e2fsprogs package to the new makefile format. I added
the tools from the 1.41.9 release of e2fsprogs that could not yet be
(de)selected (freefrag, e2undo) to the menu in Config.in.

Signed-off-by: rvpaasen <rvpaasen@t3i.nl>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                        |    1 +
 package/e2fsprogs/Config.in    |   58 +++++++++-
 package/e2fsprogs/e2fsprogs.mk |  233 +++++++++++++---------------------------
 3 files changed, 131 insertions(+), 161 deletions(-)

diff --git a/CHANGES b/CHANGES
index fbe1b32..d3af70a 100644
--- a/CHANGES
+++ b/CHANGES
@@ -33,6 +33,7 @@
 	#655: Update sqlite package to version 3.6.18
 	#657: Bug in imagemagick-clean target
 	#665: [PATCH] Samba package
+	#667: [PATCH] e2fsprogs
 
 2009.08, Released August 31th, 2009:
 
diff --git a/package/e2fsprogs/Config.in b/package/e2fsprogs/Config.in
index 74da6bd..e83ad4f 100644
--- a/package/e2fsprogs/Config.in
+++ b/package/e2fsprogs/Config.in
@@ -1,15 +1,18 @@
-config BR2_PACKAGE_LIBUUID
-	bool "libuuid"
-	help
-	  The uuid library from the e2fsprogs suite
 
 config BR2_PACKAGE_E2FSPROGS
 	bool "e2fsprogs"
 	depends on BR2_LARGEFILE
-	select BR2_PACKAGE_LIBUUID
 	help
 	  The EXT2 file system utilities and libraries
 
+menuconfig BR2_PACKAGE_E2FSPROGS_UTILS
+	bool "e2fsprogs utilities"
+	depends on BR2_PACKAGE_E2FSPROGS
+	help
+	  e2fsprogs utilities selection
+
+if BR2_PACKAGE_E2FSPROGS_UTILS
+
 config BR2_PACKAGE_E2FSPROGS_BADBLOCKS
 	bool "badblocks"
 	default y
@@ -19,6 +22,7 @@ config BR2_PACKAGE_E2FSPROGS_BLKID
 	bool "blkid"
 	default y
 	depends on BR2_PACKAGE_E2FSPROGS
+	select BR2_PACKAGE_E2FSPROGS_LIBBLKID
 
 config BR2_PACKAGE_E2FSPROGS_CHATTR
 	bool "chattr"
@@ -29,16 +33,30 @@ config BR2_PACKAGE_E2FSPROGS_DUMPE2FS
 	bool "dumpe2fs"
 	default y
 	depends on BR2_PACKAGE_E2FSPROGS
+	select BR2_PACKAGE_E2FSPROGS_LIBUUID
+
+config BR2_PACKAGE_E2FSPROGS_E2FREEFRAG
+	bool "e2freefrag"
+	default y
+	depends on BR2_PACKAGE_E2FSPROGS
+
 
 config BR2_PACKAGE_E2FSPROGS_E2FSCK
 	bool "e2fsck"
 	default y
 	depends on BR2_PACKAGE_E2FSPROGS
+	select BR2_PACKAGE_E2FSPROGS_LIBBLKID
 
 config BR2_PACKAGE_E2FSPROGS_E2LABEL
 	bool "e2label"
 	default y
 	depends on BR2_PACKAGE_E2FSPROGS
+	select BR2_PACKAGE_E2FSPROGS_LIBBLKID
+
+config BR2_PACKAGE_E2FSPROGS_E2UNDO
+	bool "e2label"
+	default y
+	depends on BR2_PACKAGE_E2FSPROGS
 
 config BR2_PACKAGE_E2FSPROGS_FILEFRAG
 	bool "filefrag"
@@ -55,6 +73,7 @@ config BR2_PACKAGE_E2FSPROGS_FSCK
 	bool "fsck"
 	default y
 	depends on BR2_PACKAGE_E2FSPROGS
+	select BR2_PACKAGE_E2FSPROGS_LIBBLKID
 
 config BR2_PACKAGE_E2FSPROGS_LOGSAVE
 	bool "logsave"
@@ -70,6 +89,7 @@ config BR2_PACKAGE_E2FSPROGS_MKE2FS
 	bool "mke2fs"
 	default y
 	depends on BR2_PACKAGE_E2FSPROGS
+	select BR2_PACKAGE_E2FSPROGS_LIBBLKID
 
 config BR2_PACKAGE_E2FSPROGS_MKLOSTFOUND
 	bool "mklost+found"
@@ -86,6 +106,34 @@ config BR2_PACKAGE_E2FSPROGS_UUIDGEN
 	bool "uuidgen"
 	default y
 	depends on BR2_PACKAGE_E2FSPROGS
+	select BR2_PACKAGE_E2FSPROGS_LIBUUID
+
+config BR2_PACKAGE_E2FSPROGS_UUIDD
+	bool "uuidd"
+	default y
+	depends on BR2_PACKAGE_E2FSPROGS
+	select BR2_PACKAGE_E2FSPROGS_LIBUUID
+	help
+	  The uuidd daemon from the e2fsprogs suite
+
+endif
+
+menu "e2fsprogs libraries"
+	depends on BR2_PACKAGE_E2FSPROGS
+
+config BR2_PACKAGE_E2FSPROGS_LIBUUID
+	bool "libuuid"
+	help
+	  The uuid library from the e2fsprogs suite
+
+config BR2_PACKAGE_E2FSPROGS_LIBBLKID
+	bool "libblkid"
+	select BR2_PACKAGE_E2FSPROGS_LIBUUID
+	help
+	  The blkid library from the e2fsprogs suite
+
+endmenu
 
 comment "e2fsprogs requires a toolchain with LARGEFILE support"
 	depends on !BR2_LARGEFILE
+
diff --git a/package/e2fsprogs/e2fsprogs.mk b/package/e2fsprogs/e2fsprogs.mk
index ca7a37e..fd03f02 100644
--- a/package/e2fsprogs/e2fsprogs.mk
+++ b/package/e2fsprogs/e2fsprogs.mk
@@ -6,169 +6,90 @@
 E2FSPROGS_VERSION:=1.41.9
 E2FSPROGS_SOURCE=e2fsprogs-$(E2FSPROGS_VERSION).tar.gz
 E2FSPROGS_SITE=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/e2fsprogs
-E2FSPROGS_DIR=$(BUILD_DIR)/e2fsprogs-$(E2FSPROGS_VERSION)
-E2FSPROGS_CAT:=$(ZCAT)
-E2FSPROGS_BINARY:=misc/mke2fs
-E2FSPROGS_TARGET_BINARY:=sbin/mke2fs
-LIBUUID_DIR=$(E2FSPROGS_DIR)/lib/uuid/
-LIBUUID_TARGET_BINARY:=usr/lib/libuuid.so
 
-E2FSPROGS_MISC_STRIP:= \
-	badblocks blkid chattr dumpe2fs filefrag fsck logsave \
-	lsattr mke2fs mklost+found tune2fs uuidgen
-
-$(DL_DIR)/$(E2FSPROGS_SOURCE):
-	 $(call DOWNLOAD,$(E2FSPROGS_SITE),$(E2FSPROGS_SOURCE))
-
-e2fsprogs-source: $(DL_DIR)/$(E2FSPROGS_SOURCE)
-
-$(E2FSPROGS_DIR)/.unpacked: $(DL_DIR)/$(E2FSPROGS_SOURCE)
-	$(E2FSPROGS_CAT) $(DL_DIR)/$(E2FSPROGS_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	toolchain/patch-kernel.sh $(E2FSPROGS_DIR) package/e2fsprogs/ e2fsprogs\*.patch
-	$(CONFIG_UPDATE) $(E2FSPROGS_DIR)/config
-	touch $@
-
-$(E2FSPROGS_DIR)/.configured: $(E2FSPROGS_DIR)/.unpacked
-	(cd $(E2FSPROGS_DIR); rm -rf config.cache; \
-		$(TARGET_CONFIGURE_OPTS) \
-		$(TARGET_CONFIGURE_ARGS) \
-		CFLAGS="$(TARGET_CFLAGS)" \
-		./configure $(QUIET) \
-		--target=$(GNU_TARGET_NAME) \
-		--host=$(GNU_TARGET_NAME) \
-		--build=$(GNU_HOST_NAME) \
-		--with-cc=$(TARGET_CC) \
-		--with-linker=$(TARGET_CROSS)ld \
-		--prefix=/usr \
-		--exec-prefix=/usr \
-		--bindir=/bin \
-		--sbindir=/sbin \
-		--libdir=/usr/lib \
-		--libexecdir=/usr/lib \
-		--sysconfdir=/etc \
-		--datadir=/usr/share \
-		--localstatedir=/var \
-		--mandir=/usr/share/man \
-		--infodir=/usr/share/info \
-		--disable-tls \
-		--enable-elf-shlibs --enable-dynamic-e2fsck --disable-swapfs \
-		--disable-debugfs --disable-imager \
-		--disable-resizer --enable-fsck \
-		--disable-e2initrd-helper \
-		--without-catgets $(DISABLE_NLS) \
-		$(DISABLE_LARGEFILE) \
-	)
-	# do away with hiding the commands
-	find $(E2FSPROGS_DIR) -name Makefile \
-		| xargs $(SED) '/^[[:space:]]*@/s/@/$$\(Q\)/'
-	touch $@
-
-$(E2FSPROGS_DIR)/$(E2FSPROGS_BINARY): $(E2FSPROGS_DIR)/.configured
-	$(MAKE1) -C $(E2FSPROGS_DIR)
-	(cd $(E2FSPROGS_DIR)/misc; \
-		$(STRIPCMD) $(E2FSPROGS_MISC_STRIP); \
-	)
-	#$(STRIPCMD) $(E2FSPROGS_DIR)/lib/lib*.so.*.*
-	touch -c $@
-
-$(E2FSPROGS_DIR)/lib/libuuid.so: $(E2FSPROGS_DIR)/.configured
-	$(MAKE1) -C $(E2FSPROGS_DIR)/lib/uuid
-	touch -c $@
-
-$(STAGING_DIR)/$(E2FSPROGS_TARGET_BINARY): $(E2FSPROGS_DIR)/$(E2FSPROGS_BINARY)
-	$(MAKE1) PATH=$(TARGET_PATH) DESTDIR=$(STAGING_DIR) LDCONFIG=true \
-		-C $(E2FSPROGS_DIR) install
-	touch -c $@
-
-$(STAGING_DIR)/$(LIBUUID_TARGET_BINARY): $(E2FSPROGS_DIR)/lib/libuuid.so
-	$(MAKE1) PATH=$(TARGET_PATH) DESTDIR=$(STAGING_DIR) LDCONFIG=true \
-		-C $(LIBUUID_DIR) install
-	touch -c $@
-
-E2FSPROGS_RM$(BR2_PACKAGE_E2FSPROGS_BADBLOCKS) += ${TARGET_DIR}/sbin/badblocks
-E2FSPROGS_RM$(BR2_PACKAGE_E2FSPROGS_BLKID) += ${TARGET_DIR}/sbin/blkid
-E2FSPROGS_RM$(BR2_PACKAGE_E2FSPROGS_CHATTR) += ${TARGET_DIR}/bin/chattr
-E2FSPROGS_RM$(BR2_PACKAGE_E2FSPROGS_DUMPE2FS) += ${TARGET_DIR}/sbin/dumpe2fs
-E2FSPROGS_RM$(BR2_PACKAGE_E2FSPROGS_E2LABEL) += ${TARGET_DIR}/sbin/e2label
-E2FSPROGS_RM$(BR2_PACKAGE_E2FSPROGS_E2FSCK) += ${TARGET_DIR}/sbin/e2fsck
-E2FSPROGS_RM$(BR2_PACKAGE_E2FSPROGS_FILEFRAG) += ${TARGET_DIR}/sbin/filefrag
-E2FSPROGS_RM$(BR2_PACKAGE_E2FSPROGS_FSCK) += ${TARGET_DIR}/sbin/fsck
-E2FSPROGS_RM$(BR2_PACKAGE_E2FSPROGS_LOGSAVE) += ${TARGET_DIR}/sbin/logsave
-E2FSPROGS_RM$(BR2_PACKAGE_E2FSPROGS_LSATTR) += ${TARGET_DIR}/bin/lsattr
-E2FSPROGS_RM$(BR2_PACKAGE_E2FSPROGS_MKE2FS) += ${TARGET_DIR}/sbin/mke2fs
-E2FSPROGS_RM$(BR2_PACKAGE_E2FSPROGS_MKLOSTFOUND) += ${TARGET_DIR}/sbin/mklost+found
-E2FSPROGS_RM$(BR2_PACKAGE_E2FSPROGS_UUIDGEN) += ${TARGET_DIR}/bin/uuidgen
-
-$(TARGET_DIR)/$(E2FSPROGS_TARGET_BINARY): $(STAGING_DIR)/$(E2FSPROGS_TARGET_BINARY)
-	$(MAKE1) PATH=$(TARGET_PATH) DESTDIR=$(TARGET_DIR) LDCONFIG=true \
-		-C $(E2FSPROGS_DIR) install
-	rm -rf ${TARGET_DIR}/sbin/mkfs.ext[234] \
-		${TARGET_DIR}/sbin/fsck.ext[234] \
-		${TARGET_DIR}/sbin/findfs \
-		${TARGET_DIR}/sbin/tune2fs
-ifneq ($(E2FSPROGS_RM),)
-	rm -rf $(E2FSPROGS_RM)
-endif
+E2FSPROGS_AUTORECONF = NO
+E2FSPROGS_LIBTOOL_PATCH = NO
+
+E2FSPROGS_INSTALL_STAGING = YES
+E2FSPROGS_INSTALL_TARGET = YES
+
+E2FSPROGS_CONF_OPT = \
+	--disable-tls \
+	--enable-elf-shlibs \
+	--disable-debugfs \
+	--disable-imager \
+	--disable-resizer \
+	--enable-fsck \
+	--disable-e2initrd-helper \
+	--disable-testio-debug \
+	$(DISABLE_NLS) \
+	$(DISABLE_LARGEFILE)
+
+E2FSPROGS_MAKE_OPT = \
+	LDCONFIG=true
+
+$(eval $(call AUTOTARGETS,package,e2fsprogs))
+
+# binaries to keep or remove
+E2FSPROGS_BINTARGETS_$(BR2_PACKAGE_E2FSPROGS_BADBLOCKS) += usr/sbin/badblocks
+E2FSPROGS_BINTARGETS_$(BR2_PACKAGE_E2FSPROGS_BLKID) += usr/sbin/blkid
+E2FSPROGS_BINTARGETS_$(BR2_PACKAGE_E2FSPROGS_CHATTR) += usr/bin/chattr
+E2FSPROGS_BINTARGETS_$(BR2_PACKAGE_E2FSPROGS_DUMPE2FS) += usr/sbin/dumpe2fs
+E2FSPROGS_BINTARGETS_$(BR2_PACKAGE_E2FSPROGS_E2FREEFRAG) += usr/sbin/e2freefrag
+E2FSPROGS_BINTARGETS_$(BR2_PACKAGE_E2FSPROGS_E2FSCK) += usr/sbin/e2fsck
+E2FSPROGS_BINTARGETS_$(BR2_PACKAGE_E2FSPROGS_E2LABEL) += usr/sbin/e2label
+E2FSPROGS_BINTARGETS_$(BR2_PACKAGE_E2FSPROGS_E2UNDO) += usr/sbin/e2undo
+E2FSPROGS_BINTARGETS_$(BR2_PACKAGE_E2FSPROGS_FILEFRAG) += usr/sbin/filefrag
+E2FSPROGS_BINTARGETS_$(BR2_PACKAGE_E2FSPROGS_FSCK) += usr/sbin/fsck
+E2FSPROGS_BINTARGETS_$(BR2_PACKAGE_E2FSPROGS_LOGSAVE) += usr/sbin/logsave
+E2FSPROGS_BINTARGETS_$(BR2_PACKAGE_E2FSPROGS_LSATTR) += usr/bin/lsattr
+E2FSPROGS_BINTARGETS_$(BR2_PACKAGE_E2FSPROGS_MKE2FS) += usr/sbin/mke2fs
+E2FSPROGS_BINTARGETS_$(BR2_PACKAGE_E2FSPROGS_MKLOSTFOUND) += usr/sbin/mklost+found
+E2FSPROGS_BINTARGETS_$(BR2_PACKAGE_E2FSPROGS_UUIDD) += usr/sbin/uuidd
+E2FSPROGS_BINTARGETS_$(BR2_PACKAGE_E2FSPROGS_UUIDGEN) += usr/bin/uuidgen
+
+# libraries to keep or remove
+E2FSPROGS_BINTARGETS_$(BR2_PACKAGE_E2FSPROGS_LIBUUID) += usr/lib/libuuid.so*
+E2FSPROGS_BINTARGETS_$(BR2_PACKAGE_E2FSPROGS_LIBBLKID) += usr/lib/libblkid.so*
+E2FSPROGS_BINTARGETS_$(BR2_PACKAGE_E2FSPROGS_UTILS) += usr/lib/libcom_err.so*
+E2FSPROGS_BINTARGETS_$(BR2_PACKAGE_E2FSPROGS_UTILS) += usr/lib/libe2p.so*
+E2FSPROGS_BINTARGETS_$(BR2_PACKAGE_E2FSPROGS_UTILS) += usr/lib/libext2fs.so*
+E2FSPROGS_BINTARGETS_$(BR2_PACKAGE_E2FSPROGS_UTILS) += usr/lib/libss.so*
+
+# files to remove
+E2FSPROGS_TXTTARGETS_ = \
+	usr/sbin/mkfs.ext[234] \
+	usr/sbin/mkfs.ext4dev \
+	usr/sbin/fsck.ext[234] \
+	usr/sbin/fsck.ext4dev \
+	usr/sbin/findfs \
+	usr/sbin/tune2fs
+
+$(E2FSPROGS_HOOK_POST_INSTALL):
+	$(call MESSAGE,"Post installing")
+	# strip binaries
+	$(STRIPCMD) $(STRIP_STRIP_ALL) $(addprefix $(TARGET_DIR)/, $(E2FSPROGS_BINTARGETS_y))
+	# remove unneeded
+	rm -f $(addprefix $(TARGET_DIR)/, $(E2FSPROGS_BINTARGETS_))
+	rm -f $(addprefix $(TARGET_DIR)/, $(E2FSPROGS_TXTTARGETS_))
+	# make symlinks
 ifeq ($(BR2_PACKAGE_E2FSPROGS_MKE2FS),y)
-	ln -sf mke2fs ${TARGET_DIR}/sbin/mkfs.ext2
-	ln -sf mke2fs ${TARGET_DIR}/sbin/mkfs.ext3
-	ln -sf mke2fs ${TARGET_DIR}/sbin/mkfs.ext4
+	ln -sf mke2fs ${TARGET_DIR}/usr/sbin/mkfs.ext2
+	ln -sf mke2fs ${TARGET_DIR}/usr/sbin/mkfs.ext3
+	ln -sf mke2fs ${TARGET_DIR}/usr/sbin/mkfs.ext4
+	ln -sf mke2fs ${TARGET_DIR}/usr/sbin/mkfs.ext4dev
 endif
 ifeq ($(BR2_PACKAGE_E2FSPROGS_E2FSCK),y)
-	ln -sf e2fsck ${TARGET_DIR}/sbin/fsck.ext2
-	ln -sf e2fsck ${TARGET_DIR}/sbin/fsck.ext3
-	ln -sf e2fsck ${TARGET_DIR}/sbin/fsck.ext4
+	ln -sf e2fsck ${TARGET_DIR}/usr/sbin/fsck.ext2
+	ln -sf e2fsck ${TARGET_DIR}/usr/sbin/fsck.ext3
+	ln -sf e2fsck ${TARGET_DIR}/usr/sbin/fsck.ext4
+	ln -sf e2fsck ${TARGET_DIR}/usr/sbin/fsck.ext4dev
 endif
 ifeq ($(BR2_PACKAGE_E2FSPROGS_TUNE2FS),y)
-	ln -sf e2label ${TARGET_DIR}/sbin/tune2fs
+	ln -sf e2label ${TARGET_DIR}/usr/sbin/tune2fs
 endif
 ifeq ($(BR2_PACKAGE_E2FSPROGS_FINDFS),y)
-	ln -sf e2label ${TARGET_DIR}/sbin/findfs
-endif
-ifneq ($(BR2_HAVE_INFOPAGES),y)
-	rm -rf $(TARGET_DIR)/usr/share/info
-endif
-ifneq ($(BR2_HAVE_MANPAGES),y)
-	rm -rf $(TARGET_DIR)/usr/share/man
-endif
-	rm -rf $(TARGET_DIR)/share/locale
-	rm -rf $(TARGET_DIR)/usr/share/doc
-	touch -c $@
-
-$(TARGET_DIR)/$(LIBUUID_TARGET_BINARY): $(STAGING_DIR)/$(LIBUUID_TARGET_BINARY)
-	cp -a $(STAGING_DIR)/$(LIBUUID_TARGET_BINARY)* $(@D)
-	touch -c $@
-
-libuuid: $(TARGET_DIR)/$(LIBUUID_TARGET_BINARY)
-e2fsprogs: libuuid $(TARGET_DIR)/$(E2FSPROGS_TARGET_BINARY)
-
-e2fsprogs-clean:
-	$(MAKE1) DESTDIR=$(TARGET_DIR) CC=$(TARGET_CC) -C $(E2FSPROGS_DIR) uninstall
-	-$(MAKE1) -C $(E2FSPROGS_DIR) clean
-
-e2fsprogs-dirclean:
-	rm -rf $(E2FSPROGS_DIR)
-
-libuuid-clean:
-	-$(MAKE1) PATH=$(TARGET_PATH) DESTDIR=$(STAGING_DIR) LDCONFIG=true \
-		-C $(LIBUUID_DIR) uninstall
-	# make uninstall misses the includes
-	rm -rf $(STAGING_DIR)/usr/include/uuid
-	rm -f $(TARGET_DIR)/$(LIBUUID_TARGET_BINARY)*
-	-$(MAKE1) -C $(LIBUUID_DIR) clean
-
-libuuid-source: e2fsprogs-source
-libuuid-dirclean: e2fsprogs-dirclean
-
-#############################################################
-#
-# Toplevel Makefile options
-#
-#############################################################
-ifeq ($(BR2_PACKAGE_E2FSPROGS),y)
-TARGETS+=e2fsprogs
+	ln -sf e2label ${TARGET_DIR}/usr/sbin/findfs
 endif
+	touch $@
 
-ifeq ($(BR2_PACKAGE_LIBUUID),y)
-TARGETS+=libuuid
-endif
-- 
1.6.3.3
