Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 310EAC27C53
	for <buildroot@archiver.kernel.org>; Sun,  9 Jun 2024 19:40:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C3E8783B3F;
	Sun,  9 Jun 2024 19:40:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WHmzs1ikgRqH; Sun,  9 Jun 2024 19:40:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 75D5583AEF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 75D5583AEF;
	Sun,  9 Jun 2024 19:40:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E3C6B1BF3E0
 for <buildroot@lists.busybox.net>; Sun,  9 Jun 2024 19:40:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DD5EC40332
 for <buildroot@lists.busybox.net>; Sun,  9 Jun 2024 19:40:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A-e6P1ige5AY for <buildroot@lists.busybox.net>;
 Sun,  9 Jun 2024 19:40:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A6A0240106
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A6A0240106
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A6A0240106
 for <buildroot@buildroot.org>; Sun,  9 Jun 2024 19:40:47 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id E8D4313F879;
 Sun,  9 Jun 2024 21:40:41 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 09 Jun 2024 21:40:41 +0200
Date: Sun, 9 Jun 2024 21:40:41 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Kilian Zinnecker <kilian.zinnecker@mail.de>
Message-ID: <ZmYFObMKxti_u5Mm@landeda>
References: <20240609140941.32819-1-kilian.zinnecker@mail.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240609140941.32819-1-kilian.zinnecker@mail.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1717962044;
 bh=7tedbeEy39SLQm2cazzoEg2gNKwI5EL/XxfMihLIoGc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=d2WQY0HLZG0Mmo6YZTibkluHPq6nMcTxtE5tWUMNYs9MN83a6bxecWgyMdDVGFzfF
 MDQ/okcRQT6vby43TLYwUGvALcsd9HZW3l5MOMR0/u1BGGrXCWRT8oJvlW9mgUueqS
 jJvljFRaFnJj5si6e8lL6hAHMSiMSvsiaSRhOTG5LUiN02izCSSvRHVUMBjRycEXOt
 hStg/9Zd+qDf4EPOBQ8KnKEmnXj4bn7z69A3oxBzxd2BB+1fGyHLz9jKovkoj2ez5U
 AOTR8xPZfh6Nv4yh2OyDCU0uJRtnKfJLRk/Et+ZXAaf1PjNTOhOqF0uGGxVAZp1o0O
 0em+SVptHW8uA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=d2WQY0HL
Subject: Re: [Buildroot] [PATCH] DEVERLOPERS: Fix alphabetical order
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

Killian, All,

On 2024-06-09 16:09 +0200, Kilian Zinnecker via buildroot spake thusly:
> [Buildroot] [PATCH] DEVERLOPERS: Fix alphabetical order
--------------------------^ ;-)

> Signed-off-by: Kilian Zinnecker <kilian.zinnecker@mail.de>

Applied to master, with the typo fixed, thanks.

Regards,
Yann E. MORIN.

> ---
>  DEVELOPERS | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 03aa7bfa74..805b8215ec 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -1950,8 +1950,8 @@ F:	package/libcamera/
>  N:	Kilian Zinnecker <kilian.zinnecker@mail.de>
>  F:	board/avnet/rzboard_v2l/
>  F:	board/radxa/rock5b/
> -F:	configs/rock5b_defconfig
>  F:	configs/avnet_rzboard_v2l_defconfig
> +F:	configs/rock5b_defconfig
>  F:	package/rockchip-rkbin/
>  
>  N:	Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>
> -- 
> 2.34.1
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
