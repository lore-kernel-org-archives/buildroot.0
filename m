Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8833CF9C64
	for <buildroot@archiver.kernel.org>; Sat, 21 Sep 2024 18:50:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7E9DA4275D;
	Sat, 21 Sep 2024 18:50:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CfapUgZMgB1W; Sat, 21 Sep 2024 18:50:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 350CF41BF5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 350CF41BF5;
	Sat, 21 Sep 2024 18:50:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CD5311BF59E
 for <buildroot@lists.busybox.net>; Sat, 21 Sep 2024 18:49:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BC67660675
 for <buildroot@lists.busybox.net>; Sat, 21 Sep 2024 18:49:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iE_wLfCiOjhg for <buildroot@lists.busybox.net>;
 Sat, 21 Sep 2024 18:49:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org BF33560650
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BF33560650
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BF33560650
 for <buildroot@buildroot.org>; Sat, 21 Sep 2024 18:49:55 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:5d8d:eab4:d280:c2c4])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 2559A5FF95;
 Sat, 21 Sep 2024 20:49:52 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 21 Sep 2024 20:49:51 +0200
Date: Sat, 21 Sep 2024 20:49:51 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Peter Korsgaard <peter@korsgaard.com>
Message-ID: <Zu8VT1HM2cfqgnS_@landeda>
References: <20240920212848.4099245-1-peter@korsgaard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240920212848.4099245-1-peter@korsgaard.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1726944594;
 bh=t/MFh7X3axZqIUWf3u9b0KZrZeics9PbCO9plKj3QA4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=R6pVQZRjMQChZ8/beQga0NqztqUQiuy/TnIMGZziCDELlqCksWN4jsfSQT+Wptciv
 xvpLWD0tUIkfBl4vjqFRnW8bYJ1QouxjsrrPVBfoZf7NgQ3Q3UP+c9BkxUE7WwmouP
 O37NHxj5OWaWTaCYpGUNWXY2lB2PIyVo5Oo9lU5KylJU2L9w+tlniGs1W3TaZEuTCg
 KpAWbq3tGdbPZpgPxz3mmpbGuYju7z1TaMXaarGSIJAT74siJFu+bhLWrSwu/VCdJp
 kClmSyFtwiSzn4ZEk9LPfazl+2MtZYAZlfvTxwRZokxBqGGwaX8PHkJeF2kb1CoSNP
 gEtSWsD7UjvlQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=R6pVQZRj
Subject: Re: [Buildroot] [PATCH 1/8] linux/linux.mk: fix 'parser' typo
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

Peter, All,

On 2024-09-20 23:28 +0200, Peter Korsgaard spake thusly:
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Whole series applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  linux/linux.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/linux/linux.mk b/linux/linux.mk
> index 92035d0da9..0a213d17b5 100644
> --- a/linux/linux.mk
> +++ b/linux/linux.mk
> @@ -86,7 +86,7 @@ LINUX_DEPENDENCIES += \
>  	$(if $(BR2_PACKAGE_FIRMWARE_IMX),firmware-imx) \
>  	$(if $(BR2_PACKAGE_WIRELESS_REGDB),wireless-regdb)
>  
> -# Starting with 4.16, the generated kconfig paser code is no longer
> +# Starting with 4.16, the generated kconfig parser code is no longer
>  # shipped with the kernel sources, so we need flex and bison, but
>  # only if the host does not have them.
>  LINUX_KCONFIG_DEPENDENCIES = \
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
