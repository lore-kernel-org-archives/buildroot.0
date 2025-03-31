Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 334A5C3600B
	for <buildroot@archiver.kernel.org>; Mon, 31 Mar 2025 10:40:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C903760804;
	Mon, 31 Mar 2025 10:40:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2wKyB1UXSrE8; Mon, 31 Mar 2025 10:40:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D7D1860856
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D7D1860856;
	Mon, 31 Mar 2025 10:40:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 06955D0
 for <buildroot@buildroot.org>; Mon, 31 Mar 2025 10:40:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E47D34102E
 for <buildroot@buildroot.org>; Mon, 31 Mar 2025 10:40:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ij-1hqEwDiI6 for <buildroot@buildroot.org>;
 Mon, 31 Mar 2025 10:40:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=olteanv@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org AD6744103D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AD6744103D
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AD6744103D
 for <buildroot@buildroot.org>; Mon, 31 Mar 2025 10:40:02 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-43cf825f46bso1914885e9.3
 for <buildroot@buildroot.org>; Mon, 31 Mar 2025 03:40:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743417600; x=1744022400;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0UgQqqwH0PkJy6PSGitao/TRTXJO4T4FKXTcv++5oNE=;
 b=nC/vLYmrnrCidAl+9zfSKoZ9tP8DIygeEW0pAPiMWGgHzto2KG40aEex+jyVGU/4A7
 vR3g10s5FHEvMdtUXdBVLp4lJSads0ifBaeRRc8qdxvULX9S1u2D9cPlzrRpN5j2DOfS
 blWYfx//x8XbklfEV+i/B6jXrtvjEi5RlMvcVkfWjpZhvtU4ELrFbWbiy8rm3A1dr8Hb
 CM9CqZfbmPyxYbIHj7SW0KxLCwFHhBO1vBTo1YEjBNY5qQ1ju2VMAEBUJfmth4upl4BM
 SYnF9XJ6IjA/m8VnBQOK0xKArgA9T1rUJzpJZCnLCJtKXfJKOuUsYlJ9kfyZheqphL0s
 13+w==
X-Gm-Message-State: AOJu0Yxov8nYvTQhIpCPEG1LtIDZ1kY58k25kTjQYX89/bOsg3o9HcZV
 V1joWpaIx2CdYHvXdMAvnFNRjxWSa+pVcxKSwA3IRhZ5m5zET2F9
X-Gm-Gg: ASbGncu9Y2By2RuZECxFQHKYpyX6QOuma4DtY6hnH6iCeU4uTApAq2CesmtBmHfc0sm
 kkPyXvW+qKIU/2kEWGsPMOEMYo25eq3t2sDUsHoYL1qZkLKLVrpDiF4tdeinhJBadHKNfh3b6Q7
 JKsVBu0ewtx7aPreKEBPjhGDR7lgnrUChmCYU/nQ9pSkxuX9Olr1BtvcT05Job0ZOxKKIQGXrNE
 AGtOc2CO2x39P8YAxpIV/RG9E6wJPDOICrLFhtDdnmkqnkiCFCqL2lHQkuepE0eQFD3hv5OOy6B
 BgIorEMdUcy8sN1X+WwQeQQAd8ISN8fC
X-Google-Smtp-Source: AGHT+IH53ZL65SxLIiHw5K+kV/NdEMVoInbhlJbG3A46IArsGIqIHk55KpCGG45frxwMDloCbYwHmA==
X-Received: by 2002:a05:600c:871b:b0:439:a3df:66f3 with SMTP id
 5b1f17b1804b1-43db8524b28mr28960195e9.6.1743417600413; 
 Mon, 31 Mar 2025 03:40:00 -0700 (PDT)
