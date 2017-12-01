From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri,  1 Dec 2017 21:53:50 +0100
Subject: [Buildroot] [RFCv3 13/15] core: change host RPATH handling
In-Reply-To: <20171201205352.24287-1-thomas.petazzoni@free-electrons.com>
References: <20171201205352.24287-1-thomas.petazzoni@free-electrons.com>
Message-ID: <20171201205352.24287-14-thomas.petazzoni@free-electrons.com>
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

 - We no longer pass -Wl,-rpath,$(HOST_DIR)/lib when building
   packages, so the host binaries no longer have any rpath encoded.

 - At the end of the installation of every package, we just the
   fix-rpath logic on the host binaries, so that all host binaries
   that don't already have $ORIGIN/../lib as their RPATH are updated
   to have such a RPATH.

In order to achieve this, the following changes are made:

 - HOST_LDFLAGS no longer contains -Wl,-rpath,$(HOST_DIR)

 - The hook that ran at the end of every package installation
   (check_host_rpath) to verify that our hardcoded RPATH is indeed
   present in all binaries is removed, as it is no longer needed: we
   will force $ORIGIN/../LIB as an RPATH in all binaries.

 - host-patchelf is added as a dependency of all packages, except
   itself. This is necessary as all packages now need to run patchelf
   at the end of their installation process.

   TODO: things like host-tar, host-lzip and host-ccache will have to
   be handled properly.

 - "fix-rpath host" is called at the end of the package installation,
   in the recently introduced .stamp_installed, which guarantees to be
   executed after all of target, staging, images and host
   installations have completed. Indeed, while in theory only host
   packages install files into $(HOST_DIR), in practice a number of
   target packages also install host binaries. So to be reliable, we
   do the "fix-rpath host" logic at the end of the installation of
   every package.

 - The fix-rpath script is modified:

   * The "host" target now simply hardcodes setting $ORIGIN/../lib as
     an RPATH, instead of using --relative-to-file

   * We simply exclude the patchelf program instead of making a copy
     of it: since patchelf depends only on the C/C++ libraries, it
     doesn't need to have a RPATH set to $ORIGIN/../lib

   * Also, in order to avoid re-writing host binaries over and over
     again, we only set the RPATH if it is not already set.

This change is independent from the per-package SDK functionality, and
could be applied separately.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
NOTE: an alternative to running "fix-rpath host" at the end of every
package installation would be to run it only for host packages
(unconditionally) and have a special flag that target packages can use
to indicate that they have installed things to $(HOST_DIR). Not sure
if this is worth the complexity, though.

NOTE2: is it OK to force $ORIGIN/../lib as the RPATH of all host
binaries? This is OK for binaries in host/{bin,sbin} of course, but do
we have host binaries in other places, for which this $ORIGIN/../lib
RPATH wouldn't be appropriate?

Changes since v2:
 - No changes

Changes since v1:
 - Following the feedback from Yann and Arnout, the approach in v2 was
   completely changed: instead of using LD_LIBRARY_PATH, we now run
   patchelf at the end of each package installation to fix the RPATH.
---
 Makefile                  |  1 -
 package/Makefile.in       |  2 +-
 package/pkg-generic.mk    | 14 ++++++--------
 support/scripts/fix-rpath | 31 +++++++++++++++++++------------
 4 files changed, 26 insertions(+), 22 deletions(-)

diff --git a/Makefile b/Makefile
index 090b3ba191..d8fa91120b 100644
--- a/Makefile
+++ b/Makefile
@@ -555,7 +555,6 @@ world: target-post-image
 .PHONY: sdk
 sdk: world
 	@$(call MESSAGE,"Rendering the SDK relocatable")
-	$(TOPDIR)/support/scripts/fix-rpath host
 	$(TOPDIR)/support/scripts/fix-rpath staging
 	$(INSTALL) -m 755 $(TOPDIR)/support/misc/relocate-sdk.sh $(HOST_DIR)/relocate-sdk.sh
 	echo $(HOST_DIR) > $(HOST_DIR)/share/buildroot/sdk-location
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
index 8c6e34cc9f..f4a943e3ce 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -118,14 +118,6 @@ endef
 
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
@@ -343,6 +335,8 @@ $(BUILD_DIR)/%/.stamp_target_installed:
 # Finalize installation
 $(BUILD_DIR)/%/.stamp_installed:
 	@$(call step_start,install)
+	$(if $(filter host-patchelf,$($(PKG)_FINAL_DEPENDENCIES)), \
+		$(TOPDIR)/support/scripts/fix-rpath host)
 	@$(call step_end,install)
 	$(Q)touch $@
 
@@ -587,6 +581,10 @@ ifneq ($(1),host-skeleton)
 $(2)_DEPENDENCIES += host-skeleton
 endif
 
+ifeq ($(filter host-patchelf host-skeleton host-tar host-xz host-lzip host-ccache host-fakedate,$(1)),)
+$(2)_DEPENDENCIES += host-patchelf
+endif
+
 ifeq ($(filter host-tar host-skeleton host-fakedate,$(1)),)
 $(2)_EXTRACT_DEPENDENCIES += $(BR2_TAR_HOST_DEPENDENCY)
 endif
diff --git a/support/scripts/fix-rpath b/support/scripts/fix-rpath
index 15705a3b0d..5b2f24ed32 100755
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
@@ -84,12 +84,14 @@ main() {
                 find_args+=( "-path" "${HOST_DIR}""${excludepath}" "-prune" "-o" )
             done
 
-            # do not process the patchelf binary but a copy to work-around "file in use"
+            # do not process the patchelf binary, as it is ourselves
+            # (and it doesn't need a rpath as it doesn't use libraries
+            # from HOST_DIR)
             find_args+=( "-path" "${PATCHELF}" "-prune" "-o" )
-            cp "${PATCHELF}" "${PATCHELF}.__to_be_patched"
 
             # we always want $ORIGIN-based rpaths to make it relocatable.
-            sanitize_extra_args+=( "--relative-to-file" )
+            sanitize_args+=( "--set-rpath" )
+            sanitize_args+=( "\$ORIGIN/../lib" )
             ;;
 
         staging)
@@ -101,14 +103,18 @@ main() {
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
@@ -120,20 +126,21 @@ main() {
     find_args+=( "-type" "f" "-print" )
 
     while read file ; do
-        # check if it's an ELF file
-        if ${PATCHELF} --print-rpath "${file}" > /dev/null 2>&1; then
+        rpath=$(${PATCHELF} --print-rpath "${file}" 2>/dev/null)
+        if test $? -eq 0; then
+            # For host binaries, if the rpath is already correct, skip
+            if test "${tree}" = "host" -a "${rpath}" = "\$ORIGIN/../lib" ; then
+                continue
+            fi
             # make files writable if necessary
             changed=$(chmod -c u+w "${file}")
             # call patchelf to sanitize the rpath
-            ${PATCHELF} --make-rpath-relative "${rootdir}" ${sanitize_extra_args[@]} "${file}"
+            ${PATCHELF} ${sanitize_args[@]} "${file}"
             # restore the original permission
             test "${changed}" != "" && chmod u-w "${file}"
         fi
     done < <(find "${rootdir}" ${find_args[@]})
 
-    # Restore patched patchelf utility
-    test "${tree}" = "host" && mv "${PATCHELF}.__to_be_patched" "${PATCHELF}"
-
     # ignore errors
     return 0
 }
-- 
2.13.6
