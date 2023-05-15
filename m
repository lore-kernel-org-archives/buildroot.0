Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9F91C77B75
	for <buildroot@archiver.kernel.org>; Mon, 15 May 2023 14:27:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3F4238407A;
	Mon, 15 May 2023 14:27:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3F4238407A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tzRCrFxpD-h2; Mon, 15 May 2023 14:27:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 62D838406D;
	Mon, 15 May 2023 14:27:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 62D838406D
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 07A701BF575
 for <buildroot@lists.busybox.net>; Mon, 15 May 2023 14:27:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E036C41775
 for <buildroot@lists.busybox.net>; Mon, 15 May 2023 14:27:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E036C41775
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8QgxTWtMM-K2 for <buildroot@lists.busybox.net>;
 Mon, 15 May 2023 14:27:50 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B5DBD40BE9
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B5DBD40BE9
 for <buildroot@buildroot.org>; Mon, 15 May 2023 14:27:49 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-3062c1e7df8so8495957f8f.1
 for <buildroot@buildroot.org>; Mon, 15 May 2023 07:27:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684160868; x=1686752868;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2vGNTGKbuXEO8Cw0OPmMS0unMIlePhEYkGmf2+b+d9A=;
 b=DO5Ct6UwXuChQGs4TzyfD6IbwquFU4cwIAPex+9N3Ftgj8FJ6nfvPaBmBTyELkHcyT
 cYidL8HE39lKxlIDWeXaNtoT5TclLA9HPfeelGYbpOuiimT+1zJi/CItwt2WkK2Q+Mi+
 XvalEI7Zu2ojAcZhoYI4t9a9G6Hb/Tsg+wW6SIRmwheQ/nWyjMUERQUrRN/G2/Nbr3qT
 OZdT8xeHmXMqS754JNr0sIU/MuQ+xtsZgJJOTsAVWSQdwa50rJXSfs5e0xmb0AhkX2l1
 2cOVoOEIgrifZwkqFptwTe67z/fIVYPv7uKrW7QzAge02t9ynUOAua0QJVhk3beOuPCb
 6SMg==
X-Gm-Message-State: AC+VfDwk4ApfxwvVhBEStulaabGTNH6Y80XNu05iP3v6RxV4qqAQJ6vE
 kZ0W54m9qioOX4T9y6Mqk5fOwH0mtOU=
X-Google-Smtp-Source: ACHHUZ7wZfmJtdGldm9wAyiJemuObS8baq4UTBBnXMgKql8C0npo6ekVNawtQTxGtcCI5pePlZ6TxA==
X-Received: by 2002:adf:f586:0:b0:307:9b67:d14f with SMTP id
 f6-20020adff586000000b003079b67d14fmr18394877wro.9.1684160867532; 
 Mon, 15 May 2023 07:27:47 -0700 (PDT)
Received: from localhost.localdomain
 (aputeaux-652-1-54-113.w83-204.abo.wanadoo.fr. [83.204.213.113])
 by smtp.gmail.com with ESMTPSA id
 s6-20020adff806000000b003068f5cca8csm32327837wrp.94.2023.05.15.07.27.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 May 2023 07:27:47 -0700 (PDT)
From: Gary Bisson <bisson.gary@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 15 May 2023 16:27:44 +0200
Message-Id: <20230515142744.3719070-1-bisson.gary@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1684160868; x=1686752868;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=2vGNTGKbuXEO8Cw0OPmMS0unMIlePhEYkGmf2+b+d9A=;
 b=b9+t48NlNzFSBa/pXImFaFgj9gmMPux9CbhCjF4U2W4G2mmzuQzASgdhKukNXLH+Wq
 QcQOaJ1seu9KALjfM2DHK5udz9DZ5t143qCSjpzXriGceLf+RiNK327WoHyIRsvohcoE
 TyoV+hhf4pSwPSjk2Zh+HwkKPmwlPUOLgGFbaAqywSi5e1baPnNeJSHz3+VlLAM9hVoZ
 1epLxFK524ul/P/p/JTk0WqXpybiSHsxNNu7wykHwGNTvRjGViloNqVaI0Uvn/rgbbtn
 b+K05oPVn6fMc4InWnOttqGKkGfW2n0IUZW+kP0YsPLJLegtsBGx54y6RHcq6wtnT3e5
 ir2g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=b9+t48Nl
Subject: [Buildroot] [PATCH] configs/nitrogen*: bump kernel rev to 42598e4b
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
Cc: Gary Bisson <bisson.gary@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- bump to latest NXP release (5.15.71)
- various enhancement (8ULP support, M-core stability)

