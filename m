Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BC9ACA1018
	for <buildroot@archiver.kernel.org>; Sat, 31 Aug 2024 12:08:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 07819423FF;
	Sat, 31 Aug 2024 12:08:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tF5MNzBGBiws; Sat, 31 Aug 2024 12:08:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8F54C42401
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8F54C42401;
	Sat, 31 Aug 2024 12:08:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8C4C31BF5F5
 for <buildroot@lists.busybox.net>; Sat, 31 Aug 2024 12:08:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 78FE34043E
 for <buildroot@lists.busybox.net>; Sat, 31 Aug 2024 12:08:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dMZlEPgDNLYm for <buildroot@lists.busybox.net>;
 Sat, 31 Aug 2024 12:08:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::535; helo=mail-ed1-x535.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C113E402F3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C113E402F3
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C113E402F3
 for <buildroot@buildroot.org>; Sat, 31 Aug 2024 12:08:44 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-5bec87ececeso2913864a12.0
 for <buildroot@buildroot.org>; Sat, 31 Aug 2024 05:08:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725106122; x=1725710922;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=BYZ9DIWvGs9tvFULnODIqf6L8LFXhhqxKQqgTncTLYk=;
 b=wVZ8u6kI/SJ6KSyO6EZonLY+JaZ2PgpEryWgOmUR2jd5APHRXA/UhX3bdPC8gIpNId
 T46xM4G9u8MXVdkY5DfqW0W0cUBKBqbHIDH4mwQhchEOuBMKrYzhfG3JXeMRlcsbTvbt
 hIIwo86Pqjc8dQ4LWWJ3Tb3rAQ1pbLzDDtAPnBIQ1cQq1WH+uOANY5OGvYfGONRWRJxv
 vsnNxdtuIbCqEm7WsTpeGq9kUQumiZc7ou/4en7d1orG2whqJnsvNh6Gy8f6fMA9T1vk
 v+CgcmfbO3WDruEL3sF3P07u0qKpmL5ySbEsTaiBLAw87i/HT6EdO8U/sGyj4dUkG58Q
 cK0g==
X-Gm-Message-State: AOJu0Yzzg3uSeekXyM9EKHxbhu2P4SBW3Fdh80Ma0y4pvjXY2BiMPdFM
 wFdj9Vv7i91BwJ9kHvULay8eTwVJAuud5ijE7pVBce0FBZ9ayo4J+lb3Ct1v1mUevuB7qretE9/
 uB0k=
X-Google-Smtp-Source: AGHT+IEJ0ghOR0MGDyHvFc8bnWDTNWyCfOSLEWvDonFPBUUo3iSXooJS9tOU2Ch/UIBJNoV+cOl6rQ==
X-Received: by 2002:a05:6402:3551:b0:5c2:1813:5201 with SMTP id
 4fb4d7f45d1cf-5c21ed4c2dcmr6862309a12.17.1725106122304; 
 Sat, 31 Aug 2024 05:08:42 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-82-48-52-249.retail.telecomitalia.it. [82.48.52.249])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c226ce4f47sm2938178a12.88.2024.08.31.05.08.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 31 Aug 2024 05:08:41 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Sat, 31 Aug 2024 14:08:30 +0200
Message-ID: <20240831120833.2915529-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1725106122; x=1725710922;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=BYZ9DIWvGs9tvFULnODIqf6L8LFXhhqxKQqgTncTLYk=;
 b=FkudMTaumvbzZNmLnEndtXjjNdKq8lZxKruzueYRHnvWw1o2EoQR+Wsr/L+AAUE0jM
 pkJmneFkFNjNnPpfnDxhISP5Nrg37dSjFOLtYSc4PAwKmpvZGMfp818bWwlGEJups60X
 KGP0wzWlEVtaAGz1nMS557puztatVJ6UgRgms=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=FkudMTau
Subject: [Buildroot] [PATCH v4 0/3] tinyinit and stm32f746_disco_sd_defconfig
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
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
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

