From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  2 Dec 2018 10:04:42 +0100
Subject: [Buildroot] [PATCH 10/11] core: add make-based full-dependency list
In-Reply-To: <cover.1543741464.git.yann.morin.1998@free.fr>
References: <cover.1543741464.git.yann.morin.1998@free.fr>
Message-ID: <f10ee70b83598dc9736afafccad9b56bc1e9f0f7.1543741464.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently, when we need to build the full dependency graph, we call make
to show the list of packages (make show-targets), and then call it again
and again iteratively while it returns new packages.

Since calling make will parse the whole set of our Makefiles, this takes
quite a bit of time (~4s each here), and the total can get pretty long.

However, make being make, already builds the whole dependency tree
information, so we can just ask for it.

Add a new top-level rule 'show-dependency-tree' that displays the whole
set of dependencies for all packages. For each package, its name, type
and version is displayed, then all the direct, first-level dependencies
are dumped. We choose a format that is not unlike the dot-graph format,
because it is both easy to read as a human, and easy to parse as a
machine:

    foo: target 1.2.3
    foo -> bar host-meh
    bar: target virtual
    bar -> buz
    buz: target 2.3.4
    buz ->
    host-meh: host virtual
    host-meh -> host-bleark
    host-bleark: host 3.4.5
    host-bleark ->
    rootfs-meh: host
    rootfs-meh -> host-bleark

To be noted: rootfs are currently reported as if they were 'host'
packages, to stay aligned with how graph-depends currently treats them.
Ideally, graph-depends could be enhanced to recognise them separately,
but that is another story.

For just plain defconfig, which is about the smallest config we can have
with an internal toolchain, we already have a seven-fold improvement
(with the graph-depends rule modified to not run the pdf generation, to
be able to just compare the tree generation):

    $ time make graph-depends
    real    0m27.344s
    $ time make show-dependency-tree
    real    0m3.848s

From defconfig, C++, wchar, locales, ssp, and allyespackageconfig,
tweaked for even more packages (qt5 not qt4, luajit to avoid multi
providers, etc...), the timings are (graph-depends still modified to
not generate the pdf):

    $ time make graph-depends
    real    1m56.459s
    $ time make show-dependency-tree
    real    0m5.748s

There. I don't think those numbers need any explanation whatsoever;
they do speak on their own. OK, for maths sake, the ratio is about
twenty-fold. So, "yeah", I guess... ;-)

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
---
 Makefile               | 4 ++++
 fs/common.mk           | 8 ++++++++
 package/pkg-generic.mk | 4 ++++
 3 files changed, 16 insertions(+)

diff --git a/Makefile b/Makefile
index 37df98520e..7a50c19de9 100644
--- a/Makefile
+++ b/Makefile
@@ -846,6 +846,10 @@ graph-depends-requirements:
 	@dot -? >/dev/null 2>&1 || \
 		{ echo "ERROR: The 'dot' program from Graphviz is needed for graph-depends" >&2; exit 1; }
 
+.PHONY: show-dependency-tree
+show-dependency-tree: $(patsubst %,%-show-dependency-tree,$(PACKAGES) $(TARGETS_ROOTFS))
+	@:
+
 .PHONY: graph-depends
 graph-depends: graph-depends-requirements
 	@$(INSTALL) -d $(GRAPHS_DIR)
diff --git a/fs/common.mk b/fs/common.mk
index 1625b65d0e..ba651fd4b7 100644
--- a/fs/common.mk
+++ b/fs/common.mk
@@ -45,6 +45,10 @@ ROOTFS_COMMON_DEPENDENCIES = \
 	$(BR2_TAR_HOST_DEPENDENCY) \
 	$(if $(PACKAGES_USERS)$(ROOTFS_USERS_TABLES),host-mkpasswd)
 
+rootfs-common-show-dependency-tree: $(patsubst %,%-show-dependency-tree,$(ROOTFS_COMMON_DEPENDENCIES))
+	$(info rootfs-common: host)
+	$(info rootfs-common -> $(foreach d,$(ROOTFS_COMMON_DEPENDENCIES),$(d)))
+
 .PHONY: rootfs-common
 rootfs-common: $(ROOTFS_COMMON_DEPENDENCIES) target-finalize
 	@$(call MESSAGE,"Generating root filesystems common tables")
@@ -77,6 +81,10 @@ ROOTFS_$(2)_TARGET_DIR = $$(ROOTFS_$(2)_DIR)/target
 
 ROOTFS_$(2)_DEPENDENCIES += rootfs-common
 
+rootfs-$(1)-show-dependency-tree: $$(patsubst %,%-show-dependency-tree,$$(ROOTFS_$(2)_DEPENDENCIES))
+	$$(info rootfs-$(1): host)
+	$$(info rootfs-$(1) -> $$(foreach d,$$(ROOTFS_$(2)_DEPENDENCIES),$$(d)))
+
 ifeq ($$(BR2_TARGET_ROOTFS_$(2)_GZIP),y)
 ROOTFS_$(2)_COMPRESS_EXT = .gz
 ROOTFS_$(2)_COMPRESS_CMD = gzip -9 -c
diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index ae4bac509f..4b3100115d 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -827,6 +827,10 @@ $(1)-show-build-order: $$(patsubst %,%-show-build-order,$$($(2)_FINAL_ALL_DEPEND
 	@:
 	$$(info $(1))
 
+$(1)-show-dependency-tree: $$(patsubst %,%-show-dependency-tree,$$($(2)_FINAL_ALL_DEPENDENCIES))
+	$$(info $(1): $(4) $$(if $$($(2)_IS_VIRTUAL),virtual,$$($(2)_DL_VERSION)))
+	$$(info $(1) -> $$(foreach d,$$($(2)_FINAL_ALL_DEPENDENCIES),$$(d)))
+
 $(1)-graph-depends: graph-depends-requirements
 	$(call pkg-graph-depends,$(1),--direct)
 
-- 
2.14.1
