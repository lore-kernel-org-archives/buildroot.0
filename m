Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26931CA0ED1
	for <buildroot@archiver.kernel.org>; Mon, 11 Aug 2025 16:55:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D604741170;
	Mon, 11 Aug 2025 16:55:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ULJZ9iJNbuAh; Mon, 11 Aug 2025 16:55:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9388941291
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9388941291;
	Mon, 11 Aug 2025 16:55:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id AAB5D138
 for <buildroot@buildroot.org>; Mon, 11 Aug 2025 16:55:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9BBAD409E0
 for <buildroot@buildroot.org>; Mon, 11 Aug 2025 16:55:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 86Wd2h8vs8ls for <buildroot@buildroot.org>;
 Mon, 11 Aug 2025 16:55:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::633; helo=mail-ej1-x633.google.com;
 envelope-from=olteanv@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 631334012B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 631334012B
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 631334012B
 for <buildroot@buildroot.org>; Mon, 11 Aug 2025 16:55:48 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-af935b052d9so64286766b.0
 for <buildroot@buildroot.org>; Mon, 11 Aug 2025 09:55:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754931346; x=1755536146;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7NNqYx62O7cwPT0hsVb4yoBi6gwNS2olwzgfSsgJ1zo=;
 b=aGn3xwknuE0QYKIA+9TdwAOvfhZ1Tm2w/Yf8gHiXCqXwmQ58XFzEin6FPapbWBrXXn
 V7jaFk63V9fA4O3ye6EqpdTMSw0n9FBk2ueuAiTAXsj35lKVSiZvpokvQ6REWfidiMVk
 cWsJJL33BYzd5VpdazWA9mUecEgBMO1apH9oeWN1DD0k/wzrqs9wCBEXzbvN/iYr1qId
 yYgZxu4hnnSxnHg1QjuEV+ObTG5D0kmiykebu+XGZcBndLnuPeWBe2Ws//J9iNQN3cbK
 ZZVK4/Un6IAd0B0kts2oHANF3SYm5JVnBjk0v1/SFeK38/Lw3u7tcTvzuoRWJ013xcS/
 SWmg==
X-Gm-Message-State: AOJu0YwIcXYvYoxk4OH08Q7Dp1t+n1NqLuFBJ8WCQE2Mq3Yl0jJ6Mpvr
 TACnM1g2CVPHlNTF+7rGjctkaDyca2vXrCTMc11AikuQlzAW4uFTXGHOlsvBxg==
X-Gm-Gg: ASbGncunymmBUqkJHiaJpoZkgukMflsWDYzsR63gbKmu+EYhAq9rYWjVUhz0jiFPEY3
 7BAlxGufLHuf9Xq/Ijz4YNGHfa1cacxvL2z0aCjAsu5T3/LGj/ATkMsha5Lbaz2shY+hOpXvaXn
 SnnlMdS+qVwsWgJcj+8aVW6YGoaFQzUE7DcylcoXUqfuAT/zeoBNhmjE7V0v/CXK5cKJJyH0zD8
 ooSsiovan2o4QNVRKydulAnHFg/VOX0uHBUUBCo8S8f7BKlcRIqSOLsGZpVMr9gybW+vgEm1M2l
 uCpwXkzrjBoflSisAmzg04g4380kTQB97CF+MdStne4CbgqrIUWWWi3jcyYi2TTBfmpZnz1ERRv
 TgV/cG57ATPYuPA4VEqjm+nPPkW0Sbg==
X-Google-Smtp-Source: AGHT+IEoSJ+k+PfS5gg922C8Afredt8ob/oYGoSiq9X5NpiGb6e+lUuFa3Pp4p8VoW/eZDlnkKIgmg==
X-Received: by 2002:a17:906:7954:b0:af9:30b1:aed7 with SMTP id
 a640c23a62f3a-af9dec3bb00mr403521466b.7.1754931345520; 
 Mon, 11 Aug 2025 09:55:45 -0700 (PDT)
