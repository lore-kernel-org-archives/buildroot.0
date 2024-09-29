Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FCD4CF6495
	for <buildroot@archiver.kernel.org>; Sun, 29 Sep 2024 20:15:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 981C380F87;
	Sun, 29 Sep 2024 20:15:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gojOIB0qugtJ; Sun, 29 Sep 2024 20:15:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 948D880F8A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 948D880F8A;
	Sun, 29 Sep 2024 20:15:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1D9F81BF334
 for <buildroot@lists.busybox.net>; Sun, 29 Sep 2024 20:15:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0CCCE605A5
 for <buildroot@lists.busybox.net>; Sun, 29 Sep 2024 20:15:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9lhPsoXqjUI6 for <buildroot@lists.busybox.net>;
 Sun, 29 Sep 2024 20:15:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52f; helo=mail-ed1-x52f.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org AD478600D4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AD478600D4
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AD478600D4
 for <buildroot@buildroot.org>; Sun, 29 Sep 2024 20:15:09 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-5c5b9bf9d8bso2681053a12.1
 for <buildroot@buildroot.org>; Sun, 29 Sep 2024 13:15:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727640907; x=1728245707;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=eHoHaCt0NqhsQ4c0r7/JYyRTqN9mUsgURclenXCEUSU=;
 b=EgYurviJYy2dckTqT34JXYBQGN/Z9EM6CwB9oYr9TG1OvW9ocjgfswO+QWWtXdcNPZ
 AE0rkCgIuvM87KohSqFOg7+OjIpI90Pd3XiVb/JJ/1EROIZNHgAEo6L5YTFV5RMgY9DH
 GC/GhtH76HRuWbBEK8XOHGVR5k2dycI7LVE9jjHCTI+3kkDHg/a/JYWZ/qmKk+czPGae
 Lwb5qJqdA1pNQDL6Wu01xBxF9/VKsM0asFOVzpphKEXWtdG7m6WP6RgyTSEzL2ow/EE+
 EfD4J8lb7LbX+9j/DQ2bfEtY26W03KI8AbBqGSfF2iG1f4v5qrVOK9YsLApstnJM5CwZ
 GNfg==
X-Gm-Message-State: AOJu0YySTnGNmgh2MEtglSY5VdClGFLnBjN5brZwpLSY3IfC7AzlParl
 fh6Gqyow3Ih8aC/c30IqpgHEYzYzEOMtPQmPIenKNvHB37K5kpMFOZiW6ed8063Vrd+BqJ+6+/u
 /o9s=
X-Google-Smtp-Source: AGHT+IGABn3kQLg0E7LjKnF0tncOWkWPhycuJhhRIULxBHcKqUlNCfvUzTZoMumgBZgyLX9kfgFJeQ==
X-Received: by 2002:a05:6402:27c6:b0:5c7:202f:ec9b with SMTP id
 4fb4d7f45d1cf-5c8824e7ce5mr14493497a12.16.1727640906922; 
 Sun, 29 Sep 2024 13:15:06 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-79-54-102-102.retail.telecomitalia.it. [79.54.102.102])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c88245fbd2sm3537870a12.42.2024.09.29.13.15.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Sep 2024 13:15:05 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Sun, 29 Sep 2024 22:14:50 +0200
Message-ID: <20240929201459.1761285-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1727640907; x=1728245707;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=eHoHaCt0NqhsQ4c0r7/JYyRTqN9mUsgURclenXCEUSU=;
 b=l07BWJtnDIUkE/Q+HBrzkVQxIC2UzHSocegQ8EU3wKv+6fESXjArPCPohlFJbXx11M
 545sUeNqOArrL/9nqBayucAaLDHTWi2q8GIhWCVbUy4PDHIDDLzppXoZHB2eVpSFE/rZ
 zsvUKLOpi4+HFHifInIoYvZY9IwJhFS2vwfN8=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=l07BWJtn
Subject: [Buildroot] [PATCH v3 0/9] add ARM FDPIC support
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

I resumed the series [1] submitted by Waldemar Brodkorb, where I made
some changes to the patch [9/9] "configs/stm32f746_disco_sd: new defconfig"
based on the suggestions provided by Thomas Petazzoni during the review
of a previous series [2].

Like Waldemar, I also did not encounter any issues during testing on the
board.

[1] https://patchwork.ozlabs.org/project/buildroot/cover/20240919035308.2622723-1-wbx@openadk.org/
[2] https://patchwork.ozlabs.org/project/buildroot/patch/20240822183742.3550055-3-dario.binacchi@amarulasolutions.com/

Ben Wolsieffer (6):
  Revert: "arch: drop now useless support for FDPIC"
  arch: don't enable FDPIC binaries by default
  arch/arm: add support for FDPIC
  boot/uboot: pass -mno-fdpic if FDPIC is enabled
  linux: pass -mno-fdpic if FDPIC is enabled
  package/uclibc: enable NPTL on no-MMU ARM w/ FDPIC

Dario Binacchi (2):
  Add the right dependencies on BR2_BINFMT_* to the toolchains
  configs/stm32f746_disco_sd: new defconfig

Waldemar Brodkorb (1):
  package/busybox: remove STATIC from busybox-minimal.config

 DEVELOPERS                                    |   4 +
 arch/Config.in                                |  14 ++
 .../stm32f746-disco/extlinux.conf             |   4 +
 .../stm32f746-disco/flash_sd.sh               |  22 ++
 .../stm32f746-disco/genimage.cfg              |  10 +
 .../stm32f746-disco/linux.fragment            |  13 ++
 .../patches/linux-headers/linux-headers.hash  |   1 +
 .../stm32f746-disco/patches/linux/linux.hash  |   2 +
 .../stm32f746-disco/patches/uboot/uboot.hash  |   2 +
 .../stm32f746-disco/post-build.sh             |   4 +
 .../stm32f746-disco/readme.txt                |  31 +++
 boot/uboot/uboot.mk                           |   5 +
 configs/stm32f746_disco_sd_defconfig          |  31 +++
 linux/linux.mk                                |   8 +-
 package/Makefile.in                           |   6 +
 package/busybox/busybox-minimal.config        |   2 +-
 package/glibc/Config.in                       |   1 +
 package/musl/Config.in                        |   1 +
 package/uclibc/Config.in                      |   2 +-
 package/uclibc/uclibc.mk                      |   7 +
 .../Config.in                                 |   1 +
 .../toolchain-external-arm-aarch64/Config.in  |   1 +
 .../Config.in.options                         | 194 ++++++++++++++++++
 .../Config.in                                 |   1 +
 .../Config.in                                 |   1 +
 .../Config.in                                 |   1 +
 .../toolchain-external-linaro-arm/Config.in   |   1 +
 .../toolchain-external-linaro-armeb/Config.in |   1 +
 .../toolchain-external-synopsys-arc/Config.in |   1 +
 29 files changed, 369 insertions(+), 3 deletions(-)
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

-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
