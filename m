Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C022C48BC4
	for <buildroot@archiver.kernel.org>; Sat, 17 Feb 2024 16:03:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C049783C64;
	Sat, 17 Feb 2024 16:03:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id r1cE3XVwaWts; Sat, 17 Feb 2024 16:03:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9D71883C61
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9D71883C61;
	Sat, 17 Feb 2024 16:03:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 213281BF5A3
 for <buildroot@lists.busybox.net>; Sat, 17 Feb 2024 16:03:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0ED5383C61
 for <buildroot@lists.busybox.net>; Sat, 17 Feb 2024 16:03:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nTtjJfNYzaoc for <buildroot@lists.busybox.net>;
 Sat, 17 Feb 2024 16:03:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::535; helo=mail-ed1-x535.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 949F983C60
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 949F983C60
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 949F983C60
 for <buildroot@buildroot.org>; Sat, 17 Feb 2024 16:02:59 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-563c2b2bddbso3466577a12.1
 for <buildroot@buildroot.org>; Sat, 17 Feb 2024 08:02:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708185777; x=1708790577;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RzSaQpsRwjF0XuGNHTLZ+VM869Ffi2kgRi0lLYk1ULc=;
 b=w5ceB2kWxOzOFySwg+yTKfAjcXb45P04R/u6FbY3qJfTk1f5xyBIUbQvg0BYyfQqMH
 eaouTp8TcgrwvqDlIbaShcC6PpeLwpOXXH5IzOhY98PoGaF9/s3XaRd/XSysK5CwGX4M
 EdC4369/WPYInzUQlJbfYI/G4rd7W6yW/o0tH/9MXqUySWc2ZkZYQF+4tN67Xqr/vzxE
 JmBaONOVuWOR23jQvbhb54mPzFWEwZSNdgmgiHq2mgoknEc7jwkigmuAF/IDahk0sZ75
 xm12SqFO6nwzHsLLl3hHR5csMR07G9vj+kyKt2+Kj//WGk+6plpj6/fmw/iuOg13OUN0
 kjng==
X-Gm-Message-State: AOJu0YzSY50SEtQs/LcNA5k65Pno8d5/qojF5pOSXUtwduqmYWjo/3xG
 uvb3D1m5zYI/y5FJdoz2BxJ1O4vznRePqy8rdvPOkBvFxG450/xFT6S7/wWClp8eyupSzpatb9f
 HB5M=
X-Google-Smtp-Source: AGHT+IGzRhzaOUU4KgUQOyA/5qLiq86lX9gyC9/UWJJBYCoMMhoE1RLxzFZ5rV37735mWGjSkRWbeA==
X-Received: by 2002:a05:6402:38e:b0:563:d54b:4731 with SMTP id
 o14-20020a056402038e00b00563d54b4731mr3728423edv.7.1708185776953; 
 Sat, 17 Feb 2024 08:02:56 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-87-5-96-195.retail.telecomitalia.it. [87.5.96.195])
 by smtp.gmail.com with ESMTPSA id
 dj13-20020a05640231ad00b0055f0b3ec5d8sm973414edb.36.2024.02.17.08.02.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 17 Feb 2024 08:02:56 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Sat, 17 Feb 2024 17:02:24 +0100
Message-ID: <20240217160244.1320482-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1708185777; x=1708790577;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=RzSaQpsRwjF0XuGNHTLZ+VM869Ffi2kgRi0lLYk1ULc=;
 b=lWvb9N7RqKuYPX59/L6IrLw2ANzjxgfaM1uVpOj/jTlU84gZqLlUBcUh2xyOW2NxXx
 WIaVi+6Frkc6FXaZ1uzltmkKkipLGbySyVXZJxVIX0Uehpm0EWyUYq7AW6yE530ks4H2
 YJA7ApZAW9/5yUj1UUkSbgfE3aMvfa4dtlENI=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=lWvb9N7R
Subject: [Buildroot] [PATCH v4 00/20] Add support for AM62x-SK HS-FS devices
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

This series, which in my humble opinion, should have been immediately
considered to correct the compilation errors in case of HS-FS devcies, has
seen an increase in patches in version 4 to remove the ti-k3-image-gen
package thanks to Binman. Additionally, it shares some modifications and
views on how to implement certain changes with the series
https://patchwork.ozlabs.org/project/buildroot/list/?series=394840.
Therefore, I think it is necessary not to run them in parallel but to decide
whether to merge one before the other or to consider a single series where
the patches can be coherent with each other. I am available for both solutions.
Let me know.

