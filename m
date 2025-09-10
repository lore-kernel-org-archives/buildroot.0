Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D01BCA101F
	for <buildroot@archiver.kernel.org>; Wed, 10 Sep 2025 20:38:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1B45284291;
	Wed, 10 Sep 2025 20:38:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZrPMZbDflfS8; Wed, 10 Sep 2025 20:38:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0B654842B5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0B654842B5;
	Wed, 10 Sep 2025 20:38:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 64331443
 for <buildroot@buildroot.org>; Wed, 10 Sep 2025 20:38:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4AC12407BE
 for <buildroot@buildroot.org>; Wed, 10 Sep 2025 20:38:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iO4z5kkCuGJf for <buildroot@buildroot.org>;
 Wed, 10 Sep 2025 20:38:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=vjardin@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 11FDE407EA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 11FDE407EA
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 11FDE407EA
 for <buildroot@buildroot.org>; Wed, 10 Sep 2025 20:38:40 +0000 (UTC)
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:2af:22b0:382f:cdeb:de75:d1ab])
 (Authenticated sender: vjardin@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 3D32F13F880;
 Wed, 10 Sep 2025 22:38:34 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Vladimir Oltean <olteanv@gmail.com>,
	Vincent Jardin <vjardin@free.fr>
Date: Wed, 10 Sep 2025 22:38:23 +0200
Message-ID: <20250910203826.41407-1-vjardin@free.fr>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1757536717;
 bh=fZKn58+OLFfEDSY9p+cY05XSR3As7hnBxvpZBCyIl+I=;
 h=From:To:Cc:Subject:Date:From;
 b=oZkKnCeBxAbOEGEx5QqZbtd059F2Fw+dwUJ2kgh/2EAxq/oaMcq2zn4YW6FDiz4yi
 rEYibNHh0K/7oDVs34DpkvuKS6gv7GihSzsWX2Ls8jFGJboUR1hBUw9JsalY6DnGCJ
 G1UvRa7cOnVKbObPJ8r3B9hvYS2BTLjXxKfoamP569l1KiTNTA8SpW0+g4euvvD6Wr
 4J4LL4XuLZ/kUm6EQigiK3Q/0zuSk6Rsp2yKW4uwiSyyBXMxGqBzUHpKzJ1L+a13mz
 lXlG54pNt6JgurOYTTjWmv/mL8InWQV/en3oFPn1ibOpgSSx+IctpfmsXiRqApBj5m
 1y3NUG7f7uVlQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=oZkKnCeB
Subject: [Buildroot] [PATCH v4 0/2] board/lx2160acex7: new platform
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
From: Vincent Jardin via buildroot <buildroot@buildroot.org>
Reply-To: Vincent Jardin <vjardin@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

v4:
  - rebase on upstream instead of using nxp lf repository
  - drop useless patches because of internal boards, automatic generated
    contents
  - upgrade rcw to use templates for generated rcw
  - fix few bugs (devtype should not be enforced with dhcp, ethprime was
    not properly set to dpmac17)
  - the patch is now 30% the size of v3

v3:
  - rebase Vladimir's serie
  - import all patches from SolidRun
  - https://patchwork.ozlabs.org/project/buildroot/patch/20250904112858.36171-1-vjardin@free.fr/

v2:
  - I do not remember...

Vincent Jardin (2):
  board/lx2160acex7: new platform
  package/qoriq-rcw: Generate RCW from templates

 .../lx2160acex7/clearfog-cx-s1_8-s2_0-dpc.dts |  109 +
 .../lx2160acex7/clearfog-cx-s1_8-s2_0-dpl.dts |  556 ++++++
 board/solidrun/lx2160acex7/extlinux.conf      |    8 +
 board/solidrun/lx2160acex7/genimage.cfg       |   84 +
 board/solidrun/lx2160acex7/linux.config       |  636 ++++++
 .../0002-plat-nxp-lx2160a-auto-boot.patch     |  204 ++
 ...ccount-MEM_PLL_CFG_SHIFT-for-ddr-fre.patch |   86 +
 ...ptional-S5-gpio-from-Makefile-consta.patch |   61 +
 ...flexible-value-for-CONFIG_DDR_NODIMM.patch |   33 +
 ...ape-mmap-dynamic-configuration-regio.patch |   48 +
 ...ort-flushing-i2c-bus-before-ddr-init.patch |  384 ++++
 ...p-SPD-EEPROM-content-on-debug-builds.patch |   40 +
 ...error-when-using-non-identical-DIMMs.patch |   35 +
 ...g-output-for-dimm-parameters-parsed-.patch |   83 +
 ...-building-without-NXP_NV_SW_MAINT_LA.patch |   49 +
 ...-boot-without-spi-flash-disable-non-.patch |   33 +
 ...te-platform-for-solidrun-cex7-module.patch |  423 ++++
 ...ime-flag-to-disable-SYSTEM_OFF-funct.patch |   67 +
 ...a-cex7-add-interrupts-for-rtc-and-et.patch |   39 +
 ...a-clearfog-itx-enable-pcie-nodes-for.patch |   40 +
 ...cf2127-clear-minute-second-interrupt.patch |   62 +
 ...reate-driver-for-ds250df4x10-retimer.patch |  502 +++++
 ...a-clearfog-cx-add-description-for-re.patch |   81 +
 ...c-jumpc-and-jump-to-pbi-instructions.patch |   55 +
 ...otlocptr-script-for-automatic-boot-f.patch |   80 +
 ...ocedure-splitting-sd1-lanes-A-D-40GE.patch |  132 ++
 ...ocedure-converting-sd1-lanes-g-h-fro.patch |   65 +
 ...ipt-generating-configs-from-template.patch |   71 +
 ...n-solidrun-lx2160a-cex-7-on-clearfog.patch |  735 +++++++
 ...ait-100ms-for-Link-Up-in-ls_pcie_g4_.patch |   66 +
 ...t-100ms-for-Link-Up-in-ls_pcie_probe.patch |   65 +
 ...-calculation-of-ddr-clock-rate-to-in.patch |   63 +
 ...able-workaround-for-SPI-erratum-A-05.patch |  103 +
 ...upport-specifying-tlv-eeprom-in-DT-a.patch |   57 +
 ...mpc8xxx-fix-build-on-layerscape-arch.patch |   29 +
 ...rm-dts-fsl-lx2160a.dtsi-add-pcs-phys.patch |  386 ++++
 ...m-dts-fsl-lx2160a.dtsi-add-psci-node.patch |   30 +
 ...rvell10g-add-support-for-88e2580-phy.patch |   43 +
 ...d-solidrun-lx2160-cex7-board-support.patch | 1753 +++++++++++++++++
 ...x2160cex7-add-support-for-clearfog-c.patch |  238 +++
 ...x2160cex7-configure-fan-controller-d.patch |  138 ++
 ...x2160cex7-fix-read-rcw-from-dcsr-mem.patch |   48 +
 ...-copy-optee-to-OS-DTB-regardless-if-.patch |   56 +
 ...x2160cex7-fix-xspi-flash-compatible-.patch |   30 +
 ...x2160acex7-fix-serdes-lane-dpmac-swa.patch |  124 ++
 ...-adding-optee-subnode-if-not-present.patch |   31 +
 ...n-disable-some-unused-config-options.patch |   66 +
 ...x2160acex7-fix-various-mistakes-in-s.patch |  703 +++++++
 ...x2160acex7-disable-disabled-ports-pr.patch |  367 ++++
 board/solidrun/lx2160acex7/post-build.sh      |   10 +
 board/solidrun/lx2160acex7/readme.txt         |  142 ++
 .../udev/rules.d/74-dpaa2-networking.rules    |   12 +
 .../lx2160acex7/u-boot-environment-sd.txt     |   96 +
 board/solidrun/lx2160acex7/u-boot.config      |    2 +
 configs/solidrun_lx2160acex7_defconfig        |   56 +
 package/qoriq-rcw/qoriq-rcw.mk                |    1 +
 56 files changed, 9516 insertions(+)
 create mode 100644 board/solidrun/lx2160acex7/clearfog-cx-s1_8-s2_0-dpc.dts
 create mode 100644 board/solidrun/lx2160acex7/clearfog-cx-s1_8-s2_0-dpl.dts
 create mode 100644 board/solidrun/lx2160acex7/extlinux.conf
 create mode 100644 board/solidrun/lx2160acex7/genimage.cfg
 create mode 100644 board/solidrun/lx2160acex7/linux.config
 create mode 100644 board/solidrun/lx2160acex7/patches/arm-trusted-firmware/0002-plat-nxp-lx2160a-auto-boot.patch
 create mode 100644 board/solidrun/lx2160acex7/patches/arm-trusted-firmware/0003-dcfg-Take-into-account-MEM_PLL_CFG_SHIFT-for-ddr-fre.patch
 create mode 100644 board/solidrun/lx2160acex7/patches/arm-trusted-firmware/0004-lx2160a-assert-optional-S5-gpio-from-Makefile-consta.patch
 create mode 100644 board/solidrun/lx2160acex7/patches/arm-trusted-firmware/0005-lx2160a-support-flexible-value-for-CONFIG_DDR_NODIMM.patch
 create mode 100644 board/solidrun/lx2160acex7/patches/arm-trusted-firmware/0006-plat-nxp-layerscape-mmap-dynamic-configuration-regio.patch
 create mode 100644 board/solidrun/lx2160acex7/patches/arm-trusted-firmware/0007-lx2160a-support-flushing-i2c-bus-before-ddr-init.patch
 create mode 100644 board/solidrun/lx2160acex7/patches/arm-trusted-firmware/0008-nxp-ddr-dump-SPD-EEPROM-content-on-debug-builds.patch
 create mode 100644 board/solidrun/lx2160acex7/patches/arm-trusted-firmware/0009-nxp-ddr-disarm-error-when-using-non-identical-DIMMs.patch
 create mode 100644 board/solidrun/lx2160acex7/patches/arm-trusted-firmware/0010-nxp-ddr-add-debug-output-for-dimm-parameters-parsed-.patch
 create mode 100644 board/solidrun/lx2160acex7/patches/arm-trusted-firmware/0011-plat-lx2160a-fix-building-without-NXP_NV_SW_MAINT_LA.patch
 create mode 100644 board/solidrun/lx2160acex7/patches/arm-trusted-firmware/0012-plat-lx2160a-fix-boot-without-spi-flash-disable-non-.patch
 create mode 100644 board/solidrun/lx2160acex7/patches/arm-trusted-firmware/0013-add-separate-platform-for-solidrun-cex7-module.patch
 create mode 100644 board/solidrun/lx2160acex7/patches/arm-trusted-firmware/0016-psci-add-build-time-flag-to-disable-SYSTEM_OFF-funct.patch
 create mode 100644 board/solidrun/lx2160acex7/patches/linux/0004-arm64-dts-lx2160a-cex7-add-interrupts-for-rtc-and-et.patch
 create mode 100644 board/solidrun/lx2160acex7/patches/linux/0005-arm64-dts-lx2160a-clearfog-itx-enable-pcie-nodes-for.patch
 create mode 100644 board/solidrun/lx2160acex7/patches/linux/0006-rtc-pcf2127-clear-minute-second-interrupt.patch
 create mode 100644 board/solidrun/lx2160acex7/patches/linux/0010-net-phy-create-driver-for-ds250df4x10-retimer.patch
 create mode 100644 board/solidrun/lx2160acex7/patches/linux/0012-arm64-dts-lx2160a-clearfog-cx-add-description-for-re.patch
 create mode 100644 board/solidrun/lx2160acex7/patches/qoriq-rcw/0002-add-loadc-jumpc-and-jump-to-pbi-instructions.patch
 create mode 100644 board/solidrun/lx2160acex7/patches/qoriq-rcw/0003-lx2160asi-add-bootlocptr-script-for-automatic-boot-f.patch
 create mode 100644 board/solidrun/lx2160acex7/patches/qoriq-rcw/0004-lx2160asi-add-procedure-splitting-sd1-lanes-A-D-40GE.patch
 create mode 100644 board/solidrun/lx2160acex7/patches/qoriq-rcw/0005-lx2160asi-add-procedure-converting-sd1-lanes-g-h-fro.patch
 create mode 100644 board/solidrun/lx2160acex7/patches/qoriq-rcw/0006-solidrun-add-script-generating-configs-from-template.patch
 create mode 100644 board/solidrun/lx2160acex7/patches/qoriq-rcw/0007-add-configuration-solidrun-lx2160a-cex-7-on-clearfog.patch
 create mode 100644 board/solidrun/lx2160acex7/patches/uboot/0001-pci-ls_pcie_g4-Wait-100ms-for-Link-Up-in-ls_pcie_g4_.patch
 create mode 100644 board/solidrun/lx2160acex7/patches/uboot/0002-pci-ls_pcie-Wait-100ms-for-Link-Up-in-ls_pcie_probe.patch
 create mode 100644 board/solidrun/lx2160acex7/patches/uboot/0003-fsl-lsch3-update-calculation-of-ddr-clock-rate-to-in.patch
 create mode 100644 board/solidrun/lx2160acex7/patches/uboot/0004-armv8-lx2160a-enable-workaround-for-SPI-erratum-A-05.patch
 create mode 100644 board/solidrun/lx2160acex7/patches/uboot/0006-cmd-tlv_eeprom-support-specifying-tlv-eeprom-in-DT-a.patch
 create mode 100644 board/solidrun/lx2160acex7/patches/uboot/0007-gpio-mpc8xxx-fix-build-on-layerscape-arch.patch
 create mode 100644 board/solidrun/lx2160acex7/patches/uboot/0008-arch-arm-dts-fsl-lx2160a.dtsi-add-pcs-phys.patch
 create mode 100644 board/solidrun/lx2160acex7/patches/uboot/0009-arch-arm-dts-fsl-lx2160a.dtsi-add-psci-node.patch
 create mode 100644 board/solidrun/lx2160acex7/patches/uboot/0010-net-phy-marvell10g-add-support-for-88e2580-phy.patch
 create mode 100644 board/solidrun/lx2160acex7/patches/uboot/0011-add-solidrun-lx2160-cex7-board-support.patch
 create mode 100644 board/solidrun/lx2160acex7/patches/uboot/0014-board-solidrun-lx2160cex7-add-support-for-clearfog-c.patch
 create mode 100644 board/solidrun/lx2160acex7/patches/uboot/0015-board-solidrun-lx2160cex7-configure-fan-controller-d.patch
 create mode 100644 board/solidrun/lx2160acex7/patches/uboot/0016-board-solidrun-lx2160cex7-fix-read-rcw-from-dcsr-mem.patch
 create mode 100644 board/solidrun/lx2160acex7/patches/uboot/0018-lib-optee-always-copy-optee-to-OS-DTB-regardless-if-.patch
 create mode 100644 board/solidrun/lx2160acex7/patches/uboot/0019-board-solidrun-lx2160cex7-fix-xspi-flash-compatible-.patch
 create mode 100644 board/solidrun/lx2160acex7/patches/uboot/0020-board-solidrun-lx2160acex7-fix-serdes-lane-dpmac-swa.patch
 create mode 100644 board/solidrun/lx2160acex7/patches/uboot/0021-lib-optee-fix-adding-optee-subnode-if-not-present.patch
 create mode 100644 board/solidrun/lx2160acex7/patches/uboot/0023-board-solidrun-disable-some-unused-config-options.patch
 create mode 100644 board/solidrun/lx2160acex7/patches/uboot/0024-board-solidrun-lx2160acex7-fix-various-mistakes-in-s.patch
 create mode 100644 board/solidrun/lx2160acex7/patches/uboot/0025-board-solidrun-lx2160acex7-disable-disabled-ports-pr.patch
 create mode 100755 board/solidrun/lx2160acex7/post-build.sh
 create mode 100644 board/solidrun/lx2160acex7/readme.txt
 create mode 100644 board/solidrun/lx2160acex7/rootfs_overlay/etc/udev/rules.d/74-dpaa2-networking.rules
 create mode 100644 board/solidrun/lx2160acex7/u-boot-environment-sd.txt
 create mode 100644 board/solidrun/lx2160acex7/u-boot.config
 create mode 100644 configs/solidrun_lx2160acex7_defconfig

-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
