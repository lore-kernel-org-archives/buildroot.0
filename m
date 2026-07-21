Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5B48C4451C
	for <buildroot@archiver.kernel.org>; Tue, 21 Jul 2026 18:43:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6D97980EDF;
	Tue, 21 Jul 2026 18:43:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 41feT78SitoO; Tue, 21 Jul 2026 18:43:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 45B0B80E7F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784659385;
	bh=wu3k5w4/Q9mIAaVaZaJhnEr+SEvUd+eW6ayd8aFR3HE=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ahI6M1gG6kjsOYy+l0Wl6FTp48uMKZPMNKPscZv94Z4oid3bz3tvQzST8bXmKuK/T
	 5CNgBNDulIKa2XdQwjvMaFP02oK+WoJjm0CT9XHxiGeA7B0rakI5ce/9E/eob8Eg+k
	 EB6l/jFk9PdvSdczcV2TJc5e9CUiqjZZ6V455Dad2h0NtdQ1BWI7EqpH5QmUw56RD4
	 S8q/MRJlMyJu0d0dfDWnTczCLtWyuJnUTsbBwac5knWaMdMCpF5sOaugVmebiXpNu8
	 XQG8Euo6aCyKG2c+KoGPEjH2aFzzcmJnIdDSElszxRU673NsDxxsXtD7KkEAZdeJCW
	 K48dtJwQs27ng==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 45B0B80E7F;
	Tue, 21 Jul 2026 18:43:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id C70FD109C
 for <buildroot@buildroot.org>; Tue, 21 Jul 2026 18:43:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B8F416061C
 for <buildroot@buildroot.org>; Tue, 21 Jul 2026 18:43:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7cQjggosQT7a for <buildroot@buildroot.org>;
 Tue, 21 Jul 2026 18:43:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org AF14B605DC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AF14B605DC
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AF14B605DC
 for <buildroot@buildroot.org>; Tue, 21 Jul 2026 18:43:02 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-493b966dd74so51119815e9.3
 for <buildroot@buildroot.org>; Tue, 21 Jul 2026 11:43:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784659380; x=1785264180;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=fxsq4RhK6aZ6SxkPZMuKd+q+lpQD6jXAsXzymjQMLs0=;
 b=iCAixCU4NyNtYS+BPJGScYiGl5XDUWBGQp8qslrjpPKXc+rvGbIxsNeCxyLTNLQ0Sx
 xC/xPkm8TqrdJjqcG27qOMkyyHFVSMOgJlouNfO8OxJAE2zpbwpUUneUUidLEdc44TiL
 nYHqLPjWRns29tPE/eC6zBdBlxBXoqFH+Rmgsm8iC9KcfXc4U30y9B9lCJJswCLhc2M0
 tIOBqopx1nw6OGYz3jt3XYFMGcQQ963HK9V9MyxOcdDInwK80XFIjpOeuNTaTjYYv3je
 2RBrEnBaiqH+IoZVjVZrFw5QRAxOBGPHsd6qKf6cKR65qvw68AVJXWtv19TLR0pcPmMw
 6Vgw==
X-Gm-Message-State: AOJu0YxmwZvX2TYSwDO0Wl4Ljp/YeT8KMX9bLCHiU/QhOInZuMy8x5uu
 h9J4sw5OfxtMCs50jdlCe+cE8hXuUIvJCuzOt9+Tm1wQCx89FXzkZbqHPJWe3yVJdlNp6wP5yrd
 hVnzp
X-Gm-Gg: AfdE7cnoCbQad/0e7MNLXybr3pIr3iXp6Qtt7/S+r4CdbwPIQpA3hVjNa3Igo0a05Bn
 Apx4JXjF07z7fdvG7eeJMjIsh77XZzediIKrGRAM5EEplmoZPDh0xRFStSThBKBlLTp116QjUCs
 b3K/n1+rLY0jG+szzWXSC3YUdVHTUfUjDkmRa93ydaqt+MN/rd0DBGWCP6AFh3RSpTW0+rwxQ3i
 NcEAyns7JItZNdoDr+qndu0LvvXp2K/toWGk5Dh/13pKbQwepWIpumJJaRCud9QrQMxhQpKyNS7
 CvFW92OOKE2WIqJ5L76e7RjgNkWdV+2zOpEFAUCUgDiT3KW/jOLmEBlxeZ6YVcl2DLMXOhotw7E
 Gc5eEiJpvVFbww1t4KtvIoHkANDrZ/NjKWV4McmHv1aZhI5ocaEL55+1RsgL5KLGf4CExIcroCC
 p+QwfwReUsmFEg0Wv78sGBddpLUjwRdwzSTO3foZHEnrWb7hvwadrgA1a8WMD08GQ5GxV22MRvB
 CyCBDYBpDdbvpXduBQ3AjQxIBYnGxFrZLEsSprHoheFJCWt0q26gkRBdhA9MH0IhZhDAFnpy3Ts
