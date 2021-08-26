Return-Path: <SRS0=2pYX=NR=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2540CC432BE
	for <buildroot@archiver.kernel.org>; Thu, 26 Aug 2021 06:10:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1C33B60560
	for <buildroot@archiver.kernel.org>; Thu, 26 Aug 2021 06:10:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1C33B60560
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=tkos.co.il
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C9A9E60624;
	Thu, 26 Aug 2021 06:10:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uprrIJoJYwtf; Thu, 26 Aug 2021 06:10:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 123C0613ED;
	Thu, 26 Aug 2021 06:10:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8FC301BF31E
 for <buildroot@lists.busybox.net>; Thu, 26 Aug 2021 06:10:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7E2418193E
 for <buildroot@lists.busybox.net>; Thu, 26 Aug 2021 06:10:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UTCevmCiKCw6 for <buildroot@lists.busybox.net>;
 Thu, 26 Aug 2021 06:10:46 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mx.tkos.co.il (guitar.tcltek.co.il [192.115.133.116])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 11B1E80DE4
 for <buildroot@busybox.net>; Thu, 26 Aug 2021 06:10:45 +0000 (UTC)
Received: from tarshish.tkos.co.il (unknown [10.0.8.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx.tkos.co.il (Postfix) with ESMTPS id E8332440E57;
 Thu, 26 Aug 2021 09:10:33 +0300 (IDT)
From: Baruch Siach <baruch@tkos.co.il>
To: buildroot@busybox.net
Date: Thu, 26 Aug 2021 09:10:35 +0300
Message-Id: <916c37d1fe52b9fd6b14eed9b68e4edb5801234e.1629958236.git.baruch@tkos.co.il>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/2] package/mtd: change ubifs-utils depend to
 select
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
Cc: Matt Weber <matthew.weber@collins.com>, Markus Mayer <mmayer@broadcom.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

BR2_PACKAGE_MTD_UBIFS_UTILS is a blind option. The only way to enable it
is to enable BR2_PACKAGE_MTD_MKFSUBIFS that selects it. ubihealthd
dependency on BR2_PACKAGE_MTD_UBIFS_UTILS makes enabling it unintuitive.

Change depends to select.

Cc: Markus Mayer <mmayer@broadcom.com>
Cc: Matt Weber <matthew.weber@collins.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/mtd/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/mtd/Config.in b/package/mtd/Config.in
index abfe8066610c..1bd143d47e7d 100644
--- a/package/mtd/Config.in
+++ b/package/mtd/Config.in
@@ -146,7 +146,7 @@ config BR2_PACKAGE_MTD_UBIFORMAT
 config BR2_PACKAGE_MTD_UBIHEALTHD
 	bool "ubihealthd"
 	default y
-	depends on BR2_PACKAGE_MTD_UBIFS_UTILS
+	select BR2_PACKAGE_MTD_UBIFS_UTILS
 
 config BR2_PACKAGE_MTD_UBIMKVOL
 	bool "ubimkvol"
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
