Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA2CEC3ABA2
	for <buildroot@archiver.kernel.org>; Mon, 16 Sep 2024 08:55:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8E4C2404D7;
	Mon, 16 Sep 2024 08:55:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DU2Vfe8kNOo7; Mon, 16 Sep 2024 08:55:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6789A405E3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6789A405E3;
	Mon, 16 Sep 2024 08:55:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8F3DE1BF311
 for <buildroot@lists.busybox.net>; Mon, 16 Sep 2024 08:55:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7E51F8110E
 for <buildroot@lists.busybox.net>; Mon, 16 Sep 2024 08:55:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PuJDtzVipX5K for <buildroot@lists.busybox.net>;
 Mon, 16 Sep 2024 08:55:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=188.165.44.123;
 helo=mail1.insia.net; envelope-from=guillaume.chaye@zeetim.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 779D48110D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 779D48110D
Received: from mail1.insia.net (mail1.insia.net [188.165.44.123])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 779D48110D
 for <buildroot@buildroot.org>; Mon, 16 Sep 2024 08:55:36 +0000 (UTC)
Received: from smtp.insia.net (unknown [192.168.1.24])
 by mail1.insia.net (Postfix) with ESMTP id B5B043F897;
 Mon, 16 Sep 2024 10:55:29 +0200 (CEST)
Received: from sb-dev-build.insia.net. (gw-servers.insia.net [192.168.1.1])
 by smtp.insia.net (Postfix) with ESMTP id BE6C25F497;
 Mon, 16 Sep 2024 10:50:59 +0200 (CEST)
From: "Guillaume GC. Chaye" <guillaume.chaye@zeetim.com>
To: buildroot@buildroot.org
Date: Mon, 16 Sep 2024 10:55:10 +0200
Message-Id: <20240916085510.2953923-1-guillaume.chaye@zeetim.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=zeetim.com; s=mail1; t=1726476929;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=uzEDx7rva3wZ4t4wjhHi+FvjmFLKCt9Sq3qUMWadEvU=;
 b=b1jMpclgwfYuMjbl93iVIegi/+uxaP6VJB7EoUYcGVnrCV+RLk9Uj1BHbsZGpiBatGxgOA
 kUNWVPDSrnogN+lkaLsgNcKdzczu9//JKhQeq3u10Q0e/ZOOZDgaD4eMKzEOHXsOD7NsgU
 XrZaT0WcMmSzHcjpnguckq9rZW4+mAH13/F9CV/RmmYsWJjn9kS5iBfrdCOyB2voVC9BQ9
 PV+CDBb0SUafeCL7e2vqyNcxWrXaAhG4/5nuJ4eP/HtsH1vNsMKRBGE62nfS1uVSzqNYKq
 QowlGY1BgWf9orMrpodvaqLEjxY8klU0u87J5ciVAZ4PX5t9PCsqz1yF5S3UJw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=zeetim.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=zeetim.com header.i=@zeetim.com header.a=rsa-sha256
 header.s=mail1 header.b=b1jMpclg
Subject: [Buildroot] [PATCHv3 1/1] package/wpa_supplicant: add configuration
 for WPA3-Entreprise
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
 package/wpa_supplicant/wpa_supplicant.mk | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/package/wpa_supplicant/wpa_supplicant.mk b/package/wpa_supplicant/wpa_supplicant.mk
index 984959f679..aef8731341 100644
--- a/package/wpa_supplicant/wpa_supplicant.mk
+++ b/package/wpa_supplicant/wpa_supplicant.mk
@@ -126,18 +126,29 @@ ifeq ($(BR2_PACKAGE_WPA_SUPPLICANT_WPS),)
 WPA_SUPPLICANT_CONFIG_DISABLE += CONFIG_WPS
 endif
 
+# WPA3 configurations:
+# - CONFIG_DPP: Easy Connect (Device Provisioning Protocol - DPP R1 & R2)
+# - CONFIG_SAE: Simultaneous Authentication of Equals (SAE), WPA3-Personal
+# - CONFIG_SAE_PK: SAE Public Key, WPA3-Personal
+# - CONFIG_OWE: Opportunistic Wireless Encryption (OWE)
+# - CONFIG_SUITEB: WPA3-Enterprise
+# - CONFIG_SUITEB192: WPA3-Enterprise (SuiteB 192 bits security)
 ifeq ($(BR2_PACKAGE_WPA_SUPPLICANT_WPA3),y)
 WPA_SUPPLICANT_CONFIG_ENABLE += \
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
