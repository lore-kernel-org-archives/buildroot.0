Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 693F1C28B20
	for <buildroot@archiver.kernel.org>; Fri, 28 Mar 2025 18:04:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0351984A6E;
	Fri, 28 Mar 2025 18:04:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DkE40xMFGgnx; Fri, 28 Mar 2025 18:04:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EC32481F24
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id EC32481F24;
	Fri, 28 Mar 2025 18:04:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 61ADA1B8
 for <buildroot@buildroot.org>; Fri, 28 Mar 2025 18:04:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 53ACA42F10
 for <buildroot@buildroot.org>; Fri, 28 Mar 2025 18:04:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4ah7_aVcfaFl for <buildroot@buildroot.org>;
 Fri, 28 Mar 2025 18:04:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::429; helo=mail-wr1-x429.google.com;
 envelope-from=olteanv@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0683D4F2D8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0683D4F2D8
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0683D4F2D8
 for <buildroot@buildroot.org>; Fri, 28 Mar 2025 18:04:34 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-3912622c9c0so236786f8f.3
 for <buildroot@buildroot.org>; Fri, 28 Mar 2025 11:04:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743185072; x=1743789872;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=aMQ+RQeEJDPUUbUUJlIM5tTbDYxL59J0teG/Skp7WH8=;
 b=m57j0U37KeuIG4ft0YhIVZ8VuvQHjto1WRpzxnkDZBK1RMogmWDUV+wkHw3zDno7FF
 bFgA0x+h/g8iexneTyX2ZqOuXojWEjVb3izGAJQaRZXYKekhQnYJXstEBpMWVTufOE88
 9JitFUyGFt02mtDiBm/S1p78utfBBoAtfEyWkP+r2p44ufmN8Qky1ReznlfHbZFylwFG
 LLnoaNNLws8KSSIynvSwquyFTQt8TAtNkc0VPaZyRyoepCvJHOIRdy2Uhib1Tfcp4H/I
 M/nqBiJfEqNDTqLlEr7Z7Gi40xlwcwqCsZuMfeVeqn8JbFdHQyAjF51ry5VX6mr1c1OA
 p5Pw==
X-Gm-Message-State: AOJu0Yw0x5Wcu6+bB4jpN0naRUSaR14F2b/Rb3xUiFXRohJcE5mvhsec
 He8RqLxGirJN5dpmLnGTFIC+1m9dqYL87U4WVXxqgY/k5WRjkH80Fb8rPxnK
X-Gm-Gg: ASbGncvmIB3foEjf/m5OPElSNsW/n0J2FkN/LoAzLwkxX7d2bDP4jBM+UjKmamwDvpW
 /+ZThlhMkrlnuVM+pX8AWCnfbEa6v4V8mw8BHTD6r4melJk/JdFKqN9kG2xSaLaeayK9SJAwyt5
 eOXhPmZ/t/9ydM3I7EXY+ufZ8iVzfLFKVaQEKNxE9IV4XsUWmuXIpJTLgpISk8ZscbDB6zvWI1k
 Iaf1TI7oLi1VFqbdScfy+EHa4u7iKM4Jr2fkc/QDEqa1Uxnt4ciLJuw3hDoHWDePO9Quq7QVk/z
 uAo8BzKtlWzv1zVax3r+/fawsHQdYgKrh8w76Q==
X-Google-Smtp-Source: AGHT+IHAVmAa13D5B64OlZhaXr2Sk9mFyfMvqHsDULFI+aQ6GG/1vTzXTsz2m2WYt0N0rRZKHQvPeQ==
X-Received: by 2002:a05:600c:1d1b:b0:43b:ca39:a9b8 with SMTP id
 5b1f17b1804b1-43db61d9379mr1270145e9.2.1743185071888; 
 Fri, 28 Mar 2025 11:04:31 -0700 (PDT)
