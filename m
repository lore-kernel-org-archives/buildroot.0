Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 876CDECAAD8
	for <buildroot@archiver.kernel.org>; Wed, 14 Sep 2022 09:41:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B0C82819F3;
	Wed, 14 Sep 2022 09:41:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B0C82819F3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UyIFHDIVoeQV; Wed, 14 Sep 2022 09:41:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C8EC4812A5;
	Wed, 14 Sep 2022 09:41:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C8EC4812A5
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 74DBE1BF355
 for <buildroot@lists.busybox.net>; Wed, 14 Sep 2022 09:40:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 50EC660BBC
 for <buildroot@lists.busybox.net>; Wed, 14 Sep 2022 09:40:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 50EC660BBC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id s3iRjIcXPidV for <buildroot@lists.busybox.net>;
 Wed, 14 Sep 2022 09:40:44 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id DD74260BBF
 for <buildroot@buildroot.org>; Wed, 14 Sep 2022 09:40:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DD74260BBF
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id CB56483918; Wed, 14 Sep 2022 09:40:44 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 14 Sep 2022 11:35:34 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: c47f728a78a54eb9f8c0e5df9029fddace8af32b
X-Git-Newrev: f66f51b6c68b74e91ccde2eebf57e40c5e7ba582
X-Patchwork-Hint: ignore
Message-Id: <20220914094044.CB56483918@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] Makefile: ignore *.orig
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

commit: https://git.buildroot.net/buildroot/commit/?id=f66f51b6c68b74e91ccde2eebf57e40c5e7ba582
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

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
index aa6c11acec..2b4d927445 100644
--- a/Makefile
+++ b/Makefile
@@ -1256,6 +1256,7 @@ check-flake8:
 
 check-package:
 	find $(TOPDIR) -type f \( -name '*.mk' -o -name '*.hash' -o -name 'Config.*' -o -name '*.patch' \) \
+		-a -not -name '*.orig' -a -not -name '*.rej' \
 		-exec ./utils/check-package --exclude=Sob {} +
 
 include docs/manual/manual.mk
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
