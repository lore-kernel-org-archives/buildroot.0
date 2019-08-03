From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 3 Aug 2019 18:07:57 +0200
Subject: [Buildroot] [git commit] boot/optee-os: support alternate image
 files
Message-ID: <20190803160543.DF9338897D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c3ebde5ced55bcd5feac0886f3f1e0f7f623a832
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Some platform may generate specific boot image files instead of
the generic files tee.bin and tee-*_v2.bin when building OP-TEE OS
package.

This change introduces optee-os configuration directive
BR2_TARGET_OPTEE_OS_CORE_IMAGES that allows board configuration
to specify its expected boot image file names.

Signed-off-by: Etienne Carriere <etienne.carriere@linaro.org>
[Thomas: use the current hardcoded values as the default for the new
config option, to avoid breaking existing setups, and therefore use
$(wildcard ...) to support wildcards]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 boot/optee-os/Config.in   | 7 +++++++
 boot/optee-os/optee-os.mk | 7 +++++--
 2 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/boot/optee-os/Config.in b/boot/optee-os/Config.in
index bd685b58bf..18b81ab01d 100644
--- a/boot/optee-os/Config.in
+++ b/boot/optee-os/Config.in
@@ -99,4 +99,11 @@ config BR2_TARGET_OPTEE_OS_ADDITIONAL_VARIABLES
 	  Additional parameters for the OP-TEE OS build
 	  E.g. 'CFG_TEE_CORE_LOG_LEVEL=3 CFG_UNWIND=y'
 
+config BR2_TARGET_OPTEE_OS_CORE_IMAGES
+	string "Binary boot images"
+	default "tee.bin tee-*_v2.bin"
+	help
+	  Names of generated image files that are installed in the
+	  output images/ directory.
+
 endif # BR2_TARGET_OPTEE_OS
diff --git a/boot/optee-os/optee-os.mk b/boot/optee-os/optee-os.mk
index bd415512c7..28f5add480 100644
--- a/boot/optee-os/optee-os.mk
+++ b/boot/optee-os/optee-os.mk
@@ -62,6 +62,8 @@ OPTEE_OS_LOCAL_SDK = $(OPTEE_OS_BUILDDIR_OUT)/export-ta_arm32
 OPTEE_OS_SDK = $(STAGING_DIR)/lib/optee/export-ta_arm32
 endif
 
+OPTEE_OS_IMAGE_FILES = $(call qstrip,$(BR2_TARGET_OPTEE_OS_CORE_IMAGES))
+
 ifeq ($(BR2_TARGET_OPTEE_OS_CORE),y)
 define OPTEE_OS_BUILD_CORE
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) O=$(OPTEE_OS_BUILDDIR_OUT) \
@@ -69,8 +71,9 @@ define OPTEE_OS_BUILD_CORE
 endef
 define OPTEE_OS_INSTALL_IMAGES_CORE
 	mkdir -p $(BINARIES_DIR)
-	cp -dpf $(@D)/$(OPTEE_OS_BUILDDIR_OUT)/core/tee.bin $(BINARIES_DIR)
-	cp -dpf $(@D)/$(OPTEE_OS_BUILDDIR_OUT)/core/tee-*_v2.bin $(BINARIES_DIR)
+	$(foreach f,$(OPTEE_OS_IMAGE_FILES), \
+		cp -dpf $(wildcard $(@D)/$(OPTEE_OS_BUILDDIR_OUT)/core/$(f)) $(BINARIES_DIR)/
+	)
 endef
 endif # BR2_TARGET_OPTEE_OS_CORE
 
