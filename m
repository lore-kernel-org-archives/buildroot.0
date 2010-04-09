From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri,  9 Apr 2010 11:07:17 +0200
Subject: [Buildroot] [PATCH 39/44] iso9660: rework in a similar way to
	ROOTFS_TARGET
In-Reply-To: <cover.1270803901.git.thomas.petazzoni@free-electrons.com>
References: <cover.1270803901.git.thomas.petazzoni@free-electrons.com>
Message-ID: <eefa832dff6539f85f1ed9b3be1721da11107df3.1270803901.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Unfortunately, it cannot use the ROOTFS_TARGET infrastructure, due to
the specifities of the iso9660 build process.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 target/iso9660/Config.in  |    5 -----
 target/iso9660/iso9660.mk |   30 ++++++++++++++++--------------
 2 files changed, 16 insertions(+), 19 deletions(-)

diff --git a/target/iso9660/Config.in b/target/iso9660/Config.in
index 40c93b3..ceee52f 100644
--- a/target/iso9660/Config.in
+++ b/target/iso9660/Config.in
@@ -7,11 +7,6 @@ config BR2_TARGET_ROOTFS_ISO9660
 	help
 	  Build a bootable iso9660 image
 
-config BR2_TARGET_ROOTFS_ISO9660_OUTPUT
-	string "Output File"
-	depends on BR2_TARGET_ROOTFS_ISO9660
-	default "$(IMAGE).iso"
-
 config BR2_TARGET_ROOTFS_ISO9660_BOOT_MENU
 	string "Boot menu.lst file"
 	depends on BR2_TARGET_ROOTFS_ISO9660
diff --git a/target/iso9660/iso9660.mk b/target/iso9660/iso9660.mk
index a198c17..66e2de2 100644
--- a/target/iso9660/iso9660.mk
+++ b/target/iso9660/iso9660.mk
@@ -2,10 +2,12 @@
 #
 # Build the iso96600 root filesystem image
 #
+# Cannot be converted to the ROOTFS_TARGET infrastructure, because of
+# the temporary construction in ISO9660_TARGET_DIR.
+#
 #############################################################
 
 ISO9660_TARGET_DIR=$(BUILD_DIR)/iso9660
-ISO9660_TARGET:=$(call qstrip,$(BR2_TARGET_ROOTFS_ISO9660_OUTPUT))
 ISO9660_BOOT_MENU:=$(call qstrip,$(BR2_TARGET_ROOTFS_ISO9660_BOOT_MENU))
 ISO9660_OPTS:=
 
@@ -13,7 +15,8 @@ ifeq ($(BR2_TARGET_ROOTFS_ISO9660_SQUASH),y)
 ISO9660_OPTS+=-U
 endif
 
-$(ISO9660_TARGET): host-fakeroot host-cdrkit $(LINUX_KERNEL) $(EXT2_TARGET) grub
+$(BINARIES_DIR)/rootfs.iso9660: host-cdrkit host-fakeroot $(LINUX_KERNEL) $(BINARIES_DIR)/rootfs.ext2 grub
+	@$(call MESSAGE,"Generating root filesystem image rootfs.iso9660")
 	mkdir -p $(ISO9660_TARGET_DIR)
 	mkdir -p $(ISO9660_TARGET_DIR)/boot/grub
 	cp $(GRUB_DIR)/stage2/stage2_eltorito $(ISO9660_TARGET_DIR)/boot/grub/
@@ -21,21 +24,20 @@ $(ISO9660_TARGET): host-fakeroot host-cdrkit $(LINUX_KERNEL) $(EXT2_TARGET) grub
 	cp $(LINUX_KERNEL) $(ISO9660_TARGET_DIR)/kernel
 	cp $(EXT2_TARGET) $(ISO9660_TARGET_DIR)/initrd
 	# Use fakeroot to pretend all target binaries are owned by root
-	rm -f $(BUILD_DIR)/_fakeroot.$(notdir $(ISO9660_TARGET))
+	rm -f $(FAKEROOT_SCRIPT)
 	touch $(BUILD_DIR)/.fakeroot.00000
-	cat $(BUILD_DIR)/.fakeroot* > $(BUILD_DIR)/_fakeroot.$(notdir $(ISO9660_TARGET))
-	echo "chown -R 0:0 $(ISO9660_TARGET_DIR)" >> $(BUILD_DIR)/_fakeroot.$(notdir $(ISO9660_TARGET))
+	cat $(BUILD_DIR)/.fakeroot* > $(FAKEROOT_SCRIPT)
+	echo "chown -R 0:0 $(ISO9660_TARGET_DIR)" >> $(FAKEROOT_SCRIPT)
 	# Use fakeroot so mkisofs believes the previous fakery
 	echo "$(HOST_DIR)/usr/bin/genisoimage -R -b boot/grub/stage2_eltorito -no-emul-boot " \
-		"-boot-load-size 4 -boot-info-table -o $(ISO9660_TARGET) $(ISO9660_TARGET_DIR)" \
-		>> $(BUILD_DIR)/_fakeroot.$(notdir $(ISO9660_TARGET))
-	chmod a+x $(BUILD_DIR)/_fakeroot.$(notdir $(ISO9660_TARGET))
-	$(HOST_DIR)/usr/bin/fakeroot -- $(BUILD_DIR)/_fakeroot.$(notdir $(ISO9660_TARGET))
-	- at rm -f $(BUILD_DIR)/_fakeroot.$(notdir $(ISO9660_TARGET))
+		"-boot-load-size 4 -boot-info-table -o $@ $(ISO9660_TARGET_DIR)" \
+		>> $(FAKEROOT_SCRIPT)
+	chmod a+x $(FAKEROOT_SCRIPT)
+	$(HOST_DIR)/usr/bin/fakeroot -- $(FAKEROOT_SCRIPT)
+	- at rm -f $(FAKEROOT_SCRIPT)
+	- at rm -rf $(ISO9660_TARGET_DIR)
 
-iso9660root: $(ISO9660_TARGET)
-	echo $(ISO9660_TARGET)
-	@ls -l $(ISO9660_TARGET)
+iso9660-root: $(BINARIES_DIR)/rootfs.iso9660
 
 #############################################################
 #
@@ -43,5 +45,5 @@ iso9660root: $(ISO9660_TARGET)
 #
 #############################################################
 ifeq ($(BR2_TARGET_ROOTFS_ISO9660),y)
-TARGETS+=iso9660root
+TARGETS+=iso9660-root
 endif
-- 
1.6.3.3
