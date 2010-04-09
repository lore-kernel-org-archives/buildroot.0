From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri,  9 Apr 2010 11:07:07 +0200
Subject: [Buildroot] [PATCH 29/44] cramfs: convert to ROOTFS_TARGET
	infrastructure
In-Reply-To: <cover.1270803901.git.thomas.petazzoni@free-electrons.com>
References: <cover.1270803901.git.thomas.petazzoni@free-electrons.com>
Message-ID: <5e530b7b95535fb6960e68a4ffba015c4c60fbaf.1270803901.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 target/cramfs/cramfs.mk |   31 +++++--------------------------
 1 files changed, 5 insertions(+), 26 deletions(-)

diff --git a/target/cramfs/cramfs.mk b/target/cramfs/cramfs.mk
index f431629..ccd316f 100644
--- a/target/cramfs/cramfs.mk
+++ b/target/cramfs/cramfs.mk
@@ -13,31 +13,10 @@ ifneq ($(TARGET_DEVICE_TABLE),)
 CRAMFS_OPTS += -D $(TARGET_DEVICE_TABLE)
 endif
 
-CRAMFS_TARGET=$(IMAGE).cramfs
+define ROOTFS_CRAMFS_CMD
+ $(HOST_DIR)/usr/bin/mkcramfs -q $(CRAMFS_OPTS) $(TARGET_DIR) $$@
+endef
 
-cramfsroot: host-fakeroot host-cramfs makedevs
-	# Use fakeroot to pretend all target binaries are owned by root
-	rm -f $(BUILD_DIR)/_fakeroot.$(notdir $(CRAMFS_TARGET))
-	touch $(BUILD_DIR)/.fakeroot.00000
-	cat $(BUILD_DIR)/.fakeroot* > $(BUILD_DIR)/_fakeroot.$(notdir $(CRAMFS_TARGET))
-	echo "chown -R 0:0 $(TARGET_DIR)" >> $(BUILD_DIR)/_fakeroot.$(notdir $(CRAMFS_TARGET))
-ifneq ($(TARGET_DEVICE_TABLE),)
-	# Use fakeroot to pretend to create all needed device nodes
-	echo "$(HOST_DIR)/usr/bin/makedevs -d $(TARGET_DEVICE_TABLE) $(TARGET_DIR)" \
-		>> $(BUILD_DIR)/_fakeroot.$(notdir $(CRAMFS_TARGET))
-endif
-	# Use fakeroot so mkcramfs believes the previous fakery
-	echo "$(HOST_DIR)/usr/bin/mkcramfs -q $(CRAMFS_OPTS) " \
-		"$(TARGET_DIR) $(CRAMFS_TARGET)" >> $(BUILD_DIR)/_fakeroot.$(notdir $(CRAMFS_TARGET))
-	chmod a+x $(BUILD_DIR)/_fakeroot.$(notdir $(CRAMFS_TARGET))
-	$(HOST_DIR)/usr/bin/fakeroot -- $(BUILD_DIR)/_fakeroot.$(notdir $(CRAMFS_TARGET))
-	- at rm -f $(BUILD_DIR)/_fakeroot.$(notdir $(CRAMFS_TARGET))
+ROOTFS_CRAMFS_DEPENDENCIES = host-cramfs
 
-#############################################################
-#
-# Toplevel Makefile options
-#
-#############################################################
-ifeq ($(BR2_TARGET_ROOTFS_CRAMFS),y)
-TARGETS+=cramfsroot
-endif
+$(eval $(call ROOTFS_TARGET,cramfs))
\ No newline at end of file
-- 
1.6.3.3
