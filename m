Return-Path: <SRS0=xEd5=PS=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A068C433EF
	for <buildroot@archiver.kernel.org>; Sat, 30 Oct 2021 21:36:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 46F6560E8B
	for <buildroot@archiver.kernel.org>; Sat, 30 Oct 2021 21:36:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 46F6560E8B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=openest.io
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C520F401EA;
	Sat, 30 Oct 2021 21:36:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iz2PtI5F-Ahf; Sat, 30 Oct 2021 21:36:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DC74740200;
	Sat, 30 Oct 2021 21:36:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 43AD41BF23C
 for <buildroot@lists.busybox.net>; Sat, 30 Oct 2021 21:36:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3286960719
 for <buildroot@lists.busybox.net>; Sat, 30 Oct 2021 21:36:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oKNIiOQ24yHL for <buildroot@lists.busybox.net>;
 Sat, 30 Oct 2021 21:36:31 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3BF2D605FE
 for <buildroot@buildroot.org>; Sat, 30 Oct 2021 21:36:31 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id s13so15062708wrb.3
 for <buildroot@buildroot.org>; Sat, 30 Oct 2021 14:36:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=IK9rH/o27cqgaXA4H3Mr80IAj00ZILCw/nOSWfLlnk0=;
 b=fmoTFMJS7cg/1pNkNxlpf2vASn9KazxYS/WmRdTAbvUpuY3zoqzSAfgCZ8vo4CWFg8
 /UsyNFPxbHWhRj9SewcuxNdsKq3VYmjGUUug9gneSMNJMl3N42p98yuMlqYZLGQxsSnt
 fLC59crJ69NHBW+joOsOFEs7Qou3tc4I8MXktYI1+rSMN7jMtK37EcsX60JobSxaTuU8
 2yOzeVwsM3y4wUkU/fTSPlCobpCuP1t2zIsFKK0Ar9ZV1qHQK2KM53lZSDC+YHiEDKnD
 WWq1XsJghz9PLzWO9vfPvDmgF1zo2J5NuCgru/BO1ZgWqxQwCBah17UlM2aPmN+taKeP
 8j8w==
X-Gm-Message-State: AOAM530tqmAebrhjCXYOSAeJKyVzMC0sScpBzt1LUTVQ45cfby8bQek/
 gfoGJBKW+1AJnMopMn7oSPkDynostwk=
X-Google-Smtp-Source: ABdhPJy6MWknpNJIVFP9/wqCKaKhZc3nwL98H+RaKWjmCagQS1J+SIk5rRyadWkdx3q/w11Uae+FWQ==
X-Received: by 2002:adf:e8cb:: with SMTP id k11mr24861064wrn.2.1635629789286; 
 Sat, 30 Oct 2021 14:36:29 -0700 (PDT)
Received: from alderan.numericable.fr (249.164.25.93.rev.sfr.net.
 [93.25.164.249])
 by smtp.gmail.com with ESMTPSA id m34sm7830766wms.25.2021.10.30.14.36.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Oct 2021 14:36:28 -0700 (PDT)
From: Julien Grossholtz <julien.grossholtz@openest.io>
To: buildroot@buildroot.org
Date: Sat, 30 Oct 2021 23:35:58 +0200
Message-Id: <20211030213600.3445223-1-julien.grossholtz@openest.io>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Subject: [Buildroot] [v2 PATCH 0/2] Raspberry-Pi Zero 2 W support
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
Cc: Peter Seiderer <ps.report@gmx.net>, Martin Bark <martin@barkynet.com>,
 Julien Grossholtz <julien.grossholtz@openest.io>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

Here is an update of my previous Raspberry-Pi Zero 2 W support.
As Peter Seiderer pointed out, the Raspberry-Pi Linux Kernel was
updated with a new bcm2710-rpi-zero-2.dtb [1] a few hours after I sent
the patch.

Therefore, I bumped the Raspberry-Pi Linux kernel to 5.10.76 for all related
boards. I built and tested it for the Pis I have access to : Pi Zero W
and Pi 4 (32 and 64 bit versions). But, I cannot test the other.

Regarding the Raspberry-Pi Zero 2 W, I updated the patch with the new
dts and kernel git sha1. I booted it, everything seems to work: HDMI,
Micro SD and Wi-Fi with some extra packages.

Let me know what you think,

Julien Grossholtz


[1] https://github.com/raspberrypi/linux/commit/84dc624be6ae704fdb3c413b7d86315cf49fbb0b


*** BLURB HERE ***

Julien Grossholtz (2):
  configs/raspberrypi: bump kernel to 581049d (5.10.76)
  board/raspberrypi: add Raspberry Pi Zero 2 W

 board/raspberrypi/config_zero2w.txt           | 29 +++++++++++++++
 .../genimage-raspberrypizero2w.cfg            | 31 ++++++++++++++++
 board/raspberrypi/readme.txt                  |  5 +++
 board/raspberrypizero2w                       |  1 +
 configs/raspberrypi0_defconfig                |  2 +-
 configs/raspberrypi0w_defconfig               |  2 +-
 configs/raspberrypi2_defconfig                |  2 +-
 configs/raspberrypi3_64_defconfig             |  2 +-
 configs/raspberrypi3_defconfig                |  2 +-
 configs/raspberrypi3_qt5we_defconfig          |  2 +-
 configs/raspberrypi4_64_defconfig             |  2 +-
 configs/raspberrypi4_defconfig                |  2 +-
 configs/raspberrypi_defconfig                 |  2 +-
 configs/raspberrypicm4io_64_defconfig         |  2 +-
 configs/raspberrypicm4io_defconfig            |  2 +-
 configs/raspberrypizero2w_defconfig           | 36 +++++++++++++++++++
 16 files changed, 113 insertions(+), 11 deletions(-)
 create mode 100644 board/raspberrypi/config_zero2w.txt
 create mode 100644 board/raspberrypi/genimage-raspberrypizero2w.cfg
 create mode 120000 board/raspberrypizero2w
 create mode 100644 configs/raspberrypizero2w_defconfig

-- 
2.31.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
