From: Heiko Stuebner <heiko@sntech.de>
Date: Sat, 25 Apr 2020 02:06:29 +0200
Subject: [Buildroot] [PATCH] boot/uboot: add option to define custom
 dependencies
Message-ID: <20200425000629.2068191-1-heiko@sntech.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Heiko Stuebner <heiko.stuebner@theobroma-systems.com>

A custom uboot version my depend on additional unspecified packages
to be built before the uboot build is attempted.

One example is an additional config fragment referencing things
from other packages, so add an option similar to the config fragments
where these can be defined.

Signed-off-by: Heiko Stuebner <heiko.stuebner@theobroma-systems.com>
---
 boot/uboot/Config.in | 8 ++++++++
 boot/uboot/uboot.mk  | 1 +
 2 files changed, 9 insertions(+)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index 7a6f5053fd..310c6e8a80 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -62,6 +62,14 @@ config BR2_TARGET_UBOOT_CUSTOM_SVN
 
 endchoice
 
+config BR2_TARGET_UBOOT_CUSTOM_DEPENDENCIES
+	string "Additional dependencies"
+	help
+	  Specify here package names that are additionally needed.
+	  This can be for example packages that provide things
+	  referenced by additional config fragments or custom u-boot
+	  sources.
+
 config BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE
 	string "U-Boot version"
 	depends on BR2_TARGET_UBOOT_CUSTOM_VERSION
diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index 2bfa50779b..639be3e520 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -259,6 +259,7 @@ endif # BR2_TARGET_UBOOT_USE_DEFCONFIG
 
 UBOOT_KCONFIG_FRAGMENT_FILES = $(call qstrip,$(BR2_TARGET_UBOOT_CONFIG_FRAGMENT_FILES))
 UBOOT_KCONFIG_EDITORS = menuconfig xconfig gconfig nconfig
+UBOOT_DEPENDENCIES += $(call qstrip,$(BR2_TARGET_UBOOT_CUSTOM_DEPENDENCIES))
 
 # UBOOT_MAKE_OPTS overrides HOSTCC / HOSTLDFLAGS to allow the build to
 # find our host-openssl. However, this triggers a bug in the kconfig
-- 
2.25.1
