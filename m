From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Fri,  3 Feb 2017 22:27:52 +0100
Subject: [Buildroot] [PATCH 1/1] pkg-generic: include symbolic links to
	files in packages-file-list.txt
Message-ID: <20170203212752.4016-1-patrickdepinguin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>

Using the package instrumentation hooks, a file packages-file-list.txt is
created containing the list of files installed by a package with their size.

Due to the use of 'find -type f', symbolic links to files are not included
in this file list. Since the original purpose of this file was to calculate
the total size of a package and symbolic links have file size 0, this was
not a problem.

However, if packages-file-list.txt is reused for other purposes, for example
to get a complete list of files installed by a package regardless of size,
symbolic links are important.
Using 'find -xtype f' instead solves the problem.

Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
---
 package/pkg-generic.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 3ca71b0..511e5c1 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -62,7 +62,7 @@ GLOBAL_INSTRUMENTATION_HOOKS += step_time
 # files currently installed in the target. Note that the MD5 is also
 # stored, in order to identify if the files are overwritten.
 define step_pkg_size_start
-	(cd $(TARGET_DIR) ; find . -type f -print0 | xargs -0 md5sum) | sort > \
+	(cd $(TARGET_DIR) ; find . -xtype f -print0 | xargs -0 md5sum) | sort > \
 		$($(PKG)_DIR)/.br_filelist_before
 endef
 
@@ -72,7 +72,7 @@ endef
 # a diff with the .br_filelist_before to compute the list of files
 # installed by this package.
 define step_pkg_size_end
-	(cd $(TARGET_DIR); find . -type f -print0 | xargs -0 md5sum) | sort > \
+	(cd $(TARGET_DIR); find . -xtype f -print0 | xargs -0 md5sum) | sort > \
 		$($(PKG)_DIR)/.br_filelist_after
 	comm -13 $($(PKG)_DIR)/.br_filelist_before $($(PKG)_DIR)/.br_filelist_after | \
 		while read hash file ; do \
-- 
2.10.2
