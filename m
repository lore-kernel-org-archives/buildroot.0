From: Etienne Carriere <etienne.carriere@linaro.org>
Date: Fri,  1 Mar 2019 17:47:13 +0100
Subject: [Buildroot] [PATCH/next 9/9] boot/optee-os: support alternate image
 files
In-Reply-To: <e709b9364807ed93b5e1dc0edfe8a1dd50006b1b.1551458062.git.etienne.carriere@linaro.org>
References: <e709b9364807ed93b5e1dc0edfe8a1dd50006b1b.1551458062.git.etienne.carriere@linaro.org>
Message-ID: <6d46c9a3c321d623029f2670f4ab98393825da98.1551458062.git.etienne.carriere@linaro.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Some platform may generate specific boot image files instead of
the generic files tee.bin and tee-*_v2.bin when building OP-TEE OS
package.

This change introduces optee-os configuration directive
BR2_TARGET_OPTEE_OS_CORE_IMAGES that allows board configuration
to specify its expected boot image file names.

Signed-off-by: Etienne Carriere <etienne.carriere@linaro.org>
---
 boot/optee-os/Config.in   | 13 +++++++++++++
 boot/optee-os/optee-os.mk |  7 +++++--
 2 files changed, 18 insertions(+), 2 deletions(-)

diff --git a/boot/optee-os/Config.in b/boot/optee-os/Config.in
index a1f1b91..0f2df27 100644
--- a/boot/optee-os/Config.in
+++ b/boot/optee-os/Config.in
@@ -99,4 +99,17 @@ config BR2_TARGET_OPTEE_OS_ADDITIONAL_VARIABLES
 	  Additional parameters for the OP-TEE OS build
 	  E.g. 'CFG_TEE_CORE_LOG_LEVEL=3 CFG_UNWIND=y'
 
+config BR2_TARGET_OPTEE_OS_CORE_IMAGES
+	string "Binary boot image filenames"
+	default "tee-header_v2.bin tee-pager_v2.bin"
+	help
+	  Names of generated image files that are installed in the
+	  output images/ directory.
+
+	  With OP-TEE pager disabled, defaults are tee-header_v2.bin
+	  and tee-pager_v2.bin.
+
+	  With OP-TEE pager enabled, one would select the 3 files
+	  tee-header_v2.bin, tee-pager_v2.bin and tee-pageable_v2.bin.
+
 endif # BR2_TARGET_OPTEE_OS
diff --git a/boot/optee-os/optee-os.mk b/boot/optee-os/optee-os.mk
index df481c9..e445e72 100644
--- a/boot/optee-os/optee-os.mk
+++ b/boot/optee-os/optee-os.mk
@@ -62,6 +62,8 @@ OPTEE_OS_LOCAL_SDK = $(OPTEE_OS_BUILDDIR_OUT)/export-ta_arm32
 OPTEE_OS_STAGING_SDK = $(STAGING_DIR)/lib/optee/export-ta_arm32
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
+		cp -dpf $(@D)/$(OPTEE_OS_BUILDDIR_OUT)/core/$(f) $(BINARIES_DIR)/
+	)
 endef
 endif # BR2_TARGET_OPTEE_OS_CORE
 
-- 
1.9.1
