From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Fri, 4 Aug 2017 18:31:29 +0200
Subject: [Buildroot] [PATCH 1/2] Makefile: move mkdir rule to after HOST_DIR
	is defined
Message-ID: <20170804163130.15772-1-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

HOST_DIR is defined twice: once to its default value before .config is
included, and once more to BR2_HOST_DIR after .config is included.
However, the rule that defines the mkdir for HOST_DIR comes between
these two, so it will always use the default definition. Therefore,
if a non-default BR2_HOST_DIR is used, there will be no rule to create
that directory, while the dirs target depends on it.

This happens to work at the moment, because in the dirs target,
$(STAGING_DIR) comes before $(HOST_DIR), so $(HOST_DIR) will be created
implicitly. However, this will fail in top-level parallel builds where
both will be created in parallel.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 Makefile | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/Makefile b/Makefile
index 6d4aeca39a..6ca5d835f4 100644
--- a/Makefile
+++ b/Makefile
@@ -231,15 +231,6 @@ LEGAL_MANIFEST_CSV_HOST = $(LEGAL_INFO_DIR)/host-manifest.csv
 LEGAL_WARNINGS = $(LEGAL_INFO_DIR)/.warnings
 LEGAL_REPORT = $(LEGAL_INFO_DIR)/README
 
-################################################################################
-#
-# staging and target directories do NOT list these as
-# dependencies anywhere else
-#
-################################################################################
-$(BUILD_DIR) $(TARGET_DIR) $(HOST_DIR) $(BINARIES_DIR) $(LEGAL_INFO_DIR) $(REDIST_SOURCES_DIR_TARGET) $(REDIST_SOURCES_DIR_HOST):
-	@mkdir -p $@
-
 BR2_CONFIG = $(CONFIG_DIR)/.config
 
 # Pull in the user's configuration file
@@ -926,6 +917,11 @@ savedefconfig: $(BUILD_DIR)/buildroot-config/conf prepare-kconfig
 #
 ################################################################################
 
+# staging and target directories do NOT list these as
+# dependencies anywhere else
+$(BUILD_DIR) $(TARGET_DIR) $(HOST_DIR) $(BINARIES_DIR) $(LEGAL_INFO_DIR) $(REDIST_SOURCES_DIR_TARGET) $(REDIST_SOURCES_DIR_HOST):
+	@mkdir -p $@
+
 # outputmakefile generates a Makefile in the output directory, if using a
 # separate output directory. This allows convenient use of make in the
 # output directory.
-- 
2.13.3
