From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 27 Nov 2017 22:57:26 +0100
Subject: [Buildroot] [git commit branch/next] core/pkg-generic: store
 file->package list for staging and host too
Message-ID: <20171127220553.70E9F7FD58@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0c02bf829b363a49a648517be4a48ad91050d789
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Currently, we store the list of files installed in target/ and associate
each of them to the package that installed it.

However, we sometimes may need to know what package installed which file
in staging/, for example to debug header collision, or in host/, to
debug what package installed what host tool.

Enhance the step instrumentation to also generate the list for staging/
and host/.

We maintain backward compatibility, for external scripts that wanted to
parse the previously existing list, by not renaming the target-related
package list. Only the staging- and host-related lists are named after
staging and host.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
[Thomas: fix missing word in .mk comment.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/pkg-generic.mk | 42 +++++++++++++++++++++++++++---------------
 1 file changed, 27 insertions(+), 15 deletions(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index ad10a8c..fb5a1ca 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -58,7 +58,7 @@ GLOBAL_INSTRUMENTATION_HOOKS += step_time
 # Hooks to collect statistics about installed files
 
 define _step_pkg_size_get_file_list
-	(cd $(TARGET_DIR) ; \
+	(cd $(2) ; \
 		( \
 			find . -xtype f -print0 | xargs -0 md5sum ; \
 			find . -xtype d -print0 | xargs -0 -I{} printf 'directory  {}\n'; \
@@ -66,32 +66,44 @@ define _step_pkg_size_get_file_list
 	) | sort > $1
 endef
 
-# This hook will be called before the target installation of a
-# package. We store in a file named .br_filelist_before the list of
-# files currently installed in the target. Note that the MD5 is also
-# stored, in order to identify if the files are overwritten.
+# This hook will be called before the installation of a package. We store in
+# a file named .br_filelist_before the list of files currently installed.
+# Note that the MD5 is also stored, in order to identify if the files are
+# overwritten.
+# $(1): package name (ignored)
+# $(2): base directory to search in
 define step_pkg_size_start
-	$(call _step_pkg_size_get_file_list,$($(PKG)_DIR)/.br_filelist_before)
+	$(call _step_pkg_size_get_file_list,$($(PKG)_DIR)/.br_filelist_before,$(2))
 endef
 
-# This hook will be called after the target installation of a
-# package. We store in a file named .br_filelist_after the list of
-# files (and their MD5) currently installed in the target. We then do
-# a diff with the .br_filelist_before to compute the list of files
-# installed by this package.
+# This hook will be called after the installation of a package. We store in
+# a file named .br_filelist_after the list of files (and their MD5) currently
+# installed. We then do a diff with the .br_filelist_before to compute the
+# list of files installed by this package.
+# The suffix is typically empty for the target variant, for legacy backward
+# compatibility.
+# $(1): package name (ignored)
+# $(2): base directory to search in
+# $(3): suffix of file  (optional)
 define step_pkg_size_end
-	$(call _step_pkg_size_get_file_list,$($(PKG)_DIR)/.br_filelist_after)
+	$(call _step_pkg_size_get_file_list,$($(PKG)_DIR)/.br_filelist_after,$(2))
 	comm -13 $($(PKG)_DIR)/.br_filelist_before $($(PKG)_DIR)/.br_filelist_after | \
 		while read hash file ; do \
 			echo "$(1),$${file}" ; \
-		done >> $(BUILD_DIR)/packages-file-list.txt
+		done >> $(BUILD_DIR)/packages-file-list$(3).txt
 	rm -f $($(PKG)_DIR)/.br_filelist_before $($(PKG)_DIR)/.br_filelist_after
 endef
 
 define step_pkg_size
 	$(if $(filter install-target,$(2)),\
-		$(if $(filter start,$(1)),$(call step_pkg_size_start,$(3))) \
-		$(if $(filter end,$(1)),$(call step_pkg_size_end,$(3))))
+		$(if $(filter start,$(1)),$(call step_pkg_size_start,$(3),$(TARGET_DIR))) \
+		$(if $(filter end,$(1)),$(call step_pkg_size_end,$(3),$(TARGET_DIR))))
+	$(if $(filter install-staging,$(2)),\
+		$(if $(filter start,$(1)),$(call step_pkg_size_start,$(3),$(STAGING_DIR),-staging)) \
+		$(if $(filter end,$(1)),$(call step_pkg_size_end,$(3),$(STAGING_DIR),-staging)))
+	$(if $(filter install-host,$(2)),\
+		$(if $(filter start,$(1)),$(call step_pkg_size_start,$(3),$(HOST_DIR),-host)) \
+		$(if $(filter end,$(1)),$(call step_pkg_size_end,$(3),$(HOST_DIR),-host)))
 endef
 GLOBAL_INSTRUMENTATION_HOOKS += step_pkg_size
 
