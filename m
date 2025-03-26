Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60850C36008
	for <buildroot@archiver.kernel.org>; Wed, 26 Mar 2025 14:20:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E7F59611AF;
	Wed, 26 Mar 2025 14:20:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6hhUaVYh2e37; Wed, 26 Mar 2025 14:20:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E683A61254
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E683A61254;
	Wed, 26 Mar 2025 14:20:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id C3D59C0
 for <buildroot@buildroot.org>; Wed, 26 Mar 2025 14:20:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AA3FD40522
 for <buildroot@buildroot.org>; Wed, 26 Mar 2025 14:20:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PiG9ZiTpahHC for <buildroot@buildroot.org>;
 Wed, 26 Mar 2025 14:20:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42e; helo=mail-wr1-x42e.google.com;
 envelope-from=olteanv@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 963EF404A4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 963EF404A4
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 963EF404A4
 for <buildroot@buildroot.org>; Wed, 26 Mar 2025 14:20:50 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-3912387cf48so337881f8f.3
 for <buildroot@buildroot.org>; Wed, 26 Mar 2025 07:20:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742998849; x=1743603649;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uQPA+UTm+SDScO94CFbe73uwnR7j4c+qzAwxnZihd14=;
 b=ISf7sejl1xgQ1/ztcHcumWOnowszqcZGuelSK7q+HOoSyJWVvnxzOw3LdbWc31qLaP
 NJzhGAcWf9x/996k8kew8tmN5j3If0WMPBDhukDuh4c0ObcKjgPamSC7lhWw2ws+usok
 YkDf5gT4Mb85aHTz5u32osbsrYhVhuV7XwYliaeVu5DRJ1nCtVRVwfmL7TlEbaU/DTSQ
 eJ2on6GTHL63JJKZVH4D/4gKSCjir+Hq3/Mo5hclEzhYA9Z+kxF3ElIFdUjJ+6FsHCNB
 LhZ/FLegke/XmqsXmEcykH9PqhVNfd5WGTyRqkIlY9uc6/YRgBGe4MqMrkW2PWZzB2cO
 h+fQ==
X-Gm-Message-State: AOJu0YwUg6w1/YRTq+YmGbop2g0czkLdJ5AN2TV83OOtZml+g2OjpwXp
 /jAEeDHINnAsUlWYnm6A0IiiHu4D7IUDVKsWaZZZcrrfV/lnUSdO
X-Gm-Gg: ASbGncujqNQAShePUOYkKzHYIHZ13b7zuK00h7zjWm5jlT38VDb2hZ4BfoiQrKIfavJ
 3IvyRNVOOzO/N/qDXqL41sS/LCz8V1LHDM8i6a/x/dpB+t9z3tqlzocCSttcCAnjku+27XBbHnO
 i7Dh2ZOQrH6mCahvhoUefPPVtosY8nRh3NjdfpvX1G2/rRBgWotiKcNWbhlMs4KxbnHVnrg33KH
 v5+I3RoRKuv703d9fbMLEPCK2lpmc2GTGCr4/KSomhjopJX4s+cwIfI20LYzWyud3l1GyHddZlN
 0gtkoZzyM5RwHXg/45InNdFkc9ATLiyS
X-Google-Smtp-Source: AGHT+IHPydBhRUXnfmrkEj8PR+Ll0wyQE1pHRzzqSrXr5wFBOL6ykvjVUvjiD2ci60y1OHA6Oa4T/w==
X-Received: by 2002:a5d:6d81:0:b0:391:29ab:c9df with SMTP id
 ffacd0b85a97d-3997f9038a3mr7500240f8f.4.1742998848327; 
 Wed, 26 Mar 2025 07:20:48 -0700 (PDT)
