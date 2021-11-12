Return-Path: <SRS0=pZJ6=P7=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D851BC433F5
	for <buildroot@archiver.kernel.org>; Fri, 12 Nov 2021 22:41:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 930B760F45
	for <buildroot@archiver.kernel.org>; Fri, 12 Nov 2021 22:41:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 930B760F45
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7089A4062F;
	Fri, 12 Nov 2021 22:41:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dZlT88mK4Bzo; Fri, 12 Nov 2021 22:41:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D33F040606;
	Fri, 12 Nov 2021 22:41:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1B6731BF3A3
 for <buildroot@lists.busybox.net>; Fri, 12 Nov 2021 22:41:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0B18481C0A
 for <buildroot@lists.busybox.net>; Fri, 12 Nov 2021 22:41:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zzMZJccgr6lF for <buildroot@lists.busybox.net>;
 Fri, 12 Nov 2021 22:41:28 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 213A181BCF
 for <buildroot@buildroot.org>; Fri, 12 Nov 2021 22:41:28 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [90.1.143.61])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 981ED19F4C8;
 Fri, 12 Nov 2021 23:41:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1636756886;
 bh=zXAHC7SQAoKbD6mrTtG0wZ+8rsGmuIKVw+jNg8N58Uk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JlOyw9nnxBCylSzMfUiEXjj8uCyiCrSWfs/SvXurvbS6uDmCZXzyfSIUC/S9Wdbnx
 cQ4mZ2ZnUnrzODWEOonBosV23TWpFcuFgdxJYPKhWd4tUr2gdVw0S4ETM2k2ZJ9xFQ
 hbe7bT1GmYjrn4qg80oB/Tp5GnqWKnn1CA94w6XPvPxRCWBqJGm/4FlBr2QcyF5jJS
 KDphpXek2F14ZO2QJW5eA4dJsO8VMz9gKergpGw51clHN3HN0RttqYh043Ek0P+Up4
 5GGNk0A94uyTlIjKUVokWKjD9kh9oeztZ4r/nj+lUhAVh+wA9jjKfPaDqoBiVJzQtV
 MIOAuiyQkAdkg==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Fri, 12 Nov 2021 23:41:22 +0100
Date: Fri, 12 Nov 2021 23:41:22 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Romain Naour <romain.naour@gmail.com>
Message-ID: <20211112224122.GM247986@scaer>
References: <20211112190650.84234-1-romain.naour@gmail.com>
 <20211112190650.84234-4-romain.naour@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211112190650.84234-4-romain.naour@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH v2 3/6] package/luajit: rework
 BR2_PACKAGE_LUAJIT_ARCH_SUPPORTS
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 2021-11-12 20:06 +0100, Romain Naour spake thusly:
> This commit reworks how BR2_PACKAGE_LUAJIT_ARCH_SUPPORTS is
> defined to follow the recommended syntax.
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> Cc: Francois Perrad <francois.perrad@gadz.org>
> Cc: Yann E. MORIN <yann.morin.1998@free.fr>
> ---
>  package/luajit/Config.in | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/package/luajit/Config.in b/package/luajit/Config.in
> index e4e1249240..f6d01ed09a 100644
> --- a/package/luajit/Config.in
> +++ b/package/luajit/Config.in
> @@ -1,10 +1,10 @@
>  config BR2_PACKAGE_LUAJIT_ARCH_SUPPORTS
>  	bool
> -	default y if BR2_i386 || \
> -		(BR2_x86_64 && BR2_HOSTARCH='x86_64') || \
> -		BR2_powerpc || BR2_arm || BR2_armeb || BR2_aarch64 || \
> -		((BR2_mips || BR2_mipsel) && !BR2_MIPS_SOFT_FLOAT && \
> -		!BR2_MIPS_CPU_MIPS32R6 && !BR2_MIPS_CPU_MIPS64R6)
> +	default y if BR2_arm || BR2_armeb || BR2_aarch64
> +	default y if BR2_i386 || (BR2_x86_64 && BR2_HOSTARCH='x86_64')
> +	default y if BR2_powerpc
> +	default y if (BR2_mips || BR2_mipsel) && !BR2_MIPS_SOFT_FLOAT \

Alphabetical order, damit! ;-)

Applied to master, thanks.

Regards,
Yann E. MORIN.

> +		&& !BR2_MIPS_CPU_MIPS32R6 && !BR2_MIPS_CPU_MIPS64R6
>  	# -m32 flag is used for 32bit builds and host-luajit has
>  	# limited architecture support
>  	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
> -- 
> 2.31.1
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
