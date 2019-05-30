From: Markus Mayer <mmayer@broadcom.com>
Date: Thu, 30 May 2019 10:50:16 -0700
Subject: [Buildroot] [PATCH v2] package/dosfstools: introduce sanitation
 step during install
Message-ID: <20190530175016.3633-1-mmayer@broadcom.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We can't install dosfstools into the target directory directly, because
it'll install *all* binaries, even the disabled ones.

Also, we can't just delete dosfstools binaries from the target
directory after installing them, because some tools of the same name
may be provided by other packages (specifically Busybox). When a tool
is disabled in dosfstools, it only means that dosfstools shouldn't
install its own copy, not that it is okay to remove a tool that might
already be there.

To avoid any issues, we install dosfstools into a temporary location,
remove the binaries that have been disabled in the Buildroot
configuration, and only then copy the rest to the target location.

Signed-off-by: Markus Mayer <mmayer@broadcom.com>
---

This is still of the "install first, remove later" variety. Arnout's
other concerns have been addressed.  Let me know what you think.

Changes since v1:

- don't bother removing man page files
- use rsync instead of tar to copy files to the destination

 package/dosfstools/dosfstools.mk | 26 +++++++++++++++++++++++---
 1 file changed, 23 insertions(+), 3 deletions(-)

diff --git a/package/dosfstools/dosfstools.mk b/package/dosfstools/dosfstools.mk
index 6eb0851d0e23..50501e0ef22d 100644
--- a/package/dosfstools/dosfstools.mk
+++ b/package/dosfstools/dosfstools.mk
@@ -10,6 +10,7 @@ DOSFSTOOLS_SITE = https://github.com/dosfstools/dosfstools/releases/download/v$(
 DOSFSTOOLS_LICENSE = GPL-3.0+
 DOSFSTOOLS_LICENSE_FILES = COPYING
 DOSFSTOOLS_CONF_OPTS = --enable-compat-symlinks --exec-prefix=/
+DOSFSTOOLS_TEMP=$(BASE_DIR)/build/dosfstools-install
 HOST_DOSFSTOOLS_CONF_OPTS = --enable-compat-symlinks
 
 ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
@@ -24,26 +25,45 @@ DOSFSTOOLS_CONF_OPTS += LIBS="-liconv"
 DOSFSTOOLS_DEPENDENCIES += libiconv
 endif
 
+# Install into temporary location
+DOSFSTOOLS_INSTALL_TARGET_OPTS = \
+	DESTDIR=$(DOSFSTOOLS_TEMP) \
+	install
+
+# Clean out our temporary install location before installation
+define DOSFSTOOLS_CLEAR_TEMP
+	rm -rf $(DOSFSTOOLS_TEMP)
+endef
+DOSFSTOOLS_PRE_INSTALL_TARGET_HOOKS += DOSFSTOOLS_CLEAR_TEMP
+
+# Sanitize temporary install location after installation
 ifeq ($(BR2_PACKAGE_DOSFSTOOLS_FATLABEL),)
 define DOSFSTOOLS_REMOVE_FATLABEL
-	rm -f $(addprefix $(TARGET_DIR)/sbin/,dosfslabel fatlabel)
+	rm -f $(addprefix $(DOSFSTOOLS_TEMP)/sbin/,dosfslabel fatlabel)
 endef
 DOSFSTOOLS_POST_INSTALL_TARGET_HOOKS += DOSFSTOOLS_REMOVE_FATLABEL
 endif
 
 ifeq ($(BR2_PACKAGE_DOSFSTOOLS_FSCK_FAT),)
 define DOSFSTOOLS_REMOVE_FSCK_FAT
-	rm -f $(addprefix $(TARGET_DIR)/sbin/,fsck.fat dosfsck fsck.msdos fsck.vfat)
+	rm -f $(addprefix $(DOSFSTOOLS_TEMP)/sbin/,fsck.fat dosfsck fsck.msdos fsck.vfat)
 endef
 DOSFSTOOLS_POST_INSTALL_TARGET_HOOKS += DOSFSTOOLS_REMOVE_FSCK_FAT
 endif
 
 ifeq ($(BR2_PACKAGE_DOSFSTOOLS_MKFS_FAT),)
 define DOSFSTOOLS_REMOVE_MKFS_FAT
-	rm -f $(addprefix $(TARGET_DIR)/sbin/,mkfs.fat mkdosfs mkfs.msdos mkfs.vfat)
+	rm -f $(addprefix $(DOSFSTOOLS_TEMP)/sbin/,mkfs.fat mkdosfs mkfs.msdos mkfs.vfat)
 endef
 DOSFSTOOLS_POST_INSTALL_TARGET_HOOKS += DOSFSTOOLS_REMOVE_MKFS_FAT
 endif
 
+# Install what's left into the actual target directory
+define DOSFSTOOLS_TARGET_INSTALL
+	rsync -a $(DOSFSTOOLS_TEMP)/ $(TARGET_DIR)
+	rm -rf $(DOSFSTOOLS_TEMP)
+endef
+DOSFSTOOLS_POST_INSTALL_TARGET_HOOKS += DOSFSTOOLS_TARGET_INSTALL
+
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
-- 
2.17.1
