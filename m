Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 174DEC27C4F
	for <buildroot@archiver.kernel.org>; Sat, 15 Jun 2024 16:48:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 96ECF40838;
	Sat, 15 Jun 2024 16:48:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PebK9mHHdv6L; Sat, 15 Jun 2024 16:48:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 47B87407F4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 47B87407F4;
	Sat, 15 Jun 2024 16:48:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1663F1BF300
 for <buildroot@lists.busybox.net>; Sat, 15 Jun 2024 16:48:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 03A18404B3
 for <buildroot@lists.busybox.net>; Sat, 15 Jun 2024 16:48:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JQoERdJSVN7W for <buildroot@lists.busybox.net>;
 Sat, 15 Jun 2024 16:48:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B14FF40103
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B14FF40103
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B14FF40103
 for <buildroot@buildroot.org>; Sat, 15 Jun 2024 16:48:00 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 82DFB13F88D;
 Sat, 15 Jun 2024 18:47:52 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 15 Jun 2024 18:47:52 +0200
Date: Sat, 15 Jun 2024 18:47:52 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <Zm3FuD3yxLBJBMq_@landeda>
References: <20240615113049.456274-1-bernd@kuhls.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240615113049.456274-1-bernd@kuhls.net>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1718470077;
 bh=YQGBgtDAhKkzr+ZOrk0Kt4W38oTtczHAcmp/DGVCx/4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=LZvVjXabqMrDrz2m4V5dadFoumaSJCZ5ssB3AwHpaN6BmIF8uJ+ZhTbkh3NuBZDmG
 KyDlWiFtwJfRTph+iLKm3c5gDgA5J+/QZFeB3i3aCyy3nVy6AVSGT7IGe4C3H+rwdQ
 NiULJch4SWS+8wCfaIC0VibqV/XPPjmeXEHLfp9ZPYhBY44Bt6pCDs7r1prt7LmtYY
 /Frl3zXFfbkoh4iBJduWzEu7wowhaya/XAabQWxGsWMVxigZ2sNiD3LjaZn2sm71gz
 PEhEyzpkFMpeKgZ+prW63pspxGdJ2TrHlKUBxbM7w/vVq39JBEf1FhfYRYOFIPDGoD
 q0ld6AvB5Vm8Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=LZvVjXab
Subject: Re: [Buildroot] [PATCH 1/4] {linux, linux-headers}: bump 6.{1,
 6}.x series
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
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Bernd, All,

On 2024-06-15 13:30 +0200, Bernd Kuhls spake thusly:
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Whole series of 4 patches applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  linux/linux.hash                     | 4 ++--
>  package/linux-headers/Config.in.host | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/linux/linux.hash b/linux/linux.hash
> index b972557fc0..9374af71b0 100644
> --- a/linux/linux.hash
> +++ b/linux/linux.hash
> @@ -1,7 +1,7 @@
>  # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
>  sha256  19b31956d229b5b9ca5671fa1c74320179682a3d8d00fc86794114b21da86039  linux-6.8.12.tar.xz
> -sha256  aaa824eaf07f61911d22b75ff090a403c3dd0bd73e23933e0bba8b5971436ce1  linux-6.6.32.tar.xz
> -sha256  9019f427bfdc9ced5bc954d760d37ac08c0cdffb45ad28087fc45a73e64336c9  linux-6.1.92.tar.xz
> +sha256  a13ebc20dc2a75722699949af74aa86a4ce5d544d6daaa6a7de4e8c81b40de97  linux-6.6.33.tar.xz
> +sha256  df31af2ef5923d61fadd68bfd991f50f2e42a913895eb4b03214ee78f8720bcf  linux-6.1.93.tar.xz
>  # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
>  sha256  f41e718e33b88f269a6b6a7653e5e9824c4ba541f6ffe5bf26ecc37c540a1b05  linux-5.15.160.tar.xz
>  sha256  9c36b243e8c3ec1d5963366618f336710b84340bf95be2037b26c452392cb2d6  linux-5.10.218.tar.xz
> diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
> index 48101783b9..487d941a16 100644
> --- a/package/linux-headers/Config.in.host
> +++ b/package/linux-headers/Config.in.host
> @@ -419,8 +419,8 @@ config BR2_DEFAULT_KERNEL_HEADERS
>  	default "5.4.277"	if BR2_KERNEL_HEADERS_5_4
>  	default "5.10.218"	if BR2_KERNEL_HEADERS_5_10
>  	default "5.15.160"	if BR2_KERNEL_HEADERS_5_15
> -	default "6.1.92"	if BR2_KERNEL_HEADERS_6_1
> -	default "6.6.32"	if BR2_KERNEL_HEADERS_6_6
> +	default "6.1.93"	if BR2_KERNEL_HEADERS_6_1
> +	default "6.6.33"	if BR2_KERNEL_HEADERS_6_6
>  	default "6.8.12"	if BR2_KERNEL_HEADERS_6_8
>  	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
>  	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
> -- 
> 2.39.2
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
