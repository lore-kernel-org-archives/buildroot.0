From: Peter Seiderer <ps.report@gmx.net>
Date: Sat,  9 May 2020 23:33:19 +0200
Subject: [Buildroot] [PATCH v2] exfatprogs: fix more 64-bit types printf
 compile failure
Message-ID: <20200509213319.21792-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes test-pkg detected compile failures for the following toolchains:

  - br-mips64-n64-full
  - br-mips64r6-el-hf-glibc
  - br-powerpc64le-power8-glibc
  - br-powerpc64-power7-glibc
  - sourcery-mips64

Used test config:

  BR2_USE_WCHAR=y
  BR2_PACKAGE_EXFATPROGS=y

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
Changes v1 -> v2:
  - reworked patch to don't break the other toolchains
---
 ...PRIu64-PRIx64-to-printf-64-bit-types.patch | 83 +++++++++++++++++++
 1 file changed, 83 insertions(+)
 create mode 100644 package/exfatprogs/0005-fsck-use-PRIu64-PRIx64-to-printf-64-bit-types.patch

diff --git a/package/exfatprogs/0005-fsck-use-PRIu64-PRIx64-to-printf-64-bit-types.patch b/package/exfatprogs/0005-fsck-use-PRIu64-PRIx64-to-printf-64-bit-types.patch
new file mode 100644
index 0000000000..e048722f03
--- /dev/null
+++ b/package/exfatprogs/0005-fsck-use-PRIu64-PRIx64-to-printf-64-bit-types.patch
@@ -0,0 +1,83 @@
+From fb8b321c1468a76faf5cdef94d122cb916aa6ca3 Mon Sep 17 00:00:00 2001
+From: Peter Seiderer <ps.report@gmx.net>
+Date: Sat, 9 May 2020 18:06:52 +0200
+Subject: [PATCH] fsck: use PRIu64/PRIx64 to printf 64-bit types
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Fixes:
+
+  fsck.c:725:13: error: format ?%llu? expects argument of type ?long long unsigned int?, but argument 2 has type ?__u64 {aka long unsigned int}? [-Werror=format=]
+     exfat_err("size %llu is greater than cluster heap: %s\n",
+               ^
+
+  fsck.c:740:13: error: format ?%llu? expects argument of type ?long long unsigned int?, but argument 2 has type ?__u64 {aka long unsigned int}? [-Werror=format=]
+     exfat_err("directory size %llu is not divisible by %d: %s\n",
+               ^
+
+  fsck.c:853:13: error: format ?%llu? expects argument of type ?long long unsigned int?, but argument 3 has type ?__u64 {aka long unsigned int}? [-Werror=format=]
+     exfat_err("valid size %" PRIu64 " greater than size %llu: %s\n",
+               ^
+
+  fsck.c:1181:14: error: format ?%llx? expects argument of type ?long long unsigned int?, but argument 3 has type ?__u64 {aka long unsigned int}? [-Werror=format=]
+    exfat_debug("root directory: start cluster[0x%x] size[0x%llx]\n",
+                ^
+
+[Upstream: https://github.com/exfatprogs/exfatprogs/pull/91]
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+---
+ fsck/fsck.c | 16 ++++++++--------
+ 1 file changed, 8 insertions(+), 8 deletions(-)
+
+diff --git a/fsck/fsck.c b/fsck/fsck.c
+index f0daa1d..ada477e 100644
+--- a/fsck/fsck.c
++++ b/fsck/fsck.c
+@@ -722,8 +722,8 @@ static bool check_inode(struct exfat *exfat, struct exfat_inode *parent,
+ 	if (node->size > le32_to_cpu(exfat->bs->bsx.clu_count) *
+ 				EXFAT_CLUSTER_SIZE(exfat->bs)) {
+ 		resolve_path_parent(&path_resolve_ctx, parent, node);
+-		exfat_err("size %llu is greater than cluster heap: %s\n",
+-				node->size, path_resolve_ctx.local_path);
++		exfat_err("size %" PRIu64 " is greater than cluster heap: %s\n",
++				(uint64_t)node->size, path_resolve_ctx.local_path);
+ 		ret = false;
+ 	}
+ 
+@@ -737,8 +737,8 @@ static bool check_inode(struct exfat *exfat, struct exfat_inode *parent,
+ 	if ((node->attr & ATTR_SUBDIR) &&
+ 			node->size % EXFAT_CLUSTER_SIZE(exfat->bs) != 0) {
+ 		resolve_path_parent(&path_resolve_ctx, parent, node);
+-		exfat_err("directory size %llu is not divisible by %d: %s\n",
+-				node->size, EXFAT_CLUSTER_SIZE(exfat->bs),
++		exfat_err("directory size %" PRIu64 " is not divisible by %d: %s\n",
++				(uint64_t)node->size, EXFAT_CLUSTER_SIZE(exfat->bs),
+ 				path_resolve_ctx.local_path);
+ 		ret = false;
+ 	}
+@@ -850,8 +850,8 @@ static int read_file_dentries(struct exfat_de_iter *iter,
+ 
+ 	if (le64_to_cpu(stream_de->stream_valid_size) > node->size) {
+ 		resolve_path_parent(&path_resolve_ctx, iter->parent, node);
+-		exfat_err("valid size %" PRIu64 " greater than size %llu: %s\n",
+-			le64_to_cpu(stream_de->stream_valid_size), node->size,
++		exfat_err("valid size %" PRIu64 " greater than size %" PRIu64 ": %s\n",
++			le64_to_cpu(stream_de->stream_valid_size), (uint64_t)node->size,
+ 			path_resolve_ctx.local_path);
+ 		ret = -EINVAL;
+ 		goto err;
+@@ -1178,8 +1178,8 @@ static bool exfat_root_dir_check(struct exfat *exfat)
+ 	root->size = clus_count * EXFAT_CLUSTER_SIZE(exfat->bs);
+ 
+ 	exfat->root = root;
+-	exfat_debug("root directory: start cluster[0x%x] size[0x%llx]\n",
+-		root->first_clus, root->size);
++	exfat_debug("root directory: start cluster[0x%x] size[0x%" PRIx64 "]\n",
++		root->first_clus, (uint64_t)root->size);
+ 	return true;
+ err:
+ 	free_exfat_inode(root);
+-- 
+2.26.2
+
-- 
2.26.2
