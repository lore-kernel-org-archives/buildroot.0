Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F7E5CCA479
	for <buildroot@archiver.kernel.org>; Wed, 13 Jul 2022 14:34:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 923964242F;
	Wed, 13 Jul 2022 14:34:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 923964242F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id i_dvzHoRp0RS; Wed, 13 Jul 2022 14:34:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5BBA9410B6;
	Wed, 13 Jul 2022 14:34:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5BBA9410B6
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 84A8B1BF25B
 for <buildroot@lists.busybox.net>; Wed, 13 Jul 2022 14:33:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6989882907
 for <buildroot@lists.busybox.net>; Wed, 13 Jul 2022 14:33:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6989882907
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bMqOGuE0WLlP for <buildroot@lists.busybox.net>;
 Wed, 13 Jul 2022 14:33:58 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9295F82612
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9295F82612
 for <buildroot@busybox.net>; Wed, 13 Jul 2022 14:33:58 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id v14so15784361wra.5
 for <buildroot@busybox.net>; Wed, 13 Jul 2022 07:33:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6Q4+Rh7SYQvfTbf+2n1wpozCZjGUeBhqt6Oq9d43GI4=;
 b=bVwIIkk9TFTS1OaBBk8yex9SVGfPUXydm6dRY7eEBhZkKEsIGY9VlpiDbhR6PvHGyc
 ITlHHKm+DQhm/CWe2i47fPnaJx22BFu8ttsl2MGBS0/MgFwEtMjpklceGxv3qNc8qAa+
 8h4iZiNwhd2G8wTN+IzvPI0lFgToT1JPwne0aqJlEaqImimoSgOjRNII9yj1DzV4eHch
 kP47JWLY0Gv8UeBi9X9tiQdEWboDwuxDF8E3pCp/CCuGZD5wHZ91okypuuVE2cA4an6Q
 UbdOinKGM3AYuHGy4OtmU0XCUS7f1RWNSTddgk1kauKlKzkhhVNkO1VD4T2qK+wz9/m5
 3roA==
X-Gm-Message-State: AJIora+2qE5RwSv/hy21SWaUEulb+cAKHG0lNNSmY2sr4++BFaIEUgep
 J3i1UrLXH1IIfNJkQEaXs3yPSOoCdd0=
X-Google-Smtp-Source: AGRyM1vBhjnz8CGjMJqL2CqR344b9njBXcXT1hOPE4Bws2Dgyb7ibJSJ2E6AxcbjjR1PNvDvecrV7A==
X-Received: by 2002:a5d:428d:0:b0:21d:7ee2:8f9e with SMTP id
 k13-20020a5d428d000000b0021d7ee28f9emr3480081wrq.145.1657722836700; 
 Wed, 13 Jul 2022 07:33:56 -0700 (PDT)
Received: from vm22.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id
 z15-20020a056000110f00b0021d6c7a9f50sm12580196wrw.41.2022.07.13.07.33.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Jul 2022 07:33:56 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Wed, 13 Jul 2022 16:33:50 +0200
Message-Id: <20220713143350.3131081-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6Q4+Rh7SYQvfTbf+2n1wpozCZjGUeBhqt6Oq9d43GI4=;
 b=jP8473L4JYJN3yfWB2DVcn2qkIo3uWRVSzC9PfKeWSFrlDTDilz3L3wAYeDbMjdnko
 4A8WbfF4fhewejbq4J4Dwp0asSujybFwyrePtTuYu4JCQ0Yf/z1jCekdq1Z+JW+tmlui
 HEnOCIZkPyOOg4E/xa8XODg5ve1YrRlmDFQp/Zmp4N+CM9m/e8iKl07zO8IQDGfcZKi6
 iyX0lDN2mFEq2M4N30c7TjLKH3fT0qBopPSpGzrQ4q8h0rT25Pol+/EA+ydhSvjzYbkp
 0cZQLukLE+YZIU2nmA//Et+JTHJl9MjR96zCkbkyZX4C5a1gsNpD1SmzkdC9kUgF4ROt
 X2uA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=jP8473L4
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
index 2f9594921..a032eb922 100644
--- a/configs/olimex_a20_olinuxino_lime2_defconfig
+++ b/configs/olimex_a20_olinuxino_lime2_defconfig
@@ -23,7 +23,7 @@ BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/olimex/a20_olinuxino/genimage.cfg"
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.32"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.53"
 BR2_LINUX_KERNEL_USE_DEFCONFIG=y
 BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/olimex/a20_olinuxino/linux-disable-lima.fragment"
@@ -45,7 +45,7 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2022.04"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2022.07"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="A20-OLinuXino-Lime2"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_PYTHON3=y
diff --git a/configs/olimex_a20_olinuxino_lime_defconfig b/configs/olimex_a20_olinuxino_lime_defconfig
index e24857e0c..b2364ca59 100644
--- a/configs/olimex_a20_olinuxino_lime_defconfig
+++ b/configs/olimex_a20_olinuxino_lime_defconfig
@@ -23,7 +23,7 @@ BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/olimex/a20_olinuxino/genimage.cfg"
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.32"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.53"
 BR2_LINUX_KERNEL_USE_DEFCONFIG=y
 BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/olimex/a20_olinuxino/linux-disable-lima.fragment"
@@ -45,7 +45,7 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2022.04"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2022.07"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="A20-OLinuXino-Lime"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_PYTHON3=y
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
