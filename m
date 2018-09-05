From: Angelo Compagnucci <angelo@amarulasolutions.com>
Date: Wed,  5 Sep 2018 18:06:34 +0200
Subject: [Buildroot] [PATCH v3 1/3] Makefile: add tainting support
In-Reply-To: <1536163596-5310-1-git-send-email-angelo@amarulasolutions.com>
References: <1536163596-5310-1-git-send-email-angelo@amarulasolutions.com>
Message-ID: <1536163596-5310-2-git-send-email-angelo@amarulasolutions.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Angelo Compagnucci <angelo.compagnucci@gmail.com>

Packages who harms the build reproducibility or licensing can declare
FOO_TAINTS variable. If a package taints the build it will be added
to a list of tainting packages. The build ends with a warning if the
tainting packages list is not empty. Moreover, legal info will show
a warning in presence of a tainting package.

Angelo Compagnucci <angelo@amarulasolutions.com>

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
---
 Makefile               | 10 ++++++++++
 package/pkg-generic.mk |  8 ++++++++
 2 files changed, 18 insertions(+)

diff --git a/Makefile b/Makefile
index 9d66bba..ad61130 100644
--- a/Makefile
+++ b/Makefile
@@ -758,12 +758,21 @@ endif
 
 	touch $(TARGET_DIR)/usr
 
+.PHONY: check-tainted
+check-tainted:
+ifneq ($(BR2_TAINTED_BY),)
+	$(error Your buildroot configuration is tainted by: $(BR2_TAINTED_BY))
+else
+	@echo "Your buildroot configuration is not tainted"
+endif
+
 .PHONY: target-post-image
 target-post-image: $(TARGETS_ROOTFS) target-finalize
 	@rm -f $(ROOTFS_COMMON_TAR)
 	@$(foreach s, $(call qstrip,$(BR2_ROOTFS_POST_IMAGE_SCRIPT)), \
 		$(call MESSAGE,"Executing post-image script $(s)"); \
 		$(EXTRA_ENV) $(s) $(BINARIES_DIR) $(call qstrip,$(BR2_ROOTFS_POST_SCRIPT_ARGS))$(sep))
+	$(if $(BR2_TAINTED_BY), at echo "WARNING: Your buildroot configuration is tainted by: $(BR2_TAINTED_BY).")
 
 .PHONY: source
 source: $(foreach p,$(PACKAGES),$(p)-all-source)
@@ -1070,6 +1079,7 @@ help:
 	@echo '  source                 - download all sources needed for offline-build'
 	@echo '  external-deps          - list external packages used'
 	@echo '  legal-info             - generate info about license compliance'
+	@echo '  check-tainted          - check if any selected package harms build reproducibility or licensing'
 	@echo '  printvars              - dump all the internal variables'
 	@echo
 	@echo '  make V=0|1             - 0 => quiet build (default), 1 => verbose build'
diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 91b61c6..bcb4acd 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -551,6 +551,10 @@ ifndef $(2)_REDISTRIBUTE
  endif
 endif
 
+ifdef $(2)_TAINTS
+BR2_TAINTED_BY+=$$($(2)_RAWNAME)
+endif
+
 $(2)_REDISTRIBUTE		?= YES
 
 $(2)_REDIST_SOURCES_DIR = $$(REDIST_SOURCES_DIR_$$(call UPPERCASE,$(4)))/$$($(2)_BASENAME_RAW)
@@ -909,6 +913,10 @@ else
 	$(Q)$$(foreach F,$$($(2)_LICENSE_FILES),$$(call legal-license-file,$$($(2)_RAWNAME),$$($(2)_BASENAME_RAW),$$($(2)_PKGDIR),$$(F),$$($(2)_DIR)/$$(F),$$(call UPPERCASE,$(4)))$$(sep))
 endif # license files
 
+ifeq ($$(call qstrip,$$($(2)_TAINTS)),YES)
+	$(Q)$$(call legal-warning-pkg,$$($(2)_RAWNAME),unknown license for additional modules or dependencies)
+endif
+
 ifeq ($$($(2)_SITE_METHOD),local)
 # Packages without a tarball: don't save and warn
 	@$$(call legal-warning-nosource,$$($(2)_RAWNAME),local)
-- 
2.7.4
