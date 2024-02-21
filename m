Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BF5DC48BEB
	for <buildroot@archiver.kernel.org>; Wed, 21 Feb 2024 18:01:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C9E8360666;
	Wed, 21 Feb 2024 18:01:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Xgyw_eLkYPj7; Wed, 21 Feb 2024 18:01:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E8A75606F3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E8A75606F3;
	Wed, 21 Feb 2024 18:01:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 471E31BF2FD
 for <buildroot@lists.busybox.net>; Wed, 21 Feb 2024 18:01:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4175A40420
 for <buildroot@lists.busybox.net>; Wed, 21 Feb 2024 18:01:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FV5jKgqgGT8p for <buildroot@lists.busybox.net>;
 Wed, 21 Feb 2024 18:01:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org ED7FF40120
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ED7FF40120
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp2.osuosl.org (Postfix) with ESMTPS id ED7FF40120
 for <buildroot@buildroot.org>; Wed, 21 Feb 2024 18:01:37 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 96F8313F899;
 Wed, 21 Feb 2024 19:01:33 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 21 Feb 2024 19:01:33 +0100
Date: Wed, 21 Feb 2024 19:01:33 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Romain Naour <romain.naour@smile.fr>
Message-ID: <ZdY6fUVgmLIJtwHj@landeda>
References: <20240220225025.781466-1-romain.naour@smile.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240220225025.781466-1-romain.naour@smile.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1708538495;
 bh=x9zhDSF77mCa8wyzzIuYaYJBQZV8vF2kT5jQYUKa58Y=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Vh9RIR8ojx3mrQ/5wFA3E5v5hn+tX6qow9vEwSF4+RNe9f6qQJDwXw0j53LLAxb94
 IU7MHJNLbWX/xleqJFPSondA99TIQ6uTlEoYN6RLsQsBXCtx7wMPZztBKx09q7RyPk
 pwU5G2+USorRp/r4Gkfey8/bU7xpAtR/FjPF/8+kmHsI3NhErsTkWYjIGZfcewOrSI
 wsRY/yM4c2Tp0+cC5XJGf/4R7wCHytTfOH97Ckg2q6UtnQ/p2cWQtSzC5BqHp0OfAh
 2SSSt/VpC51rD2Wh5C80JwKl7erTMzhGUOo1aSyY9wa+RHIO93Hk3+WbJKFS6riwMK
 6TSvf/FOd38zw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Vh9RIR8o
Subject: Re: [Buildroot] [PATCH] DEVELOPERS: add Romain Naour for
 am574x_idk_defconfig
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

Romain, All,

On 2024-02-20 23:50 +0100, Romain Naour spake thusly:
> The DEVELOPERS entry was missing.
> 
> Fixes: 35eb74c634 ("configs/am574x_idk_defconfig: new defconfig")

Tsss... ;-)

> Signed-off-by: Romain Naour <romain.naour@smile.fr>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  DEVELOPERS | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 0d12c3abcb..ff44741f9f 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -2667,7 +2667,9 @@ F:	package/vnstat/
>  
>  N:	Romain Naour <romain.naour@gmail.com>
>  F:	board/qemu/
> +F:	board/ti/am574x-idk/
>  F:	configs/qemu_*
> +F:	configs/am574x_idk_defconfig
>  F:	package/alure/
>  F:	package/aubio/
>  F:	package/binutils/
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
