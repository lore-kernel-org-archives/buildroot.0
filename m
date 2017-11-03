From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri,  3 Nov 2017 17:06:25 +0100
Subject: [Buildroot] [RFCv1 2/4] core: change host RPATH handling
In-Reply-To: <20171103160627.6468-1-thomas.petazzoni@free-electrons.com>
References: <20171103160627.6468-1-thomas.petazzoni@free-electrons.com>
Message-ID: <20171103160627.6468-3-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently, our strategy for the RPATH of host binaries is as follows:

 - During the build, we force an absolute RPATH to be encoded into
   binaries, by passing -Wl,-rpath,$(HOST_DIR)/lib. This ensures that
   host binaries will find their libraries.

 - In the "make sdk" target, when preparing the SDK to be relocatable,
   we use patchelf to replace those absolute RPATHs by relative RPATHs
   that use $ORIGIN.

Unfortunately, the use of absolute RPATH during the build is not
compatible with the move to per-package SDK, where a different host
directory is used for the build of each package. Therefore, we need to
move to a different strategy for RPATH handling.

The new strategy is as follows:

 - During the build, we do not encode any RPATH into the host
   binaries. Instead, we specify LD_LIBRARY_PATH environment to point
   to the current HOST_DIR/lib directory (for the package being
   currently built).

 - At the end of the build, in order to make sure that binaries are
   usable without LD_LIBRARY_PATH, we fixup the host binaries to use
   $ORIGIN/../lib. This is more-or-less what was done previously in
   the "make sdk" target, except that instead of turning absolute
   paths into relative paths in the RPATH, we are simply setting the
   RPATH to $ORIGIN/../lib.

   In order to implement this, the fix-rpath script logic is adjusted
   for the "host" case.

An alternative strategy would have been to keep the
-Wl,-rpath,$(HOST_DIR) flag, and therefore the absolute RPATH in the
host binaries, and fix such RPATH at the end of the build of every
package. However, that would require calling fix-rpath after the
installation of every package, which is a bit expensive.

This change is independent from the per-package SDK functionality, and
could be applied separately.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Makefile                  |  4 +++-
 package/Makefile.in       |  2 +-
 package/pkg-generic.mk    |  8 --------
 support/scripts/fix-rpath | 15 ++++++++++-----
 4 files changed, 14 insertions(+), 15 deletions(-)

diff --git a/Makefile b/Makefile
index 79db7fe48a..5496273329 100644
--- a/Makefile
+++ b/Makefile
@@ -231,6 +231,8 @@ LEGAL_MANIFEST_CSV_HOST = $(LEGAL_INFO_DIR)/host-manifest.csv
 LEGAL_WARNINGS = $(LEGAL_INFO_DIR)/.warnings
 LEGAL_REPORT = $(LEGAL_INFO_DIR)/README
 
+export LD_LIBRARY_PATH = $(if $(PKG),$(HOST_DIR)/lib)
+
 ################################################################################
 #
 # staging and target directories do NOT list these as
@@ -558,7 +560,6 @@ world: target-post-image
 .PHONY: sdk
 sdk: world
 	@$(call MESSAGE,"Rendering the SDK relocatable")
-	$(TOPDIR)/support/scripts/fix-rpath host
 	$(TOPDIR)/support/scripts/fix-rpath staging
 	$(INSTALL) -m 755 $(TOPDIR)/support/misc/relocate-sdk.sh $(HOST_DIR)/relocate-sdk.sh
 	echo $(HOST_DIR) > $(HOST_DIR)/share/buildroot/sdk-location
@@ -679,6 +680,7 @@ $(TARGETS_ROOTFS): target-finalize
 .PHONY: target-finalize
 target-finalize: $(PACKAGES)
 	@$(call MESSAGE,"Finalizing target directory")
