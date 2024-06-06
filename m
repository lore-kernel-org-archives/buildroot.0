Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63105C25B75
	for <buildroot@archiver.kernel.org>; Thu,  6 Jun 2024 13:23:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F012240585;
	Thu,  6 Jun 2024 13:23:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F-x6jDJYPSTF; Thu,  6 Jun 2024 13:23:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 62DC840584
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 62DC840584;
	Thu,  6 Jun 2024 13:23:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B2ED41BF32B
 for <buildroot@lists.busybox.net>; Thu,  6 Jun 2024 13:23:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AD43181F5C
 for <buildroot@lists.busybox.net>; Thu,  6 Jun 2024 13:23:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2yjKOa9fJHkU for <buildroot@lists.busybox.net>;
 Thu,  6 Jun 2024 13:23:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 67B3781F34
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 67B3781F34
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 67B3781F34
 for <buildroot@buildroot.org>; Thu,  6 Jun 2024 13:23:44 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 5249513F8AD;
 Thu,  6 Jun 2024 15:23:38 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Thu, 06 Jun 2024 15:23:38 +0200
Date: Thu, 6 Jun 2024 15:23:38 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Message-ID: <ZmG4Wo_2kKmkDs4b@landeda>
References: <20240606101806.579260-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240606101806.579260-1-dario.binacchi@amarulasolutions.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1717680221;
 bh=sVFjJDURls0IA1+NfqUtPe21L9JvbYrzK5XuwHcetwo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=M30OhQsmVG5mgC9Sjgkk1uLvHX3G7MrSCcDk8Oisc5KXN3//5y0EWkMTnAgbbDAMI
 dSXDm+e1ikUEZLwXHouKGZbsoaUs3En4lCLocgUBG4eZDAImXfDRwrWcqmumN0Ug+H
 XwTSVf7g7I8Rmux82vTBjRSo1dFbm2raZAntulqAkSH24CN2caem8KLJtOOKf89JpO
 Eutb3XOk+gn5oaDEBy/a4d9qQXlkk9wUTr/8eaGi2R7KPZqa0PgGVw1fAKHR1SZDZ8
 RW8Pchcpu9OEbSkcSuDZpb7LFFvdg9n/R3i1YhG6nxsuoEHGO7V+coyEjNbbNAKtgM
 /ddmSuamTuEqA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=M30OhQsm
Subject: Re: [Buildroot] [PATCH 1/1] configs/stm32f769_disco_sd: add hashes
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
Cc: linux-amarula@amarulasolutions.com, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Dario, All,

On 2024-06-06 12:18 +0200, Dario Binacchi spake thusly:
> The patch adds .hash files for Linux, Linux headers and U-Boot and then
> enables BR2_DOWNLOAD_FORCE_CHECK_HASHES. With this, we can now drop the
> defconfig from .checkpackageignore.
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  .checkpackageignore                                             | 1 -
>  .../stm32f769-disco/patches/linux-headers/linux-headers.hash    | 1 +
>  .../stmicroelectronics/stm32f769-disco/patches/linux/linux.hash | 2 ++
>  .../stmicroelectronics/stm32f769-disco/patches/uboot/uboot.hash | 2 ++
>  configs/stm32f769_disco_sd_defconfig                            | 2 ++
>  5 files changed, 7 insertions(+), 1 deletion(-)
>  create mode 120000 board/stmicroelectronics/stm32f769-disco/patches/linux-headers/linux-headers.hash
>  create mode 100644 board/stmicroelectronics/stm32f769-disco/patches/linux/linux.hash
>  create mode 100644 board/stmicroelectronics/stm32f769-disco/patches/uboot/uboot.hash
> 
> diff --git a/.checkpackageignore b/.checkpackageignore
> index d0bd179a5c02..35c8c0a59c7f 100644
> --- a/.checkpackageignore
> +++ b/.checkpackageignore
> @@ -333,7 +333,6 @@ configs/spike_riscv64_defconfig lib_defconfig.ForceCheckHash
>  configs/stm32f429_disco_xip_defconfig lib_defconfig.ForceCheckHash
>  configs/stm32f469_disco_sd_defconfig lib_defconfig.ForceCheckHash
>  configs/stm32f469_disco_xip_defconfig lib_defconfig.ForceCheckHash
> -configs/stm32f769_disco_sd_defconfig lib_defconfig.ForceCheckHash
>  configs/stm32mp157a_dk1_defconfig lib_defconfig.ForceCheckHash
>  configs/stm32mp157c_dk2_defconfig lib_defconfig.ForceCheckHash
>  configs/stm32mp157c_odyssey_defconfig lib_defconfig.ForceCheckHash
> diff --git a/board/stmicroelectronics/stm32f769-disco/patches/linux-headers/linux-headers.hash b/board/stmicroelectronics/stm32f769-disco/patches/linux-headers/linux-headers.hash
> new file mode 120000
> index 000000000000..5808d92afe89
> --- /dev/null
> +++ b/board/stmicroelectronics/stm32f769-disco/patches/linux-headers/linux-headers.hash
> @@ -0,0 +1 @@
> +../linux/linux.hash
> \ No newline at end of file
> diff --git a/board/stmicroelectronics/stm32f769-disco/patches/linux/linux.hash b/board/stmicroelectronics/stm32f769-disco/patches/linux/linux.hash
> new file mode 100644
> index 000000000000..49a2ba85a7de
> --- /dev/null
> +++ b/board/stmicroelectronics/stm32f769-disco/patches/linux/linux.hash
> @@ -0,0 +1,2 @@
> +# Locally calculated
> +sha256  8beb69ada46f1cbca2f4cf901ec078846035c1cd925d9471422f65aff74243ba  linux-5.15.108.tar.xz
> diff --git a/board/stmicroelectronics/stm32f769-disco/patches/uboot/uboot.hash b/board/stmicroelectronics/stm32f769-disco/patches/uboot/uboot.hash
> new file mode 100644
> index 000000000000..7cef5b688ec3
> --- /dev/null
> +++ b/board/stmicroelectronics/stm32f769-disco/patches/uboot/uboot.hash
> @@ -0,0 +1,2 @@
> +# Locally calculated
> +sha256  e31cac91545ff41b71cec5d8c22afd695645cd6e2a442ccdacacd60534069341  u-boot-2023.04.tar.bz2
> diff --git a/configs/stm32f769_disco_sd_defconfig b/configs/stm32f769_disco_sd_defconfig
> index 725c985ec04e..952d22cc60dd 100644
> --- a/configs/stm32f769_disco_sd_defconfig
> +++ b/configs/stm32f769_disco_sd_defconfig
> @@ -1,6 +1,8 @@
>  BR2_arm=y
>  BR2_cortex_m7=y
>  BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
> +BR2_GLOBAL_PATCH_DIR="board/stmicroelectronics/stm32f769-disco/patches"
> +BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
>  BR2_ROOTFS_POST_BUILD_SCRIPT="board/stmicroelectronics/stm32f769-disco/post-build.sh"
>  BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
>  BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/stmicroelectronics/stm32f769-disco/genimage.cfg"
> -- 
> 2.43.0
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
