Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0FECC41535
	for <buildroot@archiver.kernel.org>; Tue, 19 Dec 2023 12:15:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7E06443571;
	Tue, 19 Dec 2023 12:15:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7E06443571
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8krkjQ2fTbfm; Tue, 19 Dec 2023 12:15:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 79C0A43579;
	Tue, 19 Dec 2023 12:15:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 79C0A43579
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DB9F11BF360
 for <buildroot@lists.busybox.net>; Tue, 19 Dec 2023 12:15:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C206760BAB
 for <buildroot@lists.busybox.net>; Tue, 19 Dec 2023 12:15:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C206760BAB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bWaOE57Icscb for <buildroot@lists.busybox.net>;
 Tue, 19 Dec 2023 12:15:16 +0000 (UTC)
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 70BE3605EA
 for <buildroot@buildroot.org>; Tue, 19 Dec 2023 12:15:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 70BE3605EA
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-54c5d041c23so5349804a12.2
 for <buildroot@buildroot.org>; Tue, 19 Dec 2023 04:15:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702988114; x=1703592914;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kDioIYtuanLpbJGhSAF7JGx9iqmjQ71MTrlBtEddpPU=;
 b=Gxr8SOHFBWMHw4TSIpe1bGsbi7lOQyZxmLbbNgHJLiFNgUOp8F4UzfVW+x5ErD5wqD
 FAmdxQK6/YgyddHuqsMxZ/BMY+FzIBNYYQC/X8lf60tSyVXKRkY9ZBOF83/isNrRQlH+
 mXBVqnjyShyVeWWLMCtUvif2Dyjw04PM3yFYHClf6TKyPfhNy8Kkmsy1OS94wUVp7mpX
 gexZTelIYC1bLhr27cjllSvIiKRL5UsGlcDpwBJE4k7Hs7kjTi3pTqTxvvpzOPSElLBQ
 q4jIOR2t1T3xRG/4F1bPYej7gsAvT8rTK3qdlArj+6cQCx9Z3CmcMOU9vXQ+dJiqIwqc
 cDFw==
X-Gm-Message-State: AOJu0Yzz7q40sUvs8t5C+8sPBYvsuiVyYaaFIZ5jcwlgqJLbSCo6z32t
 eo+tF8CMmhAfL0ykAfrESZsQEyozKlcpm6wU9mE=
X-Google-Smtp-Source: AGHT+IHiukSZ9FpdEaRvz7zpZYjuh+ABo/ZIHE3u7MrinrhIY4hZ7GoH8xEw6/Vhe7PHxlAhQw+p+w==
X-Received: by 2002:a50:ccda:0:b0:553:1c7f:e250 with SMTP id
 b26-20020a50ccda000000b005531c7fe250mr1806529edj.145.1702988114437; 
 Tue, 19 Dec 2023 04:15:14 -0800 (PST)
Received: from marleenlaptop.. (ip-188-118-3-185.reverse.destiny.be.
 [188.118.3.185]) by smtp.gmail.com with ESMTPSA id
 bq18-20020a056402215200b0054db440489fsm11371363edb.60.2023.12.19.04.15.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Dec 2023 04:15:13 -0800 (PST)
X-Google-Original-From: marleen.vos@mind.be
To: buildroot@buildroot.org
Date: Tue, 19 Dec 2023 13:15:01 +0100
Message-Id: <20231219121508.1695768-1-marleen.vos@mind.be>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=essensium.com; s=google; t=1702988114; x=1703592914; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=kDioIYtuanLpbJGhSAF7JGx9iqmjQ71MTrlBtEddpPU=;
 b=P3f7N0MsQAj3N2fbQBtUdhzPchaXEvkVoqYUs4g26ox0Ps7Kx1mr3Hhtqxju1KK3DV
 UvYoCdRFPIDCsdVh+GaNV07OclL34MQ+1aKrewQPU0VFy+vjNNY5JP51IKZYk2wURDjs
 TKTZYnU9upTefQRaWYL5haRxLtGyISwnj6Pu50q72nx8hN6HmM6YAEF3z0ocp3NdzIKE
 8YAlFy401v5XRjt8dJ/hQetvcqwNigzdHOwjGezoluLVy35Z1YqQ+uFZ6GKikU4YMZLE
 Odvtwy2cigLt62ZdbvIXRLcru3+MR+Q2xdJVadxRbsEVcEL/aX2JAseQgR5bY6frVlbt
 wAAA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=essensium.com header.i=@essensium.com
 header.a=rsa-sha256 header.s=google header.b=P3f7N0Ms
