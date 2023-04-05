Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC08DC76188
	for <buildroot@archiver.kernel.org>; Wed,  5 Apr 2023 09:33:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5068840258;
	Wed,  5 Apr 2023 09:33:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5068840258
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Zb9-OrXRwMf0; Wed,  5 Apr 2023 09:33:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5C62240264;
	Wed,  5 Apr 2023 09:33:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5C62240264
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0E6251C2A1D
 for <buildroot@lists.busybox.net>; Wed,  5 Apr 2023 09:33:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DC42060B05
 for <buildroot@lists.busybox.net>; Wed,  5 Apr 2023 09:33:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DC42060B05
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nGEofUZSsEEE for <buildroot@lists.busybox.net>;
 Wed,  5 Apr 2023 09:33:24 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 951E560ADF
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 951E560ADF
 for <buildroot@buildroot.org>; Wed,  5 Apr 2023 09:33:24 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-50240a3b7fcso319772a12.0
 for <buildroot@buildroot.org>; Wed, 05 Apr 2023 02:33:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680687202;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1EWg01+oaTIOS2XhqUWutB0WzClCtM4vSlgBpHrpY/Q=;
 b=Scppj3W7pHoHDv1LX/IwdEiSX5sTuCh8+hOMyOdaoa8EssQU5IzhSPthpZD6dLXlQA
 7Lxd31qJwbA0/SVtjyOCuk3MxnZqNlDr98pNUCsuVsWxA4SDnP3SXnso1OS9HVA94kCz
 0eFXBIHhmD+qAYBKjHCRXlN5x/4MyVzP81/JVNw+ng29Y6JpaJ0j8G8MDCKqipscHkQr
 WufzbO+9fHPsGHpEw8di88Kg+NpvuYdaOPvjsnewgHI/S5Q5eCt/cJ4DxNxiRYuJXQoS
 ZIzmuPJjFpWsYRaCQ5GRL+jPq4PyU6G5XKtMMki0gcnZZhz2BV1qL6hXr2DtJcWpADVU
 0R2A==
X-Gm-Message-State: AAQBX9fG/Y3SJ26A9hi1jp5fw/x0soV0De7zVCMRB2UV7OqBaaukjDRY
 FASRjG0vksuebyAJVti+B5sNBO//+C8XD6qNtps=
X-Google-Smtp-Source: AKy350YrHZVVfxKHBJX2CnciBG5cm9Rh4haabpvbpextAjLsiCWQFzj883tQjfpvn2ojvkZbJhG5ow==
X-Received: by 2002:aa7:c303:0:b0:4fa:e1fd:5a30 with SMTP id
 l3-20020aa7c303000000b004fae1fd5a30mr1320507edq.19.1680687202356; 
 Wed, 05 Apr 2023 02:33:22 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-82-60-28-18.retail.telecomitalia.it. [82.60.28.18])
 by smtp.gmail.com with ESMTPSA id
 u23-20020a50d517000000b004af720b855fsm6993297edi.82.2023.04.05.02.33.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Apr 2023 02:33:22 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Wed,  5 Apr 2023 11:33:17 +0200
Message-Id: <20230405093317.13045-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20230405093317.13045-1-dario.binacchi@amarulasolutions.com>
References: <20230405093317.13045-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1680687202;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1EWg01+oaTIOS2XhqUWutB0WzClCtM4vSlgBpHrpY/Q=;
 b=DcYexGeeMZOoCkJrZ/Wbb50blDaLbuADM/GPOKD/8j8ky+g9B0pjTDfetRWh96/YdP
 1DIPkYexkdQImr8lNQfMgR/CvvDmdXPNgM+eUrLclq9qPdS0MrWIXGqJjihb7++mvcxm
 dlQM06eMlbsh0eh8tobcH0S0n7yjUKvfsP/DA=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=DcYexGee
Subject: [Buildroot] [PATCH 2/2] configs/imx8mn_bsh_smm_s2_pro_defconfig:
 bump U-Boot version to 2023.04
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
Cc: Michael Trimarchi <michael@amarulasolutions.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Ariel D'Alessandro <ariel@vanguardiasur.com.ar>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Bump U-Boot to version 2023.04.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 configs/imx8mn_bsh_smm_s2_pro_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/imx8mn_bsh_smm_s2_pro_defconfig b/configs/imx8mn_bsh_smm_s2_pro_defconfig
index ebef4e5932c1..e9ff244a3555 100644
--- a/configs/imx8mn_bsh_smm_s2_pro_defconfig
+++ b/configs/imx8mn_bsh_smm_s2_pro_defconfig
@@ -28,7 +28,7 @@ BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES="IMX_BOOT_UART_BASE=0x30a60
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2022.07"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2023.04"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="imx8mn_bsh_smm_s2pro"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
