From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri,  9 Apr 2010 11:06:48 +0200
Subject: [Buildroot] [PATCH 10/44] mtd: convert to gentargets,
	add host package
In-Reply-To: <cover.1270803901.git.thomas.petazzoni@free-electrons.com>
References: <cover.1270803901.git.thomas.petazzoni@free-electrons.com>
Message-ID: <de4cf4e9135e198d4c3beefc8ad63c03870eb78a.1270803901.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/mtd/mtd.mk |  144 +++++++++++++++++-----------------------------------
 1 files changed, 46 insertions(+), 98 deletions(-)

diff --git a/package/mtd/mtd.mk b/package/mtd/mtd.mk
index 3e0fcaf..5a449f2 100644
--- a/package/mtd/mtd.mk
+++ b/package/mtd/mtd.mk
@@ -6,65 +6,21 @@
 MTD_VERSION:=1.3.1
 MTD_SOURCE:=mtd-utils-$(MTD_VERSION).tar.bz2
 MTD_SITE:=ftp://ftp.infradead.org/pub/mtd-utils
-MTD_DIR:=$(BUILD_DIR)/mtd-utils-$(MTD_VERSION)
-MTD_HOST_DIR:= $(MTD_DIR)-host
-MTD_CAT:=$(BZCAT)
 
-#############################################################
-#
-# Build mkfs.jffs2 and sumtool for use on the local host system if
-# needed by target/jffs2root.
-#
-#############################################################
-MKFS_JFFS2 := $(HOST_DIR)/usr/sbin/mkfs.jffs2
-SUMTOOL := $(HOST_DIR)/usr/sbin/sumtool
-
-$(DL_DIR)/$(MTD_SOURCE):
-	$(call DOWNLOAD,$(MTD_SITE),$(MTD_SOURCE))
-
-$(MTD_HOST_DIR)/.unpacked: $(DL_DIR)/$(MTD_SOURCE)
-	mkdir -p $(@D)
-	$(MTD_CAT) $^ | tar $(TAR_STRIP_COMPONENTS)=1 -C $(@D) $(TAR_OPTIONS) -
-	toolchain/patch-kernel.sh $(MTD_HOST_DIR) \
-		package/mtd/ mtd-utils-\*.patch
-	touch $@
-
-$(MTD_HOST_DIR)/mkfs.jffs2: $(MTD_HOST_DIR)/.unpacked
-	CC="$(HOSTCC)" CFLAGS="$(HOST_CFLAGS)" LDFLAGS="$(HOST_LDFLAGS)" \
-		CROSS= $(MAKE) BUILDDIR=$(MTD_HOST_DIR) \
-		WITHOUT_XATTR=1 -C $(MTD_HOST_DIR) $@
+HOST_MTD_DEPENDENCIES = host-lzo host-e2fsprogs
 
-$(MKFS_JFFS2): $(MTD_HOST_DIR)/mkfs.jffs2
-	install -m 0755 -D $^ $@
-
-$(MTD_HOST_DIR)/sumtool: $(MTD_HOST_DIR)/.unpacked
+define HOST_MTD_BUILD_CMDS
 	CC="$(HOSTCC)" CFLAGS="$(HOST_CFLAGS)" LDFLAGS="$(HOST_LDFLAGS)" \
-		CROSS= $(MAKE) BUILDDIR=$(MTD_HOST_DIR) \
-		WITHOUT_XATTR=1 -C $(MTD_HOST_DIR) $@
-
-$(SUMTOOL): $(MTD_HOST_DIR)/sumtool
-	install -m 0755 $^ $@
-
-mtd-host: host-lzo $(MKFS_JFFS2) $(SUMTOOL)
-
-mtd-host-source: $(DL_DIR)/$(MTD_SOURCE)
+		CROSS= $(MAKE) BUILDDIR=$(@D) \
+		WITHOUT_XATTR=1 -C $(@D)
+endef
 
-mtd-host-clean:
-	-$(MAKE) -C $(MTD_HOST_DIR) clean
-	rm -f $(MKFS_JFFS2) $(SUMTOOL)
+define HOST_MTD_INSTALL_CMDS
+	$(MAKE) BUILDDIR=$(@D) DESTDIR=$(HOST_DIR) -C $(@D) install
+endef
 