Subject: [Buildroot] [PATCH 0/7] Updates for boards based on stm32mp157,
 related to arm-trusted-firmware
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
From: Marleen Vos via buildroot <buildroot@buildroot.org>
Reply-To: marleen.vos@essensium.com
Cc: Marleen Vos <marleen.vos@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Marleen Vos <marleen.vos@mind.be>

This series of patches is intended to update the boards based on
stm32mp157, in order to use FIP instead of stm32 to boot. This allows
more recent versions of arm-trusted-firmware to be used instead of being
stuck on v2.5

Notes:
1) When testing arm-trusted-firmware lts-2.8.13 on avenger96, the boot
   is halted with a panic:

		NOTICE:  CPU: STM32MP157AAC Rev.B
		NOTICE:  Model: Arrow Electronics STM32MP157A Avenger96 board
		ERROR:   nvmem node board_id not found
		ERROR:   Product_below_2v5=1:
		ERROR:          HSLVEN update is destructive,
		ERROR:          no update as VDD > 2.7V
		PANIC at PC : 0x2ffee76b

   Therefor, the avenger96 board has only been updated to
   arm-trusted-firmware v2.6

2) Testing arm-trusted-firmware v2.10 on stm32mp157a-dk1 results in a
   boot that hangs as follows:

		NOTICE:  CPU: STM32MP157DAC Rev.Z                                                                           
		NOTICE:  Model: STMicroelectronics STM32MP157A-DK1 Discovery Board                                          
		NOTICE:  Board: MB1272 Var3.0 Rev.C-03                                                                      
		NOTICE:  BL2: v2.10.0   (release):v2.10
		NOTICE:  BL2: Built : 14:24:58, Dec 18 2023
		NOTICE:  BL2: Booting BL32
		NOTICE:  SP_MIN: v2.10.0        (release):v2.10
		NOTICE:  SP_MIN: Built : 14:24:58, Dec 18 2023

   For stm32mp157c-dk2, a similar hang:

		NOTICE:  CPU: STM32MP157FAC Rev.Z                                                                           
		NOTICE:  Model: STMicroelectronics STM32MP157C-DK2 Discovery Board                                          
		NOTICE:  Board: MB1272 Var4.0 Rev.C-02                                                                      
		NOTICE:  BL2: v2.10.0   (release):v2.10
		NOTICE:  BL2: Built : 15:02:33, Dec 18 2023
		NOTICE:  BL2: Booting BL32
		NOTICE:  SP_MIN: v2.10.0        (release):v2.10
		NOTICE:  SP_MIN: Built : 15:02:33, Dec 18 2023

   No boards currently use the 'latest' version of arm-trusted-firmware,
   so it has no impact to bump the latest version from v2.7 to v2.10

Marleen Vos (7):
  DEVELOPERS: added marleen.vos@mind.be for boards/configs based on
    stm32mp15
  board/stmicroelectronics: generalise
    BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES regex
  configs/stm32mp157*: bump ATF to v2.6
  boot/arm-trusted-firmware: add config option to use latest lts-v2.8.13
  configs/stm32mp157a_dk1_defconfig: update arm-trusted-firmware to
    lts-v2.8.13
  configs/stm32mp157c_dk2_defconfig: update arm-trusted-firmware to
    lts-v2.8.13
  boot/arm-trusted-firmware: bump latest version to v2.10

 DEVELOPERS                                    |  6 ++
 .../common/stm32mp157/genimage.cfg.template   |  4 +-
 .../common/stm32mp157/post-image.sh           |  2 +-
 boot/arm-trusted-firmware/Config.in           | 10 ++-
 .../arm-trusted-firmware.hash                 |  3 +-
 ...1-build-tools-avoid-unnecessary-link.patch | 77 +++++++++++++++++++
 configs/avenger96_defconfig                   | 28 +++++--
 configs/stm32mp157a_dk1_defconfig             | 15 ++--
 configs/stm32mp157c_dk2_defconfig             | 15 ++--
 9 files changed, 139 insertions(+), 21 deletions(-)
 create mode 100644 boot/arm-trusted-firmware/lts-v2.8.13/0001-build-tools-avoid-unnecessary-link.patch

-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
