From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri,  9 Apr 2010 11:07:14 +0200
Subject: [Buildroot] [PATCH 36/44] initramfs: convert to ROOTFS_TARGET
	infrastructure
In-Reply-To: <cover.1270803901.git.thomas.petazzoni@free-electrons.com>
References: <cover.1270803901.git.thomas.petazzoni@free-electrons.com>
Message-ID: <9d8e1b69ab342320c448091f78a3a93da2dbdf82.1270803901.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 target/initramfs/initramfs.mk |   37 ++++++-------------------------------
 1 files changed, 6 insertions(+), 31 deletions(-)

diff --git a/target/initramfs/initramfs.mk b/target/initramfs/initramfs.mk
index 0030278..cf1fcdb 100644
--- a/target/initramfs/initramfs.mk
+++ b/target/initramfs/initramfs.mk
@@ -6,38 +6,13 @@
 #
 #############################################################
 
-ifeq ($(BR2_TARGET_ROOTFS_INITRAMFS),y)
-INITRAMFS_TARGET:=$(IMAGE).initramfs_list
-else
-INITRAMFS_TARGET:= #nothing
-endif
-
-TARGETS+=$(INITRAMFS_TARGET)
-
-$(INITRAMFS_TARGET) initramfs: host-fakeroot makedevs
+define ROOTFS_INITRAMFS_INIT_SYMLINK
 	rm -f $(TARGET_DIR)/init
 	ln -s sbin/init $(TARGET_DIR)/init
-	# Use fakeroot to pretend all target binaries are owned by root
-	rm -f $(BUILD_DIR)/_fakeroot.$(notdir $(TAR_TARGET))
-	touch $(BUILD_DIR)/.fakeroot.00000
-	cat $(BUILD_DIR)/.fakeroot* > $(BUILD_DIR)/_fakeroot.$(notdir $(TAR_TARGET))
-	echo "chown -R 0:0 $(TARGET_DIR)" >> $(BUILD_DIR)/_fakeroot.$(notdir $(TAR_TARGET))
-	# Use fakeroot to pretend to create all needed device nodes
-	echo "$(HOST_DIR)/usr/bin/makedevs -d $(TARGET_DEVICE_TABLE) $(TARGET_DIR)" \
-		>> $(BUILD_DIR)/_fakeroot.$(notdir $(TAR_TARGET))
-	# Use fakeroot so gen_initramfs_list.sh believes the previous fakery
-	echo "$(SHELL) target/initramfs/gen_initramfs_list.sh -u 0 -g 0 $(TARGET_DIR) > $(INITRAMFS_TARGET)" \
-		>> $(BUILD_DIR)/_fakeroot.$(notdir $(TAR_TARGET))
-	chmod a+x $(BUILD_DIR)/_fakeroot.$(notdir $(TAR_TARGET))
-	$(HOST_DIR)/usr/bin/fakeroot -- $(BUILD_DIR)/_fakeroot.$(notdir $(TAR_TARGET))
-	-rm -f $(BUILD_DIR)/_fakeroot.$(notdir $(TAR_TARGET))
-
-initramfs-source:
-
-initramfs-clean:
-ifeq ($(BR2_TARGET_ROOTFS_INITRAMFS),y)
-	-rm -f $(INITRAMFS_TARGET)
-endif
-initramfs-dirclean:
+endef
 
+define ROOTFS_INITRAMFS_CMD
+	$(SHELL) target/initramfs/gen_initramfs_list.sh -u 0 -g 0 $(TARGET_DIR) > $$@
+endef
 
+$(eval $(call ROOTFS_TARGET,initramfs))
\ No newline at end of file
-- 
1.6.3.3
