From: Angelo Compagnucci <angelo@amarulasolutions.com>
Date: Tue,  6 Mar 2018 09:48:04 +0100
Subject: [Buildroot] [PATCH 1/2] Makefile: add tainting support
In-Reply-To: <1520326085-18337-1-git-send-email-angelo@amarulasolutions.com>
References: <1520326085-18337-1-git-send-email-angelo@amarulasolutions.com>
Message-ID: <1520326085-18337-2-git-send-email-angelo@amarulasolutions.com>
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
The build ends with an error when the BR2_REPRODUCIBLE
is enabled and the tainting packages list is not empty.
Moreover, legal info will show a warning in presence
of a tainting package.

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
---
 Makefile               | 14 +++++++++++++-
 package/pkg-generic.mk |  9 +++++++++
 2 files changed, 22 insertions(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 1b34818..afa5f29 100644
--- a/Makefile
+++ b/Makefile
@@ -761,8 +761,19 @@ endif
 		$(call MESSAGE,"Executing post-build script $(s)"); \
 		$(EXTRA_ENV) $(s) $(TARGET_DIR) $(call qstrip,$(BR2_ROOTFS_POST_SCRIPT_ARGS))$(sep))
 
+# Check here if there are packages declaring they harm
+# the reproducibility of the build
+.PHONY: check-tainted
+check-tainted:
+ifneq ($(BR2_REPRODUCIBLE),)
+ifneq ($(BR2_TAINTED_BY),)
+	$(error Buildroot is tainted (by: $(BR2_TAINTED_BY)). Cannot do a reproducible build.)
+	@exit 1
+endif
+endif
+
 .PHONY: target-post-image
-target-post-image: $(TARGETS_ROOTFS) target-finalize
+target-post-image: check-tainted $(TARGETS_ROOTFS) target-finalize
 	@$(foreach s, $(call qstrip,$(BR2_ROOTFS_POST_IMAGE_SCRIPT)), \
 		$(call MESSAGE,"Executing post-image script $(s)"); \
 		$(EXTRA_ENV) $(s) $(BINARIES_DIR) $(call qstrip,$(BR2_ROOTFS_POST_SCRIPT_ARGS))$(sep))
@@ -1063,6 +1074,7 @@ help:
 	@echo '  source                 - download all sources needed for offline-build'
 	@echo '  external-deps          - list external packages used'
 	@echo '  legal-info             - generate info about license compliance'
+	@echo '  check-tainted          - check if any selected package harms build reproducibility'
 	@echo '  printvars              - dump all the internal variables'
 	@echo
 	@echo '  make V=0|1             - 0 => quiet build (default), 1 => verbose build'
diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index a2a12e7..e643ecf 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -556,6 +556,10 @@ ifndef $(2)_REDISTRIBUTE
  endif
 endif
 
+ifdef $(2)_TAINTS
+ BR2_TAINTED_BY+=$$($(2)_RAWNAME)
+endif
+
 $(2)_REDISTRIBUTE		?= YES
 
 $(2)_REDIST_SOURCES_DIR = $$(REDIST_SOURCES_DIR_$$(call UPPERCASE,$(4)))/$$($(2)_RAW_BASE_NAME)
@@ -869,6 +873,11 @@ else
 	$(Q)$$(foreach F,$$($(2)_LICENSE_FILES),$$(call legal-license-file,$$($(2)_RAWNAME),$$($(2)_RAW_BASE_NAME),$$($(2)_PKGDIR),$$(F),$$($(2)_DIR)/$$(F),$$(call UPPERCASE,$(4)))$$(sep))
 endif # license files
 
+# Save a legal warning if tainted
+ifneq ($$(call qstrip,$$($(2)_TAINTS)),)
+	$(Q)$$(call legal-warning-pkg,$$($(2)_RAWNAME),unknown license for additional modules or dependencies)
+endif
+
 ifeq ($$($(2)_SITE_METHOD),local)
 # Packages without a tarball: don't save and warn
 	@$$(call legal-warning-nosource,$$($(2)_RAWNAME),local)
-- 
2.7.4
