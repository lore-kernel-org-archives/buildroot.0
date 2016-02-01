From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 1 Feb 2016 14:23:57 +0100
Subject: [Buildroot] [git commit] package/squashfs: fix musl build
Message-ID: <20160201224708.A8B3C7F8C2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=12a7788820072990c30e94ec4a35746e7b69a953
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The build errors were not yet found by the autobuilders:

action.c: In function ???name_fn???:
action.c:1911:29: error: ???FNM_EXTMATCH??? undeclared (first use in this function)
     FNM_PATHNAME|FNM_PERIOD|FNM_EXTMATCH) == 0;)
                             ^
pseudo.c: In function ???read_pseudo_def???:
pseudo.c:435:11: error: ???S_IFBLK??? undeclared (first use in this function)
   mode |= S_IFBLK;
           ^

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/squashfs/0001-musl.patch | 71 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 71 insertions(+)

diff --git a/package/squashfs/0001-musl.patch b/package/squashfs/0001-musl.patch
new file mode 100644
index 0000000..891b171
--- /dev/null
+++ b/package/squashfs/0001-musl.patch
@@ -0,0 +1,71 @@
+Fix musl build
+
+Downloaded from
+http://cgit.openembedded.org/openembedded-core/tree/meta/recipes-devtools/squashfs-tools/squashfs-tools/fix-compat.patch
+and adjusted paths.
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+
+Define FNM_EXTMATCH if not defined its glibc specific define
+include missing sys/stat.h for stat* function declarations
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Index: squashfs-tools/action.c
+===================================================================
+--- a/squashfs-tools.orig/action.c
++++ b/squashfs-tools/action.c
+@@ -44,6 +44,10 @@
+ #include "action.h"
+ #include "error.h"
+ 
++#if !defined(FNM_EXTMATCH)
++#define FNM_EXTMATCH 0
++#endif
++
+ /*
+  * code to parse actions
+  */
+Index: squashfs-tools/mksquashfs.c
+===================================================================
+--- a/squashfs-tools.orig/mksquashfs.c
++++ b/squashfs-tools/mksquashfs.c
+@@ -1286,6 +1286,10 @@ void write_dir(squashfs_inode *inode, st
+ 		dir_size + 3, directory_block, directory_offset, NULL, NULL,
+ 		dir, 0);
+ 
++#if !defined(FNM_EXTMATCH)
++#define FNM_EXTMATCH 0
++#endif
++
+ #ifdef SQUASHFS_TRACE
+ 	{
+ 		unsigned char *dirp;
+Index: squashfs-tools/pseudo.c
+===================================================================
+--- a/squashfs-tools.orig/pseudo.c
++++ b/squashfs-tools/pseudo.c
+@@ -32,6 +32,7 @@
+ #include <stdlib.h>
+ #include <sys/types.h>
+ #include <sys/wait.h>
++#include <sys/stat.h>
+ #include <ctype.h>
+ 
+ #include "pseudo.h"
+Index: squashfs-tools/unsquashfs.c
+===================================================================
+--- a/squashfs-tools.orig/unsquashfs.c
++++ b/squashfs-tools/unsquashfs.c
+@@ -38,6 +38,10 @@
+ #include <limits.h>
+ #include <ctype.h>
+ 
++#ifndef FNM_EXTMATCH
++#define FNM_EXTMATCH 0
++#endif
++
+ struct cache *fragment_cache, *data_cache;
+ struct queue *to_reader, *to_inflate, *to_writer, *from_writer;
+ pthread_t *thread, *inflator_thread;
