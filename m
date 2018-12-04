From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Tue, 4 Dec 2018 21:27:01 +0100
Subject: [Buildroot] [git commit] fs/common.mk: allow user provided
 permissions to override packages permissions
Message-ID: <20181204205452.DA6D98A62D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b67f0a99a94876280c3f5413225576e9e40c2fc8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Reported-by: Matthew Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Matthew Weber <matthew.weber@rockwellcollins.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 fs/common.mk | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/fs/common.mk b/fs/common.mk
index 6ad4cd0b01..077ce8903e 100644
--- a/fs/common.mk
+++ b/fs/common.mk
@@ -57,13 +57,14 @@ rootfs-common: $(ROOTFS_COMMON_DEPENDENCIES) target-finalize
 ifneq ($(ROOTFS_USERS_TABLES),)
 	cat $(ROOTFS_USERS_TABLES) >> $(ROOTFS_FULL_USERS_TABLE)
 endif
+
+	$(call PRINTF,$(PACKAGES_PERMISSIONS_TABLE)) > $(ROOTFS_FULL_DEVICES_TABLE)
 ifneq ($(ROOTFS_DEVICE_TABLES),)
-	cat $(ROOTFS_DEVICE_TABLES) > $(ROOTFS_FULL_DEVICES_TABLE)
+	cat $(ROOTFS_DEVICE_TABLES) >> $(ROOTFS_FULL_DEVICES_TABLE)
 ifeq ($(BR2_ROOTFS_DEVICE_CREATION_STATIC),y)
 	$(call PRINTF,$(PACKAGES_DEVICES_TABLE)) >> $(ROOTFS_FULL_DEVICES_TABLE)
 endif
 endif
-	$(call PRINTF,$(PACKAGES_PERMISSIONS_TABLE)) >> $(ROOTFS_FULL_DEVICES_TABLE)
 
 rootfs-common-show-depends:
 	@echo $(ROOTFS_COMMON_DEPENDENCIES)
