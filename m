From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Apr 2015 11:50:59 +0200
Subject: [Buildroot] [PATCHv4 01/18] fs: only add non rootfs- targets to
	PACKAGES
In-Reply-To: <1430041876-16436-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1430041876-16436-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1430041876-16436-2-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Commit 4570dbcb14b394d8f3c97baf4c9e5f4f225d1d37
("4570dbcb14b394d8f3c97baf4c9e5f4f225d1d37") added the dependencies of
rootfs building logic to PACKAGES, only thinking about the case where
rootfs building logic actually depends on real, normal packages
(host-mtd, host-genext2fs, etc.). But some file systems (rootfs-ubi)
depend on other filesystem images (rootfs-ubifs). And such targets
should not be added to PACKAGES, otherwise an incorrect circular
dependency is created.

This commit fixes that by only adding the rootfs building logic
dependencies that do *not* start with rootfs- to the global PACKAGES
variable.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 fs/common.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/common.mk b/fs/common.mk
index 41ee86d..4387d06 100644
--- a/fs/common.mk
+++ b/fs/common.mk
@@ -106,7 +106,7 @@ rootfs-$(1): $$(BINARIES_DIR)/rootfs.$(1) $$(ROOTFS_$(2)_POST_TARGETS)
 
 ifeq ($$(BR2_TARGET_ROOTFS_$(2)),y)
 TARGETS_ROOTFS += rootfs-$(1)
-PACKAGES += $$(ROOTFS_$(2)_DEPENDENCIES)
+PACKAGES += $$(filter-out rootfs-%,$$(ROOTFS_$(2)_DEPENDENCIES))
 endif
 endef
 
-- 
2.1.0
