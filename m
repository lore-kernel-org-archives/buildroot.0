Return-Path: <SRS0=SwR/=OE=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88ED7C433EF
	for <buildroot@archiver.kernel.org>; Tue, 14 Sep 2021 13:51:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BA93260F48
	for <buildroot@archiver.kernel.org>; Tue, 14 Sep 2021 13:51:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BA93260F48
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lists.buildroot.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 642C1607EB;
	Tue, 14 Sep 2021 13:51:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zLxcaP3Qz7An; Tue, 14 Sep 2021 13:51:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4BCB660AD5;
	Tue, 14 Sep 2021 13:51:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B6ABA1BF2FA
 for <buildroot@lists.busybox.net>; Tue, 14 Sep 2021 13:51:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A524A402F4
 for <buildroot@lists.busybox.net>; Tue, 14 Sep 2021 13:51:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=heine.tech
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2I02eVyIPlpw for <buildroot@lists.busybox.net>;
 Tue, 14 Sep 2021 13:51:37 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mail.heine.tech (mail.heine.tech [195.201.24.99])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5E104400BF
 for <buildroot@buildroot.org>; Tue, 14 Sep 2021 13:51:37 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 3F2401814BD; Tue, 14 Sep 2021 15:51:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=heine.tech; s=dkim;
 t=1631627493; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=aA4XBq2H9Ulp0XUACQtEhRnPV2ThnH9WScqMagWYKTw=;
 b=g0fcW7yhqlxDQnSYwC3p3LkdLpq6da5z8fy3kk5aPyMvm+HMczA63SiLs/fd8Hvy1BPrIX
 wSizEKwKUMDHKqfIa2MBsJDpNZ4HaPmUMGt6eu4F7DPrEdb6nhxxrLuoe1SgtBh8RwHHN1
 1ZF2jieq1CyFV1a9JLsK3iveyfFPqgQ=
To: buildroot@buildroot.org
Date: Tue, 14 Sep 2021 15:50:57 +0200
Message-Id: <20210914135059.87663-1-buildroot@heine.tech>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.2
Subject: [Buildroot] [PATCH] package/botan: fix boost dependency
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
From: Michael Nosthoff via buildroot <buildroot@lists.buildroot.org>
Reply-To: Michael Nosthoff <buildroot@heine.tech>
Cc: Michael Nosthoff <buildroot@heine.tech>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

only build --with-boost when both required modules (filesystem and system) are
also selected.

Fixes:
http://autobuild.buildroot.net/results/4fbf2a63f9ddfbc540ce7dabd10964b311477c06

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
---
 package/botan/botan.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/botan/botan.mk b/package/botan/botan.mk
index c23aba99dd..2d4d11bd71 100644
--- a/package/botan/botan.mk
+++ b/package/botan/botan.mk
@@ -50,7 +50,7 @@ ifeq ($(BR2_TOOLCHAIN_USES_UCLIBC),y)
 BOTAN_CONF_OPTS += --without-os-feature=getauxval
 endif
 
-ifeq ($(BR2_PACKAGE_BOOST),y)
+ifeq ($(BR2_PACKAGE_BOOST_FILESYSTEM)$(BR2_PACKAGE_BOOST_SYSTEM),yy)
 BOTAN_DEPENDENCIES += boost
 BOTAN_CONF_OPTS += --with-boost
 endif
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
