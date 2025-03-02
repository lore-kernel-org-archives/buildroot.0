Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCD2FC282CD
	for <buildroot@archiver.kernel.org>; Sun,  2 Mar 2025 21:52:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 19D1F4134F;
	Sun,  2 Mar 2025 21:52:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yiA3ADgBz46i; Sun,  2 Mar 2025 21:52:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 74D4240D86
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 74D4240D86;
	Sun,  2 Mar 2025 21:52:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id E0A46958
 for <buildroot@buildroot.org>; Sun,  2 Mar 2025 21:52:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DA99140529
 for <buildroot@buildroot.org>; Sun,  2 Mar 2025 21:52:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GXlMqcKDXg9V for <buildroot@buildroot.org>;
 Sun,  2 Mar 2025 21:52:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=olteanv@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 56C974022B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 56C974022B
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 56C974022B
 for <buildroot@buildroot.org>; Sun,  2 Mar 2025 21:52:36 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-4394944f161so4365775e9.3
 for <buildroot@buildroot.org>; Sun, 02 Mar 2025 13:52:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740952354; x=1741557154;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=CCzmKuaqlETYusmMZmtxFTmky0qilcN22u+Wkw4bqXE=;
 b=hnBrLhGFQRTcQqtt5/2fffuHxR68qIrKDwBORNdk/3f2VmsgPndSL6s17hfY6li6yW
 D8uasxjCFn2XpBkazEwTnpsqxPpTfkD9n/vjtZwibEaeKwGvrX2yj6fwcZ47mIzBmczP
 O5S00ld3Zy0cxJI/CXNUmkL4GnaqJn2y/8BUUgrItfjds8g/ngEkLeM1qDALUkZBo646
 4+kfbgm8O4bk2d7/AchfIYgf7QT9tKVGdy8vLYY8/TDCMew4zNTHHMBeNeAL9o/LsL29
 kV3fF5eoaFTuAYKoCuypaBBGbkMOuLBDpql70NLsfHhhg7rXi7VqGXpCA3o9sRvxTW5C
 pLdQ==
X-Gm-Message-State: AOJu0Yyanc8RK0MCvHoebYWTT7xCvmOBACmoSA1sZN1Z6/9POCtfwheJ
 A7opQ2Ze+hJ3SugVopaKu43iRnCdxDyCdVfA4D8aPlOHBITOV4+tV64z9aml
X-Gm-Gg: ASbGncvfG0gLKZj1mxtZJi+fLK4j26QYGEEzcLW45qobLmD1UQXIFlrjBxjXt9s/xjX
 0OhSDbdoSGtiChzBUN8k+g4kAA7AF6k3isQ5v7uf0Z3rc2neodMVAOv6pS61P7VoRqMCraiGuXZ
 Xf8YdrT7XBs5weckzVEqSQAoA+AuxtJUnGQtx6xnZGfqX12cIb+XMXkTWSaQRdF2jDw2h9GoS92
 7kq2nvaDTqRvjr1we9fHEZx6JrczEmKb+ovpOLOq5DdhNrkigigXXIaexf3x2aczxRVuRlwELGn
 SHeaCLIHxUNgbe+uI9caaAxLyjEnHSDTZCQhbw==
X-Google-Smtp-Source: AGHT+IFZOxn7Py2ufJN+RNor31aRLjHyksWtL18JpLLWJWl1I1KzJfaIGvd7nMaBabH12lewfTVXAA==
X-Received: by 2002:a05:600c:3b04:b0:439:9c0e:36e6 with SMTP id
 5b1f17b1804b1-43ba6766c69mr37639655e9.3.1740952353471; 
 Sun, 02 Mar 2025 13:52:33 -0800 (PST)
