Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B5F0C433FE
	for <buildroot@archiver.kernel.org>; Tue, 22 Nov 2022 06:43:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E66D680DCD;
	Tue, 22 Nov 2022 06:43:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E66D680DCD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fSHbew3r4zKB; Tue, 22 Nov 2022 06:43:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3410080C7B;
	Tue, 22 Nov 2022 06:43:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3410080C7B
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CBB611BF333
 for <buildroot@lists.busybox.net>; Tue, 22 Nov 2022 06:43:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A61AE80C9C
 for <buildroot@lists.busybox.net>; Tue, 22 Nov 2022 06:43:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A61AE80C9C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1Ab7Fh3LlidM for <buildroot@lists.busybox.net>;
 Tue, 22 Nov 2022 06:43:41 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6678D80C46
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6678D80C46
 for <buildroot@busybox.net>; Tue, 22 Nov 2022 06:43:41 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id l14so4332376wrw.13
 for <buildroot@busybox.net>; Mon, 21 Nov 2022 22:43:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pN6VkqjnaaMTaRUNV1GYLSz45eBw158LVZVq3mZuFrg=;
 b=hhSMZ/25DuDsyvb1mQSWjepSZbOCeaacawrY1n/a8qIZZo+N0qZqEyUgmw6mbOOYeq
 +n9qdMzIJe6k8g2W+Iau61Q43k15yzQLE2wNM7o7p6lERm5hiilj+pYD1r2uuhtrJK62
 xSxJQrzfbHQ95xkrWNwJC4BknvZH5zD7zuK0nyp+z4N48sMGhG5t1SbdHytu/zM9Uj+N
 FDoV1ViNNjynSw8jtoPwjZ38UGcOnYPEWv38HUNSobyC/6Wg2xrBurtNAGSBhj4no1a5
 vmunvXtSZNAx2WjuEwQpjjcOc75QA4+AfEn7x4NgPWTQGArUv80FsLYDxROkOp7xcJpZ
 rIdQ==
X-Gm-Message-State: ANoB5pmnkwq5GB/ZJnCcux9nj1vSG3zXp758dOY0AzhBv1Fl1FRk+E73
 2NxStMGNR6lyzbSfw4ELszNZpfxuFt8=
X-Google-Smtp-Source: AA0mqf6Pe1/9t8Z/PcE+hMXBS9lVHfDgLjhsHN33lFw8hACgmNqg9kWKcWJacq0HU5RQ4JdemaaL8Q==
X-Received: by 2002:a5d:6746:0:b0:22e:39c9:a4a6 with SMTP id
 l6-20020a5d6746000000b0022e39c9a4a6mr13456084wrw.170.1669099419584; 
 Mon, 21 Nov 2022 22:43:39 -0800 (PST)
Received: from vm-22.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id
 p6-20020a5d48c6000000b00241a8a5bc11sm12833981wrs.80.2022.11.21.22.43.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Nov 2022 22:43:39 -0800 (PST)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Tue, 22 Nov 2022 07:43:22 +0100
Message-Id: <20221122064325.30941-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=pN6VkqjnaaMTaRUNV1GYLSz45eBw158LVZVq3mZuFrg=;
 b=g+66NX2wb7ZRr03ZirD4eIeazD39T9NMjTr3Ohp8t2az1+ujf6fb1QZoztw5sEzjiC
 IhHYrjK4teo7UrRMO7FmpnQlIZFDPbFF+wpOHr+baFojnh2SlIfmbkRegl9vS2ZhJ2N7
 016RCtr+aAr4kkKBTdPJNCEz1+migY4uZJNx+z6rvC/rJ0BuAzUsFNfOEKSFiNIoTmJe
 AK8x1PRPlFtyLbDFWi67M+oA9Hf42j2BNMME0+s0IlDWTm5SX54x95i04eJ0ArwLfb6N
 ZJMqi1EJ5lvgDwtsQGxqfGU2Fd/nBDaFtxKYcGP3ayP+7HH1+eS+4Z7vGDfuMVsrU1Q2
 ghPQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=g+66NX2w
Subject: [Buildroot] [PATCH v2 0/3] LS1028ARDB improvements
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The package qoriq-cadence-dp-firmware is dedicated to the NXP LS1028 SoC.
It was introduced since BR 2022.02 from a Changming Huang's serie (5 versions between 2019-Nov and 2020-Feb).
This serie tried to introduce the board NXP LS1028ARDB with a partition boot.vfat containing
the kernel image, the dtb and the cadence DP firmware.

The board NXP LS1028ARDB was introduced on 2022-Aug from my own serie.
This serie uses a single rootfs partition and a extlinux.conf file.
The patch concerning the cadence DP firmware has been set aside at this time (between v3 and v4).

Now, this current serie finalizes the support of the board NXP LS1028ARDB,
especially the point concerning the cadence DP firmware.

Francois Perrad (3):
  package/qoriq-cadence-dp-firmware: add install in target
  configs/ls1028ardb: add video with Cadence DP firmware
  board/freescale/ls1028ardb: more documentation

 board/freescale/ls1028ardb/readme.txt         | 27 +++++++++++++++++++
 .../boot/extlinux/extlinux.conf               |  2 +-
 configs/ls1028ardb_defconfig                  |  3 +++
 .../qoriq-cadence-dp-firmware.mk              |  6 +++++
 4 files changed, 37 insertions(+), 1 deletion(-)

-- 
2.37.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
