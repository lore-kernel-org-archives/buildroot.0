From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 28 Jul 2011 17:58:50 +0200
Subject: [Buildroot] [git commit] e2fsprogs: use libblkid / blkid from
	util-linux
Message-ID: <20110728160116.C1E3A8B557@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=e1ffc2f791b336339909c90559b7db40b455f172
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

e2fsprogs and util-linux both provide blkid / libblkid causing conflicts
if both are enabled. The preferred upstream (E.G. what is used by Debian)
is util-linux, so remove the options from e2fsprogs and make it use the
util-linux version instead.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/e2fsprogs/Config.in    |   23 ++++++-----------------
 package/e2fsprogs/e2fsprogs.mk |   16 +---------------
 2 files changed, 7 insertions(+), 32 deletions(-)

diff --git a/package/e2fsprogs/Config.in b/package/e2fsprogs/Config.in
index 2410fef..76586d2 100644
--- a/package/e2fsprogs/Config.in
+++ b/package/e2fsprogs/Config.in
@@ -2,6 +2,10 @@
 config BR2_PACKAGE_E2FSPROGS
 	bool "e2fsprogs"
 	depends on BR2_LARGEFILE
+	depends on BR2_USE_WCHAR # util-linux
+	select BR2_PACKAGE_BUSYBOX_SHOW_OTHERS # util-linux
+	select BR2_PACKAGE_UTIL_LINUX
+	select BR2_PACKAGE_UTIL_LINUX_LIBBLKID
 	help
 	  The EXT2 file system utilities and libraries
 
@@ -17,11 +21,6 @@ config BR2_PACKAGE_E2FSPROGS_BADBLOCKS
 	bool "badblocks"
 	default y
 
-config BR2_PACKAGE_E2FSPROGS_BLKID
-	bool "blkid"
-	default y
-	select BR2_PACKAGE_E2FSPROGS_LIBBLKID
-
 config BR2_PACKAGE_E2FSPROGS_CHATTR
 	bool "chattr"
 	default y
@@ -41,7 +40,6 @@ config BR2_PACKAGE_E2FSPROGS_E2FREEFRAG
 config BR2_PACKAGE_E2FSPROGS_E2FSCK
 	bool "e2fsck"
 	default y
-	select BR2_PACKAGE_E2FSPROGS_LIBBLKID
 
 config BR2_PACKAGE_E2FSPROGS_E2IMAGE
 	bool "e2image"
@@ -49,7 +47,6 @@ config BR2_PACKAGE_E2FSPROGS_E2IMAGE
 config BR2_PACKAGE_E2FSPROGS_E2LABEL
 	bool "e2label"
 	default y
-	select BR2_PACKAGE_E2FSPROGS_LIBBLKID
 
 config BR2_PACKAGE_E2FSPROGS_E2UNDO
 	bool "e2undo"
@@ -67,7 +64,6 @@ config BR2_PACKAGE_E2FSPROGS_FINDFS
 config BR2_PACKAGE_E2FSPROGS_FSCK
 	bool "fsck"
 	default y
-	select BR2_PACKAGE_E2FSPROGS_LIBBLKID
 
 config BR2_PACKAGE_E2FSPROGS_LOGSAVE
 	bool "logsave"
@@ -80,7 +76,6 @@ config BR2_PACKAGE_E2FSPROGS_LSATTR
 config BR2_PACKAGE_E2FSPROGS_MKE2FS
 	bool "mke2fs"
 	default y
-	select BR2_PACKAGE_E2FSPROGS_LIBBLKID
 
 config BR2_PACKAGE_E2FSPROGS_MKLOSTFOUND
 	bool "mklost+found"
@@ -117,14 +112,8 @@ config BR2_PACKAGE_E2FSPROGS_LIBUUID
 	help
 	  The uuid library from the e2fsprogs suite
 
-config BR2_PACKAGE_E2FSPROGS_LIBBLKID
-	bool "libblkid"
-	select BR2_PACKAGE_E2FSPROGS_LIBUUID
-	help
-	  The blkid library from the e2fsprogs suite
-
 endmenu
 
