Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 658E3C433F5
	for <buildroot@archiver.kernel.org>; Tue, 10 May 2022 16:03:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 11D9881D9F;
	Tue, 10 May 2022 16:03:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id n0TT7ZCu1U32; Tue, 10 May 2022 16:03:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0D2228174F;
	Tue, 10 May 2022 16:03:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C3C741BF2C9
 for <buildroot@lists.busybox.net>; Tue, 10 May 2022 16:03:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B2A25812CE
 for <buildroot@lists.busybox.net>; Tue, 10 May 2022 16:03:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ISwsNDQe5Yww for <buildroot@lists.busybox.net>;
 Tue, 10 May 2022 16:03:25 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id B434F81D24
 for <buildroot@buildroot.org>; Tue, 10 May 2022 16:03:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id DC52C85C74; Tue, 10 May 2022 15:52:37 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 10 May 2022 18:02:59 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b054353e59488713f841cd9ac9384b8a23f2e83a
X-Git-Newrev: 3ef096786a5d364a7924105d67ff7dcdaaa21f61
X-Patchwork-Hint: ignore
Message-Id: <20220510155237.DC52C85C74@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/e2fsprogs: fix CVE-2022-1304
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

commit: https://git.buildroot.net/buildroot/commit/?id=3ef096786a5d364a7924105d67ff7dcdaaa21f61
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

An out-of-bounds read/write vulnerability was found in e2fsprogs 1.46.5.
This issue leads to a segmentation fault and possibly arbitrary code
execution via a specially crafted filesystem.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...s-add-sanity-check-to-extent-manipulation.patch | 59 ++++++++++++++++++++++
 package/e2fsprogs/e2fsprogs.mk                     |  3 ++
 2 files changed, 62 insertions(+)

diff --git a/package/e2fsprogs/0001-libext2fs-add-sanity-check-to-extent-manipulation.patch b/package/e2fsprogs/0001-libext2fs-add-sanity-check-to-extent-manipulation.patch
new file mode 100644
index 0000000000..b5299a2a78
--- /dev/null
+++ b/package/e2fsprogs/0001-libext2fs-add-sanity-check-to-extent-manipulation.patch
@@ -0,0 +1,59 @@
+From ab51d587bb9b229b1fade1afd02e1574c1ba5c76 Mon Sep 17 00:00:00 2001
+From: Lukas Czerner <lczerner@redhat.com>
+Date: Thu, 21 Apr 2022 19:31:48 +0200
+Subject: libext2fs: add sanity check to extent manipulation
+
+It is possible to have a corrupted extent tree in such a way that a leaf
+node contains zero extents in it. Currently if that happens and we try
+to traverse the tree we can end up accessing wrong data, or possibly
+even uninitialized memory. Make sure we don't do that.
+
+Additionally make sure that we have a sane number of bytes passed to
+memmove() in ext2fs_extent_delete().
+
+Note that e2fsck is currently unable to spot and fix such corruption in
+pass1.
+
+Signed-off-by: Lukas Czerner <lczerner@redhat.com>
+Reported-by: Nils Bars <nils_bars@t-online.de>
+Addresses: https://bugzilla.redhat.com/show_bug.cgi?id=2068113
+Addresses: CVE-2022-1304
+Addresses-Debian-Bug: #1010263
+Signed-off-by: Theodore Ts'o <tytso@mit.edu>
+
+[Retrieved from:
+https://git.kernel.org/pub/scm/fs/ext2/e2fsprogs.git/commit/?h=maint&id=ab51d587bb9b229b1fade1afd02e1574c1ba5c76]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ lib/ext2fs/extent.c | 8 ++++++++
+ 1 file changed, 8 insertions(+)
+
+diff --git a/lib/ext2fs/extent.c b/lib/ext2fs/extent.c
+index b324c7b0..1a206a16 100644
+--- a/lib/ext2fs/extent.c
++++ b/lib/ext2fs/extent.c
+@@ -495,6 +495,10 @@ retry:
+ 			ext2fs_le16_to_cpu(eh->eh_entries);
+ 		newpath->max_entries = ext2fs_le16_to_cpu(eh->eh_max);
+ 
++		/* Make sure there is at least one extent present */
++		if (newpath->left <= 0)
++			return EXT2_ET_EXTENT_NO_DOWN;
++
+ 		if (path->left > 0) {
+ 			ix++;
+ 			newpath->end_blk = ext2fs_le32_to_cpu(ix->ei_block);
+@@ -1630,6 +1634,10 @@ errcode_t ext2fs_extent_delete(ext2_extent_handle_t handle, int flags)
+ 
+ 	cp = path->curr;
+ 
++	/* Sanity check before memmove() */
++	if (path->left < 0)
++		return EXT2_ET_EXTENT_LEAF_BAD;
++
+ 	if (path->left) {
+ 		memmove(cp, cp + sizeof(struct ext3_extent_idx),
+ 			path->left * sizeof(struct ext3_extent_idx));
+-- 
+cgit 
+
diff --git a/package/e2fsprogs/e2fsprogs.mk b/package/e2fsprogs/e2fsprogs.mk
index cd70e3a034..39c9e07644 100644
--- a/package/e2fsprogs/e2fsprogs.mk
+++ b/package/e2fsprogs/e2fsprogs.mk
@@ -12,6 +12,9 @@ E2FSPROGS_LICENSE_FILES = NOTICE lib/ss/mit-sipb-copyright.h lib/et/internal.h
 E2FSPROGS_CPE_ID_VENDOR = e2fsprogs_project
 E2FSPROGS_INSTALL_STAGING = YES
 
+# 0001-libext2fs-add-sanity-check-to-extent-manipulation.patch
+E2FSPROGS_IGNORE_CVES += CVE-2022-1304
+
 # Use libblkid and libuuid from util-linux for host and target packages.
 # This prevents overriding them with e2fsprogs' ones, which may cause
 # problems for other packages.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
