Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92C9AC6FA82
	for <buildroot@archiver.kernel.org>; Thu, 22 Sep 2022 12:41:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 21FC440C12;
	Thu, 22 Sep 2022 12:41:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 21FC440C12
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5qyPbiW-bs4F; Thu, 22 Sep 2022 12:41:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3F23E40477;
	Thu, 22 Sep 2022 12:41:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3F23E40477
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 914431BF2CE
 for <buildroot@lists.busybox.net>; Thu, 22 Sep 2022 12:41:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7A27D83231
 for <buildroot@lists.busybox.net>; Thu, 22 Sep 2022 12:41:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7A27D83231
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GFztbK7V6ZlG for <buildroot@lists.busybox.net>;
 Thu, 22 Sep 2022 12:41:28 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id A984F83155
 for <buildroot@buildroot.org>; Thu, 22 Sep 2022 12:41:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A984F83155
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 983D685E20; Thu, 22 Sep 2022 12:41:28 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 22 Sep 2022 14:39:15 +0200
X-Git-Refname: refs/heads/2022.08.x
X-Git-Oldrev: 84882c4273245857480637170c5474e63ed56892
X-Git-Newrev: f5fcd64dfcf0a3133cde0a90909cac1f2ef84d70
X-Patchwork-Hint: ignore
Message-Id: <20220922124128.983D685E20@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.08.x] package/rtl8723ds: fix
 build failure due to missing Linux CONFIG_MMC
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

commit: https://git.buildroot.net/buildroot/commit/?id=f5fcd64dfcf0a3133cde0a90909cac1f2ef84d70
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.08.x

This Wi-Fi module has an SDIO interface so we need to make sure Linux
has CONFIG_MMC (that include SDIO APIs) enabled.

Fixes:

  http://autobuild.buildroot.net/results/1bb71019b7edd7f195223a85c81f70e5a60518f0/

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 80323a534b12803fa25d55e3c5e2c8a527ca5863)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/rtl8723ds/rtl8723ds.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/rtl8723ds/rtl8723ds.mk b/package/rtl8723ds/rtl8723ds.mk
index da25ffe9a7..8598f906a9 100644
--- a/package/rtl8723ds/rtl8723ds.mk
+++ b/package/rtl8723ds/rtl8723ds.mk
@@ -17,6 +17,7 @@ define RTL8723DS_LINUX_CONFIG_FIXUPS
 	$(call KCONFIG_ENABLE_OPT,CONFIG_NET)
 	$(call KCONFIG_ENABLE_OPT,CONFIG_WIRELESS)
 	$(call KCONFIG_ENABLE_OPT,CONFIG_CFG80211)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_MMC)
 endef
 
 $(eval $(kernel-module))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