Received: from skbuf.lan ([2a02:2f04:d005:3b00:15ff:6865:527:c8f0])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af91a0766e2sm2044629166b.27.2025.08.11.09.55.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Aug 2025 09:55:44 -0700 (PDT)
From: Vladimir Oltean <olteanv@gmail.com>
To: buildroot@buildroot.org
Cc: Brandon Maier <Brandon.Maier@collins.com>,
 Ioana Ciornei <ciorneiioana@gmail.com>,
 Romain Naour <romain.naour@smile.fr>, Vincent Jardin <vjardin@free.fr>,
 Julien Olivain <ju.o@free.fr>, Arnout Vandecappelle <arnout@mind.be>,
 Akhilesh Nema <nemaakhilesh@gmail.com>
Date: Mon, 11 Aug 2025 19:55:20 +0300
Message-ID: <20250811165531.1533913-1-olteanv@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1754931346; x=1755536146; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=7NNqYx62O7cwPT0hsVb4yoBi6gwNS2olwzgfSsgJ1zo=;
 b=QgazViVeOBG0o/lMeEd101p2SebI/Xk5RyyXwymEXbc9fPV0oi3lfs3r7cHaTfkqMs
 UXg01SD8EPXIuiPbockoD2Lz+Skcf6gIJ0pE8ooXUeBLUe2/Tx86b6X/w3X90fQ3vHBs
 xcK2V+WUMSTRMUL5IjIG7gkACTZk9zEC0VeKkEK4XsnU8pollnkORT3MyYc2DjfKcIvM
 3VKWyPnzrDNenvpe3w4VqgKrsAl9p+lPl/FxUDec83m1yEQs0qC7Hu+0ywzmoE+S+Ew8
 d49NmDBMsMkbYxmEtoQerHAXZukoz6BBD4fLoziEqOhLJVxVFi5BxSD3zMGbFJv5FhtF
 9gcw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=QgazViVe
Subject: [Buildroot] [PATCH v3 00/11] Layerscape uprev to lf-6.12.20-2.0.0,
 initial LX2160A-RDB support
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

Hello,

This is logically a continuation of "[PATCH v2 00/11] Initial support
for SolidRun LX2160A-CEX7":
https://lore.kernel.org/buildroot/20241208143802.1048266-1-olteanv@gmail.com/

where I was requested to split out the Layerscape BSP uprev and initial
LX2160A support from the more problematic Solidrun board support.
But as with any splitting of a larger series, the version counter reset
at v1 (which can be found here):
https://lore.kernel.org/buildroot/20250302215219.1276480-1-olteanv@gmail.com/

Major change log, more details in individual patches:
- Bump Linux Factory tag to lf-6.12.20-2.0.0 (patches 01-09)
- Add the remaining DPAA2 components (patch 10)
- Support the NXP LX2160A-RDB as a vehicle for pushing this patch set
  forward (patch 11)

v2 at:
https://lore.kernel.org/buildroot/20250328180427.3434693-1-olteanv@gmail.com/

Disclaimer copied from original cover letter:
Although I also work at NXP, I am submitting this in a personal
capacity, and for personal use.

