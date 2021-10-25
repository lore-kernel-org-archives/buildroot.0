Return-Path: <SRS0=F6DF=PN=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86152C433EF
	for <buildroot@archiver.kernel.org>; Mon, 25 Oct 2021 14:30:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1883360F46
	for <buildroot@archiver.kernel.org>; Mon, 25 Oct 2021 14:30:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1883360F46
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D3B1380D79;
	Mon, 25 Oct 2021 14:30:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ORpfymYy0hFf; Mon, 25 Oct 2021 14:30:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5611F80D6A;
	Mon, 25 Oct 2021 14:30:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D664A1BF283
 for <buildroot@lists.busybox.net>; Mon, 25 Oct 2021 14:30:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C075180D6A
 for <buildroot@lists.busybox.net>; Mon, 25 Oct 2021 14:30:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HDhYk1_zskCK for <buildroot@lists.busybox.net>;
 Mon, 25 Oct 2021 14:30:02 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-qk1-x733.google.com (mail-qk1-x733.google.com
 [IPv6:2607:f8b0:4864:20::733])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8C56380D5F
 for <buildroot@buildroot.org>; Mon, 25 Oct 2021 14:30:02 +0000 (UTC)
Received: by mail-qk1-x733.google.com with SMTP id r15so11845769qkp.8
 for <buildroot@buildroot.org>; Mon, 25 Oct 2021 07:30:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tzkov1KpWxlb9VqZvbTEOC4mFbq1PXLQ7L5YqBkMvEo=;
 b=huwNe4wvR4soeYUbsBH+ZAnBf2b5ia/d1i41lSRweistMa8K+VtHH6H1ZGQ0EIqY6y
 X+IRn8cKcFRM4KpfOxfwHTASfYIw3WPZPO0FCDaAVFzRJ09iLZczSe3qYsX2DMdCY/iv
 AYQE3PB8hL5Tv9akpG9iuc94qTgQdb338nVTx6rO9WR5Abb3dnDMVYgtXZwmprRHNvoE
 VB7qMoZKCbugVDqdmLs3GksfFwTcFA8mI+9C4dxSMOGuh96eNoFlO5v8P3VuZw3wc38O
 vKXSImBIVcaph9qgj/I9GeuBA+sJrp9G9CADAKSFcls8HB+BtZrGjFzOouo6Zf/L2Dud
 rwvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tzkov1KpWxlb9VqZvbTEOC4mFbq1PXLQ7L5YqBkMvEo=;
 b=MMGflIs4Y41TD0eHe9r9+tPkMS1iSAPvOZBfCoH5nPEdz4d4htUkPgFy6idRFuXrRG
 aJjCkyHFzeXH0+K6pq2AP66l/kurmaMIRNSCmZF0UZjv0Pjwip4nJCW2rEx0G9L54Jjv
 aJH1kJKEmV6CuuTDBpQ+Ftfoc8sbb9U1AV4KawNq53UzG4yMlLMeBKjSZVTaH/k5ueY/
 FzdguMPgz6WnbqjG+DfYYg+qT4XGFM2a3xhwzfg9ItHPSJJJIr2x2G6d7YbW1QuTSunI
 9XezP5/sAg7pGsBZs51EgiOSKJvAIbFiWLN6qHruDUUTSpWrsX6+YscynSBtqD5gRuhC
 cOEQ==
X-Gm-Message-State: AOAM532FY0Z9Ow71/p++/QwqYMG5y2E7M+Zs3e0AFTMHKybHq7dK5qmf
 1eek0Y/EBp/opyEyNaUUKmX5sssqtUY=
X-Google-Smtp-Source: ABdhPJwtvFU/GxecMCOq8HYme8sNRKoz1mYf8t9NoKdGCRWSBkwSmiZb9wnYlhNV3R1gkz53nKA+8Q==
X-Received: by 2002:a37:6302:: with SMTP id x2mr13519355qkb.11.1635172201168; 
 Mon, 25 Oct 2021 07:30:01 -0700 (PDT)
Received: from localhost.localdomain ([2804:14c:485:504a:e9eb:ae64:5f52:f5bb])
 by smtp.gmail.com with ESMTPSA id
 z14sm8586475qkb.91.2021.10.25.07.29.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Oct 2021 07:30:00 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 25 Oct 2021 11:29:53 -0300
Message-Id: <20211025142953.2339444-1-festevam@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] configs/imx6ullevk: bump U-Boot and kernel
 versions
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

Bump U-Boot to 2021.10 and kernel to 5.14.14.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 configs/imx6ullevk_defconfig | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/configs/imx6ullevk_defconfig b/configs/imx6ullevk_defconfig
index 81db66268a..06641f1458 100644
--- a/configs/imx6ullevk_defconfig
+++ b/configs/imx6ullevk_defconfig
@@ -3,8 +3,8 @@ BR2_arm=y
 BR2_cortex_a7=y
 BR2_ARM_FPU_NEON_VFPV4=y
 
-# Linux headers same as kernel, a 5.7 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_7=y
+# Linux headers same as kernel, a 5.14 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_14=y
 
 # system
 BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
@@ -12,7 +12,7 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
 # kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.7.8"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.14.14"
 BR2_LINUX_KERNEL_DEFCONFIG="imx_v6_v7"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6ull-14x14-evk"
@@ -22,7 +22,7 @@ BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BOARDNAME="mx6ull_14x14_evk"
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2020.07"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2021.10"
 BR2_TARGET_UBOOT_FORMAT_DTB_IMX=y
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
