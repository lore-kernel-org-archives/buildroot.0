From: Antoine Tenart <antoine.tenart@bootlin.com>
Date: Fri, 31 Jul 2020 12:10:28 +0200
Subject: [Buildroot] [PATCH 03/15] fs/common.mk: move down
 ROOTFS_REPRODUCIBLE for consistency
In-Reply-To: <20200731101040.1723047-1-antoine.tenart@bootlin.com>
References: <20200731101040.1723047-1-antoine.tenart@bootlin.com>
Message-ID: <20200731101040.1723047-4-antoine.tenart@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch is cosmetic and moves down ROOTFS_REPRODUCIBLE for
consistency.

Signed-off-by: Antoine Tenart <antoine.tenart@bootlin.com>
---
 fs/common.mk | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/fs/common.mk b/fs/common.mk
index d915a8795b74..a7137b8e89cf 100644
--- a/fs/common.mk
+++ b/fs/common.mk
@@ -36,12 +36,6 @@ ROOTFS_USERS_TABLES = $(call qstrip,$(BR2_ROOTFS_USERS_TABLES))
 ROOTFS_FULL_DEVICES_TABLE = $(FS_DIR)/full_devices_table.txt
 ROOTFS_FULL_USERS_TABLE = $(FS_DIR)/full_users_table.txt
 
-ifeq ($(BR2_REPRODUCIBLE),y)
-define ROOTFS_REPRODUCIBLE
-	find $(TARGET_DIR) -print0 | xargs -0 -r touch -hd @$(SOURCE_DATE_EPOCH)
-endef
-endif
-
 ROOTFS_COMMON_NAME = rootfs-common
 ROOTFS_COMMON_TYPE = rootfs
 ROOTFS_COMMON_DEPENDENCIES = \
@@ -49,6 +43,12 @@ ROOTFS_COMMON_DEPENDENCIES = \
 	$(BR2_TAR_HOST_DEPENDENCY) \
 	$(if $(PACKAGES_USERS)$(ROOTFS_USERS_TABLES),host-mkpasswd)
 
+ifeq ($(BR2_REPRODUCIBLE),y)
+define ROOTFS_REPRODUCIBLE
+	find $(TARGET_DIR) -print0 | xargs -0 -r touch -hd @$(SOURCE_DATE_EPOCH)
+endef
+endif
+
 ifeq ($(BR2_PACKAGE_REFPOLICY)$(BR2_PACKAGE_POLICYCOREUTILS),yy)
 define ROOTFS_SELINUX
 	$(HOST_DIR)/sbin/setfiles -m -r $(TARGET_DIR) \
-- 
2.26.2
