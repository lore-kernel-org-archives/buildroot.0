Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62BE9C25B75
	for <buildroot@archiver.kernel.org>; Sat, 11 May 2024 20:45:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2A90F400E5;
	Sat, 11 May 2024 20:45:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gMHGkBhUa1mB; Sat, 11 May 2024 20:45:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 18351403F9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 18351403F9;
	Sat, 11 May 2024 20:45:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B76051BF57C
 for <buildroot@lists.busybox.net>; Sat, 11 May 2024 20:45:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9E786403F9
 for <buildroot@lists.busybox.net>; Sat, 11 May 2024 20:45:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vNpdkMzkfOta for <buildroot@lists.busybox.net>;
 Sat, 11 May 2024 20:45:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 51482400E5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 51482400E5
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 51482400E5
 for <buildroot@buildroot.org>; Sat, 11 May 2024 20:45:38 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id D241713F86A;
 Sat, 11 May 2024 22:45:32 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 11 May 2024 22:45:32 +0200
Date: Sat, 11 May 2024 22:45:32 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <Zj_Y7J1PakY72dJg@landeda>
References: <20240511125829.158446-1-bernd@kuhls.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240511125829.158446-1-bernd@kuhls.net>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1715460336;
 bh=bwOZb6nmq0KR0RX4oIz8glXgA1XdGDrrhZb5cF2Vk80=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PnLGe1vue8/zj9XVZKvc5XsEjyEId+TjpJHpsiLeCsdV5tFxYOYbb274dgSdr/+Kp
 0TaR8Gldh7qhszYe3rsunHxdKnguZtfcp/SNfKZQK78suP9kM9KIgb3luAvimONiSN
 o9UvG46bfno2W6wLbE4WxKfpfaCCnRPK5ZT4ZhwWEnUcKemfiKilqQfYwddUCoAFFh
 SvspNckdw9yP2oc6uSaWjTdU+mpT4T1uNDI+xC3qrKE22RIfPgUbAqylujhhEXU6xV
 BJWHrWeH/eUA5py6uUnxZi2Up1P/5cY7Eq+H+UA02znqmYsv5WgFVRWqfbNFLG5Hws
 R0jXd4UPCTo9g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=PnLGe1vu
Subject: Re: [Buildroot] [PATCH 1/1] package/kodi: fix libudfread dependency
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

Bernd, All,

On 2024-05-11 14:58 +0200, Bernd Kuhls spake thusly:
> Buildroot c61934611111cb3ea04604707052b1387bde5134 commit added a broken
> dependency to libudfread. In fact libudfread is still an optional
> dependency, just the configure options changes due to upstream
> commit https://github.com/xbmc/xbmc/commit/5f9b9cfa26f274e381e92d73cfa33fb55582436e
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.

It looks like it is a correct patch, and the c onfigure step succeeds
in detecting whther udefread is needed and present, or not needed.

However, I was not able to test-build, because of the libatomic issue I
already mentioned earlier.

Regards,
Yann E. MORIN.

> ---
>  package/kodi/Config.in | 1 -
>  package/kodi/kodi.mk   | 8 +++++++-
>  2 files changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/package/kodi/Config.in b/package/kodi/Config.in
> index 10f46802a8..6c48168bf8 100644
> --- a/package/kodi/Config.in
> +++ b/package/kodi/Config.in
> @@ -166,7 +166,6 @@ config BR2_PACKAGE_KODI_EVENTCLIENTS
>  config BR2_PACKAGE_KODI_LIBBLURAY
>  	bool "blu-ray"
>  	select BR2_PACKAGE_LIBBLURAY
> -	select BR2_PACKAGE_LIBUDFREAD
>  	help
>  	  Enable Blu-ray input support.
>  	  Select this if you want to play back Blu-ray content.
> diff --git a/package/kodi/kodi.mk b/package/kodi/kodi.mk
> index 09342ea1f0..62463b731e 100644
> --- a/package/kodi/kodi.mk
> +++ b/package/kodi/kodi.mk
> @@ -45,7 +45,6 @@ KODI_DEPENDENCIES = \
>  	libfribidi \
>  	libplist \
>  	libpng \
> -	libudfread \
>  	lzo \
>  	openssl \
>  	pcre \
> @@ -388,6 +387,13 @@ else
>  KODI_CONF_OPTS += -DENABLE_PULSEAUDIO=OFF
>  endif
>  
> +ifeq ($(BR2_PACKAGE_LIBUDFREAD),y)
> +KODI_CONF_OPTS += -DENABLE_UDFREAD=ON
> +KODI_DEPENDENCIES += libudfread
> +else
> +KODI_CONF_OPTS += -DENABLE_UDFREAD=OFF
> +endif
> +
>  # Remove versioncheck addon, updating Kodi is done by building a new
>  # buildroot image.
>  KODI_ADDON_MANIFEST = $(TARGET_DIR)/usr/share/kodi/system/addon-manifest.xml
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
