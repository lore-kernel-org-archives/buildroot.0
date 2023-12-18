Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05FCBC46CD2
	for <buildroot@archiver.kernel.org>; Mon, 18 Dec 2023 08:20:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A860840603;
	Mon, 18 Dec 2023 08:20:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A860840603
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id c_CissbOjG_h; Mon, 18 Dec 2023 08:20:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9E236408C3;
	Mon, 18 Dec 2023 08:20:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9E236408C3
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B11261BF3BC
 for <buildroot@lists.busybox.net>; Mon, 18 Dec 2023 08:20:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 96B9641805
 for <buildroot@lists.busybox.net>; Mon, 18 Dec 2023 08:20:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 96B9641805
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id n0PoBbs9e3yz for <buildroot@lists.busybox.net>;
 Mon, 18 Dec 2023 08:20:15 +0000 (UTC)
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 91121417BE
 for <buildroot@buildroot.org>; Mon, 18 Dec 2023 08:20:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 91121417BE
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-50bce78f145so2806489e87.0
 for <buildroot@buildroot.org>; Mon, 18 Dec 2023 00:20:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702887613; x=1703492413;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=htU1y8iTg4kMiim15kYxSWyJdET46E4nrokuKqkI8Qk=;
 b=Lll+sA/5GlzUYpW3XIY87KjYDnk/ADgeZ4UBa+C+OM9zfJMY7HkR+guttAdbjLVG8b
 wwT2nWy00nC+bt3TjbJjDLqColoN08POhWJY8Q6KJ7qzOMaFb0o1s1x/TUxRKdYW8AQx
 kMtPvua/DPklRQLd/r/IuKa9tcG5JWb94hzq3XPG7lbg2wG/HIHzVPLpUqQA54PX/WTa
 EvFMnz68ptSTwgPAtLlqg83bIehJawyH+zcSJLrs0TMWb7M6OCH9BvPeN2XbWoVpV9Sk
 uu7XOIqYzrvAT60vP57QXXGOA0Zsu9DvXU4IKZZ0hLi+iBIrH8nTLRtnr1ex0S2ww2f+
 GAGg==
X-Gm-Message-State: AOJu0YxmQE7YmBC4KDeCV0MPU7SkxlMtW2yI2M++AjYcWyXEOPx1rMFl
 QVhqUIsOXtxREBuNNFX/Qfl02NW3Bs7pVIEK2Q9ZVQ==
X-Google-Smtp-Source: AGHT+IFnWL65twExks086SaFSCorhTploJX0qLB4aviXe0fTqeu6iRzrJVGCFyTQ74CmzWQ34u34Mg==
X-Received: by 2002:a05:6512:693:b0:50b:ee49:9b42 with SMTP id
 t19-20020a056512069300b0050bee499b42mr4781805lfe.43.1702887613152; 
 Mon, 18 Dec 2023 00:20:13 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-80-182-13-188.retail.telecomitalia.it. [80.182.13.188])
 by smtp.gmail.com with ESMTPSA id
 lm11-20020a17090718cb00b00a1cf3fce937sm13807835ejc.162.2023.12.18.00.20.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Dec 2023 00:20:12 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Mon, 18 Dec 2023 09:19:47 +0100
Message-ID: <20231218081958.506691-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1702887613; x=1703492413;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=htU1y8iTg4kMiim15kYxSWyJdET46E4nrokuKqkI8Qk=;
 b=DUk5wuG7mnaj8tiuT7W52f8EQUvghyKvFInpEqjE1DRq4hmtfxbyL5Y+CKh6PdYZ3U
 eWdbZ9WSRN1gUpi6ELKv1iWGKZop4FEmMnxeRghuqiTYayljDnsoCo8H5fYIW8+js8Id
 /TXbg3aUElSUmQFCXCOmfBTD7xR9Qy+2eTO/c=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=DUk5wuG7
Subject: [Buildroot] [PATCH v3 00/11] Add support for AM62x-SK HS-FS devices
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
Cc: michael@amarulasolutions.com, Asaf Kahlon <asafka7@gmail.com>,
 Xuanhao Shi <X15000177@gmail.com>, James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com, bryce@redpinelabs.com,
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

Dario Binacchi (11):
  boot/ti-k3-core-secdev: new package
  boot/ti-k3-image-gen: manage HS hardware
  package/python-jsonschema: add host variant
  package/python-attrs: add host variant
  package/python-referencing: add host variant
  package/python-rpds-py: add host variant
  package/python-jsonschema-specifications: add host variant
  boot/ti-k3-r5-loader: set binman environment
  boot/uboot: set BINMAN_INDIRS for TI K3 DM
  configs/ti_am62x_sk_defconfig: bump U-Boot version to 2023.10
  configs/ti_am62x_sk_defconfig: bump Linux version to 6.6.1

 DEVELOPERS                                    |  1 +
 board/ti/am62x-sk/genimage.cfg                |  7 ++-
 board/ti/am62x-sk/post-build.sh               | 49 +++++++++++++++++++
 board/ti/am62x-sk/post-image.sh               |  5 ++
 boot/Config.in                                |  1 +
 boot/ti-k3-core-secdev/Config.in              |  9 ++++
 boot/ti-k3-core-secdev/ti-k3-core-secdev.hash |  3 ++
 boot/ti-k3-core-secdev/ti-k3-core-secdev.mk   | 19 +++++++
 boot/ti-k3-image-gen/Config.in                |  1 +
 boot/ti-k3-image-gen/ti-k3-image-gen.mk       | 16 +++++-
 boot/ti-k3-r5-loader/Config.in                | 13 +++++
 boot/ti-k3-r5-loader/ti-k3-r5-loader.mk       | 15 ++++++
 boot/uboot/uboot.mk                           |  3 +-
 configs/ti_am62x_sk_defconfig                 | 14 ++++--
 package/python-attrs/python-attrs.mk          |  6 +++
 .../python-jsonschema-specifications.mk       |  5 ++
 .../python-jsonschema/python-jsonschema.mk    |  6 +++
 .../python-referencing/python-referencing.mk  |  7 +++
 package/python-rpds-py/python-rpds-py.mk      |  1 +
 19 files changed, 173 insertions(+), 8 deletions(-)
 create mode 100755 board/ti/am62x-sk/post-build.sh
 create mode 100755 board/ti/am62x-sk/post-image.sh
 create mode 100644 boot/ti-k3-core-secdev/Config.in
 create mode 100644 boot/ti-k3-core-secdev/ti-k3-core-secdev.hash
 create mode 100644 boot/ti-k3-core-secdev/ti-k3-core-secdev.mk

-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
