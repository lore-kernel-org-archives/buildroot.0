Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EB09ECAAA1
	for <buildroot@archiver.kernel.org>; Mon, 24 Oct 2022 10:41:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A4DE540877;
	Mon, 24 Oct 2022 10:41:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A4DE540877
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JPhoVoQroM9p; Mon, 24 Oct 2022 10:41:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6E74F40743;
	Mon, 24 Oct 2022 10:41:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6E74F40743
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0455A1BF39F
 for <buildroot@lists.busybox.net>; Mon, 24 Oct 2022 10:41:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E081981405
 for <buildroot@lists.busybox.net>; Mon, 24 Oct 2022 10:41:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E081981405
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NWAeBWIq2Yhw for <buildroot@lists.busybox.net>;
 Mon, 24 Oct 2022 10:41:42 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 032B9813FD
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 032B9813FD
 for <buildroot@busybox.net>; Mon, 24 Oct 2022 10:41:41 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id k8so6737824wrh.1
 for <buildroot@busybox.net>; Mon, 24 Oct 2022 03:41:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+ZpZtKqY3MmJQgF/T5wWlsPJ3Mw5yMUu/DRlfZmdPkg=;
 b=UJc+hUxTLXAkwHfgUOCI+nSCGse38TRpexazHkSsMAHmWIL3BXkbFG18rZlycHJ4kZ
 65z9iwlkXLgGnV4ljVR7SXnp78JA0YMqop2ugaGFkqJvULf1Os8val1hj9bidvleKVoQ
 /rmDbxlbYur8LnBlSgAsbtEVZe9PLanzEHZfMG/nHcdofxlHPFmAMLC4bAZozd8DNosm
 NAKdKc9GoqDREQgo3/ZIM6GDAw0RWtXjSBiIMIHJsvp0cygBuKO/PNRcr5vzbFoGCCdx
 bTQ6NAsJxwi1xT798AdCTgyKYFv6Y1oPRz8fTXp0yo+32UEYIiWR6q1emsa7/7QPHSfF
 nhHQ==
X-Gm-Message-State: ACrzQf3cDsgmNnnyZgz67FWJAHo2h47fvO2CHDnZ2nLqgRTf5S1alkH2
 Sas1Aa5B0krguvFBePGHhHPnPOk6J7o=
X-Google-Smtp-Source: AMsMyM59ai5UcxLYPF/KijcXpNOazO2wgoQmk7XDDMj3U0OVSlhitLmpxBcsToStzF4NaNkJ2w1KHQ==
X-Received: by 2002:a5d:584e:0:b0:236:6f0f:9d8 with SMTP id
 i14-20020a5d584e000000b002366f0f09d8mr3676269wrf.701.1666608100083; 
 Mon, 24 Oct 2022 03:41:40 -0700 (PDT)
Received: from vm-22.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id
 j18-20020a5d6192000000b002366dd0e030sm3575142wru.68.2022.10.24.03.41.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Oct 2022 03:41:39 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Mon, 24 Oct 2022 12:41:33 +0200
Message-Id: <20221024104133.1470655-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=+ZpZtKqY3MmJQgF/T5wWlsPJ3Mw5yMUu/DRlfZmdPkg=;
 b=iwPePV/sYo0efkkoTXkix+d16AaTfQ/QCa2Ls6AeMcDqLeqZDY4YQOmdwE9ahI0HrA
 MXYZGv4lGuVxaXV/APA0vzwu3thzonrvyDHB2Hh7IJXiPu3JeICS4pNg6FIRWQvb2WEV
 tABGNoJ69Ufs170IImEkbkI+hYcpJy/zZRUWygzH6d3jSZIxKOUT47IV7Ypp3S/D04pK
 dmj7cAJtDbYY/8jf/3UWq8GAfJaA8h8xLEEk95MRKx0f2dit8GV7vYDB/GMXDaT14Gbi
 Oi9G8Z3DDJA0dvbTsFuQprwFkm0hh9daNgMnL2id9OLHQSxWTAbGG0Fvp3Q6NmVTKdoE
 CHJw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=iwPePV/s
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
index e325184e9..1bb628b56 100644
--- a/configs/olimex_a20_olinuxino_lime2_defconfig
+++ b/configs/olimex_a20_olinuxino_lime2_defconfig
@@ -22,7 +22,7 @@ BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/olimex/a20_olinuxino/genimage.cfg"
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.53"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.71"
 BR2_LINUX_KERNEL_USE_DEFCONFIG=y
 BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/olimex/a20_olinuxino/linux-disable-lima.fragment"
@@ -44,7 +44,7 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2022.07"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2022.10"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="A20-OLinuXino-Lime2"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_PYTHON3=y
diff --git a/configs/olimex_a20_olinuxino_lime_defconfig b/configs/olimex_a20_olinuxino_lime_defconfig
index ba814b98b..7105ea996 100644
--- a/configs/olimex_a20_olinuxino_lime_defconfig
+++ b/configs/olimex_a20_olinuxino_lime_defconfig
@@ -22,7 +22,7 @@ BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/olimex/a20_olinuxino/genimage.cfg"
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.53"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.71"
 BR2_LINUX_KERNEL_USE_DEFCONFIG=y
 BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/olimex/a20_olinuxino/linux-disable-lima.fragment"
@@ -44,7 +44,7 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2022.07"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2022.10"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="A20-OLinuXino-Lime"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_PYTHON3=y
-- 
2.37.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
