From: Nicolas Pitre <nico@cam.org>
Date: Wed, 03 Dec 2008 15:37:50 -0500 (EST)
Subject: [Buildroot] [PATCH 2/3] update mtd-utils to the latest and greatest
Message-ID: <alpine.LFD.2.00.0812031537080.14328@xanadu.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


This include latest UBI tools which are now packaged with MTD utils
in the upstream Git repository.  A dependency on libuuid (see previous
patch) is needed by mkfs.ubifs.

Also new host targets are added as needed by the UBI rootfs target in
the next patch.

Signed-off-by: Nicolas Pitre <nico@cam.org>

Index: package/mtd/mtd-utils.git/mtd.mk
===================================================================
--- package/mtd/mtd-utils.git/mtd.mk	(revision 24219)
+++ package/mtd/mtd-utils.git/mtd.mk	(working copy)
@@ -3,7 +3,8 @@
 # mtd provides jffs2 utilities
 #
 #############################################################
-MTD_VERSION:=fcb52ccc99679460640386c297023f852b108f68
+MTD_VERSION:=c3d328ca27b31dad62ab7ca3edf55087352d27a8
+#MTD_VERSION:=HEAD
 MTD_SOURCE:=mtd-utils-$(MTD_VERSION).tar.gz
 MTD_URL:=http://git.infradead.org/mtd-utils.git?a=snapshot;h=$(MTD_VERSION);sf=tgz
 MTD_HOST_DIR:= $(TOOL_BUILD_DIR)/mtd-utils-$(MTD_VERSION)
@@ -19,6 +20,8 @@
 #############################################################
 MKFS_JFFS2 := $(MTD_HOST_DIR)/mkfs.jffs2
 SUMTOOL := $(MTD_HOST_DIR)/sumtool
+MKFS_UBIFS := $(MTD_HOST_DIR)/mkfs.ubifs/mkfs.ubifs
+UBINIZE := $(MTD_HOST_DIR)/ubi-utils/ubinize
 
 $(DL_DIR)/$(MTD_SOURCE):
 	$(WGET) -O $(DL_DIR)/$(MTD_SOURCE) "$(MTD_URL)"
@@ -35,25 +38,39 @@
 
 
 $(MKFS_JFFS2): $(MTD_HOST_DIR)/.unpacked
-	CC="$(HOSTCC)" CROSS= CFLAGS=-I$(LINUX_HEADERS_DIR)/include \
+	CC="$(HOSTCC)" CROSS= CPPFLAGS=-I$(LINUX_HEADERS_DIR)/include \
 		$(MAKE) \
 		BUILDDIR=$(MTD_HOST_DIR) WITHOUT_XATTR=1 \
 		-C $(MTD_HOST_DIR) mkfs.jffs2
 
 $(SUMTOOL): $(MTD_HOST_DIR)/.unpacked
-	CC="$(HOSTCC)" CROSS= CFLAGS=-I$(LINUX_HEADERS_DIR)/include \
+	CC="$(HOSTCC)" CROSS= CPPFLAGS=-I$(LINUX_HEADERS_DIR)/include \
 		$(MAKE) \
 		BUILDDIR=$(MTD_HOST_DIR) WITHOUT_XATTR=1 \
 		-C $(MTD_HOST_DIR) sumtool
 
+$(MKFS_UBIFS): $(MTD_HOST_DIR)/.unpacked
+	CC="$(HOSTCC)" CROSS= CPPFLAGS=-I$(LINUX_HEADERS_DIR)/include \
+		$(MAKE) \
+		BUILDDIR=$(MTD_HOST_DIR) WITHOUT_XATTR=1 \
+		-C $(MTD_HOST_DIR)/mkfs.ubifs
+
+$(UBINIZE): $(MTD_HOST_DIR)/.unpacked
+	CC="$(HOSTCC)" CROSS= CPPFLAGS=-I$(LINUX_HEADERS_DIR)/include \
+		$(MAKE) \
+		BUILDDIR=$(MTD_HOST_DIR) WITHOUT_XATTR=1 \
+		-C $(MTD_HOST_DIR)/ubi-utils ubinize
+
 mtd-host: $(MKFS_JFFS2) $(SUMTOOL)
 
-mtd-host-source: $(DL_DIR)/$(MTD_SOURCE)
+ubi-host: $(MKFS_UBIFS) $(UBINIZE)
 
-mtd-host-clean:
+mtd-host-source ubi-host-source: $(DL_DIR)/$(MTD_SOURCE)
+
+mtd-host-clean ubi-host-clean:
 	-$(MAKE) -C $(MTD_HOST_DIR) clean
 
-mtd-host-dirclean:
+mtd-host-dirclean ubi-host-dirclean:
 	rm -rf $(MTD_HOST_DIR)
 
 #############################################################
