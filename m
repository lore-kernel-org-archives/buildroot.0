Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 278D0C7EE32
	for <buildroot@archiver.kernel.org>; Sat, 28 Jun 2025 10:07:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3C026417D0;
	Sat, 28 Jun 2025 10:07:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ol-mYYkqV91C; Sat, 28 Jun 2025 10:07:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BAEDB4080F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BAEDB4080F;
	Sat, 28 Jun 2025 10:07:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1E9821C9
 for <buildroot@buildroot.org>; Sat, 28 Jun 2025 10:07:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A693880754
 for <buildroot@buildroot.org>; Sat, 28 Jun 2025 10:07:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2gy4t63pR2dF for <buildroot@buildroot.org>;
 Sat, 28 Jun 2025 10:07:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E10CF8075C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id E10CF8075C
 for <buildroot@buildroot.org>; Sat, 28 Jun 2025 10:07:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D0AD6844D9; Sat, 28 Jun 2025 10:07:43 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 28 Jun 2025 12:03:53 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b3b22564d6fcebcdb66a155311086cae91dc92a1
X-Git-Newrev: 50297207a83cf7640e5cc3ed3500ffb807155bf2
X-Patchwork-Hint: ignore
Message-Id: <20250628100743.D0AD6844D9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] board/freescale/mxs: fix Linux booting
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=50297207a83cf7640e5cc3ed3500ffb807155bf2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Actually DTB_LIST accepts only file and not files with relative path
preprended. This leads to have vfat without .dtb files and so Linux
doesn't start. Let's fix this by including slash in sed command as done
for mxc as well as basename in front of $dt.dtb to remove possible
useless folders present in the dts path. Let's also add set -e at the
top of the script to make it more verbose on error and modify this
section according to spellcheck as done for mxc.

This commit align this "mxs/post-image.sh" with its "imx/post-image.sh"
counterpart which was improved for arm64 in commit [1].

[1] https://gitlab.com/buildroot.org/buildroot/-/commit/4755bf2bd43a7b4c3bf4f88be790240a01b3116f

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
[Julien:
 - change space indentation to tabs for consistency
 - add note in commit log about imx/post-image.sh
]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 board/freescale/common/mxs/post-image.sh | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/board/freescale/common/mxs/post-image.sh b/board/freescale/common/mxs/post-image.sh
index 0bfb835c6e..97c8ee9079 100755
--- a/board/freescale/common/mxs/post-image.sh
+++ b/board/freescale/common/mxs/post-image.sh
@@ -1,5 +1,7 @@
 #!/usr/bin/env bash
 
+set -e
+
 #
 # dtb_list extracts the list of DTB files from BR2_LINUX_KERNEL_INTREE_DTS_NAME
 # in ${BR_CONFIG}, then prints the corresponding list of file names for the
@@ -7,10 +9,12 @@
 #
 dtb_list()
 {
-	local DTB_LIST="$(sed -n 's/^BR2_LINUX_KERNEL_INTREE_DTS_NAME="\([a-z0-9 \-]*\)"$/\1/p' ${BR2_CONFIG})"
+	local DTB_LIST
+
+	DTB_LIST="$(sed -n 's/^BR2_LINUX_KERNEL_INTREE_DTS_NAME="\([\/a-z0-9 \-]*\)"$/\1/p' "${BR2_CONFIG}")"
 
 	for dt in $DTB_LIST; do
-		echo -n "\"$dt.dtb\", "
+		echo -n "\"$(basename "${dt}").dtb\", "
 	done
 }
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
