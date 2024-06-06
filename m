Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15E67C27C54
	for <buildroot@archiver.kernel.org>; Thu,  6 Jun 2024 17:12:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A69EE8430A;
	Thu,  6 Jun 2024 17:12:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yTuBpfrgGCSf; Thu,  6 Jun 2024 17:12:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8809C847FB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8809C847FB;
	Thu,  6 Jun 2024 17:12:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 113661BF57C
 for <buildroot@lists.busybox.net>; Thu,  6 Jun 2024 17:12:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 09FE940224
 for <buildroot@lists.busybox.net>; Thu,  6 Jun 2024 17:12:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wJlpzWQxc9u9 for <buildroot@lists.busybox.net>;
 Thu,  6 Jun 2024 17:12:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4DEC64013A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4DEC64013A
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4DEC64013A
 for <buildroot@buildroot.org>; Thu,  6 Jun 2024 17:12:29 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id C8BD613F8D5;
 Thu,  6 Jun 2024 19:12:20 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Thu, 06 Jun 2024 19:12:20 +0200
Date: Thu, 6 Jun 2024 19:12:20 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Neal Frager <neal.frager@amd.com>
Message-ID: <ZmHt9EUdlvHV30CY@landeda>
References: <20240304074140.1537910-1-neal.frager@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240304074140.1537910-1-neal.frager@amd.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1717693947;
 bh=U58QJIop8X8FPrxh/8AJodC/k768KNS40lqvvq6AtkI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=aUHyHR1+VmYxEn9lNkI8rKU9Ah5azHAXUkRNF1PPjd8PL0rzEEZ2SQ9PmYJ0IhqBR
 nBrh6nBPSdhr/0pvbNyR22z5D+QVy2Rvvaik0ofChVU3f3MUtE0Shd/Z13ZK8k1IaV
 co9caie4OSF84dg7AZXIK0Y6s/PdjJYXEd9758YAaThkHLyZwN5SGBlj/H4bxGtuoU
 MF30FlyD99+YWO0Ze5HGbBKGlcYG0Zr5dR4iZ+slbIWF+1C3srwLK9FOWnlD7soQ5h
 eHtFbrqGWxwMroy475ykLsX08zEHHWXuZM4QLu3esBJ5owKuJLRqdSj/MI7fPPnPF5
 5CZuxm7YGEF5w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=aUHyHR1+
Subject: Re: [Buildroot] [PATCH v11 1/6] boot/zynqmp-firmware: new boot
 firmware
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
Cc: michal.simek@amd.com, ibai.erkiaga-elorza@amd.com,
 luca.ceresoli@bootlin.com, thomas.petazzoni@bootlin.com,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Neal, All,

I had a quick look, and there is something I don;t really like...

On 2024-03-04 07:41 +0000, Neal Frager via buildroot spake thusly:
> This patch adds a new boot firmware to buildroot for building the zynqmp pmufw.
> It requires the toolchain-bare-metal package that includes a bare-metal
> binutils, gcc and newlib which can be built for the microblaze architecture.
[--SNIP--]
> diff --git a/boot/zynqmp-firmware/Config.in b/boot/zynqmp-firmware/Config.in
> new file mode 100644
> index 0000000000..d68ec2cf6a
> --- /dev/null
> +++ b/boot/zynqmp-firmware/Config.in
> @@ -0,0 +1,22 @@
> +config BR2_TARGET_ZYNQMP_FIRMWARE
> +	bool "zynqmp-firmware"
> +	select BR2_TOOLCHAIN_BARE_METAL_BUILDROOT

This and [0]...

[--SNIP--]
> diff --git a/boot/zynqmp-firmware/zynqmp-firmware.mk b/boot/zynqmp-firmware/zynqmp-firmware.mk
> new file mode 100644
> index 0000000000..383d888fba
> --- /dev/null
> +++ b/boot/zynqmp-firmware/zynqmp-firmware.mk
> @@ -0,0 +1,33 @@
[--SNIP--]
> +ZYNQMP_PMUFW = $(@D)/lib/sw_apps/zynqmp_pmufw/src/executable.elf

    $ ./utils/docker-run make check-package
    boot/zynqmp-firmware/zynqmp-firmware.mk:27: possible typo: ZYNQMP_PMUFW -> *ZYNQMP_FIRMWARE*

[--SNIP--]
> diff --git a/toolchain/toolchain-bare-metal-buildroot/Config.in b/toolchain/toolchain-bare-metal-buildroot/Config.in
> index 6fe969357f..7d33a68c5c 100644
> --- a/toolchain/toolchain-bare-metal-buildroot/Config.in
> +++ b/toolchain/toolchain-bare-metal-buildroot/Config.in
> @@ -2,6 +2,7 @@ if BR2_TOOLCHAIN_BARE_METAL_BUILDROOT
>  
>  config BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH
>  	string "architecture tuple"
> +	default "microblazeel-xilinx-elf" if BR2_TARGET_ZYNQMP_FIRMWARE

...[0] this are smelly to me.

It wokrs in your specific case, because all you do is target a
microblazeel-xilinx-elf and zynqmp-firmware is the first package that
depends on a bare-metal toolchain to be built [2]

But nothign prevents other situations:

  - user manually changes BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH to
    another tuple, e.g. arm-gnu

  - another package does sopmething similar with another tuple, like
    riscv64-elf

The bare-metal toolchain can currently be built only for one and only
one tuple, so this can't work nicely.

Instead, I think we should go another rooute:

    config BR2_TARGET_ZYNQMP_FIRMWARE
        bool "zynqmp-firmware"
        depends on BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_TUPLE = "microblazeel-xilinx-elf"

    comment "zynqmp-firmware needs a bare metal toolchain for tuple microblazeel-xilinx-elf"
        depends on BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_TUPLE != "microblazeel-xilinx-elf"

[2] Note that we already have a few pre-built bare-metal toolchains:
    - package/arm-gnu-toolchain/
    package/riscv64-elf-toolchain/
    So it is not unconceivalbe that at some point we will want to be
    able to actually build suhc toolchains...

Regards,
Yann E. MORIN.

>  	help
>  	  This option allows to define the architecture tuple for the
>  	  bare-metal toolchain.
> -- 
> 2.25.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

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
