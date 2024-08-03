Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16303C3DA4A
	for <buildroot@archiver.kernel.org>; Sat,  3 Aug 2024 15:55:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7BBEB40233;
	Sat,  3 Aug 2024 15:55:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2H55FV7CYNqc; Sat,  3 Aug 2024 15:55:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3125840112
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3125840112;
	Sat,  3 Aug 2024 15:55:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A25831BF3B8
 for <buildroot@lists.busybox.net>; Sat,  3 Aug 2024 15:55:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9CA0F40386
 for <buildroot@lists.busybox.net>; Sat,  3 Aug 2024 15:55:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jUoyrWm95swl for <buildroot@lists.busybox.net>;
 Sat,  3 Aug 2024 15:55:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62e; helo=mail-ej1-x62e.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E855E40384
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E855E40384
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E855E40384
 for <buildroot@buildroot.org>; Sat,  3 Aug 2024 15:55:31 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-a7ad02501c3so262225666b.2
 for <buildroot@buildroot.org>; Sat, 03 Aug 2024 08:55:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722700529; x=1723305329;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mGkXRBEI/Px52ST+CkejWQMyPBskoONccBPilOqYu94=;
 b=c44aIcCZLOfFRTAZVSDqYPxui1+Ov9WHcmRQOKoDLd2eWKcVLNaZUecFZwgMmGxAVI
 RgxwTcFTwsopJxQgFvr2LaPHraEiVhnIE6p4KDA3voVtosBm5PJ/s4ZwuChh/RwxnKbP
 NAT30ckVQ2EAs2YtkJj8LtutYDBzTNBDZHsGKUDamWiP8xrxN+6QhSm6u9hFu8134qkF
 zoBc6I9rr40lTU/4Ukdlg+PgRRa0m7qPPgzTP5SNBiq7caGtC3AH9hlk13x+548ddPzA
 Uu7BVr7Kq+SzmIJBR4vxVBjm5s8FhJyFHOg7oWYGmUqox6tuaACat9JbnIo340POh/jH
 iMqg==
X-Gm-Message-State: AOJu0Yyva4TeZHAf5mdcUbKzHwC4KDvYV6zWlxU9EMX3+rnUxDPNoGb7
 cA12q5hGmHAZjwchEew2veVq/SQDU3yC9301KMdHwPDdU7btxfU/rHb3HUVYBZpFS2j2zTM+SIE
 o
X-Google-Smtp-Source: AGHT+IEgFseHsQSfB+zf8MaifG6nLSY/vlJLJlIKGaNhaldU4J+1nHSjyNEgbY3g3YJn4cIikvEEqA==
X-Received: by 2002:a17:907:724b:b0:a7a:c083:8575 with SMTP id
 a640c23a62f3a-a7dc4ae31afmr570455466b.0.1722700529317; 
 Sat, 03 Aug 2024 08:55:29 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-79-17-93-104.retail.telecomitalia.it. [79.17.93.104])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7dc9bc9db6sm228584966b.8.2024.08.03.08.55.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Aug 2024 08:55:28 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Sat,  3 Aug 2024 17:55:14 +0200
Message-ID: <20240803155517.3499273-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1722700529; x=1723305329;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=mGkXRBEI/Px52ST+CkejWQMyPBskoONccBPilOqYu94=;
 b=WJfApEVbZRwtVOYKvOus2qzc9NyXnN2zsmLYw7KuicXKYeJgSOOfcUaybA7Ijg1lp0
 x87fZGY0YNejEQXjvfS+iI9XGmJ4O8W5dLmNegDbbvcGs7KatkzyCHPRwRjDvjS5FAON
 9m12tYTpvbF85Ds9+Jyy/8Su+Bf6D3vN61Uw0=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=WJfApEVb
Subject: [Buildroot] [PATCH 0/3] tinit and stm32f746_disco_sd_defconfig
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
Cc: linux-amarula@amarulasolutions.com, Damien Le Moal <dlemoal@kernel.org>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This series is inspired by reading the following topic:

https://lore.kernel.org/buildroot/20230206230203.70e2dbd8@windsurf/T

