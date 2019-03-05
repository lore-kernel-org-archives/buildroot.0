From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 5 Mar 2019 21:54:24 +0100
Subject: [Buildroot] [git commit] package/optee-test: use the OPTEE_OS_SDK
 variable
Message-ID: <20190305210106.448ED814D8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=259ba88cadf43d3c7a1d9ece6d64ef7407721903
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The optee-os package was recently changed to provide the OPTEE_OS_SDK
to allow other packages to locate the OP-TEE Trusted Application SDK,
so let's use this new variable in the optee-test package.

Signed-off-by: Etienne Carriere <etienne.carriere@linaro.org>
[Thomas: use the new variable name, rework commit log]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/optee-test/optee-test.mk | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/package/optee-test/optee-test.mk b/package/optee-test/optee-test.mk
index 1ab6bf4fec..73accf3d1e 100644
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
+OPTEE_TEST_CONF_OPTS = -DOPTEE_TEST_SDK=$(OPTEE_OS_SDK)
 
 # Trusted Application are not built from CMake due to ta_dev_kit
 # dependencies. We must build and install them on target.
@@ -24,7 +19,7 @@ define OPTEE_TEST_BUILD_TAS
 	$(foreach f,$(wildcard $(@D)/ta/*/Makefile), \
 		$(TARGET_CONFIGURE_OPTS) \
 		$(MAKE) CROSS_COMPILE=$(TARGET_CROSS) \
-			TA_DEV_KIT_DIR=$(OPTEE_TEST_SDK) \
+			TA_DEV_KIT_DIR=$(OPTEE_OS_SDK) \
 			-C $(dir $f) all
 	)
 endef
