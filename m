Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19BE8C10F1A
	for <buildroot@archiver.kernel.org>; Thu,  9 May 2024 20:09:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AD4A84032E;
	Thu,  9 May 2024 20:09:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E4rD6-EPGc_U; Thu,  9 May 2024 20:09:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 272E4407D4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 272E4407D4;
	Thu,  9 May 2024 20:09:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C9D131BF31C
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 20:09:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C3B0A605F5
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 20:09:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yP_-3FW-AJOa for <buildroot@lists.busybox.net>;
 Thu,  9 May 2024 20:09:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::222;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 1D6CC605D7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1D6CC605D7
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1D6CC605D7
 for <buildroot@buildroot.org>; Thu,  9 May 2024 20:09:04 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5671640003;
 Thu,  9 May 2024 20:09:02 +0000 (UTC)
Date: Thu, 9 May 2024 22:09:01 +0200
To: Romain Naour <romain.naour@smile.fr>
Message-ID: <20240509220901.1ee254c0@windsurf>
In-Reply-To: <20240507122513.724138-1-romain.naour@smile.fr>
References: <20240507122513.724138-1-romain.naour@smile.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1715285342;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+t9M6oPKmUqjjtakyf/FQoKojKjo7S9IydmfAi4AONU=;
 b=PblNicCLFs1puWu/CFq2oFrzJeQp+sA6F77OeYXoYcO1zwnYehj8l5iCfacT5NY2SUdoFb
 n4JhcZfYA8viKlQ++AnTjM3u2ZTerHEVD7Hj5scnfXIyts72g16J5KZdTdieJZ5Yi6N+X4
 /rF9Zjj8S+wWfFVABO4LkrQ090eVjm3JpBQyd1QwRJLD4S8a2zGRCIMwExoRlcnakpgzDc
 6AlrhQlzlYqdYKTJXYC/OQXHiTLHkaggKfXoHSD6/NSNZSzHtkYzCpCiykt5+BAE17vS1a
 8y5poHiWybJfAVoBHQcbqVJa21pRmYGXs23mubUQpJYlgE4yfi5mGz7aly0Nng==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=PblNicCL
Subject: Re: [Buildroot] [PATCH v3] configs/beagleboneai64_defconfig: new
 defconfig
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue,  7 May 2024 14:25:13 +0200
Romain Naour <romain.naour@smile.fr> wrote:

