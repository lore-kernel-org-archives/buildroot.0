Return-Path: <SRS0=2pYX=NR=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73E8DC432BE
	for <buildroot@archiver.kernel.org>; Thu, 26 Aug 2021 06:11:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1717D60F91
	for <buildroot@archiver.kernel.org>; Thu, 26 Aug 2021 06:11:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1717D60F91
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=tkos.co.il
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C9D58406CD;
	Thu, 26 Aug 2021 06:11:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hHYSHy_yAMDM; Thu, 26 Aug 2021 06:11:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 16BFB40209;
	Thu, 26 Aug 2021 06:11:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 45A931BF31E
 for <buildroot@lists.busybox.net>; Thu, 26 Aug 2021 06:10:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2CFC680DE4
 for <buildroot@lists.busybox.net>; Thu, 26 Aug 2021 06:10:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Dm08Ubu_ujGq for <buildroot@lists.busybox.net>;
 Thu, 26 Aug 2021 06:10:46 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mx.tkos.co.il (guitar.tcltek.co.il [192.115.133.116])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 77DDC818DC
 for <buildroot@busybox.net>; Thu, 26 Aug 2021 06:10:46 +0000 (UTC)
Received: from tarshish.tkos.co.il (unknown [10.0.8.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx.tkos.co.il (Postfix) with ESMTPS id 44AEA440E83;
 Thu, 26 Aug 2021 09:10:34 +0300 (IDT)
From: Baruch Siach <baruch@tkos.co.il>
To: buildroot@busybox.net
Date: Thu, 26 Aug 2021 09:10:36 +0300
Message-Id: <5293a67121d1cc996d6cd48bc15e2fc29d45e1a7.1629958236.git.baruch@tkos.co.il>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <916c37d1fe52b9fd6b14eed9b68e4edb5801234e.1629958236.git.baruch@tkos.co.il>
References: <916c37d1fe52b9fd6b14eed9b68e4edb5801234e.1629958236.git.baruch@tkos.co.il>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/2] package/mtd: ubihealthd needs kernel 3.17+
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Matt Weber <matthew.weber@collins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

ubihealthd requires getrandom(2) that was introduced in kernel version
3.17. ubihealthd does not build when getrandom(2) is not detected, so
the following installation step fails.

Technically the dependency should also be on glibc version 2.25+. But we
have no way to depend on glibc versions of external toolchains.
Toolchain built with kernel headers older than 3.17 can build
ubihealthd, but it will fail at run-time. So this is a pretty close
approximation of the actual dependency.

Fixes:
http://autobuild.buildroot.net/results/2d42b0a626367e4051d0e2aadcce39e974fe09d4/
http://autobuild.buildroot.net/results/a2b6dbf707275e3f8262479c0650cfc7cb9abc8d/

Cc: Matt Weber <matthew.weber@collins.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/mtd/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/mtd/Config.in b/package/mtd/Config.in
index 1bd143d47e7d..4bd9118aecc1 100644
--- a/package/mtd/Config.in
+++ b/package/mtd/Config.in
@@ -147,6 +147,7 @@ config BR2_PACKAGE_MTD_UBIHEALTHD
 	bool "ubihealthd"
 	default y
 	select BR2_PACKAGE_MTD_UBIFS_UTILS
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_17 # getrandom()
 
 config BR2_PACKAGE_MTD_UBIMKVOL
 	bool "ubimkvol"
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
