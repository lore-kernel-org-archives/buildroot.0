From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Tue, 4 Dec 2018 21:53:14 +0100
Subject: [Buildroot] [git commit] fs/common.mk: make sure that static
 devices from packages are created
Message-ID: <20181204205452.E9B5E8A62D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ac3b476bf5bfd04975d046dfba3336626d91c630
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The static devices defined by packages are currently added to the full
device table when two conditions are met:

 (1) ROOTFS_DEVICE_TABLES is non-empty
 (2) BR2_ROOTFS_DEVICE_CREATION_STATIC=y

(2) is obviously correct. However, depending on (1) is not correct: if
the user doesn't provide any custom permission table and custom device
table, then ROOTFS_DEVICE_TABLES will be empty.

So instead, move the addition of the package-defined static devices
outside of condition (1), and have it only under condition (2).

Reported-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 fs/common.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/common.mk b/fs/common.mk
index 077ce8903e..a560417c6c 100644
--- a/fs/common.mk
+++ b/fs/common.mk
@@ -61,10 +61,10 @@ endif
 	$(call PRINTF,$(PACKAGES_PERMISSIONS_TABLE)) > $(ROOTFS_FULL_DEVICES_TABLE)
 ifneq ($(ROOTFS_DEVICE_TABLES),)
 	cat $(ROOTFS_DEVICE_TABLES) >> $(ROOTFS_FULL_DEVICES_TABLE)
+endif
 ifeq ($(BR2_ROOTFS_DEVICE_CREATION_STATIC),y)
 	$(call PRINTF,$(PACKAGES_DEVICES_TABLE)) >> $(ROOTFS_FULL_DEVICES_TABLE)
 endif
-endif
 
 rootfs-common-show-depends:
 	@echo $(ROOTFS_COMMON_DEPENDENCIES)
