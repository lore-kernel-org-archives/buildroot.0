Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D21CEB64DA
	for <buildroot@archiver.kernel.org>; Wed, 12 Jul 2023 17:47:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7A29040B68;
	Wed, 12 Jul 2023 17:47:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7A29040B68
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZTWm_sepfuX7; Wed, 12 Jul 2023 17:47:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D361F415BE;
	Wed, 12 Jul 2023 17:47:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D361F415BE
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 745681BF407
 for <buildroot@lists.busybox.net>; Wed, 12 Jul 2023 17:47:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4DCD782285
 for <buildroot@lists.busybox.net>; Wed, 12 Jul 2023 17:47:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4DCD782285
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UD4DTQeT1U5w for <buildroot@lists.busybox.net>;
 Wed, 12 Jul 2023 17:47:06 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E16B082305
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E16B082305
 for <buildroot@busybox.net>; Wed, 12 Jul 2023 17:47:05 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-3128fcd58f3so7905776f8f.1
 for <buildroot@busybox.net>; Wed, 12 Jul 2023 10:47:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689184024; x=1691776024;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jNyZ9l0CBQQ9ObkP54JSOK6u/nSXObm6roz2AOyXmJc=;
 b=XxAoXCplE0a8JGxwHp3dcw0xy483cjFxLFhrZFo5LimBjmhZYomr7IRh4WukZWMhU/
 jYlosq9z/2cE19F6OVh5TOv7GHnt3xr8I8aldStdwEuXmE5T/h62LW4P6e1B3dqFInun
 5U29uHO5zOA7KL4/+iR4g1jDM6Ubgo9MG5+MBsNO94/NIWi4iQnWeMSegNFZEypTDtH4
 xhFrVH93gfqBKtJsaf43H1vlEDEGb1vraVm+t4BrXctgQ08BI2aIwULAv6w287JviWkV
 GDQo4KVpaeq5J7mPYisPzGZIbgZa/9iazxO++oMeppTzLqZ5cyA4Huot11ZdfIQfl+B2
 +vGA==
X-Gm-Message-State: ABy/qLbC2KwShCNBA9KNJK/0aZqpHv8emcUnZg8GXdbH2QyMKYV546aQ
 c3rAZZ7HPpPaKYA/whK+ti3IJGg+kJw=
X-Google-Smtp-Source: APBJJlHXAOAJUiwjG7Dk5jKvyLtNFaFz3K1sx8q0M3Wy17FeYO8cxs8ug1/PTiD72p5jAtEuvdyKSg==
X-Received: by 2002:a5d:6148:0:b0:314:3ca0:c8c2 with SMTP id
 y8-20020a5d6148000000b003143ca0c8c2mr18740159wrt.11.1689184023820; 
 Wed, 12 Jul 2023 10:47:03 -0700 (PDT)
Received: from vm.. ([93.24.197.12]) by smtp.gmail.com with ESMTPSA id
 y7-20020a5d6147000000b0031412b685d2sm5663411wrt.32.2023.07.12.10.47.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Jul 2023 10:47:03 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Wed, 12 Jul 2023 19:46:54 +0200
Message-Id: <20230712174654.743133-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1689184024; x=1691776024;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=jNyZ9l0CBQQ9ObkP54JSOK6u/nSXObm6roz2AOyXmJc=;
 b=AL3y2eXQlR/yAhnAfbax1BlCjKLl8WD4TKKAUiPuPpHpBp760XzWWNSWEuwdeD2tIa
 XQPO39wKWSV7gJrVGr6caZjikZ++WjoZlYnYO5+xm/5o6Tfrr46svQujqdj1QTyUOUYg
 /H2uwnmB13TheglEnQG23E9Lo/rFnF0xIgVFkr0dxfszmArUP/emHV4IBPt+Mt1J7Jei
 f0BH5cve6hIexdo85OedquxEP6ye25vjTvVtRWCh4xVahdEUU7rEA2SF3tgVxBAOUh2c
 y4rdchCSBX6YXk2PZfUI5lN/2w7G/L5uVs6nojdT5Ldi0ZSP4/4y+TGgvO1/rbsie4rl
 mRDg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=AL3y2eXQ
Subject: [Buildroot] [PATCH] configs/olimex_stmp157: bump Linux and U-Boot
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 configs/olimex_stmp157_olinuxino_lime_defconfig | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/configs/olimex_stmp157_olinuxino_lime_defconfig b/configs/olimex_stmp157_olinuxino_lime_defconfig
index 3b56fefec..dc726359a 100644
--- a/configs/olimex_stmp157_olinuxino_lime_defconfig
+++ b/configs/olimex_stmp157_olinuxino_lime_defconfig
@@ -17,8 +17,8 @@ BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/olimex/stmp1_olinuxino/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_GIT=y
 BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/OLIMEX/linux-olimex.git"
-# branch release-20230217-v5.10.105
-BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="c5a31724bdfaac894553b51c5a0fb92c1f10f3db"
+# branch release-20230622-v5.10.180
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="fc74113e14d76aea9482264ff42e07397b94553d"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/olimex/stmp1_olinuxino/linux.config"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
@@ -35,8 +35,8 @@ BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_GIT=y
 BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://github.com/OLIMEX/u-boot-olinuxino.git"
-# release-20230110, based on 2021.04
-BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="9a49a20f71c698f538defbb69a6c6cb657d4315f"
+# release-20230515, based on 2021.04
+BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="efadf793a0a5924e2c96362dc1df3e56622ebb97"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="STM32-OLinuXino-LIME"
 # BR2_TARGET_UBOOT_FORMAT_BIN is not set
 BR2_TARGET_UBOOT_FORMAT_IMG=y
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
