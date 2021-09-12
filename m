Return-Path: <SRS0=7Pu+=OC=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2A1AC433EF
	for <buildroot@archiver.kernel.org>; Sun, 12 Sep 2021 12:07:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3BE2E610A6
	for <buildroot@archiver.kernel.org>; Sun, 12 Sep 2021 12:07:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3BE2E610A6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 04F454052F;
	Sun, 12 Sep 2021 12:07:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PCDMz_v1rpZV; Sun, 12 Sep 2021 12:07:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8C8EB4056D;
	Sun, 12 Sep 2021 12:07:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DACD31BF47A
 for <buildroot@lists.busybox.net>; Sun, 12 Sep 2021 12:07:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CA2518271D
 for <buildroot@lists.busybox.net>; Sun, 12 Sep 2021 12:07:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EqSoHCsFyxn9 for <buildroot@lists.busybox.net>;
 Sun, 12 Sep 2021 12:07:29 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1923B81CE1
 for <buildroot@buildroot.org>; Sun, 12 Sep 2021 12:07:28 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:bc3c:8ee4:eb9c:c13b])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id 8AFFD200407;
 Sun, 12 Sep 2021 14:07:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1631448447;
 bh=p8l4jXVN8LgpaPfegY/v4a4V973IGIAqt1BffhlkoJk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=sP+WzrCxQ1fDd7hzwywvkO05XU/+w6wVm1BgapCyDM5cp3it2u+MUCqIWTSPlf+jc
 Rcpomkd2O4Y6McO1rSSYyWzzBXMTM/sE1Gci3wxhYPG0OeF0GJ1a4A3TlojyqWTn/A
 KP+0Dcm7Y4X4OYQkglbX9NeXHAlffW3prouBx+7K7m/HZ7BYAxGThpuDFE3NykGCA/
 p7Rc8rwHCx170Ihd29hknnXlOaK/PS5DGS7or8nhG8vuE0NZ5ZFWD/NQ0sN1UTNgtJ
 3vyPVoTnu6svkzcX1c+58nrOaGRoFc3qD4mC7Gfc/XdT1Ez9yrisJ+jJyYP5zNX0xg
 wbIFGXl7K/YWA==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 12 Sep 2021 14:07:23 +0200
Date: Sun, 12 Sep 2021 14:07:23 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20210912120723.GH1053080@scaer>
References: <20210910003725.3926456-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210910003725.3926456-1-james.hilliard1@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/pipewire: add option to build
 examples
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

James, All,

On 2021-09-09 18:37 -0600, James Hilliard spake thusly:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/pipewire/Config.in   | 5 +++++
>  package/pipewire/pipewire.mk | 7 ++++++-
>  2 files changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/package/pipewire/Config.in b/package/pipewire/Config.in
> index 6c61dd2021..b15bbfa8d3 100644
> --- a/package/pipewire/Config.in
> +++ b/package/pipewire/Config.in
> @@ -14,6 +14,11 @@ config BR2_PACKAGE_PIPEWIRE
>  
>  if BR2_PACKAGE_PIPEWIRE
>  
> +config BR2_PACKAGE_PIPEWIRE_EXAMPLES
> +	bool "pipewire examples"
> +	help
> +	  Build pipewire examples
> +
>  config BR2_PACKAGE_PIPEWIRE_GSTREAMER
>  	bool "pipewire gstreamer plugins"
>  	depends on BR2_USE_WCHAR # libglib2
> diff --git a/package/pipewire/pipewire.mk b/package/pipewire/pipewire.mk
> index 2317398088..472bb06dd7 100644
> --- a/package/pipewire/pipewire.mk
> +++ b/package/pipewire/pipewire.mk
> @@ -13,7 +13,6 @@ PIPEWIRE_DEPENDENCIES = host-pkgconf dbus $(TARGET_NLS_DEPENDENCIES)
>  
>  PIPEWIRE_CONF_OPTS += \
>  	-Ddocs=disabled \
> -	-Dexamples=disabled \
>  	-Dman=disabled \
>  	-Dtests=disabled \
>  	-Dspa-plugins=enabled \
> @@ -35,6 +34,12 @@ else
>  PIPEWIRE_CONF_OPTS += -Dudev=disabled
>  endif
>  
> +ifeq ($(BR2_PACKAGE_PIPEWIRE_EXAMPLES),y)
> +PIPEWIRE_CONF_OPTS += -Dexamples=enabled
> +else
> +PIPEWIRE_CONF_OPTS += -Dexamples=disabled
> +endif
> +
>  ifeq ($(BR2_PACKAGE_PIPEWIRE_GSTREAMER),y)
>  PIPEWIRE_CONF_OPTS += -Dgstreamer=enabled
>  PIPEWIRE_DEPENDENCIES += libglib2 gstreamer1 gst1-plugins-base
> -- 
> 2.25.1
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
