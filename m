From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Wed, 12 Apr 2017 11:38:38 +0200
Subject: [Buildroot] [PATCH 04/53] Move $(HOST_DIR)/usr/lib to
	$(HOST_DIR)/lib
In-Reply-To: <20170412093928.1006-1-arnout@mind.be>
References: <20170412093928.1006-1-arnout@mind.be>
Message-ID: <20170412093928.1006-5-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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
check-host-rpath to accept both $(HOST_DIR)/usr/lib and $(HOST_DIR)/lib,
because depending on how the package derives the path, it may be
different.

Since there are some dependency chains that involve $(STAGING_DIR),
$(STAGING_DIR) may in fact be created before $(HOST_DIR). Since
$(STAGING_DIR) is a subdirectory of $(HOST_DIR), it is possible that the
newly added rule for $(HOST_DIR) never triggers. To make sure that the
rule does trigger, add an order-only dependency from $(STAGING_DIR) to
$(HOST_DIR).

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 Makefile                         | 10 +++++++---
 support/scripts/check-host-rpath |  7 ++++---
 2 files changed, 11 insertions(+), 6 deletions(-)

diff --git a/Makefile b/Makefile
index f19e81f5c6..1cfc5695e3 100644
--- a/Makefile
+++ b/Makefile
@@ -236,7 +236,7 @@ LEGAL_REPORT = $(LEGAL_INFO_DIR)/README
 # dependencies anywhere else
 #
 ################################################################################
-$(BUILD_DIR) $(TARGET_DIR) $(HOST_DIR) $(BINARIES_DIR) $(LEGAL_INFO_DIR) $(REDIST_SOURCES_DIR_TARGET) $(REDIST_SOURCES_DIR_HOST):
+$(BUILD_DIR) $(TARGET_DIR) $(BINARIES_DIR) $(LEGAL_INFO_DIR) $(REDIST_SOURCES_DIR_TARGET) $(REDIST_SOURCES_DIR_HOST):
 	@mkdir -p $@
 
 BR2_CONFIG = $(CONFIG_DIR)/.config
@@ -552,11 +552,15 @@ world: target-post-image
 	legal-info legal-info-prepare legal-info-clean printvars help \
 	list-defconfigs target-finalize target-post-image source-check
 
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
index 6ce547cb04..29bec012fc 100755
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
@@ -58,6 +58,7 @@ check_elf_has_rpath() {
         for dir in ${rpath//:/ }; do
             # Remove duplicate and trailing '/' for proper match
             dir="$( sed -r -e 's:/+:/:g; s:/$::;' <<<"${dir}" )"
+            [ "${dir}" = "${hostdir}/lib" ] && return 0
             [ "${dir}" = "${hostdir}/usr/lib" ] && return 0
         done
     done < <( readelf -d "${file}"                                              \
-- 
2.11.0
