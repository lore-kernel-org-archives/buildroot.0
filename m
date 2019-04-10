From: Sam Voss <sam.voss@rockwellcollins.com>
Date: Wed, 10 Apr 2019 14:17:57 -0500
Subject: [Buildroot] [PATCH] package/uboot-tools: Opt install fit_check_sign
Message-ID: <20190410191757.29525-1-sam.voss@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add option to install fit_check_sign to target for fit image validation.

This will allow a fit image to have its signature and hashes validated
from linux, assuming a device-tree of keys (the same as which is in
u-boot) is available.

Signed-off-by: Sam Voss <sam.voss@rockwellcollins.com>
---
 package/uboot-tools/Config.in      | 9 +++++++++
 package/uboot-tools/uboot-tools.mk | 7 +++++++
 2 files changed, 16 insertions(+)

diff --git a/package/uboot-tools/Config.in b/package/uboot-tools/Config.in
index 63a058e856..681f87b45f 100644
--- a/package/uboot-tools/Config.in
+++ b/package/uboot-tools/Config.in
@@ -47,6 +47,15 @@ config BR2_PACKAGE_UBOOT_TOOLS_FIT_SIGNATURE_SUPPORT
 	  libcrypto, and possibly GPL/OpenSSL licensing
 	  incompatibility issues.
 
+config BR2_PACKAGE_UBOOT_TOOLS_FIT_CHECK_SIGN
+	bool "fit_check_sign"
+	depends on BR2_PACKAGE_UBOOT_TOOLS_FIT_SIGNATURE_SUPPORT
+	help
+	  Install the fit_check_sign tool on the target system
+
+	  The fit_check_sign tool from Das U-Boot bootloader, which
+	  allows FIT image signature validation on target system.
+
 endif
 
 config BR2_PACKAGE_UBOOT_TOOLS_MKIMAGE
diff --git a/package/uboot-tools/uboot-tools.mk b/package/uboot-tools/uboot-tools.mk
index cc57ce84de..9b05e42acd 100644
--- a/package/uboot-tools/uboot-tools.mk
+++ b/package/uboot-tools/uboot-tools.mk
@@ -31,6 +31,12 @@ UBOOT_TOOLS_MAKE_OPTS += CONFIG_FIT_SIGNATURE=y
 UBOOT_TOOLS_DEPENDENCIES += openssl host-pkgconf
 endif
 
+ifeq ($(BR2_PACKAGE_UBOOT_TOOLS_FIT_CHECK_SIGN),y)
+define UBOOT_TOOLS_INSTALL_FIT_CHECK_SIGN
+	$(INSTALL) -m 0755 -D $(@D)/tools/fit_check_sign $(TARGET_DIR)/usr/bin/fit_check_sign
+endef
+endif
+
 define UBOOT_TOOLS_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) $(UBOOT_TOOLS_MAKE_OPTS) \
 		CROSS_BUILD_TOOLS=y tools-only
@@ -73,6 +79,7 @@ define UBOOT_TOOLS_INSTALL_TARGET_CMDS
 	$(UBOOT_TOOLS_INSTALL_MKENVIMAGE)
 	$(UBOOT_TOOLS_INSTALL_FWPRINTENV)
 	$(UBOOT_TOOLS_INSTALL_DUMPIMAGE)
+	$(UBOOT_TOOLS_INSTALL_FIT_CHECK_SIGN)
 endef
 
 define HOST_UBOOT_TOOLS_CONFIGURE_CMDS
-- 
2.14.2.746.g8fb8a94
