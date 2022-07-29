Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 623D5C00144
	for <buildroot@archiver.kernel.org>; Fri, 29 Jul 2022 21:41:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C3C71415FF;
	Fri, 29 Jul 2022 21:41:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C3C71415FF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id o0hYTsj7Bxms; Fri, 29 Jul 2022 21:41:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9A2674174C;
	Fri, 29 Jul 2022 21:41:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9A2674174C
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A6C551BF31D
 for <buildroot@lists.busybox.net>; Fri, 29 Jul 2022 21:41:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7E90F4055F
 for <buildroot@lists.busybox.net>; Fri, 29 Jul 2022 21:41:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7E90F4055F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HJbX_yIfpNW2 for <buildroot@lists.busybox.net>;
 Fri, 29 Jul 2022 21:41:35 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9C9904038B
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9C9904038B
 for <buildroot@buildroot.org>; Fri, 29 Jul 2022 21:41:35 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:d054:eb09:eac4:da7e])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id A9B2013F8B3;
 Fri, 29 Jul 2022 23:41:26 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Fri, 29 Jul 2022 23:41:26 +0200
Date: Fri, 29 Jul 2022 23:41:26 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Joel Stanley <joel@jms.id.au>
Message-ID: <20220729214126.GI1554632@scaer>
References: <20220729000904.1295295-1-joel@jms.id.au>
 <20220729000904.1295295-5-joel@jms.id.au>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220729000904.1295295-5-joel@jms.id.au>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1659130894;
 bh=Npssh4hpkNkA5q3ublwb5mqrstJ+brhE5Kb/r/DcBcg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=nRaHMUHXXPz+iX8+HdxivXAtpYzPKqjeRmgU0E1THTLZVGjesmmmG/vVdCwYpFZ0T
 mxdcUBXSDFAmPngMmyC1fPK6TD/nARDhHtqQRKnROnNN/3t8D45fJBqEE5Ei965zSX
 yK7olR9JmS2xwZF6T8/lkIJ1QmYlY9X3dgAHxEN+seCQecC8/RIiotdGa8Fs05h42n
 SKp90wXNFEahZXZqeNZb6RW7kmaQDX2w7bWs1/5Bw5N0p4j1Fsj1H59h1V8zvzIreo
 7ld4z7ZHfVDGK0ppyxi4QrDHeOdXqqRJCa38fLJYY1hBJsFVmXA9NrIiE+KKIDEZ5W
 ww3E7Fm0XVNgg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=nRaHMUHX
Subject: Re: [Buildroot] [PATCH 4/9] package/glibc: Use powerpc64le instead
 of power8
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Michael Ellerman <mpe@ellerman.id.au>,
 =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org,
 Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Joel, All,

On 2022-07-29 09:38 +0930, Joel Stanley spake thusly:
> With "arch/powerpc: Enable powerpc64le only on CPUs that support it"
> we can use this symbol to indicate the CPU is supported by glibc.
> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
>  package/glibc/Config.in | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/glibc/Config.in b/package/glibc/Config.in
> index 23cbfcd9aa4f..e0ce46968278 100644
> --- a/package/glibc/Config.in
> +++ b/package/glibc/Config.in
> @@ -12,7 +12,7 @@ config BR2_PACKAGE_GLIBC_ARCH_SUPPORTS
>  	default y if BR2_or1k
>  	default y if BR2_powerpc
>  	default y if BR2_powerpc64
> -	default y if BR2_powerpc_power8
> +	default y if BR2_powerpc64le

This is indeed good, because it aligns it to the dependency to kernel
headers version, line 35. You could probably add that info to the commit
log when you respin the series.

Acked-by: Yann E. MORIN <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

>  	default y if BR2_riscv
>  	default y if BR2_s390x
>  	default y if BR2_sh
> -- 
> 2.35.1
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
