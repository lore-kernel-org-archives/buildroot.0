Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BB11C433FE
	for <buildroot@archiver.kernel.org>; Fri,  4 Nov 2022 09:17:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1F7A2418A4;
	Fri,  4 Nov 2022 09:17:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1F7A2418A4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QeFIQkfKHTFg; Fri,  4 Nov 2022 09:17:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E775C418A6;
	Fri,  4 Nov 2022 09:17:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E775C418A6
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E48971BF2F0
 for <buildroot@lists.busybox.net>; Fri,  4 Nov 2022 09:17:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BF46A8204C
 for <buildroot@lists.busybox.net>; Fri,  4 Nov 2022 09:17:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BF46A8204C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9FkMMSJaNCj2 for <buildroot@lists.busybox.net>;
 Fri,  4 Nov 2022 09:17:34 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CB36C8204A
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CB36C8204A
 for <buildroot@buildroot.org>; Fri,  4 Nov 2022 09:17:33 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id bs21so6190029wrb.4
 for <buildroot@buildroot.org>; Fri, 04 Nov 2022 02:17:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dTHR4kOCLJyPnsLM9BW/puIupkm89dIIGGrBDNaAGLU=;
 b=C2OkgjQACpMaRrhFguCcxWfuFbftumWrunws/Bge32ZFwMmfIg9BP/ic2bNU4nQ34g
 bIaP9UrBAq896kmj50eNw2jneWUPNEPZ0IcbA/Vd9TkdzT/W1S8IHbSV+3nXaPaojNtr
 0vi+Ps7ogy5JVhZ0mQXwj5p77iVgFbS4bvzS9EMxTixsxr0CoOkAe/Iwx+Xp6LiTpJE3
 izl4x2FR1cgEvNNMDeeRhdx8E/FS6ydWxzTubkcAwMJ7JxxyLwxkLEOcfmcB5jiCXBXX
 VSEhCwddbOdqLkGhGK0J9K7ubMcVuuVYoH5XS/Lo0qW9WDbvKBGZAWqWQLzPTRI3eZq6
 nZkQ==
X-Gm-Message-State: ACrzQf2Xc0AFRt1JyPwAh2t+4D/6xEsG/qIoecwQJFrGzDgSwqRAI6Kn
 QOwjM4hA4ROvt6I61YmVTm4I5sYiYvs4Nw==
X-Google-Smtp-Source: AMsMyM7/Fs99eM1X7OgaYkYfxPym5GCsksvudI6fJCnrkfSlultv5YuKusz7ipZ4scXuw2Pyz1YhVw==
X-Received: by 2002:a05:6000:156e:b0:236:ed91:5354 with SMTP id
 14-20020a056000156e00b00236ed915354mr8756809wrz.203.1667553451642; 
 Fri, 04 Nov 2022 02:17:31 -0700 (PDT)
Received: from angeloc.amarulasolutions.com
 (host085115199111.static.fidoka.tech. [85.115.199.111])
 by smtp.gmail.com with ESMTPSA id
 by13-20020a056000098d00b002383edcde09sm3012137wrb.59.2022.11.04.02.17.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Nov 2022 02:17:31 -0700 (PDT)
From: Angelo Compagnucci <angelo@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Fri,  4 Nov 2022 10:17:24 +0100
Message-Id: <20221104091727.690022-1-angelo@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=dTHR4kOCLJyPnsLM9BW/puIupkm89dIIGGrBDNaAGLU=;
 b=IdKRU7PqcWRwYWSTxCnrok2qhd3LUie/x9E7McCdzFjw3Bf36lqez4VqEpgYP+nu1p
 3itzqvY5iuL/V05vpFiYO/l/3+rPTTr3ZuR08nnX92BcPgQatTTrws4yLShjdG7u5H8H
 51ZlADBmCSna/xwfNIrFTa7iUPH494qU44jzQ=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=IdKRU7Pq
Subject: [Buildroot] [PATCH v3 0/3] Lichee RV and Lichee RV dock support
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
Cc: Angelo Compagnucci <angelo@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Changelog:
v2:
* Renamed the configs from lichee_rv_* to sipeed_lichee_rv_*
* Moved the boards directories intoboard/sipeed
* Added bluetooth support for lichee_rv_dock
* Updated the opensbi, uboot, linux version to the same as nezha

v3:
* Simplified the RTL8723DS-BT package   
* Removed CONFIG_EXTRA_FIRMWARE

Angelo Compagnucci (3):
  package/rtl8723ds-bt: new package
  configs/lichee_rv: new defconfig
  configs/lichee_rv_dock: new defconfig

 board/sipeed/lichee_rv/genimage.cfg           | 37 +++++++++++++
 ...t-building-u-boot.toc1-for-lichee-rv.patch | 54 +++++++++++++++++++
 board/sipeed/lichee_rv/readme.txt             | 26 +++++++++
 board/sipeed/lichee_rv_dock/genimage.cfg      | 37 +++++++++++++
 board/sipeed/lichee_rv_dock/linux.fragment    |  7 +++
 .../overlay/etc/network/interfaces            |  6 +++
 .../overlay/etc/wpa_supplicant.conf           |  8 +++
 ...t-building-u-boot.toc1-for-lichee-rv.patch | 54 +++++++++++++++++++
 ...-d1-lichee-rv-dock-add-bluetooth-bin.patch | 33 ++++++++++++
 board/sipeed/lichee_rv_dock/readme.txt        | 45 ++++++++++++++++
 configs/sipeed_lichee_rv_defconfig            | 34 ++++++++++++
 configs/sipeed_lichee_rv_dock_defconfig       | 42 +++++++++++++++
 package/Config.in                             |  1 +
 package/rtl8723ds-bt/Config.in                |  6 +++
 package/rtl8723ds-bt/rtl8723ds-bt.hash        |  2 +
 package/rtl8723ds-bt/rtl8723ds-bt.mk          | 17 ++++++
 16 files changed, 409 insertions(+)
 create mode 100644 board/sipeed/lichee_rv/genimage.cfg
 create mode 100644 board/sipeed/lichee_rv/patches/uboot/0001-Makefile-HACK-Support-building-u-boot.toc1-for-lichee-rv.patch
 create mode 100644 board/sipeed/lichee_rv/readme.txt
 create mode 100644 board/sipeed/lichee_rv_dock/genimage.cfg
 create mode 100644 board/sipeed/lichee_rv_dock/linux.fragment
 create mode 100644 board/sipeed/lichee_rv_dock/overlay/etc/network/interfaces
 create mode 100644 board/sipeed/lichee_rv_dock/overlay/etc/wpa_supplicant.conf
 create mode 100644 board/sipeed/lichee_rv_dock/patches/uboot/0001-Makefile-HACK-Support-building-u-boot.toc1-for-lichee-rv.patch
 create mode 100644 board/sipeed/lichee_rv_dock/patches/uboot/0002-RISCV-dts-sun20i-d1-lichee-rv-dock-add-bluetooth-bin.patch
 create mode 100644 board/sipeed/lichee_rv_dock/readme.txt
 create mode 100644 configs/sipeed_lichee_rv_defconfig
 create mode 100644 configs/sipeed_lichee_rv_dock_defconfig
 create mode 100644 package/rtl8723ds-bt/Config.in
 create mode 100644 package/rtl8723ds-bt/rtl8723ds-bt.hash
 create mode 100644 package/rtl8723ds-bt/rtl8723ds-bt.mk

-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
