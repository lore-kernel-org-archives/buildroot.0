Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76CD1E7315B
	for <buildroot@archiver.kernel.org>; Mon,  2 Feb 2026 11:43:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3253E83103;
	Mon,  2 Feb 2026 11:43:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OjP03dNZh83o; Mon,  2 Feb 2026 11:43:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3E2D78375B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770032585;
	bh=zqDgPhCbl2mTA8VoWK7gTTUpNUvtkNEpdGIbI+/OKn8=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sgqHc1qkYdfNXb0zuKl5/weq/EEg+3CCpiqq3cJRINpezKFq/0+yT3w8VA/NbBsj2
	 E/6jET+iNH89BRjC7oec+6aVc0jyP9XnhtIRIgHowlFHgtAEOinNDYd9jH/r0cAy36
	 lyISfGRZapTvfnm82xCafSETSaYEl1U9higppUoi/sSIANXDHC4fxkxHfZzKYXetmt
	 LTcLRSqdjztC+dckdPTTNdiuTGI1QNVUVK/SCUVl3AyXNL3SRM2VLxEFQaWJW5mchx
	 56Kue98vBkqqcyo7olxuPmpAAxG3NWuTWvU3wTQcw4CsbwZc6j21/Y4J63DjwMEv7B
	 AEwmSJWXOX21A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3E2D78375B;
	Mon,  2 Feb 2026 11:43:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0BE0F23E
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 11:43:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 067C160BD2
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 11:43:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7SWZrU3aDD7H for <buildroot@buildroot.org>;
 Mon,  2 Feb 2026 11:43:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42b; helo=mail-wr1-x42b.google.com;
 envelope-from=maxime.leroys@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B46D460BBD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B46D460BBD
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B46D460BBD
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 11:43:01 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-42fbc544b09so4045761f8f.1
 for <buildroot@buildroot.org>; Mon, 02 Feb 2026 03:43:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770032579; x=1770637379;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=domsN9+YG7Xiv4R3Sk6tXQZT/vIumezrPmSXx6OEuK4=;
 b=OtwdPVjcCEfTtX8tR3VnySyRG1Lggv8dhdHoReQAqgKmnzkXpNaAiNAdmF3B6cwF0U
 M9Pq84L1J7GnPaLdUz20k5BXKBotSdPFE784zTr5UZIOyQzEVwiUD7wCa3/5fT4f1Sgl
 iXf8keRc9IJ2wtu+DURqIEHSuKmmtVi3fu14XRbWgDxU4A6z8vwnMGRvgnvw/OEa15oM
 ySSArZVzQmGRINQxilAq7ivNHEEcPgTMGkp42JFCXEvCGEb2Wq+C7kpmjBb+7FvD/tnq
 mWPPFKLzAKbb9D56EXBX/XuPq0jQKiLtwI+pxut+z7C6UDCVfBh2hf03yfdHnQS114iA
 tOmw==
X-Gm-Message-State: AOJu0Yxke0BTG3je1orh6kD1e6EOazDvJ30fq/TYCOIvR5s9VSLY7Tww
 ZWevPPHpKUyALexDv4Dtu15az6JXWXzfGx71SIb8ADFZ/TsV+sNHwQ53BI9HJQ==
X-Gm-Gg: AZuq6aIKbglx64M3gNVWkRB0V0gRWrDCYyd8UjQzCxdvLNM8KzNdzD/snUqnRgeru8b
 Wo79FzuhuNJYrYJfb3LvNGxHUlGNvgUJHbZ6jHNlmnSs11CH7kgmliTbwSYhZQE8O2kptgv3HmX
 TTVjJQkDa8AC7FkXqXUI1a2/m71DgLz7T8Vht3o+DiEAr3edJxs42/lZb4u3k/GGlNDrjcl0VyK
 VP64pzSazKiFGsAVhAvAiMoJPnC4zO40TLXnx7Pas5RxjH+wE+Kp7pFBTBUy/lbVQwW99XcgVHd
 qm8T30jHqpqdZDehu07kq6WALnuvpq6H94sEhTpe/e++4TI3ioAfynTvqz+yi3sVf4/WJb4NbZx
 3hwyHFThcmfJbcZ0UAvDlNMDu3/9Ec3/w7Z/ynYJcICWnlkWSsphXFlANOx7wZn3nBlQv0axaHv
 wYwNVMlG50YMQ/hw==
X-Received: by 2002:a05:6000:240c:b0:42f:b707:56dd with SMTP id
 ffacd0b85a97d-435f3aa79d9mr16000415f8f.33.1770032579374; 
 Mon, 02 Feb 2026 03:42:59 -0800 (PST)
Received: from freepad.iliad.local ([213.36.9.124])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-435e131cf4asm44246777f8f.28.2026.02.02.03.42.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Feb 2026 03:42:58 -0800 (PST)
From: Maxime Leroy <maxime@leroys.fr>
To: buildroot@buildroot.org
Cc: olteanv@gmail.com, thomas.petazzoni@bootlin.com,
 Maxime Leroy <maxime@leroys.fr>
