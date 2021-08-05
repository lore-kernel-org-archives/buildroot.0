Return-Path: <SRS0=evmZ=M4=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C67D4C4338F
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 19:18:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5AB0C60BD3
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 19:18:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5AB0C60BD3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 145AF605AE;
	Thu,  5 Aug 2021 19:18:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IzNuJCTxTWBN; Thu,  5 Aug 2021 19:18:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 92F5960678;
	Thu,  5 Aug 2021 19:18:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 409D31BF361
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 19:18:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 356A283B64
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 19:18:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yCw8WEGWT6-U for <buildroot@lists.busybox.net>;
 Thu,  5 Aug 2021 19:18:41 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6708783B33
 for <buildroot@buildroot.org>; Thu,  5 Aug 2021 19:18:41 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id u3so11350746ejz.1
 for <buildroot@buildroot.org>; Thu, 05 Aug 2021 12:18:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=+guIEztYE993jl57YzHz7t3MWf5mxkwXzA76USk1f/Y=;
 b=QFsP93OpYi69MTskWjunBneblBaRzKniwa/HSLA3oM9PO5plA40ppW/z6svhgkB5rH
 2NIPlmeE3YOwuwsCvdoFEays51bFoVShVAJtlbHP+xMeF/jsm9zR/rLOSXFoexYMxt1q
 E6tyejwaYsLHwRHpf02Gs8CUtCMFic6t41B+0RhBIACfO3i+S7upNF6v3vcu47a4dkW3
 /vgKUB9QSotAV8H9fg7LLnqjTqH/NIllGhpeGVRYRLdFtAsBmThpyGMYmHpTa22BaZGq
 WenlRNnbwcoAsXxokzHnnG0WwwA0zZA1GDKb1A1WTpfkQaPwUstjtOUYTCbYV5gKcGL8
 r4WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=+guIEztYE993jl57YzHz7t3MWf5mxkwXzA76USk1f/Y=;
 b=fyx3p3rFvRtJDfq5+IlbEimShzG1bBCF7gmXdPyLoLiqA8u8hYfBz1sYhJAzhEyxwr
 zX+1h67wKcR5zJVcwTDXAXGhp+6hLfEnX3eVRxRo3v3cfq0RqJdHIA9aBDqZ7v8ZSqNM
 5/VD8dB3TSaMTE5W1PXcVlygucmD428SovdnI7N69iV6h+DBnhgF5zzvXhtYzivKi9KD
 ru01LWQn10zDCCjEVSgIG478l4uApN9bLO6cJrhMBHdStDqbGkKKfXTl4PyMFreGK7eH
 7+UrNMC8GuIaHsnOfQEkbo5qVcjwD0kRGjXKYkUSDwMtGrduUhkTGRVtw/w4V5I4tgfV
 L3Aw==
X-Gm-Message-State: AOAM532W/MGN90Inc/pdcKRKYf8Y6Kb+7pZAaI7B1oQl3a0G+6wQzubh
 OFY/+IGxgEsz33iLU0RHvh/+DjIHy5MLSL3nVuY=
X-Google-Smtp-Source: ABdhPJwtWBpoktXnlHnB6Eb7e/Bg07+55gggIYY2D6HxMjZFLQ6qKcqIlhifB24jF3zq1yAn+Wh0BQ==
X-Received: by 2002:a17:906:8281:: with SMTP id
 h1mr6568616ejx.352.1628191119566; 
 Thu, 05 Aug 2021 12:18:39 -0700 (PDT)
Received: from ?IPv6:2001:1c01:3101:8300:5100:9bb9:68ea:c9f3?
 (2001-1c01-3101-8300-5100-9bb9-68ea-c9f3.cable.dynamic.v6.ziggo.nl.
 [2001:1c01:3101:8300:5100:9bb9:68ea:c9f3])
 by smtp.gmail.com with ESMTPSA id lv9sm2017300ejb.124.2021.08.05.12.18.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Aug 2021 12:18:39 -0700 (PDT)
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20210805112123.2111703-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
Message-ID: <af502aaf-a41f-c973-1684-12f769a23322@mind.be>
Date: Thu, 5 Aug 2021 21:18:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210805112123.2111703-1-fontaine.fabrice@gmail.com>
Content-Language: en-GB
Subject: Re: [Buildroot] [PATCH 1/1] package/x11r7/xlib_libxshmfence:
 disable on riscv32
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>



