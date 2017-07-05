From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 5 Jul 2017 11:39:58 +0200
Subject: [Buildroot] [git commit] Move $(HOST_DIR)/usr/lib to $(HOST_DIR)/lib
Message-ID: <20170705095035.9DA797FA7A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4c790b8864364568fdf1a14c81276c51f2bffe4e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This is a step towards eliminating $(HOST_DIR)/usr. It allows us to
convert all packages installing things into $(HOST_DIR)/usr/lib without
affecting the rest.

To allow compatibility with packages that still use $(HOST_DIR)/usr as
the prefix, create a symlink from usr/lib to ../lib.

Note that the symlink creation will break when $(HOST_DIR)/usr/lib
already exists as a directory, i.e. when rebuilding in an existing
output directory. This is necessary: if we don't break it now, the
following commits (which remove the usr part from various variables)
_will_ break it.

At the same time as creating this symlink, we also have to update the
check-host-rpath script to accept both $(HOST_DIR)/usr/lib and
$(HOST_DIR)/lib, because depending on how the package derives the
path, it may be different.

Since there are some dependency chains that involve $(STAGING_DIR),
$(STAGING_DIR) may in fact be created before $(HOST_DIR). Since
$(STAGING_DIR) is a subdirectory of $(HOST_DIR), it is possible that the
newly added rule for $(HOST_DIR) never triggers. To make sure that the
rule does trigger, add an order-only dependency from $(STAGING_DIR) to
$(HOST_DIR).

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Reviewed-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Makefile                         | 10 +++++++---
 support/scripts/check-host-rpath |  8 +++++---
 2 files changed, 12 insertions(+), 6 deletions(-)

diff --git a/Makefile b/Makefile
index a0f9f62..ac349a7 100644
--- a/Makefile
+++ b/Makefile
@@ -237,7 +237,7 @@ LEGAL_REPORT = $(LEGAL_INFO_DIR)/README
 # dependencies anywhere else
 #
 ################################################################################
-$(BUILD_DIR) $(TARGET_DIR) $(HOST_DIR) $(BINARIES_DIR) $(LEGAL_INFO_DIR) $(REDIST_SOURCES_DIR_TARGET) $(REDIST_SOURCES_DIR_HOST):
+$(BUILD_DIR) $(TARGET_DIR) $(BINARIES_DIR) $(LEGAL_INFO_DIR) $(REDIST_SOURCES_DIR_TARGET) $(REDIST_SOURCES_DIR_HOST):
 	@mkdir -p $@
 
 BR2_CONFIG = $(CONFIG_DIR)/.config
@@ -552,11 +552,15 @@ prepare: $(BUILD_DIR)/buildroot-config/auto.conf
 .PHONY: world
 world: target-post-image
 
+# When creating HOST_DIR, also symlink usr/lib -> ../lib
+$(HOST_DIR):
+	@mkdir -p $@/usr $@/lib
+	@ln -snf ../lib $@/usr/lib
+
 # Populating the staging with the base directories is handled by the skeleton package
-$(STAGING_DIR):
+$(STAGING_DIR): | $(HOST_DIR)
 	@mkdir -p $(STAGING_DIR)
 	@ln -snf $(STAGING_DIR) $(BASE_DIR)/staging
-	@mkdir -p $(HOST_DIR)/usr
 	@ln -snf ../$(GNU_TARGET_NAME) $(HOST_DIR)/usr/$(GNU_TARGET_NAME)
 
 RSYNC_VCS_EXCLUSIONS = \
diff --git a/support/scripts/check-host-rpath b/support/scripts/check-host-rpath
index 020c123..adabfdf 100755
--- a/support/scripts/check-host-rpath
+++ b/support/scripts/check-host-rpath
@@ -1,7 +1,7 @@
 #!/usr/bin/env bash
 
-# This script scans $(HOST_DIR)/{bin,sbin} for all ELF files, and checks
-# they have an RPATH to $(HOST_DIR)/usr/lib if they need libraries from
+# This script scans $(HOST_DIR)/{,usr/}{bin,sbin} for all ELF files, and checks
+# they have an RPATH to $(HOST_DIR)/{,usr/}lib if they need libraries from
 # there.
 
 # Override the user's locale so we are sure we can parse the output of
@@ -40,7 +40,7 @@ elf_needs_rpath() {
     local lib
 
     while read lib; do
-        [ -e "${hostdir}/usr/lib/${lib}" ] && return 0
+        [ -e "${hostdir}/lib/${lib}" ] && return 0
     done < <( readelf -d "${file}"                                         \
               |sed -r -e '/^.* \(NEEDED\) .*Shared library: \[(.+)\]$/!d;' \
                      -e 's//\1/;'                                          \
@@ -58,6 +58,8 @@ check_elf_has_rpath() {
         for dir in ${rpath//:/ }; do
             # Remove duplicate and trailing '/' for proper match
             dir="$( sed -r -e 's:/+:/:g; s:/$::;' <<<"${dir}" )"
+            [ "${dir}" = "${hostdir}/lib" -o "${dir}" = "\$ORIGIN/../lib" ] && return 0
+            # For the time being, the rpath is allowed with both usr/lib and lib
             [ "${dir}" = "${hostdir}/usr/lib" -o "${dir}" = "\$ORIGIN/../../usr/lib" ] && return 0
         done
     done < <( readelf -d "${file}"                                              \
