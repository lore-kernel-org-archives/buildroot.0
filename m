Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 798F7C27C4F
	for <buildroot@archiver.kernel.org>; Sat, 15 Jun 2024 21:23:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4A21C8113C;
	Sat, 15 Jun 2024 21:23:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GsS5V0Ulwyub; Sat, 15 Jun 2024 21:23:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4A4F081141
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4A4F081141;
	Sat, 15 Jun 2024 21:23:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 675AB1BF2F8
 for <buildroot@lists.busybox.net>; Sat, 15 Jun 2024 21:23:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 52F3A81141
 for <buildroot@lists.busybox.net>; Sat, 15 Jun 2024 21:23:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TdTsCAEo3ltF for <buildroot@lists.busybox.net>;
 Sat, 15 Jun 2024 21:23:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 328A98113C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 328A98113C
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 328A98113C
 for <buildroot@buildroot.org>; Sat, 15 Jun 2024 21:23:19 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 554A013F838;
 Sat, 15 Jun 2024 23:23:10 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 15 Jun 2024 23:23:10 +0200
Date: Sat, 15 Jun 2024 23:23:10 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Neal Frager <neal.frager@amd.com>
Message-ID: <Zm4GPu73esfvOMho@landeda>
References: <20240613061423.1737631-1-neal.frager@amd.com>
 <20240613061423.1737631-2-neal.frager@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240613061423.1737631-2-neal.frager@amd.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1718486597;
 bh=sQIsE/2NCZmbR/VE6RHZdgCxoz1QulozyAQJXzhadv0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=tLGIIIUb8nCmGP8iOqEFE9yF9AIAiq4T5uU37K1Y1uGOXyLaaviEstlmpN+5NfT7N
 qOontBr4X1MwIjovCO8i6L8pH415IIvVWsUiHOL+PHGircLowHcn5urwQPHUbUwq74
 ZGYQR1NTm7a/9Cq2XkBVm+bERThpTeo8P0xyqYaRrsCSR8BVV6FE/rmjJ64fvGqbtU
 J/mQcnTFE5cVn76HePKYo7B1Zh9bLjIathMy+mQC5kNDRaY0SVR9fFCA0WuZeegw6q
 wXgmXQWylFhlxJaMF47KOT1eksCsmtZBasqjiHfGWsgLYW6Ok40A7L15IInSTzv48N
 jI9a5AUWm9JOQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=tLGIIIUb
Subject: Re: [Buildroot] [PATCH v2 2/5] boot/uboot.mk: new zynqmp pmufw
 prebuilt option
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
Cc: ibai.erkiaga-elorza@amd.com, luca.ceresoli@bootlin.com,
 brandon.maier@collins.com, thomas.petazzoni@bootlin.com,
 buildroot@buildroot.org, michal.simek@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Neal, All,

On 2024-06-13 07:14 +0100, Neal Frager via buildroot spake thusly:
> The new BR2_TARGET_UBOOT_ZYNQMP_PMUFW_PREBUILT option will enable u-boot to
> use the xilinx-prebuilt package for downloading a pmufw.elf that gets included
> in the generated boot.bin.
> 
> If the BR2_TARGET_UBOOT_ZYNQMP_PMUFW_PREBUILT option is enabled, then the
> BR2_TARGET_UBOOT_ZYNQMP_PMUFW config for downloading a prebuilt pmufw will
> be ignored.
> 
> Signed-off-by: Neal Frager <neal.frager@amd.com>
> ---
[--SNIP--]
> diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
> index d0901edc9d..41e372939b 100644
> --- a/boot/uboot/Config.in
> +++ b/boot/uboot/Config.in
> @@ -512,9 +512,25 @@ config BR2_TARGET_UBOOT_ZYNQMP
>  
>  if BR2_TARGET_UBOOT_ZYNQMP
>  
> +config BR2_TARGET_UBOOT_ZYNQMP_PMUFW_PREBUILT
> +	bool "xilinx-prebuilt pmufw.elf"
> +	depends on BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG
> +	depends on BR2_TARGET_XILINX_PREBUILT_ZYNQMP || BR2_TARGET_XILINX_PREBUILT_KRIA
> +	help
> +	  Use xilinx-prebuilt boot package for downloading prebuilt zynqmp
> +	  pmufw.elf from https://github.com/Xilinx/soc-prebuilt-firmware repo.
> +
> +	  U-Boot build process will generate a boot.bin (to be loaded by the
> +	  ZynqMP boot ROM) containing both the U-Boot SPL and the PMU firmware
> +	  in the Xilinx-specific boot format.
> +
> +	  If this option is selected, the BR2_TARGET_UBOOT_ZYNQMP_PMUFW
> +	  prebuilt option will be ignored.

    $ ./utils/docker-run make check-package
    WARNING: boot/uboot/Config.in:520: help text: <tab><2 spaces><62 chars> (https://nightly.buildroot.org/#writing-rules-config-in)
    boot/uboot/Config.in:521: help text: <tab><2 spaces><62 chars> (https://nightly.buildroot.org/#writing-rules-config-in)
    boot/uboot/Config.in:523: help text: <tab><2 spaces><62 chars> (https://nightly.buildroot.org/#writing-rules-config-in)
    boot/uboot/Config.in:524: help text: <tab><2 spaces><62 chars> (https://nightly.buildroot.org/#writing-rules-config-in)

I've reflowed the help text to fit.

>  config BR2_TARGET_UBOOT_ZYNQMP_PMUFW
>  	string "PMU firmware location"

I have added "Custom" in front of that prompt, because that is what it
now is: use of a custom PMU that if not in the repo above.

Applied to master with the above fixes, thanks.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
