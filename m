From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Mon, 15 Apr 2019 23:19:48 +0200
Subject: [Buildroot] [git commit] infra/pkg-download: make the URI list a
 callable macro
Message-ID: <20190415214606.580658B8A0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=06426e16c8be31c75d551afce52d6f11704b720f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Currently, that variable is context-dependent, as it expects the PKG
variable to exist and be defined to the current package.

This is not so clean, so change the variable to a callable macro.

Adapt the caller accordingly.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/pkg-download.mk | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/package/pkg-download.mk b/package/pkg-download.mk
index 4163333998..623caf9325 100644
--- a/package/pkg-download.mk
+++ b/package/pkg-download.mk
@@ -63,19 +63,19 @@ github = https://github.com/$(1)/$(2)/archive/$(3)
 export BR_NO_CHECK_HASH_FOR =
 
 ################################################################################
-# DOWNLOAD -- Download helper. Will call DL_WRAPPER which will try to download
-# source from:
+# DOWNLOAD_URIS - List the candidates URIs where to get the package from:
 # 1) BR2_PRIMARY_SITE if enabled
 # 2) Download site, unless BR2_PRIMARY_SITE_ONLY is set
 # 3) BR2_BACKUP_SITE if enabled, unless BR2_PRIMARY_SITE_ONLY is set
 #
 # Argument 1 is the source location
+# Argument 2 is the upper-case package name
 #
 ################################################################################
 
 ifneq ($(call qstrip,$(BR2_PRIMARY_SITE)),)
 DOWNLOAD_URIS += \
-	$(call getschemeplusuri,$(call qstrip,$(BR2_PRIMARY_SITE)/$($(PKG)_DL_SUBDIR)),urlencode) \
+	$(call getschemeplusuri,$(call qstrip,$(BR2_PRIMARY_SITE)/$($(2)_DL_SUBDIR)),urlencode) \
 	$(call getschemeplusuri,$(call qstrip,$(BR2_PRIMARY_SITE)),urlencode)
 endif
 
@@ -84,11 +84,19 @@ DOWNLOAD_URIS += \
 	$(patsubst %/,%,$(dir $(call qstrip,$(1))))
 ifneq ($(call qstrip,$(BR2_BACKUP_SITE)),)
 DOWNLOAD_URIS += \
-	$(call getschemeplusuri,$(call qstrip,$(BR2_BACKUP_SITE)/$($(PKG)_DL_SUBDIR)),urlencode) \
+	$(call getschemeplusuri,$(call qstrip,$(BR2_BACKUP_SITE)/$($(2)_DL_SUBDIR)),urlencode) \
 	$(call getschemeplusuri,$(call qstrip,$(BR2_BACKUP_SITE)),urlencode)
 endif
 endif
 
+################################################################################
+# DOWNLOAD -- Download helper. Will call DL_WRAPPER which will try to download
+# source from the list returned by DOWNLOAD_URIS.
+#
+# Argument 1 is the source location
+#
+################################################################################
+
 define DOWNLOAD
 	$(Q)mkdir -p $($(PKG)_DL_DIR)
 	$(Q)$(EXTRA_ENV) $(FLOCK) $(DL_WRAPPER) \
@@ -101,7 +109,7 @@ define DOWNLOAD
 		-N '$($(PKG)_RAWNAME)' \
 		-o '$($(PKG)_DL_DIR)/$(notdir $(1))' \
 		$(if $($(PKG)_GIT_SUBMODULES),-r) \
-		$(foreach uri,$(DOWNLOAD_URIS),-u $(uri)) \
+		$(foreach uri,$(call DOWNLOAD_URIS,$(1),$(PKG)),-u $(uri)) \
 		$(QUIET) \
 		-- \
 		$($(PKG)_DL_OPTS)
