Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91BA4E77355
	for <buildroot@archiver.kernel.org>; Sat, 30 Sep 2023 09:59:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 317CA616FB;
	Sat, 30 Sep 2023 09:59:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 317CA616FB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Z8-SBtukw7Le; Sat, 30 Sep 2023 09:59:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1915D616F9;
	Sat, 30 Sep 2023 09:59:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1915D616F9
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0B56E1BF2CE
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 09:59:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E9230616F7
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 09:59:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E9230616F7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AQz4AfKrBf9w for <buildroot@lists.busybox.net>;
 Sat, 30 Sep 2023 09:59:41 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id B9BC4616F1
 for <buildroot@buildroot.org>; Sat, 30 Sep 2023 09:59:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B9BC4616F1
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9F6E5838DB; Sat, 30 Sep 2023 09:59:41 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 30 Sep 2023 11:59:31 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6bafe36caf7aefd11835f6ca4ca57d922156e89f
X-Git-Newrev: 9c25f1b51eeb988449ad0f1f524283ef5361ee4d
X-Patchwork-Hint: ignore
Message-Id: <20230930095941.9F6E5838DB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] boot/grub2: fix incompat e2fsprogs feature
 use
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=9c25f1b51eeb988449ad0f1f524283ef5361ee4d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

With bump of package/e2fsprogs to 1.47.0 [1] a freshly generated
ext4 fs has unfortunately different default features enabled
(e.g. metadata_csum_seed). This and some other newer fs features
(e.g. large_dir) are however not supported by our grub2.
Thus, newly generated ext-based rootfs won't be recognized by grub2
and are therefore not bootable/usable from grub2 anymore. This is
an issue already known to other Linux derivates [2],[3],[4].

This commit introduces two additional upstream patches to
package/grub2 which adds EXT4_FEATURE_INCOMPAT_CSUM_SEED and
EXT4_FEATURE_INCOMPAT_LARGEDIR to the EXT2_DRIVER_IGNORED_INCOMPAT
list of ignored incompatible ext features, allowing grub2 to
use ext filesystems with these newer default feature sets.

[1] https://git.buildroot.net/buildroot/commit/?id=6a21733f839478d902f3eab287a82b456e55f708
[2] https://bugs.launchpad.net/ubuntu/+source/grub2/+bug/1844012
[3] https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=1031325
[4] https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=1030939

Signed-off-by: Jens Maus <mail@jens-maus.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...xt2-Ignore-checksum-seed-incompat-feature.patch | 61 ++++++++++++++++++++++
 ...xt2-Ignore-the-large_dir-incompat-feature.patch | 60 +++++++++++++++++++++
 2 files changed, 121 insertions(+)

