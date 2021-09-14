Return-Path: <SRS0=SwR/=OE=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.2 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F96EC433F5
	for <buildroot@archiver.kernel.org>; Tue, 14 Sep 2021 19:52:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C1B0F61107
	for <buildroot@archiver.kernel.org>; Tue, 14 Sep 2021 19:52:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C1B0F61107
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 82BA3400A4;
	Tue, 14 Sep 2021 19:52:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9NjPT8ZQTeQg; Tue, 14 Sep 2021 19:52:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 903414010F;
	Tue, 14 Sep 2021 19:52:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3DFD01BF228
 for <buildroot@lists.busybox.net>; Tue, 14 Sep 2021 19:52:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 36D5960AE3
 for <buildroot@lists.busybox.net>; Tue, 14 Sep 2021 19:52:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id B2cXjuIW2IE3 for <buildroot@lists.busybox.net>;
 Tue, 14 Sep 2021 19:52:50 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9D10E607AB
 for <buildroot@buildroot.org>; Tue, 14 Sep 2021 19:52:50 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:31d8:df7a:786c:e8e0])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 289F719F58A;
 Tue, 14 Sep 2021 21:52:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1631649168;
 bh=7FyfCE+wLcH0edksYtJMHKQwCH9NKh79h8In7LDKDsw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=okbY6d/2S8peZ/yE7tKbu3wGI4TKzvSRU4Q2bg5TDsHqv+6bxnuWlhLhKtbVDMaM3
 GnOWxAdRFj+nbUg/jVCeXfjtjKybCg5tfO12hNeZVFUzJvqypwIj5Fs8LG6x0K3cek
 HZ5SX+BWplzjaL8S7/UPJntKbk+ffdhYgi2SPoSC4AMOenK4cQTgZNOt5LJVYDT39Q
 0f6GBskmwL5F+fio+yNRSa3/1vlYDBiucYDUK4A0ScZwsjKb1UMifoZqV3EzXP3xzv
 kTG9KA3a5n9Zu3DSg4HkVCyMwqfk9JDvYgJgUhiHFXIzuMMzBS8iXUJBefLvJ7o3ZT
 +4h/nZT3wkIAw==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 14 Sep 2021 21:52:41 +0200
Date: Tue, 14 Sep 2021 21:52:41 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20210914195241.GQ1053080@scaer>
References: <20210914161731.45958-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210914161731.45958-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/2] package/x11r7/xapp_xeyes: xrender is
 optional, not mandatory
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Fabrice, All,

On 2021-09-14 18:17 +0200, Fabrice Fontaine spake thusly:
> xrender is optional, not mandatory since its addition in version 1.0.99:
> https://gitlab.freedesktop.org/xorg/app/xeyes/-/commit/5e825a140f4022b88dd7a1a20a9a01b653f1a95c
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/x11r7/xapp_xeyes/Config.in     | 1 -
>  package/x11r7/xapp_xeyes/xapp_xeyes.mk | 9 ++++++++-
>  2 files changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/package/x11r7/xapp_xeyes/Config.in b/package/x11r7/xapp_xeyes/Config.in
> index 5cf7f6c052..a7b77375fd 100644
> --- a/package/x11r7/xapp_xeyes/Config.in
> +++ b/package/x11r7/xapp_xeyes/Config.in
> @@ -3,7 +3,6 @@ config BR2_PACKAGE_XAPP_XEYES
>  	select BR2_PACKAGE_XLIB_LIBX11
>  	select BR2_PACKAGE_XLIB_LIBXEXT
>  	select BR2_PACKAGE_XLIB_LIBXMU
> -	select BR2_PACKAGE_XLIB_LIBXRENDER
>  	select BR2_PACKAGE_XLIB_LIBXT
>  	help
>  	  X.Org xeyes application
> diff --git a/package/x11r7/xapp_xeyes/xapp_xeyes.mk b/package/x11r7/xapp_xeyes/xapp_xeyes.mk
> index 11eea802d5..a127e28ea7 100644
> --- a/package/x11r7/xapp_xeyes/xapp_xeyes.mk
> +++ b/package/x11r7/xapp_xeyes/xapp_xeyes.mk
> @@ -9,6 +9,13 @@ XAPP_XEYES_SOURCE = xeyes-$(XAPP_XEYES_VERSION).tar.bz2
>  XAPP_XEYES_SITE = https://xorg.freedesktop.org/archive/individual/app
>  XAPP_XEYES_LICENSE = MIT
>  XAPP_XEYES_LICENSE_FILES = COPYING
> -XAPP_XEYES_DEPENDENCIES = xlib_libX11 xlib_libXext xlib_libXmu xlib_libXrender xlib_libXt
> +XAPP_XEYES_DEPENDENCIES = xlib_libX11 xlib_libXext xlib_libXmu xlib_libXt
> +
> +ifeq ($(BR2_PACKAGE_XLIB_LIBXRENDER),y)
> +XAPP_XEYES_DEPENDENCIES += xlib_libXrender
> +XAPP_XEYES_CONF_OPTS += --with-xrender
> +else
> +XAPP_XEYES_CONF_OPTS += --without-xrender
> +endif
>  
>  $(eval $(autotools-package))
> -- 
> 2.33.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@lists.buildroot.org
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
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
