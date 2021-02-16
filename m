From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 16 Feb 2021 21:21:43 +0100
Subject: [Buildroot] [git commit] package/uboot-tools: depend on u-boot when
 selected
Message-ID: <20210216200041.44CB584496@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=10ad952ea95102a4ddaa1e622dd61d02d4713a1e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Currently, the envimage creation logic only depends on u-boot when the
user does not specify a custom envimage source via
BR2_PACKAGE_HOST_UBOOT_TOOLS_ENVIMAGE_SOURCE. This assumes that the
user-provided envimage source is not coming from the u-boot source
tree.

But especially given the fact that the envimage creation logic used to
be part of the u-boot package, this is a realistic scenario: users may
have provided a value of BR2_PACKAGE_HOST_UBOOT_TOOLS_ENVIMAGE_SOURCE
based on $(UBOOT_DIR), e.g.:

    $(UBOOT_DIR)/board/foo-vendor/bar-board/env.txt

Therefore, always add the u-boot dependency if u-boot is selected, for
either case of custom or default envimage source.

Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
[Thomas: re-organize code a bit.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/uboot-tools/uboot-tools.mk | 19 ++++++++++++++++---
 1 file changed, 16 insertions(+), 3 deletions(-)

diff --git a/package/uboot-tools/uboot-tools.mk b/package/uboot-tools/uboot-tools.mk
index a0cdcafd4e..c4006fe3de 100644
--- a/package/uboot-tools/uboot-tools.mk
+++ b/package/uboot-tools/uboot-tools.mk
@@ -113,7 +113,20 @@ endif
 ifeq ($(BR2_PACKAGE_HOST_UBOOT_TOOLS_ENVIMAGE),y)
 
 UBOOT_TOOLS_GENERATE_ENV_FILE = $(call qstrip,$(BR2_PACKAGE_HOST_UBOOT_TOOLS_ENVIMAGE_SOURCE))
-ifeq ($(UBOOT_TOOLS_GENERATE_ENV_FILE):$(BR2_TARGET_UBOOT),:y)
+
+# If BR2_PACKAGE_HOST_UBOOT_TOOLS_ENVIMAGE_SOURCE is left empty, we
+# will use the default environment provided in the U-Boot build
+# directory as boot-env-defaults.txt, which requires having uboot as a
+# dependency.
+# If BR2_PACKAGE_HOST_UBOOT_TOOLS_ENVIMAGE_SOURCE is not empty, is
+# might be referring to a file within the U-Boot source tree, so we
+# also need to have uboot as a dependency.
+ifeq ($(BR2_TARGET_UBOOT),y)
+HOST_UBOOT_TOOLS_DEPENDENCIES += uboot
+
+# Handle the case where BR2_PACKAGE_HOST_UBOOT_TOOLS_ENVIMAGE_SOURCE
+# is left empty, use the default U-Boot environment.
+ifeq ($(UBOOT_TOOLS_GENERATE_ENV_FILE),)
 UBOOT_TOOLS_GENERATE_ENV_FILE = $(@D)/boot-env-defaults.txt
 define HOST_UBOOT_TOOLS_GENERATE_ENV_DEFAULTS
 	CROSS_COMPILE="$(TARGET_CROSS)" \
@@ -121,8 +134,8 @@ define HOST_UBOOT_TOOLS_GENERATE_ENV_DEFAULTS
 		$(UBOOT_SRCDIR) \
 		> $(UBOOT_TOOLS_GENERATE_ENV_FILE)
 endef
-HOST_UBOOT_TOOLS_DEPENDENCIES += uboot
-endif #UBOOT_TOOLS_GENERATE_ENV_FILE:BR2_TARGET_UBOOT
+endif # UBOOT_TOOLS_GENERATE_ENV_FILE
+endif # BR2_TARGET_UBOOT
 
 ifeq ($(BR_BUILDING),y)
 ifeq ($(call qstrip,$(BR2_PACKAGE_HOST_UBOOT_TOOLS_ENVIMAGE_SIZE)),)
