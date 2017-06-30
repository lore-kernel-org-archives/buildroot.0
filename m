From: Wolfgang Grandegger <wg@grandegger.com>
Date: Fri, 30 Jun 2017 10:37:01 +0200
Subject: [Buildroot] [RFC PATCH v5 04/11] pkg-generic: create a list af
	installed files per step and package
In-Reply-To: <1498811828-6893-1-git-send-email-wg@grandegger.com>
References: <1498811828-6893-1-git-send-email-wg@grandegger.com>
Message-ID: <1498811828-6893-5-git-send-email-wg@grandegger.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The GLOBAL_INSTRUMENTATION_HOOKS "step_pkg_size*" are extended to create
a file with the list of all installed files per step and package. The
file name is "<package-build-dir>/.br_<host|staging|target>_filelist".
This file could be used by other hooks to scan the installed files,
e.g. to check the bin arch, the host rpath or for rpath sanitation.

For a quick hack, the "packages-file-list.txt" is created as before.

Signed-off-by: Wolfgang Grandegger <wg@grandegger.com>
---
 package/pkg-generic.mk | 46 ++++++++++++++++++++++++++++++++--------------
 1 file changed, 32 insertions(+), 14 deletions(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index f474704..825ab0c 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -57,33 +57,51 @@ GLOBAL_INSTRUMENTATION_HOOKS += step_time
 
 # Hooks to collect statistics about installed files
 
-# This hook will be called before the target installation of a
-# package. We store in a file named .br_filelist_before the list of
-# files currently installed in the target. Note that the MD5 is also
-# stored, in order to identify if the files are overwritten.
+# This hook will be called before the installation of a host,
+# staging or target package.
+# We store in a file named .br_filelist_before the list of files
+# currently installed in the root directory. Note that the MD5 is
+# also stored, in order to identify if the files are overwritten.
+# Arguments:
+# $1: path to the root directory of host, staging or target tree
 define step_pkg_size_start
-	(cd $(TARGET_DIR) ; find . -type f -print0 | xargs -0 md5sum) | sort > \
+	(cd $(1) ; find . -type f -print0 | xargs -0 md5sum) | sort > \
 		$($(PKG)_DIR)/.br_filelist_before
 endef
 
-# This hook will be called after the target installation of a
-# package. We store in a file named .br_filelist_after the list of
-# files (and their MD5) currently installed in the target. We then do
-# a diff with the .br_filelist_before to compute the list of files
-# installed by this package.
+# This hook will be called before the installation of a host,
+# staging or target package.
+# We store in a file named .br_filelist_after the list of files
+# (and their MD5) currently installed in the root directory. We
+# then do a diff with the .br_filelist_before to compute the list
+# of files installed by this package.
+# Arguments:
+# $1: path to the root directory of host, staging or target tree
+# $2: name of the installation tree ("host"|"staging"|"target")
+# $3: name of the package
 define step_pkg_size_end
-	(cd $(TARGET_DIR); find . -type f -print0 | xargs -0 md5sum) | sort > \
+	(cd $(1); find . -type f -print0 | xargs -0 md5sum) | sort > \
 		$($(PKG)_DIR)/.br_filelist_after
+	: > $($(PKG)_DIR)/.br_$(2)_filelist; \
 	comm -13 $($(PKG)_DIR)/.br_filelist_before $($(PKG)_DIR)/.br_filelist_after | \
 		while read hash file ; do \
-			echo "$(1),$${file}" >> $(BUILD_DIR)/packages-file-list.txt ; \
+			echo "$${file}" | sed -e 's/^\.\///' >> $($(PKG)_DIR)/.br_$(2)_filelist ; \
+			if [ $(2) = "target" ]; then \
+				echo "$(3),$${file}" >> $(BUILD_DIR)/packages-file-list.txt ; \
+			fi ; \
 		done
 endef
 
 define step_pkg_size
+	$(if $(filter install-host,$(2)),\
+		$(if $(filter start,$(1)),$(call step_pkg_size_start,$(HOST_DIR))) \
+		$(if $(filter end,$(1)),$(call step_pkg_size_end,$(HOST_DIR),"host",$(3))))
+	$(if $(filter install-staging,$(2)),\
+		$(if $(filter start,$(1)),$(call step_pkg_size_start,$(STAGING_DIR))) \
+		$(if $(filter end,$(1)),$(call step_pkg_size_end,$(STAGING_DIR),"staging",$(3))))
 	$(if $(filter install-target,$(2)),\
-		$(if $(filter start,$(1)),$(call step_pkg_size_start,$(3))) \
-		$(if $(filter end,$(1)),$(call step_pkg_size_end,$(3))))
+		$(if $(filter start,$(1)),$(call step_pkg_size_start,$(TARGET_DIR))) \
+		$(if $(filter end,$(1)),$(call step_pkg_size_end,$(TARGET_DIR),"target",$(3))))
 endef
 GLOBAL_INSTRUMENTATION_HOOKS += step_pkg_size
 
-- 
2.7.4
