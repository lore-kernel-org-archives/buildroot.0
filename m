Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05C2ACD37B4
	for <buildroot@archiver.kernel.org>; Wed,  4 Sep 2024 14:20:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AC7D480D76;
	Wed,  4 Sep 2024 14:20:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DOyZ-JBAGxvC; Wed,  4 Sep 2024 14:20:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B9FCC80D79
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B9FCC80D79;
	Wed,  4 Sep 2024 14:20:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id EBC961BF267
 for <buildroot@lists.busybox.net>; Wed,  4 Sep 2024 14:20:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E2F5B4029A
 for <buildroot@lists.busybox.net>; Wed,  4 Sep 2024 14:20:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Swmi52v76mht for <buildroot@lists.busybox.net>;
 Wed,  4 Sep 2024 14:20:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::532; helo=mail-ed1-x532.google.com;
 envelope-from=adam.duskett@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org BD26740290
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BD26740290
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BD26740290
 for <buildroot@buildroot.org>; Wed,  4 Sep 2024 14:20:44 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-5befecad20eso1108716a12.2
 for <buildroot@buildroot.org>; Wed, 04 Sep 2024 07:20:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725459642; x=1726064442;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8SRCArOGkfkUYIpg6M5jkjxV6zZEERg/DOYQ640CTKM=;
 b=C9ix0PUTtxjj/SFktqzp1H+VjM3hpCppZ3A1lZr4oR5lWo3u9gT/kkG2v9hL+3DEUh
 4lJwx+wI2N5ol/kYwu+bX9qxdtHZyn6pIkM9C3yGriNKWz1hjO1C2S1bs4GYp8zY4Zjy
 zgplNZa8k4ZgEmrgVaIb50vGpRHryaW2QCcoG0qK+L69dDi2lFBim3+Km8ZypmVqwxBL
 FFMfJFvp3XDDJfI/v+re1kDqL48MpKQ88+HpkDqeC0ZUIJKCFRbrJNbo+TKx7bY2WXMd
 tKebn+RxVKrWRUxzgSiijH+NEiKk917UlI4wuf2HbIkbaXFuYa7gGiCdv48wga0Ual8I
 GWuw==
X-Gm-Message-State: AOJu0YxTSUrBZqJAQ6obUkxQoLwLmmdwV083A4STjuVeX/gdYoqX/OLh
 AthOYfGCw4a74t/uS5uCIU5C8OQ8A0hg/AKj+BYZfG2HtIiVhjuFqLQm59vMbsA1Ur6jPsap2b3
 3e/xDMQ==
X-Google-Smtp-Source: AGHT+IFAr2dVCgECI8o4T9WQo+EcNEKP9mpeO4BTeh0XlD4AXl0TOlqdOZ8ZrvYtELFPq+6FkrsHCw==
X-Received: by 2002:a05:6402:1ecb:b0:5c2:67da:9742 with SMTP id
 4fb4d7f45d1cf-5c267da9903mr3568513a12.4.1725459641404; 
 Wed, 04 Sep 2024 07:20:41 -0700 (PDT)
Received: from adam-laptop.ipgroup.local (212-57-59-66.xdsl.deanconnect.nl.
 [212.57.59.66]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c2502f86ebsm4680230a12.77.2024.09.04.07.20.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Sep 2024 07:20:41 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Wed,  4 Sep 2024 16:20:34 +0200
Message-ID: <20240904142038.3294224-1-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1725459642; x=1726064442;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=8SRCArOGkfkUYIpg6M5jkjxV6zZEERg/DOYQ640CTKM=;
 b=H1TLWMQYg82ECOfQBD2KMd3G4bnkBfCe26KE3DYmljXVjyzhoJfSBPX20mO1MBoxoU
 DL2rev9RYUK/MU32v78mD3JGqlo24bvmAqiYbM/vB7gdCMG2jwcAx1wykomBYiz8m22Q
 0JbFXq9Gfpv+o99xVyaWcBu7eELjppF+ohE1E=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=H1TLWMQY
Subject: [Buildroot] [PATCH 1/5] configs/mender_x86_64_efi_defconfig: Update
 kernel to 6.6.49
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
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Adam Duskett <adam.duskett@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Update the kernel to the latest 6.6 LTS version

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 configs/mender_x86_64_efi_defconfig | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/configs/mender_x86_64_efi_defconfig b/configs/mender_x86_64_efi_defconfig
index 25a463abb3..fc54142e5f 100644
--- a/configs/mender_x86_64_efi_defconfig
+++ b/configs/mender_x86_64_efi_defconfig
@@ -2,7 +2,8 @@
 BR2_x86_64=y
 
 # Toolchain
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_18=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
+BR2_TOOLCHAIN_BUILDROOT_CXX=y
 
 # System
 BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
@@ -39,7 +40,7 @@ BR2_ROOTFS_POST_SCRIPT_ARGS="--data-part-size=32M --device-type=buildroot-x86_64
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.18.14"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.49"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/mender/x86_64/linux.config"
 BR2_LINUX_KERNEL_INSTALL_TARGET=y
-- 
2.46.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
