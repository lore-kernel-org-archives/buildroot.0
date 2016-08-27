From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 27 Aug 2016 21:39:59 +0200
Subject: [Buildroot] [git commit branch/next] core: move rule to create
	basic directories
Message-ID: <20160827194135.48CA07FABC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b1e079b68b794b428e756adf75485a8b1ceade13
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Some of those directories will be needed even during configuration, like
BUILD_DIR, where we'll store the generated kconfig snippet.

So, move the rule to create them outside the BR2_HAVE_DOT_CONFIG block.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Peter Korsgaard <jacmet@uclibc.org>
Reviewed-by: Romain Naour <romain.naour@gmail.com>
[Thomas: fixup commit log, as noticed by Romain Naour.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Makefile | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/Makefile b/Makefile
index d1298d8..c9865a6 100644
--- a/Makefile
+++ b/Makefile
@@ -200,6 +200,15 @@ LEGAL_LICENSES_TXT_HOST = $(LEGAL_INFO_DIR)/host-licenses.txt
 LEGAL_WARNINGS = $(LEGAL_INFO_DIR)/.warnings
 LEGAL_REPORT = $(LEGAL_INFO_DIR)/README
 
+################################################################################
+#
+# staging and target directories do NOT list these as
+# dependencies anywhere else
+#
+################################################################################
+$(BUILD_DIR) $(TARGET_DIR) $(HOST_DIR) $(BINARIES_DIR) $(LEGAL_INFO_DIR) $(REDIST_SOURCES_DIR_TARGET) $(REDIST_SOURCES_DIR_HOST):
+	@mkdir -p $@
+
 BR2_CONFIG = $(CONFIG_DIR)/.config
 
 # Pull in the user's configuration file
@@ -496,15 +505,6 @@ world: target-post-image
 	legal-info legal-info-prepare legal-info-clean printvars help \
 	list-defconfigs target-finalize target-post-image source-check
 
-################################################################################
-#
-# staging and target directories do NOT list these as
-# dependencies anywhere else
-#
-################################################################################
-$(BUILD_DIR) $(TARGET_DIR) $(HOST_DIR) $(BINARIES_DIR) $(LEGAL_INFO_DIR) $(REDIST_SOURCES_DIR_TARGET) $(REDIST_SOURCES_DIR_HOST):
-	@mkdir -p $@
-
 # Populating the staging with the base directories is handled by the skeleton package
 $(STAGING_DIR):
 	@mkdir -p $(STAGING_DIR)
