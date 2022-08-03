Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CD5EC19F2C
	for <buildroot@archiver.kernel.org>; Wed,  3 Aug 2022 07:44:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 12FAA81801;
	Wed,  3 Aug 2022 07:44:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 12FAA81801
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id etDPw1MFvIXX; Wed,  3 Aug 2022 07:44:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2F345817A5;
	Wed,  3 Aug 2022 07:44:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2F345817A5
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 28BA71BF4E5
 for <buildroot@lists.busybox.net>; Wed,  3 Aug 2022 07:44:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F15E581678
 for <buildroot@lists.busybox.net>; Wed,  3 Aug 2022 07:44:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F15E581678
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Y7_YwdS7Csta for <buildroot@lists.busybox.net>;
 Wed,  3 Aug 2022 07:44:03 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 254E7812EA
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 254E7812EA
 for <buildroot@busybox.net>; Wed,  3 Aug 2022 07:44:03 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id m4so8141540ejr.3
 for <buildroot@busybox.net>; Wed, 03 Aug 2022 00:44:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1gV7loD45qafHpDLWhpxJfa2I4sMZGwcW4k9D425Bpw=;
 b=pa31R4U+ojNxJkKEcHvAGJP8iWIX5LFU1WTMYwSjxwYbuolDJcKpK2hqkdB24+ZP4X
 xskjj4gDrAd9fDFpfUTL+2IPKdrdGzfndivQmv2xH+LeV2B97oWsv10XwBwEjKK4gdgZ
 q6H7X27zga/06ZNFZiHT+2noFTQTDlKO3p6tTmrdEpFS+LVQ2VuIzra5SP2K89jyqT77
 /o5uZvL9vcKdLza5R/P6CqYOD4dZf15SfvXixtmR9iaUcYQz65HChVKW1zi7hdqHXW29
 PKflzNkkkNGzwmN0p5EknV4Xxc/cXawClvXbYqNrfsiA2F1raLW3xl93Jyg1ElXoLDjO
 pKSQ==
X-Gm-Message-State: ACgBeo2X4B6W9ok/graheHS8dF69D7lX+0UTQFrfCXH0lr4PtatsqBWe
 B4nxiPeMwWJn0JRUw7Kn0/GBl7Qv/yU=
X-Google-Smtp-Source: AA6agR6zYpVQkyVdPfwVwpVTA4tmRW38pQiucuNOwQonklK9v8IO3zz4sbkWiaBEJpZEddpO5rR0zw==
X-Received: by 2002:a17:907:75e7:b0:730:9711:ad80 with SMTP id
 jz7-20020a17090775e700b007309711ad80mr7940182ejc.35.1659512641291; 
 Wed, 03 Aug 2022 00:44:01 -0700 (PDT)
Received: from vm22.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id
 u15-20020aa7d88f000000b0043ccd4d15eesm9173758edq.64.2022.08.03.00.44.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Aug 2022 00:44:00 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Wed,  3 Aug 2022 09:43:46 +0200
Message-Id: <20220803074349.7590-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1gV7loD45qafHpDLWhpxJfa2I4sMZGwcW4k9D425Bpw=;
 b=KlpIWp4X0WaxpVi2eWZM4lJE14RyH4Vt5LeYK20zob9ez6+Bb6pNWFzSfKi8toCpSm
 OHXYZtEeghoM/Sl27pun9jwgIVhE1nGoLi9dY4Adb6EBOA5AuUYp06KntdeUJxJauIjt
 D00gKZVNNwlGJ1noK3NoZk4G3OCyamsdpnG9TlG3fhCwr51KcRtze55WT869WyLSSZ8J
 GnUBIsce7W8t6F1pFBIlXX0QBJQ8kYZVZdLyyoBWUPmn77k3+IvaK/qaGgWY0dM85Vbj
 Mx85qfLBwzNAaSrPYoRGxkcF545kLx71ekBljtpj/hC3xODcHTSS09xqvr3vrrwbZWAZ
 GXfw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=KlpIWp4X
Subject: [Buildroot] [PATCH v2 0/3] new board LS1028ARDB
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
