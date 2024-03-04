Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B91C4C5478C
	for <buildroot@archiver.kernel.org>; Mon,  4 Mar 2024 15:34:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6F3B3414A4;
	Mon,  4 Mar 2024 15:34:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gkgds1OtYjTI; Mon,  4 Mar 2024 15:34:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 86C0C414E0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 86C0C414E0;
	Mon,  4 Mar 2024 15:34:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BE8AF1BF94D
 for <buildroot@lists.busybox.net>; Mon,  4 Mar 2024 15:34:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B5B7F41499
 for <buildroot@lists.busybox.net>; Mon,  4 Mar 2024 15:34:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 14mgFSQbLN4a for <buildroot@lists.busybox.net>;
 Mon,  4 Mar 2024 15:34:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::632; helo=mail-ej1-x632.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B60D9414A4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B60D9414A4
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B60D9414A4
 for <buildroot@buildroot.org>; Mon,  4 Mar 2024 15:34:10 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-a4467d570cdso463560066b.3
 for <buildroot@buildroot.org>; Mon, 04 Mar 2024 07:34:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709566448; x=1710171248;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fanuiaShHmpNfEBOAuUM0iH+EUW77dl3EBxnTSWtkKE=;
 b=Wo/pvwb5pFaQ/3s9BdxTyKN48evhxXjVUnzg4GpTrKSrKxjhzCmHiPvrp8743pZBeV
 e/ryy16OACkZIZl612f0BvhEdKfN7pr4QqIvWmiw6rgNrHSO0CdUfb2a3oBXep4s3DGN
 e3t+jsn3B0ZTGUs9qtTSorQBG7cLcDzm5raWZ9u2QAYIeAE2gTFFnW05Dzo1xkNXuZgt
 Ftw7D+a+gy8zvkzMhz3fA4YYdc2L/yEZ2qZjYR523NK9iHce24PMBul+GoDmed20g7kL
 G6I9x+A7yBWRNdT4G+EcU74DAN6C/ZmiMTWpAD05iFeJmBP/eb/CiqE5qdA8T/F97Ghx
 /XNQ==
X-Gm-Message-State: AOJu0YwZJyKG13Auu8u1110NYcNP4soET18z3ec+jN25Asn0uFybalC8
 cvevXcakXLBc+/rJNcv8ivqxvsu6pmBrsAQkBJOxgkozL61FN7uFL6p8NnPRTy1UvZTIJIpd0Ps
 Guh4=
X-Google-Smtp-Source: AGHT+IEz9aVERD6je+weToQhTwfpS6qsiCqZ96GbfhZVK0ZqNaBQ2abfYCNGHZ7r2k0Mvvd/jYiIvQ==
X-Received: by 2002:a17:906:6455:b0:a45:7ce3:d239 with SMTP id
 l21-20020a170906645500b00a457ce3d239mr875262ejn.48.1709566448248; 
 Mon, 04 Mar 2024 07:34:08 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com
 ([2001:b07:6474:ebbf:72fe:558f:d55e:d423])
 by smtp.gmail.com with ESMTPSA id
 sa20-20020a1709076d1400b00a4432543b21sm4936082ejc.198.2024.03.04.07.34.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Mar 2024 07:34:07 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Mon,  4 Mar 2024 16:32:31 +0100
Message-ID: <20240304153253.732708-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1709566448; x=1710171248;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=fanuiaShHmpNfEBOAuUM0iH+EUW77dl3EBxnTSWtkKE=;
 b=k6LSw19KGbm/kbAIFBmwINx9ttU3eaW70TIgauRQ0nVVPdQcIFsbUbQOTh/BwTfdzV
 zJ44WyZEvGf79+dGkJ+aTfsVwgxInOa/Cp4VjNSRzfLbi1U1yqSGwop25+wFRRyXHaub
 sxDaZmAaGujsf3nqquT0YqvQ2uaQ8WqQvVe6A=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=k6LSw19K
Subject: [Buildroot] [PATCH v9 00/22] Add support for AM62x-SK HS-FS devices
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
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 michael@amarulasolutions.com, linux-amarula@amarulasolutions.com,
 Asaf Kahlon <asafka7@gmail.com>, Xuanhao Shi <X15000177@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@smile.fr>, Andreas Dannenberg <dannenberg@ti.com>,
 Alexander Sverdlin <alexander.sverdlin@gmail.com>, bryce@redpinelabs.com,
 Anand Gadiyar <gadiyar@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The SK-AM62B-P1 is the newest version of SK-AM62 which includes
