From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 19 Nov 2010 14:20:56 +0100
Subject: [Buildroot] [git commit master 1/1] Makefile: handle host packages
	for make source / make external-deps
Message-ID: <20101119132731.A5BCD8D282@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=22c2c6b5410fdf2fcb617faa7ccff904328d142d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Ensure host packages (dependencies of target packages) are also handled
by make source / make external-deps.

This has to be done a explicitly, as we don't list these in Kconfig,
and hence also not in a variable like TARGETS, so instead we have to
look at the <PKG>_DEPENDENCIES variables for each enabled package and
extract the host packages from there.

Host packages can in turn also have dependencies, so we have to follow
those as well. Ideally this should be done recursively, but as that's
pretty hard to do in make, it is limited to 1 level for now.

Finally, host packages share source files with target packages, so
pipe output of make external-deps through sort -u to ensure duplicates
are removed.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 Makefile |   21 ++++++++++++++++++++-
 1 files changed, 20 insertions(+), 1 deletions(-)

diff --git a/Makefile b/Makefile
index e569a94..8669eef 100644
--- a/Makefile
+++ b/Makefile
@@ -323,6 +323,25 @@ TARGETS_CLEAN:=$(patsubst %,%-clean,$(TARGETS))
 TARGETS_SOURCE:=$(patsubst %,%-source,$(TARGETS) $(BASE_TARGETS))
 TARGETS_DIRCLEAN:=$(patsubst %,%-dirclean,$(TARGETS))
 TARGETS_ALL:=$(patsubst %,__real_tgt_%,$(TARGETS))
+
+# host-* dependencies have to be handled specially, as those aren't
+# visible in Kconfig and hence not added to a variable like TARGETS.
+# instead, find all the host-* targets listed in each <PKG>_DEPENDENCIES
+# variable for each enabled target.
+# Notice: this only works for newstyle gentargets/autotargets packages
+TARGETS_HOST_DEPS = $(sort $(filter host-%,$(foreach dep,\
+		$(addsuffix _DEPENDENCIES,$(call UPPERCASE,$(TARGETS))),\
+		$($(dep)))))
+# Host packages can in turn have their own dependencies. Likewise find
+# all the package names listed in the HOST_<PKG>_DEPENDENCIES for each
+# host package found above. Ideally this should be done recursively until
+# no more packages are found, but that's hard to do in make, so limit to
+# 1 level for now.
+HOST_DEPS = $(sort $(foreach dep,\
+		$(addsuffix _DEPENDENCIES,$(call UPPERCASE,$(TARGETS_HOST_DEPS))),\
+		$($(dep))))
+HOST_SOURCE += $(addsuffix -source,$(sort $(TARGETS_HOST_DEPS) $(HOST_DEPS)))
+
 # all targets depend on the crosscompiler and it's prerequisites
 $(TARGETS_ALL): __real_tgt_%: $(BASE_TARGETS) %
 
@@ -443,7 +462,7 @@ _source-check:
 	$(MAKE) DL_MODE=SOURCE_CHECK $(EXTRAMAKEARGS) source
 
 external-deps:
-	@$(MAKE) -Bs DL_MODE=SHOW_EXTERNAL_DEPS $(EXTRAMAKEARGS) source
+	@$(MAKE) -Bs DL_MODE=SHOW_EXTERNAL_DEPS $(EXTRAMAKEARGS) source | sort -u
 
 show-targets:
 	@echo $(TARGETS)
-- 
1.7.2.2