X-Received: by 2002:a05:600c:1389:b0:495:5dcc:52ae with SMTP id
 5b1f17b1804b1-4955dcc5372mr114666905e9.3.1784659380543; 
 Tue, 21 Jul 2026 11:43:00 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.amarulasolutions.com
 (host-79-17-119-233.retail.telecomitalia.it. [79.17.119.233])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4956b030a64sm226505e9.3.2026.07.21.11.42.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jul 2026 11:42:55 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Christophe Priouzeau <christophe.priouzeau@foss.st.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com
Date: Tue, 21 Jul 2026 20:42:43 +0200
Message-ID: <20260721184249.1579381-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1784659380; x=1785264180;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=fxsq4RhK6aZ6SxkPZMuKd+q+lpQD6jXAsXzymjQMLs0=;
 b=HlNDihLaAJxNb8Fz5P340VS//I3/QqaTgl/ONzMghcnxH8rGZG99CF7nf2PhmArySI
 +70DVoQKDcGs5mmB/eXNZ3Al0vGM0Glqn3Ps2ylrqcSGWSUeevdzwQjGo07myRxf0gFh
 2mVtwORL5dupPZLeSnQEFvZcQRVV7qadInDX4=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=HlNDihLa
Subject: [Buildroot] [PATCH 0/6] configs/stm32f4xx,
 stm32f769: fix uClibc boot failure and bump Linux/U-Boot
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

While updating Linux and U-Boot to their latest versions for the
STM32F429, STM32F469 and STM32F769 boards following the U-Boot
2026.07 release, I noticed that the current versions of these boards
fail to boot due to a regression introduced by the uClibc 1.0.58
bump (c7fef3704c70, "package/uclibc: bump to 1.0.58").

The first three patches fix this by switching to MALLOC_SIMPLE via a
uClibc config fragment. The remaining patches bump Linux and, where
applicable, U-Boot to their latest versions.

All boards have been build- and boot-tested.

Dario Binacchi (6):
  configs/stm32f429_disco_xip: fix boot failure after uClibc bump
  configs/stm32f469_disco_{sd,xip}: fix boot failure after uClibc bump
  configs/stm32f769_disco_sd: fix boot failure after uClibc bump
  configs/stm32f429_disco_xip: bump Linux to 6.1.177
  configs/stm32f469_disco_{sd,xip}: bump Linux to 5.15.211
  configs/stm32f769_disco_sd: bump Linux to 5.15.211 and U-Boot to
    2026.07

 .../common/stm32f4xx/uclibc-fragment.config                  | 2 ++
 .../stm32f429-disco/patches/linux/linux.hash                 | 2 +-
 .../stm32f469-disco/patches/linux/linux.hash                 | 2 +-
 .../stm32f469-disco/patches/uboot/uboot.hash                 | 2 +-
 .../stm32f769-disco/patches/linux/linux.hash                 | 2 +-
 .../stm32f769-disco/patches/uboot/uboot.hash                 | 2 +-
 .../stm32f769-disco/uclibc-fragment.config                   | 2 ++
 configs/stm32f429_disco_xip_defconfig                        | 3 ++-
 configs/stm32f469_disco_sd_defconfig                         | 5 +++--
 configs/stm32f469_disco_xip_defconfig                        | 3 ++-
 configs/stm32f769_disco_sd_defconfig                         | 5 +++--
 11 files changed, 19 insertions(+), 11 deletions(-)
 create mode 100644 board/stmicroelectronics/common/stm32f4xx/uclibc-fragment.config
 create mode 100644 board/stmicroelectronics/stm32f769-disco/uclibc-fragment.config

-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
