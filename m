Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86CD8CA0EFF
	for <buildroot@archiver.kernel.org>; Sat, 30 Aug 2025 17:33:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5B24F607CF;
	Sat, 30 Aug 2025 17:33:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Dh6GczQGe0n9; Sat, 30 Aug 2025 17:33:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6636660765
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6636660765;
	Sat, 30 Aug 2025 17:33:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 25ED010E
 for <buildroot@buildroot.org>; Sat, 30 Aug 2025 17:33:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 18185401FD
 for <buildroot@buildroot.org>; Sat, 30 Aug 2025 17:33:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O0DPxO1VSVaL for <buildroot@buildroot.org>;
 Sat, 30 Aug 2025 17:33:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=olteanv@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 72397401DD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 72397401DD
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 72397401DD
 for <buildroot@buildroot.org>; Sat, 30 Aug 2025 17:33:47 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-45b7c5292caso951655e9.2
 for <buildroot@buildroot.org>; Sat, 30 Aug 2025 10:33:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756575225; x=1757180025;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xMqibIsphrlvJFQ/qit8T7fEgLQL2Ns3UeNyMS6WFZk=;
 b=V0Un+8zI0zVCMcXj9sFhgBhAawgcLnIf8Dcjm3Zg+cjrov3xOL75mJlmehIx15zDWk
 J9mGU/Wx8baj89Y5dcW/Eg6ILjORO1933dZQ16Oc6Au9x8/zLVA0fHp96dYncyCC2lK1
 SbUnFTezDj610lMs9saG0NE0QLUgPSiUhAPaYm4kGwjc6UPt20tnImpxutcXyEtyBVDw
 aMiz+Zt5II88SbLuwv496l/4MMTUbTV8ghxcEM3K0eDM/5PJDzT1gyZ5NrYXfcEnV5Tm
 Cis7AzTZnt5Ap2DWgQy4vVMJWVzfyQCZS++Vgj0j6uB6hVLz/7Ke167pffS/FbB+oiTk
 yfzg==
X-Gm-Message-State: AOJu0Yxf3XrqhHQqYD3nxI8tDEbYN4Cuvg7AW+ur+Wm/m2ypIHnyTUPA
 ++qggGoZUAwExcDM8hWDVja4ycmsFCvQC/Wf7JBaIaPcVJJi4Oe9+/iDc/QNsA==
X-Gm-Gg: ASbGnctmXOQcRnGdjpNDXqHbbdpO5jGHwGDG/SWkoVSHWfz6szQubwbl/WpOd073GTs
 J+jQlWHIDsjrfK0mrjz7MnRKVz+2WzA4khyki44NOtn7xp1JDmH4yTTsSP28wQCZieAvG6Gg1kh
 NNahbnp6aCpdpb4Gd8d1pPPwcq/E36fZSxsCl1cqmHV8/43mqzLm9mSocNPrYnKNumIpHC3zh3B
 oPOlF0dHDtRM/vDWp6Wi09lxewATdSiJbCl1p51yND3Gv3clBzpBzjbRl8qqiVsGxG/lMh/GbwB
 SLtgQJB4Rh/riJo0FT6fCFdzCbpCDnJG1ezamSjs7C+1LOBbeRNfY2RDMG91BfTZS9AcXPVukRD
 U5dvqQ1u8JihAO6t/h7UH
X-Google-Smtp-Source: AGHT+IHPpi6mZk85nooFLw3nRl7weEwkjTSeV8z78wYehS9yr+0dbZdNdvijYAa11ZJFhxQh+dDugQ==
X-Received: by 2002:a05:600c:3486:b0:45b:71fc:75cb with SMTP id
 5b1f17b1804b1-45b802d2fa7mr27322825e9.5.1756575224584; 
 Sat, 30 Aug 2025 10:33:44 -0700 (PDT)
Received: from skbuf.lan ([2a02:2f04:d005:3b00:1070:b6c0:5550:91d9])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45b6f0c6b99sm166708545e9.4.2025.08.30.10.33.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Aug 2025 10:33:43 -0700 (PDT)
From: Vladimir Oltean <olteanv@gmail.com>
To: buildroot@buildroot.org
Cc: Brandon Maier <Brandon.Maier@collins.com>,
 Ioana Ciornei <ciorneiioana@gmail.com>,
 Romain Naour <romain.naour@smile.fr>, Vincent Jardin <vjardin@free.fr>,
 Julien Olivain <ju.o@free.fr>, Akhilesh Nema <nemaakhilesh@gmail.com>
Date: Sat, 30 Aug 2025 20:33:11 +0300
Message-ID: <20250830173313.164981-1-olteanv@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1756575225; x=1757180025; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=xMqibIsphrlvJFQ/qit8T7fEgLQL2Ns3UeNyMS6WFZk=;
 b=UGz6gamBMrRPtDNc8trB5rfZY28aQnREpZWP31NexaNuFJijP9MqPKvfTLm24cQyb0
 b/fKXJta606Ad8goG/GZrs2bTx03VziCPnIf9qjTH20y3lB1QLfpkIabxdnbA7L8ipOL
 L7kqZTUx82fRcjcPY2Y+0pCdw7Za9IR6fSYsx6FvyDHMIxlEMuM0jVChuPuK3VyaARFs
 hkPlUGGlPUeCGnMsE7t/CfY2r7SCprq+s6mrLskZd3+5tg/PVV3XEt2akpDKwsszO8Po
 FlETNTpn7mu8eAfmYx0TFswV6Fla63p7jxuYdhjc3dmrakpmAHZHp2qzME708SJK0ebr
 J5fA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=UGz6gamB
Subject: [Buildroot] [PATCH v4 0/2] Initial LX2160A-RDB support
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

Major v3->v4 change log:
- add BR2_TARGET_UBOOT_NEEDS_GNUTLS=y to lx2160ardb_defconfig
- make sure the qoriq-restool package passes utils/test-pkg

v3 at:
https://lore.kernel.org/buildroot/20250811165531.1533913-1-olteanv@gmail.com/

v2 at:
https://lore.kernel.org/buildroot/20250328180427.3434693-1-olteanv@gmail.com/

Disclaimer copied from original cover letter:
Although I also work at NXP, I am submitting this in a personal
capacity, and for personal use.

Vladimir Oltean (2):
  package/qoriq-restool: new package
  board/lx2160ardb: new platform

 DEVELOPERS                                    |   1 +
 .../common/env-distro-boot-layerscape.txt     |  33 +++++
 board/freescale/common/env-dpaa2.txt          |   6 +
 .../udev/rules.d/74-dpaa2-networking.rules    |  29 ++++
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
 configs/lx2160ardb_defconfig                  |  58 ++++++++
 package/Config.in                             |   1 +
 package/qoriq-restool/Config.in               |  22 +++
 package/qoriq-restool/qoriq-restool.hash      |   3 +
 package/qoriq-restool/qoriq-restool.mk        |  25 ++++
 19 files changed, 479 insertions(+)
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
