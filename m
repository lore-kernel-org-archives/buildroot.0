Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5660C19F28
	for <buildroot@archiver.kernel.org>; Wed,  3 Aug 2022 19:47:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4EB6860760;
	Wed,  3 Aug 2022 19:47:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4EB6860760
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id c4qS7hwCyXAR; Wed,  3 Aug 2022 19:47:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CC1DE606E6;
	Wed,  3 Aug 2022 19:47:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CC1DE606E6
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6453C1BF5DC
 for <buildroot@lists.busybox.net>; Wed,  3 Aug 2022 19:47:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3F577812F6
 for <buildroot@lists.busybox.net>; Wed,  3 Aug 2022 19:47:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3F577812F6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FTiYUF00vKdm for <buildroot@lists.busybox.net>;
 Wed,  3 Aug 2022 19:47:24 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6B8D381298
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6B8D381298
 for <buildroot@busybox.net>; Wed,  3 Aug 2022 19:47:24 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id uj29so20128412ejc.0
 for <buildroot@busybox.net>; Wed, 03 Aug 2022 12:47:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=g5zlmuLvszgzk/cVyxNnNdLeUsM6YNjyt8agH9UwORE=;
 b=Zri0MW8cBdG0m3MZSPN2UR2G0jVPZXXSJx7toFVBS7xVZTZkHKzbJ9rn9zRcsLDG4h
 MQDM1TK4Cgy4BB1PDgoviItlHDM4+5dBlsy+x7HHsq5wmU0hH1vlT5Ub6X4DY6Cqv002
 dCD/ZTCcAQZcztRGrcX2tblFhFwDIHvNR9zJTVJCYz0vMuQMZGlZQj0DO0zsqqQ4z4mD
 /vNrIJQpL00GYNiSGUiRhes0ykeh01IF4N5y6P+iDSeRtkdFN7ZKZGG6a5O6wpCDB98H
 EYacfA6/05Zny9OKsIGjc0mS8qDgCCYUjcpO4OxuiJKNUfpg/cvGLcnx36YHOfLpPzrb
 Eybw==
X-Gm-Message-State: ACgBeo2WDnfffkUj/i1OiMKkQ9p9bm2Otr2IwbX2lk9KKcnLWwQhR6U+
 eKQqg097vMZ44IAJp6cimzjxQMWY71c=
X-Google-Smtp-Source: AA6agR4nJ47AR90kFMdfbCgpGPv/Exd8GYktkXbZbUEAciZ+gDkBmBZtDSTt8+pSeJxESiMZLD8Sfw==
X-Received: by 2002:a17:907:e8d:b0:730:a4e8:27ed with SMTP id
 ho13-20020a1709070e8d00b00730a4e827edmr6223875ejc.58.1659556042567; 
 Wed, 03 Aug 2022 12:47:22 -0700 (PDT)
Received: from vm22.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id
 f14-20020a17090631ce00b006f3ef214daesm7563490ejf.20.2022.08.03.12.47.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Aug 2022 12:47:22 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Wed,  3 Aug 2022 21:46:12 +0200
Message-Id: <20220803194615.9209-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=g5zlmuLvszgzk/cVyxNnNdLeUsM6YNjyt8agH9UwORE=;
 b=AJt0+hFcQox3aSDNMBezhJHAYK0eNIFSnJjNaDZWM7sPn/8cbV1xLsMcT4GxN0/tLB
 jDaXmaUoahWOa87yBX8hsMoDdR7+kYNgnAGS4wYgoXyuOOJnNdILCmY4PHlQ8ZzK9mKo
 ZMLc8NMYzt7XX8Y0NLIFf+hFss2oRM0ZvpG3jHg45OB1iJLh9M3lQ9LhBI7Zxq5qr2zL
 R1ek19K62r/wuHS9wfo2/BefJmBqcegga4eMlYlmwDN1kLSsvvNwa8sq6EnHmbQv6yVs
 wRaQEzLkPLZB7PBUdeC21Aj2RirJpm17P07EFwtS2lFcV2bUNFk2llTs3ll7huuhDCS/
 gFLQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=AJt0+hFc
Subject: [Buildroot] [PATCH v3 0/3] new board LS1028ARDB
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

The two first commits tweak some existing modules,
and the third commit introduces the new board.

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

Francois Perrad (3):
  boot/arm-trusted-firmware: allow to generate BL2 from RCW
  package/qoriq-cadence-dp-firmware: add install in target
  board/freescale/ls1028ardb: new board

 DEVELOPERS                                    |  2 +
 board/freescale/ls1028ardb/genimage.cfg       | 23 +++++++
 board/freescale/ls1028ardb/readme.txt         | 60 +++++++++++++++++++
 .../boot/extlinux/extlinux.conf               |  4 ++
 .../rules.d/73-fsl-enetc-networking.rules     | 16 +++++
 boot/arm-trusted-firmware/Config.in           |  6 ++
 .../arm-trusted-firmware.mk                   |  6 ++
 configs/ls1028ardb_defconfig                  | 60 +++++++++++++++++++
 .../qoriq-cadence-dp-firmware.mk              |  6 ++
 9 files changed, 183 insertions(+)
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
