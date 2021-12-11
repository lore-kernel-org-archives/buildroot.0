Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52A3AC433EF
	for <buildroot@archiver.kernel.org>; Sat, 11 Dec 2021 19:55:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B8B104038E;
	Sat, 11 Dec 2021 19:55:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id giRDSyeLXCRq; Sat, 11 Dec 2021 19:55:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E475B40210;
	Sat, 11 Dec 2021 19:55:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7EA7E1BF414
 for <buildroot@lists.busybox.net>; Sat, 11 Dec 2021 19:55:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7AC5A60D71
 for <buildroot@lists.busybox.net>; Sat, 11 Dec 2021 19:55:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Y_l1knqxRTpO for <buildroot@lists.busybox.net>;
 Sat, 11 Dec 2021 19:55:36 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id BA03261377
 for <buildroot@buildroot.org>; Sat, 11 Dec 2021 19:55:36 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 95B53827FD; Sat, 11 Dec 2021 19:50:27 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sat, 11 Dec 2021 20:52:15 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 39424c2899e2d7ab53da4af09b9ce98175016bfb
X-Git-Newrev: 3942bb44e92bd8d53ea4a6b67c3ecf97c46c0981
X-Patchwork-Hint: ignore
Message-Id: <20211211195027.95B53827FD@busybox.osuosl.org>
Subject: [Buildroot] [git commit] Makefile: include *.patch in check-package
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

commit: https://git.buildroot.net/buildroot/commit/?id=3942bb44e92bd8d53ea4a6b67c3ecf97c46c0981
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since a long time, we have a check-package check for patches. Make sure
that this check runs in 'make check-package', by including *.patch in
the find expression.

There are still a number of patches without SoB, and these are not so
trivial to fix, so for now, disable the SoB check.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
[Ricardo: do not run check for SoB for now]
Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
---
 Makefile | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index c456cadafb..1e0e0927ee 100644
--- a/Makefile
+++ b/Makefile
@@ -1224,8 +1224,8 @@ check-flake8:
 	| xargs -- python3 -m flake8 --statistics
 
 check-package:
-	find $(TOPDIR) -type f \( -name '*.mk' -o -name '*.hash' -o -name 'Config.*' \) \
-		-exec ./utils/check-package {} +
+	find $(TOPDIR) -type f \( -name '*.mk' -o -name '*.hash' -o -name 'Config.*' -o -name '*.patch' \) \
+		-exec ./utils/check-package --exclude=Sob {} +
 
 include docs/manual/manual.mk
 -include $(foreach dir,$(BR2_EXTERNAL_DIRS),$(sort $(wildcard $(dir)/docs/*/*.mk)))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
