From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 9 Apr 2010 16:19:13 +0200
Subject: [Buildroot] [git commit master] target/romfs: cleanup
Message-ID: <20100409142126.CFDFF20E59@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=3cabc6cce153ee1265c477d840fe3887347053ae
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Remove the code needed to build host genromfs, since it can now be
done using package/genromfs.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 target/romfs/Config.in |    1 -
 target/romfs/romfs.mk  |   42 ++----------------------------------------
 2 files changed, 2 insertions(+), 41 deletions(-)

diff --git a/target/romfs/Config.in b/target/romfs/Config.in
index 03a23d4..7a8c663 100644
--- a/target/romfs/Config.in
+++ b/target/romfs/Config.in
@@ -1,6 +1,5 @@
 config BR2_TARGET_ROOTFS_ROMFS
 	bool "romfs root filesystem"
-	select BR2_HOST_FAKEROOT
 	help
 	  Build a romfs image of the root filesystem.
 
diff --git a/target/romfs/romfs.mk b/target/romfs/romfs.mk
index 6e7fbee..e4b8ff5 100644
--- a/target/romfs/romfs.mk
+++ b/target/romfs/romfs.mk
@@ -1,42 +1,12 @@
 #############################################################
 #
-# genromfs to build to target romfs filesystems
-#
-#############################################################
-ROMFS_VERSION=0.5.2
-ROMFS_DIR=$(BUILD_DIR)/genromfs-$(ROMFS_VERSION)
-ROMFS_SOURCE=genromfs-$(ROMFS_VERSION).tar.gz
-ROMFS_SITE=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/romfs
-
-$(DL_DIR)/$(ROMFS_SOURCE):
-	 $(call DOWNLOAD,$(ROMFS_SITE),$(ROMFS_SOURCE))
-
-$(ROMFS_DIR): $(DL_DIR)/$(ROMFS_SOURCE)
-	$(ZCAT) $(DL_DIR)/$(ROMFS_SOURCE) | tar -C $(BUILD_DIR) -xvf -
-
-$(ROMFS_DIR)/genromfs: $(ROMFS_DIR)
-	$(MAKE) -C $(ROMFS_DIR)
-	touch -c $@
-
-romfs: $(ROMFS_DIR)/genromfs
-
-romfs-source: $(DL_DIR)/$(ROMFS_SOURCE)
-
-romfs-clean:
-	-$(MAKE) -C $(ROMFS_DIR) clean
-
-romfs-dirclean:
-	rm -rf $(ROMFS_DIR)
-
-#############################################################
-#
 # Build the romfs root filesystem image
 #
 #############################################################
 
 ROMFS_TARGET=$(IMAGE).romfs
 
-romfsroot: host-fakeroot makedevs romfs
+romfsroot: host-fakeroot host-genromfs makedevs
 	# Use fakeroot to pretend all target binaries are owned by root
 	rm -f $(BUILD_DIR)/_fakeroot.$(notdir $(ROMFS_TARGET))
 	touch $(BUILD_DIR)/.fakeroot.00000
@@ -48,19 +18,11 @@ ifneq ($(TARGET_DEVICE_TABLE),)
 		>> $(BUILD_DIR)/_fakeroot.$(notdir $(ROMFS_TARGET))
 endif
 	# Use fakeroot so genromfs believes the previous fakery
-	echo "$(ROMFS_DIR)/genromfs -d $(TARGET_DIR) -f $(ROMFS_TARGET)" >> $(BUILD_DIR)/_fakeroot.$(notdir $(ROMFS_TARGET))
+	echo "$(HOST_DIR)/usr/bin/genromfs -d $(TARGET_DIR) -f $(ROMFS_TARGET)" >> $(BUILD_DIR)/_fakeroot.$(notdir $(ROMFS_TARGET))
 	chmod a+x $(BUILD_DIR)/_fakeroot.$(notdir $(ROMFS_TARGET))
 	$(HOST_DIR)/usr/bin/fakeroot -- $(BUILD_DIR)/_fakeroot.$(notdir $(ROMFS_TARGET))
 	- at rm -f $(BUILD_DIR)/_fakeroot.$(notdir $(ROMFS_TARGET))
 
-romfsroot-source: romfs-source
-
-romfsroot-clean:
-	-$(MAKE) -C $(ROMFS_DIR) clean
-
-romfsroot-dirclean:
-	rm -rf $(ROMFS_DIR)
-
 #############################################################
 #
 # Toplevel Makefile options
-- 
1.6.3.3
