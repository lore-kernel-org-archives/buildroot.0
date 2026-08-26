Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FC0FC5DF97
	for <buildroot@archiver.kernel.org>; Wed, 26 Aug 2026 15:52:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3C6E040514;
	Wed, 26 Aug 2026 15:52:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jCExOMdijn4W; Wed, 26 Aug 2026 15:52:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787759523;
	bh=veErZ/xfNQf3GAHyO5HW1/UC8K5nAZU99SHpQoDiwnQ=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=lj7QR5N1KBhAe3389S/Z0UPBDnoQhZZ6PA25MqAHuhRlR/Puu+4iskGt3qZGioveH
	 icnZg/O8h6VKuFzdy7GPnpNCHDOsVxF9N1VRp7Tz+kIwMvs+vBLaLI/CzIi41OLS10
	 MlFvWoGQGbxnmUXa6+p6BtQTXY2ZWmoZFabK4gfY6sTHF5Y+MqVZemBcglAX7lz1Cf
	 NAeIMsNp/gvhdClBgj7yG4VIHLLBggyAme2ZAJtDtf9DVvjyyUd9ddirHNE7HBNzZT
	 ghqRV+keZTVvzx7m50VyVFfeiaonezrdnN8Wf22DY+ZRaZvts7Tn4zNMp60EaSD5vx
	 5PrwdWg1ptIVA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6530C40536;
	Wed, 26 Aug 2026 15:52:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 22A64323
 for <buildroot@buildroot.org>; Wed, 26 Aug 2026 15:52:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 08CF16067F
 for <buildroot@buildroot.org>; Wed, 26 Aug 2026 15:52:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hgbNPUFqePRy for <buildroot@buildroot.org>;
 Wed, 26 Aug 2026 15:52:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 38B1D605F4
 for <buildroot@buildroot.org>; Wed, 26 Aug 2026 15:52:00 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id E42131A1842
 for <buildroot@buildroot.org>; Wed, 26 Aug 2026 15:51:57 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id B9241604EC
 for <buildroot@buildroot.org>; Wed, 26 Aug 2026 15:51:57 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id DD54111C783D1; 
 Wed, 26 Aug 2026 17:51:56 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 26 Aug 2026 17:51:54 +0200
Message-ID: <20260826155155.4146765-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Subject: [Buildroot] [PATCH] utils/genrandconfig: always use BR2_BACKUP_SITE
 in the autobuilders
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In commit da5c25c9f91b17a3c00ff0b35164881f2d1aa425, we decided to
generate 10% of configurations without BR2_BACKUP_SITE to test
upstream locations and see if they fail.

In recent times, we have seen a significant increase of temporary
failures of upstream locations, which cause build failures for which
there is not much we can do. They cause noise in the build results and
consume autobuilders CPU time for builds that don't lead to any useful
conclusion.

So in the end let's revert back to using BR2_BACKUP_SITE in all
configurations to avoid those build failures. If we want to detect
really stale upstream locations, as suggested by Arnout, we can
instrument the autobuilder runs to inject a special HTTP header and
then look at the logs of sources.buildroot.net to see which files are
grabbed by the autobuilders and determine if upstream locations are
really dead and packages need to be fixed accordingly.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
Note: this is a proposal. If accepted, it should be merged into all
branches currently tested by autobuild.buildroot.org.
---
 utils/genrandconfig | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/utils/genrandconfig b/utils/genrandconfig
index 727c8193c4..fad3a20786 100755
--- a/utils/genrandconfig
+++ b/utils/genrandconfig
@@ -556,11 +556,6 @@ async def gen_config(args):
         configlines.append("BR2_REPRODUCIBLE=y\n")
         configlines.append("BR2_TARGET_ROOTFS_TAR=y\n")
 
-    # From time to time, ignore sources.buildroot.net to really fetch
-    # from upstream
-    if randint(0, 1) == 0:
-        configlines.append("""BR2_BACKUP_SITE=""\n""")
-
     with open(configfile, "a") as configf:
         configf.writelines(configlines)
 
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