Received: from skbuf.lan ([188.25.110.61]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d90000f48sm34692995e9.37.2025.03.28.11.04.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Mar 2025 11:04:31 -0700 (PDT)
From: Vladimir Oltean <olteanv@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 28 Mar 2025 20:04:08 +0200
Message-ID: <20250328180427.3434693-1-olteanv@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1743185072; x=1743789872; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=aMQ+RQeEJDPUUbUUJlIM5tTbDYxL59J0teG/Skp7WH8=;
 b=gboRp9c+dJyr734VunpP0eL4BfuzbwqRQ9VHNcs7/mxPeU/tJDtZfY4BuJyWHO28R+
 6RXYuJB3Hdk6IP96RV7IuOi136EbRoXZh0vvhf9OG/GwCBn+YHc5qUtAfsvUIWhArb8r
 N7wE9UNNuD7Y+ahvzz6L25vT9SeUJ2gijpd+8G+esS2tOAipLz8C9BYYWFLtClG4ISzK
 7YpTBRdjpEWHeoSySUbNPN3DQmlYH2ejmfbvATuLhRGHhMlhGK4/+eq0645tYIKEG2Eg
 0cV26XPXXrpskMWOQTTs+lPGO72d6Nw1XMyi5chqLvl3boUKYz0EJTsd4wgq7B8brNn5
 xaBQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=gboRp9c+
Subject: [Buildroot] [PATCH v2 00/18] Layerscape uprev to lf-6.12.3-1.0.0,
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
Cc: Ioana Ciornei <ciorneiioana@gmail.com>,
 Brandon Maier <Brandon.Maier@collins.com>, Vincent Jardin <vjardin@free.fr>,
 Julien Olivain <ju.o@free.fr>, Romain Naour <romain.naour@smile.fr>,
 Akhilesh Nema <nemaakhilesh@gmail.com>
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

I have tried to integrate all feedback from v1, but I did not. Yet I am
submitting v2 for review as it currently is, since the amount of changes
is not small, and we can take it from here.

Major change log, more details in individual patches:
- Bump Linux Factory tag to lf-6.12.3-1.0.0
- Merge pull requests submitted to fmlib, rcw, restool through Github
  and include them into this submission
- Support the NXP LX2160A-RDB as a vehicle for pushing this patch set
  forward (v1 had none)

Overview of the set:
LX2160A needs:
- qoriq-ddr-phy-binary: LX2160A-specific package added by patch 13/18
- qoriq-mc-binary: DPAA2 (Layerscape sub-architecture) specific package
  added by patch 14/18
- qoriq-mc-utils: DPAA2-specific package added by patch 15/18
- qoriq-restool: DPAA2-specific package added by patch 16/18
- qoriq-rcw: Layerscape-specific package, updated to latest Linux
  Factory BSP by patch 09/18
On top of the basic SoC support, the RDB needs:
- a package for 25GbE retimer firmware, added by patch 17/18
- board files, added by patch 18/18
Because I updated the common RCW package to the latest BSP tag, I
couldn't leave the other Layerscape platforms (LS1028A, LS1043A, LS1046A)
not completely updated as well. So in addition, we have:
LS1028A, which needs:
- qoriq-cadence-dp-firmware: BSP tag updated in patch 04/18
- other components (linux, u-boot, atf) updated in patch 05/18
LS1043A/LS1046A, which need:
- fmlib: DPAA1 (Layerscape sub-architecture) specific package updated by
  patch 10/18 to the latest BSP
- fmc: DPAA1-specific package updated by patch 11/18 to the latest BSP
- qoriq-fm-ucode: DPAA1-specific package updated by patch 12/18 to the
  latest BSP
- other components (linux, u-boot, atf) updated in patches 06,07,08/18

In addition to the last point. I noticed, while performing the fmc
uprev, that no DPAA1 board defconfig defines it by default. To that end,
I created patches 01,02,03/18 which enable it for LS1043A and LS1046A.

Disclaimer copied from original cover letter:
Although I also work at NXP, I am submitting this in a personal
capacity, and for personal use.

Vladimir Oltean (18):
  configs/ls1046a-frwy: enable the fmc package and dependencies
  configs/ls1046a-rdb: enable the fmc package and dependencies
  configs/ls1043a-rdb: enable the fmc package and dependencies
  package/qoriq-cadence-dp-firmware: sync with NXP Yocto download site
  configs/ls1028ardb: update to lf-6.12.3-1.0.0 tag
  configs/ls1046a-frwy: bump BSP tag to lf-6.12.3-1.0.0
  configs/ls1046a-rdb: bump BSP tag to lf-6.12.3-1.0.0
  configs/ls1043a-rdb: bump BSP tag to lf-6.12.3-1.0.0
  package/qoriq-rcw: bump to lf-6.12.3-1.0.0
  package/fmlib: uprev to lf-6.12.3-1.0.0
  package/fmc: uprev to lf-6.12
  package/qoriq-fm-ucode: uprev to lf-6.12.3-1.0.0
  package/qoriq-ddr-phy-binary: new package
  package/qoriq-mc-binary: new package
  package/qoriq-mc-utils: new package
  package/qoriq-restool: new package
  package/qoriq-firmware-inphi: new package
  board/lx2160ardb: new platform

 DEVELOPERS                                    |   7 +
 .../arm-trusted-firmware.hash                 |   2 +-
 .../ls1028ardb/patches/linux/linux.hash       |   2 +-
 .../ls1028ardb/patches/uboot/uboot.hash       |   2 +-
 board/freescale/ls1028ardb/readme.txt         |  28 ++--
 .../arm-trusted-firmware.hash                 |   2 +-
 .../ls1043a-rdb/patches/linux/linux.hash      |   2 +-
 .../ls1043a-rdb/patches/uboot/uboot.hash      |   2 +-
 board/freescale/ls1043a-rdb/readme.txt        |  28 ++--
 .../arm-trusted-firmware.hash                 |   2 +-
 .../ls1046a-frwy/patches/linux/linux.hash     |   2 +-
 .../ls1046a-frwy/patches/uboot/uboot.hash     |   2 +-
 board/freescale/ls1046a-frwy/readme.txt       |  30 +++--
 .../arm-trusted-firmware.hash                 |   2 +-
 .../ls1046a-rdb/patches/linux/linux.hash      |   2 +-
 .../ls1046a-rdb/patches/uboot/uboot.hash      |   2 +-
 board/freescale/ls1046a-rdb/readme.txt        |  28 ++--
 board/freescale/lx2160ardb/extlinux.conf      |   4 +
 board/freescale/lx2160ardb/genimage.cfg       |  47 +++++++
 .../arm-trusted-firmware.hash                 |   2 +
 .../patches/linux-headers/linux-headers.hash  |   1 +
 .../lx2160ardb/patches/linux/linux.hash       |   2 +
 .../lx2160ardb/patches/uboot/uboot.hash       |   2 +
 board/freescale/lx2160ardb/post-build.sh      |  11 ++
 .../rcw_2200_750_3200_19_5_2_sd.rcw           |  67 ++++++++++
 board/freescale/lx2160ardb/readme.txt         | 124 ++++++++++++++++++
 .../udev/rules.d/74-dpaa2-networking.rules    |  29 ++++
 board/freescale/lx2160ardb/uboot-env.txt      |  77 +++++++++++
 configs/ls1028ardb_defconfig                  |   8 +-
 configs/ls1043a-rdb_defconfig                 |  14 +-
 configs/ls1046a-frwy_defconfig                |  14 +-
 configs/ls1046a-rdb_defconfig                 |  14 +-
 configs/lx2160ardb_defconfig                  |  57 ++++++++
 package/Config.in                             |   5 +
 package/fmc/fmc.hash                          |   2 +-
 package/fmc/fmc.mk                            |   2 +-
 ...conversion-error-and-enum-compare-wa.patch |  79 -----------
 package/fmlib/fmlib.hash                      |   2 +-
 package/fmlib/fmlib.mk                        |   2 +-
 .../qoriq-cadence-dp-firmware.hash            |   2 +-
 .../qoriq-cadence-dp-firmware.mk              |  10 +-
 package/qoriq-ddr-phy-binary/Config.in        |   6 +
 .../qoriq-ddr-phy-binary.hash                 |   3 +
 .../qoriq-ddr-phy-binary.mk                   |  18 +++
 package/qoriq-firmware-inphi/Config.in        |   7 +
 .../qoriq-firmware-inphi.hash                 |   3 +
 .../qoriq-firmware-inphi.mk                   |  18 +++
 package/qoriq-fm-ucode/qoriq-fm-ucode.hash    |   2 +-
 package/qoriq-fm-ucode/qoriq-fm-ucode.mk      |   2 +-
 package/qoriq-mc-binary/Config.in             |  55 ++++++++
 package/qoriq-mc-binary/qoriq-mc-binary.hash  |   3 +
 package/qoriq-mc-binary/qoriq-mc-binary.mk    |  29 ++++
 package/qoriq-mc-utils/Config.in              |  76 +++++++++++
 package/qoriq-mc-utils/qoriq-mc-utils.hash    |   3 +
 package/qoriq-mc-utils/qoriq-mc-utils.mk      |  41 ++++++
 package/qoriq-rcw/qoriq-rcw.hash              |   2 +-
 package/qoriq-rcw/qoriq-rcw.mk                |   2 +-
 package/qoriq-restool/Config.in               |  22 ++++
 package/qoriq-restool/qoriq-restool.hash      |   3 +
 package/qoriq-restool/qoriq-restool.mk        |  25 ++++
 60 files changed, 880 insertions(+), 162 deletions(-)
 create mode 100644 board/freescale/lx2160ardb/extlinux.conf
 create mode 100644 board/freescale/lx2160ardb/genimage.cfg
 create mode 100644 board/freescale/lx2160ardb/patches/arm-trusted-firmware/arm-trusted-firmware.hash
 create mode 120000 board/freescale/lx2160ardb/patches/linux-headers/linux-headers.hash
 create mode 100644 board/freescale/lx2160ardb/patches/linux/linux.hash
 create mode 100644 board/freescale/lx2160ardb/patches/uboot/uboot.hash
 create mode 100755 board/freescale/lx2160ardb/post-build.sh
 create mode 100644 board/freescale/lx2160ardb/rcw_2200_750_3200_19_5_2_sd.rcw
 create mode 100644 board/freescale/lx2160ardb/readme.txt
 create mode 100644 board/freescale/lx2160ardb/rootfs_overlay/etc/udev/rules.d/74-dpaa2-networking.rules
 create mode 100644 board/freescale/lx2160ardb/uboot-env.txt
 create mode 100644 configs/lx2160ardb_defconfig
 delete mode 100644 package/fmlib/0001-Fix-the-integer-conversion-error-and-enum-compare-wa.patch
 create mode 100644 package/qoriq-ddr-phy-binary/Config.in
 create mode 100644 package/qoriq-ddr-phy-binary/qoriq-ddr-phy-binary.hash
 create mode 100644 package/qoriq-ddr-phy-binary/qoriq-ddr-phy-binary.mk
 create mode 100644 package/qoriq-firmware-inphi/Config.in
 create mode 100644 package/qoriq-firmware-inphi/qoriq-firmware-inphi.hash
 create mode 100644 package/qoriq-firmware-inphi/qoriq-firmware-inphi.mk
 create mode 100644 package/qoriq-mc-binary/Config.in
 create mode 100644 package/qoriq-mc-binary/qoriq-mc-binary.hash
 create mode 100644 package/qoriq-mc-binary/qoriq-mc-binary.mk
 create mode 100644 package/qoriq-mc-utils/Config.in
 create mode 100644 package/qoriq-mc-utils/qoriq-mc-utils.hash
 create mode 100644 package/qoriq-mc-utils/qoriq-mc-utils.mk
 create mode 100644 package/qoriq-restool/Config.in
 create mode 100644 package/qoriq-restool/qoriq-restool.hash
 create mode 100644 package/qoriq-restool/qoriq-restool.mk

-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
