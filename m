Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1329AC433EF
	for <buildroot@archiver.kernel.org>; Sat, 23 Jul 2022 15:32:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A77344166D;
	Sat, 23 Jul 2022 15:32:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A77344166D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7NYv27nDDHX4; Sat, 23 Jul 2022 15:32:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AFAFF41669;
	Sat, 23 Jul 2022 15:32:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AFAFF41669
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2BAD91BF46A
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 15:31:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0684641669
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 15:31:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0684641669
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gjzYfkjMCDpl for <buildroot@lists.busybox.net>;
 Sat, 23 Jul 2022 15:31:43 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5582341666
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 15:31:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5582341666
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 3A9BD8469D; Sat, 23 Jul 2022 15:18:06 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 23 Jul 2022 17:31:28 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f9536761668f377a02d810a4a2029a692de58cb6
X-Git-Newrev: 650bc56a55f28ac66d0e4e9b566beaeaa8f6437d
X-Patchwork-Hint: ignore
Message-Id: <20220723151806.3A9BD8469D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gcc: switch to gcc 11.x as the
 default
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

commit: https://git.buildroot.net/buildroot/commit/?id=650bc56a55f28ac66d0e4e9b566beaeaa8f6437d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Even if gcc 10.x is still maintained for some time, switch to gcc 11.x
since it has been released since 2021-04-27 and gcc 12.x is available
since "2022-05-10".

We have been having toolchains in the autobuilders with gcc 11.x since
mid-June 2021, so the vast majority of the problems should have
already been solved.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gcc/Config.in.host | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index 4e906acc5b..3c9008bc9e 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -4,7 +4,7 @@ choice
 	prompt "GCC compiler Version"
 	default BR2_GCC_VERSION_ARC if BR2_arc
 	default BR2_GCC_VERSION_POWERPC_SPE if BR2_powerpc_SPE
-	default BR2_GCC_VERSION_10_X
+	default BR2_GCC_VERSION_11_X
 	help
 	  Select the version of gcc you wish to use.
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
