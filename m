From: Peter Seiderer <ps.report@gmx.net>
Date: Sat, 9 May 2020 18:42:46 +0200
Subject: [Buildroot] [PATCH v1 4/4] exfatprogs: fix more 64-bit types
 printf compile failure
In-Reply-To: <20200509162117.8728-4-ps.report@gmx.net>
References: <20200509162117.8728-1-ps.report@gmx.net>
 <20200509162117.8728-4-ps.report@gmx.net>
Message-ID: <20200509184246.1b9d9b5a@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat,  9 May 2020 18:21:17 +0200, Peter Seiderer <ps.report@gmx.net> wrote:

> Fixes test-pkg detected compile failures for the following toolchains:
> 
>   - br-mips64-n64-full
>   - br-mips64r6-el-hf-glibc
>   - br-powerpc64le-power8-glibc
>   - br-powerpc64-power7-glibc
>   - sourcery-mips64
> 
> Used test config:
> 
>   BR2_USE_WCHAR=y
>   BR2_PACKAGE_EXFATPROGS=y
> 

Ignore this one, breaks some other toolchains build....update follows ;-)

Regards,
Peter

> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
>  ...PRIu64-PRIx64-to-printf-64-bit-types.patch | 75 +++++++++++++++++++
>  1 file changed, 75 insertions(+)
>  create mode 100644 package/exfatprogs/0005-fsck-use-PRIu64-PRIx64-to-printf-64-bit-types.patch
> 
> diff --git a/package/exfatprogs/0005-fsck-use-PRIu64-PRIx64-to-printf-64-bit-types.patch b/package/exfatprogs/0005-fsck-use-PRIu64-PRIx64-to-printf-64-bit-types.patch
> new file mode 100644
> index 0000000000..d7e3e3c8dd
> --- /dev/null
> +++ b/package/exfatprogs/0005-fsck-use-PRIu64-PRIx64-to-printf-64-bit-types.patch
> @@ -0,0 +1,75 @@
> +From e9acfd5f7e734952c22d2a5694bf7d99e9e5837f Mon Sep 17 00:00:00 2001
> +From: Peter Seiderer <ps.report@gmx.net>
> +Date: Sat, 9 May 2020 18:06:52 +0200
> +Subject: [PATCH] fsck: use PRIu64/PRIx64 to printf 64-bit types
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=UTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +Fixes:
> +
> +  fsck.c:725:13: error: format ?%llu? expects argument of type ?long long unsigned int?, but argument 2 has type ?__u64 {aka long unsigned int}? [-Werror=format=]
> +     exfat_err("size %llu is greater than cluster heap: %s\n",
> +               ^
> +
> +  fsck.c:740:13: error: format ?%llu? expects argument of type ?long long unsigned int?, but argument 2 has type ?__u64 {aka long unsigned int}? [-Werror=format=]
> +     exfat_err("directory size %llu is not divisible by %d: %s\n",
> +               ^
> +
> +  fsck.c:853:13: error: format ?%llu? expects argument of type ?long long unsigned int?, but argument 3 has type ?__u64 {aka long unsigned int}? [-Werror=format=]
> +     exfat_err("valid size %" PRIu64 " greater than size %llu: %s\n",
> +               ^
> +
> +  fsck.c:1181:14: error: format ?%llx? expects argument of type ?long long unsigned int?, but argument 3 has type ?__u64 {aka long unsigned int}? [-Werror=format=]
> +    exfat_debug("root directory: start cluster[0x%x] size[0x%llx]\n",
> +                ^
> +
> +[Upstream: https://github.com/exfatprogs/exfatprogs/pull/91]
> +Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> +---
> + fsck/fsck.c | 8 ++++----
> + 1 file changed, 4 insertions(+), 4 deletions(-)
> +
> +diff --git a/fsck/fsck.c b/fsck/fsck.c
> +index f0daa1d..5631dc3 100644
> +--- a/fsck/fsck.c
> ++++ b/fsck/fsck.c
> +@@ -722,7 +722,7 @@ static bool check_inode(struct exfat *exfat, struct exfat_inode *parent,
> + 	if (node->size > le32_to_cpu(exfat->bs->bsx.clu_count) *
> + 				EXFAT_CLUSTER_SIZE(exfat->bs)) {
> + 		resolve_path_parent(&path_resolve_ctx, parent, node);
> +-		exfat_err("size %llu is greater than cluster heap: %s\n",
> ++		exfat_err("size %" PRIu64 " is greater than cluster heap: %s\n",
> + 				node->size, path_resolve_ctx.local_path);
> + 		ret = false;
> + 	}
> +@@ -737,7 +737,7 @@ static bool check_inode(struct exfat *exfat, struct exfat_inode *parent,
> + 	if ((node->attr & ATTR_SUBDIR) &&
> + 			node->size % EXFAT_CLUSTER_SIZE(exfat->bs) != 0) {
> + 		resolve_path_parent(&path_resolve_ctx, parent, node);
> +-		exfat_err("directory size %llu is not divisible by %d: %s\n",
> ++		exfat_err("directory size %" PRIu64 " is not divisible by %d: %s\n",
> + 				node->size, EXFAT_CLUSTER_SIZE(exfat->bs),
> + 				path_resolve_ctx.local_path);
> + 		ret = false;
> +@@ -850,7 +850,7 @@ static int read_file_dentries(struct exfat_de_iter *iter,
> + 
> + 	if (le64_to_cpu(stream_de->stream_valid_size) > node->size) {
> + 		resolve_path_parent(&path_resolve_ctx, iter->parent, node);
> +-		exfat_err("valid size %" PRIu64 " greater than size %llu: %s\n",
> ++		exfat_err("valid size %" PRIu64 " greater than size %" PRIu64 ": %s\n",
> + 			le64_to_cpu(stream_de->stream_valid_size), node->size,
> + 			path_resolve_ctx.local_path);
> + 		ret = -EINVAL;
> +@@ -1178,7 +1178,7 @@ static bool exfat_root_dir_check(struct exfat *exfat)
> + 	root->size = clus_count * EXFAT_CLUSTER_SIZE(exfat->bs);
> + 
> + 	exfat->root = root;
> +-	exfat_debug("root directory: start cluster[0x%x] size[0x%llx]\n",
> ++	exfat_debug("root directory: start cluster[0x%x] size[0x%" PRIx64 "]\n",
> + 		root->first_clus, root->size);
> + 	return true;
> + err:
> +-- 
> +2.26.2
> +
