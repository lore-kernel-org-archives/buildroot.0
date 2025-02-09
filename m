Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DFD0C0219B
	for <buildroot@archiver.kernel.org>; Sun,  9 Feb 2025 21:43:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 00FB240D9B;
	Sun,  9 Feb 2025 21:43:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S9wU5YYkWFxO; Sun,  9 Feb 2025 21:43:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D2A3540D7F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D2A3540D7F;
	Sun,  9 Feb 2025 21:43:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id A9C6FC2
 for <buildroot@buildroot.org>; Sun,  9 Feb 2025 21:43:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8D6E5608FD
 for <buildroot@buildroot.org>; Sun,  9 Feb 2025 21:43:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mdfp6JRH8pLK for <buildroot@buildroot.org>;
 Sun,  9 Feb 2025 21:43:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 2C981607C4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2C981607C4
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2C981607C4
 for <buildroot@buildroot.org>; Sun,  9 Feb 2025 21:43:03 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 527C919F57B;
 Sun,  9 Feb 2025 22:42:56 +0100 (CET)
Received: from 2a01:e0a:485:b220:8213:2270:4a8d:a1d5
 via 2a01:e0a:485:b220:8213:2270:4a8d:a1d5 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 09 Feb 2025 22:42:56 +0100
MIME-Version: 1.0
Date: Sun, 09 Feb 2025 22:42:56 +0100
From: Julien Olivain <ju.o@free.fr>
To: Niklas Cassel <Niklas.Cassel@wdc.com>
Cc: buildroot@buildroot.org, Kilian Zinnecker <kilian.zinnecker@mail.de>,
 Damien Le Moal <dlemoal@kernel.org>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, Niklas Cassel <cassel@kernel.org>
In-Reply-To: <20250209100233.2541832-1-Niklas.Cassel@wdc.com>
References: <20250209100233.2541832-1-Niklas.Cassel@wdc.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <8151131e662eb877eb5dc2ed25ffdddc@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1739137381;
 bh=7MHuGf8cHN3tcbjHFXti/bT9z/tY5gw0x2Fe/3X6478=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=P+KLfpyxQj5G3GyG+jBEsJylNLgnmbNZ6Dm7cF/6D5gMxuboIYu4yZhBu7UACdlJd
 SeRiDMtYVykdSgJ5QULh0xqvrXIzzzd9yyFcSRZaMNZxXnt+h1X1HzBzd6Ttf8SbuQ
 5EWXFxTdjcZe3It77htjuHOCEYcw8/SAg6ATX4et5qQhhbPJ+SzyQ0yq7vmIOUJFtv
 P58LQJiwEn5uQPI/2+yf6VOImTS1uK+Pajb7UiNUj7zyCSZncK9bmyNKGGhbg0M4MQ
 lv3PB8Dq9fFN7ZrCCyHvo8PzB+YLE9lzkAH5qn2v79anolVpZgYMgfKEx629pJxbuV
 pG6GxesJ3gzqg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=P+KLfpyx
Subject: Re: [Buildroot] [PATCH] configs/rock5b: bump uboot to 2025.01
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Niklas,

Thank you for the patch!

On 09/02/2025 11:02, Niklas Cassel via buildroot wrote:
> From: Niklas Cassel <cassel@kernel.org>
> 
> Bump uboot to 2025.01
> 
> Signed-off-by: Niklas Cassel <cassel@kernel.org>
> ---
>  configs/rock5b_defconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/configs/rock5b_defconfig b/configs/rock5b_defconfig
> index c1bd9deb1a..ebd665e322 100644
> --- a/configs/rock5b_defconfig
> +++ b/configs/rock5b_defconfig
> @@ -42,7 +42,7 @@ BR2_TARGET_ROOTFS_EXT2_SIZE="250M"
>  BR2_TARGET_UBOOT=y
>  BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
>  BR2_TARGET_UBOOT_CUSTOM_VERSION=y
> -BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.10"
> +BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2025.01"

This defconfig has BR2_DOWNLOAD_FORCE_CHECK_HASHES=y.
So if you update the uboot version here, this patch should
also update the hash in:
board/radxa/rock5b/patches/uboot/uboot.hash

This is needed because the default uboot version with its
hash in boot/uboot/uboot.hash (which happen to be
2025.01 as of now) might be updated on its own independently.

>  BR2_TARGET_UBOOT_BOARD_DEFCONFIG="rock5b-rk3588"
>  
> BR2_TARGET_UBOOT_CONFIG_FRAGMENT_FILES="board/radxa/rock5b/u-boot.fragment"
>  BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
> --
> 2.48.1

Could you send a v2 updating the hash, please?

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
