Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2769C636D6
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 22:44:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A5100417CE;
	Mon, 20 Feb 2023 22:44:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A5100417CE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WqFBbOUnXiZb; Mon, 20 Feb 2023 22:44:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8BB634F2AB;
	Mon, 20 Feb 2023 22:44:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8BB634F2AB
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0B0D01BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:55:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C19CB416DF
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C19CB416DF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2PxjaQ620Q68 for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:16 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0586F41194
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0586F41194
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 032C286495; Mon, 20 Feb 2023 20:52:16 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 27 Dec 2022 21:03:28 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 9a58d1aa9eb3a83d07fd445875c79722b609a78b
X-Git-Newrev: 1df9d42bdd8cc2e594d6337ee62c3f31499baf80
X-Patchwork-Hint: ignore
Message-Id: <20230220205216.032C286495@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/fmlib: fix build for
 ppc e500mc
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

commit: https://git.buildroot.net/buildroot/commit/?id=1df9d42bdd8cc2e594d6337ee62c3f31499baf80
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

When BR2_powerpc_e500mc=y, fmlib package compilation fails with output:

    make[2]: *** No rule to make target 'libfm-e500mc.a'.  Stop.

The fmlib package "make help" command shows:

    The available make libfm-<arch>.a targets are:
	    libfm-ppce500mc.a		(P2, P3, P4)
    ...

The package Config.in incorrectly sets BR2_PACKAGE_FMLIB_ARCHTYPE
to "e500mc", which is then passed as the package make target.
The correct value should be "ppce500mc".

The commit fixes this build issue.

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/fmlib/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/fmlib/Config.in b/package/fmlib/Config.in
index df4ae440ea..7bccfd7c83 100644
--- a/package/fmlib/Config.in
+++ b/package/fmlib/Config.in
@@ -37,7 +37,7 @@ endchoice
 
 config BR2_PACKAGE_FMLIB_ARCHTYPE
 	string
-	default "e500mc" if BR2_powerpc_e500mc
+	default "ppce500mc" if BR2_powerpc_e500mc
 	default "ppc64e6500" if BR2_powerpc_e6500 && BR2_powerpc64
 	default "ppc32e6500" if BR2_powerpc_e6500 && BR2_powerpc
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
