From: Etienne Carriere <etienne.carriere@linaro.org>
Date: Fri, 17 May 2019 10:45:53 +0200
Subject: [Buildroot] [PATCH 1/4] boot/optee-os: support external TA SDK
Message-ID: <20190517084556.12242-1-etienne.carriere@linaro.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It happens that Buildroot is used to generate the embedded filesystem
not not the boot images that which are built from another environment(s).
In such case OP-TEE SDK get built outside of Buildroot. This SDK is
needed by other OP-TEE packages in Buildroot to generate .ta files.

This change introduces BR2_TARGET_OPTEE_OS_SDK_PATH for configuration
to provide the path of an external OP-TEE SDK.

This configuration is mandated when neither BR2_TARGET_OPTEE_OS_CORE
nor BR2_TARGET_OPTEE_OS_SDK are enable while BR2_TARGET_OPTEE_OS=y.

When BR2_TARGET_OPTEE_OS_SDK_PATH is defined, the build stage of
optee-os copies the SDK file tree into optee-os build tree, for these
to be installed during target/staging install.

With this change BR2_TARGET_OPTEE_OS_SERVICES no more selects
BR2_TARGET_OPTEE_OS_CORE as .ta files can be build from external SDK.

Signed-off-by: Etienne Carriere <etienne.carriere@linaro.org>
---
 boot/optee-os/Config.in   | 13 ++++++++++++-
 boot/optee-os/optee-os.mk | 33 +++++++++++++++++++++++++++++----
 2 files changed, 41 insertions(+), 5 deletions(-)

diff --git a/boot/optee-os/Config.in b/boot/optee-os/Config.in
index 4cb05798e5..7efc1f596e 100644
--- a/boot/optee-os/Config.in
+++ b/boot/optee-os/Config.in
@@ -72,7 +72,6 @@ config BR2_TARGET_OPTEE_OS_SDK
 config BR2_TARGET_OPTEE_OS_SERVICES
 	bool "Build service TAs and libs"
 	default y
-	select BR2_TARGET_OPTEE_OS_CORE
 	help
 	  This option installs the service trusted applications and
 	  trusted shared libraries built from OP-TEE OS source tree.
@@ -81,6 +80,18 @@ config BR2_TARGET_OPTEE_OS_SERVICES
 	  load these from this non-secure filesystem/directory into
 	  the secure world for execution.
 
+
+if !BR2_TARGET_OPTEE_OS_CORE && !BR2_TARGET_OPTEE_OS_SDK
+
+config BR2_TARGET_OPTEE_OS_SDK_PATH
+	string "External SDK path"
+	depends on !BR2_TARGET_OPTEE_OS_CORE && !BR2_TARGET_OPTEE_OS_SDK
+	help
+	  Path of the prebuilt OP-TEE SDK when one build the OP-TEE resources
+	  based on an external TA developement kit.
+
+endif
+
 config BR2_TARGET_OPTEE_OS_PLATFORM
 	string "Target platform (mandatory)"
 	help
diff --git a/boot/optee-os/optee-os.mk b/boot/optee-os/optee-os.mk
index bd415512c7..750516ad94 100644
--- a/boot/optee-os/optee-os.mk
+++ b/boot/optee-os/optee-os.mk
@@ -62,6 +62,8 @@ OPTEE_OS_LOCAL_SDK = $(OPTEE_OS_BUILDDIR_OUT)/export-ta_arm32
 OPTEE_OS_SDK = $(STAGING_DIR)/lib/optee/export-ta_arm32
 endif
 
+OPTEE_OS_EXTERNAL_SDK = $(call qstrip,$(BR2_TARGET_OPTEE_OS_SDK_PATH))
+
 ifeq ($(BR2_TARGET_OPTEE_OS_CORE),y)
 define OPTEE_OS_BUILD_CORE
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) O=$(OPTEE_OS_BUILDDIR_OUT) \
@@ -85,17 +87,38 @@ define OPTEE_OS_INSTALL_TARGET_CMDS
 endef
 endif # BR2_TARGET_OPTEE_OS_SERVICES
 
+# SDK staging install is common the SDK staging install, used when
+# either package builds SDK or package imports an external SDK.
+define OPTEE_OS_INSTALL_STAGING_SDK
+	mkdir -p $(OPTEE_OS_SDK)
+	cp -ardpf $(@D)/$(OPTEE_OS_LOCAL_SDK)/* $(OPTEE_OS_SDK)
+endef
+
 ifeq ($(BR2_TARGET_OPTEE_OS_SDK),y)
 define OPTEE_OS_BUILD_SDK
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) O=$(OPTEE_OS_BUILDDIR_OUT) \
 		 $(TARGET_CONFIGURE_OPTS) $(OPTEE_OS_MAKE_OPTS) ta_dev_kit
 endef
 define OPTEE_OS_INSTALL_STAGING_CMDS
-	mkdir -p $(OPTEE_OS_SDK)
-	cp -ardpf $(@D)/$(OPTEE_OS_LOCAL_SDK)/* $(OPTEE_OS_SDK)
+	$(OPTEE_OS_INSTALL_STAGING_SDK)
 endef
 endif # BR2_TARGET_OPTEE_OS_SDK
 
+ifneq ($(BR2_TARGET_OPTEE_OS_SDK_PATH),)
+ifeq (,$(wildcard $(OPTEE_OS_EXTERNAL_SDK)))
+$(error Invalid external SDK path $(OPTEE_OS_EXTERNAL_SDK))
+endif
+# SDK is not built from sources but imported from an external filetree
+# BR2_TARGET_OPTEE_OS_SDK_PATH mandates !BR2_TARGET_OPTEE_OS_SDK
+define OPTEE_OS_BUILD_SDK
+	mkdir -p $(@D)/$(OPTEE_OS_LOCAL_SDK)
+	cp -ardpf $(OPTEE_OS_EXTERNAL_SDK)/* $(@D)/$(OPTEE_OS_LOCAL_SDK)
+endef
+define OPTEE_OS_INSTALL_STAGING_CMDS
+	$(OPTEE_OS_INSTALL_STAGING_SDK)
+endef
+endif # BR2_TARGET_OPTEE_OS_SDK_PATH
+
 define OPTEE_OS_BUILD_CMDS
 	$(OPTEE_OS_BUILD_CORE)
 	$(OPTEE_OS_BUILD_SDK)
@@ -106,10 +129,12 @@ define OPTEE_OS_INSTALL_IMAGES_CMDS
 	$(OPTEE_OS_INSTALL_IMAGES_SERVICES)
 endef
 
-ifeq ($(BR2_TARGET_OPTEE_OS)$(BR_BUILDING),yy)
+ifeq ($(BR_BUILDING),y)
+ifneq (,$(filter y,$(BR2_TARGET_OPTEE_OS_CORE) $(BR2_TARGET_OPTEE_OS_SDK)))
 ifeq ($(call qstrip,$(BR2_TARGET_OPTEE_OS_PLATFORM)),)
 $(error No OP-TEE OS platform set. Check your BR2_TARGET_OPTEE_OS_PLATFORM setting)
 endif
-endif # BR2_TARGET_OPTEE_OS && BR2_BUILDING
+endif # BR2_TARGET_OPTEE_OS_CORE || BR2_TARGET_OPTEE_OS_SDK
+endif # BR2_BUILDING
 
 $(eval $(generic-package))
-- 
2.17.1
