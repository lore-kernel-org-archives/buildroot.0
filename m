Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F329ECA0ED1
	for <buildroot@archiver.kernel.org>; Mon, 11 Aug 2025 16:56:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CCF7C41074;
	Mon, 11 Aug 2025 16:56:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WeU5t9MOplks; Mon, 11 Aug 2025 16:56:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8FF45416EF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8FF45416EF;
	Mon, 11 Aug 2025 16:56:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 325CE138
 for <buildroot@buildroot.org>; Mon, 11 Aug 2025 16:56:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 18D43409E0
 for <buildroot@buildroot.org>; Mon, 11 Aug 2025 16:56:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qyKmtnip633F for <buildroot@buildroot.org>;
 Mon, 11 Aug 2025 16:56:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::630; helo=mail-ej1-x630.google.com;
 envelope-from=olteanv@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 2DD8B4012B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2DD8B4012B
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2DD8B4012B
 for <buildroot@buildroot.org>; Mon, 11 Aug 2025 16:56:12 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-af92d6c7d15so69890566b.2
 for <buildroot@buildroot.org>; Mon, 11 Aug 2025 09:56:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754931369; x=1755536169;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WXXq5F+5hzPz6EnNL02tWGMisZHeNdSf4ZZOu51osrI=;
 b=uTsQJldDpbgQS7LLFN+gBsX993kDf7znT4rK+KNNKB5vNdxf5lA8Fff3XY8p0cq79j
 FokXwnWtYh7Q1sh8pxGGwdpZXuIaqgyxO/dJycCYEsF8jKqPDUy4MLvOTjhhpc7U/osl
 tjhqC1EmwQZDa7JJaOgcpjBDMNAQ8NsNCJ1h4tCH3nAFJ+J9jJchUdC8ArW9Pi2lqGE7
 gI9T5KxG+GTuWiYbUOVKXWkuIcUU/U61o+YNKJSydg3yr20MTIJxO0J3RtzM7zvjRnja
 WHUixih0o0HVXFHBWGsnzQzdtr3fc6aaATjk7wjFNSVWy/XSIQfbHFHcgkSSINe18BSY
 kqjw==
X-Gm-Message-State: AOJu0YwLLxIDhdxVKwyvWbii7Mlgxy5urP8Q0sdw2E8rjOoBx6SOPADq
 70dnFj1X8pGQubxvMLkOQe4RHocvEsClzo85cKtcEUceq5Ok0GIwaIn07p8mig==
X-Gm-Gg: ASbGncuqnQA+EZCHApRI4p0mrcoIFvT3NDNkPpZYV38eoDeGydKDyAhC2mA31x2NuBQ
 8QWTi4yYg5s8rD+FTha843TMivaziUbEoJKsLkeXRohi077H8gMIFmwgOX2K3hh75Tw8A9mqoLk
 BNvM7laVRIvGThCfFcndKOXm2f0Ydx1bgIhLuksUiqDjGKAQpWEqA4LK7wvYWEWkghn1PqowAv6
 ffyh1w1hPLMCkLfbnMdOmM+bHhswGOkNp2VqGPxRNbI2CEQ3MwzFGnOalNXreI3jJEi2e5FXqE7
 6wLgBVcxDY/yM15IPQh019C9BTvGmBVxnK4fVVyeVule5dZR8otcOgV7gVx5/sAuSOyxn/ooZMo
 T+NWapynEkryvJvVxjMCv3BA9ts4rkA==
X-Google-Smtp-Source: AGHT+IEEguO7Rx0HoCxaYytiS1OGMb2jyJNSDsLcnkFLY/Vy3OExA95NO549H0yOgob2JYb34xtBqQ==
X-Received: by 2002:a17:907:940f:b0:af9:5a1c:fee5 with SMTP id
 a640c23a62f3a-af9de4cbbb3mr325711666b.0.1754931368796; 
 Mon, 11 Aug 2025 09:56:08 -0700 (PDT)
Received: from skbuf.lan ([2a02:2f04:d005:3b00:15ff:6865:527:c8f0])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af91a0766e2sm2044629166b.27.2025.08.11.09.56.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Aug 2025 09:56:07 -0700 (PDT)
From: Vladimir Oltean <olteanv@gmail.com>
To: buildroot@buildroot.org
Cc: Brandon Maier <Brandon.Maier@collins.com>,
 Ioana Ciornei <ciorneiioana@gmail.com>,
 Romain Naour <romain.naour@smile.fr>, Vincent Jardin <vjardin@free.fr>,
 Julien Olivain <ju.o@free.fr>, Arnout Vandecappelle <arnout@mind.be>,
 Akhilesh Nema <nemaakhilesh@gmail.com>
