Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFDF4C77B7D
	for <buildroot@archiver.kernel.org>; Sun,  7 May 2023 12:46:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5E2CE40535;
	Sun,  7 May 2023 12:46:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5E2CE40535
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ias7jMxUS03Q; Sun,  7 May 2023 12:46:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 857DE404FE;
	Sun,  7 May 2023 12:46:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 857DE404FE
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 27BB61BF391
 for <buildroot@lists.busybox.net>; Sun,  7 May 2023 12:46:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0E8C3404FE
 for <buildroot@lists.busybox.net>; Sun,  7 May 2023 12:46:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0E8C3404FE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EmNP2dhih5i2 for <buildroot@lists.busybox.net>;
 Sun,  7 May 2023 12:46:47 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1504740192
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1504740192
 for <buildroot@buildroot.org>; Sun,  7 May 2023 12:46:47 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:5f9f:2ea:ec9d:3930])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 203C119F740;
 Sun,  7 May 2023 14:46:41 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 07 May 2023 14:46:40 +0200
Date: Sun, 7 May 2023 14:46:40 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20230507124640.GQ252090@scaer>
References: <20230501162619.1260325-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230501162619.1260325-1-giulio.benetti@benettiengineering.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1683463605;
 bh=9qu2eRuSBYrjees2DV7yWOSd4OXvhFEYD1AGIDDqqV0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=BU79UxOWCKw49EyFYoomix5GgVqz5iVMLXTiSMaKgY3ADhO25+0sk35Mf4KQs6Oxw
 HvjClSZOaa/CQgzhTB+eW3pdbHmN/fukyrMu5cSLrNo28eSsHF3KlA9EuAEkpQHOMb
 NIU5GAx4pMAX/3Ev2J+OihDaX1lJN2oRakbyRhKH1c7h83SUxHaIDuK3536xYSUaSA
 ZAIPs5N1HjjNK+B3w5gYJZu/ASfxgxP0pNgJh5ID4gFxPHOcz7ShYOwVmB3J+Bw3Aj
 752x/oTkcTUkoEKWp92acCQYfR7TJgf1eI/njUXpNETWrnOS+zAZkMn6lx/tqWVqSr
 GlhG/uNJPsOog==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=BU79UxOW
Subject: Re: [Buildroot] [PATCH] configs/stm32f429_disco_xip_defconfig: fix
 runtime error due to low ram space and bump to linux version 6.1.27
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
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Christophe Priouzeau <christophe.priouzeau@foss.st.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Giulio, All,

On 2023-05-01 18:26 +0200, Giulio Benetti spake thusly:
> After booting Linux the userspace is unusable since every command issued,
> that is a symlink to busybox, fails because of no free ram. So let's
> disable IIO in linux.config to give some more ram to userspace.
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  board/stmicroelectronics/stm32f429-disco/linux.config | 4 ----
>  configs/stm32f429_disco_xip_defconfig                 | 2 +-
>  2 files changed, 1 insertion(+), 5 deletions(-)
> 
> diff --git a/board/stmicroelectronics/stm32f429-disco/linux.config b/board/stmicroelectronics/stm32f429-disco/linux.config
> index 7b5c60f180..02d9c2d1e0 100644
> --- a/board/stmicroelectronics/stm32f429-disco/linux.config
> +++ b/board/stmicroelectronics/stm32f429-disco/linux.config
> @@ -95,10 +95,6 @@ CONFIG_STM32_MDMA=y
>  CONFIG_SYNC_FILE=y
>  # CONFIG_VIRTIO_MENU is not set
>  # CONFIG_VHOST_MENU is not set
> -CONFIG_IIO=y
> -CONFIG_IIO_BUFFER=y
> -CONFIG_IIO_TRIGGERED_BUFFER=y
> -CONFIG_IIO_STM32_TIMER_TRIGGER=y
>  # CONFIG_FILE_LOCKING is not set
>  # CONFIG_DNOTIFY is not set
>  # CONFIG_INOTIFY_USER is not set
> diff --git a/configs/stm32f429_disco_xip_defconfig b/configs/stm32f429_disco_xip_defconfig
> index 872e4b6a30..1aea741f7e 100644
> --- a/configs/stm32f429_disco_xip_defconfig
> +++ b/configs/stm32f429_disco_xip_defconfig
> @@ -6,7 +6,7 @@ BR2_ENABLE_LTO=y
>  BR2_ROOTFS_POST_BUILD_SCRIPT="board/stmicroelectronics/common/stm32f4xx/stm32-post-build.sh"
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.10"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.27"
>  BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
>  BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/stmicroelectronics/stm32f429-disco/linux.config"
>  BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
> -- 
> 2.34.1
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
