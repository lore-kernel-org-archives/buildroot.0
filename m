Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEE9FE77173
	for <buildroot@archiver.kernel.org>; Sun,  8 Dec 2024 14:38:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 317A5406BC;
	Sun,  8 Dec 2024 14:38:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VxE3ihO-PdHI; Sun,  8 Dec 2024 14:38:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E6745406C2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E6745406C2;
	Sun,  8 Dec 2024 14:38:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id DA43C979
 for <buildroot@buildroot.org>; Sun,  8 Dec 2024 14:38:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C8A46608E3
 for <buildroot@buildroot.org>; Sun,  8 Dec 2024 14:38:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FurPaZAIIQq6 for <buildroot@buildroot.org>;
 Sun,  8 Dec 2024 14:38:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52a; helo=mail-ed1-x52a.google.com;
 envelope-from=olteanv@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org CC0D2608BB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CC0D2608BB
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CC0D2608BB
 for <buildroot@buildroot.org>; Sun,  8 Dec 2024 14:38:25 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-5d3c1f68ef1so342094a12.1
 for <buildroot@buildroot.org>; Sun, 08 Dec 2024 06:38:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733668703; x=1734273503;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ls6L5LmzLjodmfRqYeN/srpBj77yqvjzE+/EuzkzJOU=;
 b=G9b81Wdouqw/MCWi5u3/JCzYpDclYdu9WZmcqgP7qsiu55r+7gQwrLT/RvEpwPXmTi
 VjgJwl3ItfrQ82gM+wqj2c0R8/ef9dCvyGQk3vTEjLkfo0TGKvu5sluu5YS8h4JBiEid
 ZTkYO5dS/TQo2GBiRxb5UJ2yAoDKOFAIyUyXu+4SAI0jXD0yC01olIUFYj9lsSujK/4i
 ZaMO5LNaT+OGhbUCQUmmwACPaReYSJP20LiJI/WMaHz+i9uVh/X9QLP+/9i28S+KghS9
 oIqsA2Jke6rzg8/6zmgSC7PuhIYp+Q5WWOUbPhldfato3OioP34+a+rykWk+k4SZLkW2
 yjmw==
X-Gm-Message-State: AOJu0Yx8f1mqi2AYce+4qOnQxGrOkRiw/UNW8lTyaVZNoGXgJiq+9Ezk
 /xoZvpGyBw1aPg9JpV4BtaQanQ4Dg7eqasN61VvVISbw3MEiOcX5NYP8iA==
X-Gm-Gg: ASbGnctC0kiN7qrI0SNkPBDTPpRAIZGAeBPdL7VZX/b0LBiFus35DeJxNBH5U/a/Qv6
 eSu7nb4tTvlTmiCOYwNcBx++iXZC7s4UPMmUbG/3ikFWuRxm6CkeT/NYvsQ9+XQ3skUTepRuTjn
 mT0lld4vC94u/ZjuhnEEum1wYl4XsZgvxGDJfXyXKCn7W9jdQazcSsZ8pBJJcrYrStzgbsOgSIh
 pbRNk5A9Rx5oWHN2au7PGANky1Najd+vdkiMVPf1Sg=
X-Google-Smtp-Source: AGHT+IE/p1OpMLiv7SgluBFPJDyj4jIiuevwcBxN6d+IUpLEXj+087XCxTUzX+fxrIMnz5ApJjHysQ==
X-Received: by 2002:a17:907:3e0e:b0:a9a:2afc:e4ef with SMTP id
 a640c23a62f3a-aa63a0722e8mr383178666b.7.1733668703043; 
 Sun, 08 Dec 2024 06:38:23 -0800 (PST)
