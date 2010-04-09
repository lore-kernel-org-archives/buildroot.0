From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 9 Apr 2010 16:19:13 +0200
Subject: [Buildroot] [git commit master] romfs: convert to ROOTFS_TARGET
	infrastructure
Message-ID: <20100409142129.C382120E64@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=aa50ffdbffde0d6012f50a433d0404186e74eacc
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 target/romfs/romfs.mk |   30 ++++++------------------------
 1 files changed, 6 insertions(+), 24 deletions(-)

diff --git a/target/romfs/romfs.mk b/target/romfs/romfs.mk
index e4b8ff5..9719478 100644
--- a/target/romfs/romfs.mk
+++ b/target/romfs/romfs.mk
@@ -6,28 +6,10 @@
 
 ROMFS_TARGET=$(IMAGE).romfs
 
-romfsroot: host-fakeroot host-genromfs makedevs
-	# Use fakeroot to pretend all target binaries are owned by root
-	rm -f $(BUILD_DIR)/_fakeroot.$(notdir $(ROMFS_TARGET))
-	touch $(BUILD_DIR)/.fakeroot.00000
-	cat $(BUILD_DIR)/.fakeroot* > $(BUILD_DIR)/_fakeroot.$(notdir $(ROMFS_TARGET))
-	echo "chown -R 0:0 $(TARGET_DIR)" >> $(BUILD_DIR)/_fakeroot.$(notdir $(ROMFS_TARGET))
-ifneq ($(TARGET_DEVICE_TABLE),)
-	# Use fakeroot to pretend to create all needed device nodes
-	echo "$(HOST_DIR)/usr/bin/makedevs -d $(TARGET_DEVICE_TABLE) $(TARGET_DIR)" \
-		>> $(BUILD_DIR)/_fakeroot.$(notdir $(ROMFS_TARGET))
-endif
-	# Use fakeroot so genromfs believes the previous fakery
-	echo "$(HOST_DIR)/usr/bin/genromfs -d $(TARGET_DIR) -f $(ROMFS_TARGET)" >> $(BUILD_DIR)/_fakeroot.$(notdir $(ROMFS_TARGET))
-	chmod a+x $(BUILD_DIR)/_fakeroot.$(notdir $(ROMFS_TARGET))
-	$(HOST_DIR)/usr/bin/fakeroot -- $(BUILD_DIR)/_fakeroot.$(notdir $(ROMFS_TARGET))
-	- at rm -f $(BUILD_DIR)/_fakeroot.$(notdir $(ROMFS_TARGET))
+ROOTFS_ROMFS_DEPENDENCIES = host-genromfs
 
-#############################################################
-#
-# Toplevel Makefile options
-#
-#############################################################
-ifeq ($(BR2_TARGET_ROOTFS_ROMFS),y)
-TARGETS+=romfsroot
-endif
+define ROOTFS_ROMFS_CMD
+	$(HOST_DIR)/usr/bin/genromfs -d $(TARGET_DIR) -f $$@
+endef
+
+$(eval $(call ROOTFS_TARGET,romfs))
\ No newline at end of file
-- 
1.6.3.3
