From: Etienne Carriere <etienne.carriere@linaro.org>
Date: Fri,  1 Mar 2019 17:47:05 +0100
Subject: [Buildroot] [PATCH/next 1/9] boot/optee-os: package sets TA SDK
 location
Message-ID: <e709b9364807ed93b5e1dc0edfe8a1dd50006b1b.1551458062.git.etienne.carriere@linaro.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Makefile script for boot package optee-os produces make variable
OPTEE_OS_STAGING_SDK to locate the Trusted Application SDK expected
by other packages when building OP-TEE trusted applications.

Signed-off-by: Etienne Carriere <etienne.carriere@linaro.org>
---
 boot/optee-os/optee-os.mk | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/boot/optee-os/optee-os.mk b/boot/optee-os/optee-os.mk
index aeac067..df481c9 100644
--- a/boot/optee-os/optee-os.mk
+++ b/boot/optee-os/optee-os.mk
@@ -55,9 +55,11 @@ OPTEE_OS_MAKE_OPTS += $(call qstrip,$(BR2_TARGET_OPTEE_OS_ADDITIONAL_VARIABLES))
 OPTEE_OS_BUILDDIR_OUT = out
 ifeq ($(BR2_aarch64),y)
 OPTEE_OS_LOCAL_SDK = $(OPTEE_OS_BUILDDIR_OUT)/export-ta_arm64
+OPTEE_OS_STAGING_SDK = $(STAGING_DIR)/lib/optee/export-ta_arm64
 endif
 ifeq ($(BR2_arm),y)
 OPTEE_OS_LOCAL_SDK = $(OPTEE_OS_BUILDDIR_OUT)/export-ta_arm32
+OPTEE_OS_STAGING_SDK = $(STAGING_DIR)/lib/optee/export-ta_arm32
 endif
 
 ifeq ($(BR2_TARGET_OPTEE_OS_CORE),y)
@@ -86,8 +88,8 @@ define OPTEE_OS_BUILD_SDK
 		 $(TARGET_CONFIGURE_OPTS) $(OPTEE_OS_MAKE_OPTS) ta_dev_kit
 endef
 define OPTEE_OS_INSTALL_STAGING_CMDS
-	mkdir -p $(STAGING_DIR)/lib/optee
-	cp -ardpf $(@D)/$(OPTEE_OS_LOCAL_SDK) $(STAGING_DIR)/lib/optee
+	mkdir -p $(OPTEE_OS_STAGING_SDK)
+	cp -ardpf $(@D)/$(OPTEE_OS_LOCAL_SDK)/* $(OPTEE_OS_STAGING_SDK)
 endef
 endif # BR2_TARGET_OPTEE_OS_SDK
 
-- 
1.9.1
