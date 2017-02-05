From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Sun,  5 Feb 2017 14:45:06 +0100
Subject: [Buildroot] [PATCHv2 1/2] instrumentation: extract duplication to
	get list of installed files
In-Reply-To: <20170205134507.15328-1-patrickdepinguin@gmail.com>
References: <20170205134507.15328-1-patrickdepinguin@gmail.com>
Message-ID: <20170205134507.15328-2-patrickdepinguin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>

Before and after the building of each package, the instrumentation hooks are
run. One of these hooks obtains the list of files installed by a package.

The code to obtain this list is currently duplicated in the start and end
part of the hook. While the amount of duplication is currently small, a
subsequent patch will make more changes to this code, increasing the
duplication.

Therefore, split off into a helper function.

Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
---
v2: new patch

 package/pkg-generic.mk | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 3ca71b0..077b02b 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -57,13 +57,17 @@ GLOBAL_INSTRUMENTATION_HOOKS += step_time
 
 # Hooks to collect statistics about installed files
 
+define _step_pkg_size_get_file_list
+	(cd $(TARGET_DIR) ; find . -type f -print0 | xargs -0 md5sum) | sort > \
+		$1
+endef
+
 # This hook will be called before the target installation of a
 # package. We store in a file named .br_filelist_before the list of
 # files currently installed in the target. Note that the MD5 is also
 # stored, in order to identify if the files are overwritten.
 define step_pkg_size_start
-	(cd $(TARGET_DIR) ; find . -type f -print0 | xargs -0 md5sum) | sort > \
-		$($(PKG)_DIR)/.br_filelist_before
+	$(call _step_pkg_size_get_file_list,$($(PKG)_DIR)/.br_filelist_before)
 endef
 
 # This hook will be called after the target installation of a
@@ -72,8 +76,7 @@ endef
 # a diff with the .br_filelist_before to compute the list of files
 # installed by this package.
 define step_pkg_size_end
-	(cd $(TARGET_DIR); find . -type f -print0 | xargs -0 md5sum) | sort > \
-		$($(PKG)_DIR)/.br_filelist_after
+	$(call _step_pkg_size_get_file_list,$($(PKG)_DIR)/.br_filelist_after)
 	comm -13 $($(PKG)_DIR)/.br_filelist_before $($(PKG)_DIR)/.br_filelist_after | \
 		while read hash file ; do \
 			echo "$(1),$${file}" >> $(BUILD_DIR)/packages-file-list.txt ; \
-- 
2.10.2
