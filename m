From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 14 Dec 2016 23:45:48 +0100
Subject: [Buildroot] [git commit] fs: set packages permissions even with no
	system device tables
Message-ID: <20161214224721.A2E7F7FE1F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5b272e3e551e723bae78140f7de4029b9026d961
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Currently, when there is no syztem device table (permissions or static
devices) defined, then package permissions are not applied, because they
are guarded by the check on the system device tables being non empty.

Fix that by narrowing the guarding condition.

Note that the dependency on host-makedevs was not conditional; we always
build it even if we don't need it. Making it conditional is not
possible, because we don't know all the packages permissions by the time
the fs infra is parsed (packages from br2-external are parsed after it).

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 fs/common.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/common.mk b/fs/common.mk
index 7515fdc..396b1c2 100644
--- a/fs/common.mk
+++ b/fs/common.mk
@@ -89,9 +89,9 @@ ifneq ($$(ROOTFS_DEVICE_TABLES),)
 ifeq ($$(BR2_ROOTFS_DEVICE_CREATION_STATIC),y)
 	$$(call PRINTF,$$(PACKAGES_DEVICES_TABLE)) >> $$(FULL_DEVICE_TABLE)
 endif
+endif
 	$$(call PRINTF,$$(PACKAGES_PERMISSIONS_TABLE)) >> $$(FULL_DEVICE_TABLE)
 	echo "$$(HOST_DIR)/usr/bin/makedevs -d $$(FULL_DEVICE_TABLE) $$(TARGET_DIR)" >> $$(FAKEROOT_SCRIPT)
-endif
 	$$(foreach s,$$(call qstrip,$$(BR2_ROOTFS_POST_FAKEROOT_SCRIPT)),\
 		echo "echo '$$(TERM_BOLD)>>>   Executing fakeroot script $$(s)$$(TERM_RESET)'" >> $$(FAKEROOT_SCRIPT); \
 		echo $$(s) $$(TARGET_DIR) $$(BR2_ROOTFS_POST_SCRIPT_ARGS) >> $$(FAKEROOT_SCRIPT)$$(sep))
