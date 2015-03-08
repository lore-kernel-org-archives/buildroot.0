From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 8 Mar 2015 23:02:16 +0100
Subject: [Buildroot] [git commit] package/dosfstools: add missing symlinks
Message-ID: <20150308220249.D05B88080B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=cef6a787cad4d5417b8672c8fd4c200bf29655ac
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Install alternative symlinks for dosfstools mkfs.fat, fsck.fat and
fatlabel. Those symlinks are generally installed by make install, but
buildroot does not use make install for dosfstools, but symlinks should
be installed anyway.

[Thomas: rewrite the installation logic to use make style code rather
than shell code.]

Signed-off-by: Maxim Mikityanskiy <maxtram95@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/dosfstools/dosfstools.mk |   37 +++++++++++++++++++++++++++----------
 1 files changed, 27 insertions(+), 10 deletions(-)

diff --git a/package/dosfstools/dosfstools.mk b/package/dosfstools/dosfstools.mk
index a9d8392..88c4fe8 100644
--- a/package/dosfstools/dosfstools.mk
+++ b/package/dosfstools/dosfstools.mk
@@ -20,23 +20,40 @@ DOSFSTOOLS_DEPENDENCIES += libiconv
 DOSFSTOOLS_LDLIBS += -liconv
 endif
 
-FATLABEL_BINARY = fatlabel
-FSCK_FAT_BINARY = fsck.fat
-MKFS_FAT_BINARY = mkfs.fat
-
 define DOSFSTOOLS_BUILD_CMDS
 	$(MAKE) $(TARGET_CONFIGURE_OPTS) \
 		CFLAGS="$(DOSFSTOOLS_CFLAGS)" LDLIBS="$(DOSFSTOOLS_LDLIBS)" -C $(@D)
 endef
 
-DOSFSTOOLS_INSTALL_BIN_FILES_$(BR2_PACKAGE_DOSFSTOOLS_FATLABEL)+=$(FATLABEL_BINARY)
-DOSFSTOOLS_INSTALL_BIN_FILES_$(BR2_PACKAGE_DOSFSTOOLS_FSCK_FAT)+=$(FSCK_FAT_BINARY)
-DOSFSTOOLS_INSTALL_BIN_FILES_$(BR2_PACKAGE_DOSFSTOOLS_MKFS_FAT)+=$(MKFS_FAT_BINARY)
+ifeq ($(BR2_PACKAGE_DOSFSTOOLS_FATLABEL),y)
+define DOSFSTOOLS_INSTALL_FATLABEL
+	$(INSTALL) -D -m 755 $(@D)/fatlabel $(TARGET_DIR)/sbin/fatlabel
+	ln -sf fatlabel $(TARGET_DIR)/sbin/dosfslabel
+endef
+endif
+
+ifeq ($(BR2_PACKAGE_DOSFSTOOLS_FSCK_FAT),y)
+define DOSFSTOOLS_INSTALL_FSCK_FAT
+	$(INSTALL) -D -m 755 $(@D)/fsck.fat $(TARGET_DIR)/sbin/fsck.fat
+	ln -fs fsck.fat $(TARGET_DIR)/sbin/dosfsck
+	ln -fs fsck.fat $(TARGET_DIR)/sbin/fsck.msdos
+	ln -fs fsck.fat $(TARGET_DIR)/sbin/fsck.vfat
+endef
+endif
+
+ifeq ($(BR2_PACKAGE_DOSFSTOOLS_MKFS_FAT),y)
+define DOSFSTOOLS_INSTALL_MKFS_FAT
+	$(INSTALL) -D -m 755 $(@D)/mkfs.fat $(TARGET_DIR)/sbin/mkfs.fat
+	ln -fs mkfs.fat $(TARGET_DIR)/sbin/mkdosfs
+	ln -fs mkfs.fat $(TARGET_DIR)/sbin/mkfs.msdos
+	ln -fs mkfs.fat $(TARGET_DIR)/sbin/mkfs.vfat
+endef
+endif
 
 define DOSFSTOOLS_INSTALL_TARGET_CMDS
-	test -z "$(DOSFSTOOLS_INSTALL_BIN_FILES_y)" || \
-	$(INSTALL) -m 755 $(addprefix $(@D)/,$(DOSFSTOOLS_INSTALL_BIN_FILES_y)) \
-		$(TARGET_DIR)/sbin/
+	$(DOSFSTOOLS_INSTALL_FATLABEL)
+	$(DOSFSTOOLS_INSTALL_FSCK_FAT)
+	$(DOSFSTOOLS_INSTALL_MKFS_FAT)
 endef
 
 define HOST_DOSFSTOOLS_BUILD_CMDS
