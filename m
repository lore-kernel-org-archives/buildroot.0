Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 781D6C48260
	for <buildroot@archiver.kernel.org>; Fri, 16 Feb 2024 23:14:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0346941CE4;
	Fri, 16 Feb 2024 23:14:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id P38TM_1T9C1j; Fri, 16 Feb 2024 23:14:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 065E041CDD
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 065E041CDD;
	Fri, 16 Feb 2024 23:14:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 15E9F1BF2EB
 for <buildroot@lists.busybox.net>; Fri, 16 Feb 2024 23:14:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 030FC4066D
 for <buildroot@lists.busybox.net>; Fri, 16 Feb 2024 23:14:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 23MDAIlsslVE for <buildroot@lists.busybox.net>;
 Fri, 16 Feb 2024 23:14:50 +0000 (UTC)
X-Greylist: delayed 10544 seconds by postgrey-1.37 at util1.osuosl.org;
 Fri, 16 Feb 2024 23:14:49 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E502540667
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E502540667
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=198.47.19.141;
 helo=fllv0015.ext.ti.com; envelope-from=dannenberg@ti.com; receiver=<UNKNOWN> 
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E502540667
 for <buildroot@buildroot.org>; Fri, 16 Feb 2024 23:14:49 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 41GKJ4vD062305;
 Fri, 16 Feb 2024 14:19:04 -0600
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 41GKJ3DN082790
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 16 Feb 2024 14:19:04 -0600
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 16
 Feb 2024 14:19:03 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 16 Feb 2024 14:19:03 -0600
Received: from dasso (dasso.dhcp.ti.com [128.247.79.182])
 by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 41GKJ31Y123719;
 Fri, 16 Feb 2024 14:19:03 -0600
Date: Fri, 16 Feb 2024 14:19:03 -0600
To: Romain Naour <romain.naour@smile.fr>
Message-ID: <20240216201903.lhhkjevrgzcp5msz@dasso>
References: <20240213172817.2872849-1-romain.naour@smile.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240213172817.2872849-1-romain.naour@smile.fr>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1708114744;
 bh=lOkyTJTJuQRS0kojuG0rMTYkaC8qVCK0oY5KDAOuZ2I=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=dJ+6uRPR0CBoNG5tgPj33y4pwQJIUpBc32B3nML1Gs4srJDbUWUloYlEQA/oD9eMi
 EK7Wc/6BGk46nLRAwqGVLLTACMUXc6g5TF3Gnbi6rjHbSRWmY3pY1yjIVQpzlW5NSc
 WOoq160QBXxljHUckE3kKT22Q2kYRgKFRJnXJZGY=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=ti.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=dJ+6uRPR
Subject: Re: [Buildroot] [PATCH 00/21] Add ti_j721e_sk_defconfig
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, Feb 13, 2024 at 06:27:56PM +0100, Romain Naour wrote:
> This series aim to add the SK-TDA4VM board support based on TI K3 j721e SoC.
> 
> This series start by adding U-boot binman support already submitted in the
> preview series "Add support for AM62x-SK HS-FS devices" from Dario Binacchi
> [1], with small improvements.
> See the FOSDEM 2024 talk "Standardizing the generation and signing of boot images" [2]

Thanks Romain and Dario for all the work on this, and submitting this.
Will be spending some time over the next few days to see how I can help
out with this effort. I can already see many great improvements since
the last time I worked on AM62x/AM64x support last year.

--
Andreas Dannenberg
Texas Instruments Inc



