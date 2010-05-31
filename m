From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue,  1 Jun 2010 00:08:03 +0200
Subject: [Buildroot] [PATCH 17/46] u-boot: add a few comments
In-Reply-To: <cover.1275343447.git.thomas.petazzoni@free-electrons.com>
References: <cover.1275343447.git.thomas.petazzoni@free-electrons.com>
Message-ID: <b45dd29ceae6e3c8147f1cfd148afa7cb6692f80.1275343447.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 boot/u-boot/u-boot.mk |    8 ++++++++
 1 files changed, 8 insertions(+), 0 deletions(-)

diff --git a/boot/u-boot/u-boot.mk b/boot/u-boot/u-boot.mk
index e39901e..bc03039 100644
--- a/boot/u-boot/u-boot.mk
+++ b/boot/u-boot/u-boot.mk
@@ -108,6 +108,7 @@ endif
 endif # BR2_TARGET_UBOOT_NETWORK
 	touch $@
 
+# Build U-Boot itself
 $(U_BOOT_DIR)/$(U_BOOT_BIN): $(U_BOOT_DIR)/.header_modified
 	$(TARGET_CONFIGURE_OPTS) \
 		CFLAGS="$(TARGET_CFLAGS)" \
@@ -116,10 +117,15 @@ $(U_BOOT_DIR)/$(U_BOOT_BIN): $(U_BOOT_DIR)/.header_modified
 		$(MAKE) CROSS_COMPILE="$(TARGET_CROSS)" ARCH=$(U_BOOT_ARCH) \
 		 -C $(U_BOOT_DIR)
 
+# Copy the result to the images/ directory
 $(BINARIES_DIR)/$(U_BOOT_BIN): $(U_BOOT_DIR)/$(U_BOOT_BIN)
 	rm -f $(BINARIES_DIR)/$(U_BOOT_BIN)
 	cp -dpf $(U_BOOT_DIR)/$(U_BOOT_BIN) $(BINARIES_DIR)/
 
+# Build just mkimage for the host. It might have already been built by
+# the U-Boot build procedure, but mkimage may also be needed even if
+# U-Boot isn't selected in the configuration, to generate a kernel
+# uImage.
 $(MKIMAGE): $(U_BOOT_DIR)/.configured
 	mkdir -p $(@D)
 	$(TARGET_CONFIGURE_OPTS) \
@@ -130,6 +136,7 @@ $(MKIMAGE): $(U_BOOT_DIR)/.configured
 		-C $(U_BOOT_DIR) tools
 	cp -dpf $(U_BOOT_DIR)/tools/mkimage $(@D)
 
+# Build manually mkimage for the target
 $(TARGET_DIR)/usr/bin/mkimage: $(U_BOOT_DIR)/.configured
 	mkdir -p $(@D)
 	$(TARGET_CC) -I$(U_BOOT_DIR)/include -I$(U_BOOT_DIR)/tools \
@@ -143,6 +150,7 @@ $(TARGET_DIR)/usr/bin/mkimage: $(U_BOOT_DIR)/.configured
 
 	$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $@
 
+# Build manually fw_printenv for the target
 $(TARGET_DIR)/usr/sbin/fw_printenv: $(U_BOOT_DIR)/.configured
 	mkdir -p $(@D)
 	$(TARGET_CC) -I$(U_BOOT_DIR)/include -I$(LINUX_HEADERS_DIR)/include \
-- 
1.7.0.4