Starting from that patch, and following Thomas Petazzoni's suggestions
regarding the possibility of using a single minimal script without
duplicating it within Buildroot, I developed these three patches.
Meanwhile, the configuration for the stm32f746_disco board was useful
for developing the display support for the board, which was later
merged into Linux.

Dario Binacchi (3):
  package/tinit: new package
  configs/stm32f746_disco_sd_defconfig: new defconfig
  board/canaan/k210-soc: use tinit as Linux init process

 .checkpackageignore                           |   1 -
 DEVELOPERS                                    |   3 +
 board/canaan/k210-soc/rootfs_overlay/init     |   1 -
 .../canaan/k210-soc/rootfs_overlay/sbin/init  |  41 ----
 board/canaan/k210-soc/tinit-logo.txt          |   7 +
 board/canaan/k210-soc/tinit-setup.sh          |  10 +
 .../stm32f746-disco/busybox-tiny.config       | 230 ++++++++++++++++++
 .../stm32f746-disco/extlinux.conf             |   4 +
 .../stm32f746-disco/flash_sd.sh               |  22 ++
 .../stm32f746-disco/genimage.cfg              |  27 ++
 .../stm32f746-disco/linux.fragment            |  13 +
 .../patches/linux-headers/linux-headers.hash  |   1 +
 .../stm32f746-disco/patches/linux/linux.hash  |   2 +
 .../stm32f746-disco/patches/uboot/uboot.hash  |   2 +
 .../stm32f746-disco/post-build.sh             |  15 ++
 .../stm32f746-disco/readme.txt                |  31 +++
 .../stm32f746-disco/tinit-logo.txt            |  10 +
 configs/canaan_kd233_defconfig                |   4 +-
 configs/sipeed_maix_bit_defconfig             |   4 +-
 configs/sipeed_maix_bit_sdcard_defconfig      |   5 +-
 configs/sipeed_maix_dock_defconfig            |   4 +-
 configs/sipeed_maix_dock_sdcard_defconfig     |   5 +-
 configs/sipeed_maix_go_defconfig              |   4 +-
 configs/sipeed_maix_go_sdcard_defconfig       |   4 +-
 configs/sipeed_maixduino_defconfig            |   4 +-
 configs/sipeed_maixduino_sdcard_defconfig     |   5 +-
 configs/stm32f746_disco_sd_defconfig          |  32 +++
 package/Config.in                             |   1 +
 package/tinit/Config.in                       |   9 +
 package/tinit/tinit.hash                      |   3 +
 package/tinit/tinit.mk                        |  17 ++
 system/Config.in                              |   5 +
 32 files changed, 462 insertions(+), 64 deletions(-)
 delete mode 120000 board/canaan/k210-soc/rootfs_overlay/init
 delete mode 100755 board/canaan/k210-soc/rootfs_overlay/sbin/init
 create mode 100644 board/canaan/k210-soc/tinit-logo.txt
 create mode 100755 board/canaan/k210-soc/tinit-setup.sh
 create mode 100644 board/stmicroelectronics/stm32f746-disco/busybox-tiny.config
 create mode 100644 board/stmicroelectronics/stm32f746-disco/extlinux.conf
 create mode 100755 board/stmicroelectronics/stm32f746-disco/flash_sd.sh
 create mode 100644 board/stmicroelectronics/stm32f746-disco/genimage.cfg
 create mode 100644 board/stmicroelectronics/stm32f746-disco/linux.fragment
 create mode 120000 board/stmicroelectronics/stm32f746-disco/patches/linux-headers/linux-headers.hash
 create mode 100644 board/stmicroelectronics/stm32f746-disco/patches/linux/linux.hash
 create mode 100644 board/stmicroelectronics/stm32f746-disco/patches/uboot/uboot.hash
 create mode 100755 board/stmicroelectronics/stm32f746-disco/post-build.sh
 create mode 100644 board/stmicroelectronics/stm32f746-disco/readme.txt
 create mode 100644 board/stmicroelectronics/stm32f746-disco/tinit-logo.txt
 create mode 100644 configs/stm32f746_disco_sd_defconfig
 create mode 100644 package/tinit/Config.in
 create mode 100644 package/tinit/tinit.hash
 create mode 100644 package/tinit/tinit.mk

-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
