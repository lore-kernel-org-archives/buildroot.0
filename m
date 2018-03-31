From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 31 Mar 2018 20:53:05 +0200
Subject: [Buildroot] [git commit] fs: use a per-rootfs fakeroot script
Message-ID: <20180331185351.F064984BF8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=48152408306a0dd06153f1816568036738c628d5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

... and locate that script in a per-rootfs directory.

Just like for ROOTFS, this variable will leak down the dependency tree to
target-finalize and packages - But it doesn't matter as it isn't used
outside fs/.

[Peter: extend commit message]
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 fs/common.mk | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/fs/common.mk b/fs/common.mk
index 1915fbbe9b..b208c6f479 100644
--- a/fs/common.mk
+++ b/fs/common.mk
@@ -28,7 +28,6 @@
 # macro will automatically generate a compressed filesystem image.
 
 FS_DIR = $(BUILD_DIR)/buildroot-fs
-FAKEROOT_SCRIPT = $(FS_DIR)/fakeroot.fs
 FULL_DEVICE_TABLE = $(FS_DIR)/device_table.txt
 ROOTFS_DEVICE_TABLES = $(call qstrip,$(BR2_ROOTFS_DEVICE_TABLE) \
 	$(BR2_ROOTFS_STATIC_DEVICE_TABLE))
@@ -75,10 +74,11 @@ ROOTFS_$(2)_COMPRESS_CMD = xz -9 -C crc32 -c
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