Received: from skbuf.lan ([86.127.124.81]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa666cf5743sm204660366b.65.2024.12.08.06.38.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Dec 2024 06:38:22 -0800 (PST)
From: Vladimir Oltean <olteanv@gmail.com>
To: buildroot@buildroot.org
Cc: Brandon Maier <Brandon.Maier@collins.com>,
 Rabeeh Khoury <rabeeh@solid-run.com>, Josua Mayer <josua@solid-run.com>,
 Ioana Ciornei <ciorneiioana@gmail.com>
Date: Sun,  8 Dec 2024 16:37:51 +0200
Message-ID: <20241208143802.1048266-1-olteanv@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1733668703; x=1734273503; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ls6L5LmzLjodmfRqYeN/srpBj77yqvjzE+/EuzkzJOU=;
 b=HC4KfaEkKQJehNlborS9aHp4s2D+IzWumMXTtu7sFjl8wJFKeSVBOwsXNd6KXtkf8R
 MOryXIZsKwS7c5IV0ecdpKW6zykVqSj9djT2utg2L9WF5PuruRYwnC9eHEP8ypgjIRgk
 bnB8Em+PCiFRF9ZlqOqkNGA+5MdmjKHYDJxbQfaicAv/JCtr92GQrwmNzpTe3CPOyI01
 Dk1D6Ew6fT2KWvq3bs9u8/OYZLO9GxfrTGaYw8kUKKkFQgjtdeMtmV3W2gLtfvQudkuP
 9k3pYcDolYq/RORax78EH+gIv9t1oBVvWnTsXo3eVARWAk6CuivSPgHXQWECAyIE/SmZ
 jSJg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=HC4KfaEk
Subject: [Buildroot] [PATCH v2 00/11] Initial support for SolidRun
 LX2160A-CEX7
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

This series aims to introduce basic initial support for the CX LX2
and HoneyComb LX2 boards by SolidRun (both of which are based on the
LX2160A-CEX7 SoM):
https://shop.solid-run.com/product/SRLX216S00D00GE064C08CH/
https://shop.solid-run.com/product/SRLX216S00D00GE064H09CH/

Although I also work at NXP, I am submitting this in a personal
capacity, and for personal use.

Patch 1/11 performs an uprev of existing NXP Layerscape BSP packages to
the latest tag. This is necessary because packages such as the RCW do
not permit versioning per board defconfig like Linux/U-Boot/ATF do,
instead the version is global. I've tested the uprev on an LS1028A-RDB.

Patches 2-5/11 add extra packages which are critical for the operation
of the NXP LX2160A SoC.

Patch 6/11 introduces the board files for the new platform, excepting
patches for the firmware components, which are separated out to 7-10/11
(for mailing list filtering reasons).

In my use case, Buildroot makes the firmware and recovery Linux rootfs
for the main Debian operating system.

Note that the platform doesn't achieve everything that I wish just yet.
For example, U-Boot doesn't boot properly from a USB stick with a Debian
installer on it.

To launch the Debian installer, U-Boot attempts to push its own device
tree to Linux (and that doesn't go very well, because they have
partially incompatible formats). Thus, one would need to uprev the
bootloader to the current upstream master branch, rather than continue
developing on top of NXP Linux Factory tags, then sync the U-Boot device
trees with Linux, and upstream that work.

For this reason, the entire effort should be considered WIP, though in
itself, it is bootable and usable. I am submitting relatively early
because the speed of development in Buildroot appears fast, and the
existing work would go out of sync quickly. I intend to work with
Josua Mayer for developing further U-Boot/ATF patches, and including
them in Buildroot only once they are available through
https://github.com/SolidRun/lx2160a_build/, rather than Buildroot
behaving as its own upstream of sorts.

Finally, patch 11/11 is a cleanup made as I noticed that
board/freescale/common/patches has become a leftover since I started
working on the LX2160ACEX7 support.

Change logs are in individual patches.

Vladimir Oltean (11):
  platform/layerscape: bump Linux Factory tag to lf-6.6.36-2.1.0
  package/qoriq-ddr-phy-binary: new package
  package/qoriq-mc-binary: new package
  package/qoriq-mc-utils: new package
  package/qoriq-restool: new package
  board/lx2160acex7: new platform
  board/lx2160acex7: add Arm Trusted Firmware patches
  board/lx2160acex7: Add qoriq-mc-utils patches
  board/lx2160acex7: add qoriq-rcw patches
  board/lx2160acex7: add u-boot patches
  board/freescale: get rid of common patch folder

 DEVELOPERS                                    |    6 +
 ...Makefile-Suppress-array-bounds-error.patch |   51 -
 .../arm-trusted-firmware.hash                 |    2 +-
 .../ls1028ardb/patches/linux/linux.hash       |    2 +-
 .../ls1028ardb/patches/uboot/uboot.hash       |    2 +-
 board/freescale/ls1028ardb/readme.txt         |   27 +-
 .../arm-trusted-firmware.hash                 |    2 +-
 .../ls1046a-frwy/patches/linux/linux.hash     |    2 +-
 .../ls1046a-frwy/patches/uboot/uboot.hash     |    2 +-
 board/freescale/ls1046a-frwy/readme.txt       |   31 +-
 board/solidrun/lx2160acex7/extlinux.conf      |    4 +
 board/solidrun/lx2160acex7/genimage.cfg       |   54 +
 board/solidrun/lx2160acex7/linux.config       |    5 +
 .../0001-plat-nxp-lx2160a-auto-boot.patch     |  219 +
 ...ccount-MEM_PLL_CFG_SHIFT-for-ddr-fre.patch |   85 +
 ...sert-SUS_S5-GPIO-to-poweroff-the-COM.patch |   29 +
 ...assert-IRQ0-GPIO-to-poweroff-the-EVB.patch |   29 +
 ...ptional-S5-gpio-from-Makefile-consta.patch |   63 +
 ...te-platform-for-solidrun-cex7-module.patch |  418 ++
 ...flexible-value-for-CONFIG_DDR_NODIMM.patch |   33 +
 ...tform-for-solidrun-internal-cex6-eva.patch |  544 +++
 ...ort-flushing-i2c-bus-before-ddr-init.patch |  365 ++
 ...h-i2c-bus-with-spd-eeprom-before-ddr.patch |   30 +
 ...h-i2c-bus-with-spd-eeprom-before-ddr.patch |   30 +
 ...-building-without-NXP_NV_SW_MAINT_LA.patch |   49 +
 ...-boot-without-spi-flash-disable-non-.patch |   33 +
 ...te-platform-for-solidrun-lx2162a-som.patch |  597 +++
 ...ddr-configuration-for-pcb-v1.2-with-.patch |  127 +
 ...g-output-for-dimm-parameters-parsed-.patch |   83 +
 ...dq-mapping-and-remove-invalid-spd-ee.patch |   36 +
 ...d-support-for-new-binutils-versions.patch} |    0
 .../arm-trusted-firmware.hash                 |    2 +
 .../patches/linux-headers/linux-headers.hash  |    1 +
 .../lx2160acex7/patches/linux/linux.hash      |    2 +
 ...x2160-cex7-based-clearfog-cx-dpl-dpc.patch |  937 +++++
 ...160-cex6-based-evaluation-board-dpl-.patch | 1454 +++++++
 ...n-for-lx2162a-som-and-clearfog-board.patch | 3622 +++++++++++++++++
 ...som-clearfog-enable-dpni-connections.patch |  188 +
 ...rfog-cx-configure-qsfp-ports-type-ph.patch |   52 +
 ...n-solidrun-lx2160a-cex-7-on-clearfog.patch |  950 +++++
 ...-MEM_PLL_CFG-into-ddr-speed-specific.patch |  112 +
 ...separate-configurations-for-flexspi-.patch |  894 ++++
 ...me-sdhc1-config-to-generic-sdhc-for-.patch |  149 +
 ...c-jumpc-and-jump-to-pbi-instructions.patch |   55 +
 ...add-configuration-for-both-sdhc-xspi.patch |  836 ++++
 ...ootlocptr-reduce-size-of-pbi-section.patch |   90 +
 ...ge-2.2GHz-configuration-platform-clo.patch |  475 +++
 ...configuration-for-fraction-ddr-speed.patch |  420 ++
 ...n-solidrun-internal-lx2160a-cex6-eva.patch |  220 +
 ...le-A-050426-workaround-for-silicon-o.patch |   35 +
 ...le-pci-errata-workarounds-for-all-ac.patch |   87 +
 ...-configuration-for-2.2GHz-binned-soc.patch |   42 +
 .../0014-lx2162aqds-re-enable-dpmac11.patch   |   27 +
 ...n-for-lx2162a-som-and-clearfog-evalu.patch |  532 +++
 ...rfog-cx-add-configuration-for-serdes.patch | 2000 +++++++++
 ...configuration-for-serdes-1-protocol-.patch |   49 +
 ...ipt-generating-configs-from-template.patch | 1476 +++++++
 ...rfog-cx-add-configuration-for-serdes.patch | 1611 ++++++++
 ...add-configuration-for-each-ddr-speed.patch |  285 ++
 ...d-solidrun-lx2160-cex7-board-support.patch | 1342 ++++++
 ...ait-100ms-for-Link-Up-in-ls_pcie_g4_.patch |   65 +
 ...t-100ms-for-Link-Up-in-ls_pcie_probe.patch |   64 +
 ...-calculation-of-ddr-clock-rate-to-in.patch |   63 +
 ...able-workaround-for-SPI-erratum-A-05.patch |  102 +
 ...x2160-cex7-enable-additional-drivers.patch |   96 +
 ...on-t-fail-boot-when-reading-eeprom-f.patch |   32 +
 ...x2160-cex7-fixup-u-boot-dts-dpmac-by.patch |  389 ++
 ...x2160acex7-enable-reading-tlv-eeprom.patch |   40 +
 ...x2160acex7-disable-second-usb-on-lx2.patch |   32 +
 ...x2160acex7-allocate-memory-before-pa.patch |   39 +
 ...upport-specifying-tlv-eeprom-in-DT-a.patch |   58 +
 ...x2160acex7-use-dt-alias-for-tlv-eepr.patch |   90 +
 ...om-fix-alias-access-to-second-eeprom.patch |   32 +
 .../lx2160acex7/patches/uboot/uboot.hash      |    2 +
 board/solidrun/lx2160acex7/post-build.sh      |    8 +
 board/solidrun/lx2160acex7/readme.txt         |  112 +
 .../udev/rules.d/74-dpaa2-networking.rules    |   12 +
 .../lx2160acex7/u-boot-environment-sd.txt     |   96 +
 configs/ls1028ardb_defconfig                  |    6 +-
 configs/ls1046a-frwy_defconfig                |    6 +-
 configs/solidrun_lx2160acex7_defconfig        |   53 +
 package/Config.in                             |    4 +
 package/fmc/fmc.hash                          |    2 +-
 package/fmc/fmc.mk                            |    2 +-
 package/fmlib/fmlib.hash                      |    2 +-
 package/fmlib/fmlib.mk                        |    2 +-
 .../qoriq-cadence-dp-firmware.hash            |    2 +-
 .../qoriq-cadence-dp-firmware.mk              |   10 +-
 package/qoriq-ddr-phy-binary/Config.in        |    6 +
 .../qoriq-ddr-phy-binary.hash                 |    3 +
 .../qoriq-ddr-phy-binary.mk                   |   18 +
 package/qoriq-fm-ucode/qoriq-fm-ucode.hash    |    2 +-
 package/qoriq-fm-ucode/qoriq-fm-ucode.mk      |    2 +-
 package/qoriq-mc-binary/Config.in             |   48 +
 package/qoriq-mc-binary/qoriq-mc-binary.hash  |    3 +
 package/qoriq-mc-binary/qoriq-mc-binary.mk    |   22 +
 package/qoriq-mc-utils/Config.in              |   35 +
 package/qoriq-mc-utils/qoriq-mc-utils.hash    |    3 +
 package/qoriq-mc-utils/qoriq-mc-utils.mk      |   22 +
 package/qoriq-rcw/qoriq-rcw.hash              |    2 +-
 package/qoriq-rcw/qoriq-rcw.mk                |    2 +-
 package/qoriq-restool/Config.in               |   21 +
 package/qoriq-restool/qoriq-restool.hash      |    3 +
 package/qoriq-restool/qoriq-restool.mk        |   24 +
 104 files changed, 22446 insertions(+), 96 deletions(-)
 delete mode 100644 board/freescale/common/patches/arm-trusted-firmware/0002-LF-7968-01-fix-Makefile-Suppress-array-bounds-error.patch
 create mode 100644 board/solidrun/lx2160acex7/extlinux.conf
 create mode 100644 board/solidrun/lx2160acex7/genimage.cfg
 create mode 100644 board/solidrun/lx2160acex7/linux.config
 create mode 100644 board/solidrun/lx2160acex7/patches/arm-trusted-firmware/0001-plat-nxp-lx2160a-auto-boot.patch
 create mode 100644 board/solidrun/lx2160acex7/patches/arm-trusted-firmware/0002-dcfg-Take-into-account-MEM_PLL_CFG_SHIFT-for-ddr-fre.patch
 create mode 100644 board/solidrun/lx2160acex7/patches/arm-trusted-firmware/0003-lx2160acex7-assert-SUS_S5-GPIO-to-poweroff-the-COM.patch
 create mode 100644 board/solidrun/lx2160acex7/patches/arm-trusted-firmware/0004-lx2160acex6-assert-IRQ0-GPIO-to-poweroff-the-EVB.patch
 create mode 100644 board/solidrun/lx2160acex7/patches/arm-trusted-firmware/0005-lx2160a-assert-optional-S5-gpio-from-Makefile-consta.patch
 create mode 100644 board/solidrun/lx2160acex7/patches/arm-trusted-firmware/0006-add-separate-platform-for-solidrun-cex7-module.patch
 create mode 100644 board/solidrun/lx2160acex7/patches/arm-trusted-firmware/0007-lx2160a-support-flexible-value-for-CONFIG_DDR_NODIMM.patch
 create mode 100644 board/solidrun/lx2160acex7/patches/arm-trusted-firmware/0008-add-separate-platform-for-solidrun-internal-cex6-eva.patch
 create mode 100644 board/solidrun/lx2160acex7/patches/arm-trusted-firmware/0009-lx2160a-support-flushing-i2c-bus-before-ddr-init.patch
 create mode 100644 board/solidrun/lx2160acex7/patches/arm-trusted-firmware/0010-lx2160acex6-flush-i2c-bus-with-spd-eeprom-before-ddr.patch
 create mode 100644 board/solidrun/lx2160acex7/patches/arm-trusted-firmware/0011-lx2160acex7-flush-i2c-bus-with-spd-eeprom-before-ddr.patch
 create mode 100644 board/solidrun/lx2160acex7/patches/arm-trusted-firmware/0012-plat-lx2160a-fix-building-without-NXP_NV_SW_MAINT_LA.patch
 create mode 100644 board/solidrun/lx2160acex7/patches/arm-trusted-firmware/0013-plat-lx2160a-fix-boot-without-spi-flash-disable-non-.patch
 create mode 100644 board/solidrun/lx2160acex7/patches/arm-trusted-firmware/0014-add-separate-platform-for-solidrun-lx2162a-som.patch
 create mode 100644 board/solidrun/lx2160acex7/patches/arm-trusted-firmware/0015-lx2160acex6-add-ddr-configuration-for-pcb-v1.2-with-.patch
 create mode 100644 board/solidrun/lx2160acex7/patches/arm-trusted-firmware/0016-nxp-ddr-add-debug-output-for-dimm-parameters-parsed-.patch
 create mode 100644 board/solidrun/lx2160acex7/patches/arm-trusted-firmware/0017-lx2160acex6-fix-dq-mapping-and-remove-invalid-spd-ee.patch
 rename board/{freescale/common/patches/arm-trusted-firmware/0001-feat-build-add-support-for-new-binutils-versions.patch => solidrun/lx2160acex7/patches/arm-trusted-firmware/0018-feat-build-add-support-for-new-binutils-versions.patch} (100%)
 create mode 100644 board/solidrun/lx2160acex7/patches/arm-trusted-firmware/arm-trusted-firmware.hash
 create mode 120000 board/solidrun/lx2160acex7/patches/linux-headers/linux-headers.hash
 create mode 100644 board/solidrun/lx2160acex7/patches/linux/linux.hash
 create mode 100644 board/solidrun/lx2160acex7/patches/qoriq-mc-utils/0001-add-solidrun-lx2160-cex7-based-clearfog-cx-dpl-dpc.patch
 create mode 100644 board/solidrun/lx2160acex7/patches/qoriq-mc-utils/0002-add-solidrun-lx2160-cex6-based-evaluation-board-dpl-.patch
 create mode 100644 board/solidrun/lx2160acex7/patches/qoriq-mc-utils/0003-add-configuration-for-lx2162a-som-and-clearfog-board.patch
 create mode 100644 board/solidrun/lx2160acex7/patches/qoriq-mc-utils/0004-lx2162-som-clearfog-enable-dpni-connections.patch
 create mode 100644 board/solidrun/lx2160acex7/patches/qoriq-mc-utils/0005-lx2160acex7-clearfog-cx-configure-qsfp-ports-type-ph.patch
 create mode 100644 board/solidrun/lx2160acex7/patches/qoriq-rcw/0001-add-configuration-solidrun-lx2160a-cex-7-on-clearfog.patch
 create mode 100644 board/solidrun/lx2160acex7/patches/qoriq-rcw/0002-lx2160acex7-move-MEM_PLL_CFG-into-ddr-speed-specific.patch
 create mode 100644 board/solidrun/lx2160acex7/patches/qoriq-rcw/0003-lx2160acex7-add-separate-configurations-for-flexspi-.patch
 create mode 100644 board/solidrun/lx2160acex7/patches/qoriq-rcw/0004-lx2160acex7-rename-sdhc1-config-to-generic-sdhc-for-.patch
 create mode 100644 board/solidrun/lx2160acex7/patches/qoriq-rcw/0005-add-loadc-jumpc-and-jump-to-pbi-instructions.patch
 create mode 100644 board/solidrun/lx2160acex7/patches/qoriq-rcw/0006-lx2160acex7-add-configuration-for-both-sdhc-xspi.patch
 create mode 100644 board/solidrun/lx2160acex7/patches/qoriq-rcw/0007-bootlocptr-reduce-size-of-pbi-section.patch
 create mode 100644 board/solidrun/lx2160acex7/patches/qoriq-rcw/0008-lx2160acex7-change-2.2GHz-configuration-platform-clo.patch
 create mode 100644 board/solidrun/lx2160acex7/patches/qoriq-rcw/0009-lx2160acex7-add-configuration-for-fraction-ddr-speed.patch
 create mode 100644 board/solidrun/lx2160acex7/patches/qoriq-rcw/0010-add-configuration-solidrun-internal-lx2160a-cex6-eva.patch
 create mode 100644 board/solidrun/lx2160acex7/patches/qoriq-rcw/0011-lx2160acex7-enable-A-050426-workaround-for-silicon-o.patch
 create mode 100644 board/solidrun/lx2160acex7/patches/qoriq-rcw/0012-lx2160acex6-enable-pci-errata-workarounds-for-all-ac.patch
 create mode 100644 board/solidrun/lx2160acex7/patches/qoriq-rcw/0013-lx2160acex6-add-configuration-for-2.2GHz-binned-soc.patch
 create mode 100644 board/solidrun/lx2160acex7/patches/qoriq-rcw/0014-lx2162aqds-re-enable-dpmac11.patch
 create mode 100644 board/solidrun/lx2160acex7/patches/qoriq-rcw/0015-add-configuration-for-lx2162a-som-and-clearfog-evalu.patch
 create mode 100644 board/solidrun/lx2160acex7/patches/qoriq-rcw/0016-lx2160acex7-clearfog-cx-add-configuration-for-serdes.patch
 create mode 100644 board/solidrun/lx2160acex7/patches/qoriq-rcw/0017-lx2160acex7-add-configuration-for-serdes-1-protocol-.patch
 create mode 100644 board/solidrun/lx2160acex7/patches/qoriq-rcw/0018-solidrun-add-script-generating-configs-from-template.patch
 create mode 100644 board/solidrun/lx2160acex7/patches/qoriq-rcw/0019-lx2160acex7-clearfog-cx-add-configuration-for-serdes.patch
 create mode 100644 board/solidrun/lx2160acex7/patches/qoriq-rcw/0020-lx2160acex6-add-configuration-for-each-ddr-speed.patch
 create mode 100644 board/solidrun/lx2160acex7/patches/uboot/0001-add-solidrun-lx2160-cex7-board-support.patch
 create mode 100644 board/solidrun/lx2160acex7/patches/uboot/0002-pci-ls_pcie_g4-Wait-100ms-for-Link-Up-in-ls_pcie_g4_.patch
 create mode 100644 board/solidrun/lx2160acex7/patches/uboot/0003-pci-ls_pcie-Wait-100ms-for-Link-Up-in-ls_pcie_probe.patch
 create mode 100644 board/solidrun/lx2160acex7/patches/uboot/0004-fsl-lsch3-update-calculation-of-ddr-clock-rate-to-in.patch
 create mode 100644 board/solidrun/lx2160acex7/patches/uboot/0005-armv8-lx2160a-enable-workaround-for-SPI-erratum-A-05.patch
 create mode 100644 board/solidrun/lx2160acex7/patches/uboot/0006-configs-lx2160-cex7-enable-additional-drivers.patch
 create mode 100644 board/solidrun/lx2160acex7/patches/uboot/0007-cmd-tlv_eeprom-don-t-fail-boot-when-reading-eeprom-f.patch
 create mode 100644 board/solidrun/lx2160acex7/patches/uboot/0008-board-solidrun-lx2160-cex7-fixup-u-boot-dts-dpmac-by.patch
 create mode 100644 board/solidrun/lx2160acex7/patches/uboot/0009-board-solidrun-lx2160acex7-enable-reading-tlv-eeprom.patch
 create mode 100644 board/solidrun/lx2160acex7/patches/uboot/0010-board-solidrun-lx2160acex7-disable-second-usb-on-lx2.patch
 create mode 100644 board/solidrun/lx2160acex7/patches/uboot/0011-board-solidrun-lx2160acex7-allocate-memory-before-pa.patch
 create mode 100644 board/solidrun/lx2160acex7/patches/uboot/0012-cmd-tlv_eeprom-support-specifying-tlv-eeprom-in-DT-a.patch
 create mode 100644 board/solidrun/lx2160acex7/patches/uboot/0013-board-solidrun-lx2160acex7-use-dt-alias-for-tlv-eepr.patch
 create mode 100644 board/solidrun/lx2160acex7/patches/uboot/0014-cmd-tlv_eeprom-fix-alias-access-to-second-eeprom.patch
 create mode 100644 board/solidrun/lx2160acex7/patches/uboot/uboot.hash
 create mode 100755 board/solidrun/lx2160acex7/post-build.sh
 create mode 100644 board/solidrun/lx2160acex7/readme.txt
 create mode 100644 board/solidrun/lx2160acex7/rootfs_overlay/etc/udev/rules.d/74-dpaa2-networking.rules
 create mode 100644 board/solidrun/lx2160acex7/u-boot-environment-sd.txt
 create mode 100644 configs/solidrun_lx2160acex7_defconfig
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
