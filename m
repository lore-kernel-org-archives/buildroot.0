Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A447AC3DA49
	for <buildroot@archiver.kernel.org>; Sun, 14 Jul 2024 14:58:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0948E60611;
	Sun, 14 Jul 2024 14:58:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6sHSAd53kx83; Sun, 14 Jul 2024 14:58:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 12F5960621
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 12F5960621;
	Sun, 14 Jul 2024 14:58:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9E1581BF3D5
 for <buildroot@lists.busybox.net>; Sun, 14 Jul 2024 14:58:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 939B9811F4
 for <buildroot@lists.busybox.net>; Sun, 14 Jul 2024 14:58:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4J7mDUYdc-dY for <buildroot@lists.busybox.net>;
 Sun, 14 Jul 2024 14:58:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52d; helo=mail-ed1-x52d.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9D80E811F3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9D80E811F3
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9D80E811F3
 for <buildroot@buildroot.org>; Sun, 14 Jul 2024 14:58:05 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-5854ac817afso4360422a12.2
 for <buildroot@buildroot.org>; Sun, 14 Jul 2024 07:58:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720969083; x=1721573883;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=KvE1ZFxV4AD5kk8s6+htZrqPKqxZLQC+4Bkg9rYQ9Nc=;
 b=hwafYC37y7cSJfiEqEWocvO3LuI6YmhVjjTVRwfYJYCd9tgMCSKpby3yAqoxXBpcaW
 eD0YcmC29gpfewGoFQfns0IBgM5Pw4hssYhkY0wXORdsEN7tDP+GakWXRaI2c0NUymsM
 NQPCs8wv0G7a4/hIIQFoesAWT1uw/zPI/LZOg9mFPZiyzVg22ePWDc2tKUvzVsg/2Oct
 sWn0Cg3vfMsPNQ1ReDlYLLjeR7I8AIrqe+Odl2rsrFO9dbfbR2FMaGG9mDsEHmCVbW75
 1yU0g/zgrQDKTJm1S+VPjnyHUoBJM+1W9RTEEBMyZ8MoqBbha35BlXFIpzg3mA4RY6VN
 ovtw==
X-Gm-Message-State: AOJu0YwREplc5uYbIiZXIhGbtq8SCfUgcQbvoaVD192lnFqPAGmW7KYV
 XejEu9pxTEkypts5JMAjvfYwKdsPS2MmnOEyELrlDBnekB6pWuO7b5QhmCIRjbMjXNwPo4PfUPe
 4Q20=
X-Google-Smtp-Source: AGHT+IE8hK2tGd/UbFyeMQkiGk1MebZPOziyXFqFHctY/flyRF3G6Ht2K51xT9kRxONCdX78W0HYqA==
X-Received: by 2002:a05:6402:524a:b0:58e:e2a:1b58 with SMTP id
 4fb4d7f45d1cf-594ba98f2f9mr14073631a12.2.1720969083126; 
 Sun, 14 Jul 2024 07:58:03 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-79-44-29-159.retail.telecomitalia.it. [79.44.29.159])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-59b24f56d2fsm2122960a12.25.2024.07.14.07.58.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Jul 2024 07:58:02 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Sun, 14 Jul 2024 16:57:59 +0200
Message-ID: <20240714145759.3932146-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1720969083; x=1721573883;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=KvE1ZFxV4AD5kk8s6+htZrqPKqxZLQC+4Bkg9rYQ9Nc=;
 b=Ch1I7EIdep/o4QNAqUc1sOSmoYmT3hfA+9QzUQd+LCMXfFKCxQL4+Hs7voRw5LbGEq
 9/+NRa3Einn84wwzD8DTFZGjDQXySl0c5/+DPJW6YeKdcKiQeav/5s78uGJ6m+Fflsbn
 izGvW1ix6XRyEM8duaZYO++CySCqCgLS4Qwvk=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=Ch1I7EId
Subject: [Buildroot] [PATCH 1/1] configs/stm32f769_disco_sd: bump U-Boot to
 2024.07
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
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The patch bumps U-Boot to version 2024.07.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 .../stmicroelectronics/stm32f769-disco/patches/uboot/uboot.hash | 2 +-
 configs/stm32f769_disco_sd_defconfig                            | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/board/stmicroelectronics/stm32f769-disco/patches/uboot/uboot.hash b/board/stmicroelectronics/stm32f769-disco/patches/uboot/uboot.hash
index 97a2b4eaf95b..fe9b4f53dc63 100644
--- a/board/stmicroelectronics/stm32f769-disco/patches/uboot/uboot.hash
+++ b/board/stmicroelectronics/stm32f769-disco/patches/uboot/uboot.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  18a853fe39fad7ad03a90cc2d4275aeaed6da69735defac3492b80508843dd4a  u-boot-2024.04.tar.bz2
+sha256  f591da9ab90ef3d6b3d173766d0ddff90c4ed7330680897486117df390d83c8f  u-boot-2024.07.tar.bz2
diff --git a/configs/stm32f769_disco_sd_defconfig b/configs/stm32f769_disco_sd_defconfig
index c9140d089a39..2ec2687334c1 100644
--- a/configs/stm32f769_disco_sd_defconfig
+++ b/configs/stm32f769_disco_sd_defconfig
@@ -22,7 +22,7 @@ BR2_TARGET_ROOTFS_EXT2_SIZE="32M"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.04"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.07"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="stm32f769-disco"
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
