From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  7 Apr 2019 13:51:19 +0200
Subject: [Buildroot] [PATCH 04/10] infra/pkg-download: make the DOWNLOAD
 macro fully parameterised
In-Reply-To: <cover.1554637858.git.yann.morin.1998@free.fr>
References: <cover.1554637858.git.yann.morin.1998@free.fr>
Message-ID: <ab4eea8e4f41632061e7793bb15f1d800821dbe0.1554637858.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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
---
 package/pkg-download.mk | 22 ++++++++++++----------
 package/pkg-generic.mk  |  2 +-
 2 files changed, 13 insertions(+), 11 deletions(-)

diff --git a/package/pkg-download.mk b/package/pkg-download.mk
index b8adb0ca05..8ce9f0a97c 100644
--- a/package/pkg-download.mk
+++ b/package/pkg-download.mk
@@ -69,6 +69,7 @@ export BR_NO_CHECK_HASH_FOR =
 # 3) BR2_BACKUP_SITE if enabled, unless BR2_PRIMARY_SITE_ONLY is set
 #
 # Argument 1 is the source location
+# Argument 2 is the upper-case package name
 #
 #
 # DOWNLOAD_URIS - List the candidates URIs where to get the package from:
@@ -95,19 +96,20 @@ endif
 endif
 
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
+		-H '$($(2)_HASH_FILE)' \
+		-n '$($(2)_BASENAME_RAW)' \
+		-N '$($(2)_RAWNAME)' \
+		-o '$($(2)_DL_DIR)/$(notdir $(1))' \
+		$(if $($(2)_GIT_SUBMODULES),-r) \
 		$(patsubst %,-u %,$(call DOWNLOAD_URIS,$(1),$(PKG))) \
+		$(patsubst %,-u %,$(call DOWNLOAD_URIS,$(1),$(2))) \
 		$(QUIET) \
 		-- \
-		$($(PKG)_DL_OPTS)
+		$($(2)_DL_OPTS)
 endef
diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index a83813e28d..f78ff2e665 100644
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
-- 
2.14.1
