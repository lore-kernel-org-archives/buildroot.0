Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6142DC3DA7E
	for <buildroot@archiver.kernel.org>; Tue, 30 Jul 2024 13:10:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 142A880E28;
	Tue, 30 Jul 2024 13:10:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i0siQ38pHv1H; Tue, 30 Jul 2024 13:10:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1459080CCE
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1459080CCE;
	Tue, 30 Jul 2024 13:10:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 71C6A1BF404
 for <buildroot@lists.busybox.net>; Tue, 30 Jul 2024 13:10:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5F23640640
 for <buildroot@lists.busybox.net>; Tue, 30 Jul 2024 13:10:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HwZ8YwmpK7D4 for <buildroot@lists.busybox.net>;
 Tue, 30 Jul 2024 13:10:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::630; helo=mail-ej1-x630.google.com;
 envelope-from=rgallaispou@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C3A5D40363
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C3A5D40363
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C3A5D40363
 for <buildroot@buildroot.org>; Tue, 30 Jul 2024 13:10:15 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-a7aa4bf4d1eso616248966b.0
 for <buildroot@buildroot.org>; Tue, 30 Jul 2024 06:10:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722345014; x=1722949814;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=huY29JvsE7qwrq9yIOBD8EKdlSUaCVhb6vdHfoHY+BQ=;
 b=vQkiVjnXgXNsHgY4csgkJRPS63h2FJ5eehkSIE0PX6emzzXTxhN3obY8wFk2JwhdRk
 cy7EWEVN6SAjV9cfvkGJeCowVr4Bc8k1/rGQFrSsiHZCS5LIo5Mw9aAHkds7Dv6ebtcC
 g8SlK2tKVQeJgqXLoCcQalZbHUc4hrDofE5CDzPQJVSxvp4BnCMb6vekhbZk4gwXOhKz
 9uvWMC7Kj0IoNgQ0iXy2RU6cKYiv7kJWgltPDgy1ImlAatxAV+El6QxQ87YefArayGGy
 KzD7rHdXRZKrNBruwwPD+BrYSNsAp73PH9ZH78FTyC8UI/eFC+CKup6bG5HdqD+OjjHj
 fl3g==
X-Gm-Message-State: AOJu0Yw4HjE5Le2Dl8dvSoc9vTAAQTCpvu9ehpaPQFAcvodw6FbZIvMR
 fZq7I3XtP8Ht4J+POOCIXlPKFx7FLc3P4BgZsxAFJMbso4a1fESh
X-Google-Smtp-Source: AGHT+IEmw1E3+Pz2XXxdPzZXlhpnOMdD2A19puMFJ4KAxZVieiLgbNOJ2l4Up2glk6PwfIlkC/yFVQ==
X-Received: by 2002:a17:907:3da5:b0:a7a:c197:8701 with SMTP id
 a640c23a62f3a-a7d3ff9d880mr978243966b.31.1722345013275; 
 Tue, 30 Jul 2024 06:10:13 -0700 (PDT)
Received: from localhost ([2001:861:3385:e20:6384:4cf:52c5:3194])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7acab4de47sm642987566b.67.2024.07.30.06.10.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Jul 2024 06:10:12 -0700 (PDT)
From: Raphael Gallais-Pou <rgallaispou@gmail.com>
Date: Tue, 30 Jul 2024 15:08:43 +0200
Message-Id: <20240730-master-v1-0-3ca889c14ea4@gmail.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIANvlqGYC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDcyNL3dzE4pLUIl3jRPNky+Qky2RLsyQloOKCotS0zAqwQdGxtbUAjGB
 59FgAAAA=
To: buildroot@buildroot.org
X-Mailer: b4 0.14.1
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1722345014; x=1722949814; darn=buildroot.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=huY29JvsE7qwrq9yIOBD8EKdlSUaCVhb6vdHfoHY+BQ=;
 b=NGBxyr4umDXWY45nm1lqHZo9UZ5XKuD0hEFCVOQgZRgzGXk04yhsfR7N90d6QQWJld
 DVvM9HSmSjv2i4CjiJzlMgJa3sa4Ts6y4HlMrjib9pucXlR8EohUMhk1jI8oCcwIr0Xn
 SEQrK0MLBokddnGBYUPmYYEbv/CpIVAX5mjHdek6GZdhsUwjREBjpDbfbqzGUIiOjcIZ
 7yDr9DYiPjZ7kL26s5+NWqUh3uvhuhezgzYdwCFSpoeEbGBYUgggxUvXgJhkeyy3lkJZ
 Q6orlYzMy0ZX/SAw3G8M+ZSVF2Qe3Xm1zBy03PtrOgYbPvsDz8knfY5wJNwzT/8uL0dK
 U28w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=NGBxyr4u
Subject: [Buildroot] [RFC PATCH 0/2] Enhance ST common folder and add new
 defconfig
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
Cc: Bartosz Bilas <b.bilas@grinn-global.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Marleen Vos <marleen.vos@mind.be>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This commit series is a first attempt to improve the organization and
functionality of the STM32 platform in Buildroot. It comes with two
patches:

1. Reorder common ST folder:
   - Rename the common ST folder from stm32mp157 to stm32mp1xx.
   - Update references and paths in related configuration files.
   - Prepare to receive new stm32mp13 board.

2. Add new defconfig for STM32MP13:
   - Introduce a new defconfig file (stm32mp13_dk).
   - Boot following the TF-A/OP-TEE/U-Boot/Linux chain.
   - Include generic "multi_v7" defconfig for Linux configuration.

Since this is a RFC, please feel free to discuss how those changes can
be improved.

Signed-off-by: Raphael Gallais-Pou <rgallaispou@gmail.com>
---
Raphael Gallais-Pou (2):
      board/stmicroelectronics/common/stm32mp157: rename folder
      configs/stm32mp135f-dk: new defconfig

 .checkpackageignore                                |  2 +-
 DEVELOPERS                                         |  2 +-
 .../genimage.cfg.template                          |  0
 .../arm-trusted-firmware/arm-trusted-firmware.hash |  0
 .../patches/linux-headers/linux-headers.hash       |  0
 .../patches/linux/linux.hash                       |  0
 .../patches/uboot/uboot.hash                       |  0
 .../{stm32mp157 => stm32mp1xx}/post-image.sh       |  2 +-
 .../overlay/boot/extlinux/extlinux.conf            |  4 ++
 board/stmicroelectronics/stm32mp135f-dk/readme.txt | 38 ++++++++++++++
 configs/avenger96_defconfig                        |  2 +-
 configs/stm32mp135f_dk_defconfig                   | 59 ++++++++++++++++++++++
 configs/stm32mp157a_dk1_defconfig                  |  4 +-
 configs/stm32mp157c_dk2_defconfig                  |  4 +-
 14 files changed, 109 insertions(+), 8 deletions(-)
---
base-commit: 520ca083dfec4ad5ce7977bed478e2285ce93b07
change-id: 20240729-master-3a7c9cb9c96b

Best regards,
-- 
Raphael Gallais-Pou <rgallaispou@gmail.com>

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
