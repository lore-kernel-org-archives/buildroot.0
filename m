Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FD01CFB43F
	for <buildroot@archiver.kernel.org>; Mon,  7 Oct 2024 10:52:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C253B40600;
	Mon,  7 Oct 2024 10:52:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qFIoBB1ACVED; Mon,  7 Oct 2024 10:52:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 75102401D5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 75102401D5;
	Mon,  7 Oct 2024 10:52:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A37931BF3EE
 for <buildroot@lists.busybox.net>; Mon,  7 Oct 2024 10:52:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 914B5405FD
 for <buildroot@lists.busybox.net>; Mon,  7 Oct 2024 10:52:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EDBTwBbqa_QM for <buildroot@lists.busybox.net>;
 Mon,  7 Oct 2024 10:51:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::535; helo=mail-ed1-x535.google.com;
 envelope-from=adam.duskett@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org EA954401D5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EA954401D5
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EA954401D5
 for <buildroot@buildroot.org>; Mon,  7 Oct 2024 10:51:58 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-5c895d975e5so847279a12.2
 for <buildroot@buildroot.org>; Mon, 07 Oct 2024 03:51:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728298316; x=1728903116;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vZeXCWJ0EUrRSKkWeInmVcC+ucxCmMzZVCV3YW21/wo=;
 b=D8ymOgBZyYSpn3DTum/fRD3HmsE33LbSWWK5ZXJniKBZWt9nHO9TlyHEntY+hWGCrs
 JuUGrv4XDMkitadry84c5QWtL4TWfSXkFwTybTQu7YMS1uXsysPM5QW8Hpk9cO5meqEZ
 EIR604fwZhseiSQ/jBmnm15W2Ayjjco0SLwvXLmezANR6jxAEDNOfiUdu5EbMa9F/Iwo
 Q2MJl2qlpNyq3Pj9287TrsZp65Hop4ZuyH9Y74dY7ejO2KDjcPR6ZP1EEA1jnuSn2b/G
 cDGBE1WXKzA+UgaztIXIF35kZVy38FLjjZSCumN2mYAB+7EokQkc7AmGJofeTEo9V8qi
 NaPA==
X-Gm-Message-State: AOJu0YwMiq1/Sjre5ynsl/pmiKchWpSV5ewNVh+OAhenM2xrBnCKFyYo
 BDphTU6jVhZbI/kqIvMuqwGvB1Xuvrl3DZdsDxqfslZgM86Fd+UEUm7BV0O8t/BwmUwTyCC1pQy
 /nVQ=
X-Google-Smtp-Source: AGHT+IE7gvTVRcwVZE9/WzDpZK9us58kCv8fwzezRokfxwm3igDmDsrlmXL3Mici55du6+itpBPcYw==
X-Received: by 2002:a17:907:7d93:b0:a99:4c5e:1b35 with SMTP id
 a640c23a62f3a-a994c5e1e7fmr238702466b.5.1728298316023; 
 Mon, 07 Oct 2024 03:51:56 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:6467:4426:e642:fe3c:c003:b424])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a992e5bb208sm365515266b.22.2024.10.07.03.51.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Oct 2024 03:51:55 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Mon,  7 Oct 2024 12:51:43 +0200
Message-ID: <20241007105145.1206538-1-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.46.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1728298316; x=1728903116;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=vZeXCWJ0EUrRSKkWeInmVcC+ucxCmMzZVCV3YW21/wo=;
 b=k/z2Zhc+rJnWDmSd9HDLBd1ErpF0yzk2zlV2C+D9WHXeKSHRkz+8kjdsM/OFr8DnDv
 Q1+5+Ip5HAhHVsJCfWXeJCZxPZ6AmtiM+Dy6CZhvrXzyGIJTF/doVxq6AAzJCgIFL1oU
 WWYmfgGIu0q3FZ6KXdW3NPfb4x26w3zNO2E7U=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=k/z2Zhc+
Subject: [Buildroot] [PATCH 0/2] package/mender: bump to version 4.0.4
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

This patch is huge, but it must be huge. Sorry about this!

Starting with Mender version 4, the program is rewritten from Go to C++ using
CMake. Please see the second patch as to all the reasonings behind having such
and enormous patch, but there are two options:

1) Update mender first to the latest go version, then bump to 4.x
2) Rip the bandaid off and move to the C++ version in one go.

I opted for option 2.

Also, this patch depends on https://patchwork.ozlabs.org/project/buildroot/patch/20240920181212.3572055-2-francois.perrad@gadz.org/

Enjoy the giant patch!

Adam

Adam Duskett (2):
  board/mender/x86_64: clean up post build and image scripts
  package/mender: bump package version to 4.0.4

 board/mender/x86_64/linux.config              |   1 +
 board/mender/x86_64/post-build.sh             |  19 +-
 board/mender/x86_64/post-image-efi.sh         |  41 +++-
 configs/mender_x86_64_efi_defconfig           |   5 +-
 .../0001-rootfs-image-shellcheck-fixups.patch | 110 ++++++++++
 package/mender/Config.in                      | 132 ++++++++++--
 package/mender/S42mender                      |  60 ------
 package/mender/artifact_info                  |   1 -
 package/mender/device_type                    |   1 -
 package/mender/mender-authd.service           |  14 ++
 package/mender/mender-client.service          |  24 ---
 package/mender/mender-updated.service         |  14 ++
 package/mender/mender.conf                    |   1 +
 package/mender/mender.hash                    |  48 ++---
 package/mender/mender.mk                      | 192 +++++++++++-------
 package/mender/readme.txt                     |  42 ++--
 support/testing/tests/package/test_mender.py  |  48 +++--
 .../tests/package/test_mender/post-build.sh   |  30 +++
 .../rootfs-overlay/etc/mender/artifact_info   |   1 -
 .../rootfs-overlay/etc/mender/mender.conf     |  11 +
 20 files changed, 532 insertions(+), 263 deletions(-)
 create mode 100644 package/mender/0001-rootfs-image-shellcheck-fixups.patch
 delete mode 100644 package/mender/S42mender
 delete mode 100644 package/mender/artifact_info
 delete mode 100644 package/mender/device_type
 create mode 100644 package/mender/mender-authd.service
 delete mode 100644 package/mender/mender-client.service
 create mode 100644 package/mender/mender-updated.service
 create mode 100755 support/testing/tests/package/test_mender/post-build.sh
 delete mode 100644 support/testing/tests/package/test_mender/rootfs-overlay/etc/mender/artifact_info
 create mode 100644 support/testing/tests/package/test_mender/rootfs-overlay/etc/mender/mender.conf

-- 
2.46.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
