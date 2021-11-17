Return-Path: <SRS0=Sygv=QE=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56F3AC433EF
	for <buildroot@archiver.kernel.org>; Wed, 17 Nov 2021 22:04:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1780561288
	for <buildroot@archiver.kernel.org>; Wed, 17 Nov 2021 22:04:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1780561288
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DCA01405E1;
	Wed, 17 Nov 2021 22:04:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uMmfeQvbQ4r9; Wed, 17 Nov 2021 22:04:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 43E1D40581;
	Wed, 17 Nov 2021 22:04:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3B5B81BF2FA
 for <buildroot@lists.busybox.net>; Wed, 17 Nov 2021 22:04:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 37F6A60A97
 for <buildroot@lists.busybox.net>; Wed, 17 Nov 2021 22:04:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jjxS_hTX1vuW for <buildroot@lists.busybox.net>;
 Wed, 17 Nov 2021 22:04:32 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9A2FB60809
 for <buildroot@buildroot.org>; Wed, 17 Nov 2021 22:04:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 88B178D600; Wed, 17 Nov 2021 22:00:18 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 17 Nov 2021 23:03:28 +0100
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: 77bcdf3dd1460aba5ae8aa371e3c47197f161cda
X-Git-Newrev: 60c852d62700e8f36ffc7381b80d81e5966f86db
X-Patchwork-Hint: ignore
Message-Id: <20211117220018.88B178D600@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] support/pkg-stats:
 support values with an equal sign in them
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

commit: https://git.buildroot.net/buildroot/commit/?id=60c852d62700e8f36ffc7381b80d81e5966f86db
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

The heuristic to extract the various variables of interest is pretty
crude: we filter on variables ending with certain suffixes (like
'%_VERSION' to get the version strings).

However, in doing so, we may dump variables that are not actual package
versions (especially with br2-external trees), and those may contain one
or more equal sign.  And anyway, an actual package version string may
very well contain an equal sign too.

But the current situation is that the output of 'printvars' is split on
all equal signs, which will not fit in the 2-tuple we assign the result,
thus causing an exception.

Fix that by limiting to a single split.

Reported-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit b919d5dbbae136e08b6a7644c608ec61b6ad47af)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/scripts/pkg-stats | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index b182fce605..4e7f27c3a3 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -377,7 +377,7 @@ def package_init_make_info():
 
     for item in variable_list:
         # Get variable name and value
-        pkgvar, value = item.split("=")
+        pkgvar, value = item.split("=", maxsplit=1)
 
         # Strip the suffix according to the variable
         if pkgvar.endswith("_LICENSE"):
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
