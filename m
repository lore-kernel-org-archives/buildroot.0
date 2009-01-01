From: nkukard at uclibc.org <nkukard@uclibc.org>
Date: Thu,  1 Jan 2009 17:50:50 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package/e2fsprogs
Message-ID: <20090101175050.5316576C21@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: nkukard
Date: 2009-01-01 17:50:49 +0000 (Thu, 01 Jan 2009)
New Revision: 24637

Log:
* Bumped to version 1.41.3
- Disable tls
- rel-libs is now implemented upstream
- Install ext4 tools aswell


Removed:
   trunk/buildroot/package/e2fsprogs/e2fsprogs-001-rel-libs.patch

Modified:
   trunk/buildroot/package/e2fsprogs/e2fsprogs.mk


Changeset:
Deleted: trunk/buildroot/package/e2fsprogs/e2fsprogs-001-rel-libs.patch
===================================================================
--- trunk/buildroot/package/e2fsprogs/e2fsprogs-001-rel-libs.patch	2009-01-01 17:48:06 UTC (rev 24636)
+++ trunk/buildroot/package/e2fsprogs/e2fsprogs-001-rel-libs.patch	2009-01-01 17:50:49 UTC (rev 24637)
@@ -1,12 +0,0 @@
-diff -ur e2fsprogs-1.39/lib/Makefile.elf-lib e2fsprogs-1.39.fixed/lib/Makefile.elf-lib
---- e2fsprogs-1.39/lib/Makefile.elf-lib	2006-03-11 10:37:57.000000000 +1100
-+++ e2fsprogs-1.39.fixed/lib/Makefile.elf-lib	2007-10-31 17:37:43.000000000 +1100
-@@ -45,7 +45,7 @@
- 	@echo "	SYMLINK $(ELF_INSTALL_DIR)/$(ELF_SONAME)"
- 	@$(LN_S) -f $(ELF_LIB) $(DESTDIR)$(ELF_INSTALL_DIR)/$(ELF_SONAME)
- 	@echo "	SYMLINK $(libdir)/$(ELF_IMAGE).so"
--	@$(LN_S) -f $(ELF_INSTALL_DIR)/$(ELF_SONAME) \
-+	@$(LN_S) -f $(ELF_SONAME) \
- 		$(DESTDIR)$(libdir)/$(ELF_IMAGE).so
- 	@echo "	LDCONFIG"
- 	@-$(LDCONFIG)

Modified: trunk/buildroot/package/e2fsprogs/e2fsprogs.mk
===================================================================
--- trunk/buildroot/package/e2fsprogs/e2fsprogs.mk	2009-01-01 17:48:06 UTC (rev 24636)
+++ trunk/buildroot/package/e2fsprogs/e2fsprogs.mk	2009-01-01 17:50:49 UTC (rev 24637)
@@ -3,7 +3,7 @@
 # e2fsprogs
 #
 #############################################################
-E2FSPROGS_VERSION:=1.39
+E2FSPROGS_VERSION:=1.41.3
 E2FSPROGS_SOURCE=e2fsprogs-$(E2FSPROGS_VERSION).tar.gz
 E2FSPROGS_SITE=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/e2fsprogs
 E2FSPROGS_DIR=$(BUILD_DIR)/e2fsprogs-$(E2FSPROGS_VERSION)
@@ -48,6 +48,7 @@
 		--localstatedir=/var \
 		--mandir=/usr/share/man \
 		--infodir=/usr/share/info \
+		--disable-tls \
 		--enable-elf-shlibs --enable-dynamic-e2fsck --disable-swapfs \
 		--disable-debugfs --disable-imager \
 		--disable-resizer --enable-fsck \
@@ -85,8 +86,8 @@
 $(TARGET_DIR)/$(E2FSPROGS_TARGET_BINARY): $(E2FSPROGS_DIR)/$(E2FSPROGS_BINARY)
 	$(MAKE1) PATH=$(TARGET_PATH) DESTDIR=$(TARGET_DIR) LDCONFIG=true \
 		-C $(E2FSPROGS_DIR) install
-	rm -rf ${TARGET_DIR}/sbin/mkfs.ext[23] \
-		${TARGET_DIR}/sbin/fsck.ext[23] \
+	rm -rf ${TARGET_DIR}/sbin/mkfs.ext[234] \
+		${TARGET_DIR}/sbin/fsck.ext[234] \
 		${TARGET_DIR}/sbin/findfs \
 		${TARGET_DIR}/sbin/tune2fs
 ifneq ($(E2FSPROGS_RM),)
@@ -95,10 +96,12 @@
 ifeq ($(BR2_PACKAGE_E2FSPROGS_MKE2FS),y)
 	ln -sf mke2fs ${TARGET_DIR}/sbin/mkfs.ext2
 	ln -sf mke2fs ${TARGET_DIR}/sbin/mkfs.ext3
+	ln -sf mke2fs ${TARGET_DIR}/sbin/mkfs.ext4
 endif
 ifeq ($(BR2_PACKAGE_E2FSPROGS_E2FSCK),y)
 	ln -sf e2fsck ${TARGET_DIR}/sbin/fsck.ext2
 	ln -sf e2fsck ${TARGET_DIR}/sbin/fsck.ext3
+	ln -sf e2fsck ${TARGET_DIR}/sbin/fsck.ext4
 endif
 ifeq ($(BR2_PACKAGE_E2FSPROGS_TUNE2FS),y)
 	ln -sf e2label ${TARGET_DIR}/sbin/tune2fs
