From: Angelo Compagnucci <angelo@amarulasolutions.com>
Date: Thu,  3 May 2018 23:34:11 +0200
Subject: [Buildroot] [PATCH 1/2] Makefile: add tainting support
Message-ID: <1525383252-4837-1-git-send-email-angelo@amarulasolutions.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Angelo Compagnucci <angelo.compagnucci@gmail.com>

Packages who harms the build reproducibility can declare
FOO_TAINTS variable.
If a package taints the build it will be added to a list
of tainting packages.
The build ends with a warning if the tainting packages
list is not empty.
Moreover, legal info will show a warning in presence
of a tainting package.

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
---
 Makefile               | 11 +++++++++++
 package/pkg-generic.mk |  9 +++++++++
 2 files changed, 20 insertions(+)

diff --git a/Makefile b/Makefile
index c024c65..1b3d987 100644
--- a/Makefile
+++ b/Makefile
@@ -758,12 +758,22 @@ endif
 
 	touch $(TARGET_DIR)/usr
 
+# Check here if there are packages declaring they harm
+# the reproducibility of the build
+.PHONY: check-tainted
+check-tainted:
+ifneq ($(BR2_TAINTED_BY),)
+	$(error Buildroot is tainted (by: $(BR2_TAINTED_BY)).)
+endif
+
 .PHONY: target-post-image
 target-post-image: $(TARGETS_ROOTFS) target-finalize
 	@rm -f $(ROOTFS_COMMON_TAR)
 	@$(foreach s, $(call qstrip,$(BR2_ROOTFS_POST_IMAGE_SCRIPT)), \
 		$(call MESSAGE,"Executing post-image script $(s)"); \
 		$(EXTRA_ENV) $(s) $(BINARIES_DIR) $(call qstrip,$(BR2_ROOTFS_POST_SCRIPT_ARGS))$(sep))
+	@if [ ! -z "$(BR2_TAINTED_BY)" ]; then \
+		echo "WARNING: Buildroot is tainted (by: $(BR2_TAINTED_BY))"; fi
 
 .PHONY: source
 source: $(foreach p,$(PACKAGES),$(p)-all-source)
@@ -1070,6 +1080,7 @@ help:
 	@echo '  source                 - download all sources needed for offline-build'
 	@echo '  external-deps          - list external packages used'
 	@echo '  legal-info             - generate info about license compliance'
+	@echo '  check-tainted          - check if any selected package harms build reproducibility'
 	@echo '  printvars              - dump all the internal variables'
 	@echo
 	@echo '  make V=0|1             - 0 => quiet build (default), 1 => verbose build'
diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index a303dc2..a71ed6a 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -542,6 +542,10 @@ ifndef $(2)_REDISTRIBUTE
  endif
 endif
 
+ifdef $(2)_TAINTS
+ BR2_TAINTED_BY+=$$($(2)_RAWNAME)
+endif
+
 $(2)_REDISTRIBUTE		?= YES
 
 $(2)_REDIST_SOURCES_DIR = $$(REDIST_SOURCES_DIR_$$(call UPPERCASE,$(4)))/$$($(2)_BASENAME_RAW)
@@ -900,6 +904,11 @@ else
 	$(Q)$$(foreach F,$$($(2)_LICENSE_FILES),$$(call legal-license-file,$$($(2)_RAWNAME),$$($(2)_BASENAME_RAW),$$($(2)_PKGDIR),$$(F),$$($(2)_DIR)/$$(F),$$(call UPPERCASE,$(4)))$$(sep))
 endif # license files
 
+# Save a legal warning if tainted
+ifeq ($$(call qstrip,$$($(2)_TAINTS)),YES)
+	$(Q)$$(call legal-warning-pkg,$$($(2)_RAWNAME),unknown license for additional modules or dependencies)
+endif
+
 ifeq ($$($(2)_SITE_METHOD),local)
 # Packages without a tarball: don't save and warn
 	@$$(call legal-warning-nosource,$$($(2)_RAWNAME),local)
-- 
2.7.4
