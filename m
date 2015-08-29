From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 29 Aug 2015 11:11:43 +0200
Subject: [Buildroot] [git commit] curlftpfs: fix musl build
Message-ID: <20150829091231.EA6C2817E5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=07b6e95edf4c0f82975a5ff85f018a1499c0892f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add a patch to use off_t instead of __off_t.

Fixes:

  http://autobuild.buildroot.net/results/ed5/ed5b1a49304f115d793da332de6eef8cdaffbc8f/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/curlftpfs/0004-fix-musl-build-off-t.patch |   39 +++++++++++++++++++++
 1 files changed, 39 insertions(+), 0 deletions(-)

diff --git a/package/curlftpfs/0004-fix-musl-build-off-t.patch b/package/curlftpfs/0004-fix-musl-build-off-t.patch
new file mode 100644
index 0000000..9335230
--- /dev/null
+++ b/package/curlftpfs/0004-fix-musl-build-off-t.patch
@@ -0,0 +1,39 @@
+Use off_t instead of __off_t
+
+__off_t is an internal C library type, which shouldn't be used by
+applications. It is not defined by the musl C library, so use the
+public off_t type instead.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+
+Index: b/ftpfs.c
+===================================================================
+--- a/ftpfs.c
++++ b/ftpfs.c
+@@ -687,7 +687,7 @@
+ 	return ftpfs_getattr(path, &sbuf);
+ }
+ 
+-static __off_t test_size(const char* path)
++static off_t test_size(const char* path)
+ {
+ 	struct stat sbuf;
+ 	int err = ftpfs_getattr(path, &sbuf);
+@@ -950,7 +950,7 @@
+ 
+   /* fix openoffice problem, truncating exactly to file length */
+   
+-  __off_t size = (long long int)test_size(path); 
++  off_t size = (long long int)test_size(path); 
+   DEBUG(1, "ftpfs_truncate: %s check filesize=%lld\n", path, (long long int)size);
+   
+   if (offset == size)  
+@@ -978,7 +978,7 @@
+   }
+   /* fix openoffice problem, truncating exactly to file length */
+   
+-  __off_t size = test_size(path); 
++  off_t size = test_size(path); 
+   DEBUG(1, "ftpfs_ftruncate: %s check filesize=%lld\n", path, (long long int)size);
+   
+   if (offset == size)  
