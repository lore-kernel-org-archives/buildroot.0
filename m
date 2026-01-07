Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F683CF6BF3
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 07:35:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D614860D56;
	Wed,  7 Jan 2026 07:35:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ctFEyzENYJYz; Wed,  7 Jan 2026 07:35:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 56F4060C27
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767771300;
	bh=zd3RrPUMmf63p9kjTq2qkKKAuZwQoRyHPbvSa7OM++A=;
	h=To:CC:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=i+vqlnbBPztXF4YZH8E9YKwUbscEoB8dAu/XlWQv+vPrYWcmPfI7rCwmc9YYP6iFl
	 46c9AfgaPltcfd2r5ne3kYF47CQJxCGbGl4MonOF9+0w5KJltnaoLqpWfrp1wVNABL
	 MF0CgJyU9fFQtX1NbkANNRzJXCgub0n+v/5UGYhJcCqcXL3fLc1NNzyttor8ibvrV0
	 XAt7SWF5pvjNWZCI3qJSO4VSEPPDoXNv+e6gYyTIXuWFmcBS9q325ThPCnl3xnysCp
	 HMJXflI98wHHpkNaqeV3/xjwZUmf6lb/Vc8fYcIXTsS8GCe9KH+TEmt6nbz+WA0v6W
	 NZRMx5y01SaGw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 56F4060C27;
	Wed,  7 Jan 2026 07:35:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7641670B
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 07:34:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5D25A817A9
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 07:34:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pIGApQ298J_n for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 07:34:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=60.248.80.70;
 helo=atcsqr.andestech.com; envelope-from=cnoize@andestech.com;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1CB19817A1
Received: from Atcsqr.andestech.com (60-248-80-70.hinet-ip.hinet.net
 [60.248.80.70])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1CB19817A1
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 07:34:17 +0000 (UTC)
Received: from mail.andestech.com (ATCPCS34.andestech.com [10.0.1.134])
 by Atcsqr.andestech.com with ESMTPS id 6077Y7uL006956
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=OK)
 for <buildroot@buildroot.org>; Wed, 7 Jan 2026 15:34:07 +0800 (+08)
 (envelope-from cnoize@andestech.com)
Received: from swlinux02.andestech.com (10.0.15.183) by ATCPCS34.andestech.com
 (10.0.1.134) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 7 Jan
 2026 15:34:07 +0800
To: <buildroot@buildroot.org>
CC: Leo Yu-Chi Liang <ycliang@andestech.com>, Che-Wei Chuang
 <cnoize@andestech.com>
Date: Wed, 7 Jan 2026 15:34:00 +0800
Message-ID: <20260107073401.3004368-2-cnoize@andestech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260107073401.3004368-1-cnoize@andestech.com>
References: <20260107073401.3004368-1-cnoize@andestech.com>
MIME-Version: 1.0
X-Originating-IP: [10.0.15.183]
X-ClientProxiedBy: ATCPCS33.andestech.com (10.0.1.100) To
 ATCPCS34.andestech.com (10.0.1.134)
X-DKIM-Results: atcpcs34.andestech.com; dkim=none;
X-DNSRBL: 
X-MAIL: Atcsqr.andestech.com 6077Y7uL006956
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org; dmarc=permerror
 header.from=andestech.com
Subject: [Buildroot] [PATCH 1/2] DEVELOPERS: add Che-Wei Chuang for andes
 boards
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Che-Wei Chuang via buildroot <buildroot@buildroot.org>
Reply-To: Che-Wei Chuang <cnoize@andestech.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add Che-Wei Chuang as the maintainer for the Andes AE350 OP-TEE
board support and related defconfig.

Signed-off-by: Che-Wei Chuang <cnoize@andestech.com>
---
 DEVELOPERS | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 2dbd64a455..a59e143c35 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2593,6 +2593,10 @@ F:	configs/andes_ae350_45_defconfig
 F:	package/andes-spi-burn/
 F:	package/kmon/
 
+N:      Che-Wei Chuang <cnoize@andestech.com>
+F:      board/andes/ae350-optee/
+F:      configs/andes_ae350_45_optee_defconfig
+
 N:	Olaf Rempel <razzor@kopf-tisch.de>
 F:	package/ctorrent/
 
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
