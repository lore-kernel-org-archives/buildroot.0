Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55231C19F2B
	for <buildroot@archiver.kernel.org>; Wed,  3 Aug 2022 20:56:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 02F5881775;
	Wed,  3 Aug 2022 20:56:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 02F5881775
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lbMxEer18bKx; Wed,  3 Aug 2022 20:56:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1BE4781444;
	Wed,  3 Aug 2022 20:56:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1BE4781444
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A54631BF3CA
 for <buildroot@lists.busybox.net>; Wed,  3 Aug 2022 20:56:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 88E50401C9
 for <buildroot@lists.busybox.net>; Wed,  3 Aug 2022 20:56:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 88E50401C9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JNYj690_tDQY for <buildroot@lists.busybox.net>;
 Wed,  3 Aug 2022 20:56:10 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 78D6F401B6
 for <buildroot@buildroot.org>; Wed,  3 Aug 2022 20:56:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 78D6F401B6
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 8F53D86E0B; Wed,  3 Aug 2022 20:42:07 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed, 3 Aug 2022 22:55:53 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 88e95a36cd210c19bd9f26794c157cb845d65275
X-Git-Newrev: 7d0d3987e921e24f46db11590cf27d6bd5780d00
X-Patchwork-Hint: ignore
Message-Id: <20220803204207.8F53D86E0B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] Makefile: ignore *.orig and *.rej in
 check-package target
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

commit: https://git.buildroot.net/buildroot/commit/?id=7d0d3987e921e24f46db11590cf27d6bd5780d00
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When one is applying patches, it is pretty common to end up with .orig
and/or .rej files lying around. Unfortunately, our 'Config.*' match in
check-package ends up matching those files, causing false positives
when running "make check-package". To avoid this, this commit
excludes *.orig and *.rej files for the find logic used in the
check-package target.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Makefile b/Makefile
index 5f266e36b2..14b7ecd475 100644
--- a/Makefile
+++ b/Makefile
@@ -1253,6 +1253,7 @@ check-flake8:
 
 check-package:
 	find $(TOPDIR) -type f \( -name '*.mk' -o -name '*.hash' -o -name 'Config.*' -o -name '*.patch' \) \
+		-a -not -name '*.orig' -a -not -name '*.rej' \
 		-exec ./utils/check-package --exclude=Sob {} +
 
 include docs/manual/manual.mk
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
