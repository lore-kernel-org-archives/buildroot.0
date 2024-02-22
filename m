Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A197DC48BEB
	for <buildroot@archiver.kernel.org>; Thu, 22 Feb 2024 10:16:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6E25C41936;
	Thu, 22 Feb 2024 10:16:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Wb6qPAZktXi5; Thu, 22 Feb 2024 10:16:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6617D41B58
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6617D41B58;
	Thu, 22 Feb 2024 10:16:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A78C81BF3FF
 for <buildroot@lists.busybox.net>; Thu, 22 Feb 2024 10:16:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9484841850
 for <buildroot@lists.busybox.net>; Thu, 22 Feb 2024 10:16:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cOAxXz0vr752 for <buildroot@lists.busybox.net>;
 Thu, 22 Feb 2024 10:16:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::12d; helo=mail-lf1-x12d.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org CA31841851
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CA31841851
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CA31841851
 for <buildroot@buildroot.org>; Thu, 22 Feb 2024 10:16:48 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-512b29f82d1so6379382e87.1
 for <buildroot@buildroot.org>; Thu, 22 Feb 2024 02:16:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708597006; x=1709201806;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UqZso15dPm2jDDarVH5jkwJBwQTPWXLaaJnbptBUsmo=;
 b=WhfZubL9s+QwTNZ/HcdRkfHjltUMw4pj00lVZEJ5mQeqKfuyD+uEMCUX0HcIT3yprZ
 A9kmZ8SVWZEMB2TqZbMYoOSDxwb0qZGH0/MAn9uZ+rF9vrIj4WREep1DM6EaWY7OItRL
 r1kpyj/zS+2RiZUigyP8vIX4RHkz1J3z8OD/dypLfhYxU3/I9MEFs6maY2MuiSVPHUbo
 Iwj7Kgatm5xV7r1M+o6J0ZuEmqTnSqfYfacC4WOvBEAckBXaNtDPMs3cjs+yfshiSdfV
 NNAWqZ7zZYS4/pUahT8B3L5PL79qdMB/ax/rrZ4L+SlX8k5XFklRUG//eXfLaNTID1eY
 /6tg==
X-Gm-Message-State: AOJu0YygwPJrpCkFqU3AWIjN4Y9vwP+ooEERF5frs5f8+mEXhcDVCa8S
 BCtA4bnmmu5CGr8aGO/FrsnUs5RC/Ld18A4ku70bh+8G21KZcaWt12QyGLz2lweCOMZV/Ebvd0m
 CgV0=
X-Google-Smtp-Source: AGHT+IG7/nucNOc1c8GP6zCCp5G7cwbih84FIdiyxqnvY8gshtZx59s03krtyC11bnlKksDy2PjiBQ==
X-Received: by 2002:a05:6512:3b2c:b0:512:e00b:9120 with SMTP id
 f44-20020a0565123b2c00b00512e00b9120mr646132lfv.32.1708597005674; 
 Thu, 22 Feb 2024 02:16:45 -0800 (PST)
Received: from localhost.localdomain ([2001:b07:6474:ebbf:4f68:2b3f:b15d:b5a9])
 by smtp.gmail.com with ESMTPSA id
 y17-20020a05600c365100b004126101915esm5619349wmq.4.2024.02.22.02.16.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Feb 2024 02:16:44 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Thu, 22 Feb 2024 11:16:01 +0100
Message-ID: <20240222101617.18422-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1708597006; x=1709201806;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=UqZso15dPm2jDDarVH5jkwJBwQTPWXLaaJnbptBUsmo=;
 b=jsbncnwUTPa5TGSuXJcGek0sdC3MI8UId+H0WVxxT2SaejscjskFnxO7IlGrCsghOE
 cno4yjyryyST+YRKESWihWdgLzLzANRT0fTzciG1Q0HPDxwPuNNUqufdxOiMR+/mvLfv
 v0DCxqd9St4Wv0+A+Ka3E2EqB+kIzFfD8J8bk=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=jsbncnwU
Subject: [Buildroot] [PATCH v5 00/16] Add support for AM62x-SK HS-FS devices
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

Changes in v5:
- Drop patches:
 - [v4,06/20] boot/ti-k3-core-secdev: new package
 - [v4,07/20] boot/ti-k3-image-gen: manage HS hardware
- Reorder the patches
 - [08/20] package/python-jsonschema: add host variant
 - [09/20] package/python-attrs: add host variant
 - [10/20] package/python-referencing: add host variant
 - [11/20] package/python-rpds-py: add host variant
 - [12/20] package/python-jsonschema-specifications: add host variant
 according to the sequence used by Romain Naour in the series "Add ti_j721e_sk_defconfig"
- The other changes are found in the changelog of each individual patch.

Dario Binacchi (16):
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
  boot/uboot: set BINMAN_INDIRS for TI K3 DM
  package/ti-k3: move TI_K3_{SECTYPE,SOC} out of the image-gen scope
  boot/ti-k3/ti-k3-r5-loader: install tiboot3.bin
  configs/ti_am62x_sk_defconfig: bump U-Boot version to 2024.01
  configs/ti_am62x_sk_defconfig: bump Linux version to 6.6.17

 board/ti/am62x-sk/genimage.cfg                |  7 ++-
 board/ti/am62x-sk/post-build.sh               | 49 +++++++++++++++
 board/ti/am62x-sk/post-image.sh               |  5 ++
 boot/ti-k3-image-gen/Config.in                | 61 ++-----------------
 boot/ti-k3-image-gen/ti-k3-image-gen.mk       |  4 +-
 boot/ti-k3-r5-loader/Config.in                |  5 +-
 boot/ti-k3-r5-loader/ti-k3-r5-loader.hash     |  2 +-
 boot/ti-k3-r5-loader/ti-k3-r5-loader.mk       | 12 +++-
 boot/uboot/Config.in                          |  7 +--
 boot/uboot/uboot.mk                           |  2 +-
 configs/ti_am62x_sk_defconfig                 | 22 ++++---
 configs/ti_am64x_sk_defconfig                 |  7 ++-
 package/Config.in                             |  1 +
 package/python-attrs/python-attrs.mk          |  6 ++
 .../python-jsonschema-specifications.mk       |  5 ++
 .../python-jsonschema/python-jsonschema.mk    | 14 +++++
 .../python-referencing/python-referencing.mk  | 11 ++++
 package/python-rpds-py/python-rpds-py.mk      |  1 +
 package/ti-k3/Config.in                       | 54 ++++++++++++++++
 package/ti-k3/ti-k3.mk                        |  7 +++
 20 files changed, 202 insertions(+), 80 deletions(-)
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
