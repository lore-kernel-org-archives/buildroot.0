From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 9 Apr 2010 16:19:13 +0200
Subject: [Buildroot] [git commit master] target/ext2: cleanup
Message-ID: <20100409142126.192A420E56@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=8e599f7fc6404f290db1e9bebd7823aa46d2b34b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Remove the genext2fs host tools building process, which is now in
package/genext2fs.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 target/ext2/Config.in   |    1 -
 target/ext2/ext2root.mk |   56 ++++------------------------------------------
 2 files changed, 5 insertions(+), 52 deletions(-)

diff --git a/target/ext2/Config.in b/target/ext2/Config.in
index e94fb40..1b1dc8a 100644
--- a/target/ext2/Config.in
+++ b/target/ext2/Config.in
@@ -1,7 +1,6 @@
 config BR2_TARGET_ROOTFS_EXT2
 	bool "ext2 root filesystem"
 	default y
-	select BR2_HOST_FAKEROOT
 	help
 	  Build an ext2 root filesystem
 
diff --git a/target/ext2/ext2root.mk b/target/ext2/ext2root.mk
index 622b293..6c8e02a 100644
--- a/target/ext2/ext2root.mk
+++ b/target/ext2/ext2root.mk
@@ -1,41 +1,5 @@
 #############################################################
 #
-# genext2fs to build to target ext2 filesystems
-#
-#############################################################
-GENEXT2_VERSION=1.4
-GENEXT2_DIR=$(BUILD_DIR)/genext2fs-$(GENEXT2_VERSION)
-GENEXT2_SOURCE=genext2fs-$(GENEXT2_VERSION).tar.gz
-GENEXT2_SITE:=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/genext2fs
-
-$(DL_DIR)/$(GENEXT2_SOURCE):
-	$(call DOWNLOAD,$(GENEXT2_SITE),$(GENEXT2_SOURCE))
-
-$(GENEXT2_DIR)/.unpacked: $(DL_DIR)/$(GENEXT2_SOURCE)
-	$(ZCAT) $(DL_DIR)/$(GENEXT2_SOURCE) | tar -C $(BUILD_DIR) -xvf -
-	toolchain/patch-kernel.sh $(GENEXT2_DIR) target/ext2/ genext2fs\*.patch
-	touch $@
-
-$(GENEXT2_DIR)/.configured: $(GENEXT2_DIR)/.unpacked
-	chmod a+x $(GENEXT2_DIR)/configure
-	(cd $(GENEXT2_DIR); rm -rf config.cache; \
-		./configure $(QUIET) \
-		CC="$(HOSTCC)" \
-		--prefix=$(STAGING_DIR) \
-	)
-	touch $@
-
-$(GENEXT2_DIR)/genext2fs: $(GENEXT2_DIR)/.configured
-	$(MAKE) CFLAGS="-Wall -O2 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE \
-		-D_FILE_OFFSET_BITS=64" -C $(GENEXT2_DIR)
-	touch -c $@
-
-genext2fs: $(GENEXT2_DIR)/genext2fs
-
-
-
-#############################################################
-#
 # Build the ext2 root filesystem image
 #
 #############################################################
@@ -66,17 +30,15 @@ EXT2_ROOTFS_COMPRESSOR_PREREQ:=
 ifeq ($(BR2_TARGET_ROOTFS_EXT2_GZIP),y)
 EXT2_ROOTFS_COMPRESSOR:=gzip -9 -c
 EXT2_ROOTFS_COMPRESSOR_EXT:=gz
-#EXT2_ROOTFS_COMPRESSOR_PREREQ:= gzip-host
 endif
 ifeq ($(BR2_TARGET_ROOTFS_EXT2_BZIP2),y)
 EXT2_ROOTFS_COMPRESSOR:=bzip2 -9 -c
 EXT2_ROOTFS_COMPRESSOR_EXT:=bz2
-#EXT2_ROOTFS_COMPRESSOR_PREREQ:= bzip2-host
 endif
 ifeq ($(BR2_TARGET_ROOTFS_EXT2_LZMA),y)
-EXT2_ROOTFS_COMPRESSOR:=lzma -9 -c
+EXT2_ROOTFS_COMPRESSOR:=$(LZMA) -9 -c
 EXT2_ROOTFS_COMPRESSOR_EXT:=lzma
-EXT2_ROOTFS_COMPRESSOR_PREREQ:= lzma-host
+EXT2_ROOTFS_COMPRESSOR_PREREQ:=host-lzma
 endif
 
 ifneq ($(EXT2_ROOTFS_COMPRESSOR),)
@@ -85,7 +47,7 @@ else
 EXT2_TARGET := $(EXT2_BASE)
 endif
 
-$(EXT2_BASE): host-fakeroot makedevs genext2fs
+$(EXT2_BASE): host-fakeroot host-genext2fs makedevs
 	# Use fakeroot to pretend all target binaries are owned by root
 	rm -f $(BUILD_DIR)/_fakeroot.$(notdir $(EXT2_TARGET))
 	touch $(BUILD_DIR)/.fakeroot.00000
@@ -104,11 +66,11 @@ ifeq ($(strip $(BR2_TARGET_ROOTFS_EXT2_BLOCKS)),0)
 	GENEXT2_ADDTOINODESIZE=`find $(TARGET_DIR) | wc -l`; \
 	GENEXT2_INODES=`expr $$GENEXT2_ADDTOINODESIZE + 400`; \
 	set -x; \
-	echo "$(GENEXT2_DIR)/genext2fs -b $$GENEXT2_SIZE " \
+	echo "$(HOST_DIR)/usr/bin/genext2fs -b $$GENEXT2_SIZE " \
 		"-N $$GENEXT2_INODES -d $(TARGET_DIR) " \
 		"$(EXT2_OPTS) $(EXT2_BASE)" >> $(BUILD_DIR)/_fakeroot.$(notdir $(EXT2_TARGET))
 else
-	echo "$(GENEXT2_DIR)/genext2fs -d $(TARGET_DIR) " \
+	echo "$(HOST_DIR)/usr/bin/genext2fs -d $(TARGET_DIR) " \
 		"$(EXT2_OPTS) $(EXT2_BASE)" >> $(BUILD_DIR)/_fakeroot.$(notdir $(EXT2_TARGET))
 endif
 	chmod a+x $(BUILD_DIR)/_fakeroot.$(notdir $(EXT2_TARGET))
@@ -128,14 +90,6 @@ ifneq ($(EXT2_COPYTO),)
 	@cp -f $(EXT2_TARGET) $(EXT2_COPYTO)
 endif
 
-ext2root-source: $(DL_DIR)/$(GENEXT2_SOURCE)
-
-ext2root-clean:
-	-$(MAKE) -C $(GENEXT2_DIR) clean
-
-ext2root-dirclean:
-	rm -rf $(GENEXT2_DIR)
-
 #############################################################
 #
 # Toplevel Makefile options
-- 
1.6.3.3