Received: from skbuf ([188.25.110.61]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d82efdffdsm3347945e9.18.2025.03.26.07.20.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Mar 2025 07:20:47 -0700 (PDT)
Date: Wed, 26 Mar 2025 16:20:45 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: Vincent Jardin <vjardin@free.fr>
Cc: buildroot@buildroot.org, Romain Naour <romain.naour@smile.fr>,
 Julien Olivain <ju.o@free.fr>
Message-ID: <20250326142045.do23qo6dh4qkgu5l@skbuf>
References: <20250318163228.9989-1-vjardin@free.fr>
 <kxf5rnunnok625w5yglz2hhylmha633bvma3sa4mcvnjy5vl6p@6jl2dapqadt6>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <kxf5rnunnok625w5yglz2hhylmha633bvma3sa4mcvnjy5vl6p@6jl2dapqadt6>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742998849; x=1743603649; darn=buildroot.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=uQPA+UTm+SDScO94CFbe73uwnR7j4c+qzAwxnZihd14=;
 b=Lzfv+qsQ+OPhDuclDyw9kw9vqV3aMYLnHfaASlqEenEkc/d0FL1dxXVwwMglZO02oz
 w3VLVNBBOVfxq6/bMbUm25jqD2llQ5N/d3Drqu6GIGYGpMqGMLZDcHzWfx6buWuqjucp
 PxHs2IwgFoJicldNrLgBATv4Hi58ru2IT0jV9WvCH2j6QLVwW5nZym5KQ44luT0QmlaN
 I1VcqCnuFHjbiuZ/1isSDE4nnApHG2EhsGdQkHdzjUa7eQ/UXqMr0LhGsHSy5r/8GxMH
 smPe4gMmCjSGEKvsXabZF0AeyeHnmorQQqRGSLhqo8GNMlbFY3Eal8JClBs4IIY3wuXq
 To7A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=Lzfv+qsQ
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

Hi Vincent,

On Tue, Mar 18, 2025 at 05:36:28PM +0100, Vincent Jardin wrote:
> On Tue, Mar 18, 2025 at 05:32:28PM +0100, Vincent Jardin wrote:
> > This firmware is linked and used by the ATF.
> 
> Please, can you consider this move to boot/ ? It seems to be better
> aligned with some other binary firmwares that are used to build the ATF
> using Buildroot such as binaries-marvell/ for instance.

I didn't study the binaries-marvell case, but I can explain the
situation here.

You say "the [DDR PHY] firmware is linked by the ATF" and required to
build it, but that isn't really the case.

The documentation at https://docs.nxp.com/bundle/UG10143/page/topics/tf-a_features.html
says:

  How to compile DDR FIP image (only applicable for LX2160ARDB and LX2162AQDS)

  A pre-built FIP image is already provided in the release.
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  To regenerate the DDR fip image for LX2160ARDB, and LX2162AQDS, perform
  the following steps [ proceeds to show how to use fiptool ]:

In other words, running the commands below results in the exact same
fip_ddr binary as the atf would produce.

[vladimir@pc /opt] $ git clone https://github.com/nxp-qoriq/ddr-phy-binary.git qoriq-ddr-phy-binary
Cloning into 'qoriq-ddr-phy-binary'...
remote: Enumerating objects: 110, done.
remote: Counting objects: 100% (43/43), done.
remote: Compressing objects: 100% (31/31), done.
remote: Total 110 (delta 25), reused 28 (delta 12), pack-reused 67 (from 1)
Receiving objects: 100% (110/110), 255.87 KiB | 602.00 KiB/s, done.
Resolving deltas: 100% (69/69), done.
[vladimir@pc /opt] $ cd qoriq-ddr-phy-binary
[vladimir@pc /opt/qoriq-ddr-phy-binary] $ /opt/qoriq-atf/tools/fiptool/fiptool info lx2160a/fip_ddr.bin
DDR UDIMM PHY IMEM 1d FW: offset=0x178, size=0x6BD0, cmdline="--ddr-immem-udimm-1d"
DDR UDIMM PHY IMEM 2d FW: offset=0x6D48, size=0x694C, cmdline="--ddr-immem-udimm-2d"
DDR UDIMM PHY DMEM 1d FW: offset=0xD694, size=0x6D0, cmdline="--ddr-dmmem-udimm-1d"
DDR UDIMM PHY DMEM 2d FW: offset=0xDD64, size=0x5BC, cmdline="--ddr-dmmem-udimm-2d"
DDR RDIMM PHY IMEM 1d FW: offset=0xE320, size=0x7050, cmdline="--ddr-immem-rdimm-1d"
DDR RDIMM PHY IMEM 2d FW: offset=0x15370, size=0x6D14, cmdline="--ddr-immem-rdimm-2d"
DDR RDIMM PHY DMEM 1d FW: offset=0x1C084, size=0x714, cmdline="--ddr-dmmem-rdimm-1d"
DDR RDIMM PHY DMEM 2d FW: offset=0x1C798, size=0x5FC, cmdline="--ddr-dmmem-rdimm-2d"
[vladimir@pc /opt/qoriq-ddr-phy-binary] $ /opt/qoriq-atf/tools/fiptool/fiptool create --ddr-immem-udimm-1d lx2160a/ddr4_pmu_train_imem.bin --ddr-immem-udimm-2d lx2160a/ddr4_2d_pmu_train_imem.bin --ddr-dmmem-udimm-1d lx2160a/ddr4_pmu_train_dmem.bin --ddr-dmmem-udimm-2d lx2160a/ddr4_2d_pmu_train_dmem.bin --ddr-immem-rdimm-1d lx2160a/ddr4_rdimm_pmu_train_imem.bin --ddr-immem-rdimm-2d lx2160a/ddr4_rdimm2d_pmu_train_imem.bin --ddr-dmmem-rdimm-1d lx2160a/ddr4_rdimm_pmu_train_dmem.bin --ddr-dmmem-rdimm-2d lx2160a/ddr4_rdimm2d_pmu_train_dmem.bin fip_ddr_new.bin
[vladimir@pc /opt/qoriq-ddr-phy-binary] $ diff fip_ddr_new.bin lx2160a/fip_ddr.bin
[vladimir@pc /opt/qoriq-ddr-phy-binary] $ echo $?
0

Even at runtime, the DDR PHY firmware is not compiled into the ATF firmware.
Rather, if you look at qoriq-atf commit 34d483565078 ("nxp: fip-handler
for additional ddr-fip.bin"), you will see that ddr_fip_setup() reads
the FIP image from offset 8M ("#define PLAT_DDR_FIP_OFFSET 0x800000") of
whatever boot storage device ATF was compiled for (QSPI_BOOT, NOR_BOOT etc).
In other words, the fact that board/solidrun/lx2160acex7/genimage.cfg in
my previous submission had "offset = 8M" here:

+       partition ddr-phy {
+               in-partition-table = "no"
+               image = "fip_ddr.bin"
+               offset = 8M
+       }

is not a coincidence, but ATF's expectation of where to find the FIP
image for the DDR PHY firmware at runtime. The two are in principle
decoupled at build time, and tied together by this convention.

But, my understanding is that one might want to re-generate another
Firmware Image Package (FIP) with DDR PHY firmware only in the case
where you have a trusted boot flow, and you want to authenticate the
firmware image by signing it with your own keys (more in
docs/plat/nxp/nxp-ls-tbbr.rst). That isn't something I was intending to
support, but is not something that your proposed patch supports either.
I would also imagine that using ATF's build system is not the only
possible way to sign the firmware images, but truth be told, I don't
really know, I never explored this, and for my personal use I don't
need it.

What is your intention? Do you just want me to move this package to
"boot" because of a misunderstanding, or do you want to support signing
of the DDR PHY firmware using ATF's build system?
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
