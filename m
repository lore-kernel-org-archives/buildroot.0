Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 847F0C5478C
	for <buildroot@archiver.kernel.org>; Tue, 27 Feb 2024 16:30:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0D459404F6;
	Tue, 27 Feb 2024 16:30:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kMde9FFExhEp; Tue, 27 Feb 2024 16:30:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 01B3540508
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 01B3540508;
	Tue, 27 Feb 2024 16:30:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 300DE1BF30A
 for <buildroot@lists.busybox.net>; Tue, 27 Feb 2024 16:30:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 29DDB605BD
 for <buildroot@lists.busybox.net>; Tue, 27 Feb 2024 16:30:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kM4HkrLe7VO0 for <buildroot@lists.busybox.net>;
 Tue, 27 Feb 2024 16:30:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52b; helo=mail-ed1-x52b.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 1799D605B7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1799D605B7
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1799D605B7
 for <buildroot@buildroot.org>; Tue, 27 Feb 2024 16:30:29 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-563c403719cso5596124a12.2
 for <buildroot@buildroot.org>; Tue, 27 Feb 2024 08:30:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709051428; x=1709656228;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9m5O7osM1w7u6RSEKUhA9IT72RRVxr6tsUhVuGbd/UY=;
 b=l2If5n0IZ7q6c8+Bu11xNDsA052fcapSTgpL6gTaShf3GsRIg8MvQuLopJU+/sp+fo
 z3Ou9zqQuGAQGmf1SnKmY9A0pEFy7OX3CIKckGCSqtTEYOWP9suUKDM2TY0dP1huMB/t
 TSFCtnioeP7Dx/l0iztRFeYBoT4nxskCZkGEVISV42oS1SCoK4Xz7ag1007bA8ByC+qM
 CuL/B7mMlKLRDDydWg1c1lwg61Vaj2xnUg2by2BujcOT2b+SvX1i38lEIrYAQhrOwWyO
 DlOn4vW/frKMhHerJFRiU/gmFirrmAuBe3l+FHDMMAK3GLfTQ3+0GMM/S68jb/JuaINB
 IELQ==
X-Gm-Message-State: AOJu0YwgHej2rMpz8fI8I0Nh6aF2PXjzXBuc30THBUQZ11Hr1U2PGoda
 0OjRO4Y1VEL7FGP57dXlP+JAxNeLUyL+xT7J/DM9BFmkMpTsqkTo8OumZuhy/ixT95DlHoGBjAz
 wOvc=
X-Google-Smtp-Source: AGHT+IEojb/K0a+6loVlqEJ2L9bfFhGYrSoKmz6NggdsQsg2q+DwbcLr6lPhz0e8GCs1cBcYBj16hg==
X-Received: by 2002:aa7:cd19:0:b0:564:4a18:45f1 with SMTP id
 b25-20020aa7cd19000000b005644a1845f1mr7822824edw.17.1709051427919; 
 Tue, 27 Feb 2024 08:30:27 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i..
 ([2001:b07:6474:ebbf:e567:9129:29c8:388f])
 by smtp.gmail.com with ESMTPSA id
 p16-20020a056402045000b0055edfb81384sm898404edw.60.2024.02.27.08.30.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Feb 2024 08:30:27 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Tue, 27 Feb 2024 17:30:02 +0100
Message-ID: <20240227163019.2876942-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1709051428; x=1709656228;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=9m5O7osM1w7u6RSEKUhA9IT72RRVxr6tsUhVuGbd/UY=;
 b=ANObH1n8t2DMAZQ1iX0Zwgyfg5Hji3uuLS60SZnarssbHXpt54/eAymPs4/+quGptA
 urw32WcLfVMCN6vIL4vPQPkrzQ+y1XddGKuKXN98zu6G5RCNizyoZj1Z1IDEywZzydxh
 nTxPC0klYcoEyzggqZFZdu2TwWVu4s4B334Yk=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=ANObH1n8
Subject: [Buildroot] [PATCH v7 00/17] Add support for AM62x-SK HS-FS devices
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

Dario Binacchi (17):
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
  configs/ti_am62x_sk_defconfig: bump Linux version to 6.6.17

 board/ti/am62x-sk/genimage.cfg                |  7 ++-
 board/ti/am62x-sk/post-build.sh               | 54 ++++++++++++++++
 board/ti/am62x-sk/post-image.sh               |  5 ++
 boot/ti-k3-image-gen/Config.in                | 61 ++-----------------
 boot/ti-k3-image-gen/ti-k3-image-gen.mk       |  4 +-
 boot/ti-k3-r5-loader/Config.in                |  5 +-
 boot/ti-k3-r5-loader/ti-k3-r5-loader.hash     |  2 +-
 boot/ti-k3-r5-loader/ti-k3-r5-loader.mk       | 12 +++-
 boot/uboot/Config.in                          | 23 +++----
 boot/uboot/uboot.mk                           | 12 +++-
 configs/ti_am62x_sk_defconfig                 | 22 ++++---
 configs/ti_am64x_sk_defconfig                 |  7 ++-
 package/Config.in                             |  1 +
 package/python-attrs/python-attrs.mk          |  6 ++
 .../python-jsonschema-specifications.mk       | 10 +++
 .../python-jsonschema/python-jsonschema.mk    | 14 +++++
 .../python-referencing/python-referencing.mk  | 11 ++++
 package/python-rpds-py/python-rpds-py.mk      |  1 +
 package/ti-k3/Config.in                       | 60 ++++++++++++++++++
 package/ti-k3/ti-k3.mk                        |  7 +++
 20 files changed, 237 insertions(+), 87 deletions(-)
 create mode 100755 board/ti/am62x-sk/post-build.sh
 create mode 100755 board/ti/am62x-sk/post-image.sh
 create mode 100644 package/ti-k3/Config.in
 create mode 100644 package/ti-k3/ti-k3.mk

-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
