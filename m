Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BFB1C4167B
	for <buildroot@archiver.kernel.org>; Wed, 29 Nov 2023 17:26:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0D0F4817B1;
	Wed, 29 Nov 2023 17:26:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0D0F4817B1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qq8MywtbGx6b; Wed, 29 Nov 2023 17:26:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 53636817BA;
	Wed, 29 Nov 2023 17:26:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 53636817BA
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7F9C41BF31E
 for <buildroot@lists.busybox.net>; Wed, 29 Nov 2023 17:26:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 58821817B1
 for <buildroot@lists.busybox.net>; Wed, 29 Nov 2023 17:26:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 58821817B1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 376y67fhHYRf for <buildroot@lists.busybox.net>;
 Wed, 29 Nov 2023 17:26:38 +0000 (UTC)
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 68C2C81517
 for <buildroot@buildroot.org>; Wed, 29 Nov 2023 17:26:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 68C2C81517
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-54bb9024378so52874a12.3
 for <buildroot@buildroot.org>; Wed, 29 Nov 2023 09:26:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701278796; x=1701883596;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hLFuFOdW+YPjIhT+6PAPJ/f9Hma7oQ8bvfIbO9YEL9w=;
 b=D0dpLOEFmlAp/F433WH+DZf8fy/WqFss/yeQaV/BJb1LUhtDyzfbXhp+DEOLrNhnZe
 TfP1KziMNoLhY8tqPThnn9pjgPU8Mg+7CVzbg0aBKHYnI8+jRBzFjbRRrh94tg4DbakD
 m/Hxhlc0fwh2nkRqoBgPlspsqiqdXAcG2fghUoPTx7Zm89FwbHUpEhU7XrQtfsDMvdIu
 GRDXdc6mhP0BFDtf9iLigvuYuTJYbxmAgbSQxW2twOBn0Fr+kKmrHMJeMtm+ybtwUEsP
 wkTPOwTq0YzuCwCopBuYins/pV2SD7piYKARxalDxfHtbiVOEi5RyyJ1vv0lX+l44WQG
 7PNg==
X-Gm-Message-State: AOJu0YwbP3RN2Lb9PC//4KiSmrqtNCv4/iv368JHteJJTT4AmYNWAupt
 wC0djbnXRtFuCxjTodKsL/+zqztmdv//2t3fWIr/dw==
X-Google-Smtp-Source: AGHT+IEPgzXDvCyu3zbJzELFya61/jdWjETJiHZwWSN3NbpNkd6poR9djQZp/EdJfD+5CM/XoJ5GRA==
X-Received: by 2002:a17:906:20de:b0:a01:811c:ce9 with SMTP id
 c30-20020a17090620de00b00a01811c0ce9mr16097255ejc.0.1701278796131; 
 Wed, 29 Nov 2023 09:26:36 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-95-244-100-54.retail.telecomitalia.it. [95.244.100.54])
 by smtp.gmail.com with ESMTPSA id
 dv19-20020a170906b81300b009a9fbeb15f2sm8104620ejb.62.2023.11.29.09.26.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Nov 2023 09:26:35 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Wed, 29 Nov 2023 18:26:04 +0100
Message-ID: <20231129172615.1683565-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1701278796; x=1701883596;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=hLFuFOdW+YPjIhT+6PAPJ/f9Hma7oQ8bvfIbO9YEL9w=;
 b=lQdh8xniqD0PX6VJhY7z+x0ZhsIi19PwToYDnEVlZU2Qq88j0xoKmAChQPbmwuKkdA
 /2Hnga1vNM9aRk3fpsX62IW0jy25G2xXZqZjJrMvk0a8NI5cM8Lp/k8e6nUCRHENbILO
 FpqU71W3A1UD53bdgCQRk7TaZlCBPbCBEbLvM=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=lQdh8xni
Subject: [Buildroot] [PATCH 00/11] Add support for AM62x-SK HS-FS devices
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
 linux-amarula@amarulasolutions.com, Anand Gadiyar <gadiyar@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The SK-AM62B-P1 is the newest version of SK-AM62which includes
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
  boot/ti-k3-r5-loader: set binman environment variable
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
 boot/ti-k3-r5-loader/ti-k3-r5-loader.mk       |  1 +
 boot/uboot/uboot.mk                           |  3 +-
 configs/ti_am62x_sk_defconfig                 | 20 ++++++--
 package/Config.in.host                        |  5 ++
 package/python-attrs/Config.in.host           |  8 +++
 package/python-attrs/python-attrs.mk          |  6 +++
 .../Config.in.host                            |  7 +++
 .../python-jsonschema-specifications.mk       |  5 ++
 package/python-jsonschema/Config.in.host      |  6 +++
 .../python-jsonschema/python-jsonschema.mk    |  6 +++
 package/python-referencing/Config.in.host     |  6 +++
 .../python-referencing/python-referencing.mk  |  7 +++
 package/python-rpds-py/Config.in.host         |  8 +++
 package/python-rpds-py/python-rpds-py.mk      |  1 +
 24 files changed, 192 insertions(+), 8 deletions(-)
 create mode 100755 board/ti/am62x-sk/post-build.sh
 create mode 100755 board/ti/am62x-sk/post-image.sh
 create mode 100644 boot/ti-k3-core-secdev/Config.in
 create mode 100644 boot/ti-k3-core-secdev/ti-k3-core-secdev.hash
 create mode 100644 boot/ti-k3-core-secdev/ti-k3-core-secdev.mk
 create mode 100644 package/python-attrs/Config.in.host
 create mode 100644 package/python-jsonschema-specifications/Config.in.host
 create mode 100644 package/python-jsonschema/Config.in.host
 create mode 100644 package/python-referencing/Config.in.host
 create mode 100644 package/python-rpds-py/Config.in.host

-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
