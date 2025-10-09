Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF968CCD188
	for <buildroot@archiver.kernel.org>; Thu,  9 Oct 2025 09:56:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9E298612C5;
	Thu,  9 Oct 2025 09:56:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8SVasGubaRaz; Thu,  9 Oct 2025 09:56:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0469D612CA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0469D612CA;
	Thu,  9 Oct 2025 09:56:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 45D6221B
 for <buildroot@buildroot.org>; Thu,  9 Oct 2025 09:55:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DA1CC40FA4
 for <buildroot@buildroot.org>; Thu,  9 Oct 2025 09:55:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4vcfr2U-QM-y for <buildroot@buildroot.org>;
 Thu,  9 Oct 2025 09:55:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2BEDA40FA6
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2BEDA40FA6
 for <buildroot@buildroot.org>; Thu,  9 Oct 2025 09:55:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 29EA08643E; Thu,  9 Oct 2025 09:55:40 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 9 Oct 2025 08:40:46 +0200
X-Git-Refname: refs/heads/2025.08.x
X-Git-Oldrev: 4a32494015ad4a1af80c350a8e6d7076c65c97a8
X-Git-Newrev: e4ec6da23e8423d9b39bfa9e3909b5bf176dca30
X-Patchwork-Hint: ignore
Message-Id: <20251009095540.29EA08643E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.08.x] board/versal/post-image:
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

commit: https://git.buildroot.net/buildroot/commit/?id=e4ec6da23e8423d9b39bfa9e3909b5bf176dca30
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.08.x

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
index b5ce2e3f0c..3242e4384a 100755
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
