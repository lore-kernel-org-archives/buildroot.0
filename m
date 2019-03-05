From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 5 Mar 2019 21:51:23 +0100
Subject: [Buildroot] [git commit] boot/optee-os: define a new variable
 OPTEE_OS_SDK
Message-ID: <20190305210106.3E070814D8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ca34a3ed25a3e215de1cc268d08cfecfa1dee096
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit adds a new variable OPTEE_OS_SDK, define by the optee-os
package, which points to the OPTEE SDK installed in STAGING_DIR. This
will allow other pakage to find this SDK more easily.

Signed-off-by: Etienne Carriere <etienne.carriere@linaro.org>
[Thomas: improve commit log, rename variable to just OPTEE_OS_SDK]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 boot/optee-os/optee-os.mk | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/boot/optee-os/optee-os.mk b/boot/optee-os/optee-os.mk
index aeac067309..6da20a9f3e 100644
--- a/boot/optee-os/optee-os.mk
+++ b/boot/optee-os/optee-os.mk
@@ -55,9 +55,11 @@ OPTEE_OS_MAKE_OPTS += $(call qstrip,$(BR2_TARGET_OPTEE_OS_ADDITIONAL_VARIABLES))
 OPTEE_OS_BUILDDIR_OUT = out
 ifeq ($(BR2_aarch64),y)
 OPTEE_OS_LOCAL_SDK = $(OPTEE_OS_BUILDDIR_OUT)/export-ta_arm64
+OPTEE_OS_SDK = $(STAGING_DIR)/lib/optee/export-ta_arm64
 endif
 ifeq ($(BR2_arm),y)
 OPTEE_OS_LOCAL_SDK = $(OPTEE_OS_BUILDDIR_OUT)/export-ta_arm32
+OPTEE_OS_SDK = $(STAGING_DIR)/lib/optee/export-ta_arm32
 endif
 
 ifeq ($(BR2_TARGET_OPTEE_OS_CORE),y)
@@ -86,8 +88,8 @@ define OPTEE_OS_BUILD_SDK
 		 $(TARGET_CONFIGURE_OPTS) $(OPTEE_OS_MAKE_OPTS) ta_dev_kit
 endef
 define OPTEE_OS_INSTALL_STAGING_CMDS
-	mkdir -p $(STAGING_DIR)/lib/optee
-	cp -ardpf $(@D)/$(OPTEE_OS_LOCAL_SDK) $(STAGING_DIR)/lib/optee
+	mkdir -p $(OPTEE_OS_SDK)
+	cp -ardpf $(@D)/$(OPTEE_OS_LOCAL_SDK)/* $(OPTEE_OS_SDK)
 endef
 endif # BR2_TARGET_OPTEE_OS_SDK
 
