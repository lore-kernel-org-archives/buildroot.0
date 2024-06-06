Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14F8DC25B75
	for <buildroot@archiver.kernel.org>; Thu,  6 Jun 2024 08:39:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D878760816;
	Thu,  6 Jun 2024 08:39:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iH0fChnAJboY; Thu,  6 Jun 2024 08:39:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D1AB860875
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D1AB860875;
	Thu,  6 Jun 2024 08:39:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3BAB01BF599
 for <buildroot@lists.busybox.net>; Thu,  6 Jun 2024 08:39:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 35B2140496
 for <buildroot@lists.busybox.net>; Thu,  6 Jun 2024 08:39:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Kat5R97fqDkm for <buildroot@lists.busybox.net>;
 Thu,  6 Jun 2024 08:39:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B29844031A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B29844031A
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B29844031A
 for <buildroot@buildroot.org>; Thu,  6 Jun 2024 08:39:52 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id B799E13F879;
 Thu,  6 Jun 2024 10:39:46 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Thu, 06 Jun 2024 10:39:46 +0200
Date: Thu, 6 Jun 2024 10:39:46 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Message-ID: <ZmF10q-L1j4CR3md@landeda>
References: <20240605070604.2388248-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240605070604.2388248-1-dario.binacchi@amarulasolutions.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1717663190;
 bh=ahS7fp0Y2yaTlXvt7feW2m6XNJDevfRTtvi0IC/Qg/s=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JCSyjG34ArWMklYssLA9QSKVJWH+eCCPM/JSudt5q5kbhPHcm3cclu+02NA2NMAB/
 CwbdwuCaKk3iMwVBjKil6WpYu3dLnpluf96fmUUdqEAAepGnkYIAI01dbUlvHINXuF
 6qBfxLfqWGgiACdBBuevAm4Zi0lQJI3XyyZXeJ4yI1cHhhj0By9qIvxEWoyVdiMc2g
 C/a1zJQhvw7Naebq195LEF3NwjmwW7RDMacD54owt4/rJOdRoEYcnvQZ861fZsJQoJ
 pW66W56qn2sUovWYu9jTTA6qlKjfondtWFn2IuDAYdFpe4veShJqkM4iY76gkgK/xy
 pDJYBFio5VRnQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=JCSyjG34
Subject: Re: [Buildroot] [PATCH 1/1] package/sudo: don't use stack
 protection if BR2_SSP_NONE=y
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
Cc: michael@amarulasolutions.com, linux-amarula@amarulasolutions.com,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Dario, All,

On 2024-06-05 09:06 +0200, Dario Binacchi spake thusly:
> The sudo package enables the use of compiler's stack protection by
> default, but allows this feature to be disabled using the "--disable-ssp"
> configuration option.
> 
> The patch disables the compilation of sudo with the compiler's stack
> protector if the Buildroot option BR2_SSP_NONE is selected, thus
> ensuring that the package is built consistently with the Buildroot
> configuration. All this also affects the size of the binaries created by
> the compilation.

As Arnout commented on your similar openssh patch [0], we expect the
level of stack-protection we enable is the minimum that should be used,
so packages are free to chose a higher level if the toolchain supports
it [1].

So, unless this is an actual build (or runtime) failure, we should just
leave it as is.

[0] https://lore.kernel.org/buildroot/20240605090440.2400647-1-dario.binacchi@amarulasolutions.com/T/
[1] Maybe we should make that clearer in the Kconfig prompt?

Regards,
Yann E. MORIN.

> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> ---
>  package/sudo/sudo.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/sudo/sudo.mk b/package/sudo/sudo.mk
> index 7961a9900248..df86591ac554 100644
> --- a/package/sudo/sudo.mk
> +++ b/package/sudo/sudo.mk
> @@ -18,6 +18,7 @@ SUDO_INSTALL_TARGET_OPTS = INSTALL_OWNER="" DESTDIR="$(TARGET_DIR)" install
>  SUDO_CONF_OPTS = \
>  	--with-tzdir=$(if $(BR2_PACKAGE_TZDATA),/usr/share/zoneinfo,no) \
>  	--enable-tmpfiles.d=$(if $(BR2_PACKAGE_SYSTEMD),/usr/lib/tmpfiles.d,no) \
> +	$(if $(BR2_SSP_NONE),--disable-ssp,) \
>  	--without-lecture \
>  	--without-sendmail \
>  	--without-umask \
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
