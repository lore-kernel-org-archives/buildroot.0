From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 5 Apr 2017 22:29:23 +0200
Subject: [Buildroot] [git commit] Add out-of-source U-Boot device tree
	support
Message-ID: <20170405202947.BEF8D8220D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4f50f4928ca3855d9d1b1b9699d2cb37e4ca65da
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Similaly to Linux, this patch adds the ability to copy in and build
out-of-source device tree sources during a U-Boot build.

Signed-off-by: James Balean <james@balean.com.au>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 boot/uboot/Config.in | 14 ++++++++++++++
 boot/uboot/uboot.mk  |  3 +++
 2 files changed, 17 insertions(+)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index c33861b..004f9c0 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -407,4 +407,18 @@ config BR2_TARGET_UBOOT_ENVIMAGE_REDUNDANT
 
 endif # BR2_TARGET_UBOOT_ENVIMAGE
 
+if BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG
+
+config BR2_TARGET_UBOOT_CUSTOM_DTS_PATH
+	string "Device Tree Source file paths"
+	help
+	  Space-separated list of paths to device tree source files
+	  that will be copied to arch/ARCH/dts/ before starting the
+	  build.
+
+	  To use this device tree source file, the U-Boot configuration
+	  file must refer to it.
+
+endif
+
 endif # BR2_TARGET_UBOOT
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
