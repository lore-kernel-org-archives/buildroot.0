From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 27 May 2015 01:42:03 +0200
Subject: [Buildroot] [PATCH 08/21 RFC] core: move rule to create basic
	directories
In-Reply-To: <cover.1432681414.git.yann.morin.1998@free.fr>
References: <cover.1432681414.git.yann.morin.1998@free.fr>
Message-ID: <af8a2c5f663719a6da0fad5ee8998b567ef678e7.1432681414.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Some of those directories will be needed even during configuration, like
BUILD_DIR, where we'll store the generated kconfig snippet.

So, move the rule to create them outside the HAVE_CONFIG block.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Peter Korsgaard <jacmet@uclibc.org>
---
 Makefile | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/Makefile b/Makefile
index 351341e..b2d8a5a 100644
--- a/Makefile
+++ b/Makefile
@@ -193,6 +193,15 @@ LEGAL_LICENSES_TXT_HOST = $(LEGAL_INFO_DIR)/host-licenses.txt
 LEGAL_WARNINGS = $(LEGAL_INFO_DIR)/.warnings
 LEGAL_REPORT = $(LEGAL_INFO_DIR)/README
 
+################################################################################
+#
+# staging and target directories do NOT list these as
+# dependencies anywhere else
+#
+################################################################################
+$(BUILD_DIR) $(HOST_DIR) $(BINARIES_DIR) $(LEGAL_INFO_DIR) $(REDIST_SOURCES_DIR_TARGET) $(REDIST_SOURCES_DIR_HOST):
+	@mkdir -p $@
+
 BR2_CONFIG = $(CONFIG_DIR)/.config
 
 # Pull in the user's configuration file
@@ -421,15 +430,6 @@ world: target-post-image
 	legal-info legal-info-prepare legal-info-clean printvars help \
 	list-defconfigs target-finalize target-post-image source-check
 
-################################################################################
-#
-# staging and target directories do NOT list these as
-# dependencies anywhere else
-#
-################################################################################
-$(BUILD_DIR) $(HOST_DIR) $(BINARIES_DIR) $(LEGAL_INFO_DIR) $(REDIST_SOURCES_DIR_TARGET) $(REDIST_SOURCES_DIR_HOST):
-	@mkdir -p $@
-
 # We make a symlink lib32->lib or lib64->lib as appropriate
 # MIPS64/n32 requires lib32 even though it's a 64-bit arch.
 ifeq ($(BR2_ARCH_IS_64)$(BR2_MIPS_NABI32),y)
-- 
1.9.1