Vladimir Oltean (11):
  package/qoriq-rcw: bump to version lf-6.12.20-2.0.0
  package/fmc: bump version to lf-6.12.20-2.0.0
  package/fmlib: bump version to lf-6.12.20-2.0.0
  package/qoriq-fm-ucode: bump version to lf-6.12.20-2.0.0
  package/qoriq-ddr-phy-binary: bump version to lf-6.12.20-2.0.0
  configs/ls1028ardb: bump BSP tag to lf-6.12.20-2.0.0
  configs/ls1043a-rdb: bump BSP tag to lf-6.12.20-2.0.0
  configs/ls1046a-rdb: bump BSP tag to lf-6.12.20-2.0.0
  configs/ls1046a-frwy: bump BSP tag to lf-6.12.20-2.0.0
  package/qoriq-restool: new package
  board/lx2160ardb: new platform

 DEVELOPERS                                    |   1 +
 .../common/env-distro-boot-layerscape.txt     |  33 +++++
 board/freescale/common/env-dpaa2.txt          |   6 +
 .../udev/rules.d/74-dpaa2-networking.rules    |  29 ++++
 .../arm-trusted-firmware.hash                 |   2 +-
 .../ls1028ardb/patches/linux/linux.hash       |   2 +-
 .../ls1028ardb/patches/uboot/uboot.hash       |   2 +-
 board/freescale/ls1028ardb/readme.txt         |  17 +--
 .../arm-trusted-firmware.hash                 |   2 +-
 .../ls1043a-rdb/patches/linux/linux.hash      |   2 +-
 .../ls1043a-rdb/patches/uboot/uboot.hash      |   2 +-
 board/freescale/ls1043a-rdb/readme.txt        |  23 ++--
 .../arm-trusted-firmware.hash                 |   2 +-
 .../ls1046a-frwy/patches/linux/linux.hash     |   2 +-
 .../ls1046a-frwy/patches/uboot/uboot.hash     |   2 +-
 board/freescale/ls1046a-frwy/readme.txt       |  23 ++--
 .../arm-trusted-firmware.hash                 |   2 +-
 .../ls1046a-rdb/patches/linux/linux.hash      |   2 +-
 .../ls1046a-rdb/patches/uboot/uboot.hash      |   2 +-
 board/freescale/ls1046a-rdb/readme.txt        |  23 ++--
 board/freescale/lx2160ardb/extlinux.conf      |   4 +
 board/freescale/lx2160ardb/genimage.cfg       |  47 +++++++
 .../arm-trusted-firmware.hash                 |   2 +
 .../patches/linux-headers/linux-headers.hash  |   1 +
 .../lx2160ardb/patches/linux/linux.hash       |   2 +
 .../lx2160ardb/patches/uboot/uboot.hash       |   2 +
 board/freescale/lx2160ardb/post-build.sh      |  11 ++
 .../rcw_2200_750_3200_19_5_2_sd.rcw           |  67 +++++++++
 board/freescale/lx2160ardb/readme.txt         | 129 ++++++++++++++++++
 board/freescale/lx2160ardb/uboot-env.txt      |  36 +++++
 configs/ls1028ardb_defconfig                  |   6 +-
 configs/ls1043a-rdb_defconfig                 |   6 +-
 configs/ls1046a-frwy_defconfig                |   6 +-
 configs/ls1046a-rdb_defconfig                 |   6 +-
 configs/lx2160ardb_defconfig                  |  57 ++++++++
 package/Config.in                             |   1 +
 package/fmc/fmc.hash                          |   2 +-
 package/fmc/fmc.mk                            |   2 +-
 package/fmlib/fmlib.hash                      |   2 +-
 package/fmlib/fmlib.mk                        |   2 +-
 .../qoriq-ddr-phy-binary.hash                 |   2 +-
 .../qoriq-ddr-phy-binary.mk                   |   2 +-
 package/qoriq-fm-ucode/qoriq-fm-ucode.hash    |   2 +-
 package/qoriq-fm-ucode/qoriq-fm-ucode.mk      |   2 +-
 package/qoriq-rcw/qoriq-rcw.hash              |   2 +-
 package/qoriq-rcw/qoriq-rcw.mk                |   2 +-
 package/qoriq-restool/Config.in               |  22 +++
 package/qoriq-restool/qoriq-restool.hash      |   3 +
 package/qoriq-restool/qoriq-restool.mk        |  25 ++++
 49 files changed, 557 insertions(+), 75 deletions(-)
 create mode 100644 board/freescale/common/env-distro-boot-layerscape.txt
 create mode 100644 board/freescale/common/env-dpaa2.txt
 create mode 100644 board/freescale/common/rootfs_overlay/etc/udev/rules.d/74-dpaa2-networking.rules
 create mode 100644 board/freescale/lx2160ardb/extlinux.conf
 create mode 100644 board/freescale/lx2160ardb/genimage.cfg
 create mode 100644 board/freescale/lx2160ardb/patches/arm-trusted-firmware/arm-trusted-firmware.hash
 create mode 120000 board/freescale/lx2160ardb/patches/linux-headers/linux-headers.hash
 create mode 100644 board/freescale/lx2160ardb/patches/linux/linux.hash
 create mode 100644 board/freescale/lx2160ardb/patches/uboot/uboot.hash
 create mode 100755 board/freescale/lx2160ardb/post-build.sh
 create mode 100644 board/freescale/lx2160ardb/rcw_2200_750_3200_19_5_2_sd.rcw
 create mode 100644 board/freescale/lx2160ardb/readme.txt
 create mode 100644 board/freescale/lx2160ardb/uboot-env.txt
 create mode 100644 configs/lx2160ardb_defconfig
 create mode 100644 package/qoriq-restool/Config.in
 create mode 100644 package/qoriq-restool/qoriq-restool.hash
 create mode 100644 package/qoriq-restool/qoriq-restool.mk

-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
