Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79989C77B76
	for <buildroot@archiver.kernel.org>; Sat, 22 Apr 2023 13:38:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0FEEE60E1D;
	Sat, 22 Apr 2023 13:38:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0FEEE60E1D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Uu1YPcn3tuAt; Sat, 22 Apr 2023 13:38:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4641060BA1;
	Sat, 22 Apr 2023 13:38:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4641060BA1
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 60E031C2909
 for <buildroot@lists.busybox.net>; Sat, 22 Apr 2023 13:38:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 46F3460BA1
 for <buildroot@lists.busybox.net>; Sat, 22 Apr 2023 13:38:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 46F3460BA1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yftI9Ilgcm_R for <buildroot@lists.busybox.net>;
 Sat, 22 Apr 2023 13:38:42 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 686CE60812
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 686CE60812
 for <buildroot@buildroot.org>; Sat, 22 Apr 2023 13:38:42 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-9505214c47fso470324466b.1
 for <buildroot@buildroot.org>; Sat, 22 Apr 2023 06:38:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682170720; x=1684762720;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=637L3aNEh4Zp6Y5vb3M1HN7N0gxBcBK2LoQnzYpogFk=;
 b=ET8owlMZtMZM0suv/On03lK9WL0nRZEwZc1v8J3NuNS6UQFm6BoMsgEtojv03ug6QX
 hRu4IauC1e4W05ZO2KPnq+MYrvRDFEBArWeIZ3Do51sohcDalhg4lG0b/LbLyU7tylZy
 IxnuHKlAC1b9dY6aZ7VG4gwbveLQdPAjN6o5ESqtMcfJM7EZOfGoBVdqF7EwaAgEomx0
 hHgMLDe73L82jTao/CqMAnK+qaGHeFdOwce1WbqXdS1vm+vyiz+YubbxwfiHXMbu/Fzf
 ayUjVEhzDKeL+j+kf7HYvGD1QvCEr9lcZY397Ijf2a87ZSe24FfkOtFaryLZeo+VmFn7
 1h4w==
X-Gm-Message-State: AAQBX9cQY06QqHVyR0fLlhU0FJoeiG9AidirN9CGftRFC+55fsM0xG9t
 +ToYjoIijA0yasvEaQt18EJUksgmtu5tq/oW10PwGg==
X-Google-Smtp-Source: AKy350Ye7vYv6HLb7X6W2pFZY1MLnZ8YDrX4Krq9A+vbZkprLsTGFoVYhV0iwF2pk2Veb+SSkNZgPA==
X-Received: by 2002:a17:906:8993:b0:94e:fe0f:b2be with SMTP id
 gg19-20020a170906899300b0094efe0fb2bemr4697787ejc.14.1682170720225; 
 Sat, 22 Apr 2023 06:38:40 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-87-5-99-194.retail.telecomitalia.it. [87.5.99.194])
 by smtp.gmail.com with ESMTPSA id
 p23-20020a170906499700b0094f17b7c4b0sm3247707eju.134.2023.04.22.06.38.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Apr 2023 06:38:39 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Sat, 22 Apr 2023 15:38:34 +0200
Message-Id: <20230422133834.608978-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1682170720; x=1684762720;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=637L3aNEh4Zp6Y5vb3M1HN7N0gxBcBK2LoQnzYpogFk=;
 b=HhSE3/aYIgzTfpYuAVJ9kK2Fpnyp0T/M9oBeiLgfGYel0Zfnr29OuIaV/SFKjiv5ax
 r5e4f2flc8d8G0dhfATSSBQ6v3rX2hGz/z8LUYHBnlBGe2CigYtRg2IYcdC1TdJBS1L3
 6ZSVpYaLlk2iYaPeQuSk6k/OVrIwjt16ZguX0=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=HhSE3/aY
Subject: [Buildroot] [PATCH 1/1] configs/stm32f469_disco_sd_defconfig: bump
 U-Boot version to 2023.04
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
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Christophe Priouzeau <christophe.priouzeau@foss.st.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Bump U-Boot to version 2023.04.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 configs/stm32f469_disco_sd_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/stm32f469_disco_sd_defconfig b/configs/stm32f469_disco_sd_defconfig
index dc00a47e1da2..4ec873b3bbe8 100644
--- a/configs/stm32f469_disco_sd_defconfig
+++ b/configs/stm32f469_disco_sd_defconfig
@@ -20,7 +20,7 @@ BR2_TARGET_ROOTFS_EXT2_SIZE="32M"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2021.10"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2023.04"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="stm32f469-discovery"
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
