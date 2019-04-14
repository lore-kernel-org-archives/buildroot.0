From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 14 Apr 2019 22:17:19 +0200
Subject: [Buildroot] [PATCH 08/12 v2] fs: add all recursive dependencies to
 packages list
In-Reply-To: <cover.1555273025.git.yann.morin.1998@free.fr>
References: <cover.1555273025.git.yann.morin.1998@free.fr>
Message-ID: <6dc29af3082c2b20bb4b385f63f1a35b4221fea1.1555273025.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently, only first-level dependencies of a filesystem are added to
the global list of packages, thus missing all recursive dependencies.

Use the newly introduced recursive variable instead, which already
contains the rootfs-common dependencies too.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
---
 fs/common.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/common.mk b/fs/common.mk
index 5ec28ca183..f7989eac57 100644
--- a/fs/common.mk
+++ b/fs/common.mk
@@ -190,7 +190,7 @@ rootfs-$(1): $$(BINARIES_DIR)/$$(ROOTFS_$(2)_FINAL_IMAGE_NAME)
 
 ifeq ($$(BR2_TARGET_ROOTFS_$(2)),y)
 TARGETS_ROOTFS += rootfs-$(1)
-PACKAGES += $$(filter-out rootfs-%,$$(ROOTFS_$(2)_DEPENDENCIES) $$(ROOTFS_COMMON_DEPENDENCIES))
+PACKAGES += $$(filter-out rootfs-%,$$(ROOTFS_$(2)_FINAL_RECURSIVE_DEPENDENCIES))
 endif
 
 # Check for legacy POST_TARGETS rules
-- 
2.14.1
