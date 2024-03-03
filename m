Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA03AC54E41
	for <buildroot@archiver.kernel.org>; Sun,  3 Mar 2024 09:31:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 99384410DF;
	Sun,  3 Mar 2024 09:31:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id j2TksOc8VK7C; Sun,  3 Mar 2024 09:31:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6F64A410BB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6F64A410BB;
	Sun,  3 Mar 2024 09:31:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6BB041BF57B
 for <buildroot@lists.busybox.net>; Sun,  3 Mar 2024 09:31:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 58BE060AC5
 for <buildroot@lists.busybox.net>; Sun,  3 Mar 2024 09:31:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oJaHKZUnbJ2y for <buildroot@lists.busybox.net>;
 Sun,  3 Mar 2024 09:31:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4832660AC4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4832660AC4
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4832660AC4
 for <buildroot@buildroot.org>; Sun,  3 Mar 2024 09:31:22 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 0D63F13F880;
 Sun,  3 Mar 2024 10:31:15 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 03 Mar 2024 10:31:14 +0100
Date: Sun, 3 Mar 2024 10:31:14 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <ZeRDYucecDd7bgzn@landeda>
References: <20240303084014.156991-1-thomas.petazzoni@bootlin.com>
 <20240303084014.156991-2-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240303084014.156991-2-thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1709458279;
 bh=IGqeJ2SySbqrPGdh3/D3n8QeD3PRZvoAkHwiVH2Rnyg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Tqs1s4TTFzst2VmHobtAb3kg6soBNDC0A6K2/noiuAa1N+yuiyGQRjULGoaG1EvqL
 UtkA+9Uwhmh+oBo6xIKvv5XdKu/dHyM6QTzNgLEh1MAmSir8nrkLuRsxyYztI5Dwpd
 EhrZEiohIFwywHOjw0iOUIF4JzaI08dwijh6NY63XYw8AqIi6hK3jt0kuO3ipmitZG
 lw3a5LtMx5Is3tMvjcP8YgffTOfsJSX2UssIIT36WUB1NdaJkR3GufGpoPE7slb1ha
 WrWXiqk2Iq6tBrkug6uEnq+qV3Xhazgi50r8ROp0/G6VzG1ILgqWIACX/BO+z8AwRv
 VGS4pPkg1/Mzg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Tqs1s4TT
Subject: Re: [Buildroot] [PATCH next 1/4] package/binutils: add support for
 2.42
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
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Thomas, All,

On 2024-03-03 09:40 +0100, Thomas Petazzoni via buildroot spake thusly:
[--SNIP--]
> diff --git a/package/binutils/Config.in.host b/package/binutils/Config.in.host
> index 2f1ddf4bdc..f1cc175cf9 100644
> --- a/package/binutils/Config.in.host
> +++ b/package/binutils/Config.in.host
> @@ -25,6 +25,9 @@ config BR2_BINUTILS_VERSION_2_40_X
>  config BR2_BINUTILS_VERSION_2_41_X
>  	bool "binutils 2.41"
>  
> +config BR2_BINUTILS_VERSION_2_42_X
> +	bool "binutils 2.42"
> +
>  config BR2_BINUTILS_VERSION_ARC
>  	bool "binutils arc (2.41)"
>  	depends on BR2_arc

I know that the arc variant is just a whart in the list, but it feels
odd, when arc is enabled, to have list not sorted by actual versions:

    2.40
    2.41
    2.42
    arc (2.41)

I think we'd like to have the list neatly ordered by version...

This is a very minor comment, of course...

Regards,
Yann E. MORIN.

> @@ -37,6 +40,7 @@ config BR2_BINUTILS_VERSION
>  	default "2.39"		if BR2_BINUTILS_VERSION_2_39_X
>  	default "2.40"		if BR2_BINUTILS_VERSION_2_40_X
>  	default "2.41"		if BR2_BINUTILS_VERSION_2_41_X
> +	default "2.42"		if BR2_BINUTILS_VERSION_2_42_X
>  
>  config BR2_BINUTILS_GPROFNG
>  	bool "gprofng support"
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
