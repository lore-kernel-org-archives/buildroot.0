Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A83DCCA470
	for <buildroot@archiver.kernel.org>; Thu,  9 Oct 2025 10:06:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 215A961241;
	Thu,  9 Oct 2025 10:06:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DRtXrLkyZu2Q; Thu,  9 Oct 2025 10:06:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 45B60612D1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 45B60612D1;
	Thu,  9 Oct 2025 10:06:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 02B92119
 for <buildroot@buildroot.org>; Thu,  9 Oct 2025 10:06:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1798161206
 for <buildroot@buildroot.org>; Thu,  9 Oct 2025 10:06:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fvsUUR7wScyt for <buildroot@buildroot.org>;
 Thu,  9 Oct 2025 10:06:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E1D84611F8
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id E1D84611F8
 for <buildroot@buildroot.org>; Thu,  9 Oct 2025 10:06:23 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E055D86D26; Thu,  9 Oct 2025 10:06:23 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 9 Oct 2025 08:40:44 +0200
X-Git-Refname: refs/heads/2025.05.x
X-Git-Oldrev: eb03d9ea7170ba3f6aee12f0e0ba2cd61f2428df
X-Git-Newrev: d9a062a664ee64aeb47793f872348d2c6cdb45f3
X-Patchwork-Hint: ignore
Message-Id: <20251009100623.E055D86D26@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.05.x] board/versal/post-image:
 remove unnecessary mkdir
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

commit: https://git.buildroot.net/buildroot/commit/?id=d9a062a664ee64aeb47793f872348d2c6cdb45f3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.05.x

The board/versal/post-image.sh script has an unnecessary mkdir command:
mkdir -p "${BINARIES_DIR}"

This directory is created before calling the post image scripts,
in [1].

Just above the command, the script is making a symlink for the Linux DTB in
the ${BINARIES_DIR}, so if the ${BINARIES_DIR} did not already exist with
images inside, the script would fail regardless of whether this mkdir is
executed or not.

For this reason, remove the mkdir call from the script because it is not
necessary.

[1] https://gitlab.com/buildroot.org/buildroot/-/blob/2025.08/Makefile#L829

Signed-off-by: Neal Frager <neal.frager@amd.com>
[Julien: add a link showing where the directory is created]
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 018cf24c80090f1ef091ce1ac0d4a0a1dab3bec3)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 board/versal/post-image.sh | 1 -
 1 file changed, 1 deletion(-)

diff --git a/board/versal/post-image.sh b/board/versal/post-image.sh
index 22367d5028..6e59c57a3b 100755
--- a/board/versal/post-image.sh
+++ b/board/versal/post-image.sh
@@ -12,7 +12,6 @@ FIRST_DT=$(sed -nr \
 
 BOARD_DIR="$(dirname "$0")"
 
-mkdir -p "${BINARIES_DIR}"
 cat <<-__HEADER_EOF > "${BINARIES_DIR}/bootgen.bif"
 	the_ROM_image:
 	{
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
