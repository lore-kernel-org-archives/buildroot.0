From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 26 Apr 2019 17:19:46 +0200
Subject: [Buildroot] [PATCH v2 3/4] boot/uboot: add option to pass custom
 variables to U-Boot build
In-Reply-To: <20190426151947.31836-1-thomas.petazzoni@bootlin.com>
References: <20190426151947.31836-1-thomas.petazzoni@bootlin.com>
Message-ID: <20190426151947.31836-4-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

U-Boot supports a number of environment variables to pass specific
information. The following patches were submitted in the past to one
some specific Config.in option to pass some of these variables:

 - http://patchwork.ozlabs.org/patch/881197/ proposed an option to
   pass a custom EXT_DTB= variable

 - http://patchwork.ozlabs.org/patch/1018245/ proposed an option to
   pass a custom DEVICE_TREE= variable

Instead of adding one Config.in option for each of those variables,
let's provide a generic mechanism to pass arbitrary variables during
U-Boot build step.

Cc: Konstantin Porotchkin <kostap@marvell.com>
Cc: Clemens Gruber <clemens.gruber@pqgruber.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 boot/uboot/Config.in | 6 ++++++
 boot/uboot/uboot.mk  | 3 ++-
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index 33b7e67ff7..799c201259 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -550,4 +550,10 @@ config BR2_TARGET_UBOOT_CUSTOM_DTS_PATH
 
 endif
 
+config BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS
+	string "Custom make options"
+	help
+	  List of custom make options passed at build time. Can be
+	  used for example to pass a DEVICE_TREE= value.
+
 endif # BR2_TARGET_UBOOT
diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index ae09c37d84..aac5b96451 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -133,7 +133,8 @@ UBOOT_MAKE_OPTS += \
 	CROSS_COMPILE="$(TARGET_CROSS)" \
 	ARCH=$(UBOOT_ARCH) \
 	HOSTCC="$(HOSTCC) $(subst -I/,-isystem /,$(subst -I /,-isystem /,$(HOST_CFLAGS)))" \
-	HOSTLDFLAGS="$(HOST_LDFLAGS)"
+	HOSTLDFLAGS="$(HOST_LDFLAGS)" \
+	$(call qstrip,$(BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS))
 
 ifeq ($(BR2_TARGET_UBOOT_NEEDS_ATF_BL31),y)
 UBOOT_DEPENDENCIES += arm-trusted-firmware
-- 
2.20.1
