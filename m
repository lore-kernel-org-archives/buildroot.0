Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D52AC27C53
	for <buildroot@archiver.kernel.org>; Fri,  7 Jun 2024 11:23:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 282CC84225;
	Fri,  7 Jun 2024 11:23:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j_gfDyYJiwzH; Fri,  7 Jun 2024 11:23:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EB5DE84201
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id EB5DE84201;
	Fri,  7 Jun 2024 11:23:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 378D31BF48B
 for <buildroot@lists.busybox.net>; Fri,  7 Jun 2024 11:23:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 23D5F426AA
 for <buildroot@lists.busybox.net>; Fri,  7 Jun 2024 11:23:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZrtS3y5pd6s1 for <buildroot@lists.busybox.net>;
 Fri,  7 Jun 2024 11:23:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 108AE426A3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 108AE426A3
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 108AE426A3
 for <buildroot@buildroot.org>; Fri,  7 Jun 2024 11:23:09 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 3454A13F88F;
 Fri,  7 Jun 2024 13:22:59 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Fri, 07 Jun 2024 13:22:58 +0200
Date: Fri, 7 Jun 2024 13:22:58 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Neal Frager <neal.frager@amd.com>
Message-ID: <ZmLtkiOdA4tRJrLb@landeda>
References: <20240607094705.1962913-1-neal.frager@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240607094705.1962913-1-neal.frager@amd.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1717759386;
 bh=NsTj88KhSphfT/sEtnK+pSozLqf1xEJ+3AThOu3gWHA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=LUJk6IfWMyq/rPPfvAN/1XT7A1FGQWnoVhSoP0i7s+QsxSqt+M5/QrKOJYE2f3+1R
 pkfJLDl+7B53zE0sGWPO7nrYtvpT00T6pwGg6ZZVY5/TaTt2z1nGKzpnssqCbBhpQf
 LYZN0kRgnX/L4kiTQmaaxXQnCwygEswkTiZQlBcqY6heYzzyKt5OjWV77BJ9L+vF9h
 Zk/90X1d/bZu+VfKQiw4AOWSKZ1c2ff2+2wMkf0PK+yrlB5QkKBv6eGWlLfAHRAKGL
 vVJmcGWpo0tL8zrVvoPs1yuGq2tZ+hk+Yk/UsaWmxjNRgAktuBjQj+iai22ce1paZi
 WVD2HiZX5NF/g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=LUJk6IfW
Subject: Re: [Buildroot] [PATCH v12 1/3] boot/zynqmp-firmware: new boot
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
Cc: ibai.erkiaga-elorza@amd.com, luca.ceresoli@bootlin.com,
 brandon.maier@collins.com, thomas.petazzoni@bootlin.com,
 buildroot@buildroot.org, michal.simek@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Neal, All,

On 2024-06-07 10:47 +0100, Neal Frager via buildroot spake thusly:
> This patch adds a new boot firmware to buildroot for building the zynqmp pmufw.
> It requires the toolchain-bare-metal package that includes a bare-metal
> binutils, gcc and newlib which can be built for the microblaze architecture.
> 
> Signed-off-by: Neal Frager <neal.frager@amd.com>
> ---
[--SNIP--]
> diff --git a/boot/zynqmp-firmware/Config.in b/boot/zynqmp-firmware/Config.in
> new file mode 100644
> index 0000000000..478d58d552
> --- /dev/null
> +++ b/boot/zynqmp-firmware/Config.in
> @@ -0,0 +1,25 @@
> +config BR2_TARGET_ZYNQMP_FIRMWARE
> +	bool "zynqmp-firmware"
> +	depends on BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH = "microblazeel-xilinx-elf"
> +	help
> +	  This package builds the PMU Firmware application required
> +	  to run U-Boot and Linux in the Zynq MPSoC devices.
> +
> +if BR2_TARGET_ZYNQMP_FIRMWARE
> +
> +comment "zynqmp-firmware needs a bare metal toolchain for tuple microblazeel-xilinx-elf"
> +	depends on BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH != "microblazeel-xilinx-elf"

The comment is in the if-endif block, so it will only show when
BR2_TARGET_ZYNQMP_FIRMWARE, but the conditions to show the comment are
the opposite of those to show BR2_TARGET_ZYNQMP_FIRMWARE in the first
place, so the comment will not be visible when BR2_TARGET_ZYNQMP_FIRMWARE
is not already available.

So the comment will never be visible.

So, either place it before the main symnbol, or after the if-endif block
(but not in-between the two).

No need to respin just for that, it can be fixed when applying.

> +config BR2_TARGET_ZYNQMP_FIRMWARE_CUSTOM_CFLAGS
> +	string "custom cflags"
> +	help
> +	  Adds additional CFLAGS for building zynqmp firmware.

