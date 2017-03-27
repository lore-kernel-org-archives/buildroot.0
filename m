From: James Balean <james@balean.com.au>
Date: Mon, 27 Mar 2017 01:12:26 -0500
Subject: [Buildroot] [PATCH] Add out-of-source U-Boot device tree support
Message-ID: <1490595146-5638-1-git-send-email-james@balean.com.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Similaly to Linux, this patch adds the ability to copy in and build
out-of-source device tree sources during a U-Boot build.

Signed-off-by: James Balean <james@balean.com.au>
---
 boot/uboot/Config.in | 7 +++++++
 boot/uboot/uboot.mk  | 3 +++
 2 files changed, 10 insertions(+)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index c33861b..b60541e 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -407,4 +407,11 @@ config BR2_TARGET_UBOOT_ENVIMAGE_REDUNDANT
 
 endif # BR2_TARGET_UBOOT_ENVIMAGE
 
+config BR2_TARGET_UBOOT_CUSTOM_DTS_PATH
+	string "Device Tree Source file paths"
+	help
+		Path to the device tree source files. You can
+		provide a list of dts paths to copy,
+		separated by spaces.
+
 endif # BR2_TARGET_UBOOT
diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index 1e22eaa..6104b7d 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -195,6 +195,9 @@ endef
 endif # BR2_TARGET_UBOOT_BUILD_SYSTEM_LEGACY
 
 define UBOOT_BUILD_CMDS
+	$(if $(BR2_TARGET_UBOOT_CUSTOM_DTS_PATH),
+		cp -f $(call qstrip,$(BR2_TARGET_UBOOT_CUSTOM_DTS_PATH)) $(@D)/arch/$(UBOOT_ARCH)/dts/
+	)
 	$(TARGET_CONFIGURE_OPTS) 	\
 		$(MAKE) -C $(@D) $(UBOOT_MAKE_OPTS) 		\
 		$(UBOOT_MAKE_TARGET)
-- 
2.7.4
