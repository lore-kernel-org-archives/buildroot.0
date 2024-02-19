Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37E68C48BF8
	for <buildroot@archiver.kernel.org>; Mon, 19 Feb 2024 20:37:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 707AA4060C;
	Mon, 19 Feb 2024 20:37:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HlAkwVUPZuFY; Mon, 19 Feb 2024 20:37:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9927940B73
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9927940B73;
	Mon, 19 Feb 2024 20:37:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 241221BF41C
 for <buildroot@lists.busybox.net>; Mon, 19 Feb 2024 20:37:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1114E60744
 for <buildroot@lists.busybox.net>; Mon, 19 Feb 2024 20:37:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SKqnjCe9MvnN for <buildroot@lists.busybox.net>;
 Mon, 19 Feb 2024 20:37:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=198.47.23.248;
 helo=lelv0143.ext.ti.com; envelope-from=dannenberg@ti.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D00CB605FC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D00CB605FC
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D00CB605FC
 for <buildroot@buildroot.org>; Mon, 19 Feb 2024 20:36:59 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 41JKau4L127386;
 Mon, 19 Feb 2024 14:36:56 -0600
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 41JKauFb007461
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 19 Feb 2024 14:36:56 -0600
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 19
 Feb 2024 14:36:56 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 19 Feb 2024 14:36:56 -0600
Received: from dasso (dasso.dhcp.ti.com [128.247.79.182])
 by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 41JKau6S017642;
 Mon, 19 Feb 2024 14:36:56 -0600
Date: Mon, 19 Feb 2024 14:36:56 -0600
To: Alexander Sverdlin <alexander.sverdlin@gmail.com>
Message-ID: <20240219203656.5rb7xelxunbxwkka@dasso>
References: <20240217160244.1320482-1-dario.binacchi@amarulasolutions.com>
 <20240217160244.1320482-8-dario.binacchi@amarulasolutions.com>
 <8e9c142cd6c74585b1545fd3a3f5e0b7fe221917.camel@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8e9c142cd6c74585b1545fd3a3f5e0b7fe221917.camel@gmail.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1708375016;
 bh=KjcgERh9/iLQcf2vrPupb7A6tZ3k+nL79BFtvjJ9Qsg=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=woOKS2ygLvsQBD39Rp9SJnfkB3/h27k3NQlXcso3umFr2JQqH0K8tcDrI1wcnbYjK
 CnKibaQLYzYPARdEnWv3Qs4SL1dH6+4FbOx5L2psnihDReBcI4Wbb8jn3yGW7hhfwU
 3aSV2+0/ykQrxutGPTk+oC1Ed9TApmvYXsoXFpzc=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=ti.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=woOKS2yg
Subject: Re: [Buildroot] [PATCH v4 07/20] boot/ti-k3-image-gen: manage HS
 hardware
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Andreas Dannenberg via buildroot <buildroot@buildroot.org>
Reply-To: Andreas Dannenberg <dannenberg@ti.com>
Cc: michael@amarulasolutions.com, Asaf Kahlon <asafka7@gmail.com>,
 Xuanhao Shi <X15000177@gmail.com>, James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org,
 Romain Naour <romain.naour@smile.fr>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com, bryce@redpinelabs.com,
 Anand Gadiyar <gadiyar@ti.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Alexander,

On Sun, Feb 18, 2024 at 12:45:47AM +0100, Alexander Sverdlin wrote:
> Hi Dario,
> =

> On Sat, 2024-02-17 at 17:02 +0100, Dario Binacchi wrote:
> > The patch sets the configurations required by TI HS systems. Some of th=
ese
> > configurations (i. e. HS SYSFW image signing key, HS Software Revision)
> > are provided by the ti-k3-core-secdev package in the binaries directory.
> > =

> > Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> =

> so for test I've reverted the previous "boot/ti-k3-core-secdev: new packa=
ge"
> commit, then...
> =

> > ---
> > =

> > no changes since v3:
> > =

> > Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> > ---
> > =A0boot/ti-k3-image-gen/Config.in=A0=A0=A0=A0=A0=A0=A0=A0=A0 |=A0 1 +
> > =A0boot/ti-k3-image-gen/ti-k3-image-gen.mk | 16 ++++++++++++++--
> > =A02 files changed, 15 insertions(+), 2 deletions(-)
> > =

