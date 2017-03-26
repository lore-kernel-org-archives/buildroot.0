From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun, 26 Mar 2017 21:43:14 +0200
Subject: [Buildroot] [PATCH 1/2] Makefile: support defconfigs in
	subdirectories
Message-ID: <20170326194315.17791-1-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The pattern rule %_defconfig doesn't support a pattern that includes a
/ because of the following weird make behavior. From the GNU make info
page:

  When the target pattern does not contain a slash (and it usually does
  not), directory names in the file names are removed from the file name
  before it is compared with the target prefix and suffix. After the
  comparison of the file name to the target pattern, the directory names,
  along with the slash that ends them, are added on to the prerequisite
  file names generated from the pattern rule's prerequisite patterns and
  the file name.

In other words, foo/bar_defconfig would depend on
foo/configs/bar_defconfig instead of configs/foo/bar_defconfig.

As a workaround, introduce an intermediate target that does contain a /
and where the pattern is at the beginning: %/.../defconfig. Since this
target does contain a /, the weird splitting of the pattern doesn't
occur and we can make that target depend on .../configs/%_defconfig.

It gets slightly more complicated still because chains of pattern rules
only work if they all have commands. So we need to add a dummy command
for the %_defconfig rule.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 Makefile | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/Makefile b/Makefile
index cceae92a26..96c4d10cb3 100644
--- a/Makefile
+++ b/Makefile
@@ -895,10 +895,17 @@ defconfig: $(BUILD_DIR)/buildroot-config/conf prepare-kconfig
 	@$(COMMON_CONFIG_ENV) $< --defconfig$(if $(DEFCONFIG),=$(DEFCONFIG)) $(CONFIG_CONFIG_IN)
 
 define percent_defconfig
+# Introduce a phony intermediate target to handle / in the pattern.
+# make puts anything up to the / in the beginning if the target pattern doesn't
+# contain a /. Without the intermediate, foo/bar_defconfig would depend on
+# foo/$(1)/configs/bar_defconfig instead of $(1)/configs/foo/bar_defconfig.
+.PHONY: %$(1)/defconfig
+%_defconfig: %$(1)/defconfig
+	@: dummy command to make chain of phony targets work
 # Override the BR2_DEFCONFIG from COMMON_CONFIG_ENV with the new defconfig
-%_defconfig: $(BUILD_DIR)/buildroot-config/conf $(1)/configs/%_defconfig prepare-kconfig
-	@$$(COMMON_CONFIG_ENV) BR2_DEFCONFIG=$(1)/configs/$$@ \
-		$$< --defconfig=$(1)/configs/$$@ $$(CONFIG_CONFIG_IN)
+%$(1)/defconfig: $(BUILD_DIR)/buildroot-config/conf $(1)/configs/%_defconfig prepare-kconfig
+	@$$(COMMON_CONFIG_ENV) BR2_DEFCONFIG=$(1)/configs/$$*_defconfig \
+		$$< --defconfig=$(1)/configs/$$*_defconfig $$(CONFIG_CONFIG_IN)
 endef
 $(eval $(foreach d,$(call reverse,$(TOPDIR) $(BR2_EXTERNAL_DIRS)),$(call percent_defconfig,$(d))$(sep)))
 
-- 
2.11.0
