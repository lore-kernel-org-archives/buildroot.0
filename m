From: Etienne Carriere <etienne.carriere@linaro.org>
Date: Fri, 17 May 2019 10:45:56 +0200
Subject: [Buildroot] [PATCH 4/4] boot/optee-os: allow external SDK to build
 in-tree TAs
In-Reply-To: <20190517084556.12242-1-etienne.carriere@linaro.org>
References: <20190517084556.12242-1-etienne.carriere@linaro.org>
Message-ID: <20190517084556.12242-4-etienne.carriere@linaro.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When BR2_TARGET_OPTEE_OS_CORE is disabled, optee-os in-tree trusted
applications are not built along with with OP-TEE OS core. This change
allows one to build in-tree trusted application even when not building
OP-TEE OS core. In this case, the SDK must be provided either from
package build (BR2_TARGET_OPTEE_OS_SDK) or from an external path
(BR2_TARGET_OPTEE_OS_SDK_PATH).

Signed-off-by: Etienne Carriere <etienne.carriere@linaro.org>
---
 boot/optee-os/optee-os.mk | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/boot/optee-os/optee-os.mk b/boot/optee-os/optee-os.mk
index 750516ad94..77493a720d 100644
--- a/boot/optee-os/optee-os.mk
+++ b/boot/optee-os/optee-os.mk
@@ -77,6 +77,22 @@ endef
 endif # BR2_TARGET_OPTEE_OS_CORE
 
 ifeq ($(BR2_TARGET_OPTEE_OS_SERVICES),y)
+ifneq ($(BR2_TARGET_OPTEE_OS_CORE),y)
+# If not building core, one can still build TAs from built SDK or external SDK
+ifeq ($(BR2_TARGET_OPTEE_OS_SDK),y)
+OPTEE_OS_TAS_SDK = $(OPTEE_OS_LOCAL_SDK)
+else
+OPTEE_OS_TAS_SDK = $(OPTEE_OS_EXTERNAL_SDK)
+endif
+define OPTEE_OS_BUILD_TAS_ONLY
+	$(foreach f,$(wildcard $(@D)/ta/*/Makefile), \
+		$(TARGET_CONFIGURE_OPTS) \
+		$(MAKE) CROSS_COMPILE=$(TARGET_CROSS) \
+			TA_DEV_KIT_DIR=$(OPTEE_OS_TAS_SDK) \
+			-C $(dir $f) all
+	)
+endef
+endif # !BR2_TARGET_OPTEE_OS_CORE
 define OPTEE_OS_INSTALL_TARGET_CMDS
 	$(if $(wildcard $(@D)/$(OPTEE_OS_BUILDDIR_OUT)/ta/*/*.ta),
 		$(INSTALL) -D -m 444 -t $(TARGET_DIR)/lib/optee_armtz \
@@ -122,6 +138,7 @@ endif # BR2_TARGET_OPTEE_OS_SDK_PATH
 define OPTEE_OS_BUILD_CMDS
 	$(OPTEE_OS_BUILD_CORE)
 	$(OPTEE_OS_BUILD_SDK)
+	$(OPTEE_OS_BUILD_TAS_ONLY)
 endef
 
 define OPTEE_OS_INSTALL_IMAGES_CMDS
-- 
2.17.1
