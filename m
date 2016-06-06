From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon,  6 Jun 2016 22:43:39 +0200
Subject: [Buildroot] [PATCH 2/7] fs: properly escape commands when
	generating fakeroot script
In-Reply-To: <cover.1465245732.git.yann.morin.1998@free.fr>
References: <cover.1465245732.git.yann.morin.1998@free.fr>
Message-ID: <6c8dfa97d175a53b304c666c0ec27522413e3d4c.1465245732.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Use the newly-introduced PRINTF macro to generate printf formats
that do "The Right Thing (TM)".

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 fs/common.mk | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/fs/common.mk b/fs/common.mk
index 46e097b..f7a73bb 100644
--- a/fs/common.mk
+++ b/fs/common.mk
@@ -81,17 +81,17 @@ $$(BINARIES_DIR)/rootfs.$(1): target-finalize $$(ROOTFS_$(2)_DEPENDENCIES)
 ifneq ($$(ROOTFS_USERS_TABLES),)
 	cat $$(ROOTFS_USERS_TABLES) >> $$(USERS_TABLE)
 endif
-	printf '$$(subst $$(sep),\n,$$(PACKAGES_USERS))' >> $$(USERS_TABLE)
+	$$(call PRINTF,$$(PACKAGES_USERS)) >> $$(USERS_TABLE)
 	PATH=$$(BR_PATH) $$(TOPDIR)/support/scripts/mkusers $$(USERS_TABLE) $$(TARGET_DIR) >> $$(FAKEROOT_SCRIPT)
 ifneq ($$(ROOTFS_DEVICE_TABLES),)
 	cat $$(ROOTFS_DEVICE_TABLES) > $$(FULL_DEVICE_TABLE)
 ifeq ($$(BR2_ROOTFS_DEVICE_CREATION_STATIC),y)
-	printf '$$(subst $$(sep),\n,$$(PACKAGES_DEVICES_TABLE))' >> $$(FULL_DEVICE_TABLE)
+	$$(call PRINTF,$$(PACKAGES_DEVICES_TABLE)) >> $$(FULL_DEVICE_TABLE)
 endif
-	printf '$$(subst $$(sep),\n,$$(PACKAGES_PERMISSIONS_TABLE))' >> $$(FULL_DEVICE_TABLE)
+	$$(call PRINTF,$$(PACKAGES_PERMISSIONS_TABLE)) >> $$(FULL_DEVICE_TABLE)
 	echo "$$(HOST_DIR)/usr/bin/makedevs -d $$(FULL_DEVICE_TABLE) $$(TARGET_DIR)" >> $$(FAKEROOT_SCRIPT)
 endif
-	echo "$$(ROOTFS_$(2)_CMD)" >> $$(FAKEROOT_SCRIPT)
+	$$(call PRINTF,$$(ROOTFS_$(2)_CMD)) >> $$(FAKEROOT_SCRIPT)
 	chmod a+x $$(FAKEROOT_SCRIPT)
 	PATH=$$(BR_PATH) $$(HOST_DIR)/usr/bin/fakeroot -- $$(FAKEROOT_SCRIPT)
 	$$(INSTALL) -m 0644 support/misc/target-dir-warning.txt $$(TARGET_DIR_WARNING_FILE)
-- 
2.7.4
