Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E270C4332F
	for <buildroot@archiver.kernel.org>; Sun,  6 Nov 2022 10:21:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2941C60B36;
	Sun,  6 Nov 2022 10:21:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2941C60B36
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LgqZa4gQlDSt; Sun,  6 Nov 2022 10:21:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8126260B28;
	Sun,  6 Nov 2022 10:21:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8126260B28
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 907671BF5AA
 for <buildroot@lists.busybox.net>; Sun,  6 Nov 2022 10:21:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 681E181B71
 for <buildroot@lists.busybox.net>; Sun,  6 Nov 2022 10:21:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 681E181B71
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id k8W1NeSP4Sjk for <buildroot@lists.busybox.net>;
 Sun,  6 Nov 2022 10:21:20 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 567D781B69
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 567D781B69
 for <buildroot@buildroot.org>; Sun,  6 Nov 2022 10:21:20 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id a67so13411227edf.12
 for <buildroot@buildroot.org>; Sun, 06 Nov 2022 02:21:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5FXPOPn0a5p7Kae5KTxcskrwrCFf2zQ6ueEBmsJAEJA=;
 b=rZ8uqD57FA7O4U5uE/1srYQBPrh2XH42jA96C7lR4YUPGCZlCQcJbKp1b6r4pPdOAM
 moUqEtjboyXeMOuUw63WgMC0wziMaOF0/KgQTw+gm7u6TIOnlYnO+Vj8EGvhQtYAoikR
 8898CgIBvET8//8kl6Di6UAvLLhOgJZa9zYLjqsJgd28M8J4cBs232L66DZDddO7Y8az
 YWY6uEbtT3NPXP2DSfKqJg7eI9gl79hlT5lrJb4e2urOcXcqshM7TLcE/sxlFGVGsLgo
 kODJ8qN/01wrO4ji2+aVcGwYMfBIrH/gksu6Xx+5bAC4NmN/hmgFpHSS4TN0E9L4tcpb
 W3zg==
X-Gm-Message-State: ACrzQf1Hvq9rX8/SHvqWln0XxY4dEW0KTVZt2Nbkcuol6Mi1BGjsPtjR
 rOdDuah8NrG1w3vSGABZmETI0WL5S7U=
X-Google-Smtp-Source: AMsMyM73bGTTL/Q/7NM8oSQjwtHZj60duK2hlJrOYzzJkiGAsFn0T66cuuRpP54hg1IIrIBh5eeExQ==
X-Received: by 2002:a05:6402:1771:b0:463:c94d:c7d9 with SMTP id
 da17-20020a056402177100b00463c94dc7d9mr26324642edb.135.1667730077602; 
 Sun, 06 Nov 2022 02:21:17 -0800 (PST)
Received: from t450s.fritz.box (ip4d15a215.dynamic.kabel-deutschland.de.
 [77.21.162.21]) by smtp.gmail.com with ESMTPSA id
 ky14-20020a170907778e00b0073c8d4c9f38sm1966445ejc.177.2022.11.06.02.21.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Nov 2022 02:21:16 -0800 (PST)
From: Heiko Thiery <heiko.thiery@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  6 Nov 2022 11:20:45 +0100
Message-Id: <20221106102046.13138-1-heiko.thiery@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=5FXPOPn0a5p7Kae5KTxcskrwrCFf2zQ6ueEBmsJAEJA=;
 b=L5VOdtJ2DAqS0ct5wShYBLYCdIwfRKDpDXkmVD7HNCKBSywRApmIdq35eys6x0di1c
 RuWGP1NmtWR76G8RcXOzkqaCSGGDRIB438sSt4nD/2pikLgyYPH7EVcPuG1O5+fGAKZn
 SGbaaYAn6PIri3P2JY0lR8Iew6CewlxhVRwqCfZ5XIHtJyzbSZp855E25Eve/7Ia2+zG
 5zaMYUlZgAiJ5hDMhtv+bCFSJxyz5jRyWaZ1PSgAxgRhPxfEFuDODaqVVHBVnjrpOTW/
 5gXMMlem9OGNcVum26bEBgqcFDEpjzCQfkJexkyV+tdfcuJWaASVkZsnfwkI6mJiix3e
 p4vA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=L5VOdtJ2
Subject: [Buildroot] [PATCH] configs/kontron_bl_imx8mm_defconfig: bump
 U-boot to 2022.10
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
Cc: Michael Walle <michael@walle.cc>, Heiko Thiery <heiko.thiery@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes: https://gitlab.com/buildroot.org/buildroot/-/jobs/3267233833

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
---
 configs/kontron_bl_imx8mm_defconfig | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/configs/kontron_bl_imx8mm_defconfig b/configs/kontron_bl_imx8mm_defconfig
index ff376662e9..240cb52245 100644
--- a/configs/kontron_bl_imx8mm_defconfig
+++ b/configs/kontron_bl_imx8mm_defconfig
@@ -38,7 +38,7 @@ BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES="IMX_BOOT_UART_BASE=0x30880
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2022.04"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2022.10"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="kontron-sl-mx8mm"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_PYTHON3=y
@@ -48,6 +48,7 @@ BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
 BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
 BR2_TARGET_UBOOT_NEEDS_ATF_BL31_BIN=y
 BR2_TARGET_UBOOT_NEEDS_IMX_FIRMWARE=y
+BR2_TARGET_UBOOT_NEEDS_UTIL_LINUX=y
 BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
 BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="flash.bin"
 BR2_TARGET_UBOOT_SPL=y
-- 
2.20.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