> > diff --git a/boot/ti-k3-image-gen/Config.in b/boot/ti-k3-image-gen/Conf=
ig.in
> > index d76cef82e911..38d1598d9fc0 100644
> > --- a/boot/ti-k3-image-gen/Config.in
> > +++ b/boot/ti-k3-image-gen/Config.in
> > @@ -2,6 +2,7 @@ config BR2_TARGET_TI_K3_IMAGE_GEN
> > =A0	bool "ti-k3-image-gen"
> > =A0	depends on BR2_TARGET_TI_K3_R5_LOADER
> > =A0	select BR2_TARGET_TI_K3_BOOT_FIRMWARE
> > +	select BR2_TARGET_TI_K3_CORE_SECDEV if BR2_TARGET_TI_K3_IMAGE_GEN_SEC=
TYPE_HS_FS || BR2_TARGET_TI_K3_IMAGE_GEN_SECTYPE_HS
> =

> ... removed this, ...
> =

> > =A0	# We need FIT support in uboot-tools, which is why we select a
> > =A0	# host package
> > =A0	select BR2_PACKAGE_HOST_UBOOT_TOOLS
> > diff --git a/boot/ti-k3-image-gen/ti-k3-image-gen.mk b/boot/ti-k3-image=
-gen/ti-k3-image-gen.mk
> > index 64be9a18f2c4..74b4fcb4bf89 100644
> > --- a/boot/ti-k3-image-gen/ti-k3-image-gen.mk
> > +++ b/boot/ti-k3-image-gen/ti-k3-image-gen.mk
> > @@ -29,10 +29,21 @@ TI_K3_IMAGE_GEN_FW_TYPE =3D $(call qstrip,$(BR2_TAR=
GET_TI_K3_IMAGE_GEN_FW_TYPE))
> > =A0TI_K3_IMAGE_GEN_SOC =3D $(call qstrip,$(BR2_TARGET_TI_K3_IMAGE_GEN_S=
OC))
> > =A0TI_K3_IMAGE_GEN_SECTYPE =3D $(call qstrip,$(BR2_TARGET_TI_K3_IMAGE_G=
EN_SECTYPE))
> > =A0
> > -TI_K3_IMAGE_GEN_SYSFW =3D $(TI_K3_IMAGE_GEN_FW_TYPE)-firmware-$(TI_K3_=
IMAGE_GEN_SOC)-$(TI_K3_IMAGE_GEN_SECTYPE).bin
> > +ifeq ($(BR2_TARGET_TI_K3_IMAGE_GEN_SECTYPE_GP),y)
> > +TI_K3_IMAGE_GEN_SYSFW =3D \
> > +	$(TI_K3_IMAGE_GEN_FW_TYPE)-firmware-$(TI_K3_IMAGE_GEN_SOC)-$(TI_K3_IM=
AGE_GEN_SECTYPE).bin
> > +else
> > +TI_K3_IMAGE_GEN_DEPENDENCIES +=3D ti-k3-core-secdev
> =

> ... the above line, ...
> =

> > +
> > +TI_K3_IMAGE_GEN_SYSFW =3D \
> > +	$(TI_K3_IMAGE_GEN_FW_TYPE)-firmware-$(TI_K3_IMAGE_GEN_SOC)-$(TI_K3_IM=
AGE_GEN_SECTYPE)-enc.bin \
> > +	$(TI_K3_IMAGE_GEN_FW_TYPE)-firmware-$(TI_K3_IMAGE_GEN_SOC)-$(TI_K3_IM=
AGE_GEN_SECTYPE)-cert.bin
> > +endif
> > =A0
> > =A0define TI_K3_IMAGE_GEN_CONFIGURE_CMDS
> > -	cp $(BINARIES_DIR)/ti-sysfw/$(TI_K3_IMAGE_GEN_SYSFW) $(@D)
> > +	$(foreach t,$(TI_K3_IMAGE_GEN_SYSFW),\
> > +		cp $(BINARIES_DIR)/ti-sysfw/$(t) $(@D)/
> > +	)
> > =A0endef
> > =A0
> > =A0define TI_K3_IMAGE_GEN_BUILD_CMDS
> > @@ -40,6 +51,7 @@ define TI_K3_IMAGE_GEN_BUILD_CMDS
> > =A0	$(BR2_MAKE) -C $(@D) \
> > =A0		SOC=3D$(TI_K3_IMAGE_GEN_SOC) \
> > =A0		SOC_TYPE=3D$(TI_K3_IMAGE_GEN_SECTYPE) \
> > +		TI_SECURE_DEV_PKG=3D$(BINARIES_DIR)/ti-k3-core-secdev \
> =

> ... and this line...
> =

> > =A0		CONFIG=3Devm \
> > =A0		CROSS_COMPILE=3D$(HOST_DIR)/bin/arm-none-eabi- \
> > =A0		SBL=3D$(BINARIES_DIR)/r5-u-boot-spl.bin \
> =

> ... and everything still builds and boots fine on SK-AM62B (HS-FS):
> =

