From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon,  3 Dec 2018 21:53:05 +0100
Subject: [Buildroot] [PATCH v3 2/2] fs/common.mk: allow user provided
 permissions to override packages permissions
In-Reply-To: <20181203205306.27361-1-thomas.petazzoni@bootlin.com>
References: <20181203205306.27361-1-thomas.petazzoni@bootlin.com>
Message-ID: <20181203205306.27361-3-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Reported-by: Matthew Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Matthew Weber <matthew.weber@rockwellcollins.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
-- 
2.19.2
