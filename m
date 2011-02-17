From: =?UTF-8?q?Bj=C3=B8rn=20Forsman?= <bjorn.forsman@gmail.com>
Date: Fri, 18 Feb 2011 00:44:54 +0100
Subject: [Buildroot] [PATCH v2 2/2] linux.mk: depend on actual kernel image
	instead of stamp file
In-Reply-To: <1297986294-23446-1-git-send-email-bjorn.forsman@gmail.com>
References: <1297986294-23446-1-git-send-email-bjorn.forsman@gmail.com>
Message-ID: <1297986294-23446-2-git-send-email-bjorn.forsman@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Use the real output file (kernel image) as target instead of a stamp
file. This way Buildroot cannot be tricked into thinking that the kernel
image is installed when it's not.

Signed-off-by: Bj?rn Forsman <bjorn.forsman@gmail.com>
---
 linux/linux.mk |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/linux/linux.mk b/linux/linux.mk
index 0ad8c0f..5855658 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -144,7 +144,7 @@ $(LINUX26_DIR)/.stamp_compiled: $(LINUX26_DIR)/.stamp_configured $(LINUX26_DIR)/
 	$(Q)touch $@
 
 # Installation
-$(LINUX26_DIR)/.stamp_installed: $(LINUX26_DIR)/.stamp_compiled
+$(BINARIES_DIR)/$(LINUX26_IMAGE_NAME): $(LINUX26_DIR)/.stamp_compiled
 	@$(call MESSAGE,"Installing kernel")
 	cp $(LINUX26_IMAGE_PATH) $(BINARIES_DIR)
 	$(Q)touch $@
@@ -153,13 +153,13 @@ $(TARGET_DIR)/lib/modules:
 	# Install modules and remove symbolic links pointing to build
 	# directories, not relevant on the target
 	@if [ $(shell grep -c "CONFIG_MODULES=y" $(LINUX26_DIR)/.config) != 0 ] ; then 	\
-		$(TARGET_MAKE_ENV) $(MAKE1) $(LINUX26_MAKE_FLAGS) -C $(@D) 		\
+		$(TARGET_MAKE_ENV) $(MAKE1) $(LINUX26_MAKE_FLAGS) -C $(LINUX26_DIR)	\
 			DEPMOD="$(HOST_DIR)/usr/sbin/depmod" modules_install ;		\
 		rm -f $(TARGET_DIR)/lib/modules/$(LINUX26_VERSION_PROBED)/build ;	\
 		rm -f $(TARGET_DIR)/lib/modules/$(LINUX26_VERSION_PROBED)/source ;	\
 	fi
 
-linux linux26: host-module-init-tools $(LINUX26_DEPENDENCIES) $(LINUX26_DIR)/.stamp_installed $(TARGET_DIR)/lib/modules
+linux linux26: host-module-init-tools $(LINUX26_DEPENDENCIES) $(BINARIES_DIR)/$(LINUX26_IMAGE_NAME) $(TARGET_DIR)/lib/modules
 
 linux-menuconfig linux-xconfig linux-gconfig linux-nconfig linux26-menuconfig linux26-xconfig linux26-gconfig linux26-nconfig: dirs $(LINUX26_DIR)/.stamp_configured
 	$(MAKE) $(LINUX26_MAKE_FLAGS) -C $(LINUX26_DIR) \
@@ -167,7 +167,7 @@ linux-menuconfig linux-xconfig linux-gconfig linux-nconfig linux26-menuconfig li
 
 # Support for rebuilding the kernel after the initramfs file list has
 # been generated in $(BINARIES_DIR)/rootfs.initramfs.
-$(LINUX26_DIR)/.stamp_initramfs_rebuilt: $(LINUX26_DIR)/.stamp_installed $(BINARIES_DIR)/rootfs.initramfs
+$(LINUX26_DIR)/.stamp_initramfs_rebuilt: $(BINARIES_DIR)/$(LINUX26_IMAGE_NAME) $(BINARIES_DIR)/rootfs.initramfs
 	@$(call MESSAGE,"Rebuilding kernel with initramfs")
 	# Remove the previously generated initramfs which was empty,
 	# to make sure the kernel will actually regenerate it.
-- 
1.7.1
