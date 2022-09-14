Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 649B1ECAAD8
	for <buildroot@archiver.kernel.org>; Wed, 14 Sep 2022 09:38:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1C9D681340;
	Wed, 14 Sep 2022 09:38:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1C9D681340
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id okYf7MN5MLbY; Wed, 14 Sep 2022 09:38:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1D11B812D5;
	Wed, 14 Sep 2022 09:38:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1D11B812D5
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CA6471BF355
 for <buildroot@lists.busybox.net>; Wed, 14 Sep 2022 09:38:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A32F84024B
 for <buildroot@lists.busybox.net>; Wed, 14 Sep 2022 09:38:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A32F84024B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FXZN40KDs_3n for <buildroot@lists.busybox.net>;
 Wed, 14 Sep 2022 09:38:08 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2F9C140276
 for <buildroot@buildroot.org>; Wed, 14 Sep 2022 09:38:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2F9C140276
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 0CA2483900; Wed, 14 Sep 2022 09:38:08 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 14 Sep 2022 11:35:29 +0200
X-Git-Refname: refs/heads/2022.05.x
X-Git-Oldrev: 3443db75b0f0dbd668b789490f486b352179c907
X-Git-Newrev: 8c7c750fc8f1bc4534cd17c3db7d5986719d286c
X-Patchwork-Hint: ignore
Message-Id: <20220914093808.0CA2483900@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.05.x] Makefile: ignore *.orig
 and *.rej in check-package target
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

commit: https://git.buildroot.net/buildroot/commit/?id=8c7c750fc8f1bc4534cd17c3db7d5986719d286c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.05.x

When one is applying patches, it is pretty common to end up with .orig
and/or .rej files lying around. Unfortunately, our 'Config.*' match in
check-package ends up matching those files, causing false positives
when running "make check-package". To avoid this, this commit
excludes *.orig and *.rej files for the find logic used in the
check-package target.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 7d0d3987e921e24f46db11590cf27d6bd5780d00)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Makefile b/Makefile
index e8a4703a51..093fbb660c 100644
--- a/Makefile
+++ b/Makefile
@@ -1254,6 +1254,7 @@ check-flake8:
 
 check-package:
 	find $(TOPDIR) -type f \( -name '*.mk' -o -name '*.hash' -o -name 'Config.*' -o -name '*.patch' \) \
+		-a -not -name '*.orig' -a -not -name '*.rej' \
 		-exec ./utils/check-package --exclude=Sob {} +
 
 include docs/manual/manual.mk
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