high-security field-securable (HS-FS) silicon to optionally customize keys
and encryption for security applications.
This requires enabling the BR2_TARGET_TI_K3_IMAGE_GEN_SECTYPE_HS_FS option,
which, however, was buggy. This series fixes the errors and bumps the Linux
kernel and U-Boot required for such a new device.

Furthermore, this version complete the series by updating the
ti_am64x_sk_defconfig too and remove ti-k3-image-gen, as requested by
Romain Naour:
https://patchwork.ozlabs.org/project/buildroot/patch/20240224205654.1546744-17-dario.binacchi@amarulasolutions.com/
I have successfully executed compilation tests for all possible combinations of platform and security type:
am62x -> GP, HS, HS-FS
am64x -> GP, HS, HS-FS

The AM62x HS-FS configuration has also been tested on the SK-AM62B-P1 board.

Dario Binacchi (21):
  configs/ti_am62x_sk_defconfig: fix BR2_TARGET_OPTEE_OS_PLATFORM
    setting
  configs/ti_am64x_sk_defconfig: fix BR2_TARGET_OPTEE_OS_PLATFORM
    setting
  configs/ti_am62x_sk_defconfig: explicitly set the ti-k3-r5-loader
    version
  configs/ti_am64x_sk_defconfig: explicitly set the ti-k3-r5-loader
    version
  boot/ti-k3-r5-loader: bump to version 2024.01
  package/python-attrs: add host variant
  package/python-rpds-py: add host variant
  package/python-referencing: add host variant
  package/python-jsonschema-specifications: add host variant
  package/python-jsonschema: add host variant
  boot/ti-k3-r5-loader: set binman environment
  boot/uboot: add BR2_TARGET_UBOOT_USE_BINMAN option
  package/ti-k3: move TI_K3_{SECTYPE,SOC} out of the image-gen scope
  package/ti-k3: disable HS-FS for AM65 SOC
  boot/ti-k3/ti-k3-r5-loader: install tiboot3.bin
  configs/ti_am62x_sk_defconfig: bump U-Boot version to 2024.01
  configs/ti_am62x_sk_defconfig: bump Linux version to 6.6.18
  board/ti/am62x-sk: generalize post-build.sh
  board/ti/am62x-sk: move post-{build,image}.sh to board/ti/common/am6xx
  configs/ti_am64x_sk_defconfig: bump U-Boot version to 2024.01
  configs/ti_am64x_sk_defconfig: bump Linux version to 6.6.18

Romain Naour (1):
  boot/ti-k3-image-gen: remove package

 Config.in.legacy                              |  7 ++
 DEVELOPERS                                    |  2 -
 board/ti/am62x-sk/genimage.cfg                |  7 +-
 board/ti/am64x-sk/genimage.cfg                |  7 +-
 board/ti/common/am6xx/post-build.sh           | 58 ++++++++++++++
 board/ti/common/am6xx/post-image.sh           | 11 +++
 boot/Config.in                                |  1 -
 boot/ti-k3-image-gen/Config.in                | 77 -------------------
 boot/ti-k3-image-gen/ti-k3-image-gen.hash     |  3 -
 boot/ti-k3-image-gen/ti-k3-image-gen.mk       | 54 -------------
 boot/ti-k3-r5-loader/Config.in                |  5 +-
 boot/ti-k3-r5-loader/ti-k3-r5-loader.hash     |  2 +-
 boot/ti-k3-r5-loader/ti-k3-r5-loader.mk       | 12 ++-
 boot/uboot/Config.in                          | 23 +++---
 boot/uboot/uboot.mk                           | 12 ++-
 configs/ti_am62x_sk_defconfig                 | 22 +++---
 configs/ti_am64x_sk_defconfig                 | 22 +++---
 package/Config.in                             |  1 +
 package/python-attrs/python-attrs.mk          |  6 ++
 .../python-jsonschema-specifications.mk       | 10 +++
 .../python-jsonschema/python-jsonschema.mk    | 14 ++++
 .../python-referencing/python-referencing.mk  | 11 +++
 package/python-rpds-py/python-rpds-py.mk      |  1 +
 package/ti-k3/Config.in                       | 61 +++++++++++++++
 package/ti-k3/ti-k3.mk                        |  7 ++
 25 files changed, 263 insertions(+), 173 deletions(-)
 create mode 100755 board/ti/common/am6xx/post-build.sh
 create mode 100755 board/ti/common/am6xx/post-image.sh
 delete mode 100644 boot/ti-k3-image-gen/Config.in
 delete mode 100644 boot/ti-k3-image-gen/ti-k3-image-gen.hash
 delete mode 100644 boot/ti-k3-image-gen/ti-k3-image-gen.mk
 create mode 100644 package/ti-k3/Config.in
 create mode 100644 package/ti-k3/ti-k3.mk

-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
