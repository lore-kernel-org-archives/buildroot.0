From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 3 Aug 2019 19:21:32 +0200
Subject: [Buildroot] [git commit] boot/uboot: add option to pass custom
 variables to U-Boot build
Message-ID: <20190803171939.8760081136@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cc151c3993090a52d1fef8532f52d74ee6d924c9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 boot/uboot/Config.in | 6 ++++++
 boot/uboot/uboot.mk  | 3 ++-
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index 993979f273..f64df50293 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -552,4 +552,10 @@ config BR2_TARGET_UBOOT_CUSTOM_DTS_PATH
 
 endif
 
+config BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS
+	string "Custom make options"
+	help
+	  List of custom make options passed at build time. Can be
+	  used for example to pass a DEVICE_TREE= value.
+
 endif # BR2_TARGET_UBOOT
diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index 0a8856d7db..4ea2b967cf 100644
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
