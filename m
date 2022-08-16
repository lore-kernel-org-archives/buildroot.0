Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B48A2C25B0E
	for <buildroot@archiver.kernel.org>; Tue, 16 Aug 2022 17:55:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1B31540B66;
	Tue, 16 Aug 2022 17:55:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1B31540B66
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DWZt45dWJkgJ; Tue, 16 Aug 2022 17:55:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3313F40178;
	Tue, 16 Aug 2022 17:55:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3313F40178
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C609C1BF391
 for <buildroot@lists.busybox.net>; Tue, 16 Aug 2022 17:55:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AD9E882AB6
 for <buildroot@lists.busybox.net>; Tue, 16 Aug 2022 17:55:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AD9E882AB6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yTsXDaB2ehlx for <buildroot@lists.busybox.net>;
 Tue, 16 Aug 2022 17:55:43 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 13D4F824F4
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 13D4F824F4
 for <buildroot@busybox.net>; Tue, 16 Aug 2022 17:55:42 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id j8so20310897ejx.9
 for <buildroot@busybox.net>; Tue, 16 Aug 2022 10:55:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=WEPUSV09fUpzdVUQCMV4pjRH3ZRusMSSyqfY098wBSg=;
 b=OfB+1aEax8SvRvigEjPqFBavoMTWg8l4VLDjY1NsmiCpNw/ML7Ex4kURzSjlVaezoO
 6bZRRk0YIIPUn5951jiRw6G7l4OjvdUzjHJrnKokHpzn73kcOSEi51QStOTMmSidBWri
 9kiG8Fr8MSAAfkrMB/8QksD6fmSRxcNyQ3dzUH0plL1v+v7lY5ARLKccwqViCd8tu+ZK
 CluuHkL4HlgeZg6IrI7QzJATaNrxd0NUZhhLdqy1NzUhHqSF5D3neJbwSe3GEP3E8yXk
 gVnVFN/iHiu0IcWHXqLWuS667FmRovQs0ln0c33fsh9oecin16y+Bm49n2XI6KFfJM2f
 Cbew==
X-Gm-Message-State: ACgBeo0b4kQcuPdXucHOOIPGg9KwytduBrh+MhAkKslMkaC/bve1kIkn
 2meQyf+56hetICPhJm+f7cC9g6Rcc9k=
X-Google-Smtp-Source: AA6agR5B1dDMB99negt487U8ysnR+KgmHmSNMqxGAKpM/x+91b5ZZvIuQgdT4WmmZ5gjnSpNrdIbBQ==
X-Received: by 2002:a17:906:7952:b0:732:f993:75bf with SMTP id
 l18-20020a170906795200b00732f99375bfmr14500155ejo.165.1660672540974; 
 Tue, 16 Aug 2022 10:55:40 -0700 (PDT)
Received: from vm22.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id
 e20-20020a50ec94000000b0043c83ac66e3sm8821420edr.92.2022.08.16.10.55.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Aug 2022 10:55:40 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Tue, 16 Aug 2022 19:55:01 +0200
Message-Id: <20220816175503.1280276-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=WEPUSV09fUpzdVUQCMV4pjRH3ZRusMSSyqfY098wBSg=;
 b=ZMFltJNeb7jYfZYbFmVqflBLpesWXMvwNJObG4CF3DCKcejOpmrp2etYQJ6k9Ab4mU
 JX5sN04UVbmFuW2bImeHZQkNjlj2ssgC8QFIySV3YfoJNxPHkLDWOTj4Y+KZqSULbPUV
 0fpHp69dFMMPiFQaBWL1elZkthHNbdFjz8hDcKZAfHtqOnp5ce2SFilpXx30OHrkVzHI
 XWthzv7EgInyToGu84moS/V0n7qNOMsVI0qGxSrHhV8r92S8Kld6korXHw32d5kw7YUH
 WK+UOL2xiXSwDS8GWPO/rDwECFWO3hNJD8uEOxumVF1AXlfL2btiUNp9xN0tLjKz9DBS
 p2Wg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=ZMFltJNe
Subject: [Buildroot] [PATCH v4 0/2] new board LS1028ARDB
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This serie introduces a new board.

The first commit tweak an existing module,
and the second commit introduces the new board.

v3 --> v4
- remove qoriq-cadence-dp-firmware part
- use imx_v8_defconfig from LSDK instead of arm64 default

v2 --> v3
- restore my SoB
- add Reviewed-by Giulio Benetti

v1 --> v2
- add missing udev rules
- improved commit messages
- tweak readme.txt
  - of=/dev/sdX
- minor cleanup in defconfig
  - BR2_TOOLCHAIN_BUILDROOT_GLIBC becomes BR2_TOOLCHAIN_BUILDROOT_WCHAR
  - BR2_PACKAGE_BUSYBOX_SHOW_OTHERS removed

Francois Perrad (2):
  boot/arm-trusted-firmware: allow to generate BL2 from RCW
  board/freescale/ls1028ardb: new board

 DEVELOPERS                                    |  2 +
 board/freescale/ls1028ardb/genimage.cfg       | 23 +++++++
 board/freescale/ls1028ardb/readme.txt         | 60 +++++++++++++++++++
 .../boot/extlinux/extlinux.conf               |  4 ++
 .../rules.d/73-fsl-enetc-networking.rules     | 16 +++++
 boot/arm-trusted-firmware/Config.in           |  6 ++
 .../arm-trusted-firmware.mk                   |  6 ++
 configs/ls1028ardb_defconfig                  | 57 ++++++++++++++++++
 8 files changed, 174 insertions(+)
 create mode 100644 board/freescale/ls1028ardb/genimage.cfg
 create mode 100644 board/freescale/ls1028ardb/readme.txt
 create mode 100644 board/freescale/ls1028ardb/rootfs_overlay/boot/extlinux/extlinux.conf
 create mode 100644 board/freescale/ls1028ardb/rootfs_overlay/etc/udev/rules.d/73-fsl-enetc-networking.rules
 create mode 100644 configs/ls1028ardb_defconfig

-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
