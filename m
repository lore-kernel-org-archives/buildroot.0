From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 9 Apr 2010 16:19:13 +0200
Subject: [Buildroot] [git commit master] tar: convert to ROOTFS_TARGET
	infrastructure
Message-ID: <20100409142129.EDDD420E65@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=959ee39bf6b00a1f7ecb27936a2d8efb6a4fc103
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 target/tar/tarroot.mk |   49 ++++---------------------------------------------
 1 files changed, 4 insertions(+), 45 deletions(-)

diff --git a/target/tar/tarroot.mk b/target/tar/tarroot.mk
index cd01bc7..4d435cb 100644
--- a/target/tar/tarroot.mk
+++ b/target/tar/tarroot.mk
@@ -5,50 +5,9 @@
 #############################################################
 
 TAR_OPTS:=$(BR2_TARGET_ROOTFS_TAR_OPTIONS)
-TAR_TARGET:=$(IMAGE).tar
 
-TAR_COMPRESSOR:=
-TAR_COMPRESSOR_EXT:=.none
-ifeq ($(BR2_TARGET_ROOTFS_TAR_GZIP),y)
-TAR_COMPRESSOR:=gzip -9 -c
-TAR_COMPRESSOR_EXT:=gz
-endif
-ifeq ($(BR2_TARGET_ROOTFS_TAR_BZIP2),y)
-TAR_COMPRESSOR:=bzip2 -9 -c
-TAR_COMPRESSOR_EXT:=bz2
-endif
-ifeq ($(BR2_TARGET_ROOTFS_TAR_LZMA),y)
-TAR_COMPRESSOR:=lzma -9 -c
-TAR_COMPRESSOR_EXT:=lzma
-endif
+define ROOTFS_TAR_CMD
+ tar -c$(TAR_OPTS)f $$@ -C $(TARGET_DIR) .
+endef
 
-tarroot: host-fakeroot makedevs
-	# Use fakeroot to pretend all target binaries are owned by root
-	rm -f $(BUILD_DIR)/_fakeroot.$(notdir $(TAR_TARGET))
-	touch $(BUILD_DIR)/.fakeroot.00000
-	cat $(BUILD_DIR)/.fakeroot* > $(BUILD_DIR)/_fakeroot.$(notdir $(TAR_TARGET))
-	echo "chown -R 0:0 $(TARGET_DIR)" >> $(BUILD_DIR)/_fakeroot.$(notdir $(TAR_TARGET))
-ifneq ($(TARGET_DEVICE_TABLE),)
-	# Use fakeroot to pretend to create all needed device nodes
-	echo "$(HOST_DIR)/usr/bin/makedevs -d $(TARGET_DEVICE_TABLE) $(TARGET_DIR)" \
-		>> $(BUILD_DIR)/_fakeroot.$(notdir $(TAR_TARGET))
-endif
-	# Use fakeroot so tar believes the previous fakery
-	echo "tar -c$(TAR_OPTS)f $(TAR_TARGET) -C $(TARGET_DIR) ." \
-		>> $(BUILD_DIR)/_fakeroot.$(notdir $(TAR_TARGET))
-	chmod a+x $(BUILD_DIR)/_fakeroot.$(notdir $(TAR_TARGET))
-	$(HOST_DIR)/usr/bin/fakeroot -- $(BUILD_DIR)/_fakeroot.$(notdir $(TAR_TARGET))
-ifneq ($(TAR_COMPRESSOR),)
-	-rm -f $(TAR_TARGET).$()
-	PATH="$(STAGING_DIR)/sbin:$(STAGING_DIR)/bin:$(STAGING_DIR)/usr/sbin:$(STAGING_DIR)/usr/bin:$(PATH)" $(TAR_COMPRESSOR) $(TAR_TARGET) > $(TAR_TARGET).$(TAR_COMPRESSOR_EXT)
-endif
-	- at rm -f $(BUILD_DIR)/_fakeroot.$(notdir $(TAR_TARGET))
-
-#############################################################
-#
-# Toplevel Makefile options
-#
-#############################################################
-ifeq ($(BR2_TARGET_ROOTFS_TAR),y)
-TARGETS+=tarroot
-endif
+$(eval $(call ROOTFS_TARGET,tar))
-- 
1.6.3.3
