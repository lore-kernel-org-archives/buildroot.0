From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri,  9 Apr 2010 11:07:05 +0200
Subject: [Buildroot] [PATCH 27/44] cloop: convert to ROOTFS_TARGET
	infrastructure
In-Reply-To: <cover.1270803901.git.thomas.petazzoni@free-electrons.com>
References: <cover.1270803901.git.thomas.petazzoni@free-electrons.com>
Message-ID: <f57982ffd5c3e5f9abb63867950b148b0d36cfe3.1270803901.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 target/cloop/cloop.mk |   26 +++++---------------------
 1 files changed, 5 insertions(+), 21 deletions(-)

diff --git a/target/cloop/cloop.mk b/target/cloop/cloop.mk
index ccdb2b4..c1d6abb 100644
--- a/target/cloop/cloop.mk
+++ b/target/cloop/cloop.mk
@@ -4,26 +4,10 @@
 #
 #############################################################
 
-CLOOP_TARGET=$(IMAGE).cloop
-CLOOP_FAKEROOT_SCRIPT=$(BUILD_DIR)/_fakeroot.$(notdir $(CLOOP_TARGET))
+ROOTFS_CLOOP_DEPENDENCIES = host-cloop host-cdrkit
 
-clooproot: host-cloop host-cdrkit host-fakeroot
-	rm -f $(CLOOP_FAKEROOT_SCRIPT)
-	touch $(BUILD_DIR)/.fakeroot.00000
-	cat $(BUILD_DIR)/.fakeroot* > $(CLOOP_FAKEROOT_SCRIPT)
-	# Use fakeroot to pretend all target binaries are owned by root
-	echo "chown -R 0:0 $(TARGET_DIR)" >> $(CLOOP_FAKEROOT_SCRIPT)
-ifneq ($(TARGET_DEVICE_TABLE),)
-	# Use fakeroot to pretend to create all needed device nodes
-	echo "$(HOST_DIR)/usr/bin/makedevs -d $(TARGET_DEVICE_TABLE) $(TARGET_DIR)" \
-		>> $(CLOOP_FAKEROOT_SCRIPT)
-endif
-	# Use fakeroot so genisoimage believes the previous fakery
-	echo "$(HOST_DIR)/usr/bin/genisoimage -r $(TARGET_DIR) | $(HOST_DIR)/usr/bin/create_compressed_fs - 65536 > $(CLOOP_TARGET)" >> $(CLOOP_FAKEROOT_SCRIPT)
-	chmod a+x $(CLOOP_FAKEROOT_SCRIPT)
-	$(HOST_DIR)/usr/bin/fakeroot -- $(CLOOP_FAKEROOT_SCRIPT)
-	- at rm -f $(CLOOP_FAKEROOT_SCRIPT)
+define ROOTFS_CLOOP_CMD
+	$(HOST_DIR)/usr/bin/genisoimage -r $(TARGET_DIR) | $(HOST_DIR)/usr/bin/create_compressed_fs - 65536 > $$@
+endef
 
-ifeq ($(BR2_TARGET_ROOTFS_CLOOP),y)
-TARGETS+=clooproot
-endif
+$(eval $(call ROOTFS_TARGET,cloop))
\ No newline at end of file
-- 
1.6.3.3
