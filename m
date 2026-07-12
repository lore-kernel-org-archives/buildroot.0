Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7242DC43458
	for <buildroot@archiver.kernel.org>; Sun, 12 Jul 2026 08:06:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E1BC0816D9;
	Sun, 12 Jul 2026 08:06:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K8XswN3W_VUg; Sun, 12 Jul 2026 08:06:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1AE3280DDF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783843591;
	bh=WICtTMtVtHHrxrb20PXpuzUaj0tiPu8EWXT6La5H2VU=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=WVV/ZRC7VUJTi7x9uWsF50Mfn86vxQToQ79IQVZf7flTGdEYc/Eo/WstYY5nqgr+I
	 OEffF+ln86cG3533DVjJg0z8POrvT6w1QhxtJP98VUTXh49qHgruFyWDKCKCQolgTb
	 nPjVNGFpYWTSeUUJdS9D2Bgyk7pX6b7JyXsJugNOSHe5Ql06UClVkwdF+OS9fREw8g
	 jDZ+B2KhHts3f99B6mB1kHIrLTu5pIs1RZz4E/8NW7jjRAVA9NekmYPD80H+lGhTgp
	 LuCfrRuDrQOf1iyZiMlf+skygDa11CnYd/q5f77e0BX5HdvbzctljGChxfWcSSEA80
	 c4pligt0OrFxw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1AE3280DDF;
	Sun, 12 Jul 2026 08:06:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 5517E359
 for <buildroot@buildroot.org>; Sun, 12 Jul 2026 08:06:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 469AC40CA2
 for <buildroot@buildroot.org>; Sun, 12 Jul 2026 08:06:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YBuigQOj41-k for <buildroot@buildroot.org>;
 Sun, 12 Jul 2026 08:06:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 352F540C1B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 352F540C1B
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 352F540C1B
 for <buildroot@buildroot.org>; Sun, 12 Jul 2026 08:06:28 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-493c733f15aso21920065e9.0
 for <buildroot@buildroot.org>; Sun, 12 Jul 2026 01:06:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783843587; x=1784448387;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=05wTsy1dSyTHu+/3Wn8yam7mWPMcAbjylIjOCNBkoJU=;
 b=eYU9+K/ElQI2CHwGfB5h2VaIvqkEc61aGbE5m+7IE0T+uiAADbj/Up5/j31FjXHdnA
 NDAGYodWhPUfMfpmSMKKr6M92ePeV8sMwV77V/J23g6uYil8tv1UEgasQr1+oqzYfbV8
 eLpKeI7tCmKnjHX87TpGyDQcvwO0nkz6dd7d8kNur5lpukPmI5Sm0kcL59DNTiiEh30R
 pye/bnVrtlyXlEcmsNeEruZtrLDeockeJ33xyaGig9TlIDDits3q3w9wNXWh5o0GZLaJ
 vB0uRO5Jj/Q//v5utHn7erYfEYJtJfPtewGF1EzB3MapS5P6FQbd4+0kMcXnv8O5AESe
 iyuA==
X-Gm-Message-State: AOJu0YxeSsWF97R99nwGYAeuIuI5GkhJU0OPZmC3RtM1m2Amkwut0K1D
 HmIMKRT3Oq+stP56wCFfgryYiVegUSupUSunmOnqz5A7mzoeX/qYoqfmF0dtQb6sK5cm+h3X8u8
 ShK8OavE=
X-Gm-Gg: AfdE7ckuL3F+s9V16Oaxg2l4tnhDvBSbDlL3HrAj9DP2gYruispIMc91+mo08OkcXm0
 pDtuWyjmb/HzT1KBB8axvkCXX5+RA0M5+QeDHVpD8NluTitXaVb6bnPHOhsXlPb3AAdhcLPLxox
 1pxGzQhLIfbyiFMBXkAv1reL3w/QS85H0h2+k8KdQlHaJgsX8DmpnDa9SrDNuY9s2QBylUMvnJN
 EjqaMcdQHtatrAx78A25y7lzPHEqcl8g6eE7Met8D7vXJheFEorUPK4eup6jUdyYbWux6YhKP2N
 BVUKYX6ncLCPNSXb3J4TZO3Xi8rkyZ48SqRkbarYRstArXDEVYfclEac5wC7PRWX5uQCiol3+MX
 4RuT/iZKpxDr1YTjTeVDk71ikyuyt4nF///3N6otTkvAO8lzqB98/goCQR5Qo99bBQhsTY2rgyG
 0Kze6hn1zZVGkSLrjReLJeY2hnJBzgV5K30tTPiaHVrykvo6v2PjQUsVp6wi2xrIQyCEAfh0lyg
 96+n0RPgam09mhDToHUDtXBfw/6dPDxZ1wKFoMuCUqr
