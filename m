From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Mon, 12 Jul 2010 23:30:51 +0200
Subject: [Buildroot] [PATCH 4/5] packages: add DOWNLOAD_GIT
In-Reply-To: <1278970252-23007-1-git-send-email-luca@lucaceresoli.net>
References: <1278970252-23007-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <1278970252-23007-5-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Allows to download packages directly from git repositories.

The repository is cloned in output/build/$(PKG)_NAME.git/ the first time,
and fetched whenever a download action is required (e.g. because
$(PKG)_VERSION changed in the package .mk file.

Sources are extracted directly from the local clone to
output/build/$(PKG)_NAME-$(PKG)_VERSION/, skipping the usual extract step.

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
---
 package/Makefile.package.in |   18 ++++++++++++++++++
 1 files changed, 18 insertions(+), 0 deletions(-)

diff --git a/package/Makefile.package.in b/package/Makefile.package.in
index a212a38..0cb3ccc 100644
--- a/package/Makefile.package.in
+++ b/package/Makefile.package.in
@@ -102,6 +102,24 @@ DOWNLOAD_FTP=$(call DOWNLOAD_WGET,$(1),$(2),$(3))
 DOWNLOAD_HTTP=$(call DOWNLOAD_WGET,$(1),$(2),$(3))
 DOWNLOAD_HTTPS=$(call DOWNLOAD_WGET,$(1),$(2),$(3))
 
+# $(call DOWNLOAD_GIT,irrelevant,irrelevant,$(PKG_NAME))
+# Download sources from a Git repository.
+# - Step 1: clone the first time, fetch thereafter, according to the logic:
+#           ( [ local clone exists ] && fetch ) || clone
+# - Step 2: Go to the cloned repo and extract specific version straight
+#           to the build dir
+# - Finally: touch .stamp_extracted in order to skip that step (kind of hack)
+define DOWNLOAD_GIT
+	( [ -d $(BUILD_DIR)/$($(3)_NAME).git/.git ] \
+	    && ( cd $(BUILD_DIR)/$($(3)_NAME).git/.git && $(GIT) fetch) \
+	    || $(GIT) clone --no-checkout $($(3)_SITE) $(BUILD_DIR)/$($(3)_NAME).git )
+	mkdir -p $($(3)_DIR)
+	cd $(BUILD_DIR)/$($(3)_NAME).git && \
+	  git archive --format=tar --prefix=$($(3)_NAME)-$($(3)_VERSION)/ $($(3)_VERSION) | \
+	    $(TAR) -x -C $(BUILD_DIR)
+	touch $($(3)_DIR)/.stamp_extracted
+endef # DOWNLOAD_GIT
+
 # Utility programs used to build packages
 TAR ?= tar
 
-- 
1.7.0.4
