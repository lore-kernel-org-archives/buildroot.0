Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77CADC021B8
	for <buildroot@archiver.kernel.org>; Wed, 26 Feb 2025 20:51:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3363060647;
	Wed, 26 Feb 2025 20:51:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Rg1VqDrTxvkh; Wed, 26 Feb 2025 20:51:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3670E60A59
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3670E60A59;
	Wed, 26 Feb 2025 20:51:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7F0A068
 for <buildroot@buildroot.org>; Wed, 26 Feb 2025 20:51:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6EAF4832BF
 for <buildroot@buildroot.org>; Wed, 26 Feb 2025 20:51:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pY4_BNZKwoXP for <buildroot@buildroot.org>;
 Wed, 26 Feb 2025 20:51:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::631; helo=mail-pl1-x631.google.com;
 envelope-from=festevam@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 80AD6832B0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 80AD6832B0
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com
 [IPv6:2607:f8b0:4864:20::631])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 80AD6832B0
 for <buildroot@buildroot.org>; Wed, 26 Feb 2025 20:51:51 +0000 (UTC)
Received: by mail-pl1-x631.google.com with SMTP id
 d9443c01a7336-22101839807so3028225ad.3
 for <buildroot@buildroot.org>; Wed, 26 Feb 2025 12:51:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740603110; x=1741207910;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Hna7FJcVgcSRLC6kulk91gw78Txcy2zKuqTkiUOrUAA=;
 b=U8+oYMS6NyO6qlcjnD4wCg7nDwvugbi7d6UfOWr7ZxgDQ1LWwGSQpbCX7fxvZY6kpB
 N4CKzziwRmZcwQeRWZDDVxW+cNpy4oBTN1uu97bCX1e/IuwG6X5dw5jNh/Fn18y4ELPo
 Kdzg7nQi7C5iJSYTKyhTA9MV4ow6/db8l/l9atXuqYUTny6eHWOmIV7HC/0lWRCvj/aK
 ADSYmq1CYyb841/Tez5yk92ID8/ZkOJwT1BQXSX+mekxGscmhlxk3m9u0mitsDIgDpBe
 e5tikmDD8vvcVb3+mHMtl3YYKzuMx/npOO/SHs1qwXUiWrZ3muR2+oCLljvaf9+OBgrU
 uLKg==
X-Gm-Message-State: AOJu0YwXxbn7hZ3K+GgYpua0wkdDiyVUxf+kwoDHZUYhkZFLRugRSMsA
 ax6STdtpYkr9yEglcDlyAa5kg4QmzEgGxs0aknEEB0uBHXTIdk+tw+kDrg==
X-Gm-Gg: ASbGncs37vaysqypPt0tEwx93FKnFnXWpmAyye+rMNz8u09wwAELaAR/VzkYHgIWuSA
 XP+3Ad4CJHxe/i0e0Y9o6KupYxIkPChJBs0/MX1ojRtooUrxdLfhKOj58f/esym993VpM+HuedE
 G2MxYKyDNH4h6lkbZdR7IArJmVCwfSurvUqsaXBXMa+OL+Wk0mS85Xt92mmr/hw4yRN/3fQoNO4
 PCv2ikvnUDOkXrKIX0TRqpckzAMR0fAo8BucgyMOSbt8rlJiPDJuG1tdXgEP1GIuvtXZgpl08vZ
 r1Id1fpA6zrDBSgHNU3zTuUUn7AS6FlbmdHtA5+x
X-Google-Smtp-Source: AGHT+IHWfEHoPwAm5yVm+DItURNBsw43DFA4agkAwzp0qWfnzE7Rpo9cZiZdgI29Iguui9j91vdqJg==
X-Received: by 2002:a05:6a20:2447:b0:1ee:8520:f979 with SMTP id
 adf61e73a8af0-1f10aecf237mr9868659637.36.1740603109811; 
 Wed, 26 Feb 2025 12:51:49 -0800 (PST)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:e9d4:2e72:39f5:e5da])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7347a6f9ea7sm4146423b3a.65.2025.02.26.12.51.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Feb 2025 12:51:49 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: buildroot@buildroot.org
Cc: Fabio Estevam <festevam@gmail.com>
Date: Wed, 26 Feb 2025 17:51:43 -0300
Message-Id: <20250226205144.1843356-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740603110; x=1741207910; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Hna7FJcVgcSRLC6kulk91gw78Txcy2zKuqTkiUOrUAA=;
 b=SLzL6aR99AKm8N1r1qIUvDddgYQmFlIJ9A04TgYYnh2hNDTexa15woHLvNOHba6pl8
 FrBWe5cgAs/EaeZYZkAa4jmfnouaMDBqAwt8U9q3Sbs+/vmz+bnu3As8+G5TbsnNpn0d
 RAnHUTDY6r3B1p4b7Km1lBFvVpXS3RefL4exLZYyxqj0PKJ4WOTw5XcauqDN7xrAKnuS
 X6xhOYDtlBLnuRoW10rFKhI7XDWD9pDl7VXBXaE3v80/ZXHJ7+fJrS76scwCqVEohwYF
 JeBAzR5PjH6mEjuqWyfgZc3dnrcyUG4lI7c3f1sn72HyGNjWaMCBwUNhBvPzTRVjzXSp
 Hd8g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=SLzL6aR9
Subject: [Buildroot] [PATCH 1/2] package/freescale-imx: Allow firmware
 installation on i.MX93
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Currently, the LPDDR firmware binaries do not get installed into the
U-Boot mainline directory, causing U-Boot build to fail for i.MX93.

Fix this problem by expanding the BR2_PACKAGE_FIRMWARE_IMX_NEEDS_DDR_FW
checks to also take BR2_PACKAGE_FIRMWARE_IMX_NEEDS_DDR_FW_IMX9 into account.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 boot/uboot/Config.in                         | 1 +
 package/freescale-imx/firmware-imx/Config.in | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index f17f932c9e95..10098ed227b6 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -314,6 +314,7 @@ config BR2_TARGET_UBOOT_NEEDS_IMX_FIRMWARE
 	bool "U-Boot needs firmware-imx"
 	depends on BR2_PACKAGE_FIRMWARE_IMX
 	depends on BR2_PACKAGE_FIRMWARE_IMX_NEEDS_DDR_FW || \
+		BR2_PACKAGE_FIRMWARE_IMX_NEEDS_DDR_FW_IMX9 || \
 		BR2_PACKAGE_FIRMWARE_IMX_NEEDS_HDMI_FW
 	help
 	  Some i.MX8 platforms (such as i.MX8 M, i.MX 8M Mini, i.MX 8M
diff --git a/package/freescale-imx/firmware-imx/Config.in b/package/freescale-imx/firmware-imx/Config.in
index 4a9986448f8b..17c10039b2ce 100644
--- a/package/freescale-imx/firmware-imx/Config.in
+++ b/package/freescale-imx/firmware-imx/Config.in
@@ -62,7 +62,7 @@ config BR2_PACKAGE_FIRMWARE_IMX_NEEDS_DDR_FW_IMX9
 	default y if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX91
 	default y if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX93
 
-if BR2_PACKAGE_FIRMWARE_IMX_NEEDS_DDR_FW
+if BR2_PACKAGE_FIRMWARE_IMX_NEEDS_DDR_FW || BR2_PACKAGE_FIRMWARE_IMX_NEEDS_DDR_FW_IMX9
 
 choice
 	bool "DDR training binaries"
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
