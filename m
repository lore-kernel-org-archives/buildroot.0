From: Philippe Proulx <eeppeliteloop@gmail.com>
Date: Fri, 25 Jul 2014 17:25:32 -0400
Subject: [Buildroot] [PATCH] linux: support multiple custom DTS files
Message-ID: <1406323532-18764-1-git-send-email-eeppeliteloop@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Philippe Proulx <eeppeliteloop@gmail.com>
---
 linux/Config.in | 6 ++++--
 linux/linux.mk  | 2 +-
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 441301f..a7a3911 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -323,10 +323,12 @@ config BR2_LINUX_KERNEL_INTREE_DTS_NAME
 	  dts files to build, separated by spaces.
 
 config BR2_LINUX_KERNEL_CUSTOM_DTS_PATH
-	string "Device Tree Source file path"
+	string "Device Tree Source file paths"
 	depends on BR2_LINUX_KERNEL_USE_CUSTOM_DTS
 	help
-	  Path to the device tree source file
+	  Path to the device tree source file. You can
+	  provide a list of dts paths to copy and build,
+	  separated by spaces.
 
 endif
 
diff --git a/linux/linux.mk b/linux/linux.mk
index 2a9bf3e..a5699f9 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -264,7 +264,7 @@ endif
 # configuration has changed.
 define LINUX_BUILD_CMDS
 	$(if $(BR2_LINUX_KERNEL_USE_CUSTOM_DTS),
-		cp $(BR2_LINUX_KERNEL_CUSTOM_DTS_PATH) $(KERNEL_ARCH_PATH)/boot/dts/)
+		cp $(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_DTS_PATH)) $(KERNEL_ARCH_PATH)/boot/dts/)
 	$(TARGET_MAKE_ENV) $(MAKE) $(LINUX_MAKE_FLAGS) -C $(@D) $(LINUX_TARGET_NAME)
 	@if grep -q "CONFIG_MODULES=y" $(@D)/.config; then 	\
 		$(TARGET_MAKE_ENV) $(MAKE) $(LINUX_MAKE_FLAGS) -C $(@D) modules ;	\
-- 
2.0.2
