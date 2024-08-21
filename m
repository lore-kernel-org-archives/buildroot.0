Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A2F4C52D7C
	for <buildroot@archiver.kernel.org>; Wed, 21 Aug 2024 07:29:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 50DBA40652;
	Wed, 21 Aug 2024 07:29:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q7Ccc9CCzS_K; Wed, 21 Aug 2024 07:29:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B9B9740640
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B9B9740640;
	Wed, 21 Aug 2024 07:29:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6FEEF1BF38B
 for <buildroot@lists.busybox.net>; Wed, 21 Aug 2024 07:29:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5D3C2404E9
 for <buildroot@lists.busybox.net>; Wed, 21 Aug 2024 07:29:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WLmcV112NZrc for <buildroot@lists.busybox.net>;
 Wed, 21 Aug 2024 07:29:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D4A2A40472
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D4A2A40472
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D4A2A40472
 for <buildroot@buildroot.org>; Wed, 21 Aug 2024 07:29:28 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 4488413F838;
 Wed, 21 Aug 2024 09:29:15 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 21 Aug 2024 09:29:15 +0200
Date: Wed, 21 Aug 2024 09:29:15 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: ende.tan@starfivetech.com
Message-ID: <ZsWXS9upE8YJCv8I@landeda>
References: <20240821055146.46029-1-ende.tan@starfivetech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240821055146.46029-1-ende.tan@starfivetech.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1724225361;
 bh=UumKgo+1DuqxBwb4lVSyJWMXvCdZTf5luLxBgYoFtSc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dQ84XciI3EmBHuxDT6IjGPRPSzqbm3WT/3LOefxOia+PmolXjwzNKyRKGt0Bb0qQ8
 HoFlPb9q19M4MRIQuK98IqMP2QSb8jse6fBtfp3SLiANGvj11rA8nFsPSXrlk4nzgS
 booDawdjwJy/KeasXquebSQWHaO6+ElMChyQfIsVTclcl3DooCN2heuzaUYF8CcgsC
 lNVGCr6DwqY7LPGYLEVG5n3NLz6a3tBhZx5exFfE8xXALKrishh8DJFiHpRfF/+97r
 2VJUYJ3FYgQxn7lIAUGgUFC9FFguPxb+J0nz1DXCsuT9CbkS0d665NhmRgAsBkR7D+
 UFPR6DppZbYPA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=dQ84XciI
Subject: Re: [Buildroot] [1/1] package/libkcapi: update site path
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
Cc: smueller@chronox.de, fontaine.fabrice@gmail.com,
 thomas.petazzoni@bootlin.com, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

En De, All,

Thanks for this patch.

On 2024-08-21 13:51 +0800, ende.tan@starfivetech.com spake thusly:
> From: Tan En De <ende.tan@starfivetech.com>
> 
> Update the site path to reflect the recent organizational changes on the
> chronox.de website.

The way they reorganised the releases is a bit annoying. Indeed, only
the latest release is available with the new URL format, while older
releases are all only available with another format, e.g.:

    http://www.chronox.de/libkcapi/releases/1.5.0/libkcapi-1.5.0.tar.xz
    http://www.chronox.de/libkcapi/releases/historic/libkcap-1.4.0.tqr.xz

This is annoying, because t means the URL we use is wrong as soon as a
newer release is cut and published, and thus all previous Buildroot
versions suddenly stop being able to download the libkcapi version they
knew about...

I would suggest we switch to using their GitHub repo as the source, and
using git for the download.

> Fixes:
> - http://autobuild.buildroot.org/results/77243633783ac2d037d15d7e9c01384781fe700e
> 
> Signed-off-by: Tan En De <ende.tan@starfivetech.com>

In the meantime, applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/libkcapi/libkcapi.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/libkcapi/libkcapi.mk b/package/libkcapi/libkcapi.mk
> index 11462d6e2a..7a79dd55ae 100644
> --- a/package/libkcapi/libkcapi.mk
> +++ b/package/libkcapi/libkcapi.mk
> @@ -6,7 +6,7 @@
>  
>  LIBKCAPI_VERSION = 1.5.0
>  LIBKCAPI_SOURCE = libkcapi-$(LIBKCAPI_VERSION).tar.xz
> -LIBKCAPI_SITE = http://www.chronox.de/libkcapi
> +LIBKCAPI_SITE = http://www.chronox.de/libkcapi/releases/$(LIBKCAPI_VERSION)
>  LIBKCAPI_AUTORECONF = YES
>  LIBKCAPI_INSTALL_STAGING = YES
>  LIBKCAPI_LICENSE = BSD-3-Clause (library), BSD-3-Clause or GPL-2.0 (programs)
> -- 
> 2.34.1
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
