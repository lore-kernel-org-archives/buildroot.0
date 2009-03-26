From: Michael Roth <mroth@nessie.de>
Date: Thu, 26 Mar 2009 22:34:39 +0100
Subject: [Buildroot] [PATCH 5/5] target/ubifs: Switched to mkfs.ubifs
	included in mtd-utils
In-Reply-To: <1238103279-8040-1-git-send-email-mroth@nessie.de>
References: <1238103279-8040-1-git-send-email-mroth@nessie.de>
Message-ID: <1238103279-8040-6-git-send-email-mroth@nessie.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The mkfs.ubifs is included in the upcomming mtd-utils. So
the ubifs root filesytem target uses the mtd-utils package
analog to the jffs2 root filesystem target.

Signed-off-by: Michael Roth <mroth@nessie.de>
---
 target/ubifs/Config.in    |    4 +++
 target/ubifs/ubifsroot.mk |   53 ++++++++++++---------------------------------
 2 files changed, 18 insertions(+), 39 deletions(-)

diff --git a/target/ubifs/Config.in b/target/ubifs/Config.in
index 85229f6..7544b50 100644
--- a/target/ubifs/Config.in
+++ b/target/ubifs/Config.in
@@ -1,9 +1,13 @@
 config BR2_TARGET_ROOTFS_UBIFS
 	bool "ubifs root filesystem"
 	select BR2_HOST_FAKEROOT
+	depends on BR2_PACKAGE_MTD_UTILS_GIT
 	help
 	  Build a ubifs root filesystem
 
+comment "ubifs root filesystem depends on latest mtd-utils (from GIT)"
+        depends on !BR2_PACKAGE_MTD_UTILS_GIT
+
 config BR2_TARGET_ROOTFS_UBIFS_LEBSIZE
 	hex "UBI logical erase block size"
 	depends on BR2_TARGET_ROOTFS_UBIFS
diff --git a/target/ubifs/ubifsroot.mk b/target/ubifs/ubifsroot.mk
index f0b519d..632e5ee 100644
--- a/target/ubifs/ubifsroot.mk
+++ b/target/ubifs/ubifsroot.mk
@@ -1,37 +1,5 @@
 #############################################################
 #
-# mkfs.ubifs to build to target ubifs filesystems
-#
-#############################################################
-#MKFS_UBIFS_VERSION=2582f128dad78591bc3adcc87c343c690bb82e61
-#MKFS_UBIFS_URL=http://git.infradead.org/users/dedekind/mkfs.ubifs.git?a=snapshot;h=$(MKFS_UBIFS_VERSION);sf=tgz
-MKFS_UBIFS_VERSION=v0.4
-MKFS_UBIFS_URL=http://git.infradead.org/users/dedekind/mkfs.ubifs.git?a=snapshot;h=refs/tags/mkfs.ubifs-$(MKFS_UBIFS_VERSION);sf=tgz
-MKFS_UBIFS_SOURCE:=mkfs.ubifs-$(MKFS_UBIFS_VERSION).tar.gz
-MKFS_UBIFS_DIR:= $(BUILD_DIR)/mkfs-ubifs-$(MKFS_UBIFS_VERSION)
-MKFS_UBIFS_CAT:=$(ZCAT)
-MKFS_UBIFS_NAME:=mkfs.ubifs
-
-$(DL_DIR)/$(MKFS_UBIFS_SOURCE):
-	$(call DOWNLOAD,"$(MKFS_UBIFS_URL)")
-
-$(MKFS_UBIFS_DIR)/.unpacked: $(DL_DIR)/$(MKFS_UBIFS_SOURCE)
-	$(ZCAT) $(DL_DIR)/$(MKFS_UBIFS_SOURCE) | tar -C $(BUILD_DIR) -xvf -
-	mv $(BUILD_DIR)/$(MKFS_UBIFS_NAME) $(MKFS_UBIFS_DIR)
-	toolchain/patch-kernel.sh $(MKFS_UBIFS_DIR) target/ubifs/ mkfs-ubifs-\*.patch
-	touch $@
-
-$(MKFS_UBIFS_DIR)/mkfs.ubifs: $(MKFS_UBIFS_DIR)/.unpacked
-	$(MAKE) -C $(MKFS_UBIFS_DIR)
-	touch -c $@
-
-mkfs.ubifs-dirclean:
-	rm -rf $(MKFS_UBIFS_DIR)
-
-mkfs.ubifs: $(MKFS_UBIFS_DIR)/mkfs.ubifs
-
-#############################################################
-#
 # Build the ubifs root filesystem image
 #
 #############################################################
@@ -76,7 +44,14 @@ else
 UBIFS_TARGET := $(UBIFS_BASE)
 endif
 
-$(UBIFS_BASE): host-fakeroot makedevs mkfs.ubifs
+
+#
+# mtd-host-ubifs is a dependency which builds a local copy of mkfs.jffs2 if it is needed.
+# the actual build is done from package/mtd/mtd.mk and it sets the
+# value of MKFS_UBIFS to either the previously installed copy or the one
+# just built.
+#
+$(UBIFS_BASE): host-fakeroot makedevs mtd-host-ubifs
 	- at find $(TARGET_DIR) -type f -perm +111 | xargs $(STRIPCMD) 2>/dev/null || true
 ifneq ($(BR2_HAVE_MANPAGES),y)
 	@rm -rf $(TARGET_DIR)/usr/man
@@ -102,7 +77,7 @@ ifneq ($(TARGET_DEVICE_TABLE),)
 		>> $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(UBIFS_TARGET))
 endif
 	# Use fakeroot so mkfs.ubifs believes the previous fakery
-	echo "$(MKFS_UBIFS_DIR)/mkfs.ubifs -d $(TARGET_DIR) " \
+	echo "$(MKFS_UBIFS) -d $(TARGET_DIR) " \
 		"$(UBIFS_OPTS) -o $(UBIFS_BASE)" >> $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(UBIFS_TARGET))
 	chmod a+x $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(UBIFS_TARGET))
 	$(STAGING_DIR)/usr/bin/fakeroot -- $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(UBIFS_TARGET))
@@ -122,13 +97,13 @@ ifneq ($(UBIFS_COPYTO),)
 	@cp -f $(UBIFS_TARGET) $(UBIFS_COPYTO)
 endif
 
-ubifsroot-source: $(DL_DIR)/$(GENUBIFS_SOURCE)
+ubifsroot-source: mtd-host-source
 
-ubifsroot-clean:
-	-$(MAKE) -C $(MKFS_UBIFS_DIR) clean
+ubifsroot-clean: mtd-host-ubifs-clean
+	rm -f $(UBIFS_TARGET)
 
-ubifsroot-dirclean:
-	rm -rf $(MKFS_UBIFS_DIR)
+ubifsroot-dirclean: mtd-host-dirclean
+	rm -f $(UBIFS_TARGET)
 
 #############################################################
 #
-- 
1.6.0.6