What kind of specific CFLAGS would one have to pass?

I see in patch 3 that you are passing -DK26_SOM, so presumably that's
about the CPU or board variant. Shouldn't we have a choice for that:

In the Config.in:

    choice
        bool "Board/CPU variant"

    config BR2_TARGET_ZYNQMP_FIRMWARE_DEFAULT
        bool "default"

    config BR2_TARGET_ZYNQMP_FIRMWARE_K26_SOM
        bool "K26 SOM"

    endchoice

    config BR2_TARGET_ZYNQMP_FIRMWARE_VARIANT
        string
        default "K26_SOM"   if BR2_TARGET_ZYNQMP_FIRMWARE_K26_SOM

In the .mk:

    ZYNQMP_FIRMWARE_VARIANT = $(call qstrip,$(BR2_TARGET_ZYNQMP_FIRMWARE_VARIANT))
    ifneq ($(ZYNQMP_FIRMWARE_VARIANT),)
    ZYNQMP_FIRMWARE_CFLAGS += -D$(ZYNQMP_FIRMWARE_VARIANT)
    endif

> +endif # BR2_TARGET_ZYNQMP_FIRMWARE
> diff --git a/boot/zynqmp-firmware/zynqmp-firmware.mk b/boot/zynqmp-firmware/zynqmp-firmware.mk
> new file mode 100644
> index 0000000000..dafb2dbe55
> --- /dev/null
> +++ b/boot/zynqmp-firmware/zynqmp-firmware.mk
> @@ -0,0 +1,33 @@
> +################################################################################
> +#
> +# zynqmp-firmware
> +#
> +################################################################################
> +
> +ZYNQMP_FIRMWARE_VERSION = $(call qstrip,$(BR2_TARGET_ZYNQMP_FIRMWARE_VERSION))
> +ZYNQMP_FIRMWARE_SITE = \
> +	$(call github,Xilinx,embeddedsw,$(ZYNQMP_FIRMWARE_VERSION))
> +ZYNQMP_FIRMWARE_LICENSE = MIT
> +ZYNQMP_FIRMWARE_LICENSE_FILES = license.txt
> +ZYNQMP_FIRMWARE_INSTALL_IMAGES = YES
> +ZYNQMP_FIRMWARE_INSTALL_TARGET = NO
> +ZYNQMP_FIRMWARE_DEPENDENCIES = toolchain-bare-metal-buildroot
> +
> +CUSTOM_CFLAGS = $(call qstrip,$(BR2_TARGET_ZYNQMP_FIRMWARE_CUSTOM_CFLAGS))

All variables must be scopped in the current package "namespace" [0]:

    ZYNQMP_FIRMWARE_CUSTOM_CFLAGS = ...

No need to respin just for that, it can be fixed when applying...

> +ZYNQMP_FIRMWARE_CFLAGS = "-Os -flto -ffat-lto-objects $(CUSTOM_CFLAGS)"
> +
> +define ZYNQMP_FIRMWARE_BUILD_CMDS
> +	$(MAKE) -C $(@D)/lib/sw_apps/zynqmp_pmufw/src \
> +		COMPILER=$(HOST_DIR)/bin/microblazeel-xilinx-elf-gcc \
> +		ARCHIVER=$(HOST_DIR)/bin/microblazeel-xilinx-elf-gcc-ar \
> +		CC=$(HOST_DIR)/bin/microblazeel-xilinx-elf-gcc \
> +		CFLAGS=$(ZYNQMP_FIRMWARE_CFLAGS)
> +endef
> +
> +ZYNQMP_FIRMWARE = $(@D)/lib/sw_apps/zynqmp_pmufw/src/executable.elf

Ah, I see that the check-package hint is not very explicit. All it says
is that the variable is not properly scopped, and what it reports is
the prefix all variables should have:

    ZYNQMP_FIRMWARE_PMUFW = ...

ZYNQMP_FIRMWARE is the stem all variables should have. Sorry, it was not
clear enough in my previous reply, and the check-package hint is a bit
misleading... I'll send a patch to make it clearer.

[0] https://buildroot.org/downloads/manual/manual.html#_tips_and_tricks

Since ZYNQMP_FIRMWARE_PMUFW is used only once, is there really a need
for an intermediate variable to begin with?

No need to respin just for that, it can be fixed when applying...

Regards,
Yann E. MORIN.

> +define ZYNQMP_FIRMWARE_INSTALL_IMAGES_CMDS
> +	$(INSTALL) -D -m 0755 $(ZYNQMP_FIRMWARE) $(BINARIES_DIR)/pmufw.elf
> +endef
> +
> +$(eval $(generic-package))
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
