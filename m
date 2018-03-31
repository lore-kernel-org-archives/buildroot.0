From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 31 Mar 2018 18:35:43 +0200
Subject: [Buildroot] [PATCH v2 5/5] package/pkg-generic: add
 <pkg>-show-recursive-(r)depends targets
In-Reply-To: <20180331163543.6278-1-thomas.petazzoni@bootlin.com>
References: <20180331163543.6278-1-thomas.petazzoni@bootlin.com>
Message-ID: <20180331163543.6278-6-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: George Redivo <george.redivo@datacom.ind.br>

This commit adds the support for <pkg>-show-recursive-depends and
<pkg>-show-recursive-rdepends which respectively show the list of all
dependencies or reverse dependencies for a given package. The existing
show-depends and show-rdepends only show the first-level dependencies,
while show-recursive-depends and show-recursive-rdepends show
recursively the dependencies.

It is worth mentioning that while show-recursive-depends really shows
all dependencies, show-recursive-rdepends is a bit limited because the
reverse dependencies of host packages are not properly accounted
for. But that's a limitation that already exists in show-rdepends, and
that cannot easily be solved.

Signed-off-by: George Redivo <george.redivo@datacom.ind.br>
[Thomas:
 - split from the patch that was also changing graph-depends
 - rename show-rrdepends to show-recursive-rdepends
 - add show-recursive-depends
 - don't create GRAPHS_DIR.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 Makefile               | 4 ++++
 package/pkg-generic.mk | 8 ++++++++
 2 files changed, 12 insertions(+)

diff --git a/Makefile b/Makefile
index 9e2402d7d9..60a83932c8 100644
--- a/Makefile
+++ b/Makefile
@@ -1024,6 +1024,10 @@ help:
 	@echo '  <pkg>-build            - Build <pkg> up to the build step'
 	@echo '  <pkg>-show-depends     - List packages on which <pkg> depends'
 	@echo '  <pkg>-show-rdepends    - List packages which have <pkg> as a dependency'
+	@echo '  <pkg>-show-recursive-depends'
+	@echo '                         - Recursively list packages on which <pkg> depends'
+	@echo '  <pkg>-show-recursive-rdepends'
+	@echo '                         - Recursively list packages which have <pkg> as a dependency'
 	@echo '  <pkg>-graph-depends    - Generate a graph of <pkg>'\''s dependencies'
 	@echo '  <pkg>-graph-rdepends   - Generate a graph of <pkg>'\''s reverse dependencies'
 	@echo '  <pkg>-dirclean         - Remove <pkg> build directory'
diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 6d82f7027e..24b55b9555 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -759,9 +759,17 @@ $(1)-show-version:
 $(1)-show-depends:
 			@echo $$($(2)_FINAL_ALL_DEPENDENCIES)
 
+$(1)-show-recursive-depends:
+			@cd "$$(CONFIG_DIR)" && \
+			$$(TOPDIR)/support/scripts/graph-depends -p $(1) -f -q
+
 $(1)-show-rdepends:
 			@echo $$($(2)_RDEPENDENCIES)
 
+$(1)-show-recursive-rdepends:
+			@cd "$$(CONFIG_DIR)" && \
+			$$(TOPDIR)/support/scripts/graph-depends -p $(1) --reverse -f -q
+
 $(1)-show-build-order: $$(patsubst %,%-show-build-order,$$($(2)_FINAL_ALL_DEPENDENCIES))
 	$$(info $(1))
 
-- 
2.14.3