+	$(TOPDIR)/support/scripts/fix-rpath host
 	$(foreach hook,$(TARGET_FINALIZE_HOOKS),$($(hook))$(sep))
 	rm -rf $(TARGET_DIR)/usr/include $(TARGET_DIR)/usr/share/aclocal \
 		$(TARGET_DIR)/usr/lib/pkgconfig $(TARGET_DIR)/usr/share/pkgconfig \
diff --git a/package/Makefile.in b/package/Makefile.in
index a1a5316051..e94a75c230 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -220,7 +220,7 @@ HOST_CPPFLAGS  = -I$(HOST_DIR)/include
 HOST_CFLAGS   ?= -O2
 HOST_CFLAGS   += $(HOST_CPPFLAGS)
 HOST_CXXFLAGS += $(HOST_CFLAGS)
-HOST_LDFLAGS  += -L$(HOST_DIR)/lib -Wl,-rpath,$(HOST_DIR)/lib
+HOST_LDFLAGS  += -L$(HOST_DIR)/lib
 
 # The macros below are taken from linux 4.11 and adapted slightly.
 # Copy more when needed.
diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index cca94ba338..82f8c06821 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -105,14 +105,6 @@ endef
 
 GLOBAL_INSTRUMENTATION_HOOKS += check_bin_arch
 
-# This hook checks that host packages that need libraries that we build
-# have a proper DT_RPATH or DT_RUNPATH tag
-define check_host_rpath
-	$(if $(filter install-host,$(2)),\
-		$(if $(filter end,$(1)),support/scripts/check-host-rpath $(3) $(HOST_DIR)))
-endef
-GLOBAL_INSTRUMENTATION_HOOKS += check_host_rpath
-
 define step_check_build_dir_one
 	if [ -d $(2) ]; then \
 		printf "%s: installs files in %s\n" $(1) $(2) >&2; \
diff --git a/support/scripts/fix-rpath b/support/scripts/fix-rpath
index 15705a3b0d..eed751f5da 100755
--- a/support/scripts/fix-rpath
+++ b/support/scripts/fix-rpath
@@ -61,7 +61,7 @@ main() {
     local rootdir
     local tree="${1}"
     local find_args=( )
-    local sanitize_extra_args=( )
+    local sanitize_args=( )
 
     if ! "${PATCHELF}" --version > /dev/null 2>&1; then
 	echo "Error: can't execute patchelf utility '${PATCHELF}'"
@@ -89,7 +89,8 @@ main() {
             cp "${PATCHELF}" "${PATCHELF}.__to_be_patched"
 
             # we always want $ORIGIN-based rpaths to make it relocatable.
-            sanitize_extra_args+=( "--relative-to-file" )
+            sanitize_args+=( "--set-rpath" )
+            sanitize_args+=( "\$ORIGIN/../lib" )
             ;;
 
         staging)
@@ -101,14 +102,18 @@ main() {
             done
 
             # should be like for the target tree below
-            sanitize_extra_args+=( "--no-standard-lib-dirs" )
+            sanitize_args+=( "--no-standard-lib-dirs" )
+            sanitize_args+=( "--make-rpath-relative" )
+            sanitize_args+=( "${rootdir}" )
             ;;
 
         target)
             rootdir="${TARGET_DIR}"
             # we don't want $ORIGIN-based rpaths but absolute paths without rootdir.
             # we also want to remove rpaths pointing to /lib or /usr/lib.
-            sanitize_extra_args+=( "--no-standard-lib-dirs" )
+            sanitize_args+=( "--no-standard-lib-dirs" )
+            sanitize_args+=( "--make-rpath-relative" )
+            sanitize_args+=( "${rootdir}" )
             ;;
 
         *)
@@ -125,7 +130,7 @@ main() {
             # make files writable if necessary
             changed=$(chmod -c u+w "${file}")
             # call patchelf to sanitize the rpath
-            ${PATCHELF} --make-rpath-relative "${rootdir}" ${sanitize_extra_args[@]} "${file}"
+            ${PATCHELF} ${sanitize_args[@]} "${file}"
             # restore the original permission
             test "${changed}" != "" && chmod u-w "${file}"
         fi
-- 
2.13.6
