From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 1 Apr 2018 22:25:57 +0200
Subject: [Buildroot] [git commit] package/pkg-generic: add
 <pkg>-show-recursive-(r)depends targets
Message-ID: <20180401202618.E1171813A9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ca9b17a2639b7727b6ed5dfc214bb8bee4d776c0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Makefile               | 4 ++++
 package/pkg-generic.mk | 8 ++++++++
 2 files changed, 12 insertions(+)

diff --git a/Makefile b/Makefile
index 71c77f474d..0724f28f45 100644
--- a/Makefile
+++ b/Makefile
@@ -1033,6 +1033,10 @@ help:
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
index 84d77822d4..25a34e6ca2 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -762,9 +762,17 @@ $(1)-show-version:
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
 
