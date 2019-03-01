From: Etienne Carriere <etienne.carriere@linaro.org>
Date: Fri,  1 Mar 2019 17:47:07 +0100
Subject: [Buildroot] [PATCH/next 3/9] package/optee-examples: locate TA SDK
 though optee-os package
In-Reply-To: <e709b9364807ed93b5e1dc0edfe8a1dd50006b1b.1551458062.git.etienne.carriere@linaro.org>
References: <e709b9364807ed93b5e1dc0edfe8a1dd50006b1b.1551458062.git.etienne.carriere@linaro.org>
Message-ID: <7b26af8b76a3c9e67ac6ce6b1c48a683641e98a4.1551458062.git.etienne.carriere@linaro.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Package optee-os was recently changed to produce variable
OPTEE_OS_STAGING_SDK to other packages to locate the OP-TEE Trusted
Application SDK generated from optee-os package and installed in
the Buildroot output staging directory.

Signed-off-by: Etienne Carriere <etienne.carriere@linaro.org>
---
 package/optee-examples/optee-examples.mk | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/package/optee-examples/optee-examples.mk b/package/optee-examples/optee-examples.mk
index 10fe62b..1f5548d 100644
--- a/package/optee-examples/optee-examples.mk
+++ b/package/optee-examples/optee-examples.mk
@@ -11,19 +11,13 @@ OPTEE_EXAMPLES_LICENSE_FILES = LICENSE
 
 OPTEE_EXAMPLES_DEPENDENCIES = optee-client optee-os
 
-ifeq ($(BR2_aarch64),y)
-OPTEE_EXAMPLES_SDK = $(STAGING_DIR)/lib/optee/export-ta_arm64
-else ifeq ($(BR2_arm),y)
-OPTEE_EXAMPLES_SDK = $(STAGING_DIR)/lib/optee/export-ta_arm32
-endif
-
 # Trusted Application are not built from CMake due to ta_dev_kit dependencies.
 # We must build and install them on target.
 define OPTEE_EXAMPLES_BUILD_TAS
 	$(foreach f,$(wildcard $(@D)/*/ta/Makefile), \
 		$(TARGET_CONFIGURE_OPTS) \
 		$(MAKE) CROSS_COMPILE=$(TARGET_CROSS) \
-			TA_DEV_KIT_DIR=$(OPTEE_EXAMPLES_SDK) \
+			TA_DEV_KIT_DIR=$(OPTEE_OS_STAGING_SDK) \
 			O=out -C $(dir $f) all
 	)
 endef
-- 
1.9.1
