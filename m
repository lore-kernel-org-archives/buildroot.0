Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FF65C433F5
	for <buildroot@archiver.kernel.org>; Sun,  9 Jan 2022 10:09:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E906A81656;
	Sun,  9 Jan 2022 10:09:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1d3A3I-GfyEm; Sun,  9 Jan 2022 10:09:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 470F581465;
	Sun,  9 Jan 2022 10:08:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A6A1C1BF4DD
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 10:08:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 94AC981465
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 10:08:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CAk9GLPIEcOe for <buildroot@lists.busybox.net>;
 Sun,  9 Jan 2022 10:08:56 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id CA7D781460
 for <buildroot@buildroot.org>; Sun,  9 Jan 2022 10:08:56 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 803BA82B60; Sun,  9 Jan 2022 10:02:42 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sun, 9 Jan 2022 11:07:37 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5e78e7e97d772124f0d31653aca33731abe5b4db
X-Git-Newrev: bfd1a31d0e590c8545df7159a9e61febbd220370
X-Patchwork-Hint: ignore
Message-Id: <20220109100242.803BA82B60@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/download/go-post-process: drop -o
 pipefail
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

commit: https://git.buildroot.net/buildroot/commit/?id=bfd1a31d0e590c8545df7159a9e61febbd220370
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This breaks the post_process_unpack() function in
support/download/helpers, which had a sequence of pipe, with "head"
that can abort early and cause the pipe to fail.

Fixes intermitent:

make[1]: *** [package/pkg-generic.mk:190: /builds/tpetazzoni/buildroot/test-output/TestDockerCompose/build/containerd-1.5.8/.stamp_downloaded] Error 141

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/download/go-post-process | 1 -
 1 file changed, 1 deletion(-)

diff --git a/support/download/go-post-process b/support/download/go-post-process
index be202a4c0f..ef96a76948 100755
--- a/support/download/go-post-process
+++ b/support/download/go-post-process
@@ -1,7 +1,6 @@
 #!/usr/bin/env bash
 
 set -e
-set -o pipefail
 
 . "${0%/*}/helpers"
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