X-Received: by 2002:a05:600c:8b72:b0:494:df:8895 with SMTP id
 5b1f17b1804b1-49400df89a3mr3340035e9.24.1783843586874; 
 Sun, 12 Jul 2026 01:06:26 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it
 ([95.236.93.155]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493eb74835esm292954235e9.14.2026.07.12.01.06.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Jul 2026 01:06:26 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Anand Gadiyar <gadiyar@ti.com>, Bryan Brattlof <bb@ti.com>,
 Xuanhao Shi <X15000177@gmail.com>, linux-amarula@amarulasolutions.com,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Sun, 12 Jul 2026 10:06:22 +0200
Message-ID: <20260712080622.1335409-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1783843587; x=1784448387;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=05wTsy1dSyTHu+/3Wn8yam7mWPMcAbjylIjOCNBkoJU=;
 b=G167DjF248iFwfoT+/zeYmw9Z3MQP77/dS1VfRDNy/XUw8MUpnN12kpfx+WR82m96r
 Akupx1P+uR8w3Gj2ZiXD5yLniebLv9x72bx6JLsWT9Qh4LeKe54mS9CovPsR+OymiUER
 sMr1z1ON594gsTgpnk/wb02mifHa44+9umC5c=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=G167DjF2
Subject: [Buildroot] [PATCH 1/1] configs/ti_am62x_sk: bump U-Boot and Linux
 versions
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

This patch bumps:

- U-Boot to version v2026.07
- Linux kernel to version 6.12.95 (LTS)

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 board/ti/am62x-sk/patches/linux/linux.hash | 2 +-
 board/ti/am62x-sk/patches/uboot/uboot.hash | 2 +-
 configs/ti_am62x_sk_defconfig              | 6 +++---
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/board/ti/am62x-sk/patches/linux/linux.hash b/board/ti/am62x-sk/patches/linux/linux.hash
index ad4ad8db13f9..08483293cf69 100644
--- a/board/ti/am62x-sk/patches/linux/linux.hash
+++ b/board/ti/am62x-sk/patches/linux/linux.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  c92591d896e79ecddbc3319136f0c2f855e832b397de7593f013ad7590a43e53  linux-6.12.80.tar.xz
+sha256  a9e8c51fcb1e695d1d35dde5886cba579cb6f29c9646c5889f39d63841d4b9f6  linux-6.12.95.tar.xz
diff --git a/board/ti/am62x-sk/patches/uboot/uboot.hash b/board/ti/am62x-sk/patches/uboot/uboot.hash
index 36322a6a904c..ff6e4ed2e2f6 100644
--- a/board/ti/am62x-sk/patches/uboot/uboot.hash
+++ b/board/ti/am62x-sk/patches/uboot/uboot.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  ac7c04b8b7004923b00a4e5d6699c5df4d21233bac9fda690d8cfbc209fff2fd  u-boot-2026.04.tar.bz2
+sha256  78e8bfc382fe388f9b55aa1daf8c563522a037779b5d4c349d1415e381f1243e  u-boot-2026.07.tar.bz2
diff --git a/configs/ti_am62x_sk_defconfig b/configs/ti_am62x_sk_defconfig
index 6af64404c2e8..ddabba238ff6 100644
--- a/configs/ti_am62x_sk_defconfig
+++ b/configs/ti_am62x_sk_defconfig
@@ -10,7 +10,7 @@ BR2_ROOTFS_POST_BUILD_SCRIPT_ARGS="-c ttyS2,115200n8 -d k3-am625-sk.dtb -l am62x
 BR2_ROOTFS_POST_IMAGE_SCRIPT_ARGS="-c board/ti/am62x-sk/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.80"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.95"
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="ti/k3-am625-sk"
@@ -28,12 +28,12 @@ BR2_TARGET_OPTEE_OS=y
 BR2_TARGET_OPTEE_OS_PLATFORM="k3-am62x"
 BR2_TARGET_TI_K3_R5_LOADER=y
 BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_VERSION=y
-BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_VERSION_VALUE="2026.04"
+BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_VERSION_VALUE="2026.07"
 BR2_TARGET_TI_K3_R5_LOADER_BOARD_DEFCONFIG="am62x_evm_r5"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2026.04"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2026.07"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="am62x_evm_a53"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
