Return-Path: <SRS0=sHoS=NS=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1B51C432BE
	for <buildroot@archiver.kernel.org>; Fri, 27 Aug 2021 05:03:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EB6F260F25
	for <buildroot@archiver.kernel.org>; Fri, 27 Aug 2021 05:03:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EB6F260F25
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=tkos.co.il
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A30484265E;
	Fri, 27 Aug 2021 05:03:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id M5Vr35yYvvam; Fri, 27 Aug 2021 05:02:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 08A2C42665;
	Fri, 27 Aug 2021 05:02:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E2C261BF295
 for <buildroot@lists.busybox.net>; Fri, 27 Aug 2021 05:02:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CC0F782A8F
 for <buildroot@lists.busybox.net>; Fri, 27 Aug 2021 05:02:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2dW2OBJpp7aX for <buildroot@lists.busybox.net>;
 Fri, 27 Aug 2021 05:02:50 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mx.tkos.co.il (guitar.tcltek.co.il [192.115.133.116])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B2776829DC
 for <buildroot@busybox.net>; Fri, 27 Aug 2021 05:02:50 +0000 (UTC)
Received: from tarshish.tkos.co.il (unknown [10.0.8.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx.tkos.co.il (Postfix) with ESMTPS id 278B7440E45;
 Fri, 27 Aug 2021 08:02:38 +0300 (IDT)
From: Baruch Siach <baruch@tkos.co.il>
To: buildroot@busybox.net
Date: Fri, 27 Aug 2021 08:02:40 +0300
Message-Id: <6b40b32e09ea0bb959413f6b6713198c364f90b7.1630040560.git.baruch@tkos.co.il>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/mtd: make ubihealthd independent of
 ubifs
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

Since version 2.1.3 ubihealthd can be enabled without of ubifs-utils.

This also fixes usability of enabling BR2_PACKAGE_MTD_UBIHEALTHD.
BR2_PACKAGE_MTD_UBIFS_UTILS is a blind option. The only way to enable it
is to enable BR2_PACKAGE_MTD_MKFSUBIFS that selects it. ubihealthd
dependency on BR2_PACKAGE_MTD_UBIFS_UTILS makes enabling it unintuitive.

Cc: Markus Mayer <mmayer@broadcom.com>
Cc: Matt Weber <matthew.weber@collins.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/mtd/Config.in | 1 -
 package/mtd/mtd.mk    | 6 ++++++
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/package/mtd/Config.in b/package/mtd/Config.in
index 57ad01971d5f..d0ca3ba6631d 100644
--- a/package/mtd/Config.in
+++ b/package/mtd/Config.in
@@ -146,7 +146,6 @@ config BR2_PACKAGE_MTD_UBIFORMAT
 config BR2_PACKAGE_MTD_UBIHEALTHD
 	bool "ubihealthd"
 	default y
-	depends on BR2_PACKAGE_MTD_UBIFS_UTILS
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_17 # getrandom()
 
 config BR2_PACKAGE_MTD_UBIMKVOL
diff --git a/package/mtd/mtd.mk b/package/mtd/mtd.mk
index a37594b16419..6385b9ee0a2c 100644
--- a/package/mtd/mtd.mk
+++ b/package/mtd/mtd.mk
@@ -40,6 +40,12 @@ else
 MTD_CONF_OPTS += --without-ubifs
 endif
 
+ifeq ($(BR2_PACKAGE_MTD_UBIHEALTHD),y)
+MTD_CONF_OPTS += --enable-ubihealthd
+else
+MTD_CONF_OPTS += --disable-ubihealthd
+endif
+
 ifeq ($(BR2_PACKAGE_MTD_TESTS),y)
 MTD_CONF_OPTS += --enable-tests --enable-install-tests
 else
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