@@ -98,23 +115,56 @@
 MTD_TARGETS_UBI_$(BR2_PACKAGE_MTD_UBIATTACH) += ubiattach
 MTD_TARGETS_UBI_$(BR2_PACKAGE_MTD_UBICRC32) += ubicrc32
 MTD_TARGETS_UBI_$(BR2_PACKAGE_MTD_UBIDETACH) += ubidetach
-MTD_TARGETS_UBI_$(BR2_PACKAGE_MTD_UBIMIRROR) += ubimirror
 MTD_TARGETS_UBI_$(BR2_PACKAGE_MTD_UBIMKVOL) += ubimkvol
 MTD_TARGETS_UBI_$(BR2_PACKAGE_MTD_UBINFO) += ubinfo
+MTD_TARGETS_UBI_$(BR2_PACKAGE_MTD_UBINIZE) += ubinize
 MTD_TARGETS_UBI_$(BR2_PACKAGE_MTD_UBIRMVOL) += ubirmvol
 MTD_TARGETS_UBI_$(BR2_PACKAGE_MTD_UBIUPDATEVOL) += ubiupdatevol
+MTD_TARGETS_UBI_$(BR2_PACKAGE_MTD_UBIFORMAT) += ubiformat
+MTD_TARGETS_UBI_$(BR2_PACKAGE_MTD_PFIFLASH) += pfiflash
+MTD_TARGETS_UBI_$(BR2_PACKAGE_MTD_PDDCUSTOMIZE) += pddcustomize
+MTD_TARGETS_UBI_$(BR2_PACKAGE_MTD_UBIMIRROR) += ubimirror
+MTD_TARGETS_UBI_$(BR2_PACKAGE_MTD_BIN2NAND) += bin2nand
+MTD_TARGETS_UBI_$(BR2_PACKAGE_MTD_NAND2BIN) += nand2bin
+MTD_TARGETS_UBI_$(BR2_PACKAGE_MTD_UBIGEN) += ubigen
+MTD_TARGETS_UBI_$(BR2_PACKAGE_MTD_MKBOOTENV) += mkbootenv
+MTD_TARGETS_UBI_$(BR2_PACKAGE_MTD_UNUBI) += unubi
+MTD_TARGETS_UBI_$(BR2_PACKAGE_MTD_PFI2BIN) += pfi2bin
 
-MTD_BUILD_TARGETS := $(addprefix $(MTD_DIR)/, $(MTD_TARGETS_y)) $(addprefix $(MTD_DIR)/ubi-utils/, $(MTD_TARGETS_UBI_y))
+MTD_TARGETS_UBIFS_n :=
+MTD_TARGETS_UBIFS_y :=
 
+MTD_TARGETS_UBIFS_$(BR2_PACKAGE_MTD_MKFSUBIFS) += mkfs.ubifs
+
+MTD_BUILD_TARGETS := $(addprefix $(MTD_DIR)/, $(MTD_TARGETS_y))
+MTD_UBI_BUILD_TARGETS := $(addprefix $(MTD_DIR)/ubi-utils/, $(MTD_TARGETS_UBI_y))
+MTD_UBIFS_BUILD_TARGETS := $(addprefix $(MTD_DIR)/mkfs.ubifs/, $(MTD_TARGETS_UBIfs_y))
+
 $(MTD_BUILD_TARGETS): $(MTD_DIR)/.unpacked
 	mkdir -p $(TARGET_DIR)/usr/sbin
-	$(MAKE1) OPTFLAGS="-DNEED_BCOPY -Dbcmp=memcmp -I$(STAGING_DIR)/usr/include $(TARGET_CFLAGS)" \
+	$(MAKE1) CFLAGS="-DNEED_BCOPY -Dbcmp=memcmp -I$(STAGING_DIR)/usr/include $(TARGET_CFLAGS)" \
 		LDFLAGS="$(TARGET_LDFLAGS)" \
 	       BUILDDIR=$(MTD_DIR) \
-	       CROSS=$(TARGET_CROSS) CC=$(TARGET_CC) WITHOUT_XATTR=1 -C $(MTD_DIR)
+	       CROSS=$(TARGET_CROSS) CC=$(TARGET_CC) WITHOUT_XATTR=1 \
+	       -C $(MTD_DIR) $(MTD_BUILD_TARGETS)
 
