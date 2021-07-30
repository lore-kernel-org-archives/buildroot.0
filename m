Return-Path: <SRS0=Uqjv=MW=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47E3EC4338F
	for <buildroot@archiver.kernel.org>; Fri, 30 Jul 2021 10:39:23 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BA8196101C
	for <buildroot@archiver.kernel.org>; Fri, 30 Jul 2021 10:39:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BA8196101C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=busybox.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7AA3E60A61;
	Fri, 30 Jul 2021 10:39:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uayv9t5ZD5SR; Fri, 30 Jul 2021 10:39:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BFF406062C;
	Fri, 30 Jul 2021 10:39:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 157CB1BF48B
 for <buildroot@lists.busybox.net>; Fri, 30 Jul 2021 10:39:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 049904067B
 for <buildroot@lists.busybox.net>; Fri, 30 Jul 2021 10:39:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=microchip.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id f6DdIT3yZ2Lh for <buildroot@lists.busybox.net>;
 Fri, 30 Jul 2021 10:39:17 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.153.233])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6ADBF4067A
 for <buildroot@buildroot.org>; Fri, 30 Jul 2021 10:39:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1627641557; x=1659177557;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=k1ftKr1WD/NMpnWxJKqeFLPKqjyDEN5VaGnKi3evpO8=;
 b=Wn0EGxmVy7KxFeh3iTVYVzh1sgz1y4rVHZHF9mmndY1e1HK4Rdt4Kzkm
 tRnpGbXOen1bcrUpwIW5sN3vnsHxM9CGa8KpgLtYxLgMalige/t4SruDt
 LUuvozTr6U227EA3+LW4WLei2IA14SyjcW547jsYdraR0TjqFFWw5MCEa
 QVbQC3jJYhYYukTBELIdnRHl5bSo+xo8YsFfJxtvV/s/E8QUwQPASXe/s
 wObWiXmnrfW9xo3442O+wIePt+aUvx/JRdhKz8ixd1zjTzFRsP3m+C2jo
 jO3Duq4xnQTak8DTTPGa12HLAHZJWZpOAzKt8hfWjBmgxa3k3glINdmU+ A==;
IronPort-SDR: VXC+oG9CwvFwiyiOHNG3qEeyhmqWv1pZvSfGlrvYa4bIslkm7ZsJ8y0zM5wkeNQXb4zSEDDpwL
 zvfm4IAQRYW8xgVuMZvFPHvj6D89+8YR7o/UGS+uRDZVmA6WWIOYLcD8l5b3wuUM7djvtwsv6v
 g0RfEO+tKbGXu62Vt3o+aqrBz+8FPO8JHDNJsg9WiC9ELBhWfniQ6vspNaVcR4s6+RX6w6ZjMg
 RzBWWkTS9E5AGcuJs8I/0aFflwb3uU43zue36YzqUQ2Jv2pfo/hwpclBUkCly5SyQl0sdNVQ2a
 ttu9uF00g1ogRn2N1NDExQsW
X-IronPort-AV: E=Sophos;i="5.84,281,1620716400"; d="scan'208";a="130964969"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 30 Jul 2021 03:39:16 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Fri, 30 Jul 2021 03:39:15 -0700
Received: from ROB-ULT-M18282.microchip.com (10.10.115.15) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Fri, 30 Jul 2021 03:39:12 -0700
To: <buildroot@buildroot.org>
Date: Fri, 30 Jul 2021 13:39:08 +0300
Message-ID: <20210730103908.11270-1-eugen.hristev@microchip.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] boot/at91bootstrap3: updated to released 4.0.0
 final version
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
 boot/at91bootstrap3/Config.in           | 4 ++--
 boot/at91bootstrap3/at91bootstrap3.hash | 2 +-
 boot/at91bootstrap3/at91bootstrap3.mk   | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/boot/at91bootstrap3/Config.in b/boot/at91bootstrap3/Config.in
index f44597bc00..f459b8d7c0 100644
--- a/boot/at91bootstrap3/Config.in
+++ b/boot/at91bootstrap3/Config.in
@@ -19,7 +19,7 @@ choice
 	prompt "AT91 Bootstrap 3+ version"
 
 config BR2_TARGET_AT91BOOTSTRAP3_LATEST_VERSION
-	bool "4.0.0-rc2"
+	bool "4.0.0"
 
 config BR2_TARGET_AT91BOOTSTRAP3_LATEST_VERSION_3X
 	bool "3.10.2"
@@ -54,7 +54,7 @@ endif
 
 config BR2_TARGET_AT91BOOTSTRAP3_VERSION
 	string
-	default "v4.0.0-rc2" if BR2_TARGET_AT91BOOTSTRAP3_LATEST_VERSION
+	default "v4.0.0" if BR2_TARGET_AT91BOOTSTRAP3_LATEST_VERSION
 	default "v3.10.2" if BR2_TARGET_AT91BOOTSTRAP3_LATEST_VERSION_3X
 	default BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_VERSION \
 		if BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_GIT
diff --git a/boot/at91bootstrap3/at91bootstrap3.hash b/boot/at91bootstrap3/at91bootstrap3.hash
index 8b7453bbd4..7092a4f28b 100644
--- a/boot/at91bootstrap3/at91bootstrap3.hash
+++ b/boot/at91bootstrap3/at91bootstrap3.hash
@@ -1,3 +1,3 @@
 # Locally calculated
 sha256  33e4ba431af93a4fc2e81c1458cd31901b9f69c583ebe4c74ca78c0846479bfd  at91bootstrap3-v3.10.2.tar.gz
-sha256  b5d5f042297cad0d091f7d8734e61eb9ec7b6020898e086503fb5f8bc71fb9fc  at91bootstrap3-v4.0.0-rc2.tar.gz
+sha256  08c5b95df28be7f2e0439fb2b77fe27524f97c499850641e4540c07ea0b2c25d  at91bootstrap3-v4.0.0.tar.gz
diff --git a/boot/at91bootstrap3/at91bootstrap3.mk b/boot/at91bootstrap3/at91bootstrap3.mk
index b253129dfb..aec909cfd8 100644
--- a/boot/at91bootstrap3/at91bootstrap3.mk
+++ b/boot/at91bootstrap3/at91bootstrap3.mk
@@ -19,7 +19,7 @@ else
 AT91BOOTSTRAP3_SITE = $(call github,linux4sam,at91bootstrap,$(AT91BOOTSTRAP3_VERSION))
 endif
 
-AT91BOOTSTRAP3_LICENSE = Atmel License
+AT91BOOTSTRAP3_LICENSE = MIT
 
 AT91BOOTSTRAP3_CPE_ID_VENDOR = linux4sam
 AT91BOOTSTRAP3_CPE_ID_PRODUCT = at91bootstrap
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
