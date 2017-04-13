From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 13 Apr 2017 23:09:08 +0200
Subject: [Buildroot] [git commit] core: add rule to dump packages' build
	order
Message-ID: <20170413210933.BC74B826ED@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=75fcebb7a300a4973592c7870f6f85fb8623335f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When debugging hidden dependencies, the build order is very important.
Most notably, it is interesting to identify potential culprits.

Add a new top-level rule, show-biuld-order, that dumps all the packages
in the order they would get built.

Note that there are a few differences with show-targets:

  - more packages are reported, becasue show-targets does not report
    host packages that have no prompt;

  - the output is line-based, because we're using $(info $(1)); getting
    a single output line like show-targets would require we use an
    actual command, like printf '%s ' $(1); but that takes a lot of
    time, while $(info $(1)) is almost instantaneous (the time to parse
    the Makefiles);

  - rootfs targets are not reported.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Peter Korsgaard <peter@korsgaard.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Makefile               | 2 ++
 package/pkg-generic.mk | 3 +++
 2 files changed, 5 insertions(+)

diff --git a/Makefile b/Makefile
index 941bf78..919d589 100644
--- a/Makefile
+++ b/Makefile
@@ -757,6 +757,8 @@ legal-info: dirs legal-info-clean legal-info-prepare $(foreach p,$(PACKAGES),$(p
 show-targets:
 	@echo $(PACKAGES) $(TARGETS_ROOTFS)
 
+show-build-order: $(patsubst %,%-show-build-order,$(PACKAGES))
+
 graph-build: $(O)/build/build-time.log
 	@install -d $(GRAPHS_DIR)
 	$(foreach o,name build duration,./support/scripts/graph-build-time \
diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 31dbc54..3b26e6b 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -737,6 +737,9 @@ $(1)-show-depends:
 $(1)-show-rdepends:
 			@echo $$($(2)_RDEPENDENCIES)
 
+$(1)-show-build-order: $$(patsubst %,%-show-build-order,$$($(2)_FINAL_ALL_DEPENDENCIES))
+	$$(info $(1))
+
 $(1)-graph-depends: graph-depends-requirements
 	$(call pkg-graph-depends,$(1),--direct)
 
