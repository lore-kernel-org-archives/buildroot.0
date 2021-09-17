Return-Path: <SRS0=uTOM=OH=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DF5CC433F5
	for <buildroot@archiver.kernel.org>; Fri, 17 Sep 2021 21:28:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8C23361212
	for <buildroot@archiver.kernel.org>; Fri, 17 Sep 2021 21:28:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8C23361212
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 40456605EF;
	Fri, 17 Sep 2021 21:28:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BWH6UZ8XXyaG; Fri, 17 Sep 2021 21:28:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8E9DA606F3;
	Fri, 17 Sep 2021 21:28:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2BDC81BF868
 for <buildroot@lists.busybox.net>; Fri, 17 Sep 2021 21:28:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1AC0E403B9
 for <buildroot@lists.busybox.net>; Fri, 17 Sep 2021 21:28:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ljVqndxhDEam for <buildroot@lists.busybox.net>;
 Fri, 17 Sep 2021 21:28:53 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 28A344035D
 for <buildroot@buildroot.org>; Fri, 17 Sep 2021 21:28:53 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:4db3:5a06:f3b2:1f85])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 15ED75FF7A;
 Fri, 17 Sep 2021 23:28:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1631914131;
 bh=Hmol6jYlR6/J9Cwh22zuhfNHz5G9JvQhRZkXnrxVmGc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ODLPLahWHN6fcI+OGyVFXK8KvgJlHuPipMgOc/AvSpQ4o2UQzsS5eugCLk6CGWUAP
 ZmmbHsLNBEj1ygkAhKkGxY7rZd6BGByms1Dm2hYhwdEERnilFHOq1+7oGQreX1lG98
 rFiV3Xy2lTFAkNkZ6wCif0Vl9I9GPfaltvxnihRRTzQZNKWXytH+CqYB3ODPkK392H
 N60fld7Qa1DJ4hEHY6X9vmoXQ51AIL+9DAETGLYsGo0WS1j5/92PlxH2biM+cjb4Wt
 3slz4gtWRFP/GQFxpJDHEULRAQXA3Kp/jreDjH+KPqurHrG5P4anNef/tPLrXTXa9R
 M8IbP6a6Rby5Q==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Fri, 17 Sep 2021 23:28:44 +0200
Date: Fri, 17 Sep 2021 23:28:44 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Message-ID: <20210917212844.GZ1053080@scaer>
References: <20210911082047.2892382-1-yann.morin.1998@free.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210911082047.2892382-1-yann.morin.1998@free.fr>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH] package/kodi: fix selection of dependencies
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Thomas Ruschival <t.ruschival@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

All,

On 2021-09-11 10:20 +0200, Yann E. MORIN spake thusly:
> Commit 148e695e3756 (package/kodi: bump version to 19.0-Matrix) extended
> the set of required libraries for various "platform" backends, by
> selecting those libraries from the blind options. For example, we have:
> 
>     config BR2_PACKAGE_KODI_PLATFORM_SUPPORTS_GBM
>         bool
>         default y
>         depends on [...]
>         select BR2_PACKAGE_LIBINPUT
>         [...]
> 
> However, that option is true as soon as the requirements are met (the
> depends on), even when Kodi itself is not enabled.
> 
> This means that extra libraries are pulled in to the build, even when
> not required.
> 
> We fix that by moving the actual selects to the main symbol, along with
> the proper conditions. This means that we have two lines that select
> libxbcommon, under two different conditions; we could make that a single
> select, but the codition would need to be on two lines anyway, so meh...
> 
> This is not an ideal solution, because it is a bit ugly, but:
>  1) adding three new blind options just for the select is kinda extreme
>     and superfluous;
>  2) our Kodi packaging is already a bit ugly anyway.
> 
> Fixes: #14206
> 
> Reported-by: Thomas Ruschival <t.ruschival@gmail.com>
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: Bernd Kuhls <bernd.kuhls@t-online.de>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/kodi/Config.in | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/package/kodi/Config.in b/package/kodi/Config.in
> index 074a457d1b..af7604428e 100644
> --- a/package/kodi/Config.in
> +++ b/package/kodi/Config.in
> @@ -25,8 +25,6 @@ config BR2_PACKAGE_KODI_PLATFORM_SUPPORTS_GBM
>  	depends on BR2_PACKAGE_MESA3D_GBM
>  	depends on BR2_PACKAGE_HAS_UDEV # libinput
>  	select BR2_PACKAGE_KODI_PLATFORM_SUPPORTS
> -	select BR2_PACKAGE_LIBINPUT
> -	select BR2_PACKAGE_LIBXKBCOMMON
>  
>  config BR2_PACKAGE_KODI_PLATFORM_SUPPORTS_WAYLAND
>  	bool
> @@ -38,8 +36,6 @@ config BR2_PACKAGE_KODI_PLATFORM_SUPPORTS_WAYLAND
>  	depends on BR2_INSTALL_LIBSTDCPP # waylandpp
>  	depends on BR2_PACKAGE_WAYLAND # waylandpp
>  	select BR2_PACKAGE_KODI_PLATFORM_SUPPORTS
> -	select BR2_PACKAGE_LIBXKBCOMMON
> -	select BR2_PACKAGE_WAYLANDPP
>  
>  config BR2_PACKAGE_KODI_PLATFORM_SUPPORTS_X11
>  	bool
> @@ -47,7 +43,6 @@ config BR2_PACKAGE_KODI_PLATFORM_SUPPORTS_X11
>  	depends on BR2_PACKAGE_HAS_LIBGL || BR2_PACKAGE_HAS_LIBGLES
>  	depends on BR2_PACKAGE_XORG7
>  	select BR2_PACKAGE_KODI_PLATFORM_SUPPORTS
> -	select BR2_PACKAGE_XLIB_LIBXRANDR
>  
>  comment "kodi needs an OpenGL EGL backend with OpenGL or GLES support"
>  	depends on !BR2_PACKAGE_KODI_PLATFORM_SUPPORTS
> @@ -102,6 +97,11 @@ menuconfig BR2_PACKAGE_KODI
>  	select BR2_PACKAGE_TINYXML
>  	select BR2_PACKAGE_ZLIB
>  	select BR2_TOOLCHAIN_GLIBC_GCONV_LIBS_COPY if BR2_TOOLCHAIN_USES_GLIBC # runtime UTF conversion support
> +	select BR2_PACKAGE_LIBINPUT if BR2_PACKAGE_KODI_PLATFORM_SUPPORTS_GBM
> +	select BR2_PACKAGE_LIBXKBCOMMON if BR2_PACKAGE_KODI_PLATFORM_SUPPORTS_GBM
> +	select BR2_PACKAGE_LIBXKBCOMMON if BR2_PACKAGE_KODI_PLATFORM_SUPPORTS_WAYLAND
> +	select BR2_PACKAGE_WAYLANDPP if BR2_PACKAGE_KODI_PLATFORM_SUPPORTS_WAYLAND
> +	select BR2_PACKAGE_XLIB_LIBXRANDR if BR2_PACKAGE_KODI_PLATFORM_SUPPORTS_X11
>  	help
>  	  Kodi is an award-winning free and open source (GPL) software
>  	  media player and entertainment hub for digital media.
> -- 
> 2.25.1
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
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
