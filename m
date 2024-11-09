Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F00DD5E386
	for <buildroot@archiver.kernel.org>; Sat,  9 Nov 2024 22:16:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id ED07E605C8;
	Sat,  9 Nov 2024 22:16:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0VtieNkaCm0q; Sat,  9 Nov 2024 22:16:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E45EA605F5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E45EA605F5;
	Sat,  9 Nov 2024 22:16:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id B240EC2
 for <buildroot@buildroot.org>; Sat,  9 Nov 2024 22:16:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A09B8402B2
 for <buildroot@buildroot.org>; Sat,  9 Nov 2024 22:16:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NJ9ntG8BVyuE for <buildroot@buildroot.org>;
 Sat,  9 Nov 2024 22:16:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::133; helo=mail-il1-x133.google.com;
 envelope-from=brandon.maier@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 79B1F40551
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 79B1F40551
Received: from mail-il1-x133.google.com (mail-il1-x133.google.com
 [IPv6:2607:f8b0:4864:20::133])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 79B1F40551
 for <buildroot@buildroot.org>; Sat,  9 Nov 2024 22:16:23 +0000 (UTC)
Received: by mail-il1-x133.google.com with SMTP id
 e9e14a558f8ab-3a6bba54722so13437915ab.2
 for <buildroot@buildroot.org>; Sat, 09 Nov 2024 14:16:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731190582; x=1731795382;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qPZDnwzYd727gjZsOa+/G3O2ME8rS0WdBowpwGZ/kZ8=;
 b=nxyrsXT5hOuzlFXMDi4C6B3BqhEqCuY5mI6eKm7xiz+qnOnmLABF+xpDLsS7rDYsrv
 ospiccu8CugFCdFeL6nGsPtttHtbWNX3ycNR4dssHkWcR2ki8Rt4aKFK8EKFYA9eilQ+
 OaWDtFvpmIrObxJt3KVdQQrIhitZkp74ONoGwutBPgJO93PiLxckU9JJM/gQeUceFzpW
 yZWcKU45SObS1pUMXO8gHDxJzMhHHL1NG7jmxFP17xnLNoALtrhlettZzsELBiIW4NGU
 UPbbD8eyWUm8iuL+RbURLjyfgUr2ntPgW4HmNUduYAwgfdWL3bJW3gg+fQvRnAxyUdlh
 pjEQ==
X-Gm-Message-State: AOJu0Yxfgn5zgPPO43RF6428AEBSoE7gkKTvuGfYdkoNbTzzrpyuCPWh
 G+VTSg8Ppf2Te7uhfC5KZyQF4dT6/jGyoZT82mC0xDrvhQCHMM84b3LWxHW7c54=
X-Google-Smtp-Source: AGHT+IG2IIN0Z51KeILwcD19xDu+3IrBKbm0ya1l6kpgQvmIG8dUzBB7A6m/P/0dvdlW1+CGTgOsnQ==
X-Received: by 2002:a05:6e02:20ef:b0:3a6:c493:7395 with SMTP id
 e9e14a558f8ab-3a6f199ff2dmr94787025ab.5.1731190582222; 
 Sat, 09 Nov 2024 14:16:22 -0800 (PST)
