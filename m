From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 31 May 2019 22:00:49 +0200
Subject: [Buildroot] [git commit] package/dosfstools: introduce custom
 install routine
Message-ID: <20190531201636.715668E840@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4cc31dfa3de505dd138d3d37ac80f7c0428fc1ab
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We can't use dosfstools' install target, because it'll install *all*
binaries, even the disabled ones. Also, we can't just delete dosfstools
binaries from the target directory after installing them, because other
packages (specifically Busybox) may provide tools of the same name, and
we may end up deleting those instead.

To avoid any issues, we create our own install routines, which only
copy the enabled binaries into the target location.

Signed-off-by: Markus Mayer <mmayer@broadcom.com>
[Thomas: use full destination path for INSTALL commands.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/dosfstools/dosfstools.mk | 34 ++++++++++++++++++++++------------
 1 file changed, 22 insertions(+), 12 deletions(-)

diff --git a/package/dosfstools/dosfstools.mk b/package/dosfstools/dosfstools.mk
index 6eb0851d0e..fdf973af9d 100644
--- a/package/dosfstools/dosfstools.mk
+++ b/package/dosfstools/dosfstools.mk
@@ -24,26 +24,36 @@ DOSFSTOOLS_CONF_OPTS += LIBS="-liconv"
 DOSFSTOOLS_DEPENDENCIES += libiconv
 endif
 
-ifeq ($(BR2_PACKAGE_DOSFSTOOLS_FATLABEL),)
-define DOSFSTOOLS_REMOVE_FATLABEL
-	rm -f $(addprefix $(TARGET_DIR)/sbin/,dosfslabel fatlabel)
+ifeq ($(BR2_PACKAGE_DOSFSTOOLS_FATLABEL),y)
+define DOSFSTOOLS_INSTALL_FATLABEL
+	$(INSTALL) -D -m 0755 $(@D)/src/fatlabel $(TARGET_DIR)/sbin/fatlabel
+	ln -sf fatlabel $(TARGET_DIR)/sbin/dosfslabel
 endef
-DOSFSTOOLS_POST_INSTALL_TARGET_HOOKS += DOSFSTOOLS_REMOVE_FATLABEL
 endif
 
-ifeq ($(BR2_PACKAGE_DOSFSTOOLS_FSCK_FAT),)
-define DOSFSTOOLS_REMOVE_FSCK_FAT
-	rm -f $(addprefix $(TARGET_DIR)/sbin/,fsck.fat dosfsck fsck.msdos fsck.vfat)
+ifeq ($(BR2_PACKAGE_DOSFSTOOLS_FSCK_FAT),y)
+define DOSFSTOOLS_INSTALL_FSCK_FAT
+	$(INSTALL) -D -m 0755 $(@D)/src/fsck.fat $(TARGET_DIR)/sbin/fsck.fat
+	ln -sf fsck.fat $(TARGET_DIR)/sbin/fsck.vfat
+	ln -sf fsck.fat $(TARGET_DIR)/sbin/fsck.msdos
+	ln -sf fsck.fat $(TARGET_DIR)/sbin/dosfsck
 endef
-DOSFSTOOLS_POST_INSTALL_TARGET_HOOKS += DOSFSTOOLS_REMOVE_FSCK_FAT
 endif
 
-ifeq ($(BR2_PACKAGE_DOSFSTOOLS_MKFS_FAT),)
-define DOSFSTOOLS_REMOVE_MKFS_FAT
-	rm -f $(addprefix $(TARGET_DIR)/sbin/,mkfs.fat mkdosfs mkfs.msdos mkfs.vfat)
+ifeq ($(BR2_PACKAGE_DOSFSTOOLS_MKFS_FAT),y)
+define DOSFSTOOLS_INSTALL_MKFS_FAT
+	$(INSTALL) -D -m 0755 $(@D)/src/mkfs.fat $(TARGET_DIR)/sbin/mkfs.fat
+	ln -sf mkfs.fat $(TARGET_DIR)/sbin/mkdosfs
+	ln -sf mkfs.fat $(TARGET_DIR)/sbin/mkfs.msdos
+	ln -sf mkfs.fat $(TARGET_DIR)/sbin/mkfs.vfat
 endef
-DOSFSTOOLS_POST_INSTALL_TARGET_HOOKS += DOSFSTOOLS_REMOVE_MKFS_FAT
 endif
 
+define DOSFSTOOLS_INSTALL_TARGET_CMDS
+	$(call DOSFSTOOLS_INSTALL_FATLABEL)
+	$(call DOSFSTOOLS_INSTALL_FSCK_FAT)
+	$(call DOSFSTOOLS_INSTALL_MKFS_FAT)
+endef
+
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