Date: Mon, 11 Aug 2025 19:55:31 +0300
Message-ID: <20250811165531.1533913-12-olteanv@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250811165531.1533913-1-olteanv@gmail.com>
References: <20250811165531.1533913-1-olteanv@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1754931369; x=1755536169; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WXXq5F+5hzPz6EnNL02tWGMisZHeNdSf4ZZOu51osrI=;
 b=SRVG55y3EPUhgVdB6nyV82KJ5rr7CdWZmH7t9+3UKzxlZmp7nIFDmr7jmVlVnR54Iu
 gQrVmbvrUuZglm+pEbI46A+idT4Mvc0Xoo4YLeWqbXWZHyXxeXUnwFonaNi2MNXqi1ZN
 9lkQdWswwhQ5NVFtJGeBuUlkzyMlhhyVaDTye/xKVWvkeyaKdKfWIj1wWfgm4eKGolHl
 XSdGCDxqkeexVIKkfMYFNH+ZqFfUD7j537eo7nbPJ8cFEuM3ulvd+yEcKbuX/kqPkCcQ
 AZn/fFVSMOnpHgEd7FmHTuE0BphmoO60LcWM0DujjWK7+aZSuiwL5Fg1UQhcv1135Jw7
 q1kA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=SRVG55y3
Subject: [Buildroot] [PATCH v3 11/11] board/lx2160ardb: new platform
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

Add Buildroot support for the NXP LX2160A-RDB (reference design board).
This is configured here to boot from the SD card. To my surprise, NXP
RCWs for LX2160A rev2 silicon don't have a pre-existing example for SD
boot, so until one is available, include the RCW through board files.

I would have been fine with the default U-Boot environment, except that
I would like to ship the MC firmware deployed as a file in the
filesystem, and that requires a custom 'mcinitcmd' environment variable
to load it. Thus, the 'env default -a' output was customized and
included here in its entirety.

Previous review feedback said that the U-Boot environment is too large:
https://lore.kernel.org/buildroot/2hhshlixqffg7r3o33klqzyvbxnpwllhhkskbi5igtewh6htlg@5huoxuxspqlv/
Short of me starting to strip away features, the best I can do is to
amortize the cost by taking away some variables and placing them in
other U-Boot environment variable files which can be reused.

- board/freescale/common/env-distro-boot-layerscape.txt: The U-Boot
  distro boot feature is generic, however for Layerscape it was
  customized through the introduction of the esbc_validate command, to
  support Secure Boot.
- board/freescale/common/env-dpaa2.txt: a reusable layer for other
  LS1088A, LS2088A, LX2160A based SoCs.

Signed-off-by: Vladimir Oltean <olteanv@gmail.com>
---
v2->v3:
- split U-Boot environment into 3 files
- integrate lf-6.12.20-2.0.0 NXP BSP tag
- fix the NXP component list in the README
- move the DPAA2 udev rules from board/freescale/lx2160ardb/rootfs_overlay
  to board/freescale/common/rootfs_overlay, on the premise that they do
  no harm and are not board-specific.
v1->v2: patch is new

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
 configs/lx2160ardb_defconfig                  |  57 ++++++++
 14 files changed, 426 insertions(+)
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

