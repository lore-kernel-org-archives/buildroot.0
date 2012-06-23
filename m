From: Philippe Reynes <tremyfr@yahoo.fr>
Date: Sat, 23 Jun 2012 14:45:39 +0200
Subject: [Buildroot] [PATCH] [ARM] Add dtb image generation v2
Message-ID: <1340455539-20097-1-git-send-email-tremyfr@yahoo.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This version check if the option DTB is in the config before
copying the dtb file in image directory.

Signed-off-by: Philippe Reynes <tremyfr@yahoo.fr>
---
 linux/Config.in |    6 ++++++
 linux/linux.mk  |    4 ++++
 2 files changed, 10 insertions(+), 0 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 1cd05ae..a3c4385 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -132,6 +132,12 @@ config BR2_LINUX_KERNEL_DTS_FILE
       The final "custom target" name depends on the
       dts file name:
           <name>.dts --> simpleImage.<name>
+
+config BR2_LINUX_KERNEL_DTB_FILE
+    string "Device Tree dtb file expected"
+    depends on BR2_arm
+    help
+      Name of the dtb file to produce
 #
 # Binary format
 #
diff --git a/linux/linux.mk b/linux/linux.mk
index f165dda..045b4c3 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -174,6 +174,8 @@ define LINUX_BUILD_CMDS
 	@if grep -q "CONFIG_MODULES=y" $(@D)/.config; then 	\
 		$(TARGET_MAKE_ENV) $(MAKE) $(LINUX_MAKE_FLAGS) -C $(@D) modules ;	\
 	fi
+	$(if $(BR2_LINUX_KERNEL_DTB_FILE),
+		$(TARGET_MAKE_ENV) $(MAKE) $(LINUX_MAKE_FLAGS) -C $(@D) $(BR2_LINUX_KERNEL_DTB_FILE))
 endef
 
 
@@ -194,6 +196,8 @@ endef
 
 define LINUX_INSTALL_IMAGES_CMDS
 	cp $(LINUX_IMAGE_PATH) $(BINARIES_DIR)
+	$(if $(BR2_LINUX_KERNEL_DTB_FILE),
+		cp $(KERNEL_ARCH_PATH)/boot/$(BR2_LINUX_KERNEL_DTB_FILE) $(BINARIES_DIR))
 endef
 
 define LINUX_INSTALL_TARGET_CMDS
-- 
1.7.4.4
