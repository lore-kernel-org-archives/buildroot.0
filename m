From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 5 Mar 2019 21:54:32 +0100
Subject: [Buildroot] [git commit] package/optee-examples: use the
 OPTEE_OS_SDK variable
Message-ID: <20190305210106.4AFE6814D8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=24ac0fef4a7379475025616bc98dea6063a93dc2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The optee-os package was recently changed to provide the OPTEE_OS_SDK
to allow other packages to locate the OP-TEE Trusted Application SDK,
so let's use this new variable in the optee-examples package.

Signed-off-by: Etienne Carriere <etienne.carriere@linaro.org>
[Thomas: use the new variable name, rework commit log]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/optee-examples/optee-examples.mk | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/package/optee-examples/optee-examples.mk b/package/optee-examples/optee-examples.mk
index 10fe62b72a..f2163b8643 100644
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
+			TA_DEV_KIT_DIR=$(OPTEE_OS_SDK) \
 			O=out -C $(dir $f) all
 	)
 endef