> 
> With binman support, we can add the TI K3 j721e SoC support by
> providing all required firmware generated by the build.
> 
> Add the new ti_j721e_sk_defconfig file to build a basic SD card image to
> boot the board (serial debug and ethernet working).
> 
> Thanks to binman support, we can remove the ti-k3-image-gen tool from
> Buildroot. To do that, we have to update existing defconfig (am62, am64).
> 
> Followup commits can improve TI K3 HS-FS devices based on binman instead
> of legacy core-secdev-k3 tool.
> 
> [1] http://lists.busybox.net/pipermail/buildroot/2023-December/681139.html
> [2] https://fosdem.org/2024/events/attachments/fosdem-2024-3067-standardizing-the-generation-and-signing-of-boot-images/slides/22808/FOSDEM24_Speaker_Slides_y7FsIKM.pdf
> 
> Best regards,
> Romain
> 
> Dario Binacchi (5):
>   package/python-attrs: add host variant
>   package/python-rpds-py: add host variant
>   package/python-referencing: add host variant
>   package/python-jsonschema-specifications: add host variant
>   package/python-jsonschema: add host variant
> 
> Romain Naour (16):
>   DEVELOPERS: add Romain Naour for am574x_idk_defconfig
>   configs/ti_am62x_sk_defconfig: fix optee-os plateform
>   configs/ti_am64x_sk_defconfig: fix optee-os plateform
>   boot/uboot: add BR2_TARGET_UBOOT_USE_BINMAN option
>   boot/ti-k3-r5-loader: add BR2_TARGET_TI_K3_R5_LOADER_USE_BINMAN option
>   boot/ti-k3-r5-loader: install tiboot3.bin and sysfw.itb to
>     BINARIES_DIR
>   boot/ti-k3-boot-firmware: introduce
>     BR2_TARGET_TI_K3_BOOT_FIRMWARE_SOC_{AM62AX,AM62X,AM64X,AM65X}
>   boot/uboot: use DM firmware name defined by ti-k3-boot-firmware
>     package
>   boot/ti-k3-boot-firmware: add BR2_TARGET_TI_K3_BOOT_FIRMWARE_SOC_J721E
>   boot/uboot: replace ti-k3-image-gen options by ti-k3-firmware options
>   boot/uboot: enable TI K3 Device Manager (DM) for j721e
>   boot/ti-k3-boot-firmware: bump to version 09.02.00.004
>   configs/ti_j721e_sk_defconfig: new defconfig
>   configs/ti_am62x_sk_defconfig: update to uboot 2024.01 to use binman
>     tool
>   configs/ti_am64x_sk_defconfig: update to uboot 2024.01 to use binman
>     tool
>   boot/ti-k3-image-gen: remove package
> 
>  Config.in.legacy                              |  7 ++
>  DEVELOPERS                                    |  6 +-
>  board/ti/j721e-sk/genimage.cfg                | 28 +++++++
>  board/ti/j721e-sk/post-build.sh               | 16 ++++
>  board/ti/j721e-sk/readme.txt                  | 34 ++++++++
>  boot/Config.in                                |  1 -
>  boot/ti-k3-boot-firmware/Config.in            | 39 ++++++++++
>  .../ti-k3-boot-firmware.hash                  |  2 +-
>  .../ti-k3-boot-firmware.mk                    | 16 ++--
>  boot/ti-k3-image-gen/Config.in                | 77 -------------------
>  boot/ti-k3-image-gen/ti-k3-image-gen.hash     |  3 -
>  boot/ti-k3-image-gen/ti-k3-image-gen.mk       | 54 -------------
>  boot/ti-k3-r5-loader/Config.in                |  8 ++
>  boot/ti-k3-r5-loader/ti-k3-r5-loader.mk       | 23 ++++++
>  boot/uboot/Config.in                          | 27 ++++---
>  boot/uboot/uboot.mk                           | 10 ++-
>  configs/ti_am62x_sk_defconfig                 | 14 ++--
>  configs/ti_am64x_sk_defconfig                 | 14 ++--
>  ...62x_sk_defconfig => ti_j721e_sk_defconfig} | 34 ++++----
>  package/python-attrs/python-attrs.mk          |  6 ++
>  .../python-jsonschema-specifications.mk       | 10 +++
>  .../python-jsonschema/python-jsonschema.mk    | 14 ++++
>  .../python-referencing/python-referencing.mk  | 11 +++
>  package/python-rpds-py/python-rpds-py.mk      |  1 +
>  24 files changed, 275 insertions(+), 180 deletions(-)
>  create mode 100644 board/ti/j721e-sk/genimage.cfg
>  create mode 100755 board/ti/j721e-sk/post-build.sh
>  create mode 100644 board/ti/j721e-sk/readme.txt
>  delete mode 100644 boot/ti-k3-image-gen/Config.in
>  delete mode 100644 boot/ti-k3-image-gen/ti-k3-image-gen.hash
>  delete mode 100644 boot/ti-k3-image-gen/ti-k3-image-gen.mk
>  copy configs/{ti_am62x_sk_defconfig => ti_j721e_sk_defconfig} (54%)
> 
> --
> 2.43.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
