From: Maxime Ripard <maxime.ripard@free-electrons.com>
Date: Mon, 17 Dec 2012 12:23:50 +0100
Subject: [Buildroot] [PATCHv2] linux: Support multiple device tree build
Message-ID: <1355743430-25865-1-git-send-email-maxime.ripard@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
---
 linux/Config.in |    5 +++--
 linux/linux.mk  |    6 ++++--
 2 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index f408ad5..3ff6b4a 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -261,11 +261,12 @@ config BR2_LINUX_KERNEL_USE_CUSTOM_DTS
 endchoice
 
 config BR2_LINUX_KERNEL_INTREE_DTS_NAME
-	string "Device Tree Source file name"
+	string "Device Tree Source file names"
 	depends on BR2_LINUX_KERNEL_USE_INTREE_DTS
 	help
 	 Name of the device tree source file, without
-	 the trailing .dts
+	 the trailing .dts. You can provide a list of
+	 dts files to build, separated by spaces.
 
 config BR2_LINUX_KERNEL_CUSTOM_DTS_PATH
 	string "Device Tree Source file path"
diff --git a/linux/linux.mk b/linux/linux.mk
index c4bdf90..c7d0099 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -187,10 +187,12 @@ endef
 ifeq ($(BR2_LINUX_KERNEL_DTS_SUPPORT),y)
 ifeq ($(BR2_LINUX_KERNEL_DTB_IS_SELF_BUILT),)
 define LINUX_BUILD_DTB
-	$(TARGET_MAKE_ENV) $(MAKE) $(LINUX_MAKE_FLAGS) -C $(@D) $(KERNEL_DTS_NAME).dtb
+	$(TARGET_MAKE_ENV) $(MAKE) $(LINUX_MAKE_FLAGS) -C $(@D) \
+		$(foreach dtbfile, $(call qstrip, $(KERNEL_DTS_NAME)), $(dtbfile).dtb)
 endef
 define LINUX_INSTALL_DTB
-	cp $(KERNEL_ARCH_PATH)/boot/$(KERNEL_DTS_NAME).dtb $(BINARIES_DIR)/
+	$(foreach dtbfile, $(call qstrip, $(KERNEL_DTS_NAME)),
+		cp $(KERNEL_ARCH_PATH)/boot/$(dtbfile).dtb $(BINARIES_DIR)/)
 endef
 endif
 endif
-- 
1.7.9.5
