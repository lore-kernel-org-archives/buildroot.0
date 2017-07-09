From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Mon, 10 Jul 2017 01:21:17 +0200
Subject: [Buildroot] [PATCH 1/7] Makefile: properly create $(HOST_DIR)/usr
	compatibility symlink
In-Reply-To: <20170709232123.30120-1-arnout@mind.be>
References: <20170709232123.30120-1-arnout@mind.be>
Message-ID: <20170709232123.30120-2-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Up to now we created the $(HOST_DIR)/usr compatibility symlink as part
of the creation of $(HOST_DIR) itself. However, when the user specifies
a custom BR2_HOST_DIR, it is possible that the directory already exists
so this rule will never trigger.

Therefore, add an explicit rule for creating $(HOST_DIR)/usr and add
this rule to the dependencies of the dirs target. HOST_DIR itself goes
back to the standard rule for directories. The order-only dependency of
STAGING_DIR isn't needed any more either: HOST_DIR is implicitly
created if needed by mkdir -p, and we don't need to trigger the
HOST_DIR rule any more if the directory already exists.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 Makefile | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/Makefile b/Makefile
index a22e87f29e..188ce9adc7 100644
--- a/Makefile
+++ b/Makefile
@@ -237,7 +237,7 @@ LEGAL_REPORT = $(LEGAL_INFO_DIR)/README
 # dependencies anywhere else
 #
 ################################################################################
-$(BUILD_DIR) $(TARGET_DIR) $(BINARIES_DIR) $(LEGAL_INFO_DIR) $(REDIST_SOURCES_DIR_TARGET) $(REDIST_SOURCES_DIR_HOST):
+$(BUILD_DIR) $(TARGET_DIR) $(HOST_DIR) $(BINARIES_DIR) $(LEGAL_INFO_DIR) $(REDIST_SOURCES_DIR_TARGET) $(REDIST_SOURCES_DIR_HOST):
 	@mkdir -p $@
 
 BR2_CONFIG = $(CONFIG_DIR)/.config
@@ -541,7 +541,7 @@ endif
 
 .PHONY: dirs
 dirs: $(BUILD_DIR) $(STAGING_DIR) $(TARGET_DIR) \
-	$(HOST_DIR) $(BINARIES_DIR)
+	$(HOST_DIR) $(HOST_DIR)/usr $(BINARIES_DIR)
 
 $(BUILD_DIR)/buildroot-config/auto.conf: $(BR2_CONFIG)
 	$(MAKE1) $(EXTRAMAKEARGS) HOSTCC="$(HOSTCC_NOCCACHE)" HOSTCXX="$(HOSTCXX_NOCCACHE)" silentoldconfig
@@ -552,13 +552,12 @@ prepare: $(BUILD_DIR)/buildroot-config/auto.conf
 .PHONY: world
 world: target-post-image
 
-# When creating HOST_DIR, also symlink usr -> .
-$(HOST_DIR):
-	@mkdir -p $@
-	@ln -snf . $@/usr
+# Compatibility symlink in case a post-build script still uses $(HOST_DIR)/usr
+$(HOST_DIR)/usr: $(HOST_DIR)
+	@ln -snf . $@
 
 # Populating the staging with the base directories is handled by the skeleton package
-$(STAGING_DIR): | $(HOST_DIR)
+$(STAGING_DIR):
 	@mkdir -p $(STAGING_DIR)
 	@ln -snf $(STAGING_DIR) $(BASE_DIR)/staging
 
-- 
2.13.2