Date: Mon,  2 Feb 2026 12:42:50 +0100
Message-ID: <20260202114253.283868-1-maxime@leroys.fr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250830173313.164981-1-olteanv@gmail.com>
References: <20250830173313.164981-1-olteanv@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770032579; x=1770637379; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=domsN9+YG7Xiv4R3Sk6tXQZT/vIumezrPmSXx6OEuK4=;
 b=lGKn3rxZA+GaKlD3v8Is547pdB/Yu9BcdUrAdeQYpJJI07t2KpRDH5t10IehO+6AAz
 Ofx2LiQsoHr2TAOh2kKhdvuITlE2Smr0b+KPI2MN/lE/0kc+mZOh186echwqtn+CsdtP
 7A/UqmknJO09em7U/AevYF2eYAtqVCZwAYPyqcqJqYmH3bHaAyMVBubHznQ8m1Ns0zit
 P2HufQCM1scLXeUn4z5/GJL6Zf5qLbYhnwxQxvG87RdX6DVRJ/oUKJKLVvZPCI05XL3M
 ysC81+gz25ZoEPTR7QYOM2HEKBrb5m5t6xKffhnBlDZV2F/Ak7sfOBxPvFhUYxJ2P8Iy
 DokQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=leroys.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=lGKn3rxZ
Subject: [Buildroot] [PATCH v5 0/3] Initial LX2160A-RDB support
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

This patch series adds Buildroot support for the NXP LX2160A-RDB, a
16-core ARM Cortex-A72 platform with DPAA2 networking capabilities.

This is a continuation of Vladimir Oltean's v4 series:
https://lore.kernel.org/buildroot/20250830173313.164981-1-olteanv@gmail.com/  

Uses NXP Linux Factory lf-6.12.34-2.1.0 components. Boots from SD card.

Tested on LX2160A-RDB rev2 hardware.

v4->v5:
- Address Thomas Petazzoni's feedback about the large U-Boot environment
 https://lore.kernel.org/buildroot/20260102233308.49adad9a@windsurf/
- Switch from distro boot scripts to U-Boot's bootstd framework
- Shrink U-Boot environment from ~75 lines to ~18 lines
- Disable EFI boot support via uboot.config since we use extlinux
v3->v4:
- add BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
v2->v3:
- split U-Boot environment into 3 files
- integrate lf-6.12.20-2.0.0 NXP BSP tag
- fix the NXP component list in the README
- move the DPAA2 udev rules from board/freescale/lx2160ardb/rootfs_overlay
  to board/freescale/common/rootfs_overlay, on the premise that they do
  no harm and are not board-specific.
v1->v2: patch is new

Maxime Leroy (2):
  package/qoriq-restool: add runtime dependencies
  package/qoriq-restool: bump to lf-6.12.34-2.1.0

Vladimir Oltean (1):
  board/lx2160ardb: new platform

 board/freescale/common/env-dpaa2.txt          |   7 +
 .../udev/rules.d/74-dpaa2-networking.rules    |  29 ++++
 board/freescale/lx2160ardb/extlinux.conf      |   4 +
 board/freescale/lx2160ardb/genimage.cfg       |  47 +++++++
 .../arm-trusted-firmware.hash                 |   2 +
 .../patches/linux-headers/linux-headers.hash  |   1 +
 .../lx2160ardb/patches/linux/linux.hash       |   2 +
 .../lx2160ardb/patches/uboot/uboot.hash       |   2 +
 board/freescale/lx2160ardb/post-build.sh      |  11 ++
 .../rcw_2200_750_3200_19_5_2_sd.rcw           |  67 +++++++++
 board/freescale/lx2160ardb/readme.txt         | 129 ++++++++++++++++++
 board/freescale/lx2160ardb/uboot-env.txt      |  11 ++
 board/freescale/lx2160ardb/uboot.config       |   2 +
 configs/lx2160ardb_defconfig                  |  59 ++++++++
 package/qoriq-restool/Config.in               |   9 ++
 package/qoriq-restool/qoriq-restool.hash      |   2 +-
 package/qoriq-restool/qoriq-restool.mk        |   2 +-
 17 files changed, 384 insertions(+), 2 deletions(-)
 create mode 100644 board/freescale/common/env-dpaa2.txt
 create mode 100644 board/freescale/common/rootfs_overlay/etc/udev/rules.d/74-dpaa2-networking.rules
 create mode 100644 board/freescale/lx2160ardb/extlinux.conf
 create mode 100644 board/freescale/lx2160ardb/genimage.cfg
 create mode 100644 board/freescale/lx2160ardb/patches/arm-trusted-firmware/arm-trusted-firmware.hash
 create mode 120000 board/freescale/lx2160ardb/patches/linux-headers/linux-headers.hash
 create mode 100644 board/freescale/lx2160ardb/patches/linux/linux.hash
 create mode 100644 board/freescale/lx2160ardb/patches/uboot/uboot.hash
 create mode 100755 board/freescale/lx2160ardb/post-build.sh
 create mode 100644 board/freescale/lx2160ardb/rcw_2200_750_3200_19_5_2_sd.rcw
 create mode 100644 board/freescale/lx2160ardb/readme.txt
 create mode 100644 board/freescale/lx2160ardb/uboot-env.txt
 create mode 100644 board/freescale/lx2160ardb/uboot.config
 create mode 100644 configs/lx2160ardb_defconfig

-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
