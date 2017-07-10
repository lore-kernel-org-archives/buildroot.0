From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 10 Jul 2017 17:45:57 +0200
Subject: [Buildroot] [git commit] Makefile: properly create $(HOST_DIR)/usr
	compatibility symlink
Message-ID: <20170710154309.17BBF81F88@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ce58db7232900a063a543abd2699b6120d9fbbf3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Makefile | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/Makefile b/Makefile
index a22e87f..188ce9a 100644
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
 
