From: Daniel Mack <daniel@caiaq.de>
Date: Wed,  3 Jun 2009 13:39:04 +0200
Subject: [Buildroot] [PATCH 1/2] target/ubifs: fix compilation
Message-ID: <1244029145-11832-1-git-send-email-daniel@caiaq.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The ubifs rootfs target does not currently build because the repository
listed in ubifsroot.mk does not exist anymore. Consequently, the used
tag is also wrong.

As the code base for mtd utils seem to have been merged in the past,
there are dependencies between ubi-utils, mkfs.ubifs and the mtd core
now, so we have no other option than building the whole thing.

WITHOUT_XATTR was added to the make parameters because it did not build
on my system without that. Maybe that should become a auto* variable
dependency in the future.

BUILDDIR is needed by the mtd-utils Makefile, otherwise built object
files are put to $(PWD) which is the toplevel br2 path.

MKFS_UBIFS_BINARY was added to ease the path chaos a bit.

Signed-off-by: Daniel Mack <daniel@caiaq.de>
---
 target/ubifs/ubifsroot.mk |   21 +++++++++++----------
 1 files changed, 11 insertions(+), 10 deletions(-)

diff --git a/target/ubifs/ubifsroot.mk b/target/ubifs/ubifsroot.mk
index 1707e46..d14bde1 100644
--- a/target/ubifs/ubifsroot.mk
+++ b/target/ubifs/ubifsroot.mk
@@ -5,12 +5,13 @@
 #############################################################
 #MKFS_UBIFS_VERSION=2582f128dad78591bc3adcc87c343c690bb82e61
 #MKFS_UBIFS_URL=http://git.infradead.org/users/dedekind/mkfs.ubifs.git?a=snapshot;h=$(MKFS_UBIFS_VERSION);sf=tgz
-MKFS_UBIFS_VERSION=v0.4
-MKFS_UBIFS_URL=http://git.infradead.org/users/dedekind/mkfs.ubifs.git?a=snapshot;h=refs/tags/mkfs.ubifs-$(MKFS_UBIFS_VERSION);sf=tgz
-MKFS_UBIFS_SOURCE:=mkfs.ubifs-$(MKFS_UBIFS_VERSION).tar.gz
-MKFS_UBIFS_DIR:= $(BUILD_DIR)/mkfs-ubifs-$(MKFS_UBIFS_VERSION)
-MKFS_UBIFS_CAT:=$(ZCAT)
-MKFS_UBIFS_NAME:=mkfs.ubifs
+MKFS_UBIFS_VERSION=HEAD
+MKFS_UBIFS_URL=http://git.infradead.org/mtd-utils.git?a=snapshot\;h=$(MKFS_UBIFS_VERSION)\;sf=tgz
+MKFS_UBIFS_SOURCE=mtd-utils-$(MKFS_UBIFS_VERSION).tar.gz
+MKFS_UBIFS_DIR=$(BUILD_DIR)/mkfs-utils-ubifs
+MKFS_UBIFS_CAT=$(ZCAT)
+MKFS_UBIFS_NAME=mtd-utils
+MKFS_UBIFS_BINARY=$(MKFS_UBIFS_DIR)/mkfs.ubifs/mkfs.ubifs
 
 $(DL_DIR)/$(MKFS_UBIFS_SOURCE):
 	$(WGET) -O $(DL_DIR)/$(MKFS_UBIFS_SOURCE) "$(MKFS_UBIFS_URL)"
@@ -21,14 +22,14 @@ $(MKFS_UBIFS_DIR)/.unpacked: $(DL_DIR)/$(MKFS_UBIFS_SOURCE)
 	toolchain/patch-kernel.sh $(MKFS_UBIFS_DIR) target/ubifs/ mkfs-ubifs-\*.patch
 	touch $@
 
-$(MKFS_UBIFS_DIR)/mkfs.ubifs: $(MKFS_UBIFS_DIR)/.unpacked
-	$(MAKE) -C $(MKFS_UBIFS_DIR)
+$(MKFS_UBIFS_BINARY): $(MKFS_UBIFS_DIR)/.unpacked
+	$(MAKE) -j1 -C $(MKFS_UBIFS_DIR) BUILDDIR=$(MKFS_UBIFS_DIR) WITHOUT_XATTR=1
 	touch -c $@
 
 mkfs.ubifs-dirclean:
 	rm -rf $(MKFS_UBIFS_DIR)
 
-mkfs.ubifs: $(MKFS_UBIFS_DIR)/mkfs.ubifs
+mkfs.ubifs: $(MKFS_UBIFS_BINARY)
 
 #############################################################
 #
@@ -88,7 +89,7 @@ ifneq ($(TARGET_DEVICE_TABLE),)
 		>> $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(UBIFS_TARGET))
 endif
 	# Use fakeroot so mkfs.ubifs believes the previous fakery
-	echo "$(MKFS_UBIFS_DIR)/mkfs.ubifs -d $(TARGET_DIR) " \
+	echo "$(MKFS_UBIFS_BINARY) -d $(TARGET_DIR) " \
 		"$(UBIFS_OPTS) -o $(UBIFS_BASE)" >> $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(UBIFS_TARGET))
 	chmod a+x $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(UBIFS_TARGET))
 	$(HOST_DIR)/usr/bin/fakeroot -- $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(UBIFS_TARGET))
-- 
1.6.3.1
