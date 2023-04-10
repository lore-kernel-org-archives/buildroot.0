Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A62A8C76196
	for <buildroot@archiver.kernel.org>; Mon, 10 Apr 2023 13:37:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 00A2340B82;
	Mon, 10 Apr 2023 13:37:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 00A2340B82
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Flw7RpXsZ5DA; Mon, 10 Apr 2023 13:37:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3BF8E40B7D;
	Mon, 10 Apr 2023 13:37:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3BF8E40B7D
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4DA581C3B46
 for <buildroot@lists.busybox.net>; Mon, 10 Apr 2023 13:37:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2F02681EC7
 for <buildroot@lists.busybox.net>; Mon, 10 Apr 2023 13:37:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2F02681EC7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id z7jNgtOl2_4p for <buildroot@lists.busybox.net>;
 Mon, 10 Apr 2023 13:37:52 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id DA33781ECA
 for <buildroot@buildroot.org>; Mon, 10 Apr 2023 13:37:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DA33781ECA
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C734D8396B; Mon, 10 Apr 2023 13:37:52 +0000 (UTC)
From: Arnout Vandecappelle <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 10 Apr 2023 15:34:00 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 19c4b1b069e08e8195cccfae2d3b558fbc98eaf2
X-Git-Newrev: abff5246a78e0adaf6c75b722a85fed891c3f8b1
X-Patchwork-Hint: ignore
Message-Id: <20230410133752.C734D8396B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] .checkpackageignore: update properly
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

commit: https://git.buildroot.net/buildroot/commit/?id=abff5246a78e0adaf6c75b722a85fed891c3f8b1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When we updated .checkpackageignore in commit 29d6f319a, this was done
using a different version of shellcheck, that apparently detects some
additional issues. Thus,
board/terasic/de10nano_cyclone5/barebox-env/boot/mmc was detected as
containing shellcheck errors. However this doesn't happen with the
version in CI, leading to "Shellcheck was expected to fail" errors.

Re-generate .checkpackageignore under docker-run, like it should have
been done to begin with.

Fixes: 29d6f319a0aed8ebad6bb3aef18b13479886aa54
Fixes: https://gitlab.com/buildroot.org/buildroot/-/jobs/4084485150

Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 .checkpackageignore | 1 -
 1 file changed, 1 deletion(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 81ca4d8de9..37214d6424 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -78,7 +78,6 @@ board/stmicroelectronics/stm32f469-disco/flash_xip.sh Shellcheck
 board/stmicroelectronics/stm32f469-disco/post-build.sh Shellcheck
 board/synopsys/axs10x/post-build.sh Shellcheck
 board/technologic/ts4900/post-image.sh Shellcheck
-board/terasic/de10nano_cyclone5/barebox-env/boot/mmc Shellcheck
 board/toradex/apalis-imx6/post-image.sh Shellcheck
 board/udoo/common/post-build.sh Shellcheck
 board/versal/post-build.sh Shellcheck
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
