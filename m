From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu,  5 Sep 2013 23:27:46 +0200
Subject: [Buildroot] [RFCv1 08/11] package: package-based implementation of
	source, external-deps and legal-info
In-Reply-To: <1378416469-17708-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1378416469-17708-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1378416469-17708-9-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Until now, the make source, make external-deps and make legal-info
where relying on enumerating the packages by looking at $(TARGETS)
which contains only the target packages and not the host
packages. Thanks to the TARGET_HOST_DEPS and HOST_DEPS variables, it
was doing a two-level resolution of host package dependencies, but it
was not entirely correct since the dependency chain might be deeper
than that: some packages could be missed.

From an idea of Arnout, this patch introduces in each package
additional targets <pkg>-all-source and <pkg>-all-legal-info that
executes the 'source' and 'legal-info' targets for this package and
all its dependencies, be they target or host dependencies.

This provides a much cleaner implementation of this mechanism, which
is also more robust.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Makefile               | 26 +++-----------------------
 package/pkg-generic.mk |  4 ++++
 2 files changed, 7 insertions(+), 23 deletions(-)

diff --git a/Makefile b/Makefile
index f2430eb..8fe0209 100644
--- a/Makefile
+++ b/Makefile
@@ -348,30 +348,10 @@ include fs/common.mk
 TARGETS+=target-post-image
 
 TARGETS_CLEAN:=$(patsubst %,%-clean,$(TARGETS))
-TARGETS_SOURCE:=$(patsubst %,%-source,$(TARGETS) $(BASE_TARGETS))
+TARGETS_SOURCE:=$(patsubst %,%-all-source,$(TARGETS) $(BASE_TARGETS))
 TARGETS_DIRCLEAN:=$(patsubst %,%-dirclean,$(TARGETS))
 TARGETS_ALL:=$(patsubst %,__real_tgt_%,$(TARGETS))
-
-# host-* dependencies have to be handled specially, as those aren't
-# visible in Kconfig and hence not added to a variable like TARGETS.
-# instead, find all the host-* targets listed in each <PKG>_DEPENDENCIES
-# variable for each enabled target.
-# Notice: this only works for newstyle gentargets/autotargets packages
-TARGETS_HOST_DEPS = $(sort $(filter host-%,$(foreach dep,\
-		$(addsuffix _DEPENDENCIES,$(call UPPERCASE,$(TARGETS))),\
-		$($(dep)))))
-# Host packages can in turn have their own dependencies. Likewise find
-# all the package names listed in the HOST_<PKG>_DEPENDENCIES for each
-# host package found above. Ideally this should be done recursively until
-# no more packages are found, but that's hard to do in make, so limit to
-# 1 level for now.
-HOST_DEPS = $(sort $(foreach dep,\
-		$(addsuffix _DEPENDENCIES,$(call UPPERCASE,$(TARGETS_HOST_DEPS))),\
-		$($(dep))))
-HOST_SOURCE += $(addsuffix -source,$(sort $(TARGETS_HOST_DEPS) $(HOST_DEPS)))
-
-TARGETS_LEGAL_INFO:=$(patsubst %,%-legal-info,\
-		$(TARGETS) $(BASE_TARGETS) $(TARGETS_HOST_DEPS) $(HOST_DEPS))))
+TARGETS_LEGAL_INFO:=$(patsubst %,%-all-legal-info,$(TARGETS) $(BASE_TARGETS))
 
 # all targets depend on the crosscompiler and it's prerequisites
 $(TARGETS_ALL): __real_tgt_%: $(BASE_TARGETS) %
@@ -564,7 +544,7 @@ target-post-image:
 toolchain-eclipse-register:
 	./support/scripts/eclipse-register-toolchain `readlink -f $(O)` $(notdir $(TARGET_CROSS)) $(BR2_ARCH)
 
-source: dirs $(TARGETS_SOURCE) $(HOST_SOURCE)
+source: dirs $(TARGETS_SOURCE)
 
 external-deps:
 	@$(MAKE) -Bs DL_MODE=SHOW_EXTERNAL_DEPS $(EXTRAMAKEARGS) source | sort -u
diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 2e2e66f..b6f0bdd 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -418,6 +418,10 @@ endif
 $(1)-show-depends:
 			@echo $$($(2)_DEPENDENCIES)
 
+$(1)-all-source: 	$(foreach p,$($(2)_DEPENDENCIES),$(p)-all-source) $(1)-source
+
+$(1)-all-legal-info:	$(foreach p,$($(2)_DEPENDENCIES),$(p)-all-legal-info) $(1)-legal-info
+
 $(1)-uninstall:		$(1)-configure $$($(2)_TARGET_UNINSTALL)
 
 $(1)-clean:		$(1)-uninstall \
-- 
1.8.1.2
