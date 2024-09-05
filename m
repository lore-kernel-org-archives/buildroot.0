Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E953CD5BC9
	for <buildroot@archiver.kernel.org>; Thu,  5 Sep 2024 15:22:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E58AE81826;
	Thu,  5 Sep 2024 15:22:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D561TdDYCAKw; Thu,  5 Sep 2024 15:22:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0B3D981831
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0B3D981831;
	Thu,  5 Sep 2024 15:22:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 216A11BF3D4
 for <buildroot@lists.busybox.net>; Thu,  5 Sep 2024 15:22:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0E649404F8
 for <buildroot@lists.busybox.net>; Thu,  5 Sep 2024 15:22:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3TOZoAjjTaNf for <buildroot@lists.busybox.net>;
 Thu,  5 Sep 2024 15:22:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=188.165.44.123;
 helo=mail1.insia.net; envelope-from=guillaume.chaye@zeetim.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 02943401CF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 02943401CF
Received: from mail1.insia.net (mail1.insia.net [188.165.44.123])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 02943401CF
 for <buildroot@buildroot.org>; Thu,  5 Sep 2024 15:22:07 +0000 (UTC)
Received: from smtp.insia.net (unknown [192.168.1.24])
 by mail1.insia.net (Postfix) with ESMTP id 155DE3F82C;
 Thu,  5 Sep 2024 17:22:00 +0200 (CEST)
Received: from sb-dev-build.insia.net. (gw-servers.insia.net [192.168.1.1])
 by smtp.insia.net (Postfix) with ESMTP id BE5145F497;
 Thu,  5 Sep 2024 17:18:28 +0200 (CEST)
From: "Guillaume GC. Chaye" <guillaume.chaye@zeetim.com>
To: buildroot@buildroot.org
Date: Thu,  5 Sep 2024 17:21:10 +0200
Message-Id: <20240905152110.1317154-1-guillaume.chaye@zeetim.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=zeetim.com; s=mail1; t=1725549720;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=eGoh4OWniabCC5uOng70RqXsiylDEf5bqUHH7aZHJ1s=;
 b=JjyTkRhn1lTaKhlo+pPmyhwa1lDJIyprYamdOv/G6NiYCZDBEzJUfPbpr9Ipq5gDzi6JT+
 BO7z2EakxtXT7DnVEX8o5b2W6t4Lh2p2UgcAm6AVM0zAF44bTQD5vVUv2mGOkNATjfHMQM
 8fQrD0EqOlvKehsBxT0YFHW25lN9JwjI8OMk4enYGPUAgUEuOOCDVTgdRMiLeXijU3ARyd
 FEs2bYtcMHhXb2z5136wNyi14NzuN/noyBJBFc1PbDsFTLPTrQFwXCiCVLSMWXEvmaNwvW
 8OuqGXetVDZQJZDkRGQKs5nx+pmNbtXNGKfGGbR7fur864utH5TsplAi1d9eGQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=zeetim.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=zeetim.com header.i=@zeetim.com header.a=rsa-sha256
 header.s=mail1 header.b=JjyTkRhn
Subject: [Buildroot] [PATCH 3/3] package/wpa_supplicant: add missing config
 for WPA3 entreprise
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
Cc: "Guillaume GC. Chaye" <guillaume.chaye@zeetim.com>,
 Sergey Matyukevich <geomatsi@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Guillaume GC. Chaye <guillaume.chaye@zeetim.com>
---
 package/wpa_supplicant/wpa_supplicant.mk | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/package/wpa_supplicant/wpa_supplicant.mk b/package/wpa_supplicant/wpa_supplicant.mk
index 984959f679..f37a7db821 100644
--- a/package/wpa_supplicant/wpa_supplicant.mk
+++ b/package/wpa_supplicant/wpa_supplicant.mk
@@ -131,13 +131,17 @@ WPA_SUPPLICANT_CONFIG_ENABLE += \
 	CONFIG_DPP \
 	CONFIG_SAE \
 	CONFIG_SAE_PK \
-	CONFIG_OWE
+	CONFIG_OWE \
+	CONFIG_SUITEB \
+	CONFIG_SUITEB192
 else
 WPA_SUPPLICANT_CONFIG_DISABLE += \
 	CONFIG_DPP \
 	CONFIG_SAE \
 	CONFIG_SAE_PK \
-	CONFIG_OWE
+	CONFIG_OWE \
+	CONFIG_SUITEB \
+	CONFIG_SUITEB192
 endif
 
 # Try to use openssl if it's already available
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