Received: from localhost (207-191-210-45.dhcp.imoncommunications.net.
 [207.191.210.45]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4de78760ea2sm539247173.64.2024.11.09.14.16.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 Nov 2024 14:16:21 -0800 (PST)
From: Brandon Maier <brandon.maier@gmail.com>
Date: Sat, 09 Nov 2024 16:16:14 -0600
Message-Id: <20241109-genimage-partition-type-uuid-v1-0-9f23180c7195@gmail.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAC7fL2cC/x2MwQqDMBAFf0X23IUkBLH9FfEQ4lP30DQksVjEf
 +/icYZhTqoogkqv7qSCr1T5JAX76ChuIa1gmZXJGeetNU9ekeQd1OdQmjTNuf0yeN9l5gE+9g4
 w3i6ki1ywyHHvx+m6/iHVfdBuAAAA
X-Change-ID: 20241109-genimage-partition-type-uuid-8e4c62ee041f
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Niklas Cassel <cassel@kernel.org>, Brandon Maier <brandon.maier@gmail.com>
X-Mailer: b4 0.14.2
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1731190582; x=1731795382; darn=buildroot.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=qPZDnwzYd727gjZsOa+/G3O2ME8rS0WdBowpwGZ/kZ8=;
 b=cLraxpUFFeiANrjHpfLQ952tlQPe90Ib4mgfFTLuPmSl2vxNebKQmwWPGunNAmOkFt
 2lBlSJKC+ZERumqe6/vfWZZNJR+Dt28oEh16Lfxm3DZJhzfYmiI5Ohv99YQcALOid5WP
 nIQCPIaQiCeRshiHnT3yHj3IJncMSArL03mvPQkzsFnfOl3QJaBZoG67YEAWDp1g/IuH
 +mZqhdM4t6qg+xzNjhjxR/IO8a4hZ1d9FjUZP5rII5zoSXldlzkaDw2i6MtIjIGHzPY5
 vxW/L1wba6bBn4h7RCW+4y0knNM0oKLCbNyXtVPYok5O8l7IPqPBnP/+m38goNhpL6bx
 /MQg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=cLraxpUF
Subject: [Buildroot] [PATCH 00/17] board: cleanup genimage
 partition-type-uuid shortcuts
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

Buildroot boards using genimage's "partition-type-uuid" can use either a
full GUID or one of the shortcuts defined in genimage[1]. The Buildroot
manual recommends using the "L", "U", or "F" shortcuts over a full GUID;
but does not specify how any other GUID should be defined.

This series tries to bring consistency to partition-type-uuid by making
shortcuts the preferred method. First we update the Buildroot manual to
say shortcuts should be preferred when available. Then we update all
boards to use shortcuts.

This series is partially implementing Thomas suggestion to have
consistency when using "L" vs "root-${ARCH}" vs full GUIDs[2].

[1] https://github.com/pengutronix/genimage/blob/master/image-hd.c#L264
[2] https://lore.kernel.org/buildroot/20241022224945.4dc67b89@windsurf/

Signed-off-by: Brandon Maier <brandon.maier@gmail.com>
---
Brandon Maier (17):
      docs/manual/writing-rules: add shortcuts for genimage partition-type-uuid
      board/beagleboard: use partition-type-uuid "L"
      board/sifive: use partition-type-uuid "L"
      board/visionfive2: use partition-type-uuid "L"
      board/pc: use partition-type-uuid "root-x86"
      support/testing/tests/boot/test_grub: use partition-type-uuid "root-x86"
      board/mender: use partition-type-uuid "root-x86-64"
      board/radxa: use partition-type-uuid "root-arm"
      board/qemu/arm-ebbr: use partition-type-uuid "root-arm"
      board/qemu/riscv64-virt-efi: use partition-type-uuid "root-riscv64"
      board/aarch64-efi: use partition-type-uuid "root-arm64"
      board/arm: use partition-type-uuid "root-arm64"
      board/pine64: use partition-type-uuid "root-arm64"
      board/qemu/aarch64-ebbr: use partition-type-uuid "root-arm64"
      board/qemu/aarch64-sbsa: use partition-type-uuid "root-arm64"
      board/visionfive2: use partition-type-uuid "xbootldr"
      support/testing/tests/boot/test_grub: use partition-type-uuid "U"

 board/aarch64-efi/genimage-efi.cfg                 |  2 +-
 board/arm/fvp-ebbr/genimage.cfg                    |  2 +-
 board/beagleboard/beaglev_fire/genimage.cfg        |  2 +-
 board/mender/x86_64/genimage-efi.cfg               |  4 ++--
 board/pc/genimage-efi.cfg                          |  2 +-
 board/pine64/rockpro64/genimage.cfg                |  2 +-
 board/qemu/aarch64-ebbr/genimage.cfg               |  2 +-
 board/qemu/aarch64-sbsa/genimage.cfg               |  2 +-
 board/qemu/arm-ebbr/genimage.cfg                   |  2 +-
 board/qemu/riscv64-virt-efi/genimage.cfg           |  2 +-
 board/radxa/rockpi-n8/genimage.cfg                 |  2 +-
 board/sifive/hifive-unleashed/genimage_sdcard.cfg  |  2 +-
 board/visionfive2/genimage.cfg                     |  4 ++--
 docs/manual/writing-rules.adoc                     | 28 +++++++++++++---------
 .../tests/boot/test_grub/genimage-aarch64-efi.cfg  |  4 ++--
 15 files changed, 34 insertions(+), 28 deletions(-)
---
base-commit: 0df7dfb804457a62c7751eec6555ad75158e3e3d
change-id: 20241109-genimage-partition-type-uuid-8e4c62ee041f

Best regards,
-- 
Brandon Maier <brandon.maier@gmail.com>

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
