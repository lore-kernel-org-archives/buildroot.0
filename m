Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82AE0C77B7C
	for <buildroot@archiver.kernel.org>; Wed, 24 May 2023 20:05:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 03A2542A13;
	Wed, 24 May 2023 20:05:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 03A2542A13
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1zDcaUrNVUpG; Wed, 24 May 2023 20:05:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3100842A14;
	Wed, 24 May 2023 20:05:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3100842A14
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D92BB1BF2F8
 for <buildroot@lists.busybox.net>; Wed, 24 May 2023 20:05:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B24F381E6C
 for <buildroot@lists.busybox.net>; Wed, 24 May 2023 20:05:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B24F381E6C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HvyAotSdlSXr for <buildroot@lists.busybox.net>;
 Wed, 24 May 2023 20:05:25 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A47D981E56
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A47D981E56
 for <buildroot@buildroot.org>; Wed, 24 May 2023 20:05:24 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:f59a:3e7b:43a8:ebfe])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 02F9BB005A6;
 Wed, 24 May 2023 22:05:20 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 24 May 2023 22:05:20 +0200
Date: Wed, 24 May 2023 22:05:20 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Luca Pesce <luca.pesce@vimar.com>
Message-ID: <20230524200520.GF2623@scaer>
References: <1684507558-5929-1-git-send-email-luca.pesce@vimar.com>
 <1684917117-10063-1-git-send-email-luca.pesce@vimar.com>
 <1684917117-10063-2-git-send-email-luca.pesce@vimar.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1684917117-10063-2-git-send-email-luca.pesce@vimar.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1684958723;
 bh=HRZDCXRl2hzvXCiXR7mE+WR+qK4Jy9ts6DRvrLTmjNo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ECQWk6Txp+2AGdeJov64zpkMKmwz7RC6NMTRsdgHRmkTEbXh1I1XGZ3HVkhQFJPH3
 GS74ePWr83NJHc7g572u23F1jG1sxn2AqBaPhHhZAUAZEKChwCYmcGD+IV1zjv0HNM
 iJgg79B8ZuL7JxShdxGh01forcvZaKLZrJaaoKK4eMJoeB48UyFfuNELyeU6iRECWS
 apuSXimqdgB7mindNsCR/ja0GqGVpVb2Zzc1xgefpa9Pv2vWma1FSBrlmgOd5+JTEW
 4fMpjtP4+CsM9icf8s63WpyPCzGPrxtL7bvKRHtIOz98L+dae6SV6XACIqgc3bWsI6
 KJzotaPqcKyBg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=ECQWk6Tx
Subject: Re: [Buildroot] [PATCH v2 2/2] package/mosquitto: when building
 with libwebsockets support, select its external loop support option
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

Luca, All,

On 2023-05-24 10:31 +0200, Luca Pesce spake thusly:
> When libwebsockets is enabled, mosquitto broker is built with
> websocket support, but its code requires libwebsockets being built with
> external loop option - otherwise, mosquitto gives a compile-time warning
> hinting to unusable websocket support:
> https://github.com/eclipse/mosquitto/commit/1b24f625ea4ee77f3c4796ec2233d059f8c7977e
> To fix this, select the BR2_PACKAGE_LIBWEBSOCKETS_EXT_POLL option.
> 
> Signed-off-by: Luca Pesce <luca.pesce@vimar.com>

As I applied the libwebsockets option to next, so did I for this patch.

Applied to next, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/mosquitto/Config.in | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/mosquitto/Config.in b/package/mosquitto/Config.in
> index 6fa5f79..8bedf2a 100644
> --- a/package/mosquitto/Config.in
> +++ b/package/mosquitto/Config.in
> @@ -25,6 +25,7 @@ config BR2_PACKAGE_MOSQUITTO_BROKER
>  	depends on BR2_USE_MMU # fork()
>  	depends on !BR2_STATIC_LIBS # include <dlfcn.h>
>  	depends on BR2_PACKAGE_MOSQUITTO
> +	select BR2_PACKAGE_LIBWEBSOCKETS_EXT_POLL if BR2_PACKAGE_LIBWEBSOCKETS
>  	help
>  	  Build and install the mosquitto broker onto target.
>  
> -- 
> 2.7.4
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
