Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C71F7C55167
	for <buildroot@archiver.kernel.org>; Fri, 31 Jul 2026 08:51:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 49F1380F29;
	Fri, 31 Jul 2026 08:51:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2Ws_Bb0NtV8O; Fri, 31 Jul 2026 08:51:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5A60B80F35
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785487864;
	bh=W6mmgW8QPc4B5R0EW05vkWK/xlFf4YmRaM2l//8zGSE=;
	h=In-Reply-To:References:Date:To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=IW5WxF17ieYwIKwtSnUOg523KCj95n4b+66u1LLY9jBEv42QHwsscea910fiElm3b
	 5yGsC/t1eas2o4XBE0g0pdbtL6a5VfKZZoPUvlRHueKahK48yw1Hq7XfYSJcDjAua/
	 o2RUbf/QzL6wgKzjRZWvfnSqpoRtv+4HfG1ulRQe8NtsDl8Pwu+S7yUx4pB5eI8oYs
	 /xSytQGo0b806ibeTaHZX5kxSzsWSFDs1J6LXPtFncpk6uDjCoiEw468JCBibgH7k9
	 3IvhN8CAqR0OaazNpEqkpKnuvfZk+13HWFH8Ub3ajYdi9bqrADWXH6ADMK2K1UJY8Y
	 sTzTNWWCxMypw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5A60B80F35;
	Fri, 31 Jul 2026 08:51:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id B42FB218
 for <buildroot@buildroot.org>; Fri, 31 Jul 2026 08:51:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 99F1480F35
 for <buildroot@buildroot.org>; Fri, 31 Jul 2026 08:51:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GzNcbCeVfCqE for <buildroot@buildroot.org>;
 Fri, 31 Jul 2026 08:51:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=195.201.24.99;
 helo=mail.heine.tech; envelope-from=buildroot@heine.tech; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org DB00180F29
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DB00180F29
Received: from mail.heine.tech (mail.heine.tech [195.201.24.99])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DB00180F29
 for <buildroot@buildroot.org>; Fri, 31 Jul 2026 08:51:00 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPA id 3E0E01814BD; Fri, 31 Jul 2026 10:50:55 +0200 (CEST)
In-Reply-To: <20260730143130.18903-1-mcdev@playlinux.net>
References: <20260730143130.18903-1-mcdev@playlinux.net>
Date: Fri, 31 Jul 2026 10:50:55 +0200
To: "Michele Comignano" <mcdev@playlinux.net>
MIME-Version: 1.0
Message-ID: <6fa3550b-1f68-0505-524c-22e7c71bcd12@heine.tech>
User-Agent: SOGoMail 5.12.9
X-Last-TLS-Session-Version: None
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=heine.tech; s=dkim; 
 t=1785487858; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=zvdG0Wz1/R3EOJNmJkNX0Hg4ohQl9T26MW75QBnWbwM=;
 b=eOQs/s2/NTaOBD6pNkpEo0Xx3D/1LHJeN9R60UvMkfHv1w1Xfgx1N3eEnPEzS/jZE+tq6H
 MaNXsAWneSeXFKnNCDX8cJJbrfnMMk8jbNiF12QFhMMVKMFQcswEQ9/PlCnMrwozM+GKYg
 bW9VYAhfbDQMyi1rt/yOGTkzbFbFu8Y=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=heine.tech
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=heine.tech header.i=@heine.tech header.a=rsa-sha256
 header.s=dkim header.b=eOQs/s2/
Subject: Re: [Buildroot] 
 =?utf-8?q?=5BPATCH_1/1=5D_package/libgpiod2=3A_bump_?=
 =?utf-8?q?version_to_2=2E3=2E1?=
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Michael Nosthoff via buildroot <buildroot@buildroot.org>
Reply-To: Michael Nosthoff <buildroot@heine.tech>
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Boerge Struempfel <boerge.struempfel@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Michele,

I already submitted a patch for the version bump.
See https://patchwork.ozlabs.org/project/buildroot/patch/20260722094344.153516-1-buildroot@heine.tech/

Would be great if you could review!

Regards,
Michael

On Thursday, July 30, 2026 16:31 CEST, Michele Comignano <mcdev@playlinux.net> wrote:

