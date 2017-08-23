From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 23 Aug 2017 22:45:46 +0200
Subject: [Buildroot] [RFC-next 1/2] fs/genimage: add logic to generate an
	image using genimage
In-Reply-To: <20170823204547.16672-1-thomas.petazzoni@free-electrons.com>
References: <20170823204547.16672-1-thomas.petazzoni@free-electrons.com>
Message-ID: <20170823204547.16672-2-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We have more and more boards that need to repeat in their post-image
script the logic to use genimage. Even though the logic has been
factorized in support/scripts/genimage.sh, users still have to
remember that they need to enable BR2_PACKAGE_HOST_MTOOLS and
BR2_PACKAGE_HOST_DOSFSTOOLS when they have a VFAT partition in their
genimage configuration.

Therefore, this commit adds some minimal logic in Buildroot to use
genimage directly.

This logic is added into fs/genimage/, even if stricly speaking
genimage isn't a filesystem format. It does not use the filesystem
infrastructure (fs/common.mk), and is referenced explicitly from the
target-post-image target in the main Makefile.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Makefile                |  1 +
 fs/Config.in            |  1 +
 fs/genimage/Config.in   | 26 ++++++++++++++++++++++++++
 fs/genimage/genimage.mk | 31 +++++++++++++++++++++++++++++++
 4 files changed, 59 insertions(+)
 create mode 100644 fs/genimage/Config.in
 create mode 100644 fs/genimage/genimage.mk

diff --git a/Makefile b/Makefile
index 1b0e36f..3baad7b 100644
--- a/Makefile
+++ b/Makefile
@@ -733,6 +733,7 @@ endif
 
 .PHONY: target-post-image
 target-post-image: $(TARGETS_ROOTFS) target-finalize
+	$(GENIMAGE_GENERATE_CMDS)
 	@$(foreach s, $(call qstrip,$(BR2_ROOTFS_POST_IMAGE_SCRIPT)), \
 		$(call MESSAGE,"Executing post-image script $(s)"); \
 		$(EXTRA_ENV) $(s) $(BINARIES_DIR) $(call qstrip,$(BR2_ROOTFS_POST_SCRIPT_ARGS))$(sep))
diff --git a/fs/Config.in b/fs/Config.in
index 51ccf28..04b4ebe 100644
--- a/fs/Config.in
+++ b/fs/Config.in
@@ -13,5 +13,6 @@ source "fs/squashfs/Config.in"
 source "fs/tar/Config.in"
 source "fs/ubifs/Config.in"
 source "fs/yaffs2/Config.in"
+source "fs/genimage/Config.in"
 
 endmenu
diff --git a/fs/genimage/Config.in b/fs/genimage/Config.in
new file mode 100644
index 0000000..bd747bc
--- /dev/null
+++ b/fs/genimage/Config.in
@@ -0,0 +1,26 @@
+config BR2_TARGET_ROOTFS_GENIMAGE
+	bool "generate a final image with genimage"
+	select BR2_PACKAGE_HOST_GENIMAGE
+	help
+	  This option allows to generate a final image to flash on
+	  your device using a tool called genimage.
+
+if BR2_TARGET_ROOTFS_GENIMAGE
+
+config BR2_TARGET_ROOTFS_GENIMAGE_CFG_FILE
+	string "genimage config file"
+	help
+	  This option allows to specify the path to the genimage
+	  configuration file. See
+	  https://git.pengutronix.de/cgit/genimage/plain/README for
+	  the specification of the genimage configuration file format.
+
+config BR2_TARGET_ROOTFS_GENIMAGE_USES_VFAT
+	bool "genimage config uses vfat"
+	select BR2_PACKAGE_HOST_DOSFSTOOLS
+	select BR2_PACKAGE_HOST_MTOOLS
+	help
+	  Enable this option if your genimage configuration file uses
+	  a "vfat" section to generate a VFAT filesystem.
+
+endif
diff --git a/fs/genimage/genimage.mk b/fs/genimage/genimage.mk
new file mode 100644
index 0000000..b44b29b
--- /dev/null
+++ b/fs/genimage/genimage.mk
@@ -0,0 +1,31 @@
+################################################################################
+#
+# genimage support
+#
+################################################################################
+
+ifeq ($(BR2_TARGET_ROOTFS_GENIMAGE),y)
+PACKAGES += host-genimage
+
+ifeq ($(BR2_TARGET_ROOTFS_GENIMAGE_USES_VFAT),y)
+PACKAGES += host-dosfstools host-mtools
+endif
+
+GENIMAGE_CFG_FILE = $(call qstrip,$(BR2_TARGET_ROOTFS_GENIMAGE_CFG_FILE))
+GENIMAGE_TMP = $(BUILD_DIR)/genimage.tmp
+
+define GENIMAGE_GENERATE_CMDS
+	if grep -q "vfat.*{" $(GENIMAGE_CFG_FILE) && \
+	   test "$(BR2_TARGET_ROOTFS_GENIMAGE_USES_VFAT)" != "y" ; then \
+		echo "ERROR: genimage configuration generates a VFAT filesystem" ; \
+		echo "       please enable BR2_TARGET_ROOTFS_GENIMAGE_USES_VFAT" ; \
+	fi
+	$(RM) -rf $(GENIMAGE_TMP)
+	$(HOST_DIR)/usr/bin/genimage --rootpath $(TARGET_DIR) \
+		--tmppath $(GENIMAGE_TMP) \
+		--inputpath $(BINARIES_DIR) \
+		--outputpath $(BINARIES_DIR) \
+		--config $(GENIMAGE_CFG_FILE)
+endef
+
+endif # BR2_TARGET_ROOTFS_GENIMAGE
-- 
2.9.4
