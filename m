From: James Balean <james@balean.com.au>
Date: Tue,  4 Apr 2017 22:45:51 -0500
Subject: [Buildroot] [PATCH v2] Add out-of-source U-Boot device tree support
In-Reply-To: <1491362990-3697-1-git-send-email-james@balean.com.au>
References: <1490595146-5638-1-git-send-email-james@balean.com.au>
 <07d14184-7b9c-dd29-569c-db46aa765118@mind.be>
 <1490681640-14995-1-git-send-email-james@balean.com.au>
 <54cae0a0-a7a5-9ef0-08c8-a14e871cf8bb@mind.be>
 <20170328215334.405952d9@free-electrons.com>
 <1d453613-dc32-9ab1-229b-2deed767a12f@mind.be>
 <20170328222929.036d1152@free-electrons.com>
 <92078ad6-2fcc-69e4-86b9-0d296ef350c0@mind.be>
 <20170329090909.4c74c734@free-electrons.com>
 <1491362990-3697-1-git-send-email-james@balean.com.au>
Message-ID: <1491363951-3971-1-git-send-email-james@balean.com.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Similaly to Linux, this patch adds the ability to copy in and build
out-of-source device tree sources during a U-Boot build.

Signed-off-by: James Balean <james@balean.com.au>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
Changes for v2:
  - Added dependency on U-Boot Kconfig build system.
  - Code style cleanup

 boot/uboot/Config.in | 14 ++++++++++++++
 boot/uboot/uboot.mk  |  3 +++
 2 files changed, 17 insertions(+)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index c33861b..ca94749 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -407,4 +407,18 @@ config BR2_TARGET_UBOOT_ENVIMAGE_REDUNDANT
 
 endif # BR2_TARGET_UBOOT_ENVIMAGE
 
+if BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG
+
+config BR2_TARGET_UBOOT_CUSTOM_DTS_PATH
+	string "Device Tree Source file paths"
+	help
+	  Path to the device tree source files. You can provide a list
+	  of dts paths to copy, separated by spaces.
+
+	  To use this device tree source file, the U-Boot configuration
+	  file must refer to it.
+
+endif
+
 endif # BR2_TARGET_UBOOT
+
diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index aac692c..1d464d9 100644
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
