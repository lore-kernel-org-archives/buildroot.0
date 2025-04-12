Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A905C369B1
	for <buildroot@archiver.kernel.org>; Sat, 12 Apr 2025 18:40:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C61C5607FC;
	Sat, 12 Apr 2025 18:40:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ws4kyNgBmLAT; Sat, 12 Apr 2025 18:40:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0BE386108D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0BE386108D;
	Sat, 12 Apr 2025 18:40:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 668A1138
 for <buildroot@buildroot.org>; Sat, 12 Apr 2025 18:40:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 582026F525
 for <buildroot@buildroot.org>; Sat, 12 Apr 2025 18:40:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jQPqGeLRfgfX for <buildroot@buildroot.org>;
 Sat, 12 Apr 2025 18:40:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=198.47.23.235;
 helo=lelvem-ot02.ext.ti.com; envelope-from=bb@ti.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org CC0BB6108D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CC0BB6108D
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CC0BB6108D
 for <buildroot@buildroot.org>; Sat, 12 Apr 2025 18:40:05 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53CIe3Y62337815
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <buildroot@buildroot.org>; Sat, 12 Apr 2025 13:40:03 -0500
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53CIe3Uv033592
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
 for <buildroot@buildroot.org>; Sat, 12 Apr 2025 13:40:03 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Sat, 12
 Apr 2025 13:40:03 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Sat, 12 Apr 2025 13:40:03 -0500
Received: from localhost (bb.dhcp.ti.com [128.247.81.12])
 by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53CIe31u120602;
 Sat, 12 Apr 2025 13:40:03 -0500
Date: Sat, 12 Apr 2025 13:39:59 -0500
MIME-Version: 1.0
Message-ID: <20250412-optee-fixes-v1-1-14bf0f629d1a@ti.com>
References: <20250412-optee-fixes-v1-0-14bf0f629d1a@ti.com>
In-Reply-To: <20250412-optee-fixes-v1-0-14bf0f629d1a@ti.com>
To: <buildroot@buildroot.org>
CC: Bryan Brattlof <bb@ti.com>
X-Mailer: b4 0.13.0
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1744483203;
 bh=QpNwHvFAEbwTtBNMoyyf3uB3gq2itySX1uyQDx4BYGs=;
 h=From:Date:Subject:References:In-Reply-To:To:CC;
 b=cfHexb0Oi3OHm1Iivmb2ZUBpwTdx52koF9EbxIbGvespMwmvNBoFo4pKr1slpA54p
 L3J18aueAGnuR2LT/Q3CcZxSXkZFH3QKAhqb+Not4BuiN3Gh+1qaQVw7YT03f/YyK6
 Zm79CgzwEmstWwHx/ciBua92xz+62esogSf+3YoI=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=ti.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=cfHexb0O
Subject: [Buildroot] [PATCH 1/2] configs/ti_am62ax_sk_defconfig: switch to
 am62x op-tee platform flavor
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
From: Bryan Brattlof via buildroot <buildroot@buildroot.org>
Reply-To: Bryan Brattlof <bb@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

There is unfortunately no SA2UL_BASE defined for the am62ax in op-tee
which is causing the op-tee builds to fail however the platform is
identical to the am62x platform. So for now let's switch to using the
am62x which has the proper configuration for this SoC even if it's
mislabeled

Signed-off-by: Bryan Brattlof <bb@ti.com>
---
 configs/ti_am62ax_sk_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/ti_am62ax_sk_defconfig b/configs/ti_am62ax_sk_defconfig
index 68a0e0fb9db35..0b3ebe6242a5c 100644
--- a/configs/ti_am62ax_sk_defconfig
+++ b/configs/ti_am62ax_sk_defconfig
@@ -23,7 +23,7 @@ BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="k3"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_TARGET_BOARD="lite"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL32_OPTEE=y
 BR2_TARGET_OPTEE_OS=y
-BR2_TARGET_OPTEE_OS_PLATFORM="k3-am62ax"
+BR2_TARGET_OPTEE_OS_PLATFORM="k3-am62x"
 BR2_TARGET_TI_K3_R5_LOADER=y
 BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_VERSION=y
 BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_VERSION_VALUE="2024.07"

-- 
2.48.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
