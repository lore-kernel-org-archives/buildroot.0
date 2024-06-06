Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 775CDC25B75
	for <buildroot@archiver.kernel.org>; Thu,  6 Jun 2024 13:25:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 291984003C;
	Thu,  6 Jun 2024 13:25:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K9hfi5ZC9U9S; Thu,  6 Jun 2024 13:25:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B1CE140055
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B1CE140055;
	Thu,  6 Jun 2024 13:25:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7FD001BF32B
 for <buildroot@lists.busybox.net>; Thu,  6 Jun 2024 13:25:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 78E5C40055
 for <buildroot@lists.busybox.net>; Thu,  6 Jun 2024 13:25:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SiRed-3sbGaN for <buildroot@lists.busybox.net>;
 Thu,  6 Jun 2024 13:25:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4160A4003C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4160A4003C
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4160A4003C
 for <buildroot@buildroot.org>; Thu,  6 Jun 2024 13:25:15 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 492BA13F8AE;
 Thu,  6 Jun 2024 15:25:09 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Thu, 06 Jun 2024 15:25:09 +0200
Date: Thu, 6 Jun 2024 15:25:09 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Message-ID: <ZmG4tZkQRcP2pAPx@landeda>
References: <20240606102208.580103-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240606102208.580103-1-dario.binacchi@amarulasolutions.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1717680313;
 bh=TQjAQLLTo5tdU2yY6l7uCRl53gtPtusvpHQXTjJr/oo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JOG0qHNCNvXsMkOq+alg8g2Kd75oa+PguY0u+Zv4BV6oqN6kvF471EkEhALIOY0x+
 9P9iH6rEjV8V7er6qBuZGX+O0APFf4BBZxtc0g110dkixcRzYSp7ni1Ijf5EFxQVbt
 AA3qX7iMqRS1btjfdiQPf5cHdR9yWGQ1TZWCLG9e8sCFOzE4UWfmT5he8HeZkWa0ZK
 eo3dhK89h4zvx1A6z9I1M29I28w2e7xzBt7S7ci6sict/+xX8NIp9X8V+28lniBVnK
 sYTcb2Pd+XI0TkVcvpY1mKbJ6fByz4VtNyb/DTPsObQA2LJF//d5FFRVWrYHVe6nrC
 +ZSgMnJgoGfFA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=JOG0qHNC
Subject: Re: [Buildroot] [PATCH 1/1] configs/stm32f429_disco_xip: add hashes
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
Cc: Christophe Priouzeau <christophe.priouzeau@foss.st.com>,
 linux-amarula@amarulasolutions.com, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Dario, All,

On 2024-06-06 12:22 +0200, Dario Binacchi spake thusly:
> The patch adds .hash files for Linux and Linux headers and then enables
> BR2_DOWNLOAD_FORCE_CHECK_HASHES. With this, we can now drop the defconfig
> from .checkpackageignore.
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> ---
[--SNIP--]
> diff --git a/board/stmicroelectronics/stm32f429-disco/patches/linux-headers/linux-headers.hash b/board/stmicroelectronics/stm32f429-disco/patches/linux-headers/linux-headers.hash
> new file mode 120000
> index 000000000000..5808d92afe89
> --- /dev/null
> +++ b/board/stmicroelectronics/stm32f429-disco/patches/linux-headers/linux-headers.hash
> @@ -0,0 +1 @@
> +../linux/linux.hash
> \ No newline at end of file

This symlink is not needed in that defconfig: it uses linux-headers that
are not the same as the kernel, and instead use the 6.1.x from the
linux-headers version choice.

SoI dropped the symlink, to avoid any confusion.

Applied to master, with the above fixed, thanks.

Regards,
Yann E. MORIN.

> diff --git a/board/stmicroelectronics/stm32f429-disco/patches/linux/linux.hash b/board/stmicroelectronics/stm32f429-disco/patches/linux/linux.hash
> new file mode 100644
> index 000000000000..c1bd9f9100d5
> --- /dev/null
> +++ b/board/stmicroelectronics/stm32f429-disco/patches/linux/linux.hash
> @@ -0,0 +1,2 @@
> +# Locally calculated
> +sha256  c2b74b96dd3d0cc9f300914ef7c4eef76d5fac9de6047961f49e69447ce9f905  linux-6.1.27.tar.xz
> diff --git a/configs/stm32f429_disco_xip_defconfig b/configs/stm32f429_disco_xip_defconfig
> index 99ae8cc7533b..e3d3cc38ff8e 100644
> --- a/configs/stm32f429_disco_xip_defconfig
> +++ b/configs/stm32f429_disco_xip_defconfig
> @@ -3,6 +3,8 @@ BR2_cortex_m4=y
>  BR2_KERNEL_HEADERS_6_1=y
>  # BR2_UCLIBC_INSTALL_UTILS is not set
>  BR2_ENABLE_LTO=y
> +BR2_GLOBAL_PATCH_DIR="board/stmicroelectronics/stm32f429-disco/patches"
> +BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
>  BR2_ROOTFS_POST_BUILD_SCRIPT="board/stmicroelectronics/common/stm32f4xx/stm32-post-build.sh"
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION=y
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