+$(MTD_UBI_BUILD_TARGETS): $(MTD_DIR)/.unpacked
+	mkdir -p $(TARGET_DIR)/usr/sbin
+	$(MAKE1) CFLAGS="-DNEED_BCOPY -Dbcmp=memcmp -I$(STAGING_DIR)/usr/include $(TARGET_CFLAGS)" \
+		LDFLAGS="$(TARGET_LDFLAGS)" \
+		CROSS=$(TARGET_CROSS) CC=$(TARGET_CC) WITHOUT_XATTR=1 \
+		-C $(MTD_DIR)/ubi-utils $(MTD_TARGETS_UBIfs_y)
+
+$(MTD_UBIFS_BUILD_TARGETS): $(MTD_DIR)/.unpacked libuuid
+	mkdir -p $(TARGET_DIR)/usr/sbin
+	$(MAKE1) CFLAGS="-DNEED_BCOPY -Dbcmp=memcmp -I$(STAGING_DIR)/usr/include $(TARGET_CFLAGS)" \
+		LDFLAGS="$(TARGET_LDFLAGS)" \
+		CROSS=$(TARGET_CROSS) CC=$(TARGET_CC) WITHOUT_XATTR=1 \
+		-C $(MTD_DIR)/mkfs.ubifs $(MTD_UBIFS_BUILD_TARGETS)
+
 MTD_TARGETS := $(addprefix $(TARGET_DIR)/usr/sbin/, $(MTD_TARGETS_y))
 MTD_UBI_TARGETS := $(addprefix $(TARGET_DIR)/usr/sbin/, $(MTD_TARGETS_UBI_y))
+MTD_UBIFS_TARGETS := $(addprefix $(TARGET_DIR)/usr/sbin/, $(MTD_TARGETS_UBIFS_y))
 
 $(MTD_TARGETS): $(TARGET_DIR)/usr/sbin/% : $(MTD_DIR)/%
 	cp -f $< $@
@@ -124,8 +174,12 @@
 	cp -f $< $@
 	$(STRIPCMD) $@
 
-mtd: zlib lzo $(MTD_TARGETS) $(MTD_UBI_TARGETS)
+$(MTD_UBIFS_TARGETS): $(TARGET_DIR)/usr/sbin/% : $(MTD_DIR)/mkfs.ubifs/%
+	cp -f $< $@
+	$(STRIPCMD) $@
 
+mtd: zlib lzo $(MTD_TARGETS) $(MTD_UBI_TARGETS) $(MTD_UBIFS_TARGETS)
+
 mtd-source: $(DL_DIR)/$(MTD_SOURCE)
 
 mtd-clean:
Index: package/mtd/Config.in
===================================================================
--- package/mtd/Config.in	(revision 24219)
+++ package/mtd/Config.in	(working copy)
@@ -164,11 +164,6 @@
 	default y
 	depends on BR2_PACKAGE_MTD_UTILS_GIT
 
-config BR2_PACKAGE_MTD_UBIMIRROR
-	bool "ubimirror"
-	default y
-	depends on BR2_PACKAGE_MTD_UTILS_GIT
-
 config BR2_PACKAGE_MTD_UBIMKVOL
 	bool "ubimkvol"
 	default y
@@ -179,6 +174,11 @@
 	default y
 	depends on BR2_PACKAGE_MTD_UTILS_GIT
 
+config BR2_PACKAGE_MTD_UBINIZE
+	bool "ubinize"
+	default y
+	depends on BR2_PACKAGE_MTD_UTILS_GIT
+
 config BR2_PACKAGE_MTD_UBIRMVOL
 	bool "ubirmvol"
 	default y
@@ -189,5 +189,55 @@
 	default y
 	depends on BR2_PACKAGE_MTD_UTILS_GIT
 
+config BR2_PACKAGE_MTD_UBIFORMAT
+	bool "ubiformat"
+	default y
+	depends on BR2_PACKAGE_MTD_UTILS_GIT
+
+config BR2_PACKAGE_MTD_PFIFLASH
+	bool "pfiflash"
+	default y
+	depends on BR2_PACKAGE_MTD_UTILS_GIT
+
+config BR2_PACKAGE_MTD_PDDCUSTOMIZE
+	bool "pddcustomize"
+	default y
+	depends on BR2_PACKAGE_MTD_UTILS_GIT
+
+config BR2_PACKAGE_MTD_UBIMIRROR
+	bool "ubimirror"
+	default y
+	depends on BR2_PACKAGE_MTD_UTILS_GIT
+
+config BR2_PACKAGE_MTD_BIN2NAND
+	bool "bin2nand"
+	default y
+	depends on BR2_PACKAGE_MTD_UTILS_GIT
+
+config BR2_PACKAGE_MTD_NAND2BIN
+	bool "nand2bin"
+	default y
+	depends on BR2_PACKAGE_MTD_UTILS_GIT
+
+config BR2_PACKAGE_MTD_UBIGEN
+	bool "ubigen"
+	default y
+	depends on BR2_PACKAGE_MTD_UTILS_GIT
+
+config BR2_PACKAGE_MTD_MKBOOTENV
+	bool "mkbootenv"
+	default y
+	depends on BR2_PACKAGE_MTD_UTILS_GIT
+
+config BR2_PACKAGE_MTD_UNUBI
+	bool "unubi"
+	default y
+	depends on BR2_PACKAGE_MTD_UTILS_GIT
+
+config BR2_PACKAGE_MTD_MKFSUBIFS
+	bool "mkfs.ubifs"
+	default y
+	depends on BR2_PACKAGE_MTD_UTILS_GIT && BR2_LARGEFILE
+	
 endif
 
