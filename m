From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 14 Apr 2019 22:17:23 +0200
Subject: [Buildroot] [PATCH 12/12 v2] core: remove show-depednency-tree
In-Reply-To: <cover.1555273025.git.yann.morin.1998@free.fr>
References: <cover.1555273025.git.yann.morin.1998@free.fr>
Message-ID: <3f4a75c33a5f817dcd7a3576086ffca4c18e522b.1555273025.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

show-depednency-tree was introduced in this release cycle, as a way to
quickly and easily provide the dependency tree to geaph-depends.

show-dependency-tree is no longer used, no that graph-depends has been
switched over to using the more versatile show-info.

Beside, show-dependency-tree has never been part of a release.

Drop it.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
---
 Makefile               | 4 ----
 fs/common.mk           | 8 --------
 package/pkg-generic.mk | 6 ------
 3 files changed, 18 deletions(-)

diff --git a/Makefile b/Makefile
index 33215f91e5..d9f2f6e645 100644
--- a/Makefile
+++ b/Makefile
@@ -876,10 +876,6 @@ graph-depends-requirements:
 	@dot -? >/dev/null 2>&1 || \
 		{ echo "ERROR: The 'dot' program from Graphviz is needed for graph-depends" >&2; exit 1; }
 
-.PHONY: show-dependency-tree
-show-dependency-tree: $(patsubst %,%-show-dependency-tree,$(PACKAGES) $(TARGETS_ROOTFS))
-	@:
-
 .PHONY: graph-depends
 graph-depends: graph-depends-requirements
 	@$(INSTALL) -d $(GRAPHS_DIR)
diff --git a/fs/common.mk b/fs/common.mk
index ce17c35c59..0fcd1cdbdc 100644
--- a/fs/common.mk
+++ b/fs/common.mk
@@ -61,10 +61,6 @@ ROOTFS_COMMON_FINAL_RECURSIVE_DEPENDENCIES = $(sort \
 	) \
 	$(ROOTFS_COMMON_FINAL_RECURSIVE_DEPENDENCIES__X))
 
-rootfs-common-show-dependency-tree: $(patsubst %,%-show-dependency-tree,$(ROOTFS_COMMON_DEPENDENCIES))
-	$(info rootfs-common: host)
-	$(info rootfs-common -> $(foreach d,$(ROOTFS_COMMON_DEPENDENCIES),$(d)))
-
 .PHONY: rootfs-common
 rootfs-common: $(ROOTFS_COMMON_DEPENDENCIES) target-finalize
 	@$(call MESSAGE,"Generating root filesystems common tables")
@@ -117,10 +113,6 @@ ROOTFS_$(2)_FINAL_RECURSIVE_DEPENDENCIES = $$(sort \
 	) \
 	$$(ROOTFS_$(2)_FINAL_RECURSIVE_DEPENDENCIES__X))
 
-rootfs-$(1)-show-dependency-tree: $$(patsubst %,%-show-dependency-tree,$$(ROOTFS_$(2)_DEPENDENCIES))
-	$$(info rootfs-$(1): host)
-	$$(info rootfs-$(1) -> $$(foreach d,$$(ROOTFS_$(2)_DEPENDENCIES),$$(d)))
-
 ifeq ($$(BR2_TARGET_ROOTFS_$(2)_GZIP),y)
 ROOTFS_$(2)_COMPRESS_EXT = .gz
 ROOTFS_$(2)_COMPRESS_CMD = gzip -9 -c
diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 25bc2e527a..e5b75bc7b6 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -862,11 +862,6 @@ $(1)-show-build-order: $$(patsubst %,%-show-build-order,$$($(2)_FINAL_ALL_DEPEND
 	@:
 	$$(info $(1))
 
-$(1)-show-dependency-tree: $$(patsubst %,%-show-dependency-tree,$$($(2)_FINAL_ALL_DEPENDENCIES))
-	@:
-	$$(info $(1): $(4) $$(if $$($(2)_IS_VIRTUAL),virtual,$$($(2)_DL_VERSION)))
-	$$(info $(1) -> $$($(2)_FINAL_ALL_DEPENDENCIES))
-
 $(1)-show-info:
 	@:
 	$$(info $$(call clean-json,$$(call show-info,$(2))))
@@ -1101,7 +1096,6 @@ DL_TOOLS_DEPENDENCIES += $$(call extractor-dependency,$$($(2)_SOURCE))
 	$(1)-reconfigure \
 	$(1)-reinstall \
 	$(1)-rsync \
-	$(1)-show-dependency-tree \
 	$(1)-show-depends \
 	$(1)-show-info \
 	$(1)-show-version \
-- 
2.14.1