Dario Binacchi (20):
  configs/ti_am62x_sk_defconfig: fix BR2_TARGET_OPTEE_OS_PLATFORM
    setting
  configs/ti_am64x_sk_defconfig: fix BR2_TARGET_OPTEE_OS_PLATFORM
    setting
  configs/ti_am62x_sk_defconfig: explicitly set the ti-k3-r5-loader
    version
  configs/ti_am64x_sk_defconfig: explicitly set the ti-k3-r5-loader
    version
  boot/ti-k3-r5-loader: bump to version 2024.01
  boot/ti-k3-core-secdev: new package
  boot/ti-k3-image-gen: manage HS hardware
  package/python-jsonschema: add host variant
  package/python-attrs: add host variant
  package/python-referencing: add host variant
  package/python-rpds-py: add host variant
  package/python-jsonschema-specifications: add host variant
  boot/ti-k3-r5-loader: set binman environment
  boot/uboot: set BINMAN_INDIRS for TI K3 DM
  configs/ti_am62x_sk_defconfig: bump U-Boot version to 2024.01
  configs/ti_am62x_sk_defconfig: bump Linux version to 6.6.1
  boot: move ti-k3-* packages to 'ti-k3' directory
  boot/ti-k3: move TI_K3_{SECTYPE,SOC} out of the image-gen scope
  boot/ti-k3/ti-k3-r5-loader: install tiboot3.bin
  configs/ti_am62x_sk_defconfig: don't use ti-k3-image-gen anymore

 DEVELOPERS                                    |  1 +
 board/ti/am62x-sk/genimage.cfg                |  7 +-
 board/ti/am62x-sk/post-build.sh               | 49 ++++++++++++
 board/ti/am62x-sk/post-image.sh               |  5 ++
 boot/Config.in                                |  4 +-
 boot/ti-k3-image-gen/Config.in                | 77 -------------------
 boot/ti-k3/Config.in                          | 59 ++++++++++++++
 boot/ti-k3/common.mk                          |  1 +
 .../{ => ti-k3}/ti-k3-boot-firmware/Config.in |  0
 .../ti-k3-boot-firmware.hash                  |  0
 .../ti-k3-boot-firmware.mk                    |  0
 boot/ti-k3/ti-k3-core-secdev/Config.in        |  9 +++
 .../ti-k3-core-secdev/ti-k3-core-secdev.hash  |  3 +
 .../ti-k3-core-secdev/ti-k3-core-secdev.mk    | 22 ++++++
 boot/ti-k3/ti-k3-image-gen/Config.in          | 25 ++++++
 .../ti-k3-image-gen/ti-k3-image-gen.hash      |  0
 .../ti-k3-image-gen/ti-k3-image-gen.mk        | 20 ++++-
 boot/{ => ti-k3}/ti-k3-r5-loader/Config.in    |  4 +-
 .../ti-k3-r5-loader/ti-k3-r5-loader.hash      |  2 +-
 .../ti-k3-r5-loader/ti-k3-r5-loader.mk        | 16 +++-
 boot/uboot/Config.in                          |  7 +-
 boot/uboot/uboot.mk                           |  3 +-
 configs/ti_am62x_sk_defconfig                 | 23 +++---
 configs/ti_am64x_sk_defconfig                 |  8 +-
 package/python-attrs/python-attrs.mk          |  6 ++
 .../python-jsonschema-specifications.mk       |  5 ++
 .../python-jsonschema/python-jsonschema.mk    |  6 ++
 .../python-referencing/python-referencing.mk  |  5 ++
 package/python-rpds-py/python-rpds-py.mk      |  1 +
 29 files changed, 263 insertions(+), 105 deletions(-)
 create mode 100755 board/ti/am62x-sk/post-build.sh
 create mode 100755 board/ti/am62x-sk/post-image.sh
 delete mode 100644 boot/ti-k3-image-gen/Config.in
 create mode 100644 boot/ti-k3/Config.in
 create mode 100644 boot/ti-k3/common.mk
 rename boot/{ => ti-k3}/ti-k3-boot-firmware/Config.in (100%)
 rename boot/{ => ti-k3}/ti-k3-boot-firmware/ti-k3-boot-firmware.hash (100%)
 rename boot/{ => ti-k3}/ti-k3-boot-firmware/ti-k3-boot-firmware.mk (100%)
 create mode 100644 boot/ti-k3/ti-k3-core-secdev/Config.in
 create mode 100644 boot/ti-k3/ti-k3-core-secdev/ti-k3-core-secdev.hash
 create mode 100644 boot/ti-k3/ti-k3-core-secdev/ti-k3-core-secdev.mk
 create mode 100644 boot/ti-k3/ti-k3-image-gen/Config.in
 rename boot/{ => ti-k3}/ti-k3-image-gen/ti-k3-image-gen.hash (100%)
 rename boot/{ => ti-k3}/ti-k3-image-gen/ti-k3-image-gen.mk (67%)
 rename boot/{ => ti-k3}/ti-k3-r5-loader/Config.in (97%)
 rename boot/{ => ti-k3}/ti-k3-r5-loader/ti-k3-r5-loader.hash (54%)
 rename boot/{ => ti-k3}/ti-k3-r5-loader/ti-k3-r5-loader.mk (85%)

-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