Received: from skbuf ([188.25.50.178]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d8ff042c8sm117605645e9.27.2025.03.31.03.39.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Mar 2025 03:39:58 -0700 (PDT)
Date: Mon, 31 Mar 2025 13:39:56 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: Vincent Jardin <vjardin@free.fr>
Message-ID: <20250331103956.tdwjd3xl7jaihse7@skbuf>
References: <20250328180427.3434693-1-olteanv@gmail.com>
 <20250328180427.3434693-19-olteanv@gmail.com>
 <7rnjce73dhujdnipfea5e2qg7z7g7moczlzbkzsrxzggse2rkb@lpmauc2r4qc6>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7rnjce73dhujdnipfea5e2qg7z7g7moczlzbkzsrxzggse2rkb@lpmauc2r4qc6>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1743417600; x=1744022400; darn=buildroot.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=0UgQqqwH0PkJy6PSGitao/TRTXJO4T4FKXTcv++5oNE=;
 b=msSzO49U5JC9TJAlqsb7C+WxP1PmCKkAQv4yixQuxfkfwe+65HMXr3dLpjs61ZLqUd
 A0Ml8GmS9HIQ4kBakquQLl1SMi0V7zEQCr77S9UO2WUt9TsQ/s/AyVopxUh3NNuaoPXE
 S3xQyuzyy1MpsJ/pILyhnnxw18k2YAahZvBjJ++WmQDc8KdSUfQzgpXPNn8pV+P+FbWN
 FlOJmCOcr9AVKFKVGjn5WQu7eGvIluFuRQbRZBiMBS/BiCFTfXUdonNUelNXvU8TSmy+
 LKU5IAEzt9h+/gX/9kQq+4Aol4YuiveCJZZwlM402dOrgDyJJ3OUK5RUeityzRVZ7gmC
 s9mQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=msSzO49U
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

Hi Vincent,

On Sat, Mar 29, 2025 at 03:09:30AM +0100, Vincent Jardin wrote:
> > +++ b/board/freescale/lx2160ardb/genimage.cfg
> > @@ -0,0 +1,47 @@
> > +image sdcard.img {
> 
> Those offsets for a sdcard are valide, but when they are used for a SD
> card, the documentation seems to recommend the usage with Block# while
> the offset is rather for the Flash. 
> 
> https://github.com/NXP/flexbuild/blob/main/docs/memory_layout.txt
> 
> I believe that matters in order to keep it reasily readable/reviewable
> from the documentation. Moreover, it matters for the ucode because:
> #ifdef CONFIG_SD_BOOT
> #define IN112525_FW_ADDR        0x980000
> #else
> #define IN112525_FW_ADDR        0x20980000
> #endif
> #define IN112525_FW_LENGTH      0x40000
> 
> which by the way seems to be a mistake from the NXP documentation:
>  |Ethernet PHY firmware        | 256KB   | 0x00980000   | 0x04C00         |
> 
> printf "%x" $(( $(printf "%d" 0x04C00 ) * 512 ))
> 0x980000

What's the problem and your recommendation? I don't understand.
The genimage "offset" is in bytes, see https://github.com/pengutronix/genimage.

> > +sha256  2751fcd3eb9080c34531f68ca2e1f571a60f4220853df53a5ebed9835abf8c13  atf-lf-6.12.3-1.0.0.tar.gz
> 
> Why not using the upstream ATF ? The more we use some vendor branches,
> the less we get from the updates of the upstreams such as CVEs.

Answering here generally for all NXP components: the reason is pragmatic.
The LX2160A-RDB is a board officially supported by the NXP BSP, any bug
in these components is the direct responsibility of NXP to fix, and not
mine as an individual integrator with limited free time. Additionally,
the BSP provides the most feature-complete experience for this board.
Upstreaming is desirable and is also in the best interest of NXP
engineers, but development constraints are such that not all features
are upstream.

This doesn't have to be the case for custom boards based on the LX2160A,
and anybody is free to maintain software based on upstream, but for the
RDB, I don't see why not.

I don't know if you are talking about any specific CVE for ATF, but the
Linux Factory process does track upstream and periodically rebase. An
argument can perhaps be made about the pace of updates, but the trees
are not disconnected from upstream.

> Does it really make sense to follow NXP's documentation ?

I don't understand this question?

> > +++ b/board/freescale/lx2160ardb/readme.txt
> > @@ -0,0 +1,124 @@
> > +The components from NXP are:
> > +  - rcw, lf-6.12.3-1.0.0
> > +  - atf (fork), lf-6.12.3-1.0.0
> > +  - uboot (fork), lf-6.12.3-1.0.0
> > +  - cadence-dp-firmware (blob), lf-6.12.3-1.0.0
> 
> Which cadence blob is used ? From the output/images, you do not have any
> references.

It is a mistake, I took the README from the LS1028A-RDB and adapted it,
there is no Cadence DisplayPort firmware, this line should be removed.

> > +++ b/board/freescale/lx2160ardb/uboot-env.txt
> > @@ -0,0 +1,77 @@
> > +BOARD=lx2160ardb
> > +arch=arm
> > +baudrate=115200
> > +board=lx2160a
> > +board_name=lx2160a
> > +boot_a_script=load ${devtype} ${devnum}:${distro_bootpart} ${scriptaddr} ${prefix}${script}; env exists secureboot && load ${devtype} ${devnum}:${distro_bootpart} ${scripthdraddr} ${prefix}${boot_script_hdr} && esbc_validate ${scripthdraddr};source ${scriptaddr}
> > +boot_efi_binary=load ${devtype} ${devnum}:${distro_bootpart} ${kernel_addr_r} efi/boot/bootaa64.efi; if fdt addr -q ${fdt_addr_r}; then bootefi ${kernel_addr_r} ${fdt_addr_r};else bootefi ${kernel_addr_r} ${fdtcontroladdr};fi
> > +boot_efi_bootmgr=if fdt addr -q ${fdt_addr_r}; then bootefi bootmgr ${fdt_addr_r};else bootefi bootmgr;fi
> > +boot_extlinux=sysboot ${devtype} ${devnum}:${distro_bootpart} any ${scriptaddr} ${prefix}${boot_syslinux_conf}
> > +boot_net_usb_start=usb start
> > +boot_pci_enum=pci enum
> > +boot_prefixes=/ /boot/
> > +boot_script_dhcp=boot.scr.uimg
> > +boot_script_hdr=hdr_lx2160ardb_bs.out
> > +boot_scripts=lx2160ardb_boot.scr
> > +boot_syslinux_conf=extlinux/extlinux.conf
> > +boot_targets=usb0 mmc0 mmc1 scsi0 dhcp
> > +bootargs=console=ttyAMA0,115200 root=/dev/ram0 earlycon=pl011,mmio32,0x21c0000 ramdisk_size=0x2000000 default_hugepagesz=1024m hugepagesz=1024m hugepages=2 pci=pcie_bus_perf
> > +bootcmd=run distro_bootcmd
> > +bootcmd_dhcp=devtype=dhcp; run boot_net_usb_start; run boot_pci_enum; if dhcp ${scriptaddr} ${boot_script_dhcp}; then source ${scriptaddr}; fi;setenv efi_fdtfile ${fdtfile}; setenv efi_old_vci ${bootp_vci};setenv efi_old_arch ${bootp_arch};setenv bootp_vci PXEClient:Arch:00011:UNDI:003000;setenv bootp_arch 0xb;if dhcp ${kernel_addr_r}; then tftpboot ${fdt_addr_r} dtb/${efi_fdtfile};if fdt addr -q ${fdt_addr_r}; then bootefi ${kernel_addr_r} ${fdt_addr_r}; else bootefi ${kernel_addr_r} ${fdtcontroladdr};fi;fi;setenv bootp_vci ${efi_old_vci};setenv bootp_arch ${efi_old_arch};setenv efi_fdtfile;setenv efi_old_arch;setenv efi_old_vci;
> > +bootcmd_mmc0=devnum=0; run mmc_boot
> > +bootcmd_mmc1=devnum=1; run mmc_boot
> > +bootcmd_scsi0=devnum=0; run scsi_boot
> > +bootcmd_usb0=devnum=0; run usb_boot
> > +bootdelay=10
> > +console=ttyAMA0,38400n8
> 
> Is it on will ? Shouldn't it be 115200 ?

This is from "env default -a". It seems unused - bootargs sets a
different (and correct) "console" variable.

> It is a quite complex uboot env. Are they really needed ? Can't you
> minimize it since with Buildroot we should start from the small version
> ?, moreover a small env would better match the specific use case of running
> with the SD card you described ?

The idea is, as explained in configs/lx2160ardb_defconfig, that this is:
# Obtained from "env default -a" plus a custom mcinitcmd
Perhaps this is not the most maintainable way, but I wanted to patch the
existing default environment, and the only way I saw how to do that was
to copy it in its entirety.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
