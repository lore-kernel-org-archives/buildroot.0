From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun, 12 Oct 2014 20:21:04 +0200
Subject: [Buildroot] [PATCH v2 1/2] randconfig,
	allyesconfig: fix handling of legacy options
In-Reply-To: <1413134795-32050-1-git-send-email-arnout@mind.be>
References: <1413134795-32050-1-git-send-email-arnout@mind.be>
Message-ID: <1413138065-6138-1-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Randconfig and allyesconfig should never select legacy options, so use
the same trick as allpackageyesconfig and randpackageconfig to remove
them.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 Makefile | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index 907a0fc..5bcaa77 100644
--- a/Makefile
+++ b/Makefile
@@ -731,11 +731,25 @@ oldconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
 
 randconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
 	@mkdir -p $(BUILD_DIR)/buildroot-config
-	@$(COMMON_CONFIG_ENV) $< --randconfig $(CONFIG_CONFIG_IN)
+	@rm -f $(CONFIG_DIR)/.config.nopkg
+	@grep '^config ' Config.in.legacy | \
+		while read config pkg; do \
+		echo "# $$pkg is not set" >> $(CONFIG_DIR)/.config.nopkg; done
+	@$(COMMON_CONFIG_ENV) \
+		KCONFIG_ALLCONFIG=$(CONFIG_DIR)/.config.nopkg \
+		$< --randconfig $(CONFIG_CONFIG_IN)
+	@rm -f $(CONFIG_DIR)/.config.nopkg
 
 allyesconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
 	@mkdir -p $(BUILD_DIR)/buildroot-config
-	@$(COMMON_CONFIG_ENV) $< --allyesconfig $(CONFIG_CONFIG_IN)
+	@rm -f $(CONFIG_DIR)/.config.nopkg
+	@grep '^config ' Config.in.legacy | \
+		while read config pkg; do \
+		echo "# $$pkg is not set" >> $(CONFIG_DIR)/.config.nopkg; done
+	@$(COMMON_CONFIG_ENV) \
+		KCONFIG_ALLCONFIG=$(CONFIG_DIR)/.config.nopkg \
+		$< --allyesconfig $(CONFIG_CONFIG_IN)
+	@rm -f $(CONFIG_DIR)/.config.nopkg
 
 allnoconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
 	@mkdir -p $(BUILD_DIR)/buildroot-config
-- 
2.1.1
