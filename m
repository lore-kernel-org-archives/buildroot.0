From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 23 Jul 2020 22:31:21 +0200
Subject: [Buildroot] [git commit] package/pkg-generic.mk: drop useless $(1)
 argument in step_pkg_size_{before, after}
Message-ID: <20200723202658.4FDE3814D1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fe89623353827b15a826c2b716ac43ccbba079ae
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The $(1) argument passed to step_pkg_size_{before,after}, which
contains the package name, is no longer used. We simply use $(PKG) to
get the upper-case version of the package name.

So, let's drop this first argument that isn't needed.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/pkg-generic.mk | 40 +++++++++++++++++++---------------------
 1 file changed, 19 insertions(+), 21 deletions(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 4ea1084f91..bcf5d9815c 100644
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
 
