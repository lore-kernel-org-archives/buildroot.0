Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F29F1D1118E
	for <buildroot@archiver.kernel.org>; Sun,  3 Nov 2024 19:00:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9C4E581403;
	Sun,  3 Nov 2024 19:00:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3Wi2WsaImYeQ; Sun,  3 Nov 2024 19:00:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A3F1C8143A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A3F1C8143A;
	Sun,  3 Nov 2024 19:00:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 5B8D01128
 for <buildroot@buildroot.org>; Sun,  3 Nov 2024 19:00:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3CFA86059B
 for <buildroot@buildroot.org>; Sun,  3 Nov 2024 19:00:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id trpkdh35hIGd for <buildroot@buildroot.org>;
 Sun,  3 Nov 2024 19:00:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7ADE760598
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7ADE760598
 for <buildroot@buildroot.org>; Sun,  3 Nov 2024 19:00:24 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6586A85589; Sun,  3 Nov 2024 19:00:24 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sun, 3 Nov 2024 19:58:33 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 771da1dd9b209adfb27d2dd344a4b2fdcc8bacc4
X-Git-Newrev: c146555faa3fe563e9848be562d129d08f561d7f
X-Patchwork-Hint: ignore
Message-Id: <20241103190024.6586A85589@busybox.osuosl.org>
Subject: [Buildroot] [git commit] board/mender/x86_64/post-image-efi.sh: use
 bash for genimage.sh
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=c146555faa3fe563e9848be562d129d08f561d7f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

mender_x86_64_efi_defconfig started failing to build since 2024.08 in
our Gitlab-ci since the board/mender/x86_64/post-image-efi.sh is
calling support/scripts/genimage.sh with the host default shell.

There is no problem if the default shell is bash but our docker
image uses dash as default shell. Since support/scripts/genimage.sh
is actually a bash script it's not going to work if bashisms are used:

  support/scripts/genimage.sh: 57: Syntax error: redirection unexpected

Indeed bashisms have been added recently in
support/scripts/genimage.sh by the commit introducing bmap image
support [1].

Remove "sh" before support/scripts/genimage.sh and rely on
"/usr/bin/env bash" to find the bash interpreter.

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/8233226891

[1] 6889056f1eb4293de67c28b1ff6ee34be05d2ee4

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 board/mender/x86_64/post-image-efi.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/board/mender/x86_64/post-image-efi.sh b/board/mender/x86_64/post-image-efi.sh
index 073b18c972..ab12386076 100755
--- a/board/mender/x86_64/post-image-efi.sh
+++ b/board/mender/x86_64/post-image-efi.sh
@@ -54,7 +54,7 @@ generate_mender_image() {
 }
 
 generate_image() {
-    sh support/scripts/genimage.sh -c "${BOARD_DIR}/genimage-efi.cfg"
+    support/scripts/genimage.sh -c "${BOARD_DIR}/genimage-efi.cfg"
 }
 
 # Main function.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
