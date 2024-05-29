Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07181C25B75
	for <buildroot@archiver.kernel.org>; Wed, 29 May 2024 07:19:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CA62660757;
	Wed, 29 May 2024 07:19:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SNp3kcWyEvTG; Wed, 29 May 2024 07:19:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A5F256078E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A5F256078E;
	Wed, 29 May 2024 07:19:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BADB21D3288
 for <buildroot@lists.busybox.net>; Wed, 29 May 2024 07:19:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AFF27810D7
 for <buildroot@lists.busybox.net>; Wed, 29 May 2024 07:19:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MjGq19oVM2N0 for <buildroot@lists.busybox.net>;
 Wed, 29 May 2024 07:19:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0D027810AC
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0D027810AC
 for <buildroot@buildroot.org>; Wed, 29 May 2024 07:19:44 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 057F887739; Wed, 29 May 2024 07:19:44 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 29 May 2024 08:56:47 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 47da55f969e1f677507b61cdb543a6ea66e0f131
X-Git-Newrev: d506e232e7388e70622a1c1b2a3069367d7b305b
X-Patchwork-Hint: ignore
Message-Id: <20240529071944.057F887739@busybox.osuosl.org>
Subject: [Buildroot] [git commit] utils/add-custom-hashes: symlink
 linux-headers to linux
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

commit: https://git.buildroot.net/buildroot/commit/?id=d506e232e7388e70622a1c1b2a3069367d7b305b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Most boards use BR2_KERNEL_HEADERS_AS_KERNEL with their custom kernels.
So when creating their custom hash files, the linux-headers.hash is the
same as linux.hash. In this case we symlink linux-headers to linux to
make maintenance easier. Update the add-custom-hashes tool to explicitly
handle this case.

Signed-off-by: Brandon Maier <brandon.maier@collins.com>
[Peter: use cmp -s]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 utils/add-custom-hashes | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/utils/add-custom-hashes b/utils/add-custom-hashes
index 20e48d8ef3..017b25b27f 100755
--- a/utils/add-custom-hashes
+++ b/utils/add-custom-hashes
@@ -97,6 +97,14 @@ for file in $BR_NO_CHECK_HASH_FOR; do
     done
 done
 
+# Symlink linux-headers to linux if identical
+linux_hash="$BR2_GLOBAL_PATCH_DIR/linux/linux.hash"
+linux_headers_hash="$BR2_GLOBAL_PATCH_DIR/linux-headers/linux-headers.hash"
+if [ -e "$linux_hash" ] && [ -e "$linux_headers_hash" ] \
+    && cmp -s "$linux_hash" "$linux_headers_hash"; then
+    ln -sf ../linux/linux.hash "$linux_headers_hash"
+fi
+
 message Verifying hashes
 
 make clean
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
