Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AE54C48BF6
	for <buildroot@archiver.kernel.org>; Sat, 24 Feb 2024 20:57:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C1B094044B;
	Sat, 24 Feb 2024 20:57:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IpnUhpiOSm2m; Sat, 24 Feb 2024 20:57:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2872D40112
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2872D40112;
	Sat, 24 Feb 2024 20:57:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D74631BF276
 for <buildroot@lists.busybox.net>; Sat, 24 Feb 2024 20:57:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D0AD881F65
 for <buildroot@lists.busybox.net>; Sat, 24 Feb 2024 20:57:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ycldqJc6ak5f for <buildroot@lists.busybox.net>;
 Sat, 24 Feb 2024 20:57:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62b; helo=mail-ej1-x62b.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B053B81F58
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B053B81F58
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B053B81F58
 for <buildroot@buildroot.org>; Sat, 24 Feb 2024 20:57:23 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-a26fa294e56so327852066b.0
 for <buildroot@buildroot.org>; Sat, 24 Feb 2024 12:57:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708808241; x=1709413041;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ceQ7xWMikFhd3wo6kDGo4lOe/9v5NvX+JNcjrQ26lqs=;
 b=iu6Yk5co3TrbJG2dOAnGmcxzG8krzNslmKDwG3XwFGLmGVrVpeOimgFnZmaVZmFs21
 Ze/GBHaUVYbGizCO9kUtJlfd835VWjhZfJ149BBCq6l91n9cmDT2NjFXG5NC1vSf8LyK
 fCo8TUCDe/g1aBikcji/hhKZSo+yR9Y/48Pf/+n27kfgaXFnCwlYw57svri4X+0PEucY
 oN++QDI5j44CmdnF+FIrI82LoJrDVZ1h8n1RPefAXaldUj7cmMYQoESGoFsanYysPb8S
 cG53YHL4fB/9G3/n88zQiWwdjpjnDe68Or53cN3z6Br0cT+OYyanMiY8eqSWR2LGQfwv
 /48g==
X-Gm-Message-State: AOJu0YzHGMHd+eaPsy3Mvo6GUJ4su61VctH+Rw4nw2B/6fepJBrN1wwH
 3TaMWnyHpTAN9TDxwA2AThoZFFXAPSeoeWyUFg1sdsAB5yEp8EhE+Cm4Ocs5I8tHqVHks/rmOp2
 rCZU=
X-Google-Smtp-Source: AGHT+IEIRyz7WDqHHUqPw1KB3kOJJBpqXP1vX9gZ31UlmkDn25nb1UWEgNfQWCKisvLTCzqGoi4tWw==
X-Received: by 2002:a17:906:f894:b0:a3e:72ca:700d with SMTP id
 lg20-20020a170906f89400b00a3e72ca700dmr2092093ejb.45.1708808240902; 
 Sat, 24 Feb 2024 12:57:20 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-87-5-96-195.retail.telecomitalia.it. [87.5.96.195])
 by smtp.gmail.com with ESMTPSA id
 tk6-20020a170907c28600b00a4306ac4c77sm425506ejc.197.2024.02.24.12.57.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 Feb 2024 12:57:20 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Sat, 24 Feb 2024 21:56:37 +0100
Message-ID: <20240224205654.1546744-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1708808241; x=1709413041;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ceQ7xWMikFhd3wo6kDGo4lOe/9v5NvX+JNcjrQ26lqs=;
 b=XaREBWYDBWL6Kh5i3mmE/yYYb5dBiAMqkHMxDaDxhXVOCAOWQjWkSS/y5U8ZTfNwyl
 lj4eNqcf3eN4g3wBUliMcgzHtxlF3IxFIqP55oYAmnISFRnFz7d80qXoRZFdfq6IHO5x
 3dVerd/5yv6hvF0xyXCr2Nnln1AqSsPPAgHco=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=XaREBWYD
Subject: [Buildroot] [PATCH v6 00/16] Add support for AM62x-SK HS-FS devices
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
  boot/uboot: add BR2_TARGET_UBOOT_USE_BINMAN option
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
 20 files changed, 232 insertions(+), 87 deletions(-)
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