This time the patches have been applied to Yann's series:
https://patchwork.ozlabs.org/project/buildroot/list/?series=421768
and therefore not directly to the master.

Regarding Thomas's suggestion to remove the u-boot partition:
https://patchwork.ozlabs.org/project/buildroot/patch/20240822183742.3550055-3-dario.binacchi@amarulasolutions.com/
I removed it, but the system became more unstable, so I kept the vfat
partition, as is already done in other configurations for ST boards.

Dario Binacchi (3):
  package/tinyinit: new package
  configs/stm32f746_disco_sd: new defconfig
  board/canaan/k210-soc: use tinyinit as Linux init process

 .checkpackageignore                           |  1 -
 DEVELOPERS                                    |  3 ++
 board/canaan/k210-soc/rootfs_overlay/init     |  1 -
 .../stm32f746-disco/extlinux.conf             |  4 +++
 .../stm32f746-disco/flash_sd.sh               | 22 +++++++++++++
 .../stm32f746-disco/genimage.cfg              | 27 ++++++++++++++++
 .../stm32f746-disco/linux.fragment            | 13 ++++++++
 .../patches/linux-headers/linux-headers.hash  |  1 +
 .../stm32f746-disco/patches/linux/linux.hash  |  2 ++
 .../stm32f746-disco/patches/uboot/uboot.hash  |  2 ++
 .../stm32f746-disco/post-build.sh             |  4 +++
 .../stm32f746-disco/readme.txt                | 31 +++++++++++++++++++
 configs/canaan_kd233_defconfig                |  3 +-
 configs/sipeed_maix_bit_defconfig             |  3 +-
 configs/sipeed_maix_bit_sdcard_defconfig      |  3 +-
 configs/sipeed_maix_dock_defconfig            |  3 +-
 configs/sipeed_maix_dock_sdcard_defconfig     |  3 +-
 configs/sipeed_maix_go_defconfig              |  3 +-
 configs/sipeed_maix_go_sdcard_defconfig       |  3 +-
 configs/sipeed_maixduino_defconfig            |  3 +-
 configs/sipeed_maixduino_sdcard_defconfig     |  3 +-
 configs/stm32f746_disco_sd_defconfig          | 31 +++++++++++++++++++
 package/Config.in                             |  1 +
 package/busybox/busybox.mk                    |  1 +
 package/tinyinit/Config.in                    |  8 +++++
 .../sbin => package/tinyinit}/init            | 11 +------
 package/tinyinit/tinyinit.mk                  | 13 ++++++++
 system/Config.in                              |  9 ++++++
 28 files changed, 182 insertions(+), 30 deletions(-)
 delete mode 120000 board/canaan/k210-soc/rootfs_overlay/init
 create mode 100644 board/stmicroelectronics/stm32f746-disco/extlinux.conf
 create mode 100755 board/stmicroelectronics/stm32f746-disco/flash_sd.sh
 create mode 100644 board/stmicroelectronics/stm32f746-disco/genimage.cfg
 create mode 100644 board/stmicroelectronics/stm32f746-disco/linux.fragment
 create mode 120000 board/stmicroelectronics/stm32f746-disco/patches/linux-headers/linux-headers.hash
 create mode 100644 board/stmicroelectronics/stm32f746-disco/patches/linux/linux.hash
 create mode 100644 board/stmicroelectronics/stm32f746-disco/patches/uboot/uboot.hash
 create mode 100755 board/stmicroelectronics/stm32f746-disco/post-build.sh
 create mode 100644 board/stmicroelectronics/stm32f746-disco/readme.txt
 create mode 100644 configs/stm32f746_disco_sd_defconfig
 create mode 100644 package/tinyinit/Config.in
 rename {board/canaan/k210-soc/rootfs_overlay/sbin => package/tinyinit}/init (75%)
 mode change 100755 => 100644
 create mode 100644 package/tinyinit/tinyinit.mk

-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
