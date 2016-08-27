From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 27 Aug 2016 16:08:52 +0200
Subject: [Buildroot] [git commit branch/next] core: commonalise the bundled
	and br2-external %_defconfig rules
Message-ID: <20160827141122.552BE7FA50@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=666edc7aa0c8c44bacdc020b4dc3cbd10c5929f0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

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
Reviewed-by: Romain Naour <romain.naour@gmail.com>
[Thomas: move comment outside of the make target, so that it isn't
displayed on stdout when loading a defconfig.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Makefile | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/Makefile b/Makefile
index 9275c4d..5ce520b 100644
--- a/Makefile
+++ b/Makefile
@@ -847,14 +847,13 @@ olddefconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
 defconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
 	@$(COMMON_CONFIG_ENV) $< --defconfig$(if $(DEFCONFIG),=$(DEFCONFIG)) $(CONFIG_CONFIG_IN)
 
+define percent_defconfig
 # Override the BR2_DEFCONFIG from COMMON_CONFIG_ENV with the new defconfig
-%_defconfig: $(BUILD_DIR)/buildroot-config/conf $(TOPDIR)/configs/%_defconfig outputmakefile
-	@$(COMMON_CONFIG_ENV) BR2_DEFCONFIG=$(TOPDIR)/configs/$@ \
-		$< --defconfig=$(TOPDIR)/configs/$@ $(CONFIG_CONFIG_IN)
-
-%_defconfig: $(BUILD_DIR)/buildroot-config/conf $(BR2_EXTERNAL)/configs/%_defconfig outputmakefile
-	@$(COMMON_CONFIG_ENV) BR2_DEFCONFIG=$(BR2_EXTERNAL)/configs/$@ \
-		$< --defconfig=$(BR2_EXTERNAL)/configs/$@ $(CONFIG_CONFIG_IN)
+%_defconfig: $(BUILD_DIR)/buildroot-config/conf $(1)/configs/%_defconfig outputmakefile
+	@$$(COMMON_CONFIG_ENV) BR2_DEFCONFIG=$(1)/configs/$$@ \
+		$$< --defconfig=$(1)/configs/$$@ $$(CONFIG_CONFIG_IN)
+endef
+$(eval $(foreach d,$(TOPDIR) $(BR2_EXTERNAL),$(call percent_defconfig,$(d))$(sep)))
 
 savedefconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
 	@$(COMMON_CONFIG_ENV) $< \
