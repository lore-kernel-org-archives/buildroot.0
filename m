From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 17 Jul 2016 12:34:22 +0200
Subject: [Buildroot] [PATCH 02/16 v3] core: commonalise the bundled and
	br2-external %_defconfig rules
In-Reply-To: <cover.1468750623.git.yann.morin.1998@free.fr>
References: <cover.1468750623.git.yann.morin.1998@free.fr>
Message-ID: <e302f10d06b7406978bbc888b903cb917cb0e754.1468750623.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The code for both cases is exactly the same, and only differs in the
location where defconfig files are looked for.

We use an intermediate macro to generate the corresponding rules,
because directly generating the rules is ugly and needs lots of escaping
and double-dollar-ing for the $(eval ...) and $(foreach ...) calls to
play nicely together.

Furthermore, that will be tremendously useful when we support multiple
br2-external trees.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Peter Korsgaard <jacmet@uclibc.org>
Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Cc: Arnout Vandecappelle <arnout@mind.be>

---
Changes v2 -> v3:
  - use lower-case macro  (Arnout)
  - move comment in the generated rule  (Arnout)
---
 Makefile | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/Makefile b/Makefile
index af2d982..7c0dcb1 100644
--- a/Makefile
+++ b/Makefile
@@ -847,14 +847,13 @@ olddefconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
 defconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
 	@$(COMMON_CONFIG_ENV) $< --defconfig$(if $(DEFCONFIG),=$(DEFCONFIG)) $(CONFIG_CONFIG_IN)
 
-# Override the BR2_DEFCONFIG from COMMON_CONFIG_ENV with the new defconfig
-%_defconfig: $(BUILD_DIR)/buildroot-config/conf $(TOPDIR)/configs/%_defconfig outputmakefile
-	@$(COMMON_CONFIG_ENV) BR2_DEFCONFIG=$(TOPDIR)/configs/$@ \
-		$< --defconfig=$(TOPDIR)/configs/$@ $(CONFIG_CONFIG_IN)
-
-%_defconfig: $(BUILD_DIR)/buildroot-config/conf $(BR2_EXTERNAL)/configs/%_defconfig outputmakefile
-	@$(COMMON_CONFIG_ENV) BR2_DEFCONFIG=$(BR2_EXTERNAL)/configs/$@ \
-		$< --defconfig=$(BR2_EXTERNAL)/configs/$@ $(CONFIG_CONFIG_IN)
+define percent_defconfig
+%_defconfig: $(BUILD_DIR)/buildroot-config/conf $(1)/configs/%_defconfig outputmakefile
+	# Override the BR2_DEFCONFIG from COMMON_CONFIG_ENV with the new defconfig
+	@$$(COMMON_CONFIG_ENV) BR2_DEFCONFIG=$(1)/configs/$$@ \
+		$$< --defconfig=$(1)/configs/$$@ $$(CONFIG_CONFIG_IN)
+endef
+$(eval $(foreach d,$(TOPDIR) $(BR2_EXTERNAL),$(call percent_defconfig,$(d))$(sep)))
 
 savedefconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
 	@$(COMMON_CONFIG_ENV) $< \
-- 
2.7.4
