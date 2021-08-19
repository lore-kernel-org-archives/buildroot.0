Return-Path: <SRS0=aU6e=NK=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48805C4338F
	for <buildroot@archiver.kernel.org>; Thu, 19 Aug 2021 11:35:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D802160F11
	for <buildroot@archiver.kernel.org>; Thu, 19 Aug 2021 11:35:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D802160F11
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=busybox.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9A85B400BE;
	Thu, 19 Aug 2021 11:35:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 066CvHH91gBU; Thu, 19 Aug 2021 11:35:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id F1012400C3;
	Thu, 19 Aug 2021 11:35:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9E1FA1BF867
 for <buildroot@lists.busybox.net>; Thu, 19 Aug 2021 11:35:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8D8B1606C8
 for <buildroot@lists.busybox.net>; Thu, 19 Aug 2021 11:35:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=microchip.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Y2uzqnNAeRRP for <buildroot@lists.busybox.net>;
 Thu, 19 Aug 2021 11:35:40 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.154.123])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5E857605DF
 for <buildroot@buildroot.org>; Thu, 19 Aug 2021 11:35:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1629372940; x=1660908940;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=h0HcyUJD6vtKYF6jE08jIeR7akVCpWmH1vuZu1RdUoM=;
 b=T6m3Mb/nt5TL2YJjFtKFUHvc5LiGpIHkQLorSFlcckAsh8lEjPT+speK
 0FTK92M353+WrxIIqFl7ODtkCBauKoutspC4UVS5AqgcHtFhwiZnv2X74
 F2bjEJhWrsJxns/Y7pY715TzXkMsaCe76IU4A4KmhyVaHUmOKVlCkTHeT
 9QjcitWZd4fQ8GZxhZEq4NDkvr2btM6Ws9awX3+D3zSPhIOxqdZBbu98U
 QjTpV+KuIvRK+8R/09fG35rVKJ4qzHfzjcYM7dke+iJmKLfTqXSnzFQR0
 2XuWiRijtgJEdIWYOzn5pnMf44ig5n5iYeVSk3CDF0OJUk05/8gJI4oS1 g==;
IronPort-SDR: 4TTV4L+Pn+4lafMUNgDyyzbIBnL9G6xFTn6hjUALtwiVGX0Lk9NHvkp0ZKT4l6ghelFjom9zII
 OmtCGf+HN0Et2H4BgNcr1miDMzw1lLaX3ab7NfH+0jjBUvvoe4/CdpTx+4reSPajlOTweCEmaJ
 wbdwcaEvrEf+O44T63/2ifZfNhq4JtidwfwIIA8tra3mORiCoUcybpxu7DljLRrQX5S6b50V9j
 X2DaXEoZk4FImMHA3w8Ry5Cw8GB1FohdgjYqA7BU+UDyESSyuIfmpJi07jZqZENOM6fJdfGg4d
 jPvedRyKB+Nt6zJ1lj7l5BuE
X-IronPort-AV: E=Sophos;i="5.84,334,1620716400"; d="scan'208";a="126381224"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 19 Aug 2021 04:35:38 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Thu, 19 Aug 2021 04:35:37 -0700
Received: from ROB-ULT-M18282.microchip.com (10.10.115.15) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Thu, 19 Aug 2021 04:35:32 -0700
To: <buildroot@buildroot.org>
Date: Thu, 19 Aug 2021 14:35:22 +0300
Message-ID: <20210819113522.250804-1-eugen.hristev@microchip.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2] boot/at91bootstrap3: updated to released
 4.0.0 final version
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
From: Eugen Hristev via buildroot <buildroot@busybox.net>
Reply-To: Eugen Hristev <eugen.hristev@microchip.com>
Cc: Eugen Hristev <eugen.hristev@microchip.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Update to AT91Bootstrap 4.0.0 version.

This package is now released under MIT license.

Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>
---
Changes in v2:
- Added conditional license block according to version

Are you going to have bootstrap 4.0.0-rc2 in buildroot 2021.08 or this patch
will go for 2021.11 ?

Eugen

 boot/at91bootstrap3/Config.in           | 4 ++--
 boot/at91bootstrap3/at91bootstrap3.hash | 2 +-
 boot/at91bootstrap3/at91bootstrap3.mk   | 4 ++++
 3 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/boot/at91bootstrap3/Config.in b/boot/at91bootstrap3/Config.in
index edacc00675..650d3a23c8 100644
--- a/boot/at91bootstrap3/Config.in
+++ b/boot/at91bootstrap3/Config.in
@@ -19,7 +19,7 @@ choice
 	prompt "AT91 Bootstrap 3+ version"
 
 config BR2_TARGET_AT91BOOTSTRAP3_LATEST_VERSION
-	bool "4.0.0-rc2"
+	bool "4.0.0"
 
 config BR2_TARGET_AT91BOOTSTRAP3_LATEST_VERSION_3X
 	bool "3.10.3"
@@ -54,7 +54,7 @@ endif
 
 config BR2_TARGET_AT91BOOTSTRAP3_VERSION
 	string
-	default "v4.0.0-rc2" if BR2_TARGET_AT91BOOTSTRAP3_LATEST_VERSION
+	default "v4.0.0" if BR2_TARGET_AT91BOOTSTRAP3_LATEST_VERSION
 	default "v3.10.3" if BR2_TARGET_AT91BOOTSTRAP3_LATEST_VERSION_3X
 	default BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_VERSION \
 		if BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_GIT
diff --git a/boot/at91bootstrap3/at91bootstrap3.hash b/boot/at91bootstrap3/at91bootstrap3.hash
index 71c579de28..df5b5ae6f2 100644
--- a/boot/at91bootstrap3/at91bootstrap3.hash
+++ b/boot/at91bootstrap3/at91bootstrap3.hash
@@ -1,3 +1,3 @@
 # Locally calculated
 sha256  b6ae5bcaacc5a949f400182e036ae053049638444a3ba8b1dd154ec5f7898d8e  at91bootstrap3-v3.10.3.tar.gz
-sha256  b5d5f042297cad0d091f7d8734e61eb9ec7b6020898e086503fb5f8bc71fb9fc  at91bootstrap3-v4.0.0-rc2.tar.gz
+sha256  08c5b95df28be7f2e0439fb2b77fe27524f97c499850641e4540c07ea0b2c25d  at91bootstrap3-v4.0.0.tar.gz
diff --git a/boot/at91bootstrap3/at91bootstrap3.mk b/boot/at91bootstrap3/at91bootstrap3.mk
index b253129dfb..f28f848b7b 100644
--- a/boot/at91bootstrap3/at91bootstrap3.mk
+++ b/boot/at91bootstrap3/at91bootstrap3.mk
@@ -19,7 +19,11 @@ else
 AT91BOOTSTRAP3_SITE = $(call github,linux4sam,at91bootstrap,$(AT91BOOTSTRAP3_VERSION))
 endif
 
+ifeq ($(BR2_TARGET_AT91BOOTSTRAP3_LATEST_VERSION),y)
+AT91BOOTSTRAP3_LICENSE = MIT
+else ifeq ($(BR2_TARGET_AT91BOOTSTRAP3_LATEST_VERSION_3X),y)
 AT91BOOTSTRAP3_LICENSE = Atmel License
+endif
 
 AT91BOOTSTRAP3_CPE_ID_VENDOR = linux4sam
 AT91BOOTSTRAP3_CPE_ID_PRODUCT = at91bootstrap
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
