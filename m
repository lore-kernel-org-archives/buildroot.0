From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 9 Apr 2010 16:19:13 +0200
Subject: [Buildroot] [git commit master] squashfs: convert to ROOTFS_TARGET
	infrastructure
Message-ID: <20100409142130.29F3D20E66@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=3892493f8ddcc3219b1ce6ee8ebdc25eb999c2c4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 target/squashfs/squashfsroot.mk |   34 +++++-----------------------------
 1 files changed, 5 insertions(+), 29 deletions(-)

diff --git a/target/squashfs/squashfsroot.mk b/target/squashfs/squashfsroot.mk
index 01c4dab..d72388e 100644
--- a/target/squashfs/squashfsroot.mk
+++ b/target/squashfs/squashfsroot.mk
@@ -4,34 +4,10 @@
 #
 #############################################################
 
-SQUASHFS_TARGET:=$(IMAGE).squashfs
+ROOTFS_SQUASHFS_DEPENDENCIES = host-squashfs
 
-squashfsroot: host-fakeroot host-squashfs makedevs
-	# Use fakeroot to pretend all target binaries are owned by root
-	rm -f $(BUILD_DIR)/_fakeroot.$(notdir $(SQUASHFS_TARGET))
-	touch $(BUILD_DIR)/.fakeroot.00000
-	cat $(BUILD_DIR)/.fakeroot* > $(BUILD_DIR)/_fakeroot.$(notdir $(SQUASHFS_TARGET))
-	echo "chown -R 0:0 $(TARGET_DIR)" >> $(BUILD_DIR)/_fakeroot.$(notdir $(SQUASHFS_TARGET))
-ifneq ($(TARGET_DEVICE_TABLE),)
-	# Use fakeroot to pretend to create all needed device nodes
-	echo "$(HOST_DIR)/usr/bin/makedevs -d $(TARGET_DEVICE_TABLE) $(TARGET_DIR)" \
-		>> $(BUILD_DIR)/_fakeroot.$(notdir $(SQUASHFS_TARGET))
-endif
-	# Use fakeroot so mksquashfs believes the previous fakery
-	echo "$(HOST_DIR)/usr/bin/mksquashfs " \
-		    "$(TARGET_DIR) $(SQUASHFS_TARGET) " \
-		    "-noappend $(SQUASHFS_ENDIANNESS)" \
-		>> $(BUILD_DIR)/_fakeroot.$(notdir $(SQUASHFS_TARGET))
-	chmod a+x $(BUILD_DIR)/_fakeroot.$(notdir $(SQUASHFS_TARGET))
-	$(HOST_DIR)/usr/bin/fakeroot -- $(BUILD_DIR)/_fakeroot.$(notdir $(SQUASHFS_TARGET))
-	chmod 0644 $(SQUASHFS_TARGET)
-	- at rm -f $(BUILD_DIR)/_fakeroot.$(notdir $(SQUASHFS_TARGET))
+define ROOTFS_SQUASHFS_CMD
+	$(HOST_DIR)/usr/bin/mksquashfs $(TARGET_DIR) $$@ -noappend
+endef
 
-#############################################################
-#
-# Toplevel Makefile options
-#
-#############################################################
-ifeq ($(BR2_TARGET_ROOTFS_SQUASHFS),y)
-TARGETS+=squashfsroot
-endif
+$(eval $(call ROOTFS_TARGET,squashfs))
\ No newline at end of file
-- 
1.6.3.3
