From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu,  2 Feb 2012 23:29:26 +0100
Subject: [Buildroot] [PATCH 2/2] at91bootstrap: allow specification of a
	custom patch directory
In-Reply-To: <cover.1328221763.git.thomas.petazzoni@free-electrons.com>
References: <cover.1328221763.git.thomas.petazzoni@free-electrons.com>
Message-ID: <8fe0225224326ed767967fd789e7d3b33c1bb674.1328221763.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes bug #4664.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 boot/at91bootstrap/Config.in        |    9 +++++++++
 boot/at91bootstrap/at91bootstrap.mk |    9 +++++++++
 2 files changed, 18 insertions(+), 0 deletions(-)

diff --git a/boot/at91bootstrap/Config.in b/boot/at91bootstrap/Config.in
index b232b3b..9cbaf81 100644
--- a/boot/at91bootstrap/Config.in
+++ b/boot/at91bootstrap/Config.in
@@ -10,6 +10,15 @@ config BR2_TARGET_AT91BOOTSTRAP
 
 if	BR2_TARGET_AT91BOOTSTRAP
 
+config BR2_TARGET_AT91BOOTSTRAP_CUSTOM_PATCH_DIR
+	string "custom patch dir"
+	help
+	  If your board requires custom patches, add the path to the
+	  directory containing the patches here. The patches must be
+	  named at91bootstrap-<version>-<something>.patch.
+
+	  Most users may leave this empty
+
 config BR2_TARGET_AT91BOOTSTRAP_BOARD
 	string "Bootstrap board"
 	default ""
diff --git a/boot/at91bootstrap/at91bootstrap.mk b/boot/at91bootstrap/at91bootstrap.mk
index a7a856c..5592d37 100644
--- a/boot/at91bootstrap/at91bootstrap.mk
+++ b/boot/at91bootstrap/at91bootstrap.mk
@@ -21,6 +21,15 @@ define AT91BOOTSTRAP_EXTRACT_CMDS
 	rmdir $(BUILD_DIR)/Bootstrap-v$(AT91BOOTSTRAP_VERSION)
 endef
 
+ifneq ($(call qstrip,$(BR2_TARGET_AT91BOOTSTRAP_CUSTOM_PATCH_DIR)),)
+define AT91BOOTSTRAP_APPLY_CUSTOM_PATCHES
+	support/scripts/apply-patches.sh $(@D) $(BR2_TARGET_AT91BOOTSTRAP_CUSTOM_PATCH_DIR) \
+		at91bootstrap-$(AT91BOOTSTRAP_VERSION)-\*.patch
+endef
+
+AT91BOOTSTRAP_POST_PATCH_HOOKS += AT91BOOTSTRAP_APPLY_CUSTOM_PATCHES
+endif
+
 define AT91BOOTSTRAP_BUILD_CMDS
 	$(MAKE) CROSS_COMPILE=$(TARGET_CROSS) -C $(@D)/$(AT91BOOTSTRAP_MAKE_SUBDIR)
 endef
-- 
1.7.4.1
