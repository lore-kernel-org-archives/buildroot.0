From: gregory hermant <gregory.hermant@calao-systems.com>
Date: Wed, 29 Aug 2012 11:55:03 +0200
Subject: [Buildroot] [PATCH] Add custom boards support for Atmel SAM-BA
	software
Message-ID: <503DE6F7.8050702@calao-systems.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


---
 package/sam-ba/Config.in.host |   13 +++++++++++++
 package/sam-ba/sam-ba.mk      |    9 +++++++++
 2 files changed, 22 insertions(+), 0 deletions(-)

diff --git a/package/sam-ba/Config.in.host b/package/sam-ba/Config.in.host
index 20b2b36..16279db 100644
--- a/package/sam-ba/Config.in.host
+++ b/package/sam-ba/Config.in.host
@@ -7,3 +7,16 @@ config BR2_PACKAGE_HOST_SAM_BA
 	  microcontrollers.
 
 	  http://www.at91.com/linux4sam/bin/view/Linux4SAM/SoftwareTools
+
+if	BR2_PACKAGE_HOST_SAM_BA
+
+config BR2_TARGET_SAM_BA_CUSTOM_PATCH_DIR
+	string "custom patch dir"
+	help
+	  If your board requires custom patches, add the path to the
+	  directory containing the patches here. The patches must be
+	  named sam-ba-<version>-<something>.patch.
+
+	  Most users may leave this empty
+
+endif
diff --git a/package/sam-ba/sam-ba.mk b/package/sam-ba/sam-ba.mk
index 9f39347..98b600b 100644
--- a/package/sam-ba/sam-ba.mk
+++ b/package/sam-ba/sam-ba.mk
@@ -8,6 +8,15 @@ define HOST_SAM_BA_EXTRACT_CMDS
         rmdir $(BUILD_DIR)/sam-ba_cdc_cdc_linux/
 endef
 
+ifneq ($(call qstrip,$(BR2_TARGET_SAM_BA_CUSTOM_PATCH_DIR)),)
+define SAM_BA_APPLY_CUSTOM_PATCHES
+	support/scripts/apply-patches.sh $(@D) $(BR2_TARGET_SAM_BA_CUSTOM_PATCH_DIR) \
+		sam-ba-$(SAM_BA_VERSION)-\*.patch
+endef
+
+HOST_SAM_BA_POST_PATCH_HOOKS += SAM_BA_APPLY_CUSTOM_PATCHES
+endif
+
 # Since it's a prebuilt application and it does not conform to the
 # usual Unix hierarchy, we install it in $(HOST_DIR)/opt/sam-ba and
 # then create a symbolic link from $(HOST_DIR)/usr/bin to the
-- 
1.5.6.3