diff --git a/board/freescale/common/env-distro-boot-layerscape.txt b/board/freescale/common/env-distro-boot-layerscape.txt
new file mode 100644
index 000000000000..0a2a92d69d7c
--- /dev/null
+++ b/board/freescale/common/env-distro-boot-layerscape.txt
@@ -0,0 +1,33 @@
+boot_a_script=load ${devtype} ${devnum}:${distro_bootpart} ${scriptaddr} ${prefix}${script}; env exists secureboot && load ${devtype} ${devnum}:${distro_bootpart} ${scripthdraddr} ${prefix}${boot_script_hdr} && esbc_validate ${scripthdraddr};source ${scriptaddr}
+boot_efi_binary=load ${devtype} ${devnum}:${distro_bootpart} ${kernel_addr_r} efi/boot/bootaa64.efi; if fdt addr -q ${fdt_addr_r}; then bootefi ${kernel_addr_r} ${fdt_addr_r};else bootefi ${kernel_addr_r} ${fdtcontroladdr};fi
+boot_efi_bootmgr=if fdt addr -q ${fdt_addr_r}; then bootefi bootmgr ${fdt_addr_r};else bootefi bootmgr;fi
+boot_extlinux=sysboot ${devtype} ${devnum}:${distro_bootpart} any ${scriptaddr} ${prefix}${boot_syslinux_conf}
+boot_net_usb_start=usb start
+boot_pci_enum=pci enum
+boot_prefixes=/ /boot/
+boot_syslinux_conf=extlinux/extlinux.conf
+bootcmd=run distro_bootcmd
+bootcmd_dhcp=devtype=dhcp; run boot_net_usb_start; run boot_pci_enum; if dhcp ${scriptaddr} ${boot_script_dhcp}; then source ${scriptaddr}; fi;setenv efi_fdtfile ${fdtfile}; setenv efi_old_vci ${bootp_vci};setenv efi_old_arch ${bootp_arch};setenv bootp_vci PXEClient:Arch:00011:UNDI:003000;setenv bootp_arch 0xb;if dhcp ${kernel_addr_r}; then tftpboot ${fdt_addr_r} dtb/${efi_fdtfile};if fdt addr -q ${fdt_addr_r}; then bootefi ${kernel_addr_r} ${fdt_addr_r}; else bootefi ${kernel_addr_r} ${fdtcontroladdr};fi;fi;setenv bootp_vci ${efi_old_vci};setenv bootp_arch ${efi_old_arch};setenv efi_fdtfile;setenv efi_old_arch;setenv efi_old_vci;
+bootcmd_mmc0=devnum=0; run mmc_boot
+bootcmd_mmc1=devnum=1; run mmc_boot
+bootcmd_scsi0=devnum=0; run scsi_boot
+bootcmd_usb0=devnum=0; run usb_boot
+bootdelay=10
+distro_bootcmd=scsi_need_init=; setenv nvme_need_init; for target in ${boot_targets}; do run bootcmd_${target}; done
+efi_dtb_prefixes=/ /dtb/ /dtb/current/
+load_efi_dtb=load ${devtype} ${devnum}:${distro_bootpart} ${fdt_addr_r} ${prefix}${efi_fdtfile}
+mmc_boot=if mmc dev ${devnum}; then devtype=mmc; run scan_dev_for_boot_part; fi
+nvme_boot=run boot_pci_enum; run nvme_init; if nvme dev ${devnum}; then devtype=nvme; run scan_dev_for_boot_part; fi
+nvme_init=if ${nvme_need_init}; then setenv nvme_need_init false; nvme scan; fi
+sata_boot=if sata dev ${devnum}; then devtype=sata; run scan_dev_for_boot_part; fi
+scan_dev_for_boot=echo Scanning ${devtype} ${devnum}:${distro_bootpart}...; for prefix in ${boot_prefixes}; do run scan_dev_for_extlinux; run scan_dev_for_scripts; done;run scan_dev_for_efi;
+scan_dev_for_boot_part=part list ${devtype} ${devnum} devplist; env exists devplist || setenv devplist 1; for distro_bootpart in ${devplist}; do if fstype ${devtype} ${devnum}:${distro_bootpart} bootfstype; then run scan_dev_for_boot; fi; done
+scan_dev_for_efi=setenv efi_fdtfile ${fdtfile}; for prefix in ${efi_dtb_prefixes}; do if test -e ${devtype} ${devnum}:${distro_bootpart} ${prefix}${efi_fdtfile}; then run load_efi_dtb; fi;done;run boot_efi_bootmgr;if test -e ${devtype} ${devnum}:${distro_bootpart} efi/boot/bootaa64.efi; then echo Found EFI removable media binary efi/boot/bootaa64.efi; run boot_efi_binary; echo EFI LOAD FAILED: continuing...; fi; setenv efi_fdtfile
+scan_dev_for_extlinux=if test -e ${devtype} ${devnum}:${distro_bootpart} ${prefix}${boot_syslinux_conf}; then echo Found ${prefix}${boot_syslinux_conf}; run boot_extlinux; echo EXTLINUX FAILED: continuing...; fi
+scan_dev_for_scripts=for script in ${boot_scripts}; do if test -e ${devtype} ${devnum}:${distro_bootpart} ${prefix}${script}; then echo Found U-Boot script ${prefix}${script}; run boot_a_script; echo SCRIPT FAILED: continuing...; fi; done
+scsi_boot=run boot_pci_enum; run scsi_init; if scsi dev ${devnum}; then devtype=scsi; run scan_dev_for_boot_part; fi
+scsi_init=if ${scsi_need_init}; then scsi_need_init=false; scsi scan; fi
+sd2_bootcmd=echo Trying load from emmc card..;mmc dev 1; mmcinfo; mmc read $load_addr $kernel_addr_sd $kernel_size_sd ;env exists secureboot && mmc read $kernelheader_addr_r $kernelhdr_addr_sd $kernelhdr_size_sd  && esbc_validate ${kernelheader_addr_r};bootm $load_addr#$BOARD
+sd_bootcmd=echo Trying load from sd card..;mmc dev 0; mmcinfo; mmc read $load_addr $kernel_addr_sd $kernel_size_sd ;env exists secureboot && mmc read $kernelheader_addr_r $kernelhdr_addr_sd $kernelhdr_size_sd  && esbc_validate ${kernelheader_addr_r};bootm $load_addr#$BOARD
+usb_boot=usb start; if usb dev ${devnum}; then devtype=usb; run scan_dev_for_boot_part; fi
+xspi_bootcmd=echo Trying load from flexspi..;sf probe 0:0 && sf read $load_addr $kernel_start $kernel_size ; env exists secureboot &&sf read $kernelheader_addr_r $kernelheader_start $kernelheader_size && esbc_validate ${kernelheader_addr_r};  bootm $load_addr#$BOARD
diff --git a/board/freescale/common/env-dpaa2.txt b/board/freescale/common/env-dpaa2.txt
new file mode 100644
index 000000000000..24e4f03218a7
--- /dev/null
+++ b/board/freescale/common/env-dpaa2.txt
@@ -0,0 +1,6 @@
+dpl_addr_r=0x80d00000
+dpc_addr_r=0x80e00000
+fsl_bootcmd_mcinitcmd_set=y
+mc_fw_addr_r=0x80a00000
+mcinitcmd=mmc dev 0 && load mmc 0:1 $mc_fw_addr_r /boot/mc.itb && load mmc 0:1 $dpc_addr_r /boot/dpc.dtb && load mmc 0:1 $dpl_addr_r /boot/dpl.dtb && fsl_mc start mc $mc_fw_addr_r $dpc_addr_r && fsl_mc lazyapply dpl $dpl_addr_r
+mcmemsize=0x70000000
diff --git a/board/freescale/common/rootfs_overlay/etc/udev/rules.d/74-dpaa2-networking.rules b/board/freescale/common/rootfs_overlay/etc/udev/rules.d/74-dpaa2-networking.rules
new file mode 100644
index 000000000000..977eda8e41f4
--- /dev/null
+++ b/board/freescale/common/rootfs_overlay/etc/udev/rules.d/74-dpaa2-networking.rules
@@ -0,0 +1,29 @@
+SUBSYSTEM!="net", GOTO="fsl_dpaa2_rules_end"
+ACTION!="add|change|online|offline|change", GOTO="fsl_dpaa2_rules_end"
+
+# Rules that match on objects connected to DPMACs have priority, and are named
+# after those DPMACs.
+DRIVERS=="fsl_dpaa2_eth|fsl_dpaa2_switch", ENV{OF_FULLNAME}=="/soc/fsl-mc@80c000000/dpmacs/ethernet@1", NAME="endpmac1", GOTO="fsl_dpaa2_rules_end"
+DRIVERS=="fsl_dpaa2_eth|fsl_dpaa2_switch", ENV{OF_FULLNAME}=="/soc/fsl-mc@80c000000/dpmacs/ethernet@2", NAME="endpmac2", GOTO="fsl_dpaa2_rules_end"
+DRIVERS=="fsl_dpaa2_eth|fsl_dpaa2_switch", ENV{OF_FULLNAME}=="/soc/fsl-mc@80c000000/dpmacs/ethernet@3", NAME="endpmac3", GOTO="fsl_dpaa2_rules_end"
+DRIVERS=="fsl_dpaa2_eth|fsl_dpaa2_switch", ENV{OF_FULLNAME}=="/soc/fsl-mc@80c000000/dpmacs/ethernet@4", NAME="endpmac4", GOTO="fsl_dpaa2_rules_end"
+DRIVERS=="fsl_dpaa2_eth|fsl_dpaa2_switch", ENV{OF_FULLNAME}=="/soc/fsl-mc@80c000000/dpmacs/ethernet@5", NAME="endpmac5", GOTO="fsl_dpaa2_rules_end"
+DRIVERS=="fsl_dpaa2_eth|fsl_dpaa2_switch", ENV{OF_FULLNAME}=="/soc/fsl-mc@80c000000/dpmacs/ethernet@6", NAME="endpmac6", GOTO="fsl_dpaa2_rules_end"
+DRIVERS=="fsl_dpaa2_eth|fsl_dpaa2_switch", ENV{OF_FULLNAME}=="/soc/fsl-mc@80c000000/dpmacs/ethernet@7", NAME="endpmac7", GOTO="fsl_dpaa2_rules_end"
+DRIVERS=="fsl_dpaa2_eth|fsl_dpaa2_switch", ENV{OF_FULLNAME}=="/soc/fsl-mc@80c000000/dpmacs/ethernet@8", NAME="endpmac8", GOTO="fsl_dpaa2_rules_end"
+DRIVERS=="fsl_dpaa2_eth|fsl_dpaa2_switch", ENV{OF_FULLNAME}=="/soc/fsl-mc@80c000000/dpmacs/ethernet@9", NAME="endpmac9", GOTO="fsl_dpaa2_rules_end"
+DRIVERS=="fsl_dpaa2_eth|fsl_dpaa2_switch", ENV{OF_FULLNAME}=="/soc/fsl-mc@80c000000/dpmacs/ethernet@a", NAME="endpmac10", GOTO="fsl_dpaa2_rules_end"
+DRIVERS=="fsl_dpaa2_eth|fsl_dpaa2_switch", ENV{OF_FULLNAME}=="/soc/fsl-mc@80c000000/dpmacs/ethernet@11", NAME="endpmac17", GOTO="fsl_dpaa2_rules_end"
+DRIVERS=="fsl_dpaa2_eth|fsl_dpaa2_switch", ENV{OF_FULLNAME}=="/soc/fsl-mc@80c000000/dpmacs/ethernet@12", NAME="endpmac18", GOTO="fsl_dpaa2_rules_end"
+
+# Rules that match on DPNI objects which are not connected to DPMACs, but to
+# other DPNIs, DPSW ports, DPDMUX etc. Below is an example to set up a
+# persistent MAC address, which can be extended beyond dpni.0.
+# DRIVERS=="fsl_dpaa2_eth", DEVPATH=="/devices/platform/soc/80c000000.fsl-mc/dprc.[0-9]*/dpni.0/net/*", NAME="endpni0", PROGRAM="/sbin/ip link set %k address 00:01:02:03:04:05"
+
+# Rules that match on DPSW ports not connected to a DPMAC.
+# Below is an example to set up a persistent MAC address, which can be extended
+# beyond dpsw.0.
+# DRIVERS=="fsl_dpaa2_switch", DEVPATH=="/devices/platform/soc/80c000000.fsl-mc/dprc.[0-9]*/dpsw.0/net/*", NAME="endpsw0%s{phys_port_name}", PROGRAM="/sbin/ip link set %k address 00:01:02:03:04:05"
+
+LABEL="fsl_dpaa2_rules_end"
diff --git a/board/freescale/lx2160ardb/extlinux.conf b/board/freescale/lx2160ardb/extlinux.conf
new file mode 100644
index 000000000000..2a1109ab1a4d
--- /dev/null
+++ b/board/freescale/lx2160ardb/extlinux.conf
@@ -0,0 +1,4 @@
+label NXP LX2160A Reference Design Board
+  kernel /boot/Image
+  devicetree /boot/fsl-lx2160a-rdb.dtb
+  append root=PARTUUID=%PARTUUID% rw rootwait cma=256M
diff --git a/board/freescale/lx2160ardb/genimage.cfg b/board/freescale/lx2160ardb/genimage.cfg
new file mode 100644
index 000000000000..f895a5ab5e7f
--- /dev/null
+++ b/board/freescale/lx2160ardb/genimage.cfg
@@ -0,0 +1,47 @@
+image sdcard.img {
+	/* Primary GPT table needs to be moved to a region which does
+	 * not collide with the RCW/PBI location
+	 */
+	hdimage {
+		partition-table-type = "gpt"
+		gpt-location = 6M
+	}
+
+	partition rcw {
+		offset = 4K
+		in-partition-table = "no"
+		image = "bl2_sd.pbl"
+	}
+
+	partition u-boot {
+		offset = 1M
+		in-partition-table = "no"
+		image = "fip.bin"
+	}
+
+	partition u-boot-environment {
+		in-partition-table = "no"
+		image = "uboot-env.bin"
+		offset = 5M
+	}
+
+	/* Offset must match PLAT_DDR_FIP_OFFSET from ATF */
+	partition ddr-phy {
+		in-partition-table = "no"
+		image = "fip_ddr.bin"
+		offset = 8M
+	}
+
+	/* Offset must match IN112525_FW_ADDR from U-Boot */
+	partition 25ge-retimer-ucode {
+		in-partition-table = "no"
+		image = "in112525-phy-ucode.txt"
+		offset = 0x980000
+	}
+
+	partition rootfs {
+		bootable = "true"
+		image = "rootfs.ext4"
+		partition-uuid = %PARTUUID%
+	}
+}
diff --git a/board/freescale/lx2160ardb/patches/arm-trusted-firmware/arm-trusted-firmware.hash b/board/freescale/lx2160ardb/patches/arm-trusted-firmware/arm-trusted-firmware.hash
new file mode 100644
index 000000000000..94b75bb73190
--- /dev/null
+++ b/board/freescale/lx2160ardb/patches/arm-trusted-firmware/arm-trusted-firmware.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256  738f029c6bfcdac5649e2c252970b1f44c1ce7fee9fe4657a25edc666375ffa8  atf-lf-6.12.20-2.0.0.tar.gz
diff --git a/board/freescale/lx2160ardb/patches/linux-headers/linux-headers.hash b/board/freescale/lx2160ardb/patches/linux-headers/linux-headers.hash
new file mode 120000
index 000000000000..5808d92afe89
--- /dev/null
+++ b/board/freescale/lx2160ardb/patches/linux-headers/linux-headers.hash
@@ -0,0 +1 @@
+../linux/linux.hash
\ No newline at end of file
diff --git a/board/freescale/lx2160ardb/patches/linux/linux.hash b/board/freescale/lx2160ardb/patches/linux/linux.hash
new file mode 100644
index 000000000000..3aea05469cc0
--- /dev/null
+++ b/board/freescale/lx2160ardb/patches/linux/linux.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256  c98177e85ace6400b06301101af3065e90463920c3e166da4ed22deffe960fb8  linux-lf-6.12.20-2.0.0.tar.gz
diff --git a/board/freescale/lx2160ardb/patches/uboot/uboot.hash b/board/freescale/lx2160ardb/patches/uboot/uboot.hash
new file mode 100644
index 000000000000..1072686160f5
--- /dev/null
+++ b/board/freescale/lx2160ardb/patches/uboot/uboot.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256  a39f7db3ffd2b7263ea5d02b0631decac1c89f7c1b96b77ba8e302f3641a3eb3  u-boot-lf-6.12.20-2.0.0.tar.gz
diff --git a/board/freescale/lx2160ardb/post-build.sh b/board/freescale/lx2160ardb/post-build.sh
new file mode 100755
index 000000000000..4042bf9c7e24
--- /dev/null
+++ b/board/freescale/lx2160ardb/post-build.sh
@@ -0,0 +1,11 @@
+#!/bin/sh
+
+BOARD_DIR="$(dirname "$0")"
+PARTUUID="$("$HOST_DIR/bin/uuidgen")"
+
+install -d "$TARGET_DIR/boot/extlinux/"
+# Default DPL and DPC selections for mcinitcmd
+ln -sf dpc-usxgmii.dtb "$TARGET_DIR/boot/dpc.dtb"
+ln -sf dpl-eth.19.dtb "$TARGET_DIR/boot/dpl.dtb"
+sed "s/%PARTUUID%/$PARTUUID/g" "$BOARD_DIR/extlinux.conf" > "$TARGET_DIR/boot/extlinux/extlinux.conf"
+sed "s/%PARTUUID%/$PARTUUID/g" "$BOARD_DIR/genimage.cfg" > "$BINARIES_DIR/genimage.cfg"
diff --git a/board/freescale/lx2160ardb/rcw_2200_750_3200_19_5_2_sd.rcw b/board/freescale/lx2160ardb/rcw_2200_750_3200_19_5_2_sd.rcw
new file mode 100644
index 000000000000..4c4b7d9c7995
--- /dev/null
+++ b/board/freescale/lx2160ardb/rcw_2200_750_3200_19_5_2_sd.rcw
@@ -0,0 +1,67 @@
+/*
+ * SerDes Protocol 1 -  19
+ * SerDes Protocol 2 -  5
+ * SerDes Protocol 3 -  2
+ *
+ * Frequencies:
+ * Core     -- 2200 MHz
+ * Platform -- 750  MHz
+ * DDR      -- 3200 MT/s
+ */
+
+#include <../lx2160asi/lx2160a.rcwi>
+
+SYS_PLL_RAT=15
+MEM_PLL_CFG=3
+MEM_PLL_RAT=32
+MEM2_PLL_CFG=3
+MEM2_PLL_RAT=32
+CGA_PLL1_RAT=22
+CGA_PLL2_RAT=22
+CGB_PLL1_RAT=22
+CGB_PLL2_RAT=9
+HWA_CGA_M1_CLK_SEL=1
+HWA_CGB_M1_CLK_SEL=6
+BOOT_LOC=8
+SYSCLK_FREQ=600
+IIC2_PMUX=6
+IIC3_PMUX=2
+IIC4_PMUX=2
+USB3_CLK_FSEL=39
+SRDS_PLL_PD_PLL5=1
+SRDS_PRTCL_S1=19
+SRDS_PRTCL_S2=5
+SRDS_PRTCL_S3=2
+SRDS_PLL_REF_CLK_SEL_S1=2
+SRDS_DIV_PEX_S1=1
+SRDS_DIV_PEX_S2=1
+SRDS_DIV_PEX_S3=1
+
+/* Errata to write on scratch reg for validation */
+#include <../lx2160asi/scratchrw1.rcw>
+
+/* Boot Location Pointer */
+#include <../lx2160asi/bootlocptr_sd.rcw>
+
+/* Errata for SATA controller */
+#include <../lx2160asi/a010554.rcw>
+
+/* common PBI commands */
+#include <../lx2160asi/common.rcw>
+
+/* Modify FlexSPI Clock Divisor value */
+#include <../lx2160asi/flexspi_divisor_32.rcw>
+
+/*PCIe Errata A-009531*/
+#include <../lx2160asi/a009531_PEX3.rcw>
+#include <../lx2160asi/a009531_PEX5.rcw>
+
+/*PCIe Errata A-008851*/
+#include <../lx2160asi/a008851_PEX3.rcw>
+#include <../lx2160asi/a008851_PEX5.rcw>
+
+/*SerDes Errata A-050479*/
+#include <../lx2160asi/a050479.rcw>
+
+/* Errata A-050426 */
+#include <../lx2160asi/a050426.rcw>
diff --git a/board/freescale/lx2160ardb/readme.txt b/board/freescale/lx2160ardb/readme.txt
new file mode 100644
index 000000000000..6466b843caef
--- /dev/null
+++ b/board/freescale/lx2160ardb/readme.txt
@@ -0,0 +1,129 @@
+**************
+NXP LX2160ARDB
+**************
+
+This file documents the Buildroot support for the LX2160A Reference Design Board.
+
+For more details about the board and the QorIQ Layerscape SoC, see the
+following pages (notably the "LX2160A Reference Design Board Getting Started
+Guide", for which this guide serves as an addition, not a replacement):
+  - https://www.nxp.com/design/design-center/software/qoriq-developer-resources/layerscape-lx2160a-reference-design-board:LX2160A-RDB
+  - https://www.nxp.com/LX2160A
+
+Layerscape platforms are officially supported by NXP under the Layerscape
+Debian Linux SDK (LDLSDK). This uses components from Linux Factory (project
+common with i.MX), but has a slower release cadence than LF. The currently used
+tag is lf-6.12.20-2.0.0, which is in line with the latest LF tag. Generally, in
+Buildroot, the latest Linux Factory release tag is always used, which may be
+considered pre-release software, as it may contain features which are not yet
+documented, and it generally undergoes less testing.
+
+For the software Layerscape Debian Linux SDK User Guide, see:
+  - https://docs.nxp.com/bundle/UG10143/page/topics/about_this_document.html
+  - https://www.nxp.com/docs/en/user-guide/UG10143.pdf
+
+The components from NXP are:
+  - atf (fork), lf-6.12.20-2.0.0
+  - linux (fork), lf-6.12.20-2.0.0
+  - qoriq-ddr-phy-binary (blob), lf-6.12.20-2.0.0
+  - qoriq-firmware-inphi (blob), static commit
+  - qoriq-mc-binary (blob), mc_release_10.39.0
+  - qoriq-mc-utils, mc_release_10.39.0
+  - qoriq-rcw, lf-6.12.20-2.0.0
+  - qoriq-restool, lf-6.12.20-2.0.0
+  - uboot (fork), lf-6.12.20-2.0.0
+
+Build
+=====
+
+First, configure Buildroot for the LX2160ARDB board:
+
+  make lx2160rdb_defconfig
+
+Build all components:
+
+  make
+
+You will find in output/images/ the following files:
+  - bl2_sd.pbl - RCW + ATF BL2 stage
+  - dpc-usxgmii.dtb - the default DPC file
+  - dpc-warn.dtb
+  - dpl-2dpni.dtb
+  - dpl-eth.19.dtb - the default DPL file
+  - fip_ddr.bin - DDR PHY firmware
+  - fip.bin - U-Boot packaged as ATF payload
+  - fsl-lx2160a-rdb.dtb
+  - Image
+  - in112525-phy-ucode.txt - Firmware file for 25GbE SFP+ retimer
+  - mc.itb - MC firmware
+  - PBL.bin
+  - rootfs.ext2
+  - rootfs.ext4
+  - sdcard.img
+  - u-boot.bin
+  - uboot-env.bin
+
+Create a bootable SD card
+=========================
+
+To determine the device associated to the SD card have a look in the
+/proc/partitions file:
+
+  cat /proc/partitions
+
+Buildroot prepares a bootable "sdcard.img" image in the output/images/
+directory, ready to be dumped on a SD card. Launch the following
+command as root:
+
+  dd if=output/images/sdcard.img of=/dev/sdX
+
+The SD card image can also be programmed from a live system running U-Boot:
+
+  => setenv autoload off && tftp $load_addr sdcard.img && mmc dev 0 && mmc write $load_addr 0 0x80000
+
+*** WARNING! This will destroy all the card content. Use with care! ***
+
+For details about the medium image layout, see the definition in
+board/freescale/lx2160ardb/genimage.cfg.
+
+Boot the LX2160ARDB board
+=========================
+
+To boot your newly created system:
+- insert the SD card in the SD slot of the board;
+- Configure the switches SW1[1:4] = 0b1000 (select SD Card boot option),
+  or alternatively, run "qixis_reset sd" from a U-Boot booted from a different
+  boot source (NOR, eMMC etc).
+- put a DB9F cable into the UART1 Port and connect using a terminal
+  emulator at 115200 bps, 8n1;
+- power on the board.
+
+The DPL and DPC files provided by NXP are not maximal configurations.
+They only contain a static description for:
+- the 40GbE QSFP+ MAC2 (which implicitly has MAC_LINK_TYPE_FIXED, because its
+  entry is missing from the DPC, and this means that the link state is provided
+  by the MC firmware)
+- the 1GbE RGMII MAC17 (specified as MAC_LINK_TYPE_PHY in the DPC, which means
+  that the link state is provided by phylink).
+
+The extra interfaces routed to front panel ports are endpmac3, endpmac4,
+endpmac5, endpmac6 and endpmac18. Among the more usual networking choices, one
+could create individual DPNIs for each MAC:
+
+$ ls-addni dpmac.3 && ls-addni dpmac.4 && ls-addni dpmac.5 && ls-addni dpmac.6 && ls-addni dpmac.18
+
+or a DPSW object to accelerate L2 forwarding between them:
+
+$ ls-addsw --num-ifs=4 --max-fdbs=4 --flooding-cfg=DPSW_FLOODING_PER_FDB \
+       --broadcast-cfg=DPSW_BROADCAST_PER_FDB dpmac.3 dpmac.4 dpmac.5 dpmac.6
+$ ip link add br0 type bridge vlan_filtering 1 && ip link set br0 up
+$ for eth in endpmac3 endpmac4 endpmac5 endpmac6; do \
+       ip link set $eth master br0 && ip link set $eth up; done
+
+Once the runtime configuration is satisfactory, it can be converted back into a
+permanent DPL file which can be plugged back into the build system:
+
+$ restool dprc generate-dpl > dpl-new.dts
+
+Using the device tree compiler (dtc), the new DPL can be transformed into a
+.dtb file and deployed as a custom networking configuration upon the next boot.
diff --git a/board/freescale/lx2160ardb/uboot-env.txt b/board/freescale/lx2160ardb/uboot-env.txt
new file mode 100644
index 000000000000..710597252eef
--- /dev/null
+++ b/board/freescale/lx2160ardb/uboot-env.txt
@@ -0,0 +1,36 @@
+BOARD=lx2160ardb
+arch=arm
+baudrate=115200
+board=lx2160a
+board_name=lx2160a
+boot_script_dhcp=boot.scr.uimg
+boot_script_hdr=hdr_lx2160ardb_bs.out
+boot_scripts=lx2160ardb_boot.scr
+boot_targets=usb0 mmc0 mmc1 scsi0 dhcp
+bootargs=console=ttyAMA0,115200 root=/dev/ram0 earlycon=pl011,mmio32,0x21c0000 ramdisk_size=0x2000000 default_hugepagesz=1024m hugepagesz=1024m hugepages=2 pci=pcie_bus_perf
+cpu=armv8
+ethprime=DPMAC1@xgmii
+fdt_addr=0x90000000
+fdt_addr_r=0x90000000
+fdt_high=0xa0000000
+fdtheader_addr_r=0x80100000
+hwconfig=fsl_ddr:bank_intlv=auto
+initrd_high=0xffffffffffffffff
+kernel_addr_r=0x81000000
+kernel_addr_sd=0x8000
+kernel_size=0x2800000
+kernel_size_sd=0x14000
+kernel_start=0x1000000
+kernelhdr_addr_sd=0x3000
+kernelhdr_size_sd=0x20
+kernelheader_addr_r=0x80200000
+kernelheader_size=0x40000
+kernelheader_start=0x600000
+load_addr=0xa0000000
+loadaddr=0x90000000
+ramdisk_addr=0x800000
+ramdisk_size=0x2000000
+scriptaddr=0x80000000
+scripthdraddr=0x80080000
+soc=fsl-layerscape
+vendor=freescale
diff --git a/configs/lx2160ardb_defconfig b/configs/lx2160ardb_defconfig
new file mode 100644
index 000000000000..b72c1c4056a6
--- /dev/null
+++ b/configs/lx2160ardb_defconfig
@@ -0,0 +1,57 @@
+BR2_aarch64=y
+BR2_cortex_a72=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y
+BR2_GLOBAL_PATCH_DIR="board/freescale/lx2160ardb/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
+BR2_TARGET_GENERIC_HOSTNAME="lx2160ardb"
+BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
+BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
+BR2_ROOTFS_OVERLAY="board/freescale/common/rootfs_overlay"
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/freescale/lx2160ardb/post-build.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c $(BINARIES_DIR)/genimage.cfg"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,nxp-qoriq,linux,lf-6.12.20-2.0.0)/linux-lf-6.12.20-2.0.0.tar.gz"
+BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
+BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="$(LINUX_DIR)/arch/arm64/configs/lsdk.config"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="freescale/fsl-lx2160a-rdb"
+BR2_LINUX_KERNEL_INSTALL_TARGET=y
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_ROOTFS_EXT2_SIZE="130M"
+BR2_TARGET_ROOTFS_CPIO=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION="$(call github,nxp-qoriq,atf,lf-6.12.20-2.0.0)/atf-lf-6.12.20-2.0.0.tar.gz"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="lx2160ardb"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_FIP=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_RCW=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_UBOOT_AS_BL33=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES="BOOT_MODE=sd"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_IMAGES="fip.bin bl2_sd.pbl"
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,nxp-qoriq,u-boot,lf-6.12.20-2.0.0)/u-boot-lf-6.12.20-2.0.0.tar.gz"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="lx2160ardb_tfa"
+BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_QORIQ_RCW=y
+BR2_PACKAGE_HOST_QORIQ_RCW_CUSTOM_PATH="board/freescale/lx2160ardb/rcw_2200_750_3200_19_5_2_sd.rcw"
+BR2_PACKAGE_HOST_UBOOT_TOOLS=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS_ENVIMAGE=y
+# Obtained from "env default -a" plus a custom mcinitcmd
+BR2_PACKAGE_HOST_UBOOT_TOOLS_ENVIMAGE_SOURCE="board/freescale/lx2160ardb/uboot-env.txt board/freescale/common/env-distro-boot-layerscape.txt board/freescale/common/env-dpaa2.txt"
+BR2_PACKAGE_HOST_UBOOT_TOOLS_ENVIMAGE_SIZE="0x2000"
+BR2_PACKAGE_QORIQ_DDR_PHY_BINARY=y
+BR2_PACKAGE_QORIQ_MC_BINARY=y
+BR2_PACKAGE_QORIQ_MC_BINARY_TARGET_LX2160A=y
+BR2_PACKAGE_QORIQ_MC_BINARY_TARGET_INSTALL_PATH="boot"
+BR2_PACKAGE_QORIQ_MC_UTILS=y
+BR2_PACKAGE_QORIQ_MC_UTILS_DPC_INTREE="lx2160a/LX2160A-RDB/dpc-usxgmii lx2160a/LX2160A-RDB/dpc-warn"
+BR2_PACKAGE_QORIQ_MC_UTILS_DPL_INTREE="lx2160a/LX2160A-RDB/dpl-2dpni lx2160a/LX2160A-RDB/dpl-eth.19"
+BR2_PACKAGE_QORIQ_MC_UTILS_TARGET_INSTALL_PATH="boot"
+BR2_PACKAGE_QORIQ_RESTOOL=y
+BR2_PACKAGE_QORIQ_FIRMWARE_INPHI=y
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
