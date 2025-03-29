Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E291EC28B20
	for <buildroot@archiver.kernel.org>; Sat, 29 Mar 2025 02:09:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 34A534F2A1;
	Sat, 29 Mar 2025 02:09:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A_afC1wVeDTA; Sat, 29 Mar 2025 02:09:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DAA804F2AF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DAA804F2AF;
	Sat, 29 Mar 2025 02:09:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 6097B12A
 for <buildroot@buildroot.org>; Sat, 29 Mar 2025 02:09:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 525BA40B16
 for <buildroot@buildroot.org>; Sat, 29 Mar 2025 02:09:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 18lIeov-1djt for <buildroot@buildroot.org>;
 Sat, 29 Mar 2025 02:09:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=vjardin@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E007C409B7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E007C409B7
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E007C409B7
 for <buildroot@buildroot.org>; Sat, 29 Mar 2025 02:09:40 +0000 (UTC)
Received: from L25025.local (unknown
 [IPv6:2a01:e0a:2af:22b0:3038:3592:8fe6:63f8])
 (Authenticated sender: vjardin@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 3EE2E19F57B;
 Sat, 29 Mar 2025 03:09:30 +0100 (CET)
Date: Sat, 29 Mar 2025 03:09:30 +0100
From: Vincent Jardin <vjardin@free.fr>
To: Vladimir Oltean <olteanv@gmail.com>
Message-ID: <7rnjce73dhujdnipfea5e2qg7z7g7moczlzbkzsrxzggse2rkb@lpmauc2r4qc6>
References: <20250328180427.3434693-1-olteanv@gmail.com>
 <20250328180427.3434693-19-olteanv@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250328180427.3434693-19-olteanv@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1743214177;
 bh=6t2DV+RmpwlOn02m7dvKUhTa8HW95SICPPwcpglmStA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=n2XpsxsPWIO93KYFQ+b8F43PZrj+O0Mq7ek7Ng3PVTbg18NbklQqDovQEnHSvCy6B
 7nibwHFs5gUr1XCs6Pxo7g7+dKQIi9zPZmNZ4AkVgtvbqIrfuxs/YP1je/HB4VJAbP
 hfnJP3u4wFnzL89oxFKo+AxFcj0xsVWVbGnVODeh2SR5WobiMToZfcc3WUTHkfwf4/
 DV9lMFKXAvmryjJNlRg/jI2+pMSp32KwE/y2IjE9MA7MHvaucHitIE1Jn9W3nKZh7G
 ylLerDNEzVwhteG6EN2sLVw09A44p+tvexdPssdH7sH61RDjFbKgNrE+dw8OTP9vli
 43eevvhsg2ziw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=n2XpsxsP
Subject: Re: [Buildroot] [PATCH v2 18/18] board/lx2160ardb: new platform
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
 Brandon Maier <Brandon.Maier@collins.com>, Julien Olivain <ju.o@free.fr>,
 buildroot@buildroot.org, Romain Naour <romain.naour@smile.fr>,
 Akhilesh Nema <nemaakhilesh@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Vladimir,

see inline

On Fri, Mar 28, 2025 at 08:04:26PM +0100, Vladimir Oltean wrote:
> Add Buildroot support for the NXP LX2160A-RDB (reference design board).
> This is configured here to boot from the SD card. To my surprise, NXP
> RCWs for LX2160A rev2 silicon don't have a pre-existing example for SD
> boot, so until one is available, include the RCW through board files.

> 
> --- /dev/null
> +++ b/board/freescale/lx2160ardb/genimage.cfg
> @@ -0,0 +1,47 @@
> +image sdcard.img {

Those offsets for a sdcard are valide, but when they are used for a SD
card, the documentation seems to recommend the usage with Block# while
the offset is rather for the Flash. 

https://github.com/NXP/flexbuild/blob/main/docs/memory_layout.txt

I believe that matters in order to keep it reasily readable/reviewable
from the documentation. Moreover, it matters for the ucode because:
#ifdef CONFIG_SD_BOOT
#define IN112525_FW_ADDR        0x980000
#else
#define IN112525_FW_ADDR        0x20980000
#endif
#define IN112525_FW_LENGTH      0x40000

which by the way seems to be a mistake from the NXP documentation:
 |Ethernet PHY firmware        | 256KB   | 0x00980000   | 0x04C00         |

printf "%x" $(( $(printf "%d" 0x04C00 ) * 512 ))
0x980000

> +	/* Primary GPT table needs to be moved to a region which does
> +	 * not collide with the RCW/PBI location
> +	 */
> +	hdimage {
> +		partition-table-type = "gpt"
> +		gpt-location = 6M
> +	}
> +
> +	partition rcw {
> +		offset = 4K
> +		in-partition-table = "no"
> +		image = "bl2_sd.pbl"
> +	}
> +
> +	partition u-boot {
> +		offset = 1M
> +		in-partition-table = "no"
> +		image = "fip.bin"
> +	}
> +
> +	partition u-boot-environment {
> +		in-partition-table = "no"
> +		image = "uboot-env.bin"
> +		offset = 5M
> +	}
> +
> +	/* Offset must match PLAT_DDR_FIP_OFFSET from ATF */
> +	partition ddr-phy {
> +		in-partition-table = "no"
> +		image = "fip_ddr.bin"
> +		offset = 8M
> +	}
> +
> +	/* Offset must match IN112525_FW_ADDR from U-Boot */
> +	partition 25ge-retimer-ucode {
> +		in-partition-table = "no"
> +		image = "in112525-phy-ucode.txt"
> +		offset = 0x980000
> +	}
> +
> +	partition rootfs {
> +		bootable = "true"
> +		image = "rootfs.ext4"
> +		partition-uuid = %PARTUUID%
> +	}
> +}

> +sha256  2751fcd3eb9080c34531f68ca2e1f571a60f4220853df53a5ebed9835abf8c13  atf-lf-6.12.3-1.0.0.tar.gz

Why not using the upstream ATF ? The more we use some vendor branches,
the less we get from the updates of the upstreams such as CVEs.

Does it really make sense to follow NXP's documentation ?

> +sha256  8708fc95844d020f79b87f954f29073ae9b230de3e41117e7fb379294da946ac  u-boot-lf-6.12.3-1.0.0.tar.gz

Same arguemnt for uboot, why not the upstream one ?

> +++ b/board/freescale/lx2160ardb/readme.txt
> @@ -0,0 +1,124 @@
> +**************
> +NXP LX2160ARDB
> +**************
> +
> +This file documents the Buildroot support for the LX2160A Reference Design Board.
> +
> +For more details about the board and the QorIQ Layerscape SoC, see the
> +following pages (notably the "LX2160A Reference Design Board Getting Started
> +Guide", for which this guide serves as an addition, not a replacement):
> +  - https://www.nxp.com/design/design-center/software/qoriq-developer-resources/layerscape-lx2160a-reference-design-board:LX2160A-RDB
> +  - https://www.nxp.com/LX2160A
> +
> +Layerscape platforms are officially supported by NXP under the Layerscape
> +Debian Linux SDK (LDLSDK). This uses components from Linux Factory (project
> +common with i.MX), currently tag lf-6.6.36-2.1.0, two releases behind the
> +latest lf-6.12.3-1.0.0.  In Buildroot, the latest Linux Factory release tag
> +is used, which may be considered pre-release software, as it may contain
> +features which are not yet documented, and it generally undergoes less testing.
> +
> +For the software Layerscape Debian Linux SDK User Guide, see:
> +  - https://docs.nxp.com/bundle/UG10143/page/topics/about_this_document.html
> +  - https://www.nxp.com/docs/en/user-guide/UG10143.pdf
> +
> +The components from NXP are:
> +  - rcw, lf-6.12.3-1.0.0
> +  - atf (fork), lf-6.12.3-1.0.0
> +  - uboot (fork), lf-6.12.3-1.0.0
> +  - cadence-dp-firmware (blob), lf-6.12.3-1.0.0

Which cadence blob is used ? From the output/images, you do not have any
references.

> +  - linux (fork), lf-6.12.3-1.0.0

See my comments, what's wrong with using upstream instead of the forks ?

> +You will find in output/images/ the following files:
> +  - bl2_sd.pbl - RCW + ATF BL2 stage
> +  - dpc-usxgmii.dtb - the default DPC file
> +  - dpc-warn.dtb
> +  - dpl-2dpni.dtb
> +  - dpl-eth.19.dtb - the default DPL file
> +  - fip_ddr.bin - DDR PHY firmware
> +  - fip.bin - U-Boot packaged as ATF payload
> +  - fsl-lx2160a-rdb.dtb
> +  - Image
> +  - in112525-phy-ucode.txt - Firmware file for 25GbE SFP+ retimer
> +  - mc.itb - MC firmware
> +  - PBL.bin
> +  - rootfs.ext2
> +  - rootfs.ext4
> +  - sdcard.img
> +  - u-boot.bin
> +  - uboot-env.bin
> +
> +- put a DB9F cable into the UART1 Port and connect using a terminal
> +  emulator at 115200 bps, 8n1;

> +$ restool dprc generate-dpl > dpl-new.dts
> +
> +Using the device tree compiler (dtc), the new DPL can be transformed into a
> +.dtb file and deployed as a custom networking configuration upon the next boot.

Thanks, it is the best handson documentation I ever read on this board.

> +++ b/board/freescale/lx2160ardb/uboot-env.txt
> @@ -0,0 +1,77 @@
> +BOARD=lx2160ardb
> +arch=arm
> +baudrate=115200
> +board=lx2160a
> +board_name=lx2160a
> +boot_a_script=load ${devtype} ${devnum}:${distro_bootpart} ${scriptaddr} ${prefix}${script}; env exists secureboot && load ${devtype} ${devnum}:${distro_bootpart} ${scripthdraddr} ${prefix}${boot_script_hdr} && esbc_validate ${scripthdraddr};source ${scriptaddr}
> +boot_efi_binary=load ${devtype} ${devnum}:${distro_bootpart} ${kernel_addr_r} efi/boot/bootaa64.efi; if fdt addr -q ${fdt_addr_r}; then bootefi ${kernel_addr_r} ${fdt_addr_r};else bootefi ${kernel_addr_r} ${fdtcontroladdr};fi
> +boot_efi_bootmgr=if fdt addr -q ${fdt_addr_r}; then bootefi bootmgr ${fdt_addr_r};else bootefi bootmgr;fi
> +boot_extlinux=sysboot ${devtype} ${devnum}:${distro_bootpart} any ${scriptaddr} ${prefix}${boot_syslinux_conf}
> +boot_net_usb_start=usb start
> +boot_pci_enum=pci enum
> +boot_prefixes=/ /boot/
> +boot_script_dhcp=boot.scr.uimg
> +boot_script_hdr=hdr_lx2160ardb_bs.out
> +boot_scripts=lx2160ardb_boot.scr
> +boot_syslinux_conf=extlinux/extlinux.conf
> +boot_targets=usb0 mmc0 mmc1 scsi0 dhcp
> +bootargs=console=ttyAMA0,115200 root=/dev/ram0 earlycon=pl011,mmio32,0x21c0000 ramdisk_size=0x2000000 default_hugepagesz=1024m hugepagesz=1024m hugepages=2 pci=pcie_bus_perf
> +bootcmd=run distro_bootcmd
> +bootcmd_dhcp=devtype=dhcp; run boot_net_usb_start; run boot_pci_enum; if dhcp ${scriptaddr} ${boot_script_dhcp}; then source ${scriptaddr}; fi;setenv efi_fdtfile ${fdtfile}; setenv efi_old_vci ${bootp_vci};setenv efi_old_arch ${bootp_arch};setenv bootp_vci PXEClient:Arch:00011:UNDI:003000;setenv bootp_arch 0xb;if dhcp ${kernel_addr_r}; then tftpboot ${fdt_addr_r} dtb/${efi_fdtfile};if fdt addr -q ${fdt_addr_r}; then bootefi ${kernel_addr_r} ${fdt_addr_r}; else bootefi ${kernel_addr_r} ${fdtcontroladdr};fi;fi;setenv bootp_vci ${efi_old_vci};setenv bootp_arch ${efi_old_arch};setenv efi_fdtfile;setenv efi_old_arch;setenv efi_old_vci;
> +bootcmd_mmc0=devnum=0; run mmc_boot
> +bootcmd_mmc1=devnum=1; run mmc_boot
> +bootcmd_scsi0=devnum=0; run scsi_boot
> +bootcmd_usb0=devnum=0; run usb_boot
> +bootdelay=10
> +console=ttyAMA0,38400n8

Is it on will ? Shouldn't it be 115200 ?

> +cpu=armv8
> +distro_bootcmd=scsi_need_init=; setenv nvme_need_init; for target in ${boot_targets}; do run bootcmd_${target}; done
> +efi_dtb_prefixes=/ /dtb/ /dtb/current/
> +ethprime=DPMAC1@xgmii
> +fdt_addr=0x90000000
> +fdt_addr_r=0x90000000
> +fdt_high=0xa0000000
> +fdtheader_addr_r=0x80100000
> +hwconfig=fsl_ddr:bank_intlv=auto
> +initrd_high=0xffffffffffffffff
> +kernel_addr_r=0x81000000
> +kernel_addr_sd=0x8000
> +kernel_size=0x2800000
> +kernel_size_sd=0x14000
> +kernel_start=0x1000000
> +kernelhdr_addr_sd=0x3000
> +kernelhdr_size_sd=0x20
> +kernelheader_addr_r=0x80200000
> +kernelheader_size=0x40000
> +kernelheader_start=0x600000
> +load_addr=0xa0000000
> +load_efi_dtb=load ${devtype} ${devnum}:${distro_bootpart} ${fdt_addr_r} ${prefix}${efi_fdtfile}
> +loadaddr=0x90000000
> +dpl_addr_r=0x80d00000
> +mc_fw_addr_r=0x80a00000
> +dpc_addr_r=0x80e00000
> +mcinitcmd=mmc dev 0 && load mmc 0:1 $mc_fw_addr_r /boot/mc.itb && load mmc 0:1 $dpc_addr_r /boot/dpc.dtb && load mmc 0:1 $dpl_addr_r /boot/dpl.dtb && fsl_mc start mc $mc_fw_addr_r $dpc_addr_r && fsl_mc lazyapply dpl $dpl_addr_r
> +mcmemsize=0x70000000
> +fsl_bootcmd_mcinitcmd_set=y
> +mcmemsize=0x70000000
> +mmc_boot=if mmc dev ${devnum}; then devtype=mmc; run scan_dev_for_boot_part; fi
> +nvme_boot=run boot_pci_enum; run nvme_init; if nvme dev ${devnum}; then devtype=nvme; run scan_dev_for_boot_part; fi
> +nvme_init=if ${nvme_need_init}; then setenv nvme_need_init false; nvme scan; fi
> +ramdisk_addr=0x800000
> +ramdisk_size=0x2000000
> +sata_boot=if sata dev ${devnum}; then devtype=sata; run scan_dev_for_boot_part; fi
> +scan_dev_for_boot=echo Scanning ${devtype} ${devnum}:${distro_bootpart}...; for prefix in ${boot_prefixes}; do run scan_dev_for_extlinux; run scan_dev_for_scripts; done;run scan_dev_for_efi;
> +scan_dev_for_boot_part=part list ${devtype} ${devnum} devplist; env exists devplist || setenv devplist 1; for distro_bootpart in ${devplist}; do if fstype ${devtype} ${devnum}:${distro_bootpart} bootfstype; then run scan_dev_for_boot; fi; done
> +scan_dev_for_efi=setenv efi_fdtfile ${fdtfile}; for prefix in ${efi_dtb_prefixes}; do if test -e ${devtype} ${devnum}:${distro_bootpart} ${prefix}${efi_fdtfile}; then run load_efi_dtb; fi;done;run boot_efi_bootmgr;if test -e ${devtype} ${devnum}:${distro_bootpart} efi/boot/bootaa64.efi; then echo Found EFI removable media binary efi/boot/bootaa64.efi; run boot_efi_binary; echo EFI LOAD FAILED: continuing...; fi; setenv efi_fdtfile
> +scan_dev_for_extlinux=if test -e ${devtype} ${devnum}:${distro_bootpart} ${prefix}${boot_syslinux_conf}; then echo Found ${prefix}${boot_syslinux_conf}; run boot_extlinux; echo EXTLINUX FAILED: continuing...; fi
> +scan_dev_for_scripts=for script in ${boot_scripts}; do if test -e ${devtype} ${devnum}:${distro_bootpart} ${prefix}${script}; then echo Found U-Boot script ${prefix}${script}; run boot_a_script; echo SCRIPT FAILED: continuing...; fi; done
> +scriptaddr=0x80000000
> +scripthdraddr=0x80080000
> +scsi_boot=run boot_pci_enum; run scsi_init; if scsi dev ${devnum}; then devtype=scsi; run scan_dev_for_boot_part; fi
> +scsi_init=if ${scsi_need_init}; then scsi_need_init=false; scsi scan; fi
> +sd2_bootcmd=echo Trying load from emmc card..;mmc dev 1; mmcinfo; mmc read $load_addr $kernel_addr_sd $kernel_size_sd ;env exists secureboot && mmc read $kernelheader_addr_r $kernelhdr_addr_sd $kernelhdr_size_sd  && esbc_validate ${kernelheader_addr_r};bootm $load_addr#$BOARD
> +sd_bootcmd=echo Trying load from sd card..;mmc dev 0; mmcinfo; mmc read $load_addr $kernel_addr_sd $kernel_size_sd ;env exists secureboot && mmc read $kernelheader_addr_r $kernelhdr_addr_sd $kernelhdr_size_sd  && esbc_validate ${kernelheader_addr_r};bootm $load_addr#$BOARD
> +soc=fsl-layerscape
> +usb_boot=usb start; if usb dev ${devnum}; then devtype=usb; run scan_dev_for_boot_part; fi
> +vendor=freescale
> +xspi_bootcmd=echo Trying load from flexspi..;sf probe 0:0 && sf read $load_addr $kernel_start $kernel_size ; env exists secureboot &&sf read $kernelheader_addr_r $kernelheader_start $kernelheader_size && esbc_validate ${kernelheader_addr_r};  bootm $load_addr#$BOARD

It is a quite complex uboot env. Are they really needed ? Can't you
minimize it since with Buildroot we should start from the small version
?, moreover a small env would better match the specific use case of running
with the SD card you described ?

> +BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,nxp-qoriq,linux,lf-6.12.3-1.0.0)/linux-lf-6.12.3-1.0.0.tar.gz"

Same question, why not the upstream one ?

> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION="$(call github,nxp-qoriq,atf,lf-6.12.3-1.0.0)/atf-lf-6.12.3-1.0.0.tar.gz"

Same question, why not the upstream one ?

> +BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,nxp-qoriq,u-boot,lf-6.12.3-1.0.0)/u-boot-lf-6.12.3-1.0.0.tar.gz"

Same question, why not the upstream one ?

Best regards,
  Vincent
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
