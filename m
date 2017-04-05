From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed,  5 Apr 2017 23:20:59 +0200
Subject: [Buildroot] [PATCH 3/3 v2] core/pkg-generic: store file->package
	list for staging and host too
In-Reply-To: <cover.1491427248.git.yann.morin.1998@free.fr>
References: <cover.1491427248.git.yann.morin.1998@free.fr>
Message-ID: <44910f2975b83c91148d08f3df11ea048eea0609.1491427248.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently, we store the list of files installed in target/ and associate
each of them to the package that installed it.

However, we sometime may need to know what package installed which file
in staging/, for example to debug header collision, or in host/, to
debug what package installed what host tool.

Enhance the step instrumentation to also generate the list for staging/
and host/.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/pkg-generic.mk | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 166efd6..725a543 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -62,7 +62,7 @@ GLOBAL_INSTRUMENTATION_HOOKS += step_time
 # files currently installed in the target. Note that the MD5 is also
 # stored, in order to identify if the files are overwritten.
 define step_pkg_size_start
-	(cd $(TARGET_DIR) ; find . -type f -print0 | xargs -0 md5sum) | sort > \
+	(cd $(2) ; find . -type f -print0 | xargs -0 md5sum) | sort > \
 		$($(PKG)_DIR)/.br_filelist_before
 endef
 
@@ -72,19 +72,25 @@ endef
 # a diff with the .br_filelist_before to compute the list of files
 # installed by this package.
 define step_pkg_size_end
-	(cd $(TARGET_DIR); find . -type f -print0 | xargs -0 md5sum) | sort > \
+	(cd $(2); find . -type f -print0 | xargs -0 md5sum) | sort > \
 		$($(PKG)_DIR)/.br_filelist_after
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
 
-- 
2.9.3
