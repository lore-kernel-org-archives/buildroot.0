Return-Path: <SRS0=nfe+=NH=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1E84C4338F
	for <buildroot@archiver.kernel.org>; Mon, 16 Aug 2021 12:04:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4DC1261CA7
	for <buildroot@archiver.kernel.org>; Mon, 16 Aug 2021 12:04:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4DC1261CA7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=busybox.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 216C560596;
	Mon, 16 Aug 2021 12:04:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fI5tOKclDm8j; Mon, 16 Aug 2021 12:04:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A749C606C9;
	Mon, 16 Aug 2021 12:04:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 105181BF2F8
 for <buildroot@lists.busybox.net>; Mon, 16 Aug 2021 12:04:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F31AC40208
 for <buildroot@lists.busybox.net>; Mon, 16 Aug 2021 12:04:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=microchip.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id To2iK7h6R45j for <buildroot@lists.busybox.net>;
 Mon, 16 Aug 2021 12:04:32 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.154.123])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4D58440229
 for <buildroot@buildroot.org>; Mon, 16 Aug 2021 12:04:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1629115472; x=1660651472;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=EsL9PgPtFQi/htXySQp7fX9Z4HoFTHlWd3AHTgv5v8s=;
 b=Lxu4wkUxc31SREpUFJSLioaIRUZHBDsotVPkJ8DwFAWfTiUw0VrPaTeg
 L+OCCovTKQJyavanaTLboCqqMIuvNoMzCq+2hfyvAA2DyCIh6scmIqkUj
 k3VA0SGdAb2xWZIdLB7SY9vlnpH3wsi0RcHT7Oz8yPhMJVJAEbVKOQzx6
 JY4PxXGi8EV0LJbOaNSwtUD5BorI6E1+uhvmBYG4C49Bh5rDwr2Ir0dX0
 qjeK3dYEpg32LJdzwZM3dld0Qd4pqcFsv3+HCyuv/KO6Ek5TXUdAdpLX1
 buO63wQx0z80IVpR/oC5n7NYDBIUyZEsDjpz2ADl/ULskDAcb5zkuZ9DO w==;
IronPort-SDR: KHNcK9HwmxVoqVWTuR3EPHZn/Z3vxhsCH3zleBnUMHZjxdx88Jw+NYo75dLNYo0JamO7oYy5Xm
 IVZvQeOSiWxJG4yXUkZ6lMjCzUPV8jhKFoQeuJHIx5O2RVPQ3ksUOWhI/gY7OFD/I9LH/9bbhX
 6T4VwsxEHLe3/rtf8l0AYaGYNti13h8lAqR9K7B8zdQ/yLu7y6Wblpp2to4ht2wPZ0Ek96V/ZW
 LIM1lIHDJk8c2D57j99rVNp01R4TCUO06f4CUMZeyjtpTEJ1Lo+1Ovdq7N7c7Xns7x9doI+i7i
 KiJgk5E2cdjeKVl5oAjP9ryr
X-IronPort-AV: E=Sophos;i="5.84,324,1620716400"; d="scan'208";a="65971343"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 16 Aug 2021 05:04:31 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Mon, 16 Aug 2021 05:04:30 -0700
Received: from ROU-LT-M43218B.mchp-main.com (10.10.115.15) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Mon, 16 Aug 2021 05:04:29 -0700
To: <buildroot@buildroot.org>
Date: Mon, 16 Aug 2021 14:04:16 +0200
Message-ID: <20210816120418.427-2-ludovic.desroches@microchip.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210816120418.427-1-ludovic.desroches@microchip.com>
References: <20210816120418.427-1-ludovic.desroches@microchip.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/3] boot/at91bootstrap3: bump 3.x series to
 3.10.3
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
From: Ludovic Desroches via buildroot <buildroot@busybox.net>
Reply-To: Ludovic Desroches <ludovic.desroches@microchip.com>
Cc: Biagio Montaruli <biagio.hkr@gmail.com>,
 Edgar Bonet <bonet@grenoble.cnrs.fr>, nicolas.ferre@microchip.com, Ludovic
 Desroches <ludovic.desroches@microchip.com>, thomas.petazzoni@bootlin.com,
 eugen.hristev@microchip.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Signed-off-by: Ludovic Desroches <ludovic.desroches@microchip.com>
---
 boot/at91bootstrap3/Config.in           | 4 ++--
 boot/at91bootstrap3/at91bootstrap3.hash | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/boot/at91bootstrap3/Config.in b/boot/at91bootstrap3/Config.in
index f44597bc00..edacc00675 100644
--- a/boot/at91bootstrap3/Config.in
+++ b/boot/at91bootstrap3/Config.in
@@ -22,7 +22,7 @@ config BR2_TARGET_AT91BOOTSTRAP3_LATEST_VERSION
 	bool "4.0.0-rc2"
 
 config BR2_TARGET_AT91BOOTSTRAP3_LATEST_VERSION_3X
-	bool "3.10.2"
+	bool "3.10.3"
 
 config BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_GIT
 	bool "Custom Git repository"
@@ -55,7 +55,7 @@ endif
 config BR2_TARGET_AT91BOOTSTRAP3_VERSION
 	string
 	default "v4.0.0-rc2" if BR2_TARGET_AT91BOOTSTRAP3_LATEST_VERSION
-	default "v3.10.2" if BR2_TARGET_AT91BOOTSTRAP3_LATEST_VERSION_3X
+	default "v3.10.3" if BR2_TARGET_AT91BOOTSTRAP3_LATEST_VERSION_3X
 	default BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_VERSION \
 		if BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_GIT
 	default "custom"	if BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_TARBALL
diff --git a/boot/at91bootstrap3/at91bootstrap3.hash b/boot/at91bootstrap3/at91bootstrap3.hash
index 8b7453bbd4..71c579de28 100644
--- a/boot/at91bootstrap3/at91bootstrap3.hash
+++ b/boot/at91bootstrap3/at91bootstrap3.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  33e4ba431af93a4fc2e81c1458cd31901b9f69c583ebe4c74ca78c0846479bfd  at91bootstrap3-v3.10.2.tar.gz
+sha256  b6ae5bcaacc5a949f400182e036ae053049638444a3ba8b1dd154ec5f7898d8e  at91bootstrap3-v3.10.3.tar.gz
 sha256  b5d5f042297cad0d091f7d8734e61eb9ec7b6020898e086503fb5f8bc71fb9fc  at91bootstrap3-v4.0.0-rc2.tar.gz
-- 
2.20.1

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