Received: from skbuf.lan ([86.127.124.81]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43ab2cb1063sm113389645e9.2.2025.03.02.13.52.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Mar 2025 13:52:31 -0800 (PST)
From: Vladimir Oltean <olteanv@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  2 Mar 2025 23:52:04 +0200
Message-ID: <20250302215219.1276480-1-olteanv@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740952354; x=1741557154; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=CCzmKuaqlETYusmMZmtxFTmky0qilcN22u+Wkw4bqXE=;
 b=T5+pa1RXHGJDX8Bs3yPv6u4ze3kVD2zTsbTJRc0ZOMk052OLgDq+BdWfyDgDiuxfUN
 KX/YhzWlK71FnDyZNNrD2XtREFci15CwxuV3mtv2CvLjQWkKHKa4zNw7dqfkzTa6TPx7
 XYqEegRqBzkfq0Yy9s+WTg7PtZcU2mKr38Ru8XbAdgtrCR5fea/haMfES8Tkfo4Br+5r
 eUYFkpiwEPp6z9rrAgjrRrrhGEy6lsYJU7rpbyNzVU/4XLrCHOr9GZhdcbBnkbgDAg3i
 3sjT8oAVUHDwfRCc/aU5lxWg1yXwfy3btRZ2McoUHW6tf/XSX3dNX+qBXzGPAV9QoeUT
 BNcA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=T5+pa1RX
Subject: [Buildroot] [PATCH 00/15] Layerscape uprev to lf-6.6.52-2.2.0,
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
But as with any splitting of a larger series, the version counter resets
here at one.

Overview of the set:
LX2160A needs:
- qoriq-ddr-phy-binary: LX2160A-specific package added by patch 04/15
- qoriq-mc-binary: DPAA2 (Layerscape sub-architecture) specific package
  added by patch 05/15
- qoriq-mc-utils: DPAA2-specific package added by patch 06/15
- qoriq-restool: DPAA2-specific package added by patch 07/15
- qoriq-rcw: Layerscape-specific package, updated to latest Linux
  Factory BSP by patch 01/15
Because I updated the common RCW package to the latest BSP tag, I
couldn't leave the other Layerscape platforms (LS1028A, LS1043A, LS1046A)
not completely updated as well. So in addition, we have:
LS1028A, which needs:
- qoriq-cadence-dp-firmware: BSP tag updated in patch 02/15
LS1043A/LS1046A, which need:
- fmlib: DPAA1 (Layerscape sub-architecture) specific package updated by
  patch 08/15 to the latest BSP
- fmc: DPAA1-specific package updated by patch 09/15 to the latest BSP
- qoriq-fm-ucode: DPAA1-specific package updated by patch 10/15 to the
  latest BSP

In addition to the last point. I noticed, while performing the fmc
uprev, that no DPAA1 board defconfig defines it by default. To that end,
I created patches 13-15/15 which enable it for LS1043A and LS1046A.
Also, I noticed that the tclap package (a fmc dependency) has
autotools-related compilation issues for me, which were solved by
updating to the newest upstream revision. This no longer uses autotools
at all, but CMake.

Change logs in individual patches, where applicable.

Disclaimer copied from original cover letter:
Although I also work at NXP, I am submitting this in a personal
capacity, and for personal use.

Vladimir Oltean (15):
  package/qoriq-rcw: update to tag lf-6.6.52-2.2.0
  package/qoriq-cadence-dp-firmware: sync with NXP Yocto download site
  configs/ls1028ardb: update to lf-6.6.52-2.2.0 tag
  package/qoriq-ddr-phy-binary: new package
  package/qoriq-mc-binary: new package
  package/qoriq-mc-utils: new package
  package/qoriq-restool: new package
  package/fmlib: bump to tag lf-6.6.52-2.2.0
  package/fmc: bump to version lf-6.6.52-2.2.0
  package/qoriq-fm-ucode: bump to tag lf-6.6.52-2.2.0
  configs/ls1046a-frwy: update to tag lf-6.6.52-2.2.0
  package/tclap: update to tag 1.4.0-rc2
  configs/ls1046a-frwy: enable the fmc package and dependencies
  configs/ls1046a-rdb: enable the fmc package and dependencies
  configs/ls1043a-rdb: enable the fmc package and dependencies

 DEVELOPERS                                    |  6 +++
 .../arm-trusted-firmware.hash                 |  2 +-
 .../ls1028ardb/patches/linux/linux.hash       |  2 +-
 .../ls1028ardb/patches/uboot/uboot.hash       |  2 +-
 board/freescale/ls1028ardb/readme.txt         | 27 +++++++----
 .../arm-trusted-firmware.hash                 |  2 +-
 .../ls1046a-frwy/patches/linux/linux.hash     |  2 +-
 .../ls1046a-frwy/patches/uboot/uboot.hash     |  2 +-
 board/freescale/ls1046a-frwy/readme.txt       | 31 ++++++++----
 configs/ls1028ardb_defconfig                  |  6 +--
 configs/ls1043a-rdb_defconfig                 |  4 ++
 configs/ls1046a-frwy_defconfig                | 10 ++--
 configs/ls1046a-rdb_defconfig                 |  4 ++
 package/Config.in                             |  4 ++
 package/fmc/fmc.hash                          |  4 +-
 package/fmc/fmc.mk                            |  4 +-
 package/fmlib/fmlib.hash                      |  4 +-
 package/fmlib/fmlib.mk                        |  4 +-
 .../qoriq-cadence-dp-firmware.hash            |  2 +-
 .../qoriq-cadence-dp-firmware.mk              | 10 ++--
 package/qoriq-ddr-phy-binary/Config.in        |  6 +++
 .../qoriq-ddr-phy-binary.hash                 |  3 ++
 .../qoriq-ddr-phy-binary.mk                   | 18 +++++++
 package/qoriq-fm-ucode/qoriq-fm-ucode.hash    |  2 +-
 package/qoriq-fm-ucode/qoriq-fm-ucode.mk      |  2 +-
 package/qoriq-mc-binary/Config.in             | 47 +++++++++++++++++++
 package/qoriq-mc-binary/qoriq-mc-binary.hash  |  3 ++
 package/qoriq-mc-binary/qoriq-mc-binary.mk    | 22 +++++++++
 package/qoriq-mc-utils/Config.in              | 37 +++++++++++++++
 package/qoriq-mc-utils/qoriq-mc-utils.hash    |  3 ++
 package/qoriq-mc-utils/qoriq-mc-utils.mk      | 22 +++++++++
 package/qoriq-rcw/qoriq-rcw.hash              |  2 +-
 package/qoriq-rcw/qoriq-rcw.mk                |  2 +-
 package/qoriq-restool/Config.in               | 22 +++++++++
 package/qoriq-restool/qoriq-restool.hash      |  3 ++
 package/qoriq-restool/qoriq-restool.mk        | 24 ++++++++++
 package/tclap/tclap.hash                      |  2 +-
 package/tclap/tclap.mk                        |  5 +-
 38 files changed, 305 insertions(+), 52 deletions(-)
 create mode 100644 package/qoriq-ddr-phy-binary/Config.in
 create mode 100644 package/qoriq-ddr-phy-binary/qoriq-ddr-phy-binary.hash
 create mode 100644 package/qoriq-ddr-phy-binary/qoriq-ddr-phy-binary.mk
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
