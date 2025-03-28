Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F619C28B20
	for <buildroot@archiver.kernel.org>; Fri, 28 Mar 2025 18:03:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A897242D08;
	Fri, 28 Mar 2025 18:03:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1qEGtV5Mow30; Fri, 28 Mar 2025 18:03:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8F1DC4F2F1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8F1DC4F2F1;
	Fri, 28 Mar 2025 18:03:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id B0FCC12A
 for <buildroot@buildroot.org>; Fri, 28 Mar 2025 18:03:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9A63484830
 for <buildroot@buildroot.org>; Fri, 28 Mar 2025 18:03:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VK3PeowbWAlO for <buildroot@buildroot.org>;
 Fri, 28 Mar 2025 18:03:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=olteanv@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4B25881297
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4B25881297
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4B25881297
 for <buildroot@buildroot.org>; Fri, 28 Mar 2025 18:03:48 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-43cf861f936so3993095e9.3
 for <buildroot@buildroot.org>; Fri, 28 Mar 2025 11:03:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743185026; x=1743789826;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=aMQ+RQeEJDPUUbUUJlIM5tTbDYxL59J0teG/Skp7WH8=;
 b=UHsWS/Z1cCHEX7kgD2kIk0rAb19S8mExSzNubbYCXsMuajDOylBx9QMTMvu9KSwK1b
 hi+LjWw0teofQhXz6+4XZLYA/mz7MoXsv2/WVWuGsljeebm7L4L7e3QeO0ZeqbaCxS+m
 KK1G4AUZ0vGvWVw0DV9GvHquKhbEHK3/al8uLh8cJPbp4fHLlbLy3NKerbcQbaBqRzWI
 PNV4PbZNY3h0PJ1r/CNY5PM9FDw3xynKndZyDvULsn8MfYp6iOiP8lOQ5h0Y0TnA/rmB
 ChrLgwnj7zG/sjB0JAQSej73RIolcJgogb+nJ4KKZ8tdPx/f9RkQhsoM7ZrRQkTvrm5c
 5vYQ==
X-Gm-Message-State: AOJu0YwfLNBRUWaa+1gxFzFBbxYrjWkNSHXxof0Jav2XE1m9AwBB7MMm
 hGFW89NOswAH2K18M8Ya1KsiXPtrl+15tz9S2gOadMrdCUTQHWG/Gi9QUzky
X-Gm-Gg: ASbGncti4OnhQ91M8Ww1E14gyCA/hU2xUDgP1RNSFN4CWVX1pWJ/jhglMQYDwRG+BBX
 d4Q3JJasHtP17YRKLnALeniThjn8gcQATJ2AUPw7VMe5UgwbKSwkjY1JfdDtU4RXElYOenHwiR4
 PbrZ0E3od3e/p57OldPHEGVh9Cy3vaFh9brm9FwqLaAHHR6mE1tt7H7qLqaYxdI6j55ynPxNtna
 Ya5dkYN6SO9j8Wbf2E3aP7CTIDI2F2iHl5IvH3CPLe16w1ZbJfDv8AGlwY0h1tmUQaoY5HWazYu
 q4AVCwaDrjCvxC8KTpJSQIAGyL61Swtx87YKFj0julqIhSl2
X-Google-Smtp-Source: AGHT+IGS4ke1YqkdkDM3iEFVc7NbJsEx2AYStTNWJjHn9caVhNaEDDdYeJm+mZlIbzpeYQLGVJ8uYw==
X-Received: by 2002:a05:600c:c15:b0:43b:c228:1ee0 with SMTP id
 5b1f17b1804b1-43dc9313707mr1357625e9.7.1743185025438; 
 Fri, 28 Mar 2025 11:03:45 -0700 (PDT)
Received: from skbuf.lan ([188.25.110.61]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d8fcd03adsm34748055e9.21.2025.03.28.11.03.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Mar 2025 11:03:43 -0700 (PDT)
From: Vladimir Oltean <olteanv@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 28 Mar 2025 20:03:21 +0200
Message-ID: <20250328180341.3432014-1-olteanv@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1743185026; x=1743789826; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=aMQ+RQeEJDPUUbUUJlIM5tTbDYxL59J0teG/Skp7WH8=;
 b=A8aM2aXce/xhb3q8RtRAF7Iqpzi9m73Ax7sNo3lAL6/861hggFl7Yymi1EoH9m23YJ
 ETIwk8MiKb13U7iwfuAXrmON0KNQ4eZ0Ki8mmY3MGVNebu25zz/HbZSFOtS8GE/3PVEQ
 MCdgdaEpaHVTWhkTzpgmC3+X0I/TeHGv0KSmWcMcwN2YJ0fu7JDKikUma/Ynu3gH6w22
 TLFq2WzFlBqfmd/7vcblWTwDyd5mTnol8PnAyeg82M9ulRvd4Usoa2nXcob3h3ZbGTmh
 g6DlQwpZotnKcfgVS5TshjKH68Zg7Zzo53M5okoC1rcL0dF6IaBKSEgStZkzDDZ576j2
 LQHw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=A8aM2aXc
Subject: [Buildroot] [PATCH v2 00/18] Layerscape uprev to lf-6.6.52-2.2.0,
 initial LX2160A support
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
