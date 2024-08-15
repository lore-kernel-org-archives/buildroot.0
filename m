Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1D2DC3DA7F
	for <buildroot@archiver.kernel.org>; Thu, 15 Aug 2024 17:28:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 96C65409F1;
	Thu, 15 Aug 2024 17:28:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GaD3G1tHAI72; Thu, 15 Aug 2024 17:28:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 43D5E409F2
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 43D5E409F2;
	Thu, 15 Aug 2024 17:28:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BE6F41BF475
 for <buildroot@lists.busybox.net>; Thu, 15 Aug 2024 17:28:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AC0BB409F2
 for <buildroot@lists.busybox.net>; Thu, 15 Aug 2024 17:28:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e65JCLSF41ea for <buildroot@lists.busybox.net>;
 Thu, 15 Aug 2024 17:28:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 828E4409F1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 828E4409F1
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 828E4409F1
 for <buildroot@buildroot.org>; Thu, 15 Aug 2024 17:28:07 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id E540C13F81D;
 Thu, 15 Aug 2024 19:28:00 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Thu, 15 Aug 2024 19:28:00 +0200
Date: Thu, 15 Aug 2024 19:28:00 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: George Kiagiadakis <george.kiagiadakis@collabora.com>
Message-ID: <Zr46oBQNQctbUKjM@landeda>
References: <20240815150344.241837-1-george.kiagiadakis@collabora.com>
 <20240815150344.241837-3-george.kiagiadakis@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240815150344.241837-3-george.kiagiadakis@collabora.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1723742884;
 bh=62EbKm8bm7v0dtkrJYEjw73kfPAfLSNOwxdD0s41IzE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ZFlSiuL21mNRi1ps/U5KgyIPp/mtnerPoFluHscMLwnRU6qD9SKinAobCTlqugIro
 ZDytUT16/OMbOhWr2lFAq8xnSBbd1xDvnsZNyJoOjSKjvNpk0XhoDLVx/Nutzd98pg
 XWTuDcBnfaSk0TriF5U45yo56+IYVWNpnQVGP8Ghbl9betonvyYo/u9iDxOpcDXPER
 u2eFEbDkCqpC7CbQ0NC5P/42sZmb3w0vIJG5arOE/VskoBp4pN5OXvsCUU6PjdxK23
 B9XAYu+t9p2sVF0NdKEfTNmGikOnIiPrIU2XsNPpQobRyhxt3bysU1q4HYOs4bVRcx
 TYW1jch1rL2kQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=ZFlSiuL2
Subject: Re: [Buildroot] [PATCH 3/4] package: add wireplumber in the config
 system
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
Cc: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

George, All,

Thank you for your contributoin!

On 2024-08-15 18:03 +0300, George Kiagiadakis spake thusly:
> Signed-off-by: George Kiagiadakis <george.kiagiadakis@collabora.com>
> ---
>  package/Config.in | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/Config.in b/package/Config.in
> index f2c63ffb6e..33cb50522f 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -61,6 +61,7 @@ menu "Audio and video applications"
>  	source "package/vlc/Config.in"
>  	source "package/vorbis-tools/Config.in"
>  	source "package/wavpack/Config.in"
> +	source "package/wireplumber/Config.in"

AFAICS, wireplumber is already sourced, on line 1766, in the
Libraries->Graphics sub-menu.

You can search for Kconfig symbol by hitting '/' in the menuconfig, and
then enter a query (regexp), which opens a list of results, and for each
there is a numbe ryou can hit to directly jump there (or at least see
the dependencies tha tare not met).

If you believe that's not a good location, then please send another
patch moving it around, with a commit log that explains why you believe
it should be moved around.

Regards,
Yann E. MORIN.

>  	source "package/yavta/Config.in"
>  	source "package/ympd/Config.in"
>  	source "package/zynaddsubfx/Config.in"
> -- 
> 2.30.2
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
