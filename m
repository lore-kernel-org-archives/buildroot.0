From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sat, 02 Sep 2017 13:13:42 -0000
Subject: [Buildroot] [git commit] instrumentation: extend
	packages-file-list.txt with symlinks and directories
Message-ID: <20170902130615.566CC80285@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=da32b49f0091ee9dfb613e0f00973bf6893bfa84
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Using the package instrumentation hooks, a file packages-file-list.txt is
created containing the list of files installed by a package with their size.

Due to the use of 'find -type f', symbolic links to files are not included
in this file list. Since the original purpose of this file was to calculate
the total size of a package and symbolic links have file size 0, this was
not a problem.

However, if packages-file-list.txt is reused for other purposes, for example
to get a complete list of files installed by a package regardless of size,
symbolic links to files are important too.

Likewise, to get a complete view of what a package installs, directories
should be included too.

Update the instrumentation hook accordingly.
Although for files an md5sum is taken, we cannot do this for directories.
Instead, mimic the output of md5sum with a fake hash string.

Note: for directories that are used by several packages, e.g. /etc/init.d/,
the package that created the directory will be treated as the 'owner' of
that directory.  This gives a somewhat distorted view of ownership.
Similarly, the package size reported by 'make graph-size' (based on
packages-file-list.txt) will include the 'size' of a directory for that
owner, which is reported as e.g. 4096 bytes.

Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/pkg-generic.mk | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index f8117db..cca94ba 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -58,8 +58,12 @@ GLOBAL_INSTRUMENTATION_HOOKS += step_time
 # Hooks to collect statistics about installed files
 
 define _step_pkg_size_get_file_list
-	(cd $(TARGET_DIR) ; find . -type f -print0 | xargs -0 md5sum) | sort > \
-		$1
+	(cd $(TARGET_DIR) ; \
+		( \
+			find . -xtype f -print0 | xargs -0 md5sum ; \
+			find . -xtype d -print0 | xargs -0 -I{} printf 'directory  {}\n'; \
+		) \
+	) | sort > $1
 endef
 
 # This hook will be called before the target installation of a
