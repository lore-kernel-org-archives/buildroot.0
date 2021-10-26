Return-Path: <SRS0=o+05=PO=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41095C433F5
	for <buildroot@archiver.kernel.org>; Tue, 26 Oct 2021 17:23:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F37966103C
	for <buildroot@archiver.kernel.org>; Tue, 26 Oct 2021 17:23:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F37966103C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9D89B80D86;
	Tue, 26 Oct 2021 17:23:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id heW835WKuRgC; Tue, 26 Oct 2021 17:22:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0D39380D5A;
	Tue, 26 Oct 2021 17:22:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9B33F1BF873
 for <buildroot@lists.busybox.net>; Tue, 26 Oct 2021 17:22:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 964C740218
 for <buildroot@lists.busybox.net>; Tue, 26 Oct 2021 17:22:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CNh82L5EcXVc for <buildroot@lists.busybox.net>;
 Tue, 26 Oct 2021 17:22:56 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-qt1-x832.google.com (mail-qt1-x832.google.com
 [IPv6:2607:f8b0:4864:20::832])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5C1C9400BE
 for <buildroot@buildroot.org>; Tue, 26 Oct 2021 17:22:56 +0000 (UTC)
Received: by mail-qt1-x832.google.com with SMTP id g17so14216414qtk.8
 for <buildroot@buildroot.org>; Tue, 26 Oct 2021 10:22:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NIPHUYxdAqbcYS2TYq/ha4NZcm6XvFu0h9nPnODyog0=;
 b=bkfFFcJbfZUWDNzEAjdWkRmXXTXrMBD49VlOLK+nwdTMtUW+WdCma7hDqGVRrqDsA3
 I3kFCO5YYsp4yYMvy5YdPdwmuDQ8uxgrKnD/egTN7fuoeywEG5lPQxyFCrOTaAinguBC
 UjXSRRVXvcq3XHEX3OcqFPvSRluNeHoYIhh1ZDFV+JJV6EpH0Ufp1sp+Yy9lterq5qf3
 E8F0rhn5b0onCNbuVduYC6wgYDcI0X7Lgx+h9vffXirNcdDuDDxNpjIH4G9gp9iT2mPx
 gTnOt6nb8l7Xiqmw23ZiGFJcaQ4WfSBivJP8HpgI7OnH/7Bwj2H0PTAL0U6CdgoES1/q
 Kltg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NIPHUYxdAqbcYS2TYq/ha4NZcm6XvFu0h9nPnODyog0=;
 b=Js61JpAnzBqcapsodVb9ftIlION8hyacV4NqeE0LOW315ZsIiqERRZ8R9f51Y/iE/q
 6iCFzFBDHpDkfCWn8Qybh8rchf97qOLaHr2mptYlirjJCOLSibdhFHj13x1IRTQKnYgo
 PldI5+2sjfYYDR870p/QksjlfJfLKU6zl54m0SgsiMA2DeGrGuQxtZTTfsCnB+xH+2cR
 19NiZueJkPdDkNFYmKy4V+NBmAXqNM0xbZ7XSA8LLEbaN2XN/w4jTHA+FJFSpSbzOlpK
 7YdHLFgff/qeZZgMWwh1sf+KyTSXnbA847ZKioOJsT/A9EZFFgjqDBAYyrBo42QhBB3V
 pZQA==
X-Gm-Message-State: AOAM530m9b0iTLWdVutz37yIMRxCZiW9n1f7puQ21EgqXDPWBeiAHSDD
 rPY5YvC63KtPyopvr8XdmadHuDbqxBE=
X-Google-Smtp-Source: ABdhPJxeYMjKAfSqzkB3Dho2d2Nhe+0GWZ5WaLpOsLRtc1EyBl9/fuPtqWCHRA2xBJgwYxREgYyiRA==
X-Received: by 2002:ac8:7059:: with SMTP id y25mr25708240qtm.404.1635268970919; 
 Tue, 26 Oct 2021 10:22:50 -0700 (PDT)
Received: from localhost.localdomain ([2804:14c:485:504a:42ce:e117:2dc6:70d3])
 by smtp.gmail.com with ESMTPSA id
 bq41sm11262437qkb.26.2021.10.26.10.22.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Oct 2021 10:22:50 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 26 Oct 2021 14:22:42 -0300
Message-Id: <20211026172242.4051380-1-festevam@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] configs/warp7: bump Kernel and U-Boot versions
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
Cc: Fabio Estevam <festevam@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Bump U-Boot to 2021.10 and kernel to version 5.14.14.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 configs/warp7_defconfig | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/configs/warp7_defconfig b/configs/warp7_defconfig
index 23ae4c225716..830d5187c8c3 100644
--- a/configs/warp7_defconfig
+++ b/configs/warp7_defconfig
@@ -3,8 +3,8 @@ BR2_arm=y
 BR2_cortex_a7=y
 BR2_ARM_FPU_NEON_VFPV4=y
 
-# Linux headers same as kernel, a 5.13 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_13=y
+# Linux headers same as kernel, a 5.14 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_14=y
 
 # system
 BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
@@ -15,7 +15,7 @@ BR2_ROOTFS_OVERLAY="board/warp7/rootfs_overlay"
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.13"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.14.14"
 BR2_LINUX_KERNEL_DEFCONFIG="imx_v6_v7"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx7s-warp"
@@ -25,7 +25,7 @@ BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BOARDNAME="warp7"
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2021.07"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2021.10"
 BR2_TARGET_UBOOT_FORMAT_DTB_IMX=y
 
 # wifi firmware for brcm43430
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
