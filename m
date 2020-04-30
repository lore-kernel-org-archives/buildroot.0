From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 30 Apr 2020 11:52:39 +0200
Subject: [Buildroot] [PATCH 02/11] package/pkg-generic.mk: drop useless $(1)
 argument in step_pkg_size_{before, after}
In-Reply-To: <20200430095249.782597-1-thomas.petazzoni@bootlin.com>
References: <20200430095249.782597-1-thomas.petazzoni@bootlin.com>
Message-ID: <20200430095249.782597-3-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The $(1) argument passed to step_pkg_size_{before,after}, which
contains the package name, is no longer used. We simply use $(PKG) to
get the upper-case version of the package name.

So, let's drop this first argument that isn't needed.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/pkg-generic.mk | 40 +++++++++++++++++++---------------------
 1 file changed, 19 insertions(+), 21 deletions(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index d8df34ed14..fc43807bb0 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -57,45 +57,43 @@ GLOBAL_INSTRUMENTATION_HOOKS += step_time
 
 # Hooks to collect statistics about installed files
 
-# $(1): package name
-# $(2): base directory to search in
-# $(3): suffix of file (optional)
+# $(1): base directory to search in
+# $(2): suffix of file (optional)
 define step_pkg_size_before
-	cd $(2); \
+	cd $(1); \
 	LC_ALL=C find . \( -type f -o -type l \) -printf '%T@:%i:%#m:%y:%s,%p\n' \
-		| LC_ALL=C sort > $($(PKG)_DIR)/.files-list$(3).before
+		| LC_ALL=C sort > $($(PKG)_DIR)/.files-list$(2).before
 endef
 
-# $(1): package name
-# $(2): base directory to search in
-# $(3): suffix of file (optional)
+# $(1): base directory to search in
+# $(2): suffix of file (optional)
 define step_pkg_size_after
-	cd $(2); \
+	cd $(1); \
 	LC_ALL=C find . \( -type f -o -type l \) -printf '%T@:%i:%#m:%y:%s,%p\n' \
-		| LC_ALL=C sort > $($(PKG)_DIR)/.files-list$(3).after
+		| LC_ALL=C sort > $($(PKG)_DIR)/.files-list$(2).after
 	LC_ALL=C comm -13 \
-		$($(PKG)_DIR)/.files-list$(3).before \
-		$($(PKG)_DIR)/.files-list$(3).after \
+		$($(PKG)_DIR)/.files-list$(2).before \
+		$($(PKG)_DIR)/.files-list$(2).after \
 		| sed -r -e 's/^[^,]+/$($(PKG)_NAME)/' \
-		> $($(PKG)_DIR)/.files-list$(3).txt
-	rm -f $($(PKG)_DIR)/.files-list$(3).before
-	rm -f $($(PKG)_DIR)/.files-list$(3).after
+		> $($(PKG)_DIR)/.files-list$(2).txt
+	rm -f $($(PKG)_DIR)/.files-list$(2).before
+	rm -f $($(PKG)_DIR)/.files-list$(2).after
 endef
 
 define step_pkg_size
 	$(if $(filter start-install-target,$(1)-$(2)),\
-		$(call step_pkg_size_before,$(3),$(TARGET_DIR)))
+		$(call step_pkg_size_before,$(TARGET_DIR)))
 	$(if $(filter start-install-staging,$(1)-$(2)),\
-		$(call step_pkg_size_before,$(3),$(STAGING_DIR),-staging))
+		$(call step_pkg_size_before,$(STAGING_DIR),-staging))
 	$(if $(filter start-install-host,$(1)-$(2)),\
-		$(call step_pkg_size_before,$(3),$(HOST_DIR),-host))
+		$(call step_pkg_size_before,$(HOST_DIR),-host))
 
 	$(if $(filter end-install-target,$(1)-$(2)),\
-		$(call step_pkg_size_after,$(3),$(TARGET_DIR)))
+		$(call step_pkg_size_after,$(TARGET_DIR)))
 	$(if $(filter end-install-staging,$(1)-$(2)),\
-		$(call step_pkg_size_after,$(3),$(STAGING_DIR),-staging))
+		$(call step_pkg_size_after,$(STAGING_DIR),-staging))
 	$(if $(filter end-install-host,$(1)-$(2)),\
-		$(call step_pkg_size_after,$(3),$(HOST_DIR),-host))
+		$(call step_pkg_size_after,$(HOST_DIR),-host))
 endef
 GLOBAL_INSTRUMENTATION_HOOKS += step_pkg_size
 
-- 
2.25.4
