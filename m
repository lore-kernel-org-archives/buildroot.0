Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 355E9C27C4F
	for <buildroot@archiver.kernel.org>; Sat, 15 Jun 2024 21:26:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EF8398112E;
	Sat, 15 Jun 2024 21:26:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bP-Veh0t9ON4; Sat, 15 Jun 2024 21:26:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DF57E812E7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DF57E812E7;
	Sat, 15 Jun 2024 21:26:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 52E271BF2F8
 for <buildroot@lists.busybox.net>; Sat, 15 Jun 2024 21:26:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 409D4811C1
 for <buildroot@lists.busybox.net>; Sat, 15 Jun 2024 21:26:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id M0IpCt6PhMtv for <buildroot@lists.busybox.net>;
 Sat, 15 Jun 2024 21:26:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2885E8112E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2885E8112E
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2885E8112E
 for <buildroot@buildroot.org>; Sat, 15 Jun 2024 21:26:04 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 3CF7C13F86E;
 Sat, 15 Jun 2024 23:25:55 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 15 Jun 2024 23:25:55 +0200
Date: Sat, 15 Jun 2024 23:25:55 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Neal Frager <neal.frager@amd.com>
Message-ID: <Zm4G42bruKUQ40Y-@landeda>
References: <20240613061423.1737631-1-neal.frager@amd.com>
 <20240613061423.1737631-5-neal.frager@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240613061423.1737631-5-neal.frager@amd.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1718486762;
 bh=2t5Ag8FpclyKq1yb+tEzgFs42kp/OrzuZjUeREHl1+E=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=hFGma1J3ik8muEhaoi3fLWwiJesPgY1Xc3ziiUJqJWWcbPAY+2zF+y4xXTVTciaqI
 VglXc4og4u+r5Wl/b9CdSfl6tC3X2KLEcqq5AgKYKxuGuvdARqAcxt1yepb9cLwHzz
 3wJmio/iHQpu4IWr1EdTIEg7n8N3E8E48mdSL4qyAg7WhE3KxsOdLSxDhIuo3pE73A
 BAD483LLFEIhsvSuJykqRK0ZXYB8ihali4FWqpFzmDxTtVwbZ7qupwnq8cjmS6Mao9
 G7/JIkPVoGQvWXOo+YoacslzDJNm9KN07jqrEk7WzB6b+38HD4HwZrN5zrkk38AiNE
 E31EtBtvK9EKA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=hFGma1J3
Subject: Re: [Buildroot] [PATCH v2 5/5] package/versal-firmware: remove
 package
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
> This patch removes the package/versal-firmware as this package is replaced
> by the boot/xilinx-prebuilt target boot firmware package.
> 
> Signed-off-by: Neal Frager <neal.frager@amd.com>

I've applied to master, after adding legacy handling.

Regards,
Yann E. MORIN.

> ---
> V1->V2:
>  - no changes
> ---
>  DEVELOPERS                                    |  1 -
>  .../versal-firmware/versal-firmware.hash      |  2 --
>  package/Config.in                             |  1 -
>  package/versal-firmware/Config.in             | 24 -------------------
>  package/versal-firmware/versal-firmware.mk    | 21 ----------------
>  5 files changed, 49 deletions(-)
>  delete mode 100644 board/xilinx/patches/versal-firmware/versal-firmware.hash
>  delete mode 100644 package/versal-firmware/Config.in
>  delete mode 100644 package/versal-firmware/versal-firmware.mk
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 93627a0064..e5706e493b 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -2352,7 +2352,6 @@ F:	package/binutils-bare-metal/
>  F:	package/bootgen/
>  F:	package/gcc-bare-metal/
>  F:	package/newlib-bare-metal/
> -F:	package/versal-firmware/
>  F:	toolchain/toolchain-bare-metal-buildroot/
>  
>  N:	Nicola Di Lieto <nicola.dilieto@gmail.com>
> diff --git a/board/xilinx/patches/versal-firmware/versal-firmware.hash b/board/xilinx/patches/versal-firmware/versal-firmware.hash
> deleted file mode 100644
> index c4d745f22c..0000000000
> --- a/board/xilinx/patches/versal-firmware/versal-firmware.hash
> +++ /dev/null
> @@ -1,2 +0,0 @@
> -# Locally calculated
> -sha256  7abcba4e0e44e3a4adf9c1f971d918575226d7604dfd64a386baaa00c1c6c35f  versal-firmware-xilinx_v2024.1.tar.gz
> diff --git a/package/Config.in b/package/Config.in
> index 1b6a5b0dab..13af2978dd 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -460,7 +460,6 @@ menu "Firmware"
>  	source "package/sunxi-boards/Config.in"
>  	source "package/ts4900-fpga/Config.in"
>  	source "package/ux500-firmware/Config.in"
> -	source "package/versal-firmware/Config.in"
>  	source "package/wilc-firmware/Config.in"
>  	source "package/wilink-bt-firmware/Config.in"
>  	source "package/zd1211-firmware/Config.in"
> diff --git a/package/versal-firmware/Config.in b/package/versal-firmware/Config.in
> deleted file mode 100644
> index 01daefd204..0000000000
> --- a/package/versal-firmware/Config.in
> +++ /dev/null
> @@ -1,24 +0,0 @@
> -config BR2_PACKAGE_VERSAL_FIRMWARE
> -	bool "versal-firmware"
> -	depends on BR2_aarch64
> -	help
> -	  Pre-built firmware files for Xilinx Versal boards.
> -
> -	  https://github.com/Xilinx/soc-prebuilt-firmware
> -
> -if BR2_PACKAGE_VERSAL_FIRMWARE
> -
> -config BR2_PACKAGE_VERSAL_FIRMWARE_VERSION
> -	string "firmware version"
> -	default "xilinx_v2023.1"
> -	help
> -	  Release version of Versal firmware.
> -
> -config BR2_PACKAGE_VERSAL_FIRMWARE_BOARD
> -	string "board name"
> -	default "vck190"
> -	help
> -	  Name of Versal target board.
> -	  Used for installing the appropriate firmware.
> -
> -endif # BR2_PACKAGE_VERSAL_FIRMWARE
> diff --git a/package/versal-firmware/versal-firmware.mk b/package/versal-firmware/versal-firmware.mk
> deleted file mode 100644
> index 1ced259be1..0000000000
> --- a/package/versal-firmware/versal-firmware.mk
> +++ /dev/null
> @@ -1,21 +0,0 @@
> -################################################################################
> -#
> -# versal-firmware
> -#
> -################################################################################
> -
> -VERSAL_FIRMWARE_VERSION = $(call qstrip,$(BR2_PACKAGE_VERSAL_FIRMWARE_VERSION))
> -VERSAL_FIRMWARE_SITE = $(call github,Xilinx,soc-prebuilt-firmware,$(VERSAL_FIRMWARE_VERSION))
> -VERSAL_FIRMWARE_LICENSE = MIT
> -VERSAL_FIRMWARE_LICENSE_FILES = LICENSE
> -VERSAL_FIRMWARE_INSTALL_TARGET = NO
> -VERSAL_FIRMWARE_INSTALL_IMAGES = YES
> -
> -define VERSAL_FIRMWARE_INSTALL_IMAGES_CMDS
> -	$(foreach f,plm.elf psmfw.elf vpl_gen_fixed.pdi,\
> -		$(INSTALL) -D -m 0755 $(@D)/$(BR2_PACKAGE_VERSAL_FIRMWARE_BOARD)-versal/$(f) \
> -			$(BINARIES_DIR)/$(f)
> -	)
> -endef
> -
> -$(eval $(generic-package))
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
