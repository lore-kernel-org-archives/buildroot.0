Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1370DC3DA61
	for <buildroot@archiver.kernel.org>; Mon, 29 Jul 2024 11:30:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C9265403E2;
	Mon, 29 Jul 2024 11:30:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mUC5hoPBcf7T; Mon, 29 Jul 2024 11:29:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 89D7A408E5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 89D7A408E5;
	Mon, 29 Jul 2024 11:29:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7EAE51BF573
 for <buildroot@lists.busybox.net>; Mon, 29 Jul 2024 11:29:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6CE3340210
 for <buildroot@lists.busybox.net>; Mon, 29 Jul 2024 11:29:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BYIMP_1cYSTR for <buildroot@lists.busybox.net>;
 Mon, 29 Jul 2024 11:29:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=68.232.153.233;
 helo=esa.microchip.iphmx.com;
 envelope-from=prvs=933036aaa=jamie.gibbons@microchip.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5A7B940237
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5A7B940237
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.153.233])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5A7B940237
 for <buildroot@buildroot.org>; Mon, 29 Jul 2024 11:29:47 +0000 (UTC)
X-CSE-ConnectionGUID: 6cp23pYHTrawAch69osYPA==
X-CSE-MsgGUID: P/415ontRB2xk1ZdnN5bXQ==
X-IronPort-AV: E=Sophos;i="6.09,245,1716274800"; d="scan'208";a="29804209"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 29 Jul 2024 04:22:40 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 29 Jul 2024 04:22:15 -0700
Received: from jamie-dev.microchip.com (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Mon, 29 Jul 2024 04:22:14 -0700
To: <buildroot@buildroot.org>
Date: Mon, 29 Jul 2024 12:24:17 +0100
Message-ID: <20240729112417.806611-4-jamie.gibbons@microchip.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240729112417.806611-1-jamie.gibbons@microchip.com>
References: <20240729112417.806611-1-jamie.gibbons@microchip.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1722252588; x=1753788588;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Tun37BbaXy8x0Age33Zkv9srkNWzFx6EotVRbCHfjVE=;
 b=etv9yy3iGHArp5AEfIuWyviRHNaC++C3BTPrpf2XcsqAXCvTaMp9Yq8V
 O2bXJvSHaesRfOlx283thGrFiQkVsA80m+50BDQpfMEEA425nZXPoO/3w
 yV9/HsoNpmaUSkEL80NdcyE5G+RVAW9MjlnQUHG+FgA47qQY1+0dRFBXX
 SZIq0PJDSlKcErimPJamELCvATcPDwdFpnmbtuH7SLF/3bodCx+RtCvWP
 5gyG7OotaBWHiE935AHYkPTlZBspaL+XZAPOXLz2vig/HadqIBJXSuilV
 Ir6h/2YKBCi8dBZR5haK9X0FHm/dcO+FNWuFtL0yiNw125ud29VEQNtYs
 w==;
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=microchip.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com
 header.a=rsa-sha256 header.s=mchp header.b=etv9yy3i
Subject: [Buildroot] [PATCH 3/3] package/microchip-hss-payload-generator:
 bump to version 2024.06
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
From: Jamie Gibbons via buildroot <buildroot@buildroot.org>
Reply-To: Jamie Gibbons <jamie.gibbons@microchip.com>
Cc: Valentina Fernandez Alanis <Valentina.FernandezAlanis@microchip.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Conor Dooley <Conor.Dooley@microchip.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Jamie
 Gibbons <jamie.gibbons@microchip.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Bump this package to latest available version v2024.06.

Signed-off-by: Jamie Gibbons <jamie.gibbons@microchip.com>
---
 .../microchip-hss-payload-generator.hash                        | 1 +
 .../microchip-hss-payload-generator.mk                          | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/microchip-hss-payload-generator/microchip-hss-payload-generator.hash b/package/microchip-hss-payload-generator/microchip-hss-payload-generator.hash
index b9015fc961..7739ae6b83 100644
--- a/package/microchip-hss-payload-generator/microchip-hss-payload-generator.hash
+++ b/package/microchip-hss-payload-generator/microchip-hss-payload-generator.hash
@@ -1,3 +1,4 @@
 # Locally calculated
 sha256  447771d4219176acc69c6d945ff40a0f3d0c5cbe63619927bc61b9e52ab05136  microchip-hss-payload-generator-2023.09.tar.gz
+sha256  667138e1b2376dcad8fb43b925bc9f24ba1ab59049550e276821c3b2f07ec6e6  microchip-hss-payload-generator-2024.06.tar.gz
 sha256  0b67b1d44bcad078580fc5d8e9580a48a9466b769db58aeb1631d4c5ef97e08a  tools/hss-payload-generator/LICENSE.md
diff --git a/package/microchip-hss-payload-generator/microchip-hss-payload-generator.mk b/package/microchip-hss-payload-generator/microchip-hss-payload-generator.mk
index 4c3ca93dfe..af1faa8aec 100644
--- a/package/microchip-hss-payload-generator/microchip-hss-payload-generator.mk
+++ b/package/microchip-hss-payload-generator/microchip-hss-payload-generator.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HOST_MICROCHIP_HSS_PAYLOAD_GENERATOR_VERSION = 2023.09
+HOST_MICROCHIP_HSS_PAYLOAD_GENERATOR_VERSION = 2024.06
 HOST_MICROCHIP_HSS_PAYLOAD_GENERATOR_SITE = $(call github,polarfire-soc,hart-software-services,v$(HOST_MICROCHIP_HSS_PAYLOAD_GENERATOR_VERSION))
 # Some parts of the repository are under different licenses, but we
 # are only building/installing the code in
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
