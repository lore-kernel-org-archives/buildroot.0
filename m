Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F004C3600B
	for <buildroot@archiver.kernel.org>; Wed, 26 Mar 2025 23:47:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EC582847BA;
	Wed, 26 Mar 2025 23:47:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7FXIzcvu4NNT; Wed, 26 Mar 2025 23:46:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E881581E6B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E881581E6B;
	Wed, 26 Mar 2025 23:46:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id B06CE12A
 for <buildroot@buildroot.org>; Wed, 26 Mar 2025 23:46:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AD75741968
 for <buildroot@buildroot.org>; Wed, 26 Mar 2025 23:46:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UIecOC5-gDXJ for <buildroot@buildroot.org>;
 Wed, 26 Mar 2025 23:46:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=vjardin@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 79613419CB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 79613419CB
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 79613419CB
 for <buildroot@buildroot.org>; Wed, 26 Mar 2025 23:46:56 +0000 (UTC)
Received: from L25025.local (unknown
 [IPv6:2a01:e0a:2af:22b0:70e4:c237:6624:9e80])
 (Authenticated sender: vjardin@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id D227913F854;
 Thu, 27 Mar 2025 00:46:49 +0100 (CET)
Date: Thu, 27 Mar 2025 00:46:47 +0100
From: Vincent Jardin <vjardin@free.fr>
To: Vladimir Oltean <olteanv@gmail.com>
Cc: buildroot@buildroot.org, Romain Naour <romain.naour@smile.fr>, 
 Julien Olivain <ju.o@free.fr>
Message-ID: <cvetqerrphqtbap7sl5kwuanjhgfecwumd424gs4ib457kpq6d@apo2ws24aqxz>
References: <20250318163228.9989-1-vjardin@free.fr>
 <kxf5rnunnok625w5yglz2hhylmha633bvma3sa4mcvnjy5vl6p@6jl2dapqadt6>
 <20250326142045.do23qo6dh4qkgu5l@skbuf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250326142045.do23qo6dh4qkgu5l@skbuf>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1743032813;
 bh=ocL7b5KHMQFPS8BJkNFEjxNHKmljUJ3Co8T8euMQRn4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KOAqR8FdLvaLOEUB85sIythEQU+qWPLs8j1f7gBCoSo/RBxgj2GVD0nks+pefKp8f
 EPrD/B/NRJm77m1MzB+yRj/LgoDgaAHjZpJK80K8xnsVy/iRI+18iShmWL8dPEG9a1
 NR5Tdt5yGqO4/TK3nriG7UMGfGgPh2NoYK/b4qPjjfIzdrHOn0+Q94o8Isk+qgIk68
 wXqQ5nm+5s7r7BOR6ZaVjt5tBElx7XZX1IE3Woeoa55Rzi+MtshpDpbNkEJ4UT5oHH
 zGMRyFgr0TkWJ9TUYbtqioy68vLN5vB8eQLuJwsk7v5G6GdlXE774MC+OJG0JDb6nZ
 F+aSqizzgPuOQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=KOAqR8Fd
Subject: Re: [Buildroot] [PATCH] boot/qoriq-ddr-phy-binary: new package
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

Hi Vladimir,

On Wed, Mar 26, 2025 at 04:20:45PM +0100, Vladimir Oltean wrote:
> You say "the [DDR PHY] firmware is linked by the ATF" and required to
> build it, but that isn't really the case.
> 
> The documentation at https://docs.nxp.com/bundle/UG10143/page/topics/tf-a_features.html
> says:
> 
>   How to compile DDR FIP image (only applicable for LX2160ARDB and LX2162AQDS)
> 
>   A pre-built FIP image is already provided in the release.
>   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>   To regenerate the DDR fip image for LX2160ARDB, and LX2162AQDS, perform
>   the following steps [ proceeds to show how to use fiptool ]:

Thanks for the pointers on this documentation and the below handson.

> In other words, running the commands below results in the exact same
> fip_ddr binary as the atf would produce.
> 
> [vladimir@pc /opt] $ git clone https://github.com/nxp-qoriq/ddr-phy-binary.git qoriq-ddr-phy-binary
> Cloning into 'qoriq-ddr-phy-binary'...
> remote: Enumerating objects: 110, done.
> remote: Counting objects: 100% (43/43), done.
> remote: Compressing objects: 100% (31/31), done.
> remote: Total 110 (delta 25), reused 28 (delta 12), pack-reused 67 (from 1)
> Receiving objects: 100% (110/110), 255.87 KiB | 602.00 KiB/s, done.
> Resolving deltas: 100% (69/69), done.
> [vladimir@pc /opt] $ cd qoriq-ddr-phy-binary
> [vladimir@pc /opt/qoriq-ddr-phy-binary] $ /opt/qoriq-atf/tools/fiptool/fiptool info lx2160a/fip_ddr.bin
> DDR UDIMM PHY IMEM 1d FW: offset=0x178, size=0x6BD0, cmdline="--ddr-immem-udimm-1d"
> DDR UDIMM PHY IMEM 2d FW: offset=0x6D48, size=0x694C, cmdline="--ddr-immem-udimm-2d"
> DDR UDIMM PHY DMEM 1d FW: offset=0xD694, size=0x6D0, cmdline="--ddr-dmmem-udimm-1d"
> DDR UDIMM PHY DMEM 2d FW: offset=0xDD64, size=0x5BC, cmdline="--ddr-dmmem-udimm-2d"
> DDR RDIMM PHY IMEM 1d FW: offset=0xE320, size=0x7050, cmdline="--ddr-immem-rdimm-1d"
> DDR RDIMM PHY IMEM 2d FW: offset=0x15370, size=0x6D14, cmdline="--ddr-immem-rdimm-2d"
> DDR RDIMM PHY DMEM 1d FW: offset=0x1C084, size=0x714, cmdline="--ddr-dmmem-rdimm-1d"
> DDR RDIMM PHY DMEM 2d FW: offset=0x1C798, size=0x5FC, cmdline="--ddr-dmmem-rdimm-2d"
> [vladimir@pc /opt/qoriq-ddr-phy-binary] $ /opt/qoriq-atf/tools/fiptool/fiptool create --ddr-immem-udimm-1d lx2160a/ddr4_pmu_train_imem.bin --ddr-immem-udimm-2d lx2160a/ddr4_2d_pmu_train_imem.bin --ddr-dmmem-udimm-1d lx2160a/ddr4_pmu_train_dmem.bin --ddr-dmmem-udimm-2d lx2160a/ddr4_2d_pmu_train_dmem.bin --ddr-immem-rdimm-1d lx2160a/ddr4_rdimm_pmu_train_imem.bin --ddr-immem-rdimm-2d lx2160a/ddr4_rdimm2d_pmu_train_imem.bin --ddr-dmmem-rdimm-1d lx2160a/ddr4_rdimm_pmu_train_dmem.bin --ddr-dmmem-rdimm-2d lx2160a/ddr4_rdimm2d_pmu_train_dmem.bin fip_ddr_new.bin
> [vladimir@pc /opt/qoriq-ddr-phy-binary] $ diff fip_ddr_new.bin lx2160a/fip_ddr.bin
> [vladimir@pc /opt/qoriq-ddr-phy-binary] $ echo $?
> 0

Yes, I had identified the same and I it is a good ack't that we can
rebuild it.

> Even at runtime, the DDR PHY firmware is not compiled into the ATF firmware.

Yes, I did notice it when reading the scripts.

> But, my understanding is that one might want to re-generate another
> Firmware Image Package (FIP) with DDR PHY firmware only in the case
> where you have a trusted boot flow, and you want to authenticate the
> firmware image by signing it with your own keys (more in
> docs/plat/nxp/nxp-ls-tbbr.rst). That isn't something I was intending to
> support, but is not something that your proposed patch supports either.

Right, it'll be my intend. I did notice this capability and I was
intending to check it once I'll dig with the complete chain of trust.

> What is your intention? Do you just want me to move this package to
> "boot" because of a misunderstanding, or do you want to support signing
> of the DDR PHY firmware using ATF's build system?

Sorry if I was unclear:
  - the signature will be a support I'll check and I'd like to
    mainstream with Buildroot.
  - it seems for me it was better to align it into the boot/ folder
    since this blob is rather loaded soon by the LX2160 ; so I was
    inspired by the Marvell case.

I do not pretend to have enough expertise with Buildroot, but it seems
for me that boot/ is a better home for such package. Maybe a Buildroot
maintainer can help us to be proper aligned with the intends of the
Buildroot's design ?

Vladimir: what would the rational be to have it into package/ ? Are
there some other cases of boot-stage firmwares that are into package/ ?
Maybe the package/freescale-imx with its FIRMWARE_IMX_PREPARE_DDR_FW
could be a case. What's about the signature of the IMX firmwares ?

Best regards,
  Vincent
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
