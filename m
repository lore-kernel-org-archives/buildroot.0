From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Mon, 15 Apr 2019 23:21:54 +0200
Subject: [Buildroot] [git commit] infra/pkg-download: make the DOWNLOAD
 macro fully parameterised
Message-ID: <20190415214606.8F10F8EA84@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5a0d6813948fea2cdb88a2e35984520eec856dec
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Currently, the DOWNLOAD macro is context-dependent and expects
the PKG variable to be set to the current package.

This is not so nice.

Change the macro to expect the upper-case package name as a
parameter, rather than expect it from a variable.

Adapt the caller accordingly.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/pkg-download.mk | 23 ++++++++++++-----------
 package/pkg-generic.mk  |  4 ++--
 2 files changed, 14 insertions(+), 13 deletions(-)

diff --git a/package/pkg-download.mk b/package/pkg-download.mk
index 96a12b1f2e..de619ba90a 100644
--- a/package/pkg-download.mk
+++ b/package/pkg-download.mk
@@ -93,23 +93,24 @@ endif
 # source from the list returned by DOWNLOAD_URIS.
 #
 # Argument 1 is the source location
+# Argument 2 is the upper-case package name
 #
 ################################################################################
 
 define DOWNLOAD
-	$(Q)mkdir -p $($(PKG)_DL_DIR)
-	$(Q)$(EXTRA_ENV) flock $($(PKG)_DL_DIR)/ $(DL_WRAPPER) \
-		-c '$($(PKG)_DL_VERSION)' \
-		-d '$($(PKG)_DL_DIR)' \
+	$(Q)mkdir -p $($(2)_DL_DIR)
+	$(Q)$(EXTRA_ENV) flock $($(2)_DL_DIR)/ $(DL_WRAPPER) \
+		-c '$($(2)_DL_VERSION)' \
+		-d '$($(2)_DL_DIR)' \
 		-D '$(DL_DIR)' \
 		-f '$(notdir $(1))' \
-		-H '$($(PKG)_HASH_FILE)' \
-		-n '$($(PKG)_BASENAME_RAW)' \
-		-N '$($(PKG)_RAWNAME)' \
-		-o '$($(PKG)_DL_DIR)/$(notdir $(1))' \
-		$(if $($(PKG)_GIT_SUBMODULES),-r) \
-		$(foreach uri,$(call DOWNLOAD_URIS,$(1),$(PKG)),-u $(uri)) \
+		-H '$($(2)_HASH_FILE)' \
+		-n '$($(2)_BASENAME_RAW)' \
+		-N '$($(2)_RAWNAME)' \
+		-o '$($(2)_DL_DIR)/$(notdir $(1))' \
+		$(if $($(2)_GIT_SUBMODULES),-r) \
+		$(foreach uri,$(call DOWNLOAD_URIS,$(1),$(2)),-u $(uri)) \
 		$(QUIET) \
 		-- \
-		$($(PKG)_DL_OPTS)
+		$($(2)_DL_OPTS)
 endef
diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index a83813e28d..8ff8cff12d 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -149,7 +149,7 @@ $(BUILD_DIR)/%/.stamp_downloaded:
 			break ; \
 		fi ; \
 	done
-	$(foreach p,$($(PKG)_ALL_DOWNLOADS),$(call DOWNLOAD,$(p))$(sep))
+	$(foreach p,$($(PKG)_ALL_DOWNLOADS),$(call DOWNLOAD,$(p),$(PKG))$(sep))
 	$(foreach hook,$($(PKG)_POST_DOWNLOAD_HOOKS),$(call $(hook))$(sep))
 	$(Q)mkdir -p $(@D)
 	@$(call step_end,download)
@@ -158,7 +158,7 @@ $(BUILD_DIR)/%/.stamp_downloaded:
 # Retrieve actual source archive, e.g. for prebuilt external toolchains
 $(BUILD_DIR)/%/.stamp_actual_downloaded:
 	@$(call step_start,actual-download)
-	$(call DOWNLOAD,$($(PKG)_ACTUAL_SOURCE_SITE)/$($(PKG)_ACTUAL_SOURCE_TARBALL))
+	$(call DOWNLOAD,$($(PKG)_ACTUAL_SOURCE_SITE)/$($(PKG)_ACTUAL_SOURCE_TARBALL),$(PKG))
 	$(Q)mkdir -p $(@D)
 	@$(call step_end,actual-download)
 	$(Q)touch $@
