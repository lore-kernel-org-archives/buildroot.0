Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6631AC4452D
	for <buildroot@archiver.kernel.org>; Tue, 21 Jul 2026 20:55:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2D8E96089A;
	Tue, 21 Jul 2026 20:55:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vEDNs22uTpiO; Tue, 21 Jul 2026 20:55:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 812096089B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784667303;
	bh=W486d2mUpPGgp2DVN25fxIg5W5+L9Yrgv1dShIWv72c=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=kV8yLbDx7jW5V2mk8zIxPjiC2EqRRzzr5vejQkNCjpLFG/pFWnkRkQV4BipfwZ7Zy
	 EonUrcFj2QbnTcCh2w3Dnyn2WEifJeO74PckupZr0bl5IJctKSt4u6q0y6D1E7snK5
	 bWeIRWSyaGxj/f/Dr2WGsb7eUK9KKp3xh0XUdBHoxjjKdMwHMhT2J5FBNqOP1IS93m
	 qBtv82YbvdyQXMF6tq+rvuc+pN3KBqXsRwXn3wXZ54xvN5CyO4F/dAyR39NSmK/agx
	 ezLm8cIopTqojKu1/J+lsnGbVXvt1na4rMbhQmjPAQfSIgGdaMCsKCgpG4UJGz5Iem
	 ByiVk23MUhnDw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 812096089B;
	Tue, 21 Jul 2026 20:55:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 49FD3DF0
 for <buildroot@buildroot.org>; Tue, 21 Jul 2026 20:55:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 300FD40788
 for <buildroot@buildroot.org>; Tue, 21 Jul 2026 20:55:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3MpDxX8KjWv4 for <buildroot@buildroot.org>;
 Tue, 21 Jul 2026 20:55:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 01B8840785
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 01B8840785
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 01B8840785
 for <buildroot@buildroot.org>; Tue, 21 Jul 2026 20:55:00 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 284982003CA;
 Tue, 21 Jul 2026 22:54:55 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 21 Jul 2026 22:54:55 +0200
MIME-Version: 1.0
Date: Tue, 21 Jul 2026 22:54:55 +0200
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: buildroot@buildroot.org, Christophe Priouzeau
 <christophe.priouzeau@foss.st.com>, linux-amarula@amarulasolutions.com
In-Reply-To: <20260721184249.1579381-2-dario.binacchi@amarulasolutions.com>
References: <20260721184249.1579381-1-dario.binacchi@amarulasolutions.com>
 <20260721184249.1579381-2-dario.binacchi@amarulasolutions.com>
User-Agent: Webmail Free/1.6.17
Message-ID: <59d2eac82e3a58e006e67d3ee35f3bf6@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1784667298;
 bh=7EiJTrFZiEvhyTCezkXDmxfPckQwoJyJAdwvZ8COeOw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=M9yONuaL3I/mcyMqZpjbm/yMX5dTqmoR5c2GHQBDA2BszEqSh+MFvIDy24JvznjhL
 wpy/KlFSvrDod2m0C3tEOYKI6jhWnTE2hnEJnoc+yrWiHUNvQfo/wXIkck6ZTAfbZR
 lnEIRb9rsWcLuo1/PcG9v/VMcqg796w9DKaFZqWmi5f0SCXEcIoYEQB91DOrVJD6wO
 EtNBoN+B4Pyy5eoY/QsjkA6q+amy4Ughl2oAg6rL+PVS5Zd71GW7DC6FHerCKO3J1K
 YHbbU2cUNrCPB6ryxMPsh/vTstJkBcv5q5zQoddOlyMq05+ZXSlMzfj6xEWfuSnumV
 dl9QMMSPlumtw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=M9yONuaL
Subject: Re: [Buildroot] [PATCH 1/6] configs/stm32f429_disco_xip: fix boot
 failure after uClibc bump
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Dario,

On 21/07/2026 20:42, Dario Binacchi wrote:
> Since uClibc was bumped to 1.0.58 (c7fef3704c70, "package/uclibc:
> bump to 1.0.58"), the board fails to boot:
> 
>     sh: out of memory
>     Kernel panic - not syncing: Attempted to kill init! 
> exitcode=0x00000100
>     CPU: 0 PID: 1 Comm: init Not tainted 6.1.167 #2
>     Hardware name: STM32 (Device Tree Support)
>     Function entered at [<0800ea1e>] from [<0800de7b>]
>     Function entered at [<0800de7b>] from [<080e4991>]
>     Function entered at [<080e4991>] from [<080e2d19>]
>     Function entered at [<080e2d19>] from [<080125eb>]
>     Function entered at [<080125eb>] from [<08012b09>]
>     Function entered at [<08012b09>] from [<08012b69>]
>     ---[ end Kernel panic - not syncing: Attempted to kill init! 
> exitcode=0x00000100 ]---
> 
> The STM32F429 has no MMU, and uClibc's standard malloc() implementation
> returns NULL for allocations performed during early init on this 
> target,
> causing init to abort immediately.
> 
> Fix this by switching to MALLOC_SIMPLE, a plain mmap-based allocator
> meant for small/noMMU systems, via a uClibc config fragment. The
> fragment is placed under board/stmicroelectronics/common/stm32f4xx/,
> rather than under the board-specific directory, so that it can be
> shared with the STM32F469, another Cortex-M4/noMMU board affected by
> the same issue, which will be fixed in a subsequent patch.

For info, the issue may have been introduced by uclibc commit:
https://github.com/wbx-github/uclibc-ng/commit/487af14988c3c923aa661f204642597cff356a83

There is an upstream fix, not released yet,  which seems to fix the 
issue:
https://github.com/wbx-github/uclibc-ng/commit/7730f0d05a51cd89a7123bd696e4638c3c035d7b

You could possibly drop this malloc config change after the next uclibc 
bump.

> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

In the meantime, I applied this series to master, thanks.

> ---
>  .../stmicroelectronics/common/stm32f4xx/uclibc-fragment.config  | 2 ++
>  configs/stm32f429_disco_xip_defconfig                           | 1 +
>  2 files changed, 3 insertions(+)
>  create mode 100644 
> board/stmicroelectronics/common/stm32f4xx/uclibc-fragment.config
> 
> diff --git 
> a/board/stmicroelectronics/common/stm32f4xx/uclibc-fragment.config 
> b/board/stmicroelectronics/common/stm32f4xx/uclibc-fragment.config
> new file mode 100644
> index 000000000000..fb8fa9ee01c3
> --- /dev/null
> +++ b/board/stmicroelectronics/common/stm32f4xx/uclibc-fragment.config
> @@ -0,0 +1,2 @@
> +# MALLOC is not set
> +MALLOC_SIMPLE=y
> diff --git a/configs/stm32f429_disco_xip_defconfig 
> b/configs/stm32f429_disco_xip_defconfig
> index 489303b93e0d..e6edfa906177 100644
> --- a/configs/stm32f429_disco_xip_defconfig
> +++ b/configs/stm32f429_disco_xip_defconfig
> @@ -1,6 +1,7 @@
>  BR2_arm=y
>  BR2_cortex_m4=y
>  BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
> +BR2_UCLIBC_CONFIG_FRAGMENT_FILES="board/stmicroelectronics/common/stm32f4xx/uclibc-fragment.config"
>  # BR2_UCLIBC_INSTALL_UTILS is not set
>  BR2_ENABLE_LTO=y
>  
> BR2_GLOBAL_PATCH_DIR="board/stmicroelectronics/stm32f429-disco/patches"
> --
> 2.43.0

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
