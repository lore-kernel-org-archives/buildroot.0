Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1D0FC02197
	for <buildroot@archiver.kernel.org>; Sat, 14 Sep 2024 14:01:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 754ED41988;
	Sat, 14 Sep 2024 14:01:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t9BrnSC3A4Z4; Sat, 14 Sep 2024 14:01:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3F27542645
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3F27542645;
	Sat, 14 Sep 2024 14:01:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BC0C51BF3F9
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 14:00:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AB91884531
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 14:00:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PDD1vGD4Bo72 for <buildroot@lists.busybox.net>;
 Sat, 14 Sep 2024 14:00:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8454E844ED
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8454E844ED
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8454E844ED
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 14:00:31 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [IPv6:2a02:61:a2::3f4])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 4C933780372;
 Sat, 14 Sep 2024 16:00:25 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 14 Sep 2024 16:00:24 +0200
Date: Sat, 14 Sep 2024 16:00:24 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Peter Korsgaard <peter@korsgaard.com>
Message-ID: <ZuWW-JNZCG7oPTmm@landeda>
References: <20240914124337.1200461-1-peter@korsgaard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240914124337.1200461-1-peter@korsgaard.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1726322428;
 bh=wW2qefeQawQgfJY7S6Z5ThLTlu8Y7iOfLTCdAt1NX/k=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dt+5ktTZnJ57AYwIM2ERNUNXFLbZMBipfsPVv9htgGm9Nwouqm17WZIu7ID1GRvg2
 DEloAQW7X9tnCPtP2aN3qi+vfI7dSCOUcEZzx8PsrVGd4xmw9pRurr5HUhlDI3Wq60
 ofT6D6v3QB680CUFhIbFdDRtR5Z2h7L9Ke2udvRQM06anJldbHdscrcUTv6RmyhdWM
 nmLgOY13iAFTv20D89FC04PA3ZCFDdUsvqXo3OhZNk0gf41Nxc9XGvp0/R0Om6v40f
 mzq4ROtfMEHqgTMQROhEXEFXY+fRJcLeTK1449TjnI3QCL1RLeVmymJcZCeBqS45QY
 iPhxnLcUSsqlQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=dt+5ktTZ
Subject: Re: [Buildroot] [PATCH 01/20] package/linux-firmware: fix typo in
 Config.in prompt
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
Cc: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Peter, All,

Whole series sapplied to master, thanks.

I modified patch 13 with feedback from Federico.

Regards,
Yann E. MORIN.

On 2024-09-14 14:43 +0200, Peter Korsgaard spake thusly:
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  package/linux-firmware/Config.in | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/linux-firmware/Config.in b/package/linux-firmware/Config.in
> index 4a17ceaf0b..abec943c36 100644
> --- a/package/linux-firmware/Config.in
> +++ b/package/linux-firmware/Config.in
> @@ -596,7 +596,7 @@ config BR2_PACKAGE_LINUX_FIRMWARE_QLOGIC_4X
>  	  (qede)
>  
>  config BR2_PACKAGE_LINUX_FIRMWARE_RTL_815X
> -	bool "Realtek 8152/8153/8156 USB Ethernet Adapaters"
> +	bool "Realtek 8152/8153/8156 USB Ethernet Adapters"
>  	help
>  	  Firmware files for Realtek 8152/8153/8156 based USB Ethernet
>  	  adapters.
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
