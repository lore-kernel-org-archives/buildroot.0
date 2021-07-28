Return-Path: <SRS0=nMnf=MU=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A6EFC4338F
	for <buildroot@archiver.kernel.org>; Wed, 28 Jul 2021 10:22:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BEC5D60524
	for <buildroot@archiver.kernel.org>; Wed, 28 Jul 2021 10:22:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BEC5D60524
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=aleksander.es
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8955B6089A;
	Wed, 28 Jul 2021 10:22:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3inUrHfDmGB5; Wed, 28 Jul 2021 10:22:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C165660848;
	Wed, 28 Jul 2021 10:21:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 77E8C1BF385
 for <buildroot@lists.busybox.net>; Wed, 28 Jul 2021 10:21:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 62E1F82AB6
 for <buildroot@lists.busybox.net>; Wed, 28 Jul 2021 10:21:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aleksander-es.20150623.gappssmtp.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id py9BbTtie7ge for <buildroot@lists.busybox.net>;
 Wed, 28 Jul 2021 10:21:56 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com
 [IPv6:2607:f8b0:4864:20::22c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AF2F782A3B
 for <buildroot@buildroot.org>; Wed, 28 Jul 2021 10:21:55 +0000 (UTC)
Received: by mail-oi1-x22c.google.com with SMTP id o185so3073701oih.13
 for <buildroot@buildroot.org>; Wed, 28 Jul 2021 03:21:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aleksander-es.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9KOAsLWhUGhvOV1sYP6ocmaHY30csV8d267jj1vQuyg=;
 b=1AlwTF8Q/2sDFPFEt5F4aCDu5lLDSHb4N2VgskhebGNDD6HqN0oc2qxW4QJ4+DYl8H
 imoTnfgxKeImVd5AgxclaRe0QhDC54PJnLhFDk5XGDPhxS7SbHff0SVnNS8ah3sPtHcw
 y24I24kauLo5uNQd4kI4BNVSGbbn5wmSifyTySS/8DI4HkawuVsiac/ncjTOTOd6NTQX
 OS2Z5jH1NP35Ak1L87FomjCWAce/e38dFvrCs/rz/OcjRjH1F5SJqC8RB44ptbAnLATW
 f/uILgpkNQwphoHarb30Msdexc1BmfTumfDSyu0H2dJF1tgC5FAOnC14IX1zQdwpV/Z+
 nZJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9KOAsLWhUGhvOV1sYP6ocmaHY30csV8d267jj1vQuyg=;
 b=WkjeCAIM0n9QB/XKkrI3BUEhaYY9eLlLfUL5ti1sZKSCLD1oMMYSA4MQgojiU6gTx6
 79ZqwxSC0GWlYONvxV2ZUXXgEwqUuC6/cyC6ndl8QR0Kh1NoS3/d16sK7KuMcV6bvuhY
 gYWmbOqikQKaub9PTDI7xv4pQZtUjYF3SPrnNP2YDKwvRBBh2s7rNr3xuot7UHLqx3Im
 6Ri3oMAseC3+s+Rmwe8ZNIiWakn4njU0oP1hYK0DRZ2kwjHTRFO1RF6jHmTXXUmZRrz2
 cgLA3nvz0oOQSOnUIus3+N2as0bmRJjeCYy4QDCPmpWa/uOEppqkKNgPgSD4rZ0gsAg3
 LOvA==
X-Gm-Message-State: AOAM533ycgaf2WtHKH8nvZUlmH69MHNKYi2IvrEjKD0C6APPzC+IN17v
 A8ArH/6UY+KfSOSbYnbhujLSn70I/Y+IcIFHK78lUg==
X-Google-Smtp-Source: ABdhPJzBUtyhQ8MT9K8/TQeD3imdWimAYcV+zeIjgJGkp0NKHgZUOB8o15VLkRAx9ZoLW/pCJRRTvLjxTNmyZFNbkK0=
X-Received: by 2002:aca:3094:: with SMTP id w142mr16395152oiw.37.1627467714757; 
 Wed, 28 Jul 2021 03:21:54 -0700 (PDT)
MIME-Version: 1.0
References: <20210728074550.523-1-yegorslists@googlemail.com>
In-Reply-To: <20210728074550.523-1-yegorslists@googlemail.com>
From: Aleksander Morgado <aleksander@aleksander.es>
Date: Wed, 28 Jul 2021 12:21:43 +0200
Message-ID: <CAAP7ucLeemwbbRyYvsA4Xi0WGBWw0Qvg0K06ndrr8UkZiWAmZw@mail.gmail.com>
To: Yegor Yefremov <yegorslists@googlemail.com>
Subject: Re: [Buildroot] [PATCH] package/libmbim: bump to version 1.26.0
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

On Wed, Jul 28, 2021 at 9:45 AM <yegorslists@googlemail.com> wrote:
>
> From: Yegor Yefremov <yegorslists@googlemail.com>
>
> This release introduces meson build system support that fixes
> gobject-intorspection issue with autotools.
>
> As meson files are only available in git, switch the location to
> https://gitlab.freedesktop.org.
>
> Since 1.26.0 libgudev is not required anymore so drop this dependency.
>
> Add support for bash-completion.
>
> Fixes:
> http://autobuild.buildroot.net/results/f8a81aad0e262a567a2b31712575472ae92e5518
>
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>

Acked-by: Aleksander Morgado <aleksander@aleksander.es>

> ---
>  package/libmbim/libmbim.hash |  2 +-
>  package/libmbim/libmbim.mk   | 23 ++++++++++++++---------
>  2 files changed, 15 insertions(+), 10 deletions(-)
>
> diff --git a/package/libmbim/libmbim.hash b/package/libmbim/libmbim.hash
> index 2779be1e96..07cfd69163 100644
> --- a/package/libmbim/libmbim.hash
> +++ b/package/libmbim/libmbim.hash
> @@ -1,4 +1,4 @@
>  # Locally computed
> -sha256  02590736163fff10e5732191fccc1b9920969616ddc59613a003052a116a3c25  libmbim-1.24.8.tar.xz
> +sha256  63b53db0196dadea673f04524b0683ce40282f25bfd513d398e2a10b992cac01  libmbim-1.26.0.tar.gz
>  sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
>  sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LIB
> diff --git a/package/libmbim/libmbim.mk b/package/libmbim/libmbim.mk
> index b343dec238..cdc3fabedb 100644
> --- a/package/libmbim/libmbim.mk
> +++ b/package/libmbim/libmbim.mk
> @@ -4,9 +4,8 @@
>  #
>  ################################################################################
>
> -LIBMBIM_VERSION = 1.24.8
> -LIBMBIM_SITE = https://www.freedesktop.org/software/libmbim
> -LIBMBIM_SOURCE = libmbim-$(LIBMBIM_VERSION).tar.xz
> +LIBMBIM_VERSION = 1.26.0
> +LIBMBIM_SITE = https://gitlab.freedesktop.org/mobile-broadband/libmbim/-/archive/$(LIBMBIM_VERSION)
>  LIBMBIM_LICENSE = LGPL-2.0+ (library), GPL-2.0+ (programs)
>  LIBMBIM_LICENSE_FILES = COPYING COPYING.LIB
>  LIBMBIM_CPE_ID_VENDOR = freedesktop
> @@ -14,12 +13,18 @@ LIBMBIM_INSTALL_STAGING = YES
>
>  LIBMBIM_DEPENDENCIES = libglib2
>
> -# if libgudev available, request udev support
> -ifeq ($(BR2_PACKAGE_LIBGUDEV),y)
> -LIBMBIM_DEPENDENCIES += libgudev
> -LIBMBIM_CONF_OPTS += --with-udev
> +ifeq ($(BR2_PACKAGE_GOBJECT_INTROSPECTION),y)
> +LIBMBIM_DEPENDENCIES += gobject-introspection
> +LIBMBIM_CONF_OPTS += -Dintrospection=true
>  else
> -LIBMBIM_CONF_OPTS += --without-udev
> +LIBMBIM_CONF_OPTS += -Dintrospection=false
>  endif
>
> -$(eval $(autotools-package))
> +ifeq ($(BR2_PACKAGE_BASH_COMPLETION),y)
> +LIBMBIM_DEPENDENCIES += bash-completion
> +LIBMBIM_CONF_OPTS += -Dbash_completion=true
> +else
> +LIBMBIM_CONF_OPTS += -Dbash_completion=false
> +endif
> +
> +$(eval $(meson-package))
> --
> 2.17.0
>


-- 
Aleksander
https://aleksander.es
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