> Adds support for BeagleBone AI-64 board by introducing the
> beagleboneai64_defconfig file and related support files.
> 
> The BeagleBone AI-64 uses the TI J721E SoC, also known as DRA829, also
> known as TDA4VM.
> 
> Retrieve BSP settings from meta-ti (may be useful for other TI boards):
> 
> - This defconfig requires u-boot binman support added in u-boot since
>   2023.10.
>   See FOSDEM 2024 talk by TI folks about Binman and how it simplify
>   the overall boot-loader build flow [1].
> 
> - Set BR2_TARGET_ARM_TRUSTED_FIRMWARE_TARGET_BOARD = "generic"
>   meta-ti]$ git grep TFA_BOARD
>   meta-ti-bsp/conf/machine/beagleplay.conf:TFA_BOARD = "lite"
>   meta-ti-bsp/conf/machine/include/am62axx.inc:TFA_BOARD = "lite"
>   meta-ti-bsp/conf/machine/include/am62pxx.inc:TFA_BOARD = "lite"
>   meta-ti-bsp/conf/machine/include/am62xx.inc:TFA_BOARD = "lite"
>   meta-ti-bsp/conf/machine/include/am64xx.inc:TFA_BOARD = "lite"
>   meta-ti-bsp/conf/machine/include/am65xx.inc:TFA_BOARD = "generic"
>   meta-ti-bsp/conf/machine/include/j7200.inc:TFA_BOARD = "generic"
>   meta-ti-bsp/conf/machine/include/j721e.inc:TFA_BOARD = "generic"
>   meta-ti-bsp/conf/machine/include/j721s2.inc:TFA_BOARD = "generic"
>   meta-ti-bsp/conf/machine/include/j722s.inc:TFA_BOARD = "lite"
>   meta-ti-bsp/conf/machine/include/j784s4.inc:TFA_BOARD = "j784s4"
> 
> - Set BR2_TARGET_UBOOT_NEEDS_ATF_BL31 to provide BL31 variable pointing
>   to ATF bl31.bin to the U-Boot build process [2].
> 
> - Set BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL32_OPTEE to OP-TEE as BL32
>   secure payload. meta-ti set "SPD=opteed" to build ATF [3].
> 
> - Set BR2_TARGET_OPTEE_OS_PLATFORM to "k3-j721e".
>   meta-ti uses the OPTEEMACHINE to set optee-os platform [4].
>   meta-ti]$ git grep OPTEEMACHINE
>   meta-ti-bsp/conf/machine/am437x-hs-evm.conf:OPTEEMACHINE = "ti-am43xx"
>   meta-ti-bsp/conf/machine/am57xx-hs-evm.conf:OPTEEMACHINE = "ti-am57xx"
>   meta-ti-bsp/conf/machine/beagleplay.conf:OPTEEMACHINE = "k3-am62x"
>   meta-ti-bsp/conf/machine/dra7xx-hs-evm.conf:OPTEEMACHINE = "ti-dra7xx"
>   meta-ti-bsp/conf/machine/include/am62axx.inc:OPTEEMACHINE = "k3-am62x"
>   meta-ti-bsp/conf/machine/include/am62pxx.inc:OPTEEMACHINE = "k3-am62x"
>   meta-ti-bsp/conf/machine/include/am62xx.inc:OPTEEMACHINE = "k3-am62x"
>   meta-ti-bsp/conf/machine/include/am64xx.inc:OPTEEMACHINE = "k3-am64x"
>   meta-ti-bsp/conf/machine/include/am65xx.inc:OPTEEMACHINE = "k3-am65x"
>   meta-ti-bsp/conf/machine/include/j7200.inc:OPTEEMACHINE = "k3-j721e"
>   meta-ti-bsp/conf/machine/include/j721e.inc:OPTEEMACHINE = "k3-j721e"
>   meta-ti-bsp/conf/machine/include/j721s2.inc:OPTEEMACHINE = "k3-j784s4"
>   meta-ti-bsp/conf/machine/include/j722s.inc:OPTEEMACHINE = "k3-am62x"
>   meta-ti-bsp/conf/machine/include/j784s4.inc:OPTEEMACHINE = "k3-j784s4"
> 
> - Use j721e_beagleboneai64_a72 and j721e_beagleboneai64_r5 u-boot
>   defconfigs introduced in u-boot v2024.04.
> 
> - u-boot distroboot (bootflow) detect extlinux.conf file from the first
>   SDcard partition, se we have to install the kernel and its dtb file.
>   Use devicetreedir instead of devicetree in extlinux.conf file to
>   avoid hardcoding the devicetree file name. TI boards are able to
>   retrieve dtb file name from an EEPROM (see TI_I2C_BOARD_DETECT in
>   uboot).
> 
> - Provide a hash file for all custom package version
>   (arm-trusted-firmware, linux, ti-k3-r5-loader, uboot) to enable
>   BR2_DOWNLOAD_FORCE_CHECK_HASHES.
> 
> [1] https://fosdem.org/2024/schedule/event/fosdem-2024-3067-standardizing-the-generation-and-signing-of-boot-images/
> [2] https://git.yoctoproject.org/meta-ti/commit/?id=e74b9a1746d4d04757c87c1920a0f743e55ff096
> [3] https://git.yoctoproject.org/meta-ti/tree/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc?h=09.02.00.004#n7
> [4] https://git.yoctoproject.org/meta-arm/tree/meta-arm/recipes-security/optee/optee-os.inc?h=4.0.3#n23
> 
> More information about the board can be found at:
> https://www.beagleboard.org/boards/beaglebone-ai-64
> 
> Signed-off-by: Romain Naour <romain.naour@smile.fr>
> ---
> Add "beagleboneai64" directory to board/beagleboard/ since we could
> move all other Beagleboard's boards (beagleboardx15, beaglebone,
> beagleboneai and beaglev) to the same subdirectory.

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
