Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22DE1C3DA49
	for <buildroot@archiver.kernel.org>; Sun, 28 Jul 2024 11:08:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E8165403C7;
	Sun, 28 Jul 2024 11:08:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ufsISg1iTpZw; Sun, 28 Jul 2024 11:08:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E32E24056C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E32E24056C;
	Sun, 28 Jul 2024 11:08:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D51881BF471
 for <buildroot@lists.busybox.net>; Sun, 28 Jul 2024 11:07:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D30CB403CD
 for <buildroot@lists.busybox.net>; Sun, 28 Jul 2024 11:07:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yPmo_RQFyasU for <buildroot@lists.busybox.net>;
 Sun, 28 Jul 2024 11:07:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D6C95403E2
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id D6C95403E2
 for <buildroot@buildroot.org>; Sun, 28 Jul 2024 11:07:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C4D4A87565; Sun, 28 Jul 2024 11:07:35 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 28 Jul 2024 13:01:15 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: dd6fcca3365805069f2476211defd90df793b578
X-Git-Newrev: 5098b29472c20a7f39d0ca715e7a0c321e12474d
X-Patchwork-Hint: ignore
Message-Id: <20240728110735.C4D4A87565@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] utils/genrandconfig: stop
 passing --passive-ftp to wget
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

commit: https://git.buildroot.net/buildroot/commit/?id=5098b29472c20a7f39d0ca715e7a0c321e12474d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Since there are no more packages using FTP-hosted files, we can drop
the --passive-ftp option from genrandconfig, as it would cause
problems on systems that use wget2.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 881a8f13465b1be19540f6e35f2a658d49f63dd7)
[Peter: slightly reword commit message, no curl backend here]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 utils/genrandconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/utils/genrandconfig b/utils/genrandconfig
index 5796bbaa0f..63943eafe9 100755
--- a/utils/genrandconfig
+++ b/utils/genrandconfig
@@ -681,7 +681,7 @@ async def gen_config(args):
         configlines += minimalf.readlines()
 
     # Allow hosts with old certificates to download over https
-    configlines.append("BR2_WGET=\"wget --passive-ftp -nd -t 3 --no-check-certificate\"\n")
+    configlines.append("BR2_WGET=\"wget -nd -t 3 --no-check-certificate\"\n")
 
     # Per-package folder
     if randint(0, 15) == 0:
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
