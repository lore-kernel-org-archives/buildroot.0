Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA495EB64DC
	for <buildroot@archiver.kernel.org>; Tue, 11 Jul 2023 18:04:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2EA5B41369;
	Tue, 11 Jul 2023 18:04:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2EA5B41369
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MnaiG1i-owfu; Tue, 11 Jul 2023 18:04:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 286F341496;
	Tue, 11 Jul 2023 18:04:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 286F341496
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3F3971BF31F
 for <buildroot@lists.busybox.net>; Tue, 11 Jul 2023 18:04:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 18CDF81ED0
 for <buildroot@lists.busybox.net>; Tue, 11 Jul 2023 18:04:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 18CDF81ED0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mB40Q7c3eyLU for <buildroot@lists.busybox.net>;
 Tue, 11 Jul 2023 18:04:42 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A678581E9B
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A678581E9B
 for <buildroot@busybox.net>; Tue, 11 Jul 2023 18:04:42 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-3fb4146e8fcso43654125e9.0
 for <buildroot@busybox.net>; Tue, 11 Jul 2023 11:04:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689098681; x=1691690681;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Rzdv52F5M+6lxCWMF5NBVP3tqj3HHLaYwnu1BGkEJlA=;
 b=VlEWjsKzxAZdvTiGul4IqjnZBi5tWk+/7PvwFfmhiXM6/UYJR++N9L1M0lO65pCZQl
 kUUl9VJsUKJdnROjOywcYY3ytW84ploqbJabeI0bmmDNM5s5iDnAdqkYskjJQ0LlsASc
 pveS2EGC88RHsinlLh/cDV7fbB+KOccCBFyM+zuTgygzzrHPwF2zEL33DxBFjKe1eSm9
 qoA5leWDZ8BjRjw+qrwSCugadMOKLjRp8/HsvUrDNGdGJutQbLlZJBuY2kMZs/3aP6ph
 8rJJq/w+kWRlWQFJiv7br1WwopxNUvEuJw2B7jz1/IP3B77hT5LJai/I93xahkFoyV2F
 fUZg==
X-Gm-Message-State: ABy/qLaTWhrhJredDjoU+Bq/7rAElD6FDDS1r/Yvr77W1FjjlmFzE2ha
 gZNqeR2lkewnwso1WOzhk9whpdgganA=
X-Google-Smtp-Source: APBJJlHjRcy7vVXZIpe+GuANNbwi6k1AUqNH1SsH0hvAHWFuGnlxTEU7VYlJG0XJ1QVTQBu6WWCDqg==
X-Received: by 2002:a05:600c:1c1b:b0:3f7:e78e:8a41 with SMTP id
 j27-20020a05600c1c1b00b003f7e78e8a41mr18871154wms.18.1689098680501; 
 Tue, 11 Jul 2023 11:04:40 -0700 (PDT)
Received: from vm.. ([93.24.197.12]) by smtp.gmail.com with ESMTPSA id
 t24-20020a1c7718000000b003fba6709c68sm3084859wmi.47.2023.07.11.11.04.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Jul 2023 11:04:40 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Tue, 11 Jul 2023 20:04:22 +0200
Message-Id: <20230711180422.565252-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1689098681; x=1691690681;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Rzdv52F5M+6lxCWMF5NBVP3tqj3HHLaYwnu1BGkEJlA=;
 b=SzZXSXtD2eRhSRxZb+n56B1vCaiIUJSSbfOGKqfU04FsaDwE3WTu44Px5AawGZ3ECd
 o68RPfAMNsSW+NcC8duH6rUIJZ3xjhYBibNt8dNWXj3IH/zZwZOZxAyxqoi6mKHbaMD+
 efY31fUzwKQAGsAly8Ms6Mf/pXrDphtXf82dS42eX/mmzZ+4vIFWdvE6+9xj65T8xYFp
 s4LM0Nq+PisoWkFvLnUnmyppJzFN8HQ9Mk9TDS9oC/iWxj9l2wHjK5QDMZbkElxgLyCv
 tX2+wOF8IBE4gpOLb58rIqq0/+Cf6PGHc3a0qIvjHPRkEjqhuin3BO90zlXRDYfYIrHu
 hbFQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=SzZXSXtD
Subject: [Buildroot] [PATCH] configs/olimex_a20_olinuxino_lime*: bump Linux
 and U-Boot
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
 configs/olimex_a20_olinuxino_lime2_defconfig | 4 ++--
 configs/olimex_a20_olinuxino_lime_defconfig  | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/configs/olimex_a20_olinuxino_lime2_defconfig b/configs/olimex_a20_olinuxino_lime2_defconfig
index a38f3a1c5..d817e1dd1 100644
--- a/configs/olimex_a20_olinuxino_lime2_defconfig
+++ b/configs/olimex_a20_olinuxino_lime2_defconfig
@@ -23,7 +23,7 @@ BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/olimex/a20_olinuxino/genimage.cfg"
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.22"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.38"
 BR2_LINUX_KERNEL_USE_DEFCONFIG=y
 BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/olimex/a20_olinuxino/linux-disable-lima.fragment"
@@ -45,7 +45,7 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2023.04"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2023.07"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="A20-OLinuXino-Lime2"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_PYTHON3=y
diff --git a/configs/olimex_a20_olinuxino_lime_defconfig b/configs/olimex_a20_olinuxino_lime_defconfig
index 74b6a764c..88967e70c 100644
--- a/configs/olimex_a20_olinuxino_lime_defconfig
+++ b/configs/olimex_a20_olinuxino_lime_defconfig
@@ -23,7 +23,7 @@ BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/olimex/a20_olinuxino/genimage.cfg"
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.22"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.38"
 BR2_LINUX_KERNEL_USE_DEFCONFIG=y
 BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/olimex/a20_olinuxino/linux-disable-lima.fragment"
@@ -45,7 +45,7 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2023.04"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2023.07"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="A20-OLinuXino-Lime"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_PYTHON3=y
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
