Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12E7CC3DA4B
	for <buildroot@archiver.kernel.org>; Fri, 12 Jul 2024 12:38:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 84C4861316;
	Fri, 12 Jul 2024 12:38:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kt5N5vJKqOKC; Fri, 12 Jul 2024 12:38:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 29D6B611B9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 29D6B611B9;
	Fri, 12 Jul 2024 12:38:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4EC351BF997
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 12:38:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3888340402
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 12:38:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YxehXb9vW9Vi for <buildroot@lists.busybox.net>;
 Fri, 12 Jul 2024 12:38:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 48132403D2
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 48132403D2
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 12:38:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2FE3885E00; Fri, 12 Jul 2024 12:38:47 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 12 Jul 2024 14:34:57 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: afece24a72728621449e45deeecae520e55c847f
X-Git-Newrev: 881a8f13465b1be19540f6e35f2a658d49f63dd7
X-Patchwork-Hint: ignore
Message-Id: <20240712123847.2FE3885E00@busybox.osuosl.org>
Subject: [Buildroot] [git commit] utils/genrandconfig: stop passing
 --passive-ftp to wget
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=881a8f13465b1be19540f6e35f2a658d49f63dd7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since we no longer use WGET to retrieve FTP-hosted files, we can drop
the --passive-ftp option from genrandconfig, as it would cause
problems on systems that use wget2.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 utils/genrandconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/utils/genrandconfig b/utils/genrandconfig
index dbde656417..66b7a87311 100755
--- a/utils/genrandconfig
+++ b/utils/genrandconfig
@@ -676,7 +676,7 @@ async def gen_config(args):
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
