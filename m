From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon,  5 Feb 2018 09:42:25 +0100
Subject: [Buildroot] [PATCH 07/15 v2] fs: use a per-rootfs fakeroot script
In-Reply-To: <cover.1517820133.git.yann.morin.1998@free.fr>
References: <cover.1517820133.git.yann.morin.1998@free.fr>
Message-ID: <31fc4d53ade7ee8b239179582d16e2a12f460406.1517820133.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

... and locate that script in a per-rootfs directory.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
---
 fs/common.mk | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/fs/common.mk b/fs/common.mk
index eebe83d6e5..db4f8c23ad 100644
--- a/fs/common.mk
+++ b/fs/common.mk
@@ -28,7 +28,6 @@
 # macro will automatically generate a compressed filesystem image.
 
 FS_DIR = $(BUILD_DIR)/buildroot-fs
-FAKEROOT_SCRIPT = $(FS_DIR)/fakeroot.fs
 FULL_DEVICE_TABLE = $(FS_DIR)/device_table.txt
 ROOTFS_DEVICE_TABLES = $(call qstrip,$(BR2_ROOTFS_DEVICE_TABLE) \
 	$(BR2_ROOTFS_STATIC_DEVICE_TABLE))
@@ -76,10 +75,11 @@ ROOTFS_$(2)_COMPRESS_CMD = xz -9 -C crc32 -c
 endif
 
 $$(BINARIES_DIR)/rootfs.$(1): ROOTFS=$(2)
+$$(BINARIES_DIR)/rootfs.$(1): FAKEROOT_SCRIPT=$$(ROOTFS_$(2)_DIR)/fakeroot
 $$(BINARIES_DIR)/rootfs.$(1): target-finalize $$(ROOTFS_$(2)_DEPENDENCIES)
 	@$$(call MESSAGE,"Generating root filesystem image rootfs.$(1)")
-	rm -rf $(FS_DIR)
-	mkdir -p $(FS_DIR)
+	rm -rf $(FS_DIR) $$(ROOTFS_$(2)_DIR)
+	mkdir -p $(FS_DIR) $$(ROOTFS_$(2)_DIR)
 	echo '#!/bin/sh' > $$(FAKEROOT_SCRIPT)
 	echo "set -e" >> $$(FAKEROOT_SCRIPT)
 	$$(foreach hook,$$(ROOTFS_$(2)_PRE_GEN_HOOKS),\
-- 
2.14.1
