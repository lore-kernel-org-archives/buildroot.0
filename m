From: Markus Mayer <mmayer@broadcom.com>
Date: Thu, 30 May 2019 16:42:26 -0700
Subject: [Buildroot] [PATCH v3] package/dosfstools: introduce custom install
 routine
Message-ID: <20190530234226.28013-1-mmayer@broadcom.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We can't use dosfstools' install target, because it'll install *all*
binaries, even the disabled ones. Also, we can't just delete dosfstools
binaries from the target directory after installing them, because other
packages (specifically Busybox) may provide tools of the same name, and
we may end up deleting those instead.

To avoid any issues, we create our own install routine, which only
copies the enabled binaries into the target location.

Signed-off-by: Markus Mayer <mmayer@broadcom.com>
---

Changes since v2:
- use custom install routine that only copies the binaries we want

Changes since v1:
- don't bother removing man page files
- use rsync instead of tar to copy files to the destination

 package/dosfstools/dosfstools.mk | 37 +++++++++++++++++++++-----------
 1 file changed, 25 insertions(+), 12 deletions(-)

diff --git a/package/dosfstools/dosfstools.mk b/package/dosfstools/dosfstools.mk
index 6eb0851d0e23..d32f3e22c05c 100644
--- a/package/dosfstools/dosfstools.mk
+++ b/package/dosfstools/dosfstools.mk
@@ -24,26 +24,39 @@ DOSFSTOOLS_CONF_OPTS += LIBS="-liconv"
 DOSFSTOOLS_DEPENDENCIES += libiconv
 endif
 
-ifeq ($(BR2_PACKAGE_DOSFSTOOLS_FATLABEL),)
-define DOSFSTOOLS_REMOVE_FATLABEL
-	rm -f $(addprefix $(TARGET_DIR)/sbin/,dosfslabel fatlabel)
+ifeq ($(BR2_PACKAGE_DOSFSTOOLS_FATLABEL),y)
+define DOSFSTOOLS_INSTALL_FATLABEL
+	install -c -p $(DOSFSTOOLS_BUILDDIR)src/fatlabel $(TARGET_DIR)/sbin
+	ln -sf fatlabel $(TARGET_DIR)/sbin/dosfslabel
 endef
-DOSFSTOOLS_POST_INSTALL_TARGET_HOOKS += DOSFSTOOLS_REMOVE_FATLABEL
+DOSFSTOOLS_POST_INSTALL_TARGET_HOOKS += DOSFSTOOLS_INSTALL_FATLABEL
 endif
 
-ifeq ($(BR2_PACKAGE_DOSFSTOOLS_FSCK_FAT),)
-define DOSFSTOOLS_REMOVE_FSCK_FAT
-	rm -f $(addprefix $(TARGET_DIR)/sbin/,fsck.fat dosfsck fsck.msdos fsck.vfat)
+ifeq ($(BR2_PACKAGE_DOSFSTOOLS_FSCK_FAT),y)
+define DOSFSTOOLS_INSTALL_FSCK_FAT
+	install -c -p $(DOSFSTOOLS_BUILDDIR)src/fsck.fat $(TARGET_DIR)/sbin
+	ln -sf fsck.fat $(TARGET_DIR)/sbin/fsck.vfat
+	ln -sf fsck.fat $(TARGET_DIR)/sbin/fsck.msdos
+	ln -sf fsck.fat $(TARGET_DIR)/sbin/dosfsck
 endef
-DOSFSTOOLS_POST_INSTALL_TARGET_HOOKS += DOSFSTOOLS_REMOVE_FSCK_FAT
+DOSFSTOOLS_POST_INSTALL_TARGET_HOOKS += DOSFSTOOLS_INSTALL_FSCK_FAT
 endif
 
-ifeq ($(BR2_PACKAGE_DOSFSTOOLS_MKFS_FAT),)
-define DOSFSTOOLS_REMOVE_MKFS_FAT
-	rm -f $(addprefix $(TARGET_DIR)/sbin/,mkfs.fat mkdosfs mkfs.msdos mkfs.vfat)
+ifeq ($(BR2_PACKAGE_DOSFSTOOLS_MKFS_FAT),y)
+define DOSFSTOOLS_INSTALL_MKFS_FAT
+	install -c -p $(DOSFSTOOLS_BUILDDIR)src/mkfs.fat $(TARGET_DIR)/sbin
+	ln -sf mkfs.fat $(TARGET_DIR)/sbin/mkdosfs
+	ln -sf mkfs.fat $(TARGET_DIR)/sbin/mkfs.msdos
+	ln -sf mkfs.fat $(TARGET_DIR)/sbin/mkfs.vfat
 endef
-DOSFSTOOLS_POST_INSTALL_TARGET_HOOKS += DOSFSTOOLS_REMOVE_MKFS_FAT
+DOSFSTOOLS_POST_INSTALL_TARGET_HOOKS += DOSFSTOOLS_INSTALL_MKFS_FAT
 endif
 
+# Actual installation happens via the post install hooks. Define a no-op install
+# command, so we don't end up calling "make install."
+define DOSFSTOOLS_INSTALL_TARGET_CMDS
+	@/bin/true
+endef
+
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
-- 
2.17.1
