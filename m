Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2AD6C433FE
	for <buildroot@archiver.kernel.org>; Sun, 13 Nov 2022 21:40:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9B71560BEF;
	Sun, 13 Nov 2022 21:40:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9B71560BEF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pu4OdFVmYdQA; Sun, 13 Nov 2022 21:40:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D3AA260BEA;
	Sun, 13 Nov 2022 21:40:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D3AA260BEA
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 369B51BF3AF
 for <buildroot@lists.busybox.net>; Sun, 13 Nov 2022 21:40:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 11EC3405A2
 for <buildroot@lists.busybox.net>; Sun, 13 Nov 2022 21:40:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 11EC3405A2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hiVk7YY6lUqc for <buildroot@lists.busybox.net>;
 Sun, 13 Nov 2022 21:40:07 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1E3A64058B
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1E3A64058B
 for <buildroot@buildroot.org>; Sun, 13 Nov 2022 21:40:07 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:a384:6f9d:ef21:3500])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 537E519F595;
 Sun, 13 Nov 2022 22:40:02 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 13 Nov 2022 22:40:02 +0100
Date: Sun, 13 Nov 2022 22:40:02 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <20221113214002.GB1722608@scaer>
References: <20221111215759.358116-1-thomas.petazzoni@bootlin.com>
 <20221111215759.358116-2-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221111215759.358116-2-thomas.petazzoni@bootlin.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1668375605;
 bh=av6qb7pV7h0JL50WtZ/UNskhLhL2ULIuYfnKZI6oXro=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KAqvvLE/eT6cPTX3ld+URijCvaJfdFjKnskVmVnED9FDrtgfM/SmR0+X/445Ky21l
 Oq0xj0za7lOM3fIGDCBOt3MLiKwgax9SuWX87AQAsMTY8miCLQgQ8RsQwQkG/dwqj7
 W2+By0cPH+NB/m+BI5c7BwgacoiTjaxw3AcXUtcAR+Ff9WZ1m64Ohm0MOjqBUd1CXD
 TgbbjSiErUBI7QibPkH6U+933yQrQovLfKurY7zovzuRIVWqFXWLL2WfeDgG+wmEZs
 44kgV7Z+Ep1ngFQgunvnWcyUgBkCyLnO8igLeOZCi0scalpJUI3YODyWahW6MCxrIj
 EFy0eeMizg//A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=KAqvvLE/
Subject: Re: [Buildroot] [PATCH 2/2] utils/genrandconfig: disallow configs
 with BR2_XTENSA_CUSTOM=y
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Buildroot List <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Thomas, All,

On 2022-11-11 22:57 +0100, Thomas Petazzoni spake thusly:
> When BR2_XTENSA_CUSTOM=y is used with the internal toolchain, an
> overlay file is mandatory, which genrandconfig can't provide. So we
> simply disallow such configurations.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  utils/genrandconfig | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/utils/genrandconfig b/utils/genrandconfig
> index f19a405685..9c6c2b359c 100755
> --- a/utils/genrandconfig
> +++ b/utils/genrandconfig
> @@ -304,6 +304,11 @@ def fixup_config(sysinfo, configfile):
>      # No C library for internal toolchain
>      if 'BR2_TOOLCHAIN_BUILDROOT_NONE=y' in configlines:
>          return False
> +    # Xtensa custom cores require an overlay file with internal
> +    # toolchains
> +    if 'BR2_XTENSA_CUSTOM=y' in configlines and \
> +       'BR2_TOOLCHAIN_BUILDROOT=y' in configlines:
> +        return False
>  
>      if 'BR2_PACKAGE_AUFS_UTIL=y\n' in configlines and \
>         'BR2_PACKAGE_AUFS_UTIL_VERSION=""\n' in configlines:
> -- 
> 2.38.1
> 

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
