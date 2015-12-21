From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 21 Dec 2015 16:56:54 +0100
Subject: [Buildroot] [PATCH 3/8 RFC] core/pkg-generic: install foo-config
	scripts in their own dir
In-Reply-To: <cover.1450712392.git.yann.morin.1998@free.fr>
References: <cover.1450712392.git.yann.morin.1998@free.fr>
Message-ID: <66985474d41d8d25b6f75560665322b88f6e6813.1450712392.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

After we fixup the foo-config scripts of a package, copy them to their
own directory that we put early in the PATH, so that packges that
hard-code calls to foo-config will find them automatically and avoid
finding those of the host.

Note that we do keep the fixed-up scripts in staging, because we already
pass 'FOO_CONFIG=$(STAGING)/usr/bin/foo-config' to a lot of packages,
some for which we even have patches to accept the FOO_CONFIG environment
variables. We need to unpatch those packages before we can just move the
fixed-up foo-config scripts out of staging.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
---
 Makefile               | 7 +++++--
 package/pkg-generic.mk | 4 +++-
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/Makefile b/Makefile
index f2b09ad..780b596 100644
--- a/Makefile
+++ b/Makefile
@@ -363,6 +363,9 @@ TAR_OPTIONS = $(call qstrip,$(BR2_TAR_OPTIONS)) -xf
 # packages compiled for the host go here
 HOST_DIR := $(call qstrip,$(BR2_HOST_DIR))
 
+# foo-config scripts for the target go here
+FOO_CONFIG_DIR := $(HOST_DIR)/opt/foo-config
+
 # Quotes are needed for spaces and all in the original PATH content.
 BR_PATH = "$(HOST_DIR)/bin:$(HOST_DIR)/sbin:$(HOST_DIR)/usr/bin:$(HOST_DIR)/usr/sbin:$(PATH)"
 
@@ -426,7 +429,7 @@ include fs/common.mk
 include $(BR2_EXTERNAL)/external.mk
 
 dirs: $(BUILD_DIR) $(STAGING_DIR) $(TARGET_DIR) \
-	$(HOST_DIR) $(BINARIES_DIR)
+	$(HOST_DIR) $(BINARIES_DIR) $(FOO_CONFIG_DIR)
 
 $(BUILD_DIR)/buildroot-config/auto.conf: $(BR2_CONFIG)
 	$(MAKE1) $(EXTRAMAKEARGS) HOSTCC="$(HOSTCC_NOCCACHE)" HOSTCXX="$(HOSTCXX_NOCCACHE)" silentoldconfig
@@ -445,7 +448,7 @@ world: target-post-image
 # dependencies anywhere else
 #
 ################################################################################
-$(BUILD_DIR) $(TARGET_DIR) $(HOST_DIR) $(BINARIES_DIR):
+$(BUILD_DIR) $(TARGET_DIR) $(HOST_DIR) $(BINARIES_DIR) $(FOO_CONFIG_DIR):
 	@mkdir -p $@
 $(LEGAL_INFO_DIR) $(REDIST_SOURCES_DIR_TARGET) $(REDIST_SOURCES_DIR_HOST):
 	@mkdir -p $@
diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 69349f6..6e3aee1 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -246,7 +246,9 @@ $(BUILD_DIR)/%/.stamp_staging_installed:
 				-e "s,-L/usr/,-L at STAGING_DIR@/usr/,g" \
 				-e "s, at STAGING_DIR@,$(STAGING_DIR),g" \
 				-e "s, at BASE_DIR@,$(BASE_DIR),g" \
-				$(STAGING_DIR)/usr/bin/$(s); ) \
+				$(STAGING_DIR)/usr/bin/$(s); \
+			$(INSTALL) -m 0755 -D $(STAGING_DIR)/usr/bin/$(s) \
+				$(FOO_CONFIG_DIR)/$(s); ) \
 	fi
 	@$(call MESSAGE,"Fixing libtool files")
 	$(Q)find $(STAGING_DIR)/usr/lib* -name "*.la" | xargs --no-run-if-empty \
-- 
1.9.1