> changing build system from autotools to meson+ninja as for upstream
> no breaking changes, still depends on kernel 5.1.
> 
> Signed-off-by: Michele Comignano <mcdev@playlinux.net>
> ---
>  package/libgpiod2/libgpiod2.hash |  2 +-
>  package/libgpiod2/libgpiod2.mk   | 23 ++++++++++++-----------
>  2 files changed, 13 insertions(+), 12 deletions(-)
> 
> diff --git a/package/libgpiod2/libgpiod2.hash b/package/libgpiod2/libgpiod2.hash
> index a12752261a..48f7c77855 100644
> --- a/package/libgpiod2/libgpiod2.hash
> +++ b/package/libgpiod2/libgpiod2.hash
> @@ -1,4 +1,4 @@
>  # From https://www.kernel.org/pub/software/libs/libgpiod/sha256sums.asc
> -sha256  13207176b0eb9b3e0f02552d5f49f5a6a449343ce47416158bb484d9d3019592  libgpiod-2.2.4.tar.xz
> +sha256  e3a358a90a9204ff16f92b6f4028ed91460b1926f10589eb54b3566484650a30  libgpiod-2.3.1.tar.xz
>  # Hash for license file
>  sha256  f646ad5159efb51c1130a4b43c31f0759750b1e254d2acf510f368ee2e2085c3  COPYING
> diff --git a/package/libgpiod2/libgpiod2.mk b/package/libgpiod2/libgpiod2.mk
> index d83fdbd94a..6c851e6dd3 100644
> --- a/package/libgpiod2/libgpiod2.mk
> +++ b/package/libgpiod2/libgpiod2.mk
> @@ -6,35 +6,36 @@
>  
>  # Be careful when bumping versions.
>  # Dependency on kernel header versions may change.
> -LIBGPIOD2_VERSION = 2.2.4
> +LIBGPIOD2_VERSION = 2.3.1
>  LIBGPIOD2_SOURCE = libgpiod-$(LIBGPIOD2_VERSION).tar.xz
>  LIBGPIOD2_SITE = https://www.kernel.org/pub/software/libs/libgpiod
>  LIBGPIOD2_LICENSE = LGPL-2.1+
>  LIBGPIOD2_LICENSE_FILES = COPYING
>  LIBGPIOD2_INSTALL_STAGING = YES
>  LIBGPIOD2_DEPENDENCIES = host-pkgconf
> +# v2.3.x switched from autotools to meson
>  LIBGPIOD2_CONF_OPTS = \
> -	--disable-bindings-python \
> -	--disable-examples \
> -	--disable-tests
> +	-Dbindings-python=disabled \
> +	-Dexamples=disabled \
> +	-Dtests=disabled
>  
>  ifeq ($(BR2_PACKAGE_LIBGPIOD2_TOOLS),y)
> -LIBGPIOD2_CONF_OPTS += --enable-tools
> +LIBGPIOD2_CONF_OPTS += -Dtools=enabled
>  else
> -LIBGPIOD2_CONF_OPTS += --disable-tools
> +LIBGPIOD2_CONF_OPTS += -Dtools=disabled
>  endif
>  
>  ifeq ($(BR2_PACKAGE_LIBEDIT),y)
>  LIBGPIOD2_DEPENDENCIES += libedit
> -LIBGPIOD2_CONF_OPTS += --enable-gpioset-interactive
> +LIBGPIOD2_CONF_OPTS += -Dgpioset-interactive=enabled
>  else
> -LIBGPIOD2_CONF_OPTS += --disable-gpioset-interactive
> +LIBGPIOD2_CONF_OPTS += -Dgpioset-interactive=disabled
>  endif
>  
>  ifeq ($(BR2_INSTALL_LIBSTDCPP),y)
> -LIBGPIOD2_CONF_OPTS += --enable-bindings-cxx
> +LIBGPIOD2_CONF_OPTS += -Dbindings-cxx=enabled
>  else
> -LIBGPIOD2_CONF_OPTS += --disable-bindings-cxx
> +LIBGPIOD2_CONF_OPTS += -Dbindings-cxx=disabled
>  endif
>  
> -$(eval $(autotools-package))
> +$(eval $(meson-package))
> -- 
> 2.55.0
>

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
