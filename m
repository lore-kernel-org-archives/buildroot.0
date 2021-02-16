From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Tue, 16 Feb 2021 15:20:07 +0100
Subject: [Buildroot] [PATCH] package/uboot-tools: depend on u-boot when
 selected
Message-ID: <20210216142007.24983-1-patrickdepinguin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>

The envimage creation logic only depended on u-boot when the user did not
specify a custom envimage source via
BR2_PACKAGE_HOST_UBOOT_TOOLS_ENVIMAGE_SOURCE . This assumes that a
user-provided envimage source is never coming from the u-boot source
tree.

But especially given the fact that the envimage creation logic used to be
part of the u-boot package, this is a realistic scenario: users may have
provided a value of BR2_PACKAGE_HOST_UBOOT_TOOLS_ENVIMAGE_SOURCE based on
$(UBOOT_DIR), e.g.:

    $(UBOOT_DIR)/board/foo-vendor/bar-board/env.txt

Therefore, always add the u-boot dependency if u-boot is selected, for
either case of custom or default envimage source.

Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
---
 package/uboot-tools/uboot-tools.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/uboot-tools/uboot-tools.mk b/package/uboot-tools/uboot-tools.mk
index a0cdcafd4e..8d902863b4 100644
--- a/package/uboot-tools/uboot-tools.mk
+++ b/package/uboot-tools/uboot-tools.mk
@@ -121,9 +121,15 @@ define HOST_UBOOT_TOOLS_GENERATE_ENV_DEFAULTS
 		$(UBOOT_SRCDIR) \
 		> $(UBOOT_TOOLS_GENERATE_ENV_FILE)
 endef
-HOST_UBOOT_TOOLS_DEPENDENCIES += uboot
 endif #UBOOT_TOOLS_GENERATE_ENV_FILE:BR2_TARGET_UBOOT
 
+ifeq ($(BR2_TARGET_UBOOT),y)
+# a user provided BR2_PACKAGE_HOST_UBOOT_TOOLS_ENVIMAGE_SOURCE may be located in
+# the u-boot sources, via $(UBOOT_DIR), so we need this dependency in either
+# case.
+HOST_UBOOT_TOOLS_DEPENDENCIES += uboot
+endif #BR2_TARGET_UBOOT
+
 ifeq ($(BR_BUILDING),y)
 ifeq ($(call qstrip,$(BR2_PACKAGE_HOST_UBOOT_TOOLS_ENVIMAGE_SIZE)),)
 $(error Please provide U-Boot environment size (BR2_PACKAGE_HOST_UBOOT_TOOLS_ENVIMAGE_SIZE setting))
-- 
2.26.2
