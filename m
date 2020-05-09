From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 9 May 2020 22:41:44 +0200
Subject: [Buildroot] [git commit] package/exfatprogs: fix compile failure
 node may be used uninitialized
Message-ID: <20200509202604.AD8ED9122F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b6ff166254b8dd51d020b224a51cc95f851293d7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:

  - http://autobuild.buildroot.net/results/5c5/5c5d71fde80a4f2f027085bdb0fae9fb76ab9d32

  fsck.c:1062:18: error: 'node' may be used uninitialized in this function [-Werror=maybe-uninitialized]
       node->parent = dir;
                    ^
  fsck.c:870:22: note: 'node' was declared here
    struct exfat_inode *node;
                        ^

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...3-fsck-fix-node-may-be-used-uninitialized.patch | 63 ++++++++++++++++++++++
 1 file changed, 63 insertions(+)

diff --git a/package/exfatprogs/0003-fsck-fix-node-may-be-used-uninitialized.patch b/package/exfatprogs/0003-fsck-fix-node-may-be-used-uninitialized.patch
new file mode 100644
index 0000000000..b62aaf3d1c
--- /dev/null
+++ b/package/exfatprogs/0003-fsck-fix-node-may-be-used-uninitialized.patch
@@ -0,0 +1,63 @@
+From 1b0a48ef0aa33a4f5b9c8d23d9f647482d0f28dd Mon Sep 17 00:00:00 2001
+From: Peter Seiderer <ps.report@gmx.net>
+Date: Sat, 9 May 2020 15:05:46 +0200
+Subject: [PATCH] fsck: fix node may be used uninitialized
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+The complicated way of gcc to tell not all failure pathes
+set a return value != 0 in the calls before.
+
+Fixes:
+
+  fsck.c:1063:18: error: ???node??? may be used uninitialized in this function [-Werror=maybe-uninitialized]
+       node->parent = dir;
+                    ^
+  fsck.c:871:22: note: ???node??? was declared here
+    struct exfat_inode *node;
+                        ^
+[Upstream: https://github.com/exfatprogs/exfatprogs/pull/92]
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+---
+ fsck/fsck.c | 6 ++++--
+ 1 file changed, 4 insertions(+), 2 deletions(-)
+
+diff --git a/fsck/fsck.c b/fsck/fsck.c
+index 67d7946..f0daa1d 100644
+--- a/fsck/fsck.c
++++ b/fsck/fsck.c
+@@ -801,12 +801,12 @@ static int read_file_dentries(struct exfat_de_iter *iter,
+ 	ret = exfat_de_iter_get(iter, 0, &file_de);
+ 	if (ret || file_de->type != EXFAT_FILE) {
+ 		exfat_err("failed to get file dentry. %d\n", ret);
+-		return ret;
++		return -EINVAL;
+ 	}
+ 	ret = exfat_de_iter_get(iter, 1, &stream_de);
+ 	if (ret || stream_de->type != EXFAT_STREAM) {
+ 		exfat_err("failed to get stream dentry. %d\n", ret);
+-		return ret;
++		return -EINVAL;
+ 	}
+ 
+ 	*new_node = NULL;
+@@ -825,6 +825,7 @@ static int read_file_dentries(struct exfat_de_iter *iter,
+ 		ret = exfat_de_iter_get(iter, i, &name_de);
+ 		if (ret || name_de->type != EXFAT_NAME) {
+ 			exfat_err("failed to get name dentry. %d\n", ret);
++			ret = -EINVAL;
+ 			goto err;
+ 		}
+ 
+@@ -852,6 +853,7 @@ static int read_file_dentries(struct exfat_de_iter *iter,
+ 		exfat_err("valid size %" PRIu64 " greater than size %llu: %s\n",
+ 			le64_to_cpu(stream_de->stream_valid_size), node->size,
+ 			path_resolve_ctx.local_path);
++		ret = -EINVAL;
+ 		goto err;
+ 	}
+ 
+-- 
+2.26.2
+
