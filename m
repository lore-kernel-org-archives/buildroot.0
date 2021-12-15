Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B037C433EF
	for <buildroot@archiver.kernel.org>; Wed, 15 Dec 2021 21:23:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9A8F48136E;
	Wed, 15 Dec 2021 21:23:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BHPY4zCZP8q7; Wed, 15 Dec 2021 21:23:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id EAEBF80BD2;
	Wed, 15 Dec 2021 21:23:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8A0BA1BF39F
 for <buildroot@lists.busybox.net>; Wed, 15 Dec 2021 21:23:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8471740A5B
 for <buildroot@lists.busybox.net>; Wed, 15 Dec 2021 21:23:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qblUw0AZJMFu for <buildroot@lists.busybox.net>;
 Wed, 15 Dec 2021 21:23:52 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B532940A55
 for <buildroot@buildroot.org>; Wed, 15 Dec 2021 21:23:52 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id z5so80208206edd.3
 for <buildroot@buildroot.org>; Wed, 15 Dec 2021 13:23:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ixiT3wGHZhYJ1TC45sMdWGSou3KMbmfC9jlbE72pyRo=;
 b=fu8L/aI+yJPi1Q3fIjp/TLmdDeoBbC4ap4TFzSl6U+23Hz70rb3hII5zGKOgIH+y/v
 yqV8QpU9SyUkV9/qESxkT0xtCEVS6NrHMiAiXdsrhBpCJQ2277i9Fy2WjB4rE/I1DYVk
 P9v09h9RhmjrFVy0KtbB3nIxD6EhrhBCd1xL7zsoEegJceAw/87PauLExB1cXpQY94Ia
 GoZiMNbV/mmKuZvesl0jwvUQDSv/iyXL+QhkJgBxC6M7p0broPUxeE2vI3T8gWv10NKN
 yYbR5Het2BsGNg8q0dt+9IuWOR+SgYRlotvNqJyfAPp+pcOCBmFNKv2XpLfuXJAJt8jE
 lIUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ixiT3wGHZhYJ1TC45sMdWGSou3KMbmfC9jlbE72pyRo=;
 b=hP2q63GJHDtvKZB1bLm6twFH5vEUz1HW340mvSuXxp10v81rBSlgy2IWl0WposZOqK
 k4ksPSkTqtzl7I2zWn5vsQRCVwDQHLIr8Zl6RtJfBjkW8Cdqzf+kSELBCI5w/myeY6A8
 AzpWS6RaQ4STRnUp7beJSdTZIr+/oy25MEeiCqjHe+UuAnlTIwDg8AXUQUs65nlEaNgz
 5H95nzG25qcP/Mem8RXcTOueo5Se4OMIPVCSdiHxZ6md6Wm1CdKgRdbc/ZxzDdAhf9am
 YZDY+LztmuL6D+ISHngJ/iIwQNs5l15wUpn1KufcDxRl35VbpTPdw23k3V0QZ1u9prW5
 Fojw==
X-Gm-Message-State: AOAM532Q//vgCjXuJ4zk7OGOoZIc2dChqFtx5HezVtSdXnFLoQuAT4fS
 VkS5xT3ReDRd5+C3c2VZDnWVTJ+P1Z0jx0sq
X-Google-Smtp-Source: ABdhPJwuSE23iWcQEkClX0acmo6fneaKUkhu3J0FawCp6DK55j2lLQk+ck37zT0yTOC9Uf/uwdli8A==
X-Received: by 2002:a17:906:c110:: with SMTP id
 do16mr13079908ejc.584.1639603430692; 
 Wed, 15 Dec 2021 13:23:50 -0800 (PST)
Received: from aura15.fritz.box ([2a02:578:8505:b00:94e7:47d4:5905:350a])
 by smtp.gmail.com with ESMTPSA id go10sm1023666ejc.115.2021.12.15.13.23.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Dec 2021 13:23:48 -0800 (PST)
From: Lothar Felten <lothar.felten@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 15 Dec 2021 22:23:28 +0100
Message-Id: <20211215212328.572775-1-lothar.felten@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] configs/bananapi_m2_ultra_defconfig: bump to
 u-boot 2021.10
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
Cc: Lothar Felten <lothar.felten@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes:
  /usr/bin/ld: scripts/dtc/dtc-parser.tab.o:(.bss+0x10): multiple definition...
  scripts/dtc/dtc-lexer.lex.o:(.bss+0x0): first defined here

Tested on bananapi m2 ultra

Signed-off-by: Lothar Felten <lothar.felten@gmail.com>
---
 configs/bananapi_m2_ultra_defconfig | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/configs/bananapi_m2_ultra_defconfig b/configs/bananapi_m2_ultra_defconfig
index 22f7974bcb..67ecec424c 100644
--- a/configs/bananapi_m2_ultra_defconfig
+++ b/configs/bananapi_m2_ultra_defconfig
@@ -16,15 +16,15 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2018.07"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2021.10"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="bananapi_m2_berry"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
 BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
 BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot-sunxi-with-spl.bin"
-BR2_PACKAGE_HOST_UBOOT_TOOLS=y
-BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT=y
-BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT_SOURCE="board/bananapi/bananapi-m2-ultra/boot.cmd"
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
 BR2_PACKAGE_HOST_GENIMAGE=y
 BR2_PACKAGE_HOST_MTOOLS=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT_SOURCE="board/bananapi/bananapi-m2-ultra/boot.cmd"
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
