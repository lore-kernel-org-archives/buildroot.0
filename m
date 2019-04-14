From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 14 Apr 2019 22:17:21 +0200
Subject: [Buildroot] [PATCH 10/12 v2] core: add per-package and
 per-filesystem show-info
In-Reply-To: <cover.1555273025.git.yann.morin.1998@free.fr>
References: <cover.1555273025.git.yann.morin.1998@free.fr>
Message-ID: <abb4dc95642ba3a88b2f8235da0ba5783597a552.1555273025.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Sometimes, it is need to quickly get the metadata of a subset of
packages, without resorting to a full-blown JSON query.

Introduce a new per-package (and per-filesystem) foo-show-info rule,
that otputs a per-entity valid JSON blob.

Note that calling it for multiple packages and.or filesystems at once
will not generate a valid JSON blob, as there would be no separator
between the JSON elements:

    $ make {foo,bar}-show-info
    { "foo": { foo stuff } }
    { "bar": { bar stuff } }

However, jq is able to absorb this, with its slurping ability, which
generates an array (ellipsed and manualy reformated for readability):

    $ make {foo,bar}-show-info |jq -s . -
    [
      { "foo": { foo stuff } },
      { "bar": { bar stuff } }
    ]

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
---
 fs/common.mk           | 11 ++++++++++-
 package/pkg-generic.mk |  5 +++++
 2 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/fs/common.mk b/fs/common.mk
index f7989eac57..ce17c35c59 100644
--- a/fs/common.mk
+++ b/fs/common.mk
@@ -87,6 +87,11 @@ endif
 rootfs-common-show-depends:
 	@echo $(ROOTFS_COMMON_DEPENDENCIES)
 
+.PHONY: rootfs-common-show-info
+rootfs-common-show-info:
+	@:
+	$(info $(call clean-json,$(call show-info,ROOTFS_COMMON)))
+
 # Since this function will be called from within an $(eval ...)
 # all variable references except the arguments must be $$-quoted.
 define inner-rootfs
@@ -184,9 +189,13 @@ endif
 rootfs-$(1)-show-depends:
 	@echo $$(ROOTFS_$(2)_DEPENDENCIES)
 
+rootfs-$(1)-show-info:
+	@:
+	$$(info $$(call clean-json,$$(call show-info,ROOTFS_$(2))))
+
 rootfs-$(1): $$(BINARIES_DIR)/$$(ROOTFS_$(2)_FINAL_IMAGE_NAME)
 
-.PHONY: rootfs-$(1) rootfs-$(1)-show-depends
+.PHONY: rootfs-$(1) rootfs-$(1)-show-depends rootfs-$(1)-show-info
 
 ifeq ($$(BR2_TARGET_ROOTFS_$(2)),y)
 TARGETS_ROOTFS += rootfs-$(1)
diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index f78ff2e665..25bc2e527a 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -867,6 +867,10 @@ $(1)-show-dependency-tree: $$(patsubst %,%-show-dependency-tree,$$($(2)_FINAL_AL
 	$$(info $(1): $(4) $$(if $$($(2)_IS_VIRTUAL),virtual,$$($(2)_DL_VERSION)))
 	$$(info $(1) -> $$($(2)_FINAL_ALL_DEPENDENCIES))
 
+$(1)-show-info:
+	@:
+	$$(info $$(call clean-json,$$(call show-info,$(2))))
+
 $(1)-graph-depends: graph-depends-requirements
 	$(call pkg-graph-depends,$(1),--direct)
 
@@ -1099,6 +1103,7 @@ DL_TOOLS_DEPENDENCIES += $$(call extractor-dependency,$$($(2)_SOURCE))
 	$(1)-rsync \
 	$(1)-show-dependency-tree \
 	$(1)-show-depends \
+	$(1)-show-info \
 	$(1)-show-version \
 	$(1)-source
 
-- 
2.14.1