-mtd-host-dirclean:
-	rm -rf $(MTD_HOST_DIR)
-
-#############################################################
-#
-# build mtd for use on the target system
-#
-#############################################################
-$(MTD_DIR)/.unpacked: $(DL_DIR)/$(MTD_SOURCE)
-	$(MTD_CAT) $(DL_DIR)/$(MTD_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	toolchain/patch-kernel.sh $(MTD_DIR) package/mtd/ mtd-utils-\*.patch
-	touch $@
+MKFS_JFFS2=$(HOST_DIR)/usr/sbin/mkfs.jffs2
+SUMTOOL=$(HOST_DIR)/usr/sbin/sumtool
 
 MTD_TARGETS_$(BR2_PACKAGE_MTD_DOCFDISK)		+= docfdisk
 MTD_TARGETS_$(BR2_PACKAGE_MTD_DOC_LOADBIOS)	+= doc_loadbios
@@ -105,50 +61,42 @@ MTD_TARGETS_UBI_$(BR2_PACKAGE_MTD_UBIRMVOL)	+= ubirmvol
 MTD_TARGETS_UBI_$(BR2_PACKAGE_MTD_UBIRSVOL)	+= ubirsvol
 MTD_TARGETS_UBI_$(BR2_PACKAGE_MTD_UBIUPDATEVOL)	+= ubiupdatevol
 
-MTD_TARGETS := $(addprefix $(MTD_DIR)/, $(MTD_TARGETS_y))
-MTD_UBI_TARGETS := $(addprefix $(MTD_DIR)/ubi-utils/, $(MTD_TARGETS_UBI_y))
-MTD_BUILD_TARGETS := $(MTD_TARGETS) $(MTD_UBI_TARGETS)
-
-$(MTD_BUILD_TARGETS): $(MTD_DIR)/.unpacked
-ifneq ($(MTD_TARGETS),)
-	$(MAKE) $(TARGET_CONFIGURE_ENV) \
-		BUILDDIR=$(MTD_DIR) \
-		CROSS=$(TARGET_CROSS) CC=$(TARGET_CC) \
-		WITHOUT_XATTR=1 WITHOUT_LARGEFILE=1 \
-		-C $(MTD_DIR) $(MTD_TARGETS)
+MTD_MAKE_COMMON_FLAGS = \
+	$(TARGET_CONFIGURE_ENV) \
+	CROSS=$(TARGET_CROSS) CC=$(TARGET_CC) \
+	WITHOUT_XATTR=1 WITHOUT_LARGEFILE=1
+
+ifneq ($(MTD_TARGETS_y),)
+define MTD_TARGETS_BUILD
+	$(MAKE) $(MTD_MAKE_COMMON_FLAGS) \
+		BUILDDIR=$(@D) \
+		-C $(@D) \
+		$(addprefix $(@D)/, $(MTD_TARGETS_y))
+endef
 endif
-ifneq ($(MTD_UBI_TARGETS),)
-	$(MAKE) $(TARGET_CONFIGURE_ENV) \
-		BUILDDIR=$(MTD_DIR)/ubi-utils \
-		CROSS=$(TARGET_CROSS) CC=$(TARGET_CC) \
-		WITHOUT_XATTR=1 WITHOUT_LARGEFILE=1 \
-		-C $(MTD_DIR)/ubi-utils $(MTD_UBI_TARGETS)
-endif
-
-MTD_TARGET_BINS := $(addprefix $(TARGET_DIR)/usr/sbin/,\
-		 $(MTD_TARGETS_y) $(MTD_TARGETS_UBI_y))
-
-$(MTD_TARGET_BINS): $(MTD_BUILD_TARGETS)
-	mkdir -p $(TARGET_DIR)/usr/sbin
-	$(INSTALL) -m 0755 $^ $(TARGET_DIR)/usr/sbin
-
-mtd: $(if $(BR2_PACKAGE_MTD_MKFSJFFS2),zlib lzo) $(MTD_TARGET_BINS)
-
-mtd-source: $(DL_DIR)/$(MTD_SOURCE)
-
-mtd-clean:
-	-$(MAKE) -C $(MTD_DIR) clean
-	rm -f $(MTD_TARGET_BINS)
 
-mtd-dirclean:
-	rm -rf $(MTD_DIR)
-
-
-#############################################################
-#
-# Toplevel Makefile options
-#
-#############################################################
-ifeq ($(BR2_PACKAGE_MTD),y)
-TARGETS+=mtd
+ifneq ($(MTD_TARGETS_UBI_y),)
+define MTD_TARGETS_UBI_BUILD
+	$(MAKE) $(MTD_MAKE_COMMON_FLAGS) \
+		BUILDDIR=$(@D)/ubi-utils/ \
+		-C $(@D)/ubi-utils \
+		$(addprefix $(@D)/ubi-utils/, $(MTD_TARGETS_UBI_y))
+endef
 endif
+
+define MTD_BUILD_CMDS
+ $(MTD_TARGETS_BUILD)
+ $(MTD_TARGETS_UBI_BUILD)
+endef
+
+define MTD_INSTALL_TARGET_CMDS
+ for f in $(MTD_TARGETS_y) ; do \
+  install -m 0755 $(@D)/$$f $(TARGET_DIR)/usr/sbin/$$f ; \
+ done ; \
+ for f in $(MTD_TARGETS_UBI_y) ; do \
+  install -m 0755 $(@D)/ubi-utils/$$f $(TARGET_DIR)/usr/sbin/$$f ; \
+ done
+endef
+
+$(eval $(call GENTARGETS,package,mtd))
+$(eval $(call GENTARGETS,package,mtd,host))
-- 
1.6.3.3
