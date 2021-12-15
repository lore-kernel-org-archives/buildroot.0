Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 295A7C433F5
	for <buildroot@archiver.kernel.org>; Wed, 15 Dec 2021 22:25:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B8600831DE;
	Wed, 15 Dec 2021 22:25:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id h1JGkbNCEYlW; Wed, 15 Dec 2021 22:25:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 436F783134;
	Wed, 15 Dec 2021 22:25:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1B3D01BF44A
 for <buildroot@lists.busybox.net>; Wed, 15 Dec 2021 22:25:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0A23A60FAE
 for <buildroot@lists.busybox.net>; Wed, 15 Dec 2021 22:25:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id f7QyvJ7Ue7Z6 for <buildroot@lists.busybox.net>;
 Wed, 15 Dec 2021 22:25:24 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3E04B60FBC
 for <buildroot@buildroot.org>; Wed, 15 Dec 2021 22:25:24 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id z9so24769475edb.5
 for <buildroot@buildroot.org>; Wed, 15 Dec 2021 14:25:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KCSwnKIPdX3fKd92pynNmExvdrd+PSZ6wbAyR+KHGx0=;
 b=HB2lpeB0gnsyx7d5nLsZXxllFC+jD2XiNxNOGjjktJ1wo0sKVZzXiBlaLSkr3wZutc
 lIfwotsZ43hyISG4cix5kr0YxIRKJUuBZQxQmgJNWG3cOzwkBWLYyPoQhBdCMf/i5FRj
 P/FQP7BUVfVu5K8CZHHhJ7aIYkH+CZVDHIqfn4B6eudk3wZgJHK/lpGlIcOzknXfqMJ0
 1B9imLBDylUwXRr8CsMyONWzAWVJIQV1D9HqBLP2FwSDpz741kXnxePROLUVOygzP6Lw
 1W7fWHzhkrzerw5JRfet7iTVFdnY+1yJh3vqhbCTm8VDI4FRiJCJYRvY8I5A/kfMoeR9
 ZSLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KCSwnKIPdX3fKd92pynNmExvdrd+PSZ6wbAyR+KHGx0=;
 b=ZWPj7xKwblMcH+/aMCYRzk+kIM8G+oT2vpn0N0GpWsk+iPEyrCTUeixcH16LfJQLFH
 lXqWZfXFWGKN+y8s1vYyRqAMVZ/I7qo5k7Oy3LkTomsk8zdMHaQNdEeCtAKi9JbpCpED
 8q7oCe2tw30/BN9OZ/31g3nMhHPlMDVx58rAZMZRWnF41NhIb/kXBb8+tsr5S/8+hrRT
 YuY92EyWl1ZhTK0/gb9+73aizrsOgy9jeNdmioz/tV1gI1Z9YBwZNVlHj+99s8RayaJP
 PM2mfNgVccp7emUFY4B0kZGh4YjSwv2NuOUPax4kgoF6QWzHwjf/vuhb+/FTet/qFHLv
 cPew==
X-Gm-Message-State: AOAM533diGB+QGxrtQRi8QFFM0Rz/fZypewWuPYfa5VKiRSEiwkAmy8q
 CwXNO0IpS7CJ8bCpM5xGFVy6FUROPhI0mz55
X-Google-Smtp-Source: ABdhPJxoKQl0aT1etRskJHIFZciUTgMrQIWur/xIhe4oKSddext8OVxJKcDHOlu0qewtoXd6/+mY6g==
X-Received: by 2002:a50:f189:: with SMTP id x9mr17148194edl.95.1639607122195; 
 Wed, 15 Dec 2021 14:25:22 -0800 (PST)
Received: from aura15.fritz.box ([2a02:578:8505:b00:94e7:47d4:5905:350a])
 by smtp.gmail.com with ESMTPSA id 24sm1121973ejg.47.2021.12.15.14.25.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Dec 2021 14:25:21 -0800 (PST)
From: Lothar Felten <lothar.felten@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 15 Dec 2021 23:25:07 +0100
Message-Id: <20211215222507.762310-1-lothar.felten@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] configs/beaglebone_qt5_defconfig: bump to
 u-boot 2021.04
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

    Tested on beaglebone black and beaglebone white (A6)

Signed-off-by: Lothar Felten <lothar.felten@gmail.com>
---
 configs/beaglebone_qt5_defconfig | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/configs/beaglebone_qt5_defconfig b/configs/beaglebone_qt5_defconfig
index 5f084b77df..03b46e91a7 100644
--- a/configs/beaglebone_qt5_defconfig
+++ b/configs/beaglebone_qt5_defconfig
@@ -32,13 +32,11 @@ BR2_TARGET_ROOTFS_EXT2_SIZE="250M"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2020.04"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2021.04"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="am335x_evm"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 # BR2_TARGET_UBOOT_FORMAT_BIN is not set
 BR2_TARGET_UBOOT_FORMAT_IMG=y
-BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
-BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="spl/u-boot-spl.bin"
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="MLO"
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
