Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D793C3ABDD
	for <buildroot@archiver.kernel.org>; Mon, 19 May 2025 11:01:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 62BC88421C;
	Mon, 19 May 2025 11:01:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A3CrOyM7jnXf; Mon, 19 May 2025 11:01:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 80CFA847C2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 80CFA847C2;
	Mon, 19 May 2025 11:01:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1FD3F193
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:47:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 86E6E419EF
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:40:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3311Z0hZgcpn for <buildroot@buildroot.org>;
 Mon, 19 May 2025 10:40:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E563A41A1C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id E563A41A1C
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:40:04 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E17518348A; Mon, 19 May 2025 10:40:04 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Fri, 16 May 2025 16:22:53 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 5eb46878bd954ec434d288dc97de596676273bb5
X-Git-Newrev: 8a25ff3f893e1d45171dce0a240e5fb5d61bac8a
X-Patchwork-Hint: ignore
Message-Id: <20250519104004.E17518348A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/android-tools: add
 patch to fix GCC 15.x build issue
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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
Content-Type: multipart/mixed; boundary="===============7340020874726746613=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7340020874726746613==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=8a25ff3f893e1d45171dce0a240e5fb5d61bac8a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

host-android-tools fails to build when the host gcc version is >=
15.x. A simple patch allows to fix the issue by adjusting how
allocate_inode() gets called.

Fixes:

  https://autobuild.buildroot.org/results/e8152490540ee1968182f4eb7813e5e940f3e9b3/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ..._utils-contents.c-allocate_inode-doesn-t-.patch | 57 ++++++++++++++++++++++
 1 file changed, 57 insertions(+)

diff --git a/package/android-tools/0017-extras-ext4_utils-contents.c-allocate_inode-doesn-t-.patch b/package/android-tools/0017-extras-ext4_utils-contents.c-allocate_inode-doesn-t-.patch
new file mode 100644
index 0000000000..a9baf4dc29
--- /dev/null
+++ b/package/android-tools/0017-extras-ext4_utils-contents.c-allocate_inode-doesn-t-.patch
@@ -0,0 +1,57 @@
+From b822c8e2f380ba6158601e621a12927a4264ff67 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+Date: Fri, 16 May 2025 15:32:00 +0200
+Subject: [PATCH] extras/ext4_utils/contents.c: allocate_inode() doesn't take
+ any argument
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Fixes:
+
+/home/thomas/projets/buildroot/output/build/host-android-tools-4.2.2+git20130218/extras/ext4_utils/contents.c: In function ‘make_directory’:
+/home/thomas/projets/buildroot/output/build/host-android-tools-4.2.2+git20130218/extras/ext4_utils/contents.c:102:29: error: too many arguments to function ‘allocate_inode’; expected 0, have 1
+  102 |                 inode_num = allocate_inode(info);
+
+and similar build failures that occur with GCC 15.x.
+
+Upstream: N/A, we're too far from upstream
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ extras/ext4_utils/contents.c | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/extras/ext4_utils/contents.c b/extras/ext4_utils/contents.c
+index 6300680..b0336a4 100644
+--- a/extras/ext4_utils/contents.c
++++ b/extras/ext4_utils/contents.c
+@@ -99,7 +99,7 @@ u32 make_directory(u32 dir_inode_num, u32 entries, struct dentry *dentries,
+ 	len = blocks * info.block_size;
+ 
+ 	if (dir_inode_num) {
+-		inode_num = allocate_inode(info);
++		inode_num = allocate_inode();
+ 	} else {
+ 		dir_inode_num = EXT4_ROOT_INO;
+ 		inode_num = EXT4_ROOT_INO;
+@@ -167,7 +167,7 @@ u32 make_file(const char *filename, u64 len)
+ 	struct ext4_inode *inode;
+ 	u32 inode_num;
+ 
+-	inode_num = allocate_inode(info);
++	inode_num = allocate_inode();
+ 	if (inode_num == EXT4_ALLOCATE_FAILED) {
+ 		error("failed to allocate inode\n");
+ 		return EXT4_ALLOCATE_FAILED;
+@@ -196,7 +196,7 @@ u32 make_link(const char *filename, const char *link)
+ 	u32 inode_num;
+ 	u32 len = strlen(link);
+ 
+-	inode_num = allocate_inode(info);
++	inode_num = allocate_inode();
+ 	if (inode_num == EXT4_ALLOCATE_FAILED) {
+ 		error("failed to allocate inode\n");
+ 		return EXT4_ALLOCATE_FAILED;
+-- 
+2.49.0
+

--===============7340020874726746613==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7340020874726746613==--