> U-Boot SPL 2024.01 (Feb 18 2024 - 00:02:43 +0100)
> SYSFW ABI: 3.1 (firmware rev 0x0008 '8.6.4--v08.06.04 (Chill Capybar')
> SPL initial stack usage: 13400 bytes
> Trying to boot from MMC2
> Authentication passed
> Authentication passed
> Authentication passed
> Authentication passed
> Authentication passed
> Starting ATF on ARM64 core...
> =

> NOTICE:  BL31: v2.7(release):v2.7
> NOTICE:  BL31: Built : 23:57:43, Feb 17 2024
> I/TC: =

> I/TC: OP-TEE version: Unknown_4.0 (gcc version 12.3.0 (Buildroot 2023.11-=
1199-g470b2069e4)) #1 Sat Feb 17 22:57:38 UTC 2024 aarch64
> I/TC: WARNING: This OP-TEE configuration might be insecure!
> I/TC: WARNING: Please check https://optee.readthedocs.io/en/latest/archit=
ecture/porting_guidelines.html
> I/TC: Primary CPU initializing
> I/TC: SYSFW ABI: 3.1 (firmware rev 0x0008 '8.6.4--v08.06.04 (Chill Capyba=
r')
> I/TC: HUK Initialized
> I/TC: Activated SA2UL device
> I/TC: Enabled firewalls for SA2UL TRNG device
> I/TC: SA2UL TRNG initialized
> I/TC: SA2UL Drivers initialized
> I/TC: Primary CPU switching to normal world boot
> =

> U-Boot SPL 2024.01 (Feb 18 2024 - 00:03:30 +0100)
> SYSFW ABI: 3.1 (firmware rev 0x0008 '8.6.4--v08.06.04 (Chill Capybar')
> SPL initial stack usage: 1872 bytes
> Trying to boot from MMC2
> Authentication passed
> Authentication passed
> =

> =

> U-Boot 2024.01 (Feb 18 2024 - 00:03:30 +0100)
> =

> SoC:   AM62X SR1.0 HS-FS
> Model: Texas Instruments AM625 SK
> DRAM:  2 GiB
> Core:  56 devices, 23 uclasses, devicetree: separate
> MMC:   mmc@fa10000: 0, mmc@fa00000: 1
> Loading Environment from nowhere... OK
> In:    serial@2800000
> Out:   serial@2800000
> Err:   serial@2800000
> Net:   eth0: ethernet@8000000port@1
> Hit any key to stop autoboot:  0 =

> switch to partitions #0, OK
> mmc1 is current device
> SD/MMC found on device 1
> Failed to load 'uEnv.txt'
> Scanning for bootflows in all bootdevs
> Seq  Method       State   Uclass    Part  Name                      Filen=
ame
> ---  -----------  ------  --------  ----  ------------------------  -----=
-----------
> Scanning global bootmeth 'efi_mgr':
> No EFI system partition
> No EFI system partition
> Failed to persist EFI variables
> Scanning bootdev 'mmc@fa00000.bootdev':
>   0  extlinux     ready   mmc          1  mmc@fa00000.bootdev.part_ /extl=
inux/extlinux.conf
> ** Booting bootflow 'mmc@fa00000.bootdev.part_1' with extlinux
> 1:      am62x-sk-buildroot
> Retrieving file: /Image
> append: console=3DttyS2,115200n8 root=3D/dev/mmcblk1p2 rw rootfstype=3Dex=
t4 rootwait earlycon=3Dns16550a,mmio32,0x02800000
> Retrieving file: /k3-am62x.dtb
> ## Flattened Device Tree blob at ffb14700
>    Booting using the fdt blob at 0xffb14700
> Working FDT set to ffb14700
>    Loading Device Tree to 000000008ffed000, end 000000008ffff687 ... OK
> Working FDT set to 8ffed000
> =

> Starting kernel ...
> =

> [    0.000000] Booting Linux on physical CPU 0x0000000000 [0x410fd034]

Just wanting to double-check one quick detail. Did you have to make any
additional modifications to boot-mode related U-Boot settings or ENV
variables? Or did the "new normal" of CONFIG_BOOTSTD just work for you? =



--
Andreas Dannenberg
Texas Instruments Inc



> [    0.000000] Linux version 6.6.1 (...) (aarch64-buildroot-linux-gnu-gcc=
.br_real (Buildroot 2023.11-1199-g470b2069e4) 12.3.0, GNU ld (GNU Binutils)=
 2.40) #1 SMP PREEMPT Sun Feb 18 =

> 00:37:47 CET 2024
> =

> =

> =

> -- =

> Alexander Sverdlin.
> =

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
