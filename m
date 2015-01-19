From: Maxim Mikityanskiy <maxtram95@gmail.com>
Date: Mon, 19 Jan 2015 18:14:06 +0200
Subject: [Buildroot] [PATCH 06/16] package/dosfstools: add missing symlinks
In-Reply-To: <1421684056-5266-1-git-send-email-maxtram95@gmail.com>
References: <1421684056-5266-1-git-send-email-maxtram95@gmail.com>
Message-ID: <1421684056-5266-7-git-send-email-maxtram95@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Install alternative symlinks for dosfstools mkfs.fat, fsck.fat and
fatlabel. Those symlinks are generally installed by make install, but
buildroot does not use make install for dosfstools, but symlinks should
be installed anyway.

Signed-off-by: Maxim Mikityanskiy <maxtram95@gmail.com>
---
 package/dosfstools/dosfstools.mk | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/package/dosfstools/dosfstools.mk b/package/dosfstools/dosfstools.mk
index a9d8392..f768c97 100644
--- a/package/dosfstools/dosfstools.mk
+++ b/package/dosfstools/dosfstools.mk
@@ -37,6 +37,19 @@ define DOSFSTOOLS_INSTALL_TARGET_CMDS
 	test -z "$(DOSFSTOOLS_INSTALL_BIN_FILES_y)" || \
 	$(INSTALL) -m 755 $(addprefix $(@D)/,$(DOSFSTOOLS_INSTALL_BIN_FILES_y)) \
 		$(TARGET_DIR)/sbin/
+	if [[ "$(BR2_PACKAGE_DOSFSTOOLS_FATLABEL)" = y ]]; then \
+		ln -fs fatlabel $(TARGET_DIR)/sbin/dosfslabel; \
+	fi
+	if [[ "$(BR2_PACKAGE_DOSFSTOOLS_FSCK_FAT)" = y ]]; then \
+		ln -fs fsck.fat $(TARGET_DIR)/sbin/dosfsck; \
+		ln -fs fsck.fat $(TARGET_DIR)/sbin/fsck.msdos; \
+		ln -fs fsck.fat $(TARGET_DIR)/sbin/fsck.vfat; \
+	fi
+	if [[ "$(BR2_PACKAGE_DOSFSTOOLS_MKFS_FAT)" = y ]]; then \
+		ln -fs mkfs.fat $(TARGET_DIR)/sbin/mkdosfs; \
+		ln -fs mkfs.fat $(TARGET_DIR)/sbin/mkfs.msdos; \
+		ln -fs mkfs.fat $(TARGET_DIR)/sbin/mkfs.vfat; \
+	fi
 endef
 
 define HOST_DOSFSTOOLS_BUILD_CMDS
-- 
2.2.1
