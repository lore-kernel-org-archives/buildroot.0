From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 1 Feb 2016 07:25:36 +0100
Subject: [Buildroot] [git commit] fs/common: generate users before setting
	permissions
Message-ID: <20160201224703.64EE27F90D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3f28a38e1ab4c7556be0b5ec059dd78302e0884a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We will need the users and groups to get defined before we can use them
from makedevs.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 fs/common.mk | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/fs/common.mk b/fs/common.mk
index 528e194..3a424f6 100644
--- a/fs/common.mk
+++ b/fs/common.mk
@@ -78,6 +78,11 @@ $$(BINARIES_DIR)/rootfs.$(1): target-finalize $$(ROOTFS_$(2)_DEPENDENCIES)
 	rm -f $$(USERS_TABLE)
 	echo "set -e" >> $$(FAKEROOT_SCRIPT)
 	echo "chown -h -R 0:0 $$(TARGET_DIR)" >> $$(FAKEROOT_SCRIPT)
+ifneq ($$(ROOTFS_USERS_TABLES),)
+	cat $$(ROOTFS_USERS_TABLES) >> $$(USERS_TABLE)
+endif
+	printf '$$(subst $$(sep),\n,$$(PACKAGES_USERS))' >> $$(USERS_TABLE)
+	PATH=$$(BR_PATH) $$(TOPDIR)/support/scripts/mkusers $$(USERS_TABLE) $$(TARGET_DIR) >> $$(FAKEROOT_SCRIPT)
 ifneq ($$(ROOTFS_DEVICE_TABLES),)
 	cat $$(ROOTFS_DEVICE_TABLES) > $$(FULL_DEVICE_TABLE)
 ifeq ($$(BR2_ROOTFS_DEVICE_CREATION_STATIC),y)
@@ -86,11 +91,6 @@ endif
 	printf '$$(subst $$(sep),\n,$$(PACKAGES_PERMISSIONS_TABLE))' >> $$(FULL_DEVICE_TABLE)
 	echo "$$(HOST_DIR)/usr/bin/makedevs -d $$(FULL_DEVICE_TABLE) $$(TARGET_DIR)" >> $$(FAKEROOT_SCRIPT)
 endif
-ifneq ($$(ROOTFS_USERS_TABLES),)
-	cat $$(ROOTFS_USERS_TABLES) >> $$(USERS_TABLE)
-endif
-	printf '$$(subst $$(sep),\n,$$(PACKAGES_USERS))' >> $$(USERS_TABLE)
-	PATH=$$(BR_PATH) $$(TOPDIR)/support/scripts/mkusers $$(USERS_TABLE) $$(TARGET_DIR) >> $$(FAKEROOT_SCRIPT)
 	echo "$$(ROOTFS_$(2)_CMD)" >> $$(FAKEROOT_SCRIPT)
 	chmod a+x $$(FAKEROOT_SCRIPT)
 	PATH=$$(BR_PATH) $$(HOST_DIR)/usr/bin/fakeroot -- $$(FAKEROOT_SCRIPT)