On 05/08/2021 13:21, Fabrice Fontaine wrote:
> xlib_libxshmfence unconditionally uses SYS_futex which raises the
> following build failure on riscv32:
> 
> xshmfence_futex.h:58:17: error: 'SYS_futex' undeclared (first use in this function); did you mean 'sys_futex'?
>    58 |  return syscall(SYS_futex, addr1, op, val1, timeout, addr2, val3);
>       |                 ^~~~~~~~~
>       |                 sys_futex

 The proper way is to add support for futex64, but:

- that's a bit complicated so better for upstream to do;
- Linux on RISCV32 doesn't have much of a future, except on FPGAs which aren't
very likely to run X;
- X itself doesn't have much of a future either;
- we're in the stabilization period so risky patches are to be avoided.

 Therefore, applied to master, thanks.

> 
> Fixes:
>  - http://autobuild.buildroot.org/results/b3523e35fde0fac04b96a6278cbc6ffdfe56f7d1
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/mesa3d/Config.in                    | 3 ++-
>  package/x11r7/xlib_libxshmfence/Config.in   | 1 +
>  package/x11r7/xserver_xorg-server/Config.in | 3 ++-
>  3 files changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
> index 41c90c49af..eb7c1eef46 100644
> --- a/package/mesa3d/Config.in
> +++ b/package/mesa3d/Config.in
> @@ -65,7 +65,8 @@ config BR2_PACKAGE_MESA3D_DRI_DRIVER
>  		!BR2_PACKAGE_MESA3D_OPENGL_GLX && \
>  		!BR2_PACKAGE_MESA3D_OPENGL_EGL
>  	select BR2_PACKAGE_XLIB_LIBXSHMFENCE if \
> -		(BR2_PACKAGE_XORG7 && BR2_TOOLCHAIN_HAS_SYNC_4)
> +		(BR2_PACKAGE_XORG7 && BR2_TOOLCHAIN_HAS_SYNC_4 && \
> +			!BR2_RISCV_32)
>  
>  config BR2_PACKAGE_MESA3D_VULKAN_DRIVER
>  	bool
> diff --git a/package/x11r7/xlib_libxshmfence/Config.in b/package/x11r7/xlib_libxshmfence/Config.in
> index 710476b357..55cd91d1e4 100644
> --- a/package/x11r7/xlib_libxshmfence/Config.in
> +++ b/package/x11r7/xlib_libxshmfence/Config.in
> @@ -1,5 +1,6 @@
>  config BR2_PACKAGE_XLIB_LIBXSHMFENCE
>  	bool "libxshmfence"
> +	depends on !BR2_RISCV_32

 I added a comment to make it explicit that it can be removed when upstream adds
support for futex64.

 Regards,
 Arnout

>  	depends on BR2_TOOLCHAIN_HAS_SYNC_4
>  	select BR2_PACKAGE_XORGPROTO
>  	help
> diff --git a/package/x11r7/xserver_xorg-server/Config.in b/package/x11r7/xserver_xorg-server/Config.in
> index fcd3d0ae00..4dc15435a8 100644
> --- a/package/x11r7/xserver_xorg-server/Config.in
> +++ b/package/x11r7/xserver_xorg-server/Config.in
> @@ -53,7 +53,8 @@ config BR2_PACKAGE_XSERVER_XORG_SERVER_MODULAR
>  	depends on BR2_INSTALL_LIBSTDCPP
>  	select BR2_PACKAGE_LIBDRM
>  	select BR2_PACKAGE_LIBPCIACCESS
> -	select BR2_PACKAGE_XLIB_LIBXSHMFENCE if BR2_TOOLCHAIN_HAS_SYNC_4
> +	select BR2_PACKAGE_XLIB_LIBXSHMFENCE if \
> +		(BR2_TOOLCHAIN_HAS_SYNC_4 && !BR2_RISCV_32)
>  	help
>  	  This variant of the X.org server is the full-blown variant,
>  	  as used by desktop GNU/Linux distributions. The drivers (for
> 
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
