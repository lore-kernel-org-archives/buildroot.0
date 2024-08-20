Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CD60C531DC
	for <buildroot@archiver.kernel.org>; Tue, 20 Aug 2024 19:58:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4D46E40B1A;
	Tue, 20 Aug 2024 19:58:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YCtO1kH8DkED; Tue, 20 Aug 2024 19:58:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BF48040B09
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BF48040B09;
	Tue, 20 Aug 2024 19:58:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0F1EB1BF97A
 for <buildroot@lists.busybox.net>; Tue, 20 Aug 2024 19:58:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F12AE605A0
 for <buildroot@lists.busybox.net>; Tue, 20 Aug 2024 19:58:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v4NeORns1JSv for <buildroot@lists.busybox.net>;
 Tue, 20 Aug 2024 19:58:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B57BD60591
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B57BD60591
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B57BD60591
 for <buildroot@buildroot.org>; Tue, 20 Aug 2024 19:58:18 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 4091E13F899;
 Tue, 20 Aug 2024 21:58:11 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 20 Aug 2024 21:58:11 +0200
Date: Tue, 20 Aug 2024 21:58:11 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Message-ID: <ZsT1U7uCuV50ciCd@landeda>
References: <20240820191927.2126281-1-dario.binacchi@amarulasolutions.com>
 <20240820191927.2126281-2-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240820191927.2126281-2-dario.binacchi@amarulasolutions.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1724183895;
 bh=kW7LVe+2TiUmIfIxksUCEgu3bLCtlcvwuy7hIA4QN6U=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=afUp+iMHh35oEmv2fF21iXryOkAJLxesfjOd7cqe8q3Y2MW/8IxEKjrXtTMOuzIHf
 ernW4xJCT8wIfiQ+3Vaxf24hmsjJ9Z3Azkz71OtBkO8QZTWXvQ8RvyE1B8Y9dD088M
 zyK7QguQeLblpKiqaDeJAAY35dsSEslVYHunGHV18CBmBRTP+vJMs4tHqPCOkRqoqW
 DRcSZTa7Uv1TqEPkv72hOLNqW/zps/zn08iUg8f4kCL7VXO2aM4KyBTx0Qn+80H6aK
 faNZBO+Tkkk8lCTmSTLz2/HfrGORs5A41238w3kOKrSudyThJIRDbOkqpPTTPk06aV
 xiCME/JCv5tLw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=afUp+iMH
Subject: Re: [Buildroot] [PATCH v2 1/3] package/tinyinit: new package
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
Cc: Damien Le Moal <dlemoal@kernel.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Dario, all,

On 2024-08-20 21:19 +0200, Dario Binacchi spake thusly:
> This package contains a Linux init script suitable for resource-limited
> systems which can be used as an alternative to the one provided by
> Busybox.
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> ---
> Changes v1 -> v2:
>  - Rename tinit to tinyinit.
>  - Put the script inside the tinyinit package without the need to use
>    a github repo.

Did you actually forgot to git-add that file?

[--SNIP--]
> diff --git a/system/Config.in b/system/Config.in
> index 318c538ef1d0..9e15a785f3f0 100644
> --- a/system/Config.in
> +++ b/system/Config.in
> @@ -145,6 +145,11 @@ comment "systemd highly recommends Linux >= 4.15"
>  	depends on BR2_INIT_SYSTEMD
>  	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_15
>  
> +config BR2_INIT_TINYINIT
> +	bool "tiny init"
> +	select BR2_PACKAGE_TINYINIT
> +	select BR2_PACKAGE_SKELETON_INIT_NONE if BR2_ROOTFS_SKELETON_DEFAULT

I'm not sure it warrants an entry in that init selection. I think
corner-cases like tiny-init should be treated as "no init system" and
the "None" entry below be used instead (in fact, I would even argue it
should be labelled "Custom" rather than "None", because that's what it
refers to: using a custom init system).

We already have tini as a tiny initsystem (mostly aimed at
container-based worloads), which is not in the list, and I believe
tiniy-init should also be consdered similarly...

Furthermore, we need to have an entry in that list of init system when
we need to have infrastructure for it: install init scripts for
sysv-like, systemd units for systemd, openrc "units" for openrc. For
tiny-init (as for tini), there is absolutely no need for any infra at
all, so they are already properly served by selecting the "None" entry
(and selecting the proper package).

Regards,
Yann E. MORIN.

>  config BR2_INIT_NONE
>  	bool "None"
>  	select BR2_PACKAGE_SKELETON_INIT_NONE if BR2_ROOTFS_SKELETON_DEFAULT
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
