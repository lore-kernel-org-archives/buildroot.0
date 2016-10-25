From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 25 Oct 2016 22:51:54 +0200
Subject: [Buildroot] [git commit] pkg-infra: allow dumping reverse
	dependencies of a package
Message-ID: <20161025205352.2B02C7FB71@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=56cf5612937f14bcc7f2f339b6fb28ea3d635a67
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Finding the packages that select another one in a specific configuration
is not very trivial:

  - when optional, the dependency is not expressed in Kconfig

  - looking at the .mk files is not very nice.

Introduce a way to dump reverse dependencies of packages, i.e. the list
of packages that directly depend on that package. Like for direct
dependencies, we limit the list to the first-order reverse dependencies.

Document it in the main help; use the opportunity to also document
foo-show-depends.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Makefile               | 2 ++
 package/pkg-generic.mk | 7 +++++++
 2 files changed, 9 insertions(+)

diff --git a/Makefile b/Makefile
index 3ba1490..5c65f90 100644
--- a/Makefile
+++ b/Makefile
@@ -974,6 +974,8 @@ help:
 	@echo '  <pkg>-depends          - Build <pkg>'\''s dependencies'
 	@echo '  <pkg>-configure        - Build <pkg> up to the configure step'
 	@echo '  <pkg>-build            - Build <pkg> up to the build step'
+	@echo '  <pkg>-show-depends     - List packages on which <pkg> depends'
+	@echo '  <pkg>-show-rdepends    - List packages which have <pkg> as a dependency'
 	@echo '  <pkg>-graph-depends    - Generate a graph of <pkg>'\''s dependencies'
 	@echo '  <pkg>-dirclean         - Remove <pkg> build directory'
 	@echo '  <pkg>-reconfigure      - Restart the build from the configure step'
diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index e726ac5..81bb82c 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -698,6 +698,9 @@ $(1)-show-version:
 $(1)-show-depends:
 			@echo $$($(2)_FINAL_ALL_DEPENDENCIES)
 
+$(1)-show-rdepends:
+			@echo $$($(2)_RDEPENDENCIES)
+
 $(1)-graph-depends: graph-depends-requirements
 			@$$(INSTALL) -d $$(GRAPHS_DIR)
 			@cd "$$(CONFIG_DIR)"; \
@@ -854,6 +857,10 @@ $$(foreach pkg,$$($(2)_PROVIDES),\
 	$$(eval $$(call virt-provides-single,$$(pkg),$$(call UPPERCASE,$$(pkg)),$(1))$$(sep)))
 endif
 
+# Register package as a reverse-dependencies of all its dependencies
+$$(eval $$(foreach p,$$($(2)_FINAL_ALL_DEPENDENCIES),\
+	$$(call UPPERCASE,$$(p))_RDEPENDENCIES += $(1)$$(sep)))
+
 # Ensure unified variable name conventions between all packages Some
 # of the variables are used by more than one infrastructure; so,
 # rather than duplicating the checks in each infrastructure, we check