-comment "e2fsprogs requires a toolchain with LARGEFILE support"
-	depends on !BR2_LARGEFILE
+comment "e2fsprogs requires a toolchain with LARGEFILE + WCHAR support"
+	depends on !(BR2_LARGEFILE && BR2_USE_WCHAR)
 
diff --git a/package/e2fsprogs/e2fsprogs.mk b/package/e2fsprogs/e2fsprogs.mk
index e4ae86a..42bdd2c 100644
--- a/package/e2fsprogs/e2fsprogs.mk
+++ b/package/e2fsprogs/e2fsprogs.mk
@@ -15,6 +15,7 @@ E2FSPROGS_CONF_OPT = \
 	$(if $(BR2_PACKAGE_E2FSPROGS_E2IMAGE),,--disable-imager) \
 	$(if $(BR2_PACKAGE_E2FSPROGS_RESIZE2FS),,--disable-resizer) \
 	$(if $(BR2_PACKAGE_E2FSPROGS_UUIDD),,--disable-uuidd) \
+	--disable-blkid \
 	--enable-fsck \
 	--disable-e2initrd-helper \
 	--disable-testio-debug
@@ -30,7 +31,6 @@ endef
 
 # binaries to keep or remove
 E2FSPROGS_BINTARGETS_$(BR2_PACKAGE_E2FSPROGS_BADBLOCKS) += usr/sbin/badblocks
-E2FSPROGS_BINTARGETS_$(BR2_PACKAGE_E2FSPROGS_BLKID) += usr/sbin/blkid
 E2FSPROGS_BINTARGETS_$(BR2_PACKAGE_E2FSPROGS_CHATTR) += usr/bin/chattr
 E2FSPROGS_BINTARGETS_$(BR2_PACKAGE_E2FSPROGS_DUMPE2FS) += usr/sbin/dumpe2fs
 E2FSPROGS_BINTARGETS_$(BR2_PACKAGE_E2FSPROGS_E2FREEFRAG) += usr/sbin/e2freefrag
@@ -47,7 +47,6 @@ E2FSPROGS_BINTARGETS_$(BR2_PACKAGE_E2FSPROGS_UUIDGEN) += usr/bin/uuidgen
 
 # libraries to keep or remove
 E2FSPROGS_BINTARGETS_$(BR2_PACKAGE_E2FSPROGS_LIBUUID) += usr/lib/libuuid.so*
-E2FSPROGS_BINTARGETS_$(BR2_PACKAGE_E2FSPROGS_LIBBLKID) += usr/lib/libblkid.so*
 E2FSPROGS_BINTARGETS_$(BR2_PACKAGE_E2FSPROGS_UTILS) += usr/lib/libcom_err.so*
 E2FSPROGS_BINTARGETS_$(BR2_PACKAGE_E2FSPROGS_UTILS) += usr/lib/libe2p.so*
 E2FSPROGS_BINTARGETS_$(BR2_PACKAGE_E2FSPROGS_UTILS) += usr/lib/libext2fs.so*
@@ -117,18 +116,5 @@ ifeq ($(BR2_PACKAGE_E2FSPROGS_LIBUUID),y)
 E2FSPROGS_POST_INSTALL_STAGING_HOOKS += E2FSPROGS_STAGING_LIBUUID_INSTALL
 endif
 
-define E2FSPROGS_STAGING_LIBBLKID_INSTALL
-	install -D $(@D)/lib/blkid/blkid.h \
-		$(STAGING_DIR)/usr/include/blkid/blkid.h
-	install -D $(@D)/lib/blkid/blkid_types.h \
-		$(STAGING_DIR)/usr/include/blkid/blkid_types.h
-	install -D $(@D)/lib/blkid/blkid.pc \
-		$(STAGING_DIR)/usr/lib/pkgconfig/blkid.pc
-endef
-
-ifeq ($(BR2_PACKAGE_E2FSPROGS_LIBBLKID),y)
-E2FSPROGS_POST_INSTALL_STAGING_HOOKS += E2FSPROGS_STAGING_LIBBLKID_INSTALL
-endif
-
 $(eval $(call AUTOTARGETS,package,e2fsprogs))
 $(eval $(call AUTOTARGETS,package,e2fsprogs,host))
-- 
1.7.3.4
