From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 23 Jul 2020 22:33:15 +0200
Subject: [Buildroot] [git commit] package/pkg-generic.mk: rework pkg_size
 logic with the "installed" step
Message-ID: <20200723203145.ACFD387E9A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fee7e61665bb7b76d286a996f1128c743335ae27
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commits reworks the pkg_size logic to no longer use the
GLOBAL_INSTRUMENTATION_HOOKS mechanism, but instead be directly
implemented within the configure step and install step.

The problem with the current implementation in the
GLOBAL_INSTRUMENTATION_HOOKS is that we only capture what is installed
in $(HOST_DIR) during the "host installation step", what is installed
in $(TARGET_DIR) during the "target installation step" and what is
installed in "$(STAGING_DIR)" during the staging installation step.

While this seems reasonable in principle, it is in fact not completely
true. For example, "toolchain", which is a target package, installs
tons of files in $(HOST_DIR). "qt5base", which is also a target
package, also installs things in $(HOST_DIR). Same with the "syslinux"
package.

The idea behind this patch is pretty simple:

 - At the beginning of the configure step, right after the per-package
   directories have been populated (if BR2_PER_PACKAGE_DIRECTORIES=y),
   we capture the state of the HOST_DIR, TARGET_DIR and STAGING_DIR.

 - At the end of all install steps (which is possible thanks to the
   newly introduced "install" step), we capture again the state of
   HOST_DIR, TARGET_DIR and STAGING_DIR, and compare it to what we
   have saved at the configure step.

So regardless of whether a file has been installed in $(HOST_DIR)
during the target or staging installation steps of a target package,
or if a host package has installed a file in $(TARGET_DIR), we will
detect it.

The pkg_size_before and pkg_size_after macros are intentionally left
where they are (even if they now fall in the middle of the
GLOBAL_INSTRUMENTATION_HOOKS implementations) to minimize the diffstat
and facilitate review.

Note that we also have to change check_bin_arch to be explicitly
called from the install step rather than through a
GLOBAL_INSTRUMENTATION_HOOKS as it depends on the .files-list.txt file
produced by the pkg_size_after function.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/pkg-generic.mk | 42 ++++++++++++++----------------------------
 1 file changed, 14 insertions(+), 28 deletions(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 6b3a3f73d9..22e7e1b04f 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -59,7 +59,7 @@ GLOBAL_INSTRUMENTATION_HOOKS += step_time
 
 # $(1): base directory to search in
 # $(2): suffix of file (optional)
-define step_pkg_size_before
+define pkg_size_before
 	cd $(1); \
 	LC_ALL=C find . \( -type f -o -type l \) -printf '%T@:%i:%#m:%y:%s,%p\n' \
 		| LC_ALL=C sort > $($(PKG)_DIR)/.files-list$(2).before
@@ -67,7 +67,7 @@ endef
 
 # $(1): base directory to search in
 # $(2): suffix of file (optional)
-define step_pkg_size_after
+define pkg_size_after
 	cd $(1); \
 	LC_ALL=C find . \( -type f -o -type l \) -printf '%T@:%i:%#m:%y:%s,%p\n' \
 		| LC_ALL=C sort > $($(PKG)_DIR)/.files-list$(2).after
@@ -80,35 +80,14 @@ define step_pkg_size_after
 	rm -f $($(PKG)_DIR)/.files-list$(2).after
 endef
 
-define step_pkg_size
-	$(if $(filter start-install-target,$(1)-$(2)),\
-		$(call step_pkg_size_before,$(TARGET_DIR)))
-	$(if $(filter start-install-staging,$(1)-$(2)),\
-		$(call step_pkg_size_before,$(STAGING_DIR),-staging))
-	$(if $(filter start-install-host,$(1)-$(2)),\
-		$(call step_pkg_size_before,$(HOST_DIR),-host))
-
-	$(if $(filter end-install-target,$(1)-$(2)),\
-		$(call step_pkg_size_after,$(TARGET_DIR)))
-	$(if $(filter end-install-staging,$(1)-$(2)),\
-		$(call step_pkg_size_after,$(STAGING_DIR),-staging))
-	$(if $(filter end-install-host,$(1)-$(2)),\
-		$(call step_pkg_size_after,$(HOST_DIR),-host))
-endef
-GLOBAL_INSTRUMENTATION_HOOKS += step_pkg_size
-
-# Relies on step_pkg_size, so must be after
 define check_bin_arch
-	$(if $(filter end-install-target,$(1)-$(2)),\
-		support/scripts/check-bin-arch -p $(3) \
-			-l $($(PKG)_DIR)/.files-list.txt \
-			$(foreach i,$($(PKG)_BIN_ARCH_EXCLUDE),-i "$(i)") \
-			-r $(TARGET_READELF) \
-			-a $(BR2_READELF_ARCH_NAME))
+	support/scripts/check-bin-arch -p $($(PKG)_NAME) \
+		-l $($(PKG)_DIR)/.files-list.txt \
+		$(foreach i,$($(PKG)_BIN_ARCH_EXCLUDE),-i "$(i)") \
+		-r $(TARGET_READELF) \
+		-a $(BR2_READELF_ARCH_NAME)
 endef
 
-GLOBAL_INSTRUMENTATION_HOOKS += check_bin_arch
-
 # This hook checks that host packages that need libraries that we build
 # have a proper DT_RPATH or DT_RUNPATH tag
 define check_host_rpath
@@ -253,6 +232,9 @@ $(BUILD_DIR)/%/.stamp_configured:
 	@$(call MESSAGE,"Configuring")
 	$(Q)mkdir -p $(HOST_DIR) $(TARGET_DIR) $(STAGING_DIR) $(BINARIES_DIR)
 	$(call prepare-per-package-directory,$($(PKG)_FINAL_DEPENDENCIES))
+	@$(call pkg_size_before,$(TARGET_DIR))
+	@$(call pkg_size_before,$(STAGING_DIR),-staging)
+	@$(call pkg_size_before,$(HOST_DIR),-host)
 	$(call fixup-libtool-files,$(NAME),$(STAGING_DIR))
 	$(foreach hook,$($(PKG)_PRE_CONFIGURE_HOOKS),$(call $(hook))$(sep))
 	$($(PKG)_CONFIGURE_CMDS)
@@ -374,6 +356,10 @@ $(BUILD_DIR)/%/.stamp_target_installed:
 # Final installation step, completed when all installation steps
 # (host, images, staging, target) have completed
 $(BUILD_DIR)/%/.stamp_installed:
+	@$(call pkg_size_after,$(TARGET_DIR))
+	@$(call pkg_size_after,$(STAGING_DIR),-staging)
+	@$(call pkg_size_after,$(HOST_DIR),-host)
+	@$(call check_bin_arch)
 	$(Q)touch $@
 
 # Remove package sources
