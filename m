From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 14 Apr 2019 22:17:15 +0200
Subject: [Buildroot] [PATCH 04/12 v2] infra/pkg-download: make the DOWNLOAD
 macro fully parameterised
In-Reply-To: <cover.1555273025.git.yann.morin.1998@free.fr>
References: <cover.1555273025.git.yann.morin.1998@free.fr>
Message-ID: <d937e062549e9bce6658f98a5c06e663e4f5cdd2.1555273025.git.yann.morin.1998@free.fr>
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
changes v1 -> v2:
  - DOWNLOAD_URIS was called twice in v1, once with $(PKG) and once with
    $(1) (due to an incorrect rebase)
---
 package/pkg-download.mk | 23 ++++++++++++-----------
 package/pkg-generic.mk  |  2 +-
 2 files changed, 13 insertions(+), 12 deletions(-)

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
