From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 27 Nov 2014 00:13:55 +0100
Subject: [Buildroot] [PATCH RFC] Makefile: from a defconfig file,
	point to the corresponding board/ entry
Message-ID: <1417043635-9055-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This is an RFC!

When configuring Buildroot from a defconfig files, soem users complain
it is non-obvious that the corresponding board documentattion is to be
found in the board/ sub-directory.

So, deduce the board name from the defconfig file, look for a similarly
named sub-dir of board (first level only), and if such a directory
exists, print a message stating extra documentation for that board is to
be found there.

This works for only 5 of our 69 defconfig files, because:

  - some boards docs are in sub-sub-dirs (count raises to 11 in that
    case);

  - most boards dirs are not directly named after the defconfig file,
    like:
        board/olimex/imx233_olinuxino/
        configs/olimex_imx233_olinuxino_defconfig

So, we could maybe improve this by renaming and moving our boards docs
so there is a one-to-one mapping from the board directory to the
corresponding defconfig file (but not necessarily the other way around).

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 Makefile | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Makefile b/Makefile
index b66bea0..15b75ee 100644
--- a/Makefile
+++ b/Makefile
@@ -783,13 +783,21 @@ defconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
 	@mkdir -p $(BUILD_DIR)/buildroot-config
 	@$(COMMON_CONFIG_ENV) $< --defconfig$(if $(DEFCONFIG),=$(DEFCONFIG)) $(CONFIG_CONFIG_IN)
 
+define DEFCONFIG_BOARD_DOCS
+	if [ -d $(TOPDIR)/board/$(subst _defconfig,,$(1)) ]; then \
+		echo "Please have a look@the documentation for this board in $(TOPDIR)/board/$(subst _defconfig,,$(1))"; \
+	fi
+endef
+
 %_defconfig: $(BUILD_DIR)/buildroot-config/conf $(TOPDIR)/configs/%_defconfig outputmakefile
 	@mkdir -p $(BUILD_DIR)/buildroot-config
 	@$(COMMON_CONFIG_ENV) $< --defconfig=$(TOPDIR)/configs/$@ $(CONFIG_CONFIG_IN)
+	@$(call DEFCONFIG_BOARD_DOCS,$@)
 
 %_defconfig: $(BUILD_DIR)/buildroot-config/conf $(BR2_EXTERNAL)/configs/%_defconfig outputmakefile
 	@mkdir -p $(BUILD_DIR)/buildroot-config
 	@$(COMMON_CONFIG_ENV) $< --defconfig=$(BR2_EXTERNAL)/configs/$@ $(CONFIG_CONFIG_IN)
+	@$(call DEFCONFIG_BOARD_DOCS,$@)
 
 savedefconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
 	@mkdir -p $(BUILD_DIR)/buildroot-config
-- 
1.9.1
