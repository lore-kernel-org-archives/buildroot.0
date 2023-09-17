Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A5EBCD13D8
	for <buildroot@archiver.kernel.org>; Sun, 17 Sep 2023 20:09:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CFDB84048E;
	Sun, 17 Sep 2023 20:09:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CFDB84048E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id R3zQcbPjez0t; Sun, 17 Sep 2023 20:08:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 928854053E;
	Sun, 17 Sep 2023 20:08:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 928854053E
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B57381BF399
 for <buildroot@lists.busybox.net>; Sun, 17 Sep 2023 20:08:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8EA164053E
 for <buildroot@lists.busybox.net>; Sun, 17 Sep 2023 20:08:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8EA164053E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id w_CjREXvSnGI for <buildroot@lists.busybox.net>;
 Sun, 17 Sep 2023 20:08:54 +0000 (UTC)
X-Greylist: delayed 437 seconds by postgrey-1.37 at util1.osuosl.org;
 Sun, 17 Sep 2023 20:08:54 UTC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8E9584048E
Received: from mail.light-speed.de (mail.light-speed.de
 [IPv6:2a01:238:43f2:8900:dd04:e3a0:ee11:a73d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8E9584048E
 for <buildroot@buildroot.org>; Sun, 17 Sep 2023 20:08:54 +0000 (UTC)
Received: from bilbo.fritz.box (ip5f5a8b4a.dynamic.kabel-deutschland.de
 [95.90.139.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.light-speed.de (Postfix) with ESMTPSA id C36653D4246F;
 Sun, 17 Sep 2023 22:01:34 +0200 (CEST)
To: buildroot@buildroot.org
Date: Sun, 17 Sep 2023 22:01:34 +0200
Message-Id: <20230917200134.1251786-1-mail@jens-maus.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jens-maus.de; s=mail; t=1694980894;
 bh=QIGECESN/VEGlJ1pIbLzI4Tbskrgs91XCu9TruQKPGs=;
 h=From:To:Cc:Subject:Date;
 b=pzF1AygYJihiG3RoAQtBgvRKARr6NpBJt32eaAmxuUe+8V+rX0Zg/4XHycRuPCmO6
 kiUf8HlT7mD7fI7hQ6OdlB9lw2coiAjzn4rT6V6py6tUTHL27vZX25Ucu1Mj0qXpEA
 /cgo2uXjlZ00pmmTG82Ji3Rh87o+doqfbMxFn6Hk=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=jens-maus.de header.i=@jens-maus.de
 header.a=rsa-sha256 header.s=mail header.b=pzF1AygY
Subject: [Buildroot] [PATCH 1/1] boot/grub2: fix incompat e2fsprogs feature
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
From: Jens Maus via buildroot <buildroot@buildroot.org>
Reply-To: Jens Maus <mail@jens-maus.de>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

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
---
 ...gnore-checksum-seed-incompat-feature.patch | 59 +++++++++++++++++++
 ...gnore-the-large_dir-incompat-feature.patch | 58 ++++++++++++++++++
 2 files changed, 117 insertions(+)
 create mode 100644 boot/grub2/0019-Ignore-checksum-seed-incompat-feature.patch
 create mode 100644 boot/grub2/0020-Ignore-the-large_dir-incompat-feature.patch

diff --git a/boot/grub2/0019-Ignore-checksum-seed-incompat-feature.patch b/boot/grub2/0019-Ignore-checksum-seed-incompat-feature.patch
new file mode 100644
index 0000000000..27b2277c40
--- /dev/null
+++ b/boot/grub2/0019-Ignore-checksum-seed-incompat-feature.patch
@@ -0,0 +1,59 @@
+From 7fd5feff97c4b1f446f8fcf6d37aca0c64e7c763 Mon Sep 17 00:00:00 2001
+From: Javier Martinez Canillas <javierm@redhat.com>
+Date: Fri, 11 Jun 2021 21:36:16 +0200
+Subject: fs/ext2: Ignore checksum seed incompat feature
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
+---
+ grub-core/fs/ext2.c | 10 ++++++++--
+ 1 file changed, 8 insertions(+), 2 deletions(-)
+
+diff --git a/grub-core/fs/ext2.c b/grub-core/fs/ext2.c
+index e7dd78e..4953a15 100644
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
+cgit v1.1
+
diff --git a/boot/grub2/0020-Ignore-the-large_dir-incompat-feature.patch b/boot/grub2/0020-Ignore-the-large_dir-incompat-feature.patch
new file mode 100644
index 0000000000..957b66f2c1
--- /dev/null
+++ b/boot/grub2/0020-Ignore-the-large_dir-incompat-feature.patch
@@ -0,0 +1,58 @@
+From 2e9fa73a040462b81bfbfe56c0bc7ad2d30b446b Mon Sep 17 00:00:00 2001
+From: Theodore Ts'o <tytso@mit.edu>
+Date: Tue, 30 Aug 2022 22:41:59 -0400
+Subject: fs/ext2: Ignore the large_dir incompat feature
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
+---
+ grub-core/fs/ext2.c | 10 +++++++++-
+ 1 file changed, 9 insertions(+), 1 deletion(-)
+
+diff --git a/grub-core/fs/ext2.c b/grub-core/fs/ext2.c
+index 0989e26..e1cc5e6 100644
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
+cgit v1.1
+
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
