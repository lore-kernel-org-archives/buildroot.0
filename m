From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 15 Apr 2019 21:47:32 +0200
Subject: [Buildroot] [PATCH 10/12 v3] core: add per-package and
 per-filesystem show-info
In-Reply-To: <cover.1555357644.git.yann.morin.1998@free.fr>
References: <cover.1555357644.git.yann.morin.1998@free.fr>
Message-ID: <d6d7de0ae57232047dd474c8491bb4ddf9d18a43.1555357644.git.yann.morin.1998@free.fr>
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
Changes v2 -> v3:
  - add to 'make help'

Changes v1 -> v2:
  - make it based on the new show-info macro  (Arnout)
---
 Makefile               |  1 +
 fs/common.mk           | 11 ++++++++++-
 package/pkg-generic.mk |  5 +++++
 3 files changed, 16 insertions(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 0f5331ec7e..522c0b0606 100644
--- a/Makefile
+++ b/Makefile
@@ -1111,6 +1111,7 @@ help:
 	@echo '  <pkg>-depends          - Build <pkg>'\''s dependencies'
 	@echo '  <pkg>-configure        - Build <pkg> up to the configure step'
 	@echo '  <pkg>-build            - Build <pkg> up to the build step'
+	@echo '  <pkg>-show-info        - generate info about <pkg>, as a JSON blurb'
 	@echo '  <pkg>-show-depends     - List packages on which <pkg> depends'
 	@echo '  <pkg>-show-rdepends    - List packages which have <pkg> as a dependency'
 	@echo '  <pkg>-show-recursive-depends'
diff --git a/fs/common.mk b/fs/common.mk
index f7989eac57..6dd1774726 100644
--- a/fs/common.mk
+++ b/fs/common.mk
@@ -87,6 +87,11 @@ endif
 rootfs-common-show-depends:
 	@echo $(ROOTFS_COMMON_DEPENDENCIES)
 
+.PHONY: rootfs-common-show-info
+rootfs-common-show-info:
+	@:
+	$(info $(call clean-json,{ $(call json-info,ROOTFS_COMMON) }))
+
 # Since this function will be called from within an $(eval ...)
 # all variable references except the arguments must be $$-quoted.
 define inner-rootfs
@@ -184,9 +189,13 @@ endif
 rootfs-$(1)-show-depends:
 	@echo $$(ROOTFS_$(2)_DEPENDENCIES)
 
+rootfs-$(1)-show-info:
+	@:
+	$$(info $$(call clean-json,{ $$(call json-info,ROOTFS_$(2)) }))
+
 rootfs-$(1): $$(BINARIES_DIR)/$$(ROOTFS_$(2)_FINAL_IMAGE_NAME)
 
-.PHONY: rootfs-$(1) rootfs-$(1)-show-depends
+.PHONY: rootfs-$(1) rootfs-$(1)-show-depends rootfs-$(1)-show-info
 
 ifeq ($$(BR2_TARGET_ROOTFS_$(2)),y)
 TARGETS_ROOTFS += rootfs-$(1)
diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 8ff8cff12d..67782138b4 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -867,6 +867,10 @@ $(1)-show-dependency-tree: $$(patsubst %,%-show-dependency-tree,$$($(2)_FINAL_AL
 	$$(info $(1): $(4) $$(if $$($(2)_IS_VIRTUAL),virtual,$$($(2)_DL_VERSION)))
 	$$(info $(1) -> $$($(2)_FINAL_ALL_DEPENDENCIES))
 
+$(1)-show-info:
+	@:
+	$$(info $$(call clean-json,{ $$(call json-info,$(2)) }))
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
