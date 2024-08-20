Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0049AC531DC
	for <buildroot@archiver.kernel.org>; Tue, 20 Aug 2024 19:19:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 664314061F;
	Tue, 20 Aug 2024 19:19:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XQwQAhKPN6BN; Tue, 20 Aug 2024 19:19:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0E39C40B09
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0E39C40B09;
	Tue, 20 Aug 2024 19:19:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3F4721BF378
 for <buildroot@lists.busybox.net>; Tue, 20 Aug 2024 19:19:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3A9DE808A9
 for <buildroot@lists.busybox.net>; Tue, 20 Aug 2024 19:19:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Cp7s-iWg2z2n for <buildroot@lists.busybox.net>;
 Tue, 20 Aug 2024 19:19:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2BD2080890
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2BD2080890
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2BD2080890
 for <buildroot@buildroot.org>; Tue, 20 Aug 2024 19:19:44 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-429ec9f2155so41568985e9.2
 for <buildroot@buildroot.org>; Tue, 20 Aug 2024 12:19:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724181582; x=1724786382;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lrw8Ffc4CTDoaBtC7FAra2xTqE6TkrLvO1usUqTIj0U=;
 b=BG2M/AHqUGTz+oMxcO2N8MPocobOP1e2sTrCfxbVNcZXmVhqI9p7c86+rc6P7fw4Xu
 0paYcz+5F3RZMTnScajAls3xBrGmaAoxLy3xMU5nMkAmOK7cVXeABvkWmew/5FL8tpSz
 fQy/LwGCdyX/gY3lFkqvJxCTMXENQUxSZw61Nof8KwJ0xaHgL/4ZJR2A5LI6oybfitgQ
 p3MXk22AewGyeF77/xxk8REQmYpeWYjU5hOeVO97c76jJf9gJRNEH61rn6QMByQib0nd
 /ai0/Ruif3a/uCC1SDay/a/4jXC2x3622gjLOnfS2HE9BG9KbkZwf3fFVDxxjlE8sZR8
 WWJw==
X-Gm-Message-State: AOJu0YwsE1qeXim2ddolWL4mtq/eaANh7o7kWJEdl77LqvIwPI2YO3WT
 7iQECVz51OdN/7d7D4xZ2kFG1GOdpZwIWUn7D0fL3zh+FBYO04WslHFwPXo7cpAMqQzbFfBJySa
 0V9A=
X-Google-Smtp-Source: AGHT+IHDjoDm8hgngKELV7NYtXyN3nMJD9MbSC7MuzT1doWfURTYuf8isxg1OJx0nQrJOCfmI2k3KQ==
X-Received: by 2002:a05:600c:3b12:b0:421:7bed:5274 with SMTP id
 5b1f17b1804b1-42abd216511mr2679355e9.10.1724181581723; 
 Tue, 20 Aug 2024 12:19:41 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com ([2.196.40.87])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3718983a184sm13763209f8f.14.2024.08.20.12.19.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Aug 2024 12:19:41 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Tue, 20 Aug 2024 21:19:24 +0200
Message-ID: <20240820191927.2126281-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1724181582; x=1724786382;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=lrw8Ffc4CTDoaBtC7FAra2xTqE6TkrLvO1usUqTIj0U=;
 b=FiN6jnNa5a+6aojHUT1ndtQ1IJa2p20cI06OpiFQ3X2Vr+9jTFe4CiJs5KyoX6sqvm
 ioDw5krZtbcoq5c91UzXYmt0u9rPk8NuIIwr3WNNkLuGsIutvaFe4XqHQMSeygsjXfhe
 M3oIblaE7FAqA+6TVYaunkcOhlVQv7hauctg0=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=FiN6jnNa
Subject: [Buildroot] [PATCH v2 0/3] tinyinit and stm32f746_disco_sd_defconfig
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
Cc: Damien Le Moal <dlemoal@kernel.org>,
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
  package/tinyinit: new package
  configs/stm32f746_disco_sd: new defconfig
  board/canaan/k210-soc: use tinyinit as Linux init process

 .checkpackageignore                           |  1 -
 DEVELOPERS                                    |  3 ++
 board/canaan/k210-soc/rootfs_overlay/init     |  1 -
 .../canaan/k210-soc/rootfs_overlay/sbin/init  | 41 -------------------
 .../stm32f746-disco/extlinux.conf             |  4 ++
 .../stm32f746-disco/flash_sd.sh               | 22 ++++++++++
 .../stm32f746-disco/genimage.cfg              | 27 ++++++++++++
 .../stm32f746-disco/linux.fragment            | 13 ++++++
 .../patches/linux-headers/linux-headers.hash  |  1 +
 .../stm32f746-disco/patches/linux/linux.hash  |  2 +
 .../stm32f746-disco/patches/uboot/uboot.hash  |  2 +
 .../stm32f746-disco/post-build.sh             |  9 ++++
 .../stm32f746-disco/readme.txt                | 31 ++++++++++++++
 configs/canaan_kd233_defconfig                |  3 +-
 configs/sipeed_maix_bit_defconfig             |  3 +-
 configs/sipeed_maix_bit_sdcard_defconfig      |  3 +-
 configs/sipeed_maix_dock_defconfig            |  3 +-
 configs/sipeed_maix_dock_sdcard_defconfig     |  3 +-
 configs/sipeed_maix_go_defconfig              |  3 +-
 configs/sipeed_maix_go_sdcard_defconfig       |  3 +-
 configs/sipeed_maixduino_defconfig            |  3 +-
 configs/sipeed_maixduino_sdcard_defconfig     |  3 +-
 configs/stm32f746_disco_sd_defconfig          | 31 ++++++++++++++
 package/Config.in                             |  1 +
 package/tinyinit/Config.in                    |  7 ++++
 package/tinyinit/tinyinit.mk                  | 12 ++++++
 system/Config.in                              |  5 +++
 27 files changed, 179 insertions(+), 61 deletions(-)
 delete mode 120000 board/canaan/k210-soc/rootfs_overlay/init
 delete mode 100755 board/canaan/k210-soc/rootfs_overlay/sbin/init
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
 create mode 100644 package/tinyinit/tinyinit.mk

-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
