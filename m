Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 354EDCD1288
	for <buildroot@archiver.kernel.org>; Sat, 30 Mar 2024 16:02:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9E41E821FC;
	Sat, 30 Mar 2024 16:02:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lM80wxF_S4kP; Sat, 30 Mar 2024 16:02:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 81AAA8226D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 81AAA8226D;
	Sat, 30 Mar 2024 16:02:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2EA221BF3DF
 for <buildroot@lists.busybox.net>; Sat, 30 Mar 2024 16:02:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 17F44406CB
 for <buildroot@lists.busybox.net>; Sat, 30 Mar 2024 16:02:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3TH478yeCP5b for <buildroot@lists.busybox.net>;
 Sat, 30 Mar 2024 16:02:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52b; helo=mail-ed1-x52b.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7CE76406C9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7CE76406C9
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7CE76406C9
 for <buildroot@buildroot.org>; Sat, 30 Mar 2024 16:02:51 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-56bdf81706aso3495219a12.2
 for <buildroot@buildroot.org>; Sat, 30 Mar 2024 09:02:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711814569; x=1712419369;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Y1hxhYSG6Wz6phcIuxyzpYIMbkYW3jcihJy37QUvGYY=;
 b=HQ+zwA9J9eFx6fyFRh+BTWoBw1WtINsNRenGFfGV+0duj+SgzooY/1aJyXSMKAubQh
 r9P+1SDjMsyrjifyqkoY3yV3h4cwK0kmvu0YUGY07zFtEsOW2ejlghfwURC6tS8wvzk6
 CYMyaZLJzOrjgF/QOst7tibFOdywL65SDBP0ie8ZQiaYYW1CLZTG9mM3nQ/BHEGiUvqn
 Xw0z4X2os3gkzrVS1T4tAIsqT+ZrQuhAZFW8YlTou6uaPQvDxxVNf7FgVxwkY820Tfrg
 qE8GWV9Y+uYJw5CW2MqfeUEfAsZp3DvJPbsllEgPfXX4N1gxb+pm9m6lu1QbhpRWhjBy
 QeMQ==
X-Gm-Message-State: AOJu0YwdBdxnjOo5zRbnN/HKHQdPcQUhVwbEbYKEC036QN8HQoqZWCcY
 WFGaTNZZHrcMt/g/Rgir2AwxsaNdJHubTMHQuWC8ql+8OQmjbaYMvM/BYc0gPm8HOlzWFDlHoEP
 uI4w=
X-Google-Smtp-Source: AGHT+IG+NtFSohr3SAR5DwMGGv4FlmDygPijuNwgcwRXv4NJyeRT3yqNAvjlpt6H1gaNwUC2vgPuQQ==
X-Received: by 2002:a05:6402:5114:b0:568:8e22:4eff with SMTP id
 m20-20020a056402511400b005688e224effmr3448528edd.37.1711814569026; 
 Sat, 30 Mar 2024 09:02:49 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-87-8-99-67.retail.telecomitalia.it. [87.8.99.67])
 by smtp.gmail.com with ESMTPSA id
 f13-20020a056402004d00b0056c633354c6sm2127107edu.45.2024.03.30.09.02.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Mar 2024 09:02:48 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Sat, 30 Mar 2024 17:02:32 +0100
Message-ID: <20240330160244.3214733-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1711814569; x=1712419369;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Y1hxhYSG6Wz6phcIuxyzpYIMbkYW3jcihJy37QUvGYY=;
 b=EFIQ+XEqEDq0I1SOJcnysza5fMZ3A0CyyBKuekM07+Lr2WcKRTAa20bbKA1FhhOWva
 74zhXBmjnBQfAuoV4B5c230KZWrVs7Rp0+I8anyYGK60pLrDIS/beT4egGbzyyxDuFSU
 CU53nY+Pu2smYrQrAzyZWBLxb2DCinLyTgMP8=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=EFIQ+XEq
Subject: [Buildroot] [PATCH v10 00/12] Add support for AM62x-SK HS-FS devices
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
 Alexander Sverdlin <alexander.sverdlin@gmail.com>,
 "Yann E . Morin" <yann.morin.1998@free.fr>, bryce@redpinelabs.com,
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
ti_am64x_sk_defconfig as requested by Romain Naour:
https://patchwork.ozlabs.org/project/buildroot/patch/20240224205654.1546744-17-dario.binacchi@amarulasolutions.com/
I have successfully executed compilation tests for all possible combinations of platform and security type:
am62x -> GP, HS, HS-FS
am64x -> GP, HS, HS-FS

The AM62x HS-FS configuration has also been tested on the SK-AM62B-P1 board.

Version 9 has merged the first 10 patches into the mainline. This version
therefore contains the remaining patches to which the patch suggested by
Yann E. Morin has been added ("boot/ti-k3-r5-loader: drop hash for version
2022.10" [1]), and has removed the patch "boot/ti-k3-image-gen: remove
package", which is not strictly required by the series and does not cause
regressions.

[1] https://patchwork.ozlabs.org/project/buildroot/patch/20240304153253.732708-6-dario.binacchi@amarulasolutions.com

Dario Binacchi (12):
  boot/ti-k3-r5-loader: drop hash for version 2022.10
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

 board/ti/am62x-sk/genimage.cfg            |  7 ++-
 board/ti/am64x-sk/genimage.cfg            |  7 ++-
 board/ti/common/am6xx/post-build.sh       | 58 +++++++++++++++++++++
 board/ti/common/am6xx/post-image.sh       | 11 ++++
 boot/ti-k3-image-gen/Config.in            | 61 ++---------------------
 boot/ti-k3-image-gen/ti-k3-image-gen.mk   |  4 +-
 boot/ti-k3-r5-loader/Config.in            |  1 +
 boot/ti-k3-r5-loader/ti-k3-r5-loader.hash |  1 -
 boot/ti-k3-r5-loader/ti-k3-r5-loader.mk   | 12 ++++-
 boot/uboot/Config.in                      | 23 +++++----
 boot/uboot/uboot.mk                       | 12 ++++-
 configs/ti_am62x_sk_defconfig             | 20 ++++----
 configs/ti_am64x_sk_defconfig             | 20 ++++----
 package/Config.in                         |  1 +
 package/ti-k3/Config.in                   | 61 +++++++++++++++++++++++
 package/ti-k3/ti-k3.mk                    |  7 +++
 16 files changed, 213 insertions(+), 93 deletions(-)
 create mode 100755 board/ti/common/am6xx/post-build.sh
 create mode 100755 board/ti/common/am6xx/post-image.sh
 create mode 100644 package/ti-k3/Config.in
 create mode 100644 package/ti-k3/ti-k3.mk

-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