diff --git a/boot/grub2/0019-fs-ext2-Ignore-checksum-seed-incompat-feature.patch b/boot/grub2/0019-fs-ext2-Ignore-checksum-seed-incompat-feature.patch
new file mode 100644
index 0000000000..9a913e2279
--- /dev/null
+++ b/boot/grub2/0019-fs-ext2-Ignore-checksum-seed-incompat-feature.patch
@@ -0,0 +1,61 @@
+From 7fd5feff97c4b1f446f8fcf6d37aca0c64e7c763 Mon Sep 17 00:00:00 2001
+From: Javier Martinez Canillas <javierm@redhat.com>
+Date: Fri, 11 Jun 2021 21:36:16 +0200
+Subject: [PATCH] fs/ext2: Ignore checksum seed incompat feature
+
+This incompat feature is used to denote that the filesystem stored its
+metadata checksum seed in the superblock. This is used to allow tune2fs
+changing the UUID on a mounted metdata_csum filesystem without having
+to rewrite all the disk metadata. However, the GRUB doesn't use the
+metadata checksum at all. So, it can just ignore this feature if it
+is enabled. This is consistent with the GRUB filesystem code in general
+which just does a best effort to access the filesystem's data.
+
+The checksum seed incompat feature has to be removed from the ignore
+list if the support for metadata checksum verification is added to the
+GRUB ext2 driver later.
+
+Suggested-by: Eric Sandeen <esandeen@redhat.com>
+Suggested-by: Lukas Czerner <lczerner@redhat.com>
+Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
+Reviewed-by: Lukas Czerner <lczerner@redhat.com>
+Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
+Upstream: 7fd5feff97c4b1f446f8fcf6d37aca0c64e7c763
+Signed-off-by: Jens Maus <mail@jens-maus.de>
+---
+ grub-core/fs/ext2.c | 10 ++++++++--
+ 1 file changed, 8 insertions(+), 2 deletions(-)
+
+diff --git a/grub-core/fs/ext2.c b/grub-core/fs/ext2.c
+index e7dd78e66..4953a1591 100644
+--- a/grub-core/fs/ext2.c
++++ b/grub-core/fs/ext2.c
+@@ -103,6 +103,7 @@ GRUB_MOD_LICENSE ("GPLv3+");
+ #define EXT4_FEATURE_INCOMPAT_64BIT		0x0080
+ #define EXT4_FEATURE_INCOMPAT_MMP		0x0100
+ #define EXT4_FEATURE_INCOMPAT_FLEX_BG		0x0200
++#define EXT4_FEATURE_INCOMPAT_CSUM_SEED		0x2000
+ #define EXT4_FEATURE_INCOMPAT_ENCRYPT          0x10000
+ 
+ /* The set of back-incompatible features this driver DOES support. Add (OR)
+@@ -123,10 +124,15 @@ GRUB_MOD_LICENSE ("GPLv3+");
+  * mmp:            Not really back-incompatible - was added as such to
+  *                 avoid multiple read-write mounts. Safe to ignore for this
+  *                 RO driver.
++ * checksum seed:  Not really back-incompatible - was added to allow tools
++ *                 such as tune2fs to change the UUID on a mounted metadata
++ *                 checksummed filesystem. Safe to ignore for now since the
++ *                 driver doesn't support checksum verification. However, it
++ *                 has to be removed from this list if the support is added later.
+  */
+ #define EXT2_DRIVER_IGNORED_INCOMPAT ( EXT3_FEATURE_INCOMPAT_RECOVER \
+-				     | EXT4_FEATURE_INCOMPAT_MMP)
+-
++				     | EXT4_FEATURE_INCOMPAT_MMP \
++				     | EXT4_FEATURE_INCOMPAT_CSUM_SEED)
+ 
+ #define EXT3_JOURNAL_MAGIC_NUMBER	0xc03b3998U
+ 
+-- 
+2.34.1
+
diff --git a/boot/grub2/0020-fs-ext2-Ignore-the-large_dir-incompat-feature.patch b/boot/grub2/0020-fs-ext2-Ignore-the-large_dir-incompat-feature.patch
new file mode 100644
index 0000000000..43b182f968
--- /dev/null
+++ b/boot/grub2/0020-fs-ext2-Ignore-the-large_dir-incompat-feature.patch
@@ -0,0 +1,60 @@
+From 2e9fa73a040462b81bfbfe56c0bc7ad2d30b446b Mon Sep 17 00:00:00 2001
+From: Theodore Ts'o <tytso@mit.edu>
+Date: Tue, 30 Aug 2022 22:41:59 -0400
+Subject: [PATCH] fs/ext2: Ignore the large_dir incompat feature
+
+Recently, ext4 added the large_dir feature, which adds support for
+a 3 level htree directory support.
+
+The GRUB supports existing file systems with htree directories by
+ignoring their existence, and since the index nodes for the hash tree
+look like deleted directory entries (by design), the GRUB can simply do
+a brute force O(n) linear search of directories. The same is true for
+3 level deep htrees indicated by large_dir feature flag.
+
+Hence, it is safe for the GRUB to ignore the large_dir incompat feature.
+
+Fixes: https://savannah.gnu.org/bugs/?61606
+
+Signed-off-by: Theodore Ts'o <tytso@mit.edu>
+Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
+Upstream: 2e9fa73a040462b81bfbfe56c0bc7ad2d30b446b
+Signed-off-by: Jens Maus <mail@jens-maus.de>
+---
+ grub-core/fs/ext2.c | 10 +++++++++-
+ 1 file changed, 9 insertions(+), 1 deletion(-)
+
+diff --git a/grub-core/fs/ext2.c b/grub-core/fs/ext2.c
+index 0989e26e1..e1cc5e62a 100644
+--- a/grub-core/fs/ext2.c
++++ b/grub-core/fs/ext2.c
+@@ -104,6 +104,7 @@ GRUB_MOD_LICENSE ("GPLv3+");
+ #define EXT4_FEATURE_INCOMPAT_MMP		0x0100
+ #define EXT4_FEATURE_INCOMPAT_FLEX_BG		0x0200
+ #define EXT4_FEATURE_INCOMPAT_CSUM_SEED		0x2000
++#define EXT4_FEATURE_INCOMPAT_LARGEDIR		0x4000 /* >2GB or 3 level htree */
+ #define EXT4_FEATURE_INCOMPAT_ENCRYPT          0x10000
+ 
+ /* The set of back-incompatible features this driver DOES support. Add (OR)
+@@ -129,10 +130,17 @@ GRUB_MOD_LICENSE ("GPLv3+");
+  *                 checksummed filesystem. Safe to ignore for now since the
+  *                 driver doesn't support checksum verification. However, it
+  *                 has to be removed from this list if the support is added later.
++ * large_dir:      Not back-incompatible given that the GRUB ext2 driver does
++ *                 not implement EXT2_FEATURE_COMPAT_DIR_INDEX. If the GRUB
++ *                 eventually supports the htree feature (aka dir_index)
++ *                 it should support 3 level htrees and then move
++ *                 EXT4_FEATURE_INCOMPAT_LARGEDIR to
++ *                 EXT2_DRIVER_SUPPORTED_INCOMPAT.
+  */
+ #define EXT2_DRIVER_IGNORED_INCOMPAT ( EXT3_FEATURE_INCOMPAT_RECOVER \
+ 				     | EXT4_FEATURE_INCOMPAT_MMP \
+-				     | EXT4_FEATURE_INCOMPAT_CSUM_SEED)
++				     | EXT4_FEATURE_INCOMPAT_CSUM_SEED \
++				     | EXT4_FEATURE_INCOMPAT_LARGEDIR)
+ 
+ #define EXT3_JOURNAL_MAGIC_NUMBER	0xc03b3998U
+ 
+-- 
+2.34.1
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
