From: Etienne Carriere <etienne.carriere@linaro.org>
Date: Fri,  1 Mar 2019 17:47:06 +0100
Subject: [Buildroot] [PATCH/next 2/9] package/optee-test: locate TA SDK
 though optee-os package
In-Reply-To: <e709b9364807ed93b5e1dc0edfe8a1dd50006b1b.1551458062.git.etienne.carriere@linaro.org>
References: <e709b9364807ed93b5e1dc0edfe8a1dd50006b1b.1551458062.git.etienne.carriere@linaro.org>
Message-ID: <283c62a3d5784f1b5635aa18a19a0e34940e692e.1551458062.git.etienne.carriere@linaro.org>
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
 package/optee-test/optee-test.mk | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/package/optee-test/optee-test.mk b/package/optee-test/optee-test.mk
index 1ab6bf4..687347d 100644
--- a/package/optee-test/optee-test.mk
+++ b/package/optee-test/optee-test.mk
@@ -11,12 +11,7 @@ OPTEE_TEST_LICENSE_FILES = LICENSE.md
 
 OPTEE_TEST_DEPENDENCIES = optee-client optee-os
 
-ifeq ($(BR2_aarch64),y)
-OPTEE_TEST_SDK = $(STAGING_DIR)/lib/optee/export-ta_arm64
-else ifeq ($(BR2_arm),y)
-OPTEE_TEST_SDK = $(STAGING_DIR)/lib/optee/export-ta_arm32
-endif
-OPTEE_TEST_CONF_OPTS = -DOPTEE_TEST_SDK=$(OPTEE_TEST_SDK)
+OPTEE_TEST_CONF_OPTS = -DOPTEE_TEST_SDK=$(OPTEE_OS_STAGING_SDK)
 
 # Trusted Application are not built from CMake due to ta_dev_kit
 # dependencies. We must build and install them on target.
@@ -24,7 +19,7 @@ define OPTEE_TEST_BUILD_TAS
 	$(foreach f,$(wildcard $(@D)/ta/*/Makefile), \
 		$(TARGET_CONFIGURE_OPTS) \
 		$(MAKE) CROSS_COMPILE=$(TARGET_CROSS) \
-			TA_DEV_KIT_DIR=$(OPTEE_TEST_SDK) \
+			TA_DEV_KIT_DIR=$(OPTEE_OS_STAGING_SDK) \
 			-C $(dir $f) all
 	)
 endef
-- 
1.9.1