Signed-off-by: Gary Bisson <bisson.gary@gmail.com>
---
 configs/nitrogen6sx_defconfig | 2 +-
 configs/nitrogen6x_defconfig  | 2 +-
 configs/nitrogen7_defconfig   | 2 +-
 configs/nitrogen8m_defconfig  | 2 +-
 configs/nitrogen8mm_defconfig | 2 +-
 configs/nitrogen8mn_defconfig | 2 +-
 configs/nitrogen8mp_defconfig | 2 +-
 7 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/configs/nitrogen6sx_defconfig b/configs/nitrogen6sx_defconfig
index 967d064f1c..4e19a5c3d2 100644
--- a/configs/nitrogen6sx_defconfig
+++ b/configs/nitrogen6sx_defconfig
@@ -36,7 +36,7 @@ BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT_SOURCE="board/boundarydevices/common/bo
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
 # Latest revision  of branch boundary-imx_5.15.y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/linux/archive/97cc67c4.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/linux/archive/42598e4b.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="boundary"
 BR2_LINUX_KERNEL_INSTALL_TARGET=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
diff --git a/configs/nitrogen6x_defconfig b/configs/nitrogen6x_defconfig
index 1cded53765..5e360e27b4 100644
--- a/configs/nitrogen6x_defconfig
+++ b/configs/nitrogen6x_defconfig
@@ -35,7 +35,7 @@ BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT_SOURCE="board/boundarydevices/common/bo
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
 # Latest revision  of branch boundary-imx_5.15.y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/linux/archive/97cc67c4.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/linux/archive/42598e4b.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="boundary"
 BR2_LINUX_KERNEL_INSTALL_TARGET=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
diff --git a/configs/nitrogen7_defconfig b/configs/nitrogen7_defconfig
index d1e81d90fd..0994c61884 100644
--- a/configs/nitrogen7_defconfig
+++ b/configs/nitrogen7_defconfig
@@ -35,7 +35,7 @@ BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT_SOURCE="board/boundarydevices/common/bo
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
 # Latest revision  of branch boundary-imx_5.15.y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/linux/archive/97cc67c4.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/linux/archive/42598e4b.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="boundary"
 BR2_LINUX_KERNEL_INSTALL_TARGET=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
diff --git a/configs/nitrogen8m_defconfig b/configs/nitrogen8m_defconfig
index 6c490f195b..c3959f7614 100644
--- a/configs/nitrogen8m_defconfig
+++ b/configs/nitrogen8m_defconfig
@@ -51,7 +51,7 @@ BR2_TARGET_UBOOT_SPL=y
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
 # Latest revision  of branch boundary-imx_5.15.y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/linux/archive/97cc67c4.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/linux/archive/42598e4b.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="boundary"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INSTALL_TARGET=y
diff --git a/configs/nitrogen8mm_defconfig b/configs/nitrogen8mm_defconfig
index 27cdc9e19e..d7b47c11f8 100644
--- a/configs/nitrogen8mm_defconfig
+++ b/configs/nitrogen8mm_defconfig
@@ -51,7 +51,7 @@ BR2_TARGET_UBOOT_SPL=y
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
 # Latest revision  of branch boundary-imx_5.15.y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/linux/archive/97cc67c4.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/linux/archive/42598e4b.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="boundary"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INSTALL_TARGET=y
diff --git a/configs/nitrogen8mn_defconfig b/configs/nitrogen8mn_defconfig
index 775bdecd90..b28801878e 100644
--- a/configs/nitrogen8mn_defconfig
+++ b/configs/nitrogen8mn_defconfig
@@ -51,7 +51,7 @@ BR2_TARGET_UBOOT_SPL=y
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
 # Latest revision  of branch boundary-imx_5.15.y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/linux/archive/97cc67c4.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/linux/archive/42598e4b.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="boundary"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INSTALL_TARGET=y
diff --git a/configs/nitrogen8mp_defconfig b/configs/nitrogen8mp_defconfig
index 0767ab1375..e088cb690f 100644
--- a/configs/nitrogen8mp_defconfig
+++ b/configs/nitrogen8mp_defconfig
@@ -51,7 +51,7 @@ BR2_TARGET_UBOOT_SPL=y
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
 # Latest revision  of branch boundary-imx_5.15.y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/linux/archive/97cc67c4.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/linux/archive/42598e4b.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="boundary"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INSTALL_TARGET=y
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
