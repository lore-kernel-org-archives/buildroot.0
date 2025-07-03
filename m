Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 014A6C83F09
	for <buildroot@archiver.kernel.org>; Fri,  4 Jul 2025 06:25:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C86EA81E40;
	Fri,  4 Jul 2025 06:25:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NmCD0PDF43ax; Fri,  4 Jul 2025 06:25:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 24B0283D18
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 24B0283D18;
	Fri,  4 Jul 2025 06:25:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 82B9E1EB
 for <buildroot@buildroot.org>; Fri,  4 Jul 2025 06:24:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 478054104D
 for <buildroot@buildroot.org>; Fri,  4 Jul 2025 06:24:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id n6ChXpksy8lu for <buildroot@buildroot.org>;
 Fri,  4 Jul 2025 06:24:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 913A341050
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 913A341050
 for <buildroot@buildroot.org>; Fri,  4 Jul 2025 06:24:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8F1DE85E09; Fri,  4 Jul 2025 06:24:32 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 3 Jul 2025 10:53:59 +0200
X-Git-Refname: refs/heads/2025.05.x
X-Git-Oldrev: 9b21865469b2d4ac929704a2fd9b4d8b68c01fcf
X-Git-Newrev: 32df10e8ff550432fc0104e7311ae98d82dc3ebd
X-Patchwork-Hint: ignore
Message-Id: <20250704062432.8F1DE85E09@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.05.x] board/freescale/mxs: fix
 Linux booting
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=32df10e8ff550432fc0104e7311ae98d82dc3ebd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.05.x

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
(cherry picked from commit 50297207a83cf7640e5cc3ed3500ffb807155bf2)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
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
